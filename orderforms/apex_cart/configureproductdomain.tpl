{* Include common template files *}
{include file="orderforms/apex_cart/common.tpl"}

{* Main container for the order form *}
<div id="order-apex_cart">
  {* Main layout row *}
  <div class="row">
    {* Left sidebar with categories *}
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>

    {* Main content area *}
    <div class="cart-body">
      {* Page title and subtitle *}
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='domaincheckerchoosedomain'}" tagline="{lang key='clientareadomainchoosetagline'}" }

      {* Mobile version of sidebar (collapsed) *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Domain selection form *}
      <form id="frmProductDomain">
        <input type="hidden" id="frmProductDomainPid" value="{$pid}" />

        {* Container for all domain options *}
        <div class="domain-selection-options">

          {* Option 1: Use domain already in cart *}
          {if $incartdomains}
            <div class="option option-selected">
              <label class="form-check w-100" for="selincart">
                <input type="radio" class="form-check-input" name="domainoption" value="incart" id="selincart" {if $domainoption eq "incart"} checked{/if} />
                <span class="checkmark"></span>
                {$LANG.cartproductdomainuseincart}
              </label>
              {* Dropdown to select from domains in cart *}
              <div class="domain-input-group clearfix" id="domainincart">
                <div class="row small-gutters">
                  <div class="col-sm-10">
                    <div class="domains-row">
                      <select id="incartsld" name="incartdomain" class="form-control">
                        {foreach key=num item=incartdomain from=$incartdomains}
                          <option value="{$incartdomain}">{$incartdomain}</option>
                        {/foreach}
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    {* Use selected domain button *}
                    <button type="submit" class="btn btn-primary btn-block">
                      {$LANG.orderForm.use}
                      {* Arrow right icon *}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/if}

          {* Option 2: Register a new domain *}
          {if $registerdomainenabled}
            <div class="option {if !$incartdomains}option-selected{/if}">
              <label class="form-check w-100" for="selregister">
                <input type="radio" class="form-check-input" name="domainoption" value="register" id="selregister" {if $domainoption eq "register"} checked{/if} />
                <span class="checkmark"></span>
                {$LANG.cartregisterdomainchoice|sprintf2:$companyname}
              </label>
              {* Domain name input fields *}
              <div class="domain-input-group clearfix" id="domainregister">
                <div class="row small-gutters row-gap-2">
                  <div class="col-sm-10">
                    <div class="row small-gutters">
                      {* Domain name input (www. prefix) *}
                      <div class="col-xs-9 col-9">
                        <div class="input-group">
                          <div class="input-group-addon input-group-prepend">
                            <span class="input-group-text">{$LANG.orderForm.www}</span>
                          </div>
                          <input type="text" id="registersld" value="{$sld}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                        </div>
                      </div>
                      {* TLD dropdown (.com, .net, etc.) *}
                      <div class="col-xs-3 col-3">
                        <select id="registertld" class="form-control">
                          {foreach from=$registertlds item=listtld}
                            <option value="{$listtld}" {if $listtld eq $tld} selected="selected" {/if}>{$listtld}</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    {* Check availability button *}
                    <button type="submit" class="btn btn-primary btn-block">
                      {* Search icon *}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
                        <path d="m21 21-4.34-4.34" />
                        <circle cx="11" cy="11" r="8" />
                      </svg>
                      {$LANG.orderForm.check}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/if}

          {* Option 3: Transfer existing domain *}
          {if $transferdomainenabled}
            <div class="option">
              <label class="form-check w-100" for="seltransfer">
                <input type="radio" class="form-check-input" name="domainoption" value="transfer" id="seltransfer" {if $domainoption eq "transfer"} checked{/if} />
                <span class="checkmark"></span>
                {$LANG.carttransferdomainchoice|sprintf2:$companyname}
              </label>
              {* Domain transfer input fields *}
              <div class="domain-input-group clearfix" id="domaintransfer">
                <div class="row small-gutters row-gap-2">
                  <div class="col-sm-10">
                    <div class="row small-gutters">
                      {* Domain name input *}
                      <div class="col-xs-9 col-9">
                        <div class="input-group">
                          <div class="input-group-addon input-group-prepend">
                            <span class="input-group-text">{$LANG.orderForm.www}</span>
                          </div>
                          <input type="text" id="transfersld" value="{$sld}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                        </div>
                      </div>
                      {* TLD dropdown for transfer *}
                      <div class="col-xs-3 col-3">
                        <select id="transfertld" class="form-control">
                          {foreach from=$transfertlds item=listtld}
                            <option value="{$listtld}" {if $listtld eq $tld} selected="selected" {/if}>{$listtld}</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    {* Transfer domain button *}
                    <button type="submit" class="btn btn-primary btn-block">
                      {* Transfer icon (arrows left-right) *}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-right-icon lucide-arrow-left-right">
                        <path d="M8 3 4 7l4 4" />
                        <path d="M4 7h16" />
                        <path d="m16 21 4-4-4-4" />
                        <path d="M20 17H4" />
                      </svg>
                      {$LANG.orderForm.transfer}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/if}

          {* Option 4: Use your own existing domain *}
          {if $owndomainenabled}
            <div class="option">
              <label class="form-check w-100" for="owndomain">
                <input type="radio" class="form-check-input" name="domainoption" value="owndomain" id="selowndomain" {if $domainoption eq "owndomain"} checked{/if} />
                <span class="checkmark"></span>
                {$LANG.cartexistingdomainchoice|sprintf2:$companyname}
              </label>
              {* Own domain input fields *}
              <div class="domain-input-group clearfix" id="domainowndomain">
                <div class="row small-gutters row-gap-2">
                  <div class="col-sm-10">
                    <div class="row small-gutters">
                      {* Domain name input *}
                      <div class="col-xs-9 col-9">
                        <div class="input-group">
                          <div class="input-group-addon input-group-prepend">
                            <span class="input-group-text">{lang key='orderForm.www'}</span>
                          </div>
                          <input type="text" id="owndomainsld" value="{$sld}" placeholder="{lang key='yourdomainplaceholder'}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                        </div>
                      </div>
                      {* TLD text input (user types extension) *}
                      <div class="col-xs-3 col-3">
                        <input type="text" id="owndomaintld" value="{$tld|substr:1}" placeholder="{$LANG.yourtldplaceholder}" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" />
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    {* Use own domain button *}
                    <button type="submit" class="btn btn-primary btn-block" id="useOwnDomain">
                      {$LANG.orderForm.use}
                      {* Arrow right icon *}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/if}

          {* Option 5: Use a subdomain *}
          {if $subdomains}
            <div class="option">
              <label class="form-check w-100" for="selsubdomain">
                <input type="radio" class="form-check-input" name="domainoption" value="subdomain" id="selsubdomain" {if $domainoption eq "subdomain"} checked{/if} />
                <span class="checkmark"></span>
                {$LANG.cartsubdomainchoice|sprintf2:$companyname}
              </label>
              {* Subdomain input fields *}
              <div class="domain-input-group clearfix" id="domainsubdomain">
                <div class="row small-gutters row-gap-2">
                  <div class="col-sm-10">
                    <div class="row small-gutters">
                      {* HTTP prefix *}
                      <div class="col-xs-2 col-2 text-right">
                        <p class="form-control-static">http://</p>
                      </div>
                      {* Subdomain name input *}
                      <div class="col-xs-5 col-5">
                        <input type="text" id="subdomainsld" value="{$sld}" placeholder="yourname" class="form-control" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                      </div>
                      {* Available subdomain options dropdown *}
                      <div class="col-xs-5 col-5">
                        <select id="subdomaintld" class="form-control">
                          {foreach $subdomains as $subid => $subdomain}
                            <option value="{$subid}">{$subdomain}</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    {* Check subdomain button *}
                    <button type="submit" class="btn btn-primary btn-block">
                      {$LANG.orderForm.check}
                      {* Arrow right icon *}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/if}
        </div>

        {* Free domain information (if applicable) *}
        {if $freedomaintlds}
          <p class="text-muted">* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em></p>
        {/if}
      </form>

      {* Domain search results form *}
      <form method="post" action="{$WEB_ROOT}/cart.php?a=add&pid={$pid}&domainselect=1" id="frmProductDomainSelections">

        {* Container for domain search results (initially hidden) *}
        <div id="DomainSearchResults" class="w-hidden">

          {* Search status and primary result display *}
          <div id="searchDomainInfo">
            {* Loading spinner and messages *}
            <p id="primaryLookupSearching" class="domain-lookup-loader domain-lookup-primary-loader domain-searching domain-checker-result-headline">
              <i class="fas fa-spinner fa-spin"></i>
              <span class="domain-lookup-register-loader">{lang key='orderForm.checkingAvailability'}...</span>
              <span class="domain-lookup-transfer-loader">{lang key='orderForm.verifyingTransferEligibility'}...</span>
              <span class="domain-lookup-other-loader">{lang key='orderForm.verifyingDomain'}...</span>
            </p>

            {* Primary domain lookup result container *}
            <div id="primaryLookupResult" class="domain-lookup-result domain-lookup-primary-results w-hidden">
              {* Various result states *}
              <div class="domain-unavailable domain-checker-unavailable headline">{lang key='orderForm.domainIsUnavailable'}</div>
              <div class="domain-available domain-checker-available headline">{$LANG.domainavailablemessage}</div>
              <div class="btn btn-primary domain-contact-support headline">{$LANG.domainContactUs}</div>

              {* Transfer eligibility messages *}
              <div class="transfer-eligible">
                <p class="domain-checker-available headline">{lang key='orderForm.transferEligible'}</p>
                <p>{lang key='orderForm.transferUnlockBeforeContinuing'}</p>
              </div>
              <div class="transfer-not-eligible">
                <p class="domain-checker-unavailable headline">{lang key='orderForm.transferNotEligible'}</p>
                <p>{lang key='orderForm.transferNotRegistered'}</p>
                <p>{lang key='orderForm.trasnferRecentlyRegistered'}</p>
                <p>{lang key='orderForm.transferAlternativelyRegister'}</p>
              </div>

              {* Invalid domain messages *}
              <div class="domain-invalid">
                <p class="domain-checker-unavailable headline">{lang key='orderForm.domainInvalid'}</p>
                <p>
                  {lang key='orderForm.domainLetterOrNumber'}<span class="domain-length-restrictions">{lang key='orderForm.domainLengthRequirements'}</span><br />
                  {lang key='orderForm.domainInvalidCheckEntry'}
                </p>
              </div>

              {* IDN (International Domain Name) language selector *}
              <div id="idnLanguageSelector" class="margin-10 idn-language-selector idn-language w-hidden">
                <div class="row">
                  <div class="col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2 offset-sm-1 offset-lg-2">
                    <div class="margin-10 text-center">
                      {lang key='cart.idnLanguageDescription'}
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-8 col-lg-6 col-sm-offset-2 col-lg-offset-3 offset-sm-2 offset-lg-3">
                    <div class="form-group">
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
              </div>

              {* Domain pricing display *}
              <div class="domain-price">
                <span class="register-price-label">{lang key='orderForm.domainPriceRegisterLabel'}</span>
                <span class="transfer-price-label w-hidden">{lang key='orderForm.domainPriceTransferLabel'}</span>
                <span class="price"></span>
              </div>

              {* Error message display *}
              <p class="domain-error domain-checker-unavailable headline"></p>

              {* Hidden form fields for result data *}
              <input type="hidden" id="resultDomainOption" name="domainoption" />
              <input type="hidden" id="resultDomain" name="domains[]" />
              <input type="hidden" id="resultDomainPricingTerm" />
            </div>
          </div>

          {* Spotlight TLDs section (featured domain extensions) *}
          {if $registerdomainenabled}
            {if $spotlightTlds}
              <div id="spotlightTlds" class="spotlight-tlds clearfix w-hidden">
                <div class="spotlight-tlds-container">
                  {foreach $spotlightTlds as $key => $data}
                    <div class="spotlight-tld-container spotlight-tld-container-{$spotlightTlds|count}">
                      <div id="spotlight{$data.tldNoDots}" class="spotlight-tld">
                        {* TLD group label (if applicable) *}
                        {if $data.group}
                          <div class="spotlight-tld-{$data.group}">{$data.groupDisplayName}</div>
                        {/if}
                        {* TLD extension display *}
                        {$data.tld}

                        {* Loading spinner for this TLD *}
                        <span class="domain-lookup-loader domain-lookup-spotlight-loader">
                          <i class="fas fa-spinner fa-spin"></i>
                        </span>

                        {* Result buttons and pricing for this TLD *}
                        <div class="domain-lookup-result">
                          <button type="button" class="btn unavailable w-hidden" disabled="disabled">
                            {lang key='domainunavailable'}
                          </button>
                          <button type="button" class="btn invalid w-hidden" disabled="disabled">
                            {lang key='domainunavailable'}
                          </button>
                          <span class="available price w-hidden">{$data.register}</span>
                          <button type="button" class="btn btn-light btn-add-to-cart product-domain w-hidden" data-whois="0" data-domain="">
                            <span class="to-add">{lang key='orderForm.add'}</span>
                            <span class="loading">
                              <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                            </span>
                            <span class="added"><i class="far fa-shopping-cart"></i> {lang key='domaincheckeradded'}</span>
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

            {* Suggested domains section *}
            <div class="suggested-domains w-hidden">
              <div class="panel-heading card-header">
                {lang key='orderForm.suggestedDomains'}
              </div>

              {* Loading state for suggestions *}
              <div id="suggestionsLoader" class="card-body panel-body domain-lookup-loader domain-lookup-suggestions-loader">
                <i class="fas fa-spinner fa-spin"></i> {lang key='orderForm.generatingSuggestions'}
              </div>

              {* List of suggested domain alternatives *}
              <div id="domainSuggestions" class="domain-lookup-result list-group w-hidden">
                {* Template for individual domain suggestions *}
                <div class="domain-suggestion list-group-item w-hidden">
                  <span class="domain"></span><span class="extension"></span>
                  <div class="actions">
                    {* Add to cart button for suggestions *}
                    <button type="button" class="btn btn-semi-ghost-info btn-add-to-cart product-domain" data-whois="1" data-domain="">
                      <span class="to-add">{$LANG.addtocart}</span>
                      <span class="loading">
                        <i class="fas fa-spinner fa-spin"></i> {lang key='loading'}
                      </span>
                      <span class="added">{lang key='domaincheckeradded'}</span>
                      <span class="unavailable">{$LANG.domaincheckertaken}</span>
                    </button>
                    <button type="button" class="btn btn-primary domain-contact-support w-hidden">{lang key='domainChecker.contactSupport'}</button>
                    <span class="price"></span>
                    <span class="promo w-hidden"></span>
                  </div>
                </div>
              </div>

              {* More suggestions footer *}
              <div class="panel-footer card-footer more-suggestions text-center w-hidden">
                <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions();return false;">{lang key='domainsmoresuggestions'}</a>
                <span id="noMoreSuggestions" class="no-more small w-hidden">{lang key='domaincheckernomoresuggestions'}</span>
              </div>

              {* Warning about domain suggestions *}
              <div class="text-center text-muted domain-suggestions-warning">
                <p>{lang key='domainssuggestionswarnings'}</p>
              </div>
            </div>
          {/if}
        </div>

        {* Continue button (shown after domain selection) *}
        <div class="text-center">
          <button id="btnDomainContinue" type="submit" class="btn btn-primary w-hidden" disabled="disabled">
            {$LANG.continue}
            {* Arrow right icon *}
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
              <path d="M5 12h14" />
              <path d="m12 5 7 7-7 7" />
            </svg>
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

{* Include recommendations modal template *}
{include file="orderforms/apex_cart/recommendations-modal.tpl"}