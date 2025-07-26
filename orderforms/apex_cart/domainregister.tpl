{* Include common template components *}
{include file="orderforms/apex_cart/common.tpl"}

<div id="order-apex_cart">
  <div class="row">
    {* Left sidebar with domain categories *}
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>

    {* Main content area *}
    <div class="cart-body">
      {* Page title and tagline *}
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareadomainregister'}" tagline="{lang key='clientareadomainregistertagline'}"}

      {* Mobile collapsed sidebar *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Domain search form container *}
      <div class="domain-checker-container">
        <div class="domain-checker-bg clearfix">
          <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
            <input type="hidden" name="a" value="checkDomain">

            <div class="row">
              {* Domain input field *}
              <div class="col-md-8 col-md-offset-2 offset-md-2 col-xs-10 col-xs-offset-1 col-10 offset-1">
                <div class="input-group input-group-lg input-group-box">
                  <input type="text" name="domain" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                  <span class="input-group-btn input-group-append">
                    <button type="submit" id="btnCheckAvailability" class="btn btn-primary domain-check-availability{$captcha->getButtonClass($captchaForm)}">{$LANG.search}</button>
                  </span>
                </div>
              </div>

              {* CAPTCHA section - only show if enabled *}
              {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
                <div class="col-md-8 col-md-offset-2 offset-md-2 col-xs-10 col-xs-offset-1 col-10 offset-1">
                  <div class="captcha-container" id="captchaContainer">
                    {* reCAPTCHA or basic image captcha *}
                    {if $captcha->recaptcha->isEnabled()}
                      <br>
                      <div class="text-center">
                        <div class="form-group recaptcha-container"></div>
                      </div>
                    {else}
                      <div class="default-captcha default-captcha-register-margin">
                        <p>{lang key="cartSimpleCaptcha"}</p>
                        <div>
                          <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" align="middle" />
                          <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                        </div>
                      </div>
                    {/if}
                  </div>
                </div>
              {/if}
            </div>
          </form>
        </div>
      </div>

      {* Domain search results container - initially hidden *}
      <div id="DomainSearchResults" class="w-hidden">
        {* Primary domain lookup result *}
        <div id="searchDomainInfo" class="domain-checker-result-headline">
          {* Loading spinner *}
          <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching"><i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.searching'}...</p>

          {* Actual search result - initially hidden *}
          <div id="primaryLookupResult" class="domain-lookup-result w-hidden">
            {* Various result states *}
            <p class="domain-invalid domain-checker-invalid">{lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span></p>
            <p class="domain-unavailable domain-checker-unavailable">{lang key='orderForm.domainIsUnavailable'}</p>
            <p class="domain-tld-unavailable domain-checker-unavailable">{lang key='orderForm.domainHasUnavailableTld'}</p>
            <p class="domain-available domain-checker-available">{$LANG.domainavailablemessage}</p>
            <a class="domain-contact-support btn btn-primary">{$LANG.domainContactUs}</a>

            {* IDN (Internationalized Domain Name) language selector *}
            <div id="idnLanguageSelector" class="form-group idn-language-selector w-hidden">
              <div class="row">
                <div class="col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2 offset-sm-1 offset-lg-2">
                  <div class="margin-10 text-center">
                    {lang key='cart.idnLanguageDescription'}
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3 offset-sm-2 offset-lg-3">
                  <select name="idnlanguage" class="form-control">
                    <option value="">{lang key='cart.idnLanguage'}</option>
                    {foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
                      <option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
                    {/foreach}
                  </select>
                  <div class="field-error-msg">
                    {lang key='cart.selectIdnLanguageForRegister'}
                  </div>
                </div>
              </div>
            </div>

            {* Price and add to cart button *}
            <p class="domain-price mt-4">
              <span class="price text-size-base font-weight-bold"></span>
              <button class="btn btn-primary btn-add-to-cart" data-whois="0" data-domain="">
                <span class="to-add">{$LANG.addtocart}</span>
                <span class="loading">
                  <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                </span>
                <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
                <span class="unavailable">{$LANG.domaincheckertaken}</span>
              </button>
            </p>
            <p class="domain-error domain-checker-unavailable"></p>
          </div>
        </div>

        {* Spotlight TLDs section - featured domain extensions *}
        {if $spotlightTlds}
          <div id="spotlightTlds" class="spotlight-tlds clearfix">
            <div class="spotlight-tlds-container">
              {foreach $spotlightTlds as $key => $data}
                <div class="spotlight-tld-container spotlight-tld-container-{$spotlightTlds|count}">
                  <div id="spotlight{$data.tldNoDots}" class="spotlight-tld">
                    {* TLD group label (if exists) *}
                    {if $data.group}
                      <div class="spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
                    {/if}
                    {$data.tld}

                    {* Loading spinner for spotlight TLD *}
                    <span class="domain-lookup-loader domain-lookup-spotlight-loader">
                      <i class="fas fa-spinner fa-spin"></i>
                    </span>

                    {* Spotlight TLD result buttons *}
                    <div class="domain-lookup-result">
                      <button type="button" class="btn unavailable w-hidden" disabled="disabled">
                        {lang key='domainunavailable'}
                      </button>
                      <button type="button" class="btn invalid w-hidden" disabled="disabled">
                        {lang key='domainunavailable'}
                      </button>
                      <span class="available price w-hidden">{$data.register}</span>
                      <button type="button" class="btn btn-primary btn-add-to-cart w-hidden" data-whois="0" data-domain="">
                        <span class="to-add">{lang key='orderForm.add'}</span>
                        <span class="loading">
                          <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                        </span>
                        <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
                        <span class="unavailable">{$LANG.domaincheckertaken}</span>
                      </button>
                      <button type="button" class="btn btn-primary domain-contact-support w-hidden">
                        {lang key='domainChecker.contactSupport'}
                      </button>
                    </div>
                  </div>
                </div>
              {/foreach}
            </div>
          </div>
        {/if}

        {* Domain suggestions section *}
        <div class="suggested-domains{if !$showSuggestionsContainer} w-hidden{/if}">
          <div class="panel-heading card-header">
            {lang key='orderForm.suggestedDomains'}
          </div>

          {* Loading state for suggestions *}
          <div id="suggestionsLoader" class="panel-body card-body domain-lookup-loader domain-lookup-suggestions-loader">
            <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
          </div>

          {* Actual suggestions list *}
          <div id="domainSuggestions" class="domain-lookup-result list-group w-hidden">
            {* Template for individual suggestion - cloned by JavaScript *}
            <div class="domain-suggestion list-group-item w-hidden">
              <span class="domain"></span><span class="extension"></span>
              {* Promotional badges *}
              <span class="promo w-hidden">
                <span class="sales-group-hot w-hidden">{lang key='domainCheckerSalesGroup.hot'}</span>
                <span class="sales-group-new w-hidden">{lang key='domainCheckerSalesGroup.new'}</span>
                <span class="sales-group-sale w-hidden">{lang key='domainCheckerSalesGroup.sale'}</span>
              </span>
              <div class="actions">
                <span class="price"></span>
                <button type="button" class="btn btn-primary btn-add-to-cart" data-whois="1" data-domain="">
                  <span class="to-add">{$LANG.addtocart}</span>
                  <span class="loading">
                    <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                  </span>
                  <span class="added"><i class="far fa-shopping-cart"></i> {lang key='checkout'}</span>
                  <span class="unavailable">{$LANG.domaincheckertaken}</span>
                </button>
                <button type="button" class="btn btn-info domain-contact-support w-hidden">
                  {lang key='domainChecker.contactSupport'}
                </button>
              </div>
            </div>
          </div>

          {* Load more suggestions footer *}
          <div class="panel-footer card-footer more-suggestions text-center w-hidden">
            <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
            <span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
          </div>

          {* Warning text *}
          <div class="text-center text-muted domain-suggestions-warning">
            <p>{lang key='domainssuggestionswarnings'}</p>
          </div>
        </div>
      </div>

      {* Domain pricing table section *}
      <div class="domain-pricing">
        <h4 class="text-size-base font-weight-bold mb-4">{lang key='pricing.browseExtByCategory'}</h4>

        {* Category filter badges *}
        <div class="tld-filters d-flex flex-wrap gap-2">
          {foreach $categoriesWithCounts as $category => $count}
            <a href="#" data-category="{$category}" class="badge badge-secondary">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
          {/foreach}
        </div>

        {* Pricing table *}
        <div class="border rounded-md overflow-hidden mb-10">
          <div class="table-responsive">
            <table class="table table-striped">
              {* Table header *}
              <thead class="thead">
                <tr class="table-row">
                  <th class="order-head"></th>
                  <th class="table-head">{lang key='orderdomain'}</th>
                  <th class="table-head">{lang key='pricing.register'}</th>
                  <th class="table-head">{lang key='pricing.transfer'}</th>
                  <th class="table-head">{lang key='pricing.renewal'}</th>
                </tr>
              </thead>

              {* Table body with domain pricing *}
              <tbody class="tbody">
                {foreach $pricing['pricing'] as $tld => $price}
                  <tr class="table-row tld-row" data-category="{foreach $price.categories as $category}|{$category}|{/foreach}">
                    {* Arrow icon *}
                    <td class="order-cell">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
                        <path d="m15 10 5 5-5 5"></path>
                        <path d="M4 4v7a4 4 0 0 0 4 4h12"></path>
                      </svg>
                    </td>

                    {* TLD name and promotional badge *}
                    <td class="table-cell">
                      <strong>.{$tld}</strong>
                      {if $price.group}
                        <span class="tld-sale-group tld-sale-group-{$price.group}">
                          {lang key='domainCheckerSalesGroup.'|cat:$price.group}
                        </span>
                      {/if}
                    </td>

                    {* Registration price *}
                    <td class="table-cell">
                      {if isset($price.register) && current($price.register) > 0}
                        <span class="font-heading font-weight-semibold">{current($price.register)}</span><br>
                        <small>{key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                      {elseif isset($price.register) && current($price.register) == 0}
                        <small>{lang key='orderfree'}</small>
                      {else}
                        <small>{lang key='na'}</small>
                      {/if}
                    </td>

                    {* Transfer price *}
                    <td class="table-cell">
                      {if isset($price.transfer) && current($price.transfer) > 0}
                        <span class="font-heading font-weight-semibold">{current($price.transfer)}</span><br>
                        <small>{key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                      {elseif isset($price.transfer) && current($price.transfer) == 0}
                        <small>{lang key='orderfree'}</small>
                      {else}
                        <small>{lang key='na'}</small>
                      {/if}
                    </td>

                    {* Renewal price *}
                    <td class="table-cell">
                      {if isset($price.renew) && current($price.renew) > 0}
                        <span class="font-heading font-weight-semibold">{current($price.renew)}</span><br>
                        <small>{key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                      {elseif isset($price.renew) && current($price.renew) == 0}
                        <small>{lang key='orderfree'}</small>
                      {else}
                        <small>{lang key='na'}</small>
                      {/if}
                    </td>
                  </tr>
                {/foreach}

                {* Empty state row *}
                <tr class="table-row tld-row no-tlds text-center">
                  <td class="table-cell" colspan="5">{lang key='pricing.selectExtCategory'}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      {* Promotional boxes section *}
      <div class="row row-gap-4">
        {* Hosting upsell box *}
        <div class="{if $domainTransferEnabled}col-md-6{else}col-md-8 col-md-offset-2 offset-md-2{/if}">
          <div class="domain-promo-box">
            <div class="clearfix">
              <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-server-icon lucide-server">
                <rect width="20" height="8" x="2" y="2" rx="2" ry="2" />
                <rect width="20" height="8" x="2" y="14" rx="2" ry="2" />
                <line x1="6" x2="6.01" y1="6" y2="6" />
                <line x1="6" x2="6.01" y1="18" y2="18" />
              </svg>
              <h3 class="title-5 font-weight-bold mb-2">{lang key='orderForm.addHosting'}</h3>
              <p class="font-weight-bold text-warning">{lang key='orderForm.chooseFromRange'}</p>
            </div>
            <p>{lang key='orderForm.packagesForBudget'}</p>
            <a href="{$WEB_ROOT}/cart.php" class="btn btn-warning">
              {lang key='orderForm.exploreNow'}
            </a>
          </div>
        </div>

        {* Domain transfer box (conditional) *}
        {if $domainTransferEnabled}
          <div class="col-md-6">
            <div class="domain-promo-box">
              <div class="clearfix">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
                  <circle cx="12" cy="12" r="10" />
                  <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
                  <path d="M2 12h20" />
                </svg>
                <h3 class="title-5 font-weight-bold mb-2">{lang key='orderForm.transferToUs'}</h3>
                <p class="font-weight-bold text-primary">{lang key='orderForm.transferExtend'}*</p>
              </div>
              <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-primary">
                {lang key='orderForm.transferDomain'}
              </a>
              <p class="small">* {lang key='orderForm.extendExclusions'}</p>
            </div>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

{* JavaScript initialization *}
<script>
  jQuery(document).ready(function() {
    // Auto-click first category filter
    jQuery('.tld-filters a:first-child').click();

    // Auto-trigger domain search if term exists and no errors
    {if $lookupTerm && !$captchaError && !$invalid}
      jQuery('#btnCheckAvailability').click();
    {/if}

    // Show invalid domain state if needed
    {if $invalid}
      jQuery('#primaryLookupSearching').toggle();
      jQuery('#primaryLookupResult').children().toggle();
      jQuery('#primaryLookupResult').toggle();
      jQuery('#DomainSearchResults').toggle();
      jQuery('.domain-invalid').toggle();
    {/if}
  });
</script>