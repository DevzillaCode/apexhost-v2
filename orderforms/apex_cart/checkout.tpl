<script>
  // Define state tab index value
  var statesTab = 10;
  // Do not enforce state input client side
  var stateNotRequired = true;
</script>
{include file="orderforms/apex_cart/common.tpl"}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
  window.langPasswordStrength = "{$LANG.pwstrength}";
  window.langPasswordWeak = "{$LANG.pwstrengthweak}";
  window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
  window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
</script>
<div id="order-apex_cart">

  <div class="row">
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>
    <div class="cart-body">

      <!-- Page header with title and tagline -->
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='orderForm.checkout'}" tagline="{lang key='orderForm.enterPersonalDetails'}" }

      {* Sidebar *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Already registered *}
      <div class="already-registered clearfix">
        <div class="pull-right float-right">
          <button type="button" class="btn btn-semi-ghost-info{if $loggedin || !$loggedin && $custtype eq "existing"} w-hidden{/if}" id="btnAlreadyRegistered">
            {$LANG.orderForm.alreadyRegistered}
          </button>
          <button type="button" class="btn btn-semi-ghost-warning{if $loggedin || $custtype neq "existing"} w-hidden{/if}" id="btnNewUserSignup">
            {$LANG.orderForm.createAccount}
          </button>
        </div>

      </div>

      {* Error messages *}
      {if $errormessage}
        <div class="alert alert-danger checkout-error-feedback" role="alert">
          <div>
            <p>{$LANG.orderForm.correctErrors}:</p>
            <ul>
              {$errormessage}
            </ul>
          </div>
        </div>
        <div class="clearfix"></div>
      {/if}

      <form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" name="orderfrm" id="frmCheckout">
        <input type="hidden" name="checkout" value="true" />
        <input type="hidden" name="custtype" id="inputCustType" value="{$custtype}" />

        {if $custtype neq "new" && $loggedin}
          <div class="sub-heading">
            <span class="primary-bg-color">
              {lang key='switchAccount.title'}
            </span>
          </div>
          <div id="containerExistingAccountSelect" class="row account-select-container">
            {foreach $accounts as $account}
              <div class="col-sm-{if $accounts->count() == 1}12{else}6{/if}">
                <div class="account{if $selectedAccountId == $account->id} active{/if}">
                  <label class="form-check" for="account{$account->id}">
                    <input id="account{$account->id}" class="form-check-input account-select{if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled{/if}" type="radio" name="account_id" value="{$account->id}" {if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled="disabled" {/if}{if $selectedAccountId == $account->id} checked="checked" {/if}>
                    <span class="address">
                      <strong>
                        {if $account->company}{$account->company}{else}{$account->fullName}{/if}
                      </strong>
                      {if $account->isClosed || $account->noPermission}
                        <span class="label label-default">
                          {if $account->isClosed}
                            {lang key='closed'}
                          {else}
                            {lang key='noPermission'}
                          {/if}
                        </span>
                      {elseif $account->currencyCode}
                        <span class="label label-info">
                          {$account->currencyCode}
                        </span>
                      {/if}
                      <br>
                      <span class="small">
                        {$account->address1}{if $account->address2}, {$account->address2}{/if}<br>
                        {if $account->city}{$account->city},{/if}
                        {if $account->state} {$account->state},{/if}
                        {if $account->postcode} {$account->postcode},{/if}
                        {$account->countryName}
                      </span>
                    </span>
                  </label>
                </div>
              </div>
            {/foreach}
            <div class="col-sm-12">
              <div class="account{if !$selectedAccountId || !is_numeric($selectedAccountId)} active{/if}">
                <label class="form-check">
                  <input class="form-check-input account-select" type="radio" name="account_id" value="new" {if !$selectedAccountId || !is_numeric($selectedAccountId)} checked="checked" {/if}{if $inExpressCheckout} disabled="disabled" class="disabled" {/if}>
                  {lang key='orderForm.createAccount'}
                </label>
              </div>
            </div>
          </div>
        {/if}

        <div id="containerExistingUserSignin" {if $loggedin || $custtype neq "existing"} class="w-hidden{/if}">
          <div class="sub-heading">
            <span class="primary-bg-color">{$LANG.orderForm.existingCustomerLogin}</span>
          </div>

          <div class="alert alert-danger w-hidden" id="existingLoginMessage">
          </div>

          <div class="row mb-4">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputLoginEmail" class="form-label">{lang key="orderForm.emailAddress"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                      <rect width="20" height="16" x="2" y="4" rx="2"></rect>
                      <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
                    </svg>
                  </div>
                  <input type="text" name="loginemail" id="inputLoginEmail" class="form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$loginemail}">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputLoginPassword" class="form-label">{lang key="clientareapassword"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                      <rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect>
                      <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                  </div>
                  <input type="password" name="loginpassword" id="inputLoginPassword" class="form-control" placeholder="{$LANG.clientareapassword}">
                </div>
              </div>
            </div>
          </div>

          <div class="text-center">
            <button type="button" id="btnExistingLogin" class="btn btn-primary btn-wide">
              <span id="existingLoginButton">{lang key='login'}</span>
              <span id="existingLoginPleaseWait" class="w-hidden">{lang key='pleasewait'}</span>
            </button>
          </div>

          {include file="orderforms/apex_cart/linkedaccounts.tpl" linkContext="checkout-existing"}
        </div>
        <div id="containerNewUserSignup" {if $custtype === 'existing' || (is_numeric($selectedAccountId) && $selectedAccountId > 0) || ( $loggedin && $selectedAccountId !== 'new' && $custtype !== 'add')} class="w-hidden" {/if}>
          <div {if $loggedin} class="w-hidden" {/if}>{include file="orderforms/apex_cart/linkedaccounts.tpl" linkContext="checkout-new"}
          </div>

          <div class="sub-heading">
            <span class="primary-bg-color">{$LANG.orderForm.personalInformation}</span>
          </div>

          <div class="row row-gap-4">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputFirstName" class="form-label">{lang key="orderForm.firstName"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
                      <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                      <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                  </div>
                  <input type="text" name="firstname" id="inputFirstName" class="form-control" placeholder="{$LANG.orderForm.firstName}" value="{$clientsdetails.firstname}" autofocus autocomplete="off">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputLastName" class="form-label">{lang key="orderForm.lastName"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
                      <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                      <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                  </div>
                  <input type="text" name="lastname" id="inputLastName" class="form-control" placeholder="{$LANG.orderForm.lastName}" value="{$clientsdetails.lastname}" autocomplete="off">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputEmail" class="form-label">{lang key="orderForm.emailAddress"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                      <rect width="20" height="16" x="2" y="4" rx="2"></rect>
                      <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
                    </svg>
                  </div>
                  <input type="email" name="email" id="inputEmail" class="form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$clientsdetails.email}" autocomplete="off">
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputPhone" class="form-label">{lang key="orderForm.phoneNumber"}</label>
                <input type="tel" name="phonenumber" id="inputPhone" class="form-control" placeholder="{$LANG.orderForm.phoneNumber}" value="{$clientsdetails.phonenumber}" autocomplete="off">
              </div>
            </div>
          </div>

          <div class="sub-heading">
            <span class="primary-bg-color">{$LANG.orderForm.billingAddress}</span>
          </div>

          <div class="row row-gap-4">
            <div class="col-sm-12">
              <div class="form-group">
                <label for="inputCompanyName" class="form-label">{lang key="orderForm.companyName"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building-icon lucide-building">
                      <rect width="16" height="20" x="4" y="2" rx="2" ry="2"></rect>
                      <path d="M9 22v-4h6v4"></path>
                      <path d="M8 6h.01"></path>
                      <path d="M16 6h.01"></path>
                      <path d="M12 6h.01"></path>
                      <path d="M12 10h.01"></path>
                      <path d="M12 14h.01"></path>
                      <path d="M16 14h.01"></path>
                      <path d="M8 14h.01"></path>
                      <path d="M8 10h.01"></path>
                      <path d="M16 10h.01"></path>
                    </svg>
                  </div>
                  <input type="text" name="companyname" id="inputCompanyName" class="form-control" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$clientsdetails.companyname}">
                </div>
              </div>
            </div>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="inputAddress1" class="form-label">{lang key="orderForm.streetAddress"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building-icon lucide-building">
                      <rect width="16" height="20" x="4" y="2" rx="2" ry="2"></rect>
                      <path d="M9 22v-4h6v4"></path>
                      <path d="M8 6h.01"></path>
                      <path d="M16 6h.01"></path>
                      <path d="M12 6h.01"></path>
                      <path d="M12 10h.01"></path>
                      <path d="M12 14h.01"></path>
                      <path d="M16 14h.01"></path>
                      <path d="M8 14h.01"></path>
                      <path d="M8 10h.01"></path>
                      <path d="M16 10h.01"></path>
                    </svg>
                  </div>
                  <input type="text" name="address1" id="inputAddress1" class="form-control" placeholder="{$LANG.orderForm.streetAddress}" value="{$clientsdetails.address1}">
                </div>
              </div>
            </div>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="inputAddress2" class="form-label">{lang key="orderForm.streetAddress2"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                      <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path>
                      <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                  </div>
                  <input type="text" name="address2" id="inputAddress2" class="form-control" placeholder="{$LANG.orderForm.streetAddress2}" value="{$clientsdetails.address2}">
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label for="inputCity" class="form-label">{lang key="orderForm.city"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building-icon lucide-building">
                      <rect width="16" height="20" x="4" y="2" rx="2" ry="2"></rect>
                      <path d="M9 22v-4h6v4"></path>
                      <path d="M8 6h.01"></path>
                      <path d="M16 6h.01"></path>
                      <path d="M12 6h.01"></path>
                      <path d="M12 10h.01"></path>
                      <path d="M12 14h.01"></path>
                      <path d="M16 14h.01"></path>
                      <path d="M8 14h.01"></path>
                      <path d="M8 10h.01"></path>
                      <path d="M16 10h.01"></path>
                    </svg>
                  </div>
                  <input type="text" name="city" id="inputCity" class="form-control" placeholder="{$LANG.orderForm.city}" value="{$clientsdetails.city}">
                </div>
              </div>
            </div>
            <div class="col-sm-5">
              <div class="form-group">
                <label for="inputState" class="form-label">{lang key="orderForm.state"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-icon lucide-map">
                      <path d="M14.5 3.5V2a1 1 0 0 0-1-1h-3a1 1 0 0 0-1 1v1.5"></path>
                      <path d="M3 6v12a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6"></path>
                      <path d="M3 6l7-3 7 3"></path>
                    </svg>
                  </div>
                  <input type="text" name="state" id="inputState" class="form-control" placeholder="{$LANG.orderForm.state}" value="{$clientsdetails.state}">
                </div>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label for="inputPostcode" class="form-label">{lang key="orderForm.postcode"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                      <rect width="20" height="16" x="2" y="4" rx="2"></rect>
                      <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
                    </svg>
                  </div>
                  <input type="text" name="postcode" id="inputPostcode" class="form-control" placeholder="{$LANG.orderForm.postcode}" value="{$clientsdetails.postcode}">
                </div>
              </div>
            </div>
            <div class="col-sm-12">
              <div class="form-group">
                <label for="inputCountry" class="form-label">{lang key="orderForm.country"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
                      <circle cx="12" cy="12" r="10"></circle>
                      <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"></path>
                      <path d="M2 12h20"></path>
                    </svg>
                  </div>
                  <select name="country" id="inputCountry" class="form-control">
                    {foreach $countries as $countrycode => $countrylabel}
                      <option value="{$countrycode}" {if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
                        {$countrylabel}
                      </option>
                    {/foreach}
                  </select>
                </div>
              </div>
            </div>
            {if $showTaxIdField}
              <div class="col-sm-12">
                <div class="form-group">
                  <label for="inputTaxId" class="form-label">{lang key="tax.vatLabel"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building-icon lucide-building">
                        <rect width="16" height="20" x="4" y="2" rx="2" ry="2"></rect>
                        <path d="M9 22v-4h6v4"></path>
                        <path d="M8 6h.01"></path>
                        <path d="M16 6h.01"></path>
                        <path d="M12 6h.01"></path>
                        <path d="M12 10h.01"></path>
                        <path d="M12 14h.01"></path>
                        <path d="M16 14h.01"></path>
                        <path d="M8 14h.01"></path>
                        <path d="M8 10h.01"></path>
                        <path d="M16 10h.01"></path>
                      </svg>
                    </div>
                    <input type="text" name="tax_id" id="inputTaxId" class="form-control" placeholder="{$taxLabel} ({$LANG.orderForm.optional})" value="{$clientsdetails.tax_id}">
                  </div>
                </div>
              </div>
            {/if}
          </div>

          {if $customfields}
            <div class="sub-heading">
              <span class="primary-bg-color">{$LANG.orderadditionalrequiredinfo}<br><i><small>{lang key='orderForm.requiredField'}</small></i></span>
            </div>
            <div class="field-container">
              <div class="row">
                {foreach $customfields as $customfield}
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="customfield{$customfield.id}" class="form-label">{$customfield.name} {$customfield.required}</label>
                      <div class="prepend-icon">
                        <div class="form-float-icon">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-edit-icon lucide-edit">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                          </svg>
                        </div>
                        {$customfield.input}
                      </div>
                      {if $customfield.description}
                        <span class="field-help-text">
                          {$customfield.description}
                        </span>
                      {/if}
                    </div>
                  </div>
                {/foreach}
              </div>
            </div>
          {/if}

        </div>

        {if $domainsinorder}

          <div class="sub-heading">
            <span class="primary-bg-color">{$LANG.domainregistrantinfo}</span>
          </div>

          <p class="small text-muted mb-4">{$LANG.orderForm.domainAlternativeContact}</p>

          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label for="inputDomainContact" class="form-label">{lang key="contact"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-contact-icon lucide-contact">
                      <path d="M17 18a2 2 0 0 0-2-2H9a2 2 0 0 0-2 2"></path>
                      <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                      <circle cx="12" cy="10" r="2"></circle>
                      <line x1="8" x2="8" y1="2" y2="4"></line>
                      <line x1="16" x2="16" y1="2" y2="4"></line>
                    </svg>
                  </div>
                  <select name="contact" id="inputDomainContact" class="form-control">
                    <option value="">{$LANG.usedefaultcontact}</option>
                    {foreach $domaincontacts as $domcontact}
                      <option value="{$domcontact.id}" {if $contact == $domcontact.id} selected{/if}>
                        {$domcontact.name}
                      </option>
                    {/foreach}
                    <option value="addingnew" {if $contact == "addingnew"} selected{/if}>
                      {$LANG.clientareanavaddcontact}...
                    </option>
                  </select>
                </div>
              </div>
            </div>
          </div>

          <div {if $contact neq "addingnew"} class="w-hidden" {/if}>
            <div class="row" id="domainRegistrantInputFields">
              <div class="col-sm-6">
                <div class="form-group prepend-icon">
                  <label for="inputDCFirstName" class="field-icon">
                    <i class="fas fa-user"></i>
                  </label>
                  <input type="text" name="domaincontactfirstname" id="inputDCFirstName" class="form-control" placeholder="{$LANG.orderForm.firstName}" value="{$domaincontact.firstname}">
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group prepend-icon">
                  <label for="inputDCLastName" class="field-icon">
                    <i class="fas fa-user"></i>
                  </label>
                  <input type="text" name="domaincontactlastname" id="inputDCLastName" class="form-control" placeholder="{$LANG.orderForm.lastName}" value="{$domaincontact.lastname}">
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group prepend-icon">
                  <label for="inputDCEmail" class="field-icon">
                    <i class="fas fa-envelope"></i>
                  </label>
                  <input type="email" name="domaincontactemail" id="inputDCEmail" class="form-control" placeholder="{$LANG.orderForm.emailAddress}" value="{$domaincontact.email}">
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group prepend-icon">
                  <label for="inputDCPhone" class="field-icon">
                    <i class="fas fa-phone"></i>
                  </label>
                  <input type="tel" name="domaincontactphonenumber" id="inputDCPhone" class="form-control" placeholder="{$LANG.orderForm.phoneNumber}" value="{$domaincontact.phonenumber}">
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group prepend-icon">
                  <label for="inputDCCompanyName" class="field-icon">
                    <i class="fas fa-building"></i>
                  </label>
                  <input type="text" name="domaincontactcompanyname" id="inputDCCompanyName" class="form-control" placeholder="{$LANG.orderForm.companyName} ({$LANG.orderForm.optional})" value="{$domaincontact.companyname}">
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group prepend-icon">
                  <label for="inputDCAddress1" class="field-icon">
                    <i class="far fa-building"></i>
                  </label>
                  <input type="text" name="domaincontactaddress1" id="inputDCAddress1" class="form-control" placeholder="{$LANG.orderForm.streetAddress}" value="{$domaincontact.address1}">
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group prepend-icon">
                  <label for="inputDCAddress2" class="field-icon">
                    <i class="fas fa-map-marker-alt"></i>
                  </label>
                  <input type="text" name="domaincontactaddress2" id="inputDCAddress2" class="form-control" placeholder="{$LANG.orderForm.streetAddress2}" value="{$domaincontact.address2}">
                </div>
              </div>
              <div class="col-sm-4">
                <div class="form-group prepend-icon">
                  <label for="inputDCCity" class="field-icon">
                    <i class="far fa-building"></i>
                  </label>
                  <input type="text" name="domaincontactcity" id="inputDCCity" class="form-control" placeholder="{$LANG.orderForm.city}" value="{$domaincontact.city}">
                </div>
              </div>
              <div class="col-sm-5">
                <div class="form-group prepend-icon">
                  <label for="inputDCState" class="field-icon">
                    <i class="fas fa-map-signs"></i>
                  </label>
                  <input type="text" name="domaincontactstate" id="inputDCState" class="form-control" placeholder="{$LANG.orderForm.state}" value="{$domaincontact.state}">
                </div>
              </div>
              <div class="col-sm-3">
                <div class="form-group prepend-icon">
                  <label for="inputDCPostcode" class="field-icon">
                    <i class="fas fa-certificate"></i>
                  </label>
                  <input type="text" name="domaincontactpostcode" id="inputDCPostcode" class="form-control" placeholder="{$LANG.orderForm.postcode}" value="{$domaincontact.postcode}">
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group prepend-icon">
                  <label for="inputDCCountry" class="field-icon" id="inputCountryIcon">
                    <i class="fas fa-globe"></i>
                  </label>
                  <select name="domaincontactcountry" id="inputDCCountry" class="form-control">
                    {foreach $countries as $countrycode => $countrylabel}
                      <option value="{$countrycode}" {if (!$domaincontact.country && $countrycode == $defaultcountry) || $countrycode eq $domaincontact.country} selected{/if}>
                        {$countrylabel}
                      </option>
                    {/foreach}
                  </select>
                </div>
              </div>
              <div class="col-sm-12">
                <div class="form-group prepend-icon">
                  <label for="inputDCTaxId" class="field-icon">
                    <i class="fas fa-building"></i>
                  </label>
                  <input type="text" name="domaincontacttax_id" id="inputDCTaxId" class="form-control" placeholder="{$taxLabel} ({$LANG.orderForm.optional})" value="{$domaincontact.tax_id}">
                </div>
              </div>
            </div>
          </div>

        {/if}

        {if !$loggedin}

          <div id="containerNewUserSecurity" {if (!$loggedin && $custtype eq "existing") || ($remote_auth_prelinked && !$securityquestions)} class="w-hidden" {/if}>

            <div class="sub-heading">
              <span class="primary-bg-color">{$LANG.orderForm.accountSecurity}</span>
            </div>

            <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} w-hidden{/if} row-gap-4">
              <div id="passwdFeedback" class="alert alert-info text-center col-sm-12 w-hidden"></div>
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="inputNewPassword1" class="form-label">{lang key="clientareapassword"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                      </svg>
                    </div>
                    <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="form-control" placeholder="{$LANG.clientareapassword}" {if $remote_auth_prelinked} value="{$password}" {/if}>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="inputNewPassword2" class="form-label">{lang key="clientareaconfirmpassword"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                        <rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                      </svg>
                    </div>
                    <input type="password" name="password2" id="inputNewPassword2" class="form-control" placeholder="{$LANG.clientareaconfirmpassword}" {if $remote_auth_prelinked} value="{$password}" {/if}>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <button type="button" class="btn btn-light btn-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                  {$LANG.generatePassword.btnLabel}
                </button>
              </div>
              <div class="col-sm-6">
                <div class="password-strength-meter">
                  <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                    </div>
                  </div>
                  <p class="text-center small text-muted" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
                </div>
              </div>
            </div>
            {if $securityquestions}
              <div class="row row-gap-4">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="inputSecurityQId" class="form-label">{lang key="clientareasecurityquestion"}</label>
                    <div class="prepend-icon">
                      <div class="form-float-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-help-circle-icon lucide-help-circle">
                          <circle cx="12" cy="12" r="10"></circle>
                          <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                          <path d="M12 17h.01"></path>
                        </svg>
                      </div>
                      <select name="securityqid" id="inputSecurityQId" class="form-control">
                        <option value="">{$LANG.clientareasecurityquestion}</option>
                        {foreach $securityquestions as $question}
                          <option value="{$question.id}" {if $question.id eq $securityqid} selected{/if}>
                            {$question.question}
                          </option>
                        {/foreach}
                      </select>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="inputSecurityQAns" class="form-label">{lang key="clientareasecurityanswer"}</label>
                    <div class="prepend-icon">
                      <div class="form-float-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                          <rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect>
                          <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                      </div>
                      <input type="password" name="securityqans" id="inputSecurityQAns" class="form-control" placeholder="{$LANG.clientareasecurityanswer}">
                    </div>
                  </div>
                </div>
              </div>
            {/if}

          </div>

        {/if}

        {foreach $hookOutput as $output}
          <div>
            {$output}
          </div>
        {/foreach}

        {if $captcha && $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
          {if !$captcha->isInvisible()}
            <div class="sub-heading">
              <span class="primary-bg-color">{$LANG.captchatitle}</span>
            </div>
          {/if}
          <div class="text-center">
            <div class="text-center margin-bottom">
              {include file="$template/includes/captcha.tpl"}
            </div>
          </div>
        {/if}

        <div class="sub-heading">
          <span class="primary-bg-color">{$LANG.orderForm.paymentDetails}</span>
        </div>

        <div class="alert alert-success large-text" role="alert" id="totalDueToday">
          <div>{$LANG.ordertotalduetoday}: &nbsp; <strong id="totalCartPrice">{$total}</strong></div>
        </div>

        <div id="applyCreditContainer" class="apply-credit-container{if !$canUseCreditOnCheckout} w-hidden{/if}" data-apply-credit="{$applyCredit}">
          <p>{lang key='cart.availableCreditBalance' amount=$creditBalance}</p>

          <label class="radio">
            <input id="useCreditOnCheckout" type="radio" name="applycredit" value="1" {if $applyCredit} checked{/if}>
            <span id="spanFullCredit" {if !($creditBalance->toNumeric() >= $total->toNumeric())} class="w-hidden" {/if}>
              {lang key='cart.applyCreditAmountNoFurtherPayment' amount=$total}
            </span>
            <span id="spanUseCredit" {if $creditBalance->toNumeric() >= $total->toNumeric()} class="w-hidden" {/if}>
              {lang key='cart.applyCreditAmount' amount=$creditBalance}
            </span>
          </label>
          <label class="radio">
            <input id="skipCreditOnCheckout" type="radio" name="applycredit" value="0" {if !$applyCredit} checked{/if}>
            {lang key='cart.applyCreditSkip' amount=$creditBalance}
          </label>
        </div>

        {if !$inExpressCheckout}
          <div id="paymentGatewaysContainer" class="form-group">
            <p class="small text-muted mb-4">{$LANG.orderForm.preferredPaymentMethod}</p>

            <div class="d-flex gap-4 flex-wrap mb-4">
              {foreach $gateways as $gateway}
                <label class="form-check">
                  <input type="radio" name="paymentmethod" value="{$gateway.sysname}" data-payment-type="{$gateway.payment_type}" data-show-local="{$gateway.show_local_cards}" data-remote-inputs="{$gateway.uses_remote_inputs}" class="form-check-input payment-methods{if $gateway.type eq "CC"} is-credit-card{/if}" {if $selectedgateway eq $gateway.sysname} checked{/if} />
                  {$gateway.name}
                </label>
              {/foreach}
            </div>
          </div>

          <div class="alert alert-danger gateway-errors w-hidden"></div>

          <div class="clearfix"></div>

          <div id="paymentGatewayInput"></div>

          <div class="cc-input-container{if $selectedgatewaytype neq "CC"} w-hidden{/if}" id="creditCardInputFields">
            {if $client}
              <div id="existingCardsContainer" class="existing-cc-grid">
                {include file="orderforms/apex_cart/includes/existing-paymethods.tpl"}
              </div>
            {/if}
            <div class="row cvv-input row-gap-4" id="existingCardInfo">
              <div class="col-lg-3 col-sm-4">
                <div class="form-group prepend-icon">
                  <label for="inputCardCVV2" class="field-icon">
                    <i class="fas fa-barcode"></i>
                  </label>
                  <div class="input-group">
                    <input type="tel" name="cccvv" id="inputCardCVV2" class="form-control" placeholder="{$LANG.creditcardcvvnumbershort}" autocomplete="cc-cvc">
                    <span class="input-group-btn input-group-append">
                      <button type="button" class="btn btn-light" data-toggle="popover" data-placement="bottom" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                        ?
                      </button>
                    </span>
                  </div>
                  <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                </div>
              </div>
            </div>

            <ul class="mb-4">
              <li>
                <label class="form-check">
                  <input type="radio" class="form-check-input" name="ccinfo" value="new" id="new" {if !$client || $client->payMethods->count() === 0} checked="checked" {/if} />
                  {lang key='creditcardenternewcard'}
                </label>
              </li>
            </ul>

            {* !!WORKSPACE!! *}
            <div class="row" id="newCardInfo">
              <div id="cardNumberContainer" class="col-sm-6 new-card-container">
                <div class="form-group">
                  <label for="inputCardNumber" class="form-label">{lang key="orderForm.cardNumber"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-credit-card-icon lucide-credit-card">
                        <rect width="20" height="14" x="2" y="5" rx="2"></rect>
                        <line x1="2" x2="22" y1="10" y2="10"></line>
                      </svg>
                    </div>
                    <input type="tel" name="ccnumber" id="inputCardNumber" class="form-control cc-number-field" placeholder="{$LANG.orderForm.cardNumber}" autocomplete="cc-number" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}" />
                    <span class="field-error-msg"></span>
                  </div>
                </div>
              </div>
              <div class="col-sm-3 new-card-container">
                <div class="form-group">
                  <label for="inputCardExpiry" class="form-label">{lang key="creditcardcardexpires"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon lucide-calendar">
                        <rect width="18" height="18" x="3" y="4" rx="2" ry="2"></rect>
                        <line x1="16" x2="16" y1="2" y2="6"></line>
                        <line x1="8" x2="8" y1="2" y2="6"></line>
                        <line x1="3" x2="21" y1="10" y2="10"></line>
                      </svg>
                    </div>
                    <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="form-control" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
                    <span class="field-error-msg">{lang key="paymentMethodsManage.expiryDateNotValid"}</span>
                  </div>
                </div>
              </div>
              <div class="col-sm-3" id="cvv-field-container">
                <div class="form-group">
                  <label for="inputCardCVV" class="form-label">{lang key="creditcardcvvnumbershort"}</label>
                  <div class="prepend-icon">
                    <div class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-hash-icon lucide-hash">
                        <line x1="4" x2="20" y1="9" y2="9"></line>
                        <line x1="4" x2="20" y1="15" y2="15"></line>
                        <line x1="10" x2="8" y1="3" y2="21"></line>
                        <line x1="16" x2="14" y1="3" y2="21"></line>
                      </svg>
                    </div>
                    <div class="input-group">
                      <input type="tel" name="cccvv" id="inputCardCVV" class="form-control" placeholder="{$LANG.creditcardcvvnumbershort}" autocomplete="cc-cvc">
                      <span class="input-group-btn input-group-append">
                        <button type="button" class="btn btn-light" data-toggle="popover" data-placement="bottom" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                          ?
                        </button>
                      </span>
                    </div>
                    <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                  </div>
                </div>
              </div>
              {if $showccissuestart}
                <div class="col-sm-3 col-sm-offset-6 new-card-container offset-sm-6">
                  <div class="form-group">
                    <label for="inputCardStart" class="form-label">{lang key="creditcardcardstart"}</label>
                    <div class="prepend-icon">
                      <div class="form-float-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon lucide-calendar">
                          <rect width="18" height="18" x="3" y="4" rx="2" ry="2"></rect>
                          <line x1="16" x2="16" y1="2" y2="6"></line>
                          <line x1="8" x2="8" y1="2" y2="6"></line>
                          <line x1="3" x2="21" y1="10" y2="10"></line>
                        </svg>
                      </div>
                      <input type="tel" name="ccstartdate" id="inputCardStart" class="form-control" placeholder="MM / YY ({$LANG.creditcardcardstart})" autocomplete="cc-exp">
                    </div>
                  </div>
                </div>
                <div class="col-sm-3 new-card-container">
                  <div class="form-group">
                    <label for="inputCardIssue" class="form-label">{lang key="creditcardcardissuenum"}</label>
                    <div class="prepend-icon">
                      <div class="form-float-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-asterisk-icon lucide-asterisk">
                          <path d="M12 6v12"></path>
                          <path d="M17.196 9 6.804 15"></path>
                          <path d="M6.804 9l10.392 6"></path>
                        </svg>
                      </div>
                      <input type="tel" name="ccissuenum" id="inputCardIssue" class="form-control" placeholder="{$LANG.creditcardcardissuenum}">
                    </div>
                  </div>
                </div>
              {/if}
            </div>
            {* !!WORKSPACE!! *}
            <div id="newCardSaveSettings">
              <div class="row new-card-container">
                <div id="inputDescriptionContainer" class="col-md-6">
                  <div class="form-group">
                    <label for="inputDescription" class="form-label">{lang key="paymentMethods.descriptionInput"}</label>
                    <div class="prepend-icon">
                      <div class="form-float-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-edit-icon lucide-edit">
                          <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                          <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                      </div>
                      <input type="text" class="form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" placeholder="{$LANG.paymentMethods.descriptionInput} {$LANG.paymentMethodsManage.optional}" />
                    </div>
                  </div>
                </div>
                {if $allowClientsToRemoveCards}
                  <div id="inputNoStoreContainer" class="col-md-6" style="line-height: 32px;">
                    <div class="form-group">
                      <label for="inputNoStore" class="form-label">{lang key="creditCardStore"}</label>
                      <div class="prepend-icon">
                        <div class="form-float-icon">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-edit-icon lucide-edit">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                          </svg>
                        </div>
                        <input type="hidden" name="nostore" value="1">
                        <input type="checkbox" class="toggle-switch-success no-icheck" data-size="mini" checked="checked" name="nostore" id="inputNoStore" value="0" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                        <label for="inputNoStore" class="checkbox-inline no-padding">
                          &nbsp;&nbsp;
                          {$LANG.creditCardStore}
                        </label>
                      </div>
                    </div>
                  </div>
                {/if}
              </div>
            </div>
          </div>
        {else}
          {if $expressCheckoutOutput}
            {$expressCheckoutOutput}
          {else}
            <p align="center">
              {lang key='paymentPreApproved' gateway=$expressCheckoutGateway}
            </p>
          {/if}
        {/if}

        {if $shownotesfield}

          <div class="sub-heading">
            <span class="primary-bg-color">{$LANG.orderForm.additionalNotes}</span>
          </div>

          <div class="row mb-4">
            <div class="col-sm-12">
              <div class="form-group">
                <label for="notes" class="form-label">{lang key="ordernotesdescription"}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-edit-icon lucide-edit">
                      <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                      <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                    </svg>
                  </div>
                  <textarea name="notes" class="form-control" rows="4" placeholder="{$LANG.ordernotesdescription}">{$orderNotes}</textarea>
                </div>
              </div>
            </div>
          </div>

        {/if}

        {if $showMarketingEmailOptIn}
          <div class="card mb-4">
            <div class="card-body p-4">
              <h3 class="title-5 mb-4">{lang key='emailMarketing.joinOurMailingList'}</h3>
              <p class="text-sm color-foreground mb-4">{$marketingEmailOptInMessage}</p>
              <input type="checkbox" name="marketingoptin" value="1" {if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
            </div>
          </div>
        {/if}
        {* Terms of service agreement *}
        {if $accepttos}
          <div class="mt-6">
            <label class="form-check" for="accepttos">
              <input type="checkbox" id="accepttos" name="accepttos" class="form-check-input accepttos">
              <span class="checkmark"></span>
              {lang key='ordertosagreement'} <a href="{$tosurl}" class="theme-link" target="_blank">{lang key='ordertos'}</a>
            </label>
          </div>
        {/if}

        {* page-footer *}
        <div class="page-footer">
          <div class="row">
            <div class="col-xl-2 col-lg-3 col-md-3 ml-auto">
              <button type="submit" id="btnCompleteOrder" class="btn btn-primary btn-wide btn-block disable-on-click spinner-on-click{if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}" {if $cartitems==0}disabled="disabled" {/if}>
                {if $inExpressCheckout}{$LANG.confirmAndPay}{else}{$LANG.completeorder}{/if}
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                  <path d="M5 12h14" />
                  <path d="m12 5 7 7-7 7" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </form>

      {if $servedOverSsl}
        <div class="alert alert-warning checkout-security-msg">
          <div>
            <i class="fas fa-lock"></i>
            {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
            <div class="clearfix"></div>
          </div>
        </div>
      {/if}
    </div>
  </div>
</div>

<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
<script>
  var hideCvcOnCheckoutForExistingCard = '{if $canUseCreditOnCheckout && $applyCredit && ($creditBalance->toNumeric() >= $total->toNumeric())}1{else}0{/if}';
</script>
{include file="orderforms/apex_cart/recommendations-modal.tpl"}