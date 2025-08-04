{* Mass Payment Form - Allows clients to pay multiple invoices at once *}
<form method="post" action="clientarea.php?action=masspay">
  {* Hidden field to generate invoice *}
  <input type="hidden" name="geninvoice" value="true" />

  {* Page title and description *}
  {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareamasspayment'}" tagline="{lang key='clientareamasspaymenttagline'}" }

  <p class="text-muted mb-4">{lang key="masspaydescription"}</p>

  {* Loop through each invoice and display its items *}
  {foreach $invoiceitems as $invid => $invoiceitem}
    {* Invoice header with invoice number *}
    <h3 class="text-size-base font-weight-semibold mb-4">{lang key='invoicenumber'} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}</h3>
    {* Hidden input to track which invoices are being paid *}
    <input type="hidden" name="invoiceids[]" value="{$invid}" />
    {* Invoice items table *}
    <div class="table-responsive border rounded-md mb-8">
      <table class="table">
        <thead class="thead">
          <tr class="table-row">
            <th class="table-head">{lang key='invoicesdescription'}</th>
            <th class="table-head">{lang key='invoicesamount'}</th>
          </tr>
        </thead>
        <tbody class="tbody">
          {* Display each item in the invoice *}
          {foreach from=$invoiceitem item=item}
            <tr class="table-row invoice-detail">
              <td class="table-cell">{$item.description}</td>
              <td class="table-cell">{$item.amount}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  {foreachelse}
    {* Display message if no invoices found *}
    <div class="table-responsive border rounded-md">
      <table class="table">
        <tbody class="tbody">
          <tr class="table-row">
            <td class="table-cell text-center" colspan="2">{lang key='norecordsfound'}</td>
          </tr>
        </tbody>
      </table>
    </div>
  {/foreach}

  {* Summary table showing total amounts *}
  {if $invoiceitems}
    <div class="table-responsive border rounded-md mb-8">
      <table class="table">
        <thead class="thead">
          <tr class="table-row">
            <th class="table-head" colspan="2"><strong>{lang key='total'}</strong></th>
          </tr>
        </thead>
        <tbody class="tbody">
          {* Subtotal row *}
          <tr class="table-row">
            <td class="table-cell"><strong>{lang key='invoicessubtotal'}:</strong></td>
            <td class="table-cell text-right"><strong>{$subtotal}</strong></td>
          </tr>
          {* First tax row (if applicable) *}
          {if $tax}
            <tr class="table-row">
              <td class="table-cell"><strong>{$taxrate1}% {$taxname1}:</strong></td>
              <td class="table-cell text-right"><strong>{$tax}</strong></td>
            </tr>
          {/if}
          {* Second tax row (if applicable) *}
          {if $tax2}
            <tr class="table-row">
              <td class="table-cell"><strong>{$taxrate2}% {$taxname2}:</strong></td>
              <td class="table-cell text-right"><strong>{$tax2}</strong></td>
            </tr>
          {/if}
          {* Credit amount row (if applicable) *}
          {if $credit}
            <tr class="table-row">
              <td class="table-cell"><strong>{lang key='invoicescredit'}:</strong></td>
              <td class="table-cell text-right"><strong>{$credit}</strong></td>
            </tr>
          {/if}
          {* Partial payments row (if applicable) *}
          {if $partialpayments}
            <tr class="table-row">
              <td class="table-cell"><strong>{lang key='invoicespartialpayments'}:</strong></td>
              <td class="table-cell text-right"><strong>{$partialpayments}</strong></td>
            </tr>
          {/if}
          {* Final total due row *}
          <tr class="table-row">
            <td class="table-cell"><strong>{lang key='invoicestotaldue'}:</strong></td>
            <td class="table-cell text-right"><strong>{$total}</strong></td>
          </tr>
        </tbody>
      </table>
    </div>
  {/if}

  {* Payment gateway selection section *}
  <div class="card">
    <div class="card-header">
      <h3 class="title-6 font-weight-semibold">{lang key='masspaymentselectgateway'}</h3>
    </div>
    <div class="card-body">
      <fieldset>
        <div class="row align-items-end row-gap-4">
          {* Payment method dropdown *}
          <div class="col-md-8">
            <div class="form-group">
              <label for="paymentmethod" class="form-label">{lang key='orderpaymentmethod'}:</label><br />
              <select name="paymentmethod" id="paymentmethod" class="form-control">
                {* Loop through available payment gateways *}
                {foreach $gateways as $gateway}
                  <option value="{$gateway.sysname}">{$gateway.name}</option>
                {/foreach}
              </select>
            </div>
          </div>
          {* Submit button to process payment *}
          <div class="col-md-4">
            <div class="form-group">
              <button type="submit" class="btn btn-primary btn-block" id="btnMassPayMakePayment">
                {lang key='masspaymakepayment'}
              </button>
            </div>
          </div>
        </div>
      </fieldset>
    </div>
  </div>

</form>