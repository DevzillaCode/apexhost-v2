{*
  Email History Template
  Displays a list of emails sent to the client in a sortable DataTable
  Requires: tablelist.tpl, PageTitle.tpl components
*}

{*
  Include the standard table list template which provides:
  - Table styling
  - Search/filter functionality
  - Pagination controls
  The noSortColumns="-1" prevents sorting on the first column (icon column)
*}
{include file="$template/includes/tablelist.tpl" tableName="EmailsList" noSortColumns="-1"}

{*
  Page header section with title and descriptive tagline
  Uses language strings for multilingual support:
  - clientareaemailhistory: Main page title
  - clientareaemailhistorytagline: Descriptive subtitle
*}
{include file="$template/components/heading/PageTitle.tpl"
  headline="{lang key='clientareaemailhistory'}"
  tagline="{lang key='clientareaemailhistorytagline'}"
}

<script>
  {*
    Initialize DataTables when DOM is ready
    Handles:
    - Showing the hidden table
    - Applying initial sorting if specified
    - Hiding the loading indicator
  *}
  jQuery(document).ready(function() {
    var table = jQuery('#tableEmailsList').show().DataTable();

    {* Apply initial sorting based on URL parameters *}
    {if $orderby == 'date'}
      table.order(0, '{$sort}'); {* Sort by date column (column index 0) *}
    {elseif $orderby == 'subject'}
      table.order(1, '{$sort}'); {* Sort by subject column (column index 1) *}
    {/if}

    table.draw(); {* Redraw table with applied settings *}
    jQuery('#tableLoading').hide(); {* Hide loading spinner *}
  });
</script>

<div class="clearfix">
  {*
    Main emails table structure
    Uses WHMCS table classes for consistent styling
  *}
  <table id="tableEmailsList" class="table w-hidden overflow-hidden">
    <thead class="thead">
      <tr class="table-row">
        {* Icon column (no sorting) *}
        <th class="order-head"></th>

        {* Date column - uses language string for header *}
        <th class="table-head">{lang key='clientareaemailsdate'}</th>

        {* Subject column - uses language string for header *}
        <th class="table-head">{lang key='clientareaemailssubject'}</th>

        {* Actions column (empty header) *}
        <th class="table-head">&nbsp;</th>
      </tr>
    </thead>

    <tbody class="tbody">
      {* Loop through each email record *}
      {foreach $emails as $email}
        <tr class="table-row">
          {*
            Icon cell - shows a right-arrow icon
            Uses Lucide icon set (included with WHMCS)
          *}
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>

          {*
            Date cell
            - hidden span with normalized date for sorting
            - formatted date for display
          *}
          <td class="table-cell">
            <span class="w-hidden">{$email.normalisedDate}</span>
            {$email.date}
          </td>

          {*
            Subject cell
            - Shows paperclip icon if attachments exist
            - Uses Font Awesome for the attachment icon
          *}
          <td class="table-cell">
            {$email.subject}
            {if $email.attachmentCount > 0}
              <i class="fal fa-paperclip"></i>
            {/if}
          </td>

          {*
            Action cell - View button
            Opens email in popup window with standard dimensions
          *}
          <td class="table-cell">
            <button type="button"
                    class="btn btn-ghost-info btn-xs text-nowrap"
                    onclick="popupWindow('viewemail.php?id={$email.id}', 'emailWin', '800', '600', 'scrollbars=1,')">
              {lang key='emailviewmessage'} {* Uses language string *}
            </button>
          </td>
        </tr>
      {/foreach}
    </tbody>
  </table>

  {*
    Loading indicator shown while table initializes
    Uses Font Awesome spinner and language string
  *}
  <div class="text-center" id="tableLoading">
    <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
  </div>
</div>