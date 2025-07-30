<!-- Include table list component with filtering enabled on column 4 (status) -->
{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}

<!-- Page header with title and tagline -->
{include file="$template/components/heading/PageTitle.tpl"
  headline="{lang key='clientareainvoices'}"
tagline="{lang key='clientareainvoicestagline'}"
}

<!-- JavaScript for DataTable initialization and sorting -->
<script>
  jQuery(document).ready(function() {
    // Initialize DataTable and show the hidden table
    var table = jQuery('#tableInvoicesList').show().DataTable();

    // Apply sorting based on URL parameters
    {if $orderby == 'default'}
      // Default sorting: by status (desc) then by due date (asc)
      table.order([4, 'desc'], [2, 'asc']);
    {elseif $orderby == 'invoicenum'}
      table.order(0, '{$sort}');  // Sort by invoice number column
    {elseif $orderby == 'date'}
      table.order(1, '{$sort}');  // Sort by date created column
    {elseif $orderby == 'duedate'}
      table.order(2, '{$sort}');  // Sort by due date column
    {elseif $orderby == 'total'}
      table.order(3, '{$sort}');  // Sort by total amount column
    {elseif $orderby == 'status'}
      table.order(4, '{$sort}');  // Sort by status column
    {/if}

    // Redraw table with applied sorting
    table.draw();

    // Hide loading indicator
    jQuery('#tableLoading').hide();
  });
</script>

<div class="table-container clearfix">
  <!-- Invoices list table (initially hidden until DataTable loads) -->
  <table id="tableInvoicesList" class="table w-hidden extra-padding-table-cells">
    <thead class="thead">
      <tr class="table-row">
        <!-- Empty header for the action arrow column -->
        <th class="order-head"></th>
        <th class="table-head">{lang key='invoicestitle'}</th>
        <th class="table-head">{lang key='invoicesdatecreated'}</th>
        <th class="table-head">{lang key='invoicesdatedue'}</th>
        <th class="table-head">{lang key='invoicestotal'}</th>
        <th class="table-head">{lang key='invoicesstatus'}</th>
      </tr>
    </thead>
    <tbody class="tbody">
      <!-- Loop through each invoice -->
      {foreach $invoices as $invoice}
        <!-- Clickable table row that navigates to invoice view -->
        <tr class="table-row">

          <!-- Action arrow icon column -->
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>

          <!-- Invoice number -->
          <td class="table-cell">
            <a href="viewinvoice.php?id={$invoice.id}">
              {$invoice.invoicenum}
            </a>
          </td>

          <!-- Date created with hidden normalized date for sorting -->
          <td class="table-cell">
            <span class="w-hidden">{$invoice.normalisedDateCreated}</span>
            {$invoice.datecreated}
          </td>

          <!-- Due date with hidden normalized date for sorting -->
          <td class="table-cell">
            <span class="w-hidden">{$invoice.normalisedDateDue}</span>
            {$invoice.datedue}
          </td>

          <!-- Invoice total with numeric value for sorting -->
          <td class="table-cell" data-order="{$invoice.totalnum}">{$invoice.total}</td>

          <!-- Invoice status with color-coded label -->
          <td class="table-cell">
            {* Check if invoice status contains span tag and extract text only *}
            {assign var="cleanStatus" value=$invoice.status}
            {if $invoice.status|strpos:'<span' !== false}
              {* Remove span tags and extract only the text content *}
              {assign var="cleanStatus" value=$invoice.status|regex_replace:'/<span[^>]*>/':''}
              {assign var="cleanStatus" value=$cleanStatus|regex_replace:'/<\/span>/':''}
              {assign var="cleanStatus" value=$cleanStatus|strip_tags|trim}
            {/if}
            <span class="label status status-{$invoice.statusClass}">{$cleanStatus}</span>
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