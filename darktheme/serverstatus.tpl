<!-- Success alert when no open network issues exist -->
{if $opencount == 0}
  <div class="alert-container">
    <div class="alert alert-success alert-float">
      <div>
        {* alert-icon *}
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-smile-icon lucide-smile">
            <circle cx="12" cy="12" r="10" />
            <path d="M8 14s1.5 2 4 2 4-2 4-2" />
            <line x1="9" x2="9.01" y1="9" y2="9" />
            <line x1="15" x2="15.01" y1="9" y2="9" />
          </svg>
        </div>
        {* alert-content *}
        <div class="alert-content">
          {* alert-message *}
          <p class="alert-message">{"{lang key='networkstatusnone'}"|sprintf:"{lang key='networkissuesstatusopen'}"}</p>
        </div>
        {* close-alert *}
        <div class="alert-dismissible">
          <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
              <circle cx="12" cy="12" r="10" />
              <path d="m15 9-6 6" />
              <path d="m9 9 6 6" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
{/if}

<!-- Info alert when scheduled maintenance exists -->
{if $scheduledcount > 0}
  <div class="alert-container">
    <div class="alert alert-info alert-float">
      <div>
        {* alert-icon *}
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-bug-icon lucide-bug">
            <path d="m8 2 1.88 1.88" />
            <path d="M14.12 3.88 16 2" />
            <path d="M9 7.13v-1a3.003 3.003 0 1 1 6 0v1" />
            <path d="M12 20c-3.3 0-6-2.7-6-6v-3a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v3c0 3.3-2.7 6-6 6" />
            <path d="M12 20v-9" />
            <path d="M6.53 9C4.6 8.8 3 7.1 3 5" />
            <path d="M6 13H2" />
            <path d="M3 21c0-2.1 1.7-3.9 3.8-4" />
            <path d="M20.97 5c0 2.1-1.6 3.8-3.5 4" />
            <path d="M22 13h-4" />
            <path d="M17.2 17c2.1.1 3.8 1.9 3.8 4" />
          </svg>
        </div>
        {* alert-content *}
        <div class="alert-content">
          {* alert-message *}
          <p class="alert-message">
            {lang key='networkIssues.scheduled' count=$scheduledcount}
            <a href="serverstatus.php?view=scheduled" class="alert-link">{lang key='learnmore'}...</a>
          </p>
        </div>
        {* close-alert *}
        <div class="alert-dismissible">
          <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
              <circle cx="12" cy="12" r="10" />
              <path d="m15 9-6 6" />
              <path d="m9 9 6 6" />
            </svg>
          </button>
        </div>
      </div>
    </div>
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
          <thead class="thead">
            <tr class="table-row">
              <th class="table-head">{lang key='servername'}</th>
              <th class="table-head">{lang key='networkIssues.http'}</th>
              <th class="table-head">{lang key='networkIssues.ftp'}</th>
              <th class="table-head">{lang key='networkIssues.pop3'}</th>
              <th class="table-head">{lang key='serverstatusphpinfo'}</th>
              <th class="table-head">{lang key='serverstatusserverload'}</th>
              <th class="table-head">{lang key='serverstatusuptime'}</th>
            </tr>
          </thead>
          <tbody class="tbody">
            <!-- Loop through each server -->
            {foreach $servers as $num => $server}
              <tr class="table-row">
                <!-- Server name -->
                <td class="table-cell">{$server.name}</td>

                <!-- HTTP port status (port 80) - starts with loading spinner -->
                <td class="table-cell" id="port80_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- FTP port status (port 21) - starts with loading spinner -->
                <td class="table-cell" id="port21_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- POP3 port status (port 110) - starts with loading spinner -->
                <td class="table-cell" id="port110_{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- PHP info link (opens in new tab) -->
                <td class="table-cell"><a href="{$server.phpinfourl}" target="_blank">{lang key='serverstatusphpinfo'}</a></td>

                <!-- Server load - starts with loading spinner, updated via JavaScript -->
                <td class="table-cell" id="load{$num}">
                  <span class="fas fa-spinner fa-spin"></span>
                </td>

                <!-- Server uptime - starts with loading spinner, updated via JavaScript -->
                <td class="table-cell" id="uptime{$num}">
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
        <div class="alert-container">
          <div class="alert alert-warning alert-float" role="alert">
            <div>
              <!-- alert-icon -->
              <div class="alert-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-alert-triangle-icon lucide-alert-triangle">
                  <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z" />
                  <line x1="12" y1="9" x2="12" y2="13" />
                  <line x1="12" y1="17" x2="12.01" y2="17" />
                </svg>
              </div>
              <!-- alert-content -->
              <div class="alert-content">
                <!-- alert-message -->
                <p class="alert-message">{lang key='networkIssues.affectingYou'}</p>
              </div>
              <!-- close-alert -->
              <div class="alert-dismissible">
                <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
                    <circle cx="12" cy="12" r="10" />
                    <path d="m15 9-6 6" />
                    <path d="m9 9 6 6" />
                  </svg>
                </button>
              </div>
            </div>
          </div>
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
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-left-icon lucide-chevron-left rtl-rotate">
          <path d="m15 18-6-6 6-6" />
        </svg>
        {lang key='previouspage'}
      </a>
    </li>

    <!-- Next page link -->
    <li class="pagination-item next{if !$nextpage} disabled{/if}">
      <a class="pagination-link" href="?{if $view}view={$view}&amp;{/if}page={$nextpage}">
        {lang key='nextpage'}
        <!-- Right chevron icon -->
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right-icon lucide-chevron-right rtl-rotate">
          <path d="m9 18 6-6-6-6" />
        </svg>
      </a>
    </li>
  </ul>
</nav>