<!-- Display warnings if any exist -->
{if $warnings}
  {include file="$template/includes/alert.tpl" type="warning" message=$warnings}
{/if}

{* Page header with title and tagline for contact management *}
{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareadomains'}" tagline="{lang key='clientareadomainstagline'}"}

<div class="tab-content">
  <div class="tab-pane fade show active" id="tabOverview">
    <!-- Include table list component with disabled sorting on first two columns, starting order on column 2, filtering on column 5 -->
    {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 1" startOrderCol="2" filterColumn="5"}

    <!-- JavaScript for DataTable initialization and sorting -->
    <script>
      jQuery(document).ready(function() {
        // Initialize DataTable and show the hidden table
        var table = jQuery('#tableDomainsList').show().DataTable();

        // Apply sorting based on URL parameters
        {if $orderby == 'domain'}
          table.order(2, '{$sort}');  // Sort by domain name column
        {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
          table.order(3, '{$sort}');  // Sort by registration date column
        {elseif $orderby == 'nextduedate'}
          table.order(4, '{$sort}');  // Sort by next due date column
        {elseif $orderby == 'autorenew'}
          table.order(5, '{$sort}');  // Sort by auto-renew status column
        {elseif $orderby == 'status'}
          table.order(6, '{$sort}');  // Sort by status column
        {/if}

        // Redraw table with applied sorting
        table.draw();

        // Hide loading indicator
        jQuery('#tableLoading').hide();
      });
    </script>

    <!-- Bulk actions form wrapper -->
    <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
      <!-- Hidden input for bulk action type -->
      <input id="bulkaction" name="update" type="hidden" />

      {* btn-group *}
      <!-- Bulk action buttons group -->
      <div class="d-lg-block d-none">
        <div class="btn-group btn-group-sm mb-4" role="group">
          {* button *}
          <!-- Nameservers management button -->
          <button type="button" class="btn btn-secondary setBulkAction" id="nameservers">
            <!-- Globe icon -->
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
              <circle cx="12" cy="12" r="10" />
              <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
              <path d="M2 12h20" />
            </svg>
            {lang key='domainmanagens'}
          </button>

          {* button *}
          <!-- Contact information edit button -->
          <button type="button" class="btn btn-secondary setBulkAction" id="contactinfo">
            <!-- User circle icon -->
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-user-round-icon lucide-circle-user-round">
              <path d="M18 20a6 6 0 0 0-12 0" />
              <circle cx="12" cy="10" r="4" />
              <circle cx="12" cy="12" r="10" />
            </svg>
            {lang key='domaincontactinfoedit'}
          </button>

          {* button *}
          <!-- Mass renew button (only shows if renewals are allowed) -->
          {if $allowrenew}
            <button type="button" class="btn btn-secondary setBulkAction" id="renewDomains">
              <!-- Refresh icon -->
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-cw-icon lucide-refresh-cw">
                <path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8" />
                <path d="M21 3v5h-5" />
                <path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16" />
                <path d="M8 16H3v5" />
              </svg>
              {lang key='domainmassrenew'}
            </button>
          {/if}

          {* dropdown *}
          <!-- Additional actions dropdown -->
          <div class="btn-group btn-group-sm" role="group">
            <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              {lang key="more"}...
            </button>
            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
              <!-- Auto-renew status management -->
              <a class="dropdown-item setBulkAction" href="#" id="autorenew">
                <!-- Refresh icon -->
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-cw-icon lucide-refresh-cw">
                  <path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8" />
                  <path d="M21 3v5h-5" />
                  <path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16" />
                  <path d="M8 16H3v5" />
                </svg>
                {lang key='domainautorenewstatus'}
              </a>
              <!-- Registration lock status management -->
              <a class="dropdown-item setBulkAction" href="#" id="reglock">
                <!-- Lock icon -->
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                  <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
                  <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                </svg>
                {lang key='domainreglockstatus'}
              </a>
            </div>
          </div>
        </div>
      </div>

      <div class="table-container clearfix">
        <!-- Domains list table (initially hidden until DataTable loads) -->
        <table id="tableDomainsList" class="table w-hidden">
          <thead class="thead">
            <tr class="table-row">
              <!-- Checkbox column header -->
              <th class="order-head"></th>
              <!-- SSL status column header -->
              <th class="order-head"></th>
              <th class="table-head">{lang key='orderdomain'}</th>
              <th class="table-head">{lang key='clientareahostingregdate'}</th>
              <th class="table-head">{lang key='clientareahostingnextduedate'}</th>
              <th class="table-head">{lang key='domainstatus'}</th>
            </tr>
          </thead>
          <tbody class="tbody">
            <!-- Loop through each domain -->
            {foreach $domains as $domain}
              <!-- Clickable table row that navigates to domain details -->
              <tr class="table-row">

                <!-- Selection checkbox for bulk actions -->
                <td class="order-cell">
                  <label class="form-check justify-content-center">
                    <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                    <input type="checkbox" name="domids[]" class="form-check-input" value="{$domain.id}" />
                    <span class="checkmark"></span>
                  </label>
                </td>

                <!-- SSL status indicator column -->
                <td class="order-cell ssl-info text-center" data-element-id="{$domain.id}" data-type="domain" data-domain="{$domain.domain}" onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                  {if $domain.sslStatus}
                    <!-- SSL status icon with tooltip -->
                    <img src="{$domain.sslStatus->getImagePath()}" width="18" title="{$domain.sslStatus->getTooltipContent()}" class="{$domain.sslStatus->getClass()} img-fluid">
                  {elseif !$domain.isActive}
                    <!-- Inactive domain SSL indicator -->
                    <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" width="18" title="{lang key='sslState.sslInactiveDomain'}" class="img-fluid">
                  {/if}
                </td>

                <!-- Domain name with auto-renew status -->
                <td class="table-cell" onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                  <!-- Domain name as external link -->
                  <a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a>
                  <br>
                  <!-- Auto-renew status indicator -->
                  <small>
                    {if $domain.autorenew}
                      <i class="fas fa-fw fa-check text-success"></i>
                      {lang key='domainsautorenew'}
                    {else}
                      <i class="fas fa-fw fa-times text-danger"></i>
                      {lang key='domainsautorenew'}
                    {/if}
                  </small>
                </td>

                <!-- Registration date with hidden normalized date for sorting -->
                <td class="table-cell" onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                  <span class="w-hidden">{$domain.normalisedRegistrationDate}</span>
                  {$domain.registrationdate}
                </td>

                <!-- Next due date with hidden normalized date for sorting -->
                <td class="table-cell" onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                  <span class="w-hidden">{$domain.normalisedNextDueDate}</span>
                  {$domain.nextduedate}
                </td>

                <!-- Domain status with expiration warning -->
                <td class="table-cell" onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                  <!-- Status label with color coding -->
                  <span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
                  <!-- Hidden expiration warning for filtering/sorting -->
                  <span class="w-hidden">
                    {if $domain.expiringSoon}<span>{lang key="domainsExpiringSoon"}</span>{/if}
                  </span>
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>

        <!-- Loading indicator (shown while DataTable initializes) -->
        <div class="text-center" id="tableLoading">
          <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
        </div>
      </div>
    </form>
  </div>
</div>