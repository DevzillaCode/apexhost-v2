{* Include tablelist component for DataTable functionality *}
{include file="$template/includes/tablelist.tpl" tableName="QuotesList" noSortColumns="5" filterColumn="4"}

<!-- Page header with title and tagline -->
{include file="$template/components/heading/PageTitle.tpl"
  headline="{lang key='clientareaquotes'}"
tagline="{lang key='clientareaquotestagline'}"
}

{* JavaScript to initialize and configure DataTable for quotes list *}
<script>
  jQuery(document).ready(function() {
    var table = jQuery('#tableQuotesList').show().DataTable();

    {* Apply sorting based on URL parameters *}
    {if $orderby == 'id'}
      table.order(0, '{$sort}');
    {elseif $orderby == 'date'}
      table.order(2, '{$sort}');
    {elseif $orderby == 'validuntil'}
      table.order(3, '{$sort}');
    {elseif $orderby == 'stage'}
      table.order(4, '{$sort}');
    {/if}
    table.draw();
    jQuery('#tableLoading').hide();
  });
</script>

{* Container for quotes table *}
<div class="table-container clearfix">
  <table id="tableQuotesList" class="table w-hidden">
    {* Table header *}
    <thead class="thead">
      <tr class="table-row">
        <th class="order-head"></th>
        <th class="table-head">{lang key='quotenumber'}</th>
        <th class="table-head">{lang key='quotesubject'}</th>
        <th class="table-head">{lang key='quotedatecreated'}</th>
        <th class="table-head">{lang key='quotevaliduntil'}</th>
        <th class="table-head">{lang key='quotestage'}</th>
        <th class="table-head"> </th>
      </tr>
    </thead>
    {* Table body with quote entries *}
    <tbody class="tbody">
      {foreach $quotes as $quote}
        <tr class="table-row" onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', true)">
          {* Order indicator cell *}
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--foreground)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>
          {* Quote ID *}
          <td class="table-cell">{$quote.id}</td>
          {* Quote Subject *}
          <td class="table-cell">{$quote.subject}</td>
          {* Quote Creation Date *}
          <td class="table-cell"><span class="w-hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
          {* Quote Valid Until Date *}
          <td class="table-cell"><span class="w-hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
          {* Quote Stage *}
          <td class="table-cell"><span class="label status status-{$quote.stageClass}">{$quote.stage}</span></td>
          {* Download Quote Action *}
          <td class="table-cell text-center">
            <form method="post" action="dl.php">
              <input type="hidden" name="type" value="q" />
              <input type="hidden" name="id" value="{$quote.id}" />
              <button type="submit" class="btn btn-ghost-info btn-xs">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-download-icon lucide-download">
                  <path d="M12 15V3" />
                  <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                  <path d="m7 10 5 5 5-5" />
                </svg>
                {lang key='quotedownload'}
              </button>
            </form>
          </td>
        </tr>
      {/foreach}
    </tbody>
  </table>
  {* Loading indicator *}
  <div class="text-center" id="tableLoading">
    <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
  </div>
</div>