{include file="$template/includes/tablelist.tpl" tableName="EmailsList" noSortColumns="-1"}

{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareaemailhistory'}" tagline="{lang key='clientareaemailhistorytagline'}"}

<script>
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
  <table id="tableEmailsList" class="theme_datatable table w-hidden overflow-hidden">
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
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>
          <td class="table-cell">
            <span class="w-hidden">{$email.normalisedDate}</span>
            {$email.date}
          </td>

          <td class="table-cell">
            {$email.subject}
            {if $email.attachmentCount > 0}
              <i class="fal fa-paperclip"></i>
            {/if}
          </td>
          <td class="table-cell">
            <button type="button" class="btn btn-ghost-info btn-xxs text-nowrap" onclick="popupWindow('viewemail.php?id={$email.id}', 'emailWin', '800', '600', 'scrollbars=1,')">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-message-square-icon lucide-message-square">
                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" />
              </svg>
              {lang key='emailviewmessage'} {* Uses language string *}
            </button>
          </td>
        </tr>
      {/foreach}
    </tbody>
  </table>

  <div class="text-center" id="tableLoading">
    <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
  </div>
</div>