{* Include common template elements for the apex cart *}
{include file="orderforms/apex_cart/common.tpl"}

<div id="order-apex_cart">
  <div class="row cart-row justify-content-end" id="cart-row">
    {* Left sidebar with category navigation *}
    <div class="cart-sidebar sidebar" id="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>

    {* Main content area *}
    <div class="cart-body">
      {* Page header with title and tagline for domain renewal *}
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareadomainrenew'}" tagline="{lang key='clientareadomainrenewtagline'}"}

      {* Search filter box with magnifying glass icon *}
      <div class="form-group">
        <label for="domainRenewalFilter" class="form-label d-none"></label>
        <div class="prepend-icon mb-4">
          <div class="form-float-icon">
            {* Search icon SVG *}
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search">
              <circle cx="11" cy="11" r="8"></circle>
              <path d="m21 21-4.35-4.35"></path>
            </svg>
          </div>
          {* Domain search input field *}
          <input type="search" class="form-control form-control-md" id="domainRenewalFilter" placeholder="{lang key='searchenterdomain'}">
        </div>
      </div>

      {* Include collapsed category sidebar for mobile *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Check if user has any domains to renew *}
      {if $totalDomainCount == 0}
        {* Show message when no domains are available *}
        <div id="no-domains" class="alert alert-warning" role="alert">
          {$LANG.domainRenewal.noDomains}
        </div>
        {* Return to client area button *}
        <p class="text-center">
          <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-light">
            <i class="fas fa-arrow-circle-left"></i>
            {$LANG.orderForm.returnToClientArea}
          </a>
        </p>
      {else}
        {* Main content when domains exist *}
        <div class="row">
          <div class="secondary-cart-body">
            {* Show pagination info if not all domains are displayed *}
            {if $totalResults < $totalDomainCount}
              <div class="mb-2">
                {lang key='domainRenewal.showingDomains' showing=$totalResults totalCount=$totalDomainCount}
                <a id="linkShowAll" href="{routePath('cart-domain-renewals')}">{lang key='domainRenewal.showAll'}</a>
              </div>
            {/if}

            {* Container for all domain renewal items *}
            <div id="domainRenewals" class="card">
              <div class="card-body d-flex flex-column row-gap-4">
                {* Loop through each domain available for renewal *}
                {foreach $renewalsData as $renewalData}
                  <div class="domain-renewal" data-domain="{$renewalData.domain}">
                    {* Status labels on the right side *}
                    <div class="pull-right float-right">
                      {* Display appropriate status label based on domain state *}
                      {if !$renewalData.eligibleForRenewal}
                        <span class="label label-info">
                          {if $renewalData.freeDomainRenewal}
                            {lang key='domainRenewal.freeWithService'}
                          {else}
                            {lang key='domainRenewal.unavailable'}
                          {/if}
                        </span>
                      {elseif ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                        <span class="label label-info">
                          {lang key='domainrenewalspastgraceperiod'}
                        </span>
                      {elseif !$renewalData.beforeRenewLimit && $renewalData.daysUntilExpiry > 0}
                        {* Color-coded expiry warning (green if >30 days, yellow if ≤30 days) *}
                        <span class="label label-{if $renewalData.daysUntilExpiry > 30}success{else}warning{/if}">
                          {lang key='domainRenewal.expiringIn' days=$renewalData.daysUntilExpiry}
                        </span>
                      {elseif $renewalData.daysUntilExpiry === 0}
                        <span class="label label-grey">
                          {lang key='expiresToday'}
                        </span>
                      {elseif $renewalData.beforeRenewLimit}
                        <span class="label label-info">
                          {lang key='domainRenewal.maximumAdvanceRenewal' days=$renewalData.beforeRenewLimitDays}
                        </span>
                      {else}
                        {* Domain has already expired - show days ago *}
                        <span class="label label-danger">
                          {lang key='domainRenewal.expiredDaysAgo' days=$renewalData.daysUntilExpiry*-1}
                        </span>
                      {/if}
                    </div>

                    {* Domain name as heading *}
                    <h3 class="text-size-base font-weight-bold mb-2">{$renewalData.domain}</h3>

                    {* Display expiry date in both absolute and relative format *}
                    <p class="text-muted">{lang key='clientareadomainexpirydate'}: {$renewalData.expiryDate->format('j M Y')} ({$renewalData.expiryDate->diffForHumans()})</p>

                    {* Show free renewal message if applicable *}
                    {if $renewalData.freeDomainRenewal}
                      <p class="text-muted text-size-sm mt-4">{lang key='domainRenewal.freeWithServiceDesc'}</p>
                    {/if}

                    {* Only show renewal options if domain is eligible and has options *}
                    {if ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod) || !count($renewalData.renewalOptions)}
                    {else}
                      <form class="form-horizontal mt-4">
                        <div class="form-group row">
                          <label for="renewalPricing{$renewalData.id}" class="form-label inline-label col-md-5">
                            {lang key='domainRenewal.availablePeriods'}
                            {* Add asterisk if domain is in grace period *}
                            {if $renewalData.inGracePeriod || $renewalData.inRedemptionGracePeriod}
                              *
                            {/if}
                          </label>
                          <div class="col-sm-6">
                            {* Dropdown for renewal period selection *}
                            <select class="form-control select-renewal-pricing" id="renewalPricing{$renewalData.id}" data-domain-id="{$renewalData.id}">
                              {* Loop through available renewal periods *}
                              {foreach $renewalData.renewalOptions as $renewalOption}
                                <option value="{$renewalOption.period}">
                                  {* Show period, price, and any additional fees *}
                                  {$renewalOption.period} {lang key='orderyears'} @ {$renewalOption.rawRenewalPrice}
                                  {if $renewalOption.gracePeriodFee && $renewalOption.gracePeriodFee->toNumeric() != 0.00}
                                    + {$renewalOption.gracePeriodFee} {lang key='domainRenewal.graceFee'}
                                  {/if}
                                  {if $renewalOption.redemptionGracePeriodFee && $renewalOption.redemptionGracePeriodFee->toNumeric() != 0.00}
                                    + {$renewalOption.redemptionGracePeriodFee} {lang key='domainRenewal.redemptionFee'}
                                  {/if}
                                </option>
                              {/foreach}
                            </select>
                          </div>
                        </div>
                      </form>
                    {/if}

                    {* Add to cart button section *}
                    <div class="text-right">
                      {* Only show button if domain is eligible for renewal *}
                      {if !$renewalData.eligibleForRenewal || $renewalData.beforeRenewLimit || ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                      {else}
                        <button id="renewDomain{$renewalData.id}" class="btn btn-secondary btn-sm btn-add-renewal-to-cart" data-domain-id="{$renewalData.id}">
                          {* Button text changes from "adding" to "added" state *}
                          <span class="to-add">
                            <i class="fas fa-fw fa-spinner fa-spin"></i>
                            {lang key='addtocart'}
                          </span>
                          <span class="added">{lang key='domaincheckeradded'}</span>
                        </button>
                      {/if}
                    </div>
                  </div>
                {/foreach}
              </div>
            </div>

            {* Footer note about grace period *}
            <div class="text-left mt-4">
              <small>
                {if $hasDomainsInGracePeriod}
                  * {lang key='domainRenewal.graceRenewalPeriodDescription'}
                {/if}
              </small>
            </div>
          </div>

          {* Right sidebar with order summary *}
          <div class="secondary-cart-sidebar" id="scrollingPanelContainer">
            <div id="orderSummary">
              <div class="order-summary">
                {* Loading spinner for order summary *}
                <div class="loader" id="orderSummaryLoader">
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
                <h2 class="order-summary-title">{lang key='ordersummary'}</h2>
                {* Dynamic content container for cart totals *}
                <div class="summary-container" id="producttotal"></div>
              </div>
              {* View cart button *}
              <div class="text-center">
                <a id="btnGoToCart" class="btn btn-primary" href="{$WEB_ROOT}/cart.php?a=view">
                  {lang key='viewcart'}
                  <i class="far fa-shopping-cart"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      {/if}
    </div>
  </div>

  {* Hidden form for removing items from cart via modal *}
  <form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php">
    <input type="hidden" name="a" value="remove" />
    <input type="hidden" name="r" value="" id="inputRemoveItemType" />
    <input type="hidden" name="i" value="" id="inputRemoveItemRef" />

    {* Modal dialog for confirming item removal *}
    <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header d-block">
            <h4 class="modal-title">
              {* Close button *}
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
            {* Cancel and confirm buttons *}
            <button type="button" class="btn btn-light" data-dismiss="modal">{lang key='no'}</button>
            <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>

{* Initialize renewal totals calculation *}
<script>
  recalculateRenewalTotals();
</script>