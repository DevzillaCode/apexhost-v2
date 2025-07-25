<!-- Success alert when no open network issues exist -->
{if $opencount == 0}
  <div class="alert alert-success">
    <i class="fas fa-check fa-fw"></i>
    {"{lang key='networkstatusnone'}"|sprintf:"{lang key='networkissuesstatusopen'}"}
  </div>
{/if}

<!-- Info alert when scheduled maintenance exists -->
{if $scheduledcount > 0}
  <div class="alert alert-info">
    <i class="fas fa-exclamation-triangle fa-fw"></i>
    {lang key='networkIssues.scheduled' count=$scheduledcount}
    <a href="serverstatus.php?view=scheduled" class="alert-link">{lang key='learnmore'}...</a>
  </div>
{/if}

<!-- Server status monitoring section (only shows if servers are configured) -->
{if $servers}
  <div class="card">
    <div class="card-body">
      <h3>{lang key='serverstatustitle'}</h3>
      <p>{lang key='serverstatusheadingtext'}</p>

      <!-- Responsive table container -->
      <div class="table-responsive">
        <!-- Server status monitoring table -->
        <table class="table table-striped">
          <thead>
            <tr>
              <th>{lang key='servername'}</th>
              <th class="text-center">{lang key='networkIssues.http'}</th>
              <th class="text-center">{lang key='networkIssues.ftp'}</th>
              <th class="text-center">{lang key='networkIssues.pop3'}</th>
              <th class="text-center">{lang key='serverstatusphpinfo'}</th>
              <th class="text-center">{lang key='serverstatusserverload'}</th>
              <th class="text-center">{lang key='serverstatusuptime'}</th>
            </tr>
          </thead>
          <tbody>
            <!-- Loop through each server -->
            {foreach $servers as $num => $server}
              <tr>
                <!-- Server name -->
                <td>{$server.name}</td>

                <!-- HTTP port status (port 80) - starts with loading spinner -->
                <td class="text-center" id="port80_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- FTP port status (port 21) - starts with loading spinner -->
                <td class="text-center" id="port21_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- POP3 port status (port 110) - starts with loading spinner -->
                <td class="text-center" id="port110_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- PHP info link (opens in new tab) -->
                <td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{lang key='serverstatusphpinfo'}</a></td>

                <!-- Server load - starts with loading spinner, updated via JavaScript -->
                <td class="text-center" id="load{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- Server uptime - starts with loading spinner, updated via JavaScript -->
                <td class="text-center" id="uptime{$num}">
                  <span class="fas fa-spinner fa-spin"></span>

                  <!-- JavaScript to check server ports and stats -->
                  <script>
                    jQuery(document).ready(function() {
                      checkPort({$num}, 80);   // Check HTTP port
                      checkPort({$num}, 21);   // Check FTP port
                      checkPort({$num}, 110);  // Check POP3 port
                      getStats({$num});        // Get server load and uptime
                    });
                  </script>
                </td>
              </tr>
            {foreachelse}
              <!-- Message shown when no servers are configured -->
              <tr>
                <td colspan="7">{lang key='serverstatusnoservers'}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>
{/if}

<!-- Network issues list -->
{foreach $issues as $issue}
  <div class="card">
    <!-- Issue header with title, status, and priority badge -->
    <div class="card-header">
      {$issue.title}
      ({$issue.status})

      <!-- Priority badge with color coding based on severity -->
      <span id="issuePriorityLabel" class="badge badge-{if $issue.rawPriority == 'Critical'}danger{elseif $issue.rawPriority == 'High'}warning{elseif $issue.rawPriority == 'Low'}success{else}info{/if} float-md-right">{$issue.priority}</span>
    </div>

    <div class="card-body">
      <!-- Affected services/servers information (only shows if data exists) -->
      {if $issue.server || $issue.affecting}
        <p class="h5">
          <strong>{lang key='networkissuesaffecting'} {$issue.type}</strong>
          -
          <!-- Show either server name or affected services -->
          {if $issue.type eq "{lang key='networkissuestypeserver'}"}
            {$issue.server}
          {else}
            {$issue.affecting}
          {/if}
        </p>
      {/if}

      <!-- Issue metadata (dates and last update) -->
      <ul class="list-inline">
        <li class="list-inline-item pr-3">
          <i class="far fa-calendar-alt fa-fw"></i>
          {$issue.startdate}
          {if $issue.enddate} - {$issue.enddate}{/if}
        </li>
        <li class="list-inline-item pr-3">
          <i class="far fa-clock fa-fw"></i>
          {lang key='networkissueslastupdated'}</strong> {$issue.lastupdate}
        </li>
      </ul>

      <!-- Warning alert if issue affects the current client -->
      {if $issue.clientaffected}
        <div class="alert alert-warning p-1 text-center">
          {lang key='networkIssues.affectingYou'}
        </div>
      {/if}

      <!-- Issue description -->
      <p>
        {$issue.description}
      </p>
    </div>
  </div>
{foreachelse}
  <!-- Message shown when no network issues exist -->
  <p>{$noissuesmsg}</p>
{/foreach}

<!-- Pagination navigation for network issues -->
<nav aria-label="Network issues navigation">
  <ul class="pagination">
    <!-- Previous page link -->
    <li class="pagination-item previous{if !$prevpage} disabled{/if}">
      <a class="pagination-link" href="?{if $view}view={$view}&amp;{/if}page={$prevpage}">
        <!-- Left chevron icon -->
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-left-icon lucide-chevron-left">
          <path d="m15 18-6-6 6-6"/>
        </svg>
        {lang key='previouspage'}
      </a>
    </li>

    <!-- Next page link -->
    <li class="pagination-item next{if !$nextpage} disabled{/if}">
      <a class="pagination-link" href="?{if $view}view={$view}&amp;{/if}page={$nextpage}">
        {lang key='nextpage'}
        <!-- Right chevron icon -->
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right-icon lucide-chevron-right">
          <path d="m9 18 6-6-6-6"/>
        </svg>
      </a>
    </li>
  </ul>
</nav>