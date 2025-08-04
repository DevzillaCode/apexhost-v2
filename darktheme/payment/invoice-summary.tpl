<div id="invoiceIdSummary" class="card">
  <div class="card-body invoice-summary">
    <h2 class="text-size-xl font-weight-bold mb-4 text-center">
      {lang key="invoicenumber"}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}
    </h2>
    <div class="table-responsive border rounded-md">
      <table class="table table-sm table-condensed">
        <thead class="thead">
          <tr class="table-row">
            <th class="table-cell"><strong>{lang key="invoicesdescription"}</strong></th>
            <th width="150" class="table-cell text-right"><strong>{lang key="invoicesamount"}</strong></th>
          </tr>
        </thead>
        <tbody class="tbody">
          {foreach $invoiceitems as $item}
            <tr class="table-row">
              <td class="table-cell">{$item.description}</td>
              <td class="table-cell text-center">{$item.amount}</td>
            </tr>
          {/foreach}
          <tr class="table-row">
            <td class="table-cell total-row text-right">{lang key="invoicessubtotal"}</td>
            <td class="table-cell total-row text-center">{$invoice.subtotal}</td>
          </tr>
          {if $invoice.taxrate}
            <tr class="table-row">
              <td class="table-cell total-row text-right">{$invoice.taxrate}% {$invoice.taxname}</td>
              <td class="table-cell total-row text-center">{$invoice.tax}</td>
            </tr>
          {/if}
          {if $invoice.taxrate2}
            <tr class="table-row">
              <td class="table-cell total-row text-right">{$invoice.taxrate2}% {$invoice.taxname2}</td>
              <td class="table-cell total-row text-center">{$invoice.tax2}</td>
            </tr>
          {/if}
          <tr class="table-row">
            <td class="table-cell total-row text-right">{lang key="invoicescredit"}</td>
            <td class="table-cell total-row text-center">{$invoice.credit}</td>
          </tr>
          <tr class="table-row">
            <td class="table-cell total-row text-right">{lang key="invoicestotaldue"}</td>
            <td class="table-cell total-row text-center">{$invoice.total}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="my-4 text-center">
      {lang key="paymentstodate"}: <strong>{$invoice.amountpaid}</strong>
    </div>
    <div class="alert alert-success text-center m-0">
      <div>{lang key="balancedue"}: <strong>{$balance}</strong></div>
    </div>
  </div>
</div>