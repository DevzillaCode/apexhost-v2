{* Include a reusable table list template with predefined settings *}
{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="4" noSortColumns="0"}

<script>
  jQuery(document).ready(function() {
    // Initialize DataTable and show the table
    var table = jQuery('#tableServicesList').show().DataTable();

    {* Apply sorting based on the orderby parameter *}
    {if $orderby == 'product'}
      table.order([1, '{$sort}'], [4, 'asc']); // Sort by product name (column 1) and status (column 4)
    {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
      table.order(2, '{$sort}'); // Sort by pricing (column 2)
    {elseif $orderby == 'nextduedate'}
      table.order(3, '{$sort}'); // Sort by next due date (column 3)
    {elseif $orderby == 'domainstatus'}
      table.order(4, '{$sort}'); // Sort by status (column 4)
    {/if}
    table.draw(); // Redraw the table with applied sorting
    jQuery('#tableLoading').hide(); // Hide the loading spinner
  });
</script>

<div class="table-container clearfix">
  {* Main table structure - initially hidden (w-hidden) *}
  <table id="tableServicesList" class="table w-hidden">
    <thead class="thead">
      <tr class="table-row">
        <th class="order-head"></th> {* Empty header for SSL/status icons *}
        <th class="table-head">{lang key='orderproduct'}</th> {* Product/Domain column *}
        <th class="table-head">{lang key='clientareaaddonpricing'}</th> {* Pricing column *}
        <th class="table-head">{lang key='clientareahostingnextduedate'}</th> {* Due date column *}
        <th class="table-head">{lang key='clientareastatus'}</th> {* Status column *}
      </tr>
    </thead>
    <tbody class="tbody">
      {* Loop through each service to populate the table *}
      {foreach $services as $service}
        {* Clickable row that redirects to product details - uses clickableSafeRedirect for safety *}
        <tr class="table-row" onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
          {* SSL/Status icon cell *}
          <td class="order-cell {if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service" {if $service.domain} data-domain="{$service.domain}" {/if}>
            {if $service.sslStatus}
              {* Show SSL status icon with tooltip *}
              <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="img-fluid {$service.sslStatus->getClass()}" width="18">
            {elseif !$service.isActive}
              {* Show inactive icon if service is not active *}
              <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" class="img-fluid" width="18">
            {/if}
          </td>
          {* Product/Domain cell *}
          <td class="table-cell">
            <strong>{$service.product}</strong>
            {if $service.domain}
              <br /><small><a href="http://{$service.domain}" target="_blank">{$service.domain}</a></small>
            {else}
              <br />- {* Show dash if no domain *}
            {/if}
          </td>
          {* Pricing cell - uses data-order for numeric sorting *}
          <td class="table-cell" data-order="{$service.amountnum}">
            {$service.amount} <small class="text-muted">{$service.billingcycle}</small>
          </td>
          {* Next due date cell - hidden span for normalized date used in sorting *}
          <td class="table-cell">
            <span class="w-hidden">{$service.normalisedNextDueDate}</span>
            {$service.nextduedate}
          </td>
          {* Status cell - dynamic label class based on status *}
          <td class="table-cell">
            <span class="label status status-{$service.status|strtolower}">{$service.statustext}</span>
          </td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  {* Loading spinner - shown until DataTable initializes *}
  <div class="text-center" id="tableLoading">
    <p>
      <svg class="fa-spin" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-loader-icon lucide-loader">
        <path d="M12 2v4" />
        <path d="m16.2 7.8 2.9-2.9" />
        <path d="M18 12h4" />
        <path d="m16.2 16.2 2.9 2.9" />
        <path d="M12 18v4" />
        <path d="m4.9 19.1 2.9-2.9" />
        <path d="M2 12h4" />
        <path d="m4.9 4.9 2.9 2.9" />
      </svg>
      {lang key='loading'}
    </p>
  </div>
</div>