{* Include common template elements (headers, footers, etc.) *}
{include file="orderforms/apex_cart/common.tpl"}

{* Main container for the order cart *}
<div id="order-apex_cart">
  <div class="row">
    {* Left sidebar - contains category navigation *}
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>

    {* Main cart content area *}
    <div class="cart-body">
      {* Page header section with title and controls *}
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareaservicesrenew'}" tagline="{lang key='clientareaservicesrenewtagline'}" }

      {* Include collapsed category navigation for mobile *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Display message if no services are available *}
      <div class="alert-container">
        <div id="no-services" class="alert alert-warning alert-float" role="alert">
          <div>
            {* alert-icon *}
            <div class="alert-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-alert-circle">
                <circle cx="12" cy="12" r="10" />
                <path d="M12 16v-4" />
                <path d="M12 8h0" />
              </svg>
            </div>
            {* alert-content *}
            <div class="alert-content">
              <p class="alert-message">{lang key='renewService.noServices'}</p>
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

      {* Main content when services are available *}
      {if $totalServiceCount == 0}
        <div id="no-services" class="alert alert-warning text-center" role="alert">
          <div>
            <p class="alert-message">{lang key='renewService.noServices'}</p>
          </div>
        </div>
        {* page-footer *}
        <div class="page-footer">
          <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-semi-ghost-secondary btn-wide">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left rtl-rotate">
              <path d="m12 19-7-7 7-7" />
              <path d="M19 12H5" />
            </svg>
            {$LANG.orderForm.returnToClientArea}
          </a>
        </div>
      {else}
        {* Main content when services are available *}
        <div class="row">
          <div class="secondary-cart-body">
            {* Show count of displayed services vs total available *}
            {if $totalResults < $totalServiceCount}
              <div class="text-center">
                {lang key='renewService.showingServices' showing=$totalResults totalCount=$totalServiceCount}
                <a id="linkShowAll" href="{routePath('service-renewals')}">
                  {lang key='domainRenewal.showAll'}
                </a>
              </div>
            {/if}

            {* Container for the list of renewable services *}
            <div id="serviceRenewals" class="service-renewals d-flex flex-column row-gap-4">
              {* Search box appears only when there are more than 5 results *}
              {if $totalResults > 5}
                <div class="prepend-icon">
                  <div class="form-float-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search">
                      <circle cx="11" cy="11" r="8"></circle>
                      <path d="m21 21-4.35-4.35"></path>
                    </svg>
                  </div>
                  <input id="serviceRenewalFilter" type="search" class="service-renewals-filter form-control" placeholder="{lang key='renewService.searchPlaceholder'}">
                </div>
              {/if}
              {include file="orderforms/apex_cart/service-renewal-item.tpl" renewableItems=$renewableServices prefix=''}
            </div>
          </div>

          {* Right sidebar - order summary section *}
          <div class="secondary-cart-sidebar" id="scrollingPanelContainer">
            <div class="order-summary" id="orderSummary">
              {* Loading spinner for order summary *}
              <div class="loader w-hidden" id="orderSummaryLoader">
                <svg class="fa-spin" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-loader-icon lucide-loader">
                  <path d="M12 2v4" />
                  <path d="m16.2 7.8 2.9-2.9" />
                  <path d="M18 12h4" />
                  <path d="m16.2 16.2 2.9 2.9" />
                  <path d="M12 18v4" />
                  <path d="m4.9 19.1 2.9-2.9" />
                  <path d="M2 12h4" />
                  <path d="m4.9 4.9 2.9 2.9" />
                </svg>
              </div>
              {* Order summary title *}
              <h2 class="order-summary-title">{$LANG.ordersummary}</h2>
              {* Container where the order total will be displayed *}
              <div class="summary-container" id="producttotal"></div>
            </div>
          </div>
        </div>
      {/if}
    </div>
  </div>

  {* Hidden form for removing items from renewal list *}
  <form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php" data-renew-type="service">
    <input type="hidden" name="a" value="remove">
    <input type="hidden" name="r" value="" id="inputRemoveItemType">
    <input type="hidden" name="i" value="" id="inputRemoveItemRef">
    <input type="hidden" name="rt" value="service" id="inputRemoveItemRenewalType">

    {* Confirmation modal for item removal *}
    <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header d-block">
            <h4 class="modal-title">
              <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
                <span aria-hidden="true">&times;</span>
              </button>
              <i class="fas fa-times fa-3x"></i>
              <span>{lang key='orderForm.removeItem'}</span>
            </h4>
          </div>
          <div class="modal-body">
            {lang key='cartremoveitemconfirm'}
          </div>
          <div class="modal-footer d-block">
            <button type="button" class="btn btn-light" data-dismiss="modal">{lang key='no'}</button>
            <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>

{* Initialize the renewal totals calculation *}
<script>
  recalculateRenewalTotals();
</script>