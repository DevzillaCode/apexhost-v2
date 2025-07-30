{* Conditional alerts for payment method actions *}
{if $createSuccess}
  {* Success alert for adding a payment method *}
  {include file="$template/includes/alert.tpl" type="success" msg="{lang key='paymentMethods.addedSuccess'}"}
{elseif $createFailed}
  {* Warning alert for failed payment method addition *}
  {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='paymentMethods.addFailed'}"}
{elseif $saveSuccess}
  {* Success alert for updating a payment method *}
  {include file="$template/includes/alert.tpl" type="success" msg="{lang key='paymentMethods.updateSuccess'}"}
{elseif $saveFailed}
  {* Warning alert for failed payment method update *}
  {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='paymentMethods.saveFailed'}"}
{elseif $setDefaultResult === true}
  {* Success alert for setting default payment method *}
  {include file="$template/includes/alert.tpl" type="success" msg="{lang key='paymentMethods.defaultUpdateSuccess'}"}
{elseif $setDefaultResult === false}
  {* Warning alert for failed default payment method update *}
  {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='paymentMethods.defaultUpdateFailed'}"}
{elseif $deleteResult === true}
  {* Success alert for deleting a payment method *}
  {include file="$template/includes/alert.tpl" type="success" msg="{lang key='paymentMethods.deleteSuccess'}"}
{elseif $deleteResult === false}
  {* Warning alert for failed payment method deletion *}
  {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='paymentMethods.deleteFailed'}"}
{/if}

{* Container for payment methods management *}
<div>
  <div>
    {* Title for payment methods section *}
    <h3 class="card-title">{lang key='paymentMethods.title'}</h3>
    {* Introductory text *}
    <p class="mb-3">{lang key='paymentMethods.intro'}</p>

    {* Action buttons for adding payment methods *}
    <div class="f-flex mb-4 col-gap-2">
      {if $allowCreditCard}
        {* Button to add new credit card *}
        <a href="{routePath('account-paymentmethods-add')}" class="btn btn-light btn-sm" data-role="add-new-credit-card">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
            <path d="M5 12h14" />
            <path d="M12 5v14" />
          </svg>
          {lang key='paymentMethods.addNewCC'}
        </a>
      {/if}
      {if $allowBankDetails}
        {* Button to add new bank account *}
        <a href="{routePathWithQuery('account-paymentmethods-add', null, 'type=bankacct')}" class="btn btn-light btn-sm">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
            <path d="M5 12h14" />
            <path d="M12 5v14" />
          </svg>
          {lang key='paymentMethods.addNewBank'}
        </a>
      {/if}
    </div>

    {* Table for displaying payment methods *}
    <div class="border rounded-md overflow-hidden mb-10">
      <div class="table-responsive">
        <table class="table" id="payMethodList">
          {* Table header *}
          <thead class="thead">
            <tr>
              <th class="order-head"></th>
              <th class="table-head">{lang key="paymentMethods.name"}</th>
              <th class="table-head">{lang key="paymentMethods.description"}</th>
              <th class="table-head">{lang key="paymentMethods.status"}</th>
              <th class="table-head">{lang key="paymentMethods.actions"}</th>
            </tr>
          </thead>
          {* Table body *}
          <tbody class="tbody">
            {foreach $client->payMethods->validateGateways() as $payMethod}
              {* Table row for each payment method *}
              <tr class="table-row">
                {* Order icon cell *}
                <td class="order-cell text-muted">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
                    <path d="m15 10 5 5-5 5" />
                    <path d="M4 4v7a4 4 0 0 0 4 4h12" />
                  </svg>
                </td>
                {* Payment method name *}
                <td class="table-cell">
                  <i class="{$payMethod->getFontAwesomeIcon()}"></i>
                  <strong class="ml-2">{$payMethod->payment->getDisplayName()}</strong>
                </td>
                {* Payment method description *}
                <td class="table-cell">
                  {if $payMethod->description}
                    {$payMethod->description}
                  {else}
                    -
                  {/if}
                </td>
                {* Payment method status *}
                <td class="table-cell">
                  {$payMethod->getStatus()}{if $payMethod->isDefaultPayMethod()} - {lang key='paymentMethods.default'}{/if}
                </td>
                {* Action buttons for payment method *}
                <td class="table-cell">
                  <a href="{routePath('account-paymentmethods-setdefault', $payMethod->id)}" class="btn btn-ghost-light btn-xs btn-set-default{if $payMethod->isDefaultPayMethod() || $payMethod->isExpired()} disabled{/if}">
                    {lang key='paymentMethods.setAsDefault'}
                  </a>
                  <a href="{routePath('account-paymentmethods-view', $payMethod->id)}" class="btn btn-ghost-info btn-xs{if $payMethod->getType() == 'RemoteBankAccount'} disabled{/if}" data-role="edit-payment-method">
                    {lang key='paymentMethods.edit'}
                  </a>
                  {if $allowDelete}
                    <a href="{routePath('account-paymentmethods-delete', $payMethod->id)}" class="btn btn-ghost-danger btn-xs btn-delete">
                      {lang key='paymentMethods.delete'}
                    </a>
                  {/if}
                </td>
              </tr>
            {foreachelse}
              {* Empty state for no payment methods *}
              <tr class="table-row">
                <td class="table-cell py-3 text-muted" colspan="6" align="center">
                  {lang key='paymentMethods.noPaymentMethodsCreated'}
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

{* Modal for confirming payment method deletion *}
<form method="post" action="" id="frmDeletePaymentMethod">
  <div class="modal fade" id="modalPaymentMethodDeleteConfirmation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        {* Modal header *}
        <div class="modal-header">
          <h4 class="modal-title">
            {lang key='paymentMethods.areYouSure'}
          </h4>
          <button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
              <path d="M18 6 6 18" />
              <path d="m6 6 12 12" />
            </svg>
          </button>
        </div>
        {* Modal body *}
        <div class="modal-body">
          <p>{lang key='paymentMethods.deletePaymentMethodConfirm'}</p>
        </div>
        {* Modal footer with action buttons *}
        <div class="modal-footer">
          <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
            {lang key="no"}
          </button>
          <button type="submit" class="btn btn-danger btn-xs btn-wide" id="btnRemoveUserConfirm">
            {lang key="yes"}
          </button>
        </div>
      </div>
    </div>
  </div>
</form>

{* Form for setting default payment method *}
<form method="post" action="" id="frmSetDefaultPaymentMethod"></form>

{* JavaScript for handling set default and delete actions *}
<script>
  jQuery(document).ready(function() {
    {* Handle set default payment method button click *}
    jQuery('.btn-set-default').click(function(e) {
      e.preventDefault();
      jQuery('#frmSetDefaultPaymentMethod')
        .attr('action', jQuery(this).attr('href'))
        .submit();
    });
    {* Handle delete payment method button click *}
    jQuery('.btn-delete').click(function(e) {
      e.preventDefault();
      jQuery('#frmDeletePaymentMethod')
        .attr('action', jQuery(this).attr('href'));
      jQuery('#modalPaymentMethodDeleteConfirmation').modal('show');
    });
  });
</script>