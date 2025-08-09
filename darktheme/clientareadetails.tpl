{* Display success message if form submission is successful *}
{if $successful}
  {include file="$template/includes/alert.tpl" type="success" message="{lang key='changessavedsuccessfully'}"}
{/if}

{* Display error message if form submission fails *}
{if $errormessage}
  {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{* Set JavaScript variable if state field is optional *}
{if in_array('state', $optionalFields)}
  <script>
    var stateNotRequired = true;
  </script>
{/if}

{* Include JavaScript for dynamic state dropdown *}
<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

{* Form for updating client details *}
<form method="post" action="?action=details" role="form" autocomplete="off">
  {* Card container for client details section *}
  <div class="mb-10">
    {* card-body *}
    <div>
      {* card-title *}
      <h3 class="card-title">{lang key='clientareanavdetails'}</h3>
      {* row *}
      <div class="row row-gap-4">
        {* col -> firstname *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputFirstName" class="form-label">{lang key='clientareafirstname'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
                  <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
                  <circle cx="12" cy="7" r="4" />
                </svg>
              </div>
              <input type="text" name="firstname" id="inputFirstName" value="{$clientfirstname}" {if in_array('firstname', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        {* col -> lastname *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputLastName" class="form-label">{lang key='clientarealastname'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
                  <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2" />
                  <circle cx="12" cy="7" r="4" />
                </svg>
              </div>
              <input type="text" name="lastname" id="inputLastName" value="{$clientlastname}" {if in_array('lastname', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        {* col -> company name *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputCompanyName" class="form-label">{lang key='clientareacompanyname'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2-icon lucide-building-2">
                  <path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z" />
                  <path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2" />
                  <path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2" />
                  <path d="M10 6h4" />
                  <path d="M10 10h4" />
                  <path d="M10 14h4" />
                  <path d="M10 18h4" />
                </svg>
              </div>
              <input type="text" name="companyname" id="inputCompanyName" value="{$clientcompanyname}" {if in_array('companyname', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        {* col -> email *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputEmail" class="form-label">{lang key='clientareaemail'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                  <path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7" />
                  <rect x="2" y="4" width="20" height="16" rx="2" />
                </svg>
              </div>
              <input type="email" name="email" id="inputEmail" value="{$clientemail}" {if in_array('email', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        {* col -> address1 *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputAddress1" class="form-label">{lang key='clientareaaddress1'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                  <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
                  <circle cx="12" cy="10" r="3"></circle>
                </svg>
              </div>
              <input type="text" name="address1" id="inputAddress1" value="{$clientaddress1}" {if in_array('address1', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        {* col -> address2 *}
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputAddress2" class="form-label">{lang key='clientareaaddress2'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                  <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
                  <circle cx="12" cy="10" r="3"></circle>
                </svg>
              </div>
              <input type="text" name="address2" id="inputAddress2" value="{$clientaddress2}" {if in_array('address2', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputCity" class="form-label">{lang key='clientareacity'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2-icon lucide-building-2">
                  <path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z" />
                  <path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2" />
                  <path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2" />
                  <path d="M10 6h4" />
                  <path d="M10 10h4" />
                  <path d="M10 14h4" />
                  <path d="M10 18h4" />
                </svg>
              </div>
              <input type="text" name="city" id="inputCity" value="{$clientcity}" {if in_array('city', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label for="inputState" class="form-label">{lang key='clientareastate'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-milestone-icon lucide-milestone">
                  <path d="M12 13v8" />
                  <path d="M12 3v3" />
                  <path d="M4 6a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h13a2 2 0 0 0 1.152-.365l3.424-2.317a1 1 0 0 0 0-1.635l-3.424-2.318A2 2 0 0 0 17 6z" />
                </svg>
              </div>
              <input type="text" name="state" id="inputState" value="{$clientstate}" {if in_array('state', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label for="inputPostcode" class="form-label">{lang key='clientareapostcode'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scan-icon lucide-scan">
                  <path d="M3 7V5a2 2 0 0 1 2-2h2"></path>
                  <path d="M17 3h2a2 2 0 0 1 2 2v2"></path>
                  <path d="M21 17v2a2 2 0 0 1-2 2h-2"></path>
                  <path d="M7 21H5a2 2 0 0 1-2-2v-2"></path>
                </svg>
              </div>
              <input type="text" name="postcode" id="inputPostcode" value="{$clientpostcode}" {if in_array('postcode', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label class="form-label" for="country">{lang key='clientareacountry'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-landmark-icon lucide-landmark">
                  <path d="M10 18v-7" />
                  <path d="M11.12 2.198a2 2 0 0 1 1.76.006l7.866 3.847c.476.233.31.949-.22.949H3.474c-.53 0-.695-.716-.22-.949z" />
                  <path d="M14 18v-7" />
                  <path d="M18 18v-7" />
                  <path d="M3 22h18" />
                  <path d="M6 18v-7" />
                </svg>
              </div>
              {$clientcountriesdropdown|replace:'<select':'<select class="form-control custom-country-dropdown"'}
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label for="inputPhone" class="form-label">{lang key='clientareaphonenumber'}</label>
            <input type="tel" name="phonenumber" id="inputPhone" value="{$clientphonenumber}" {if in_array('phonenumber', $uneditablefields)} disabled="disabled" {/if} class="form-control" autocomplete="off" />
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group">
            <label for="inputPaymentMethod" class="form-label">{lang key='paymentmethod'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-pound-sterling-icon lucide-circle-pound-sterling">
                  <path d="M10 16V9.5a1 1 0 0 1 5 0" />
                  <path d="M8 12h4" />
                  <path d="M8 16h7" />
                  <circle cx="12" cy="12" r="10" />
                </svg>
              </div>
              <select name="paymentmethod" id="inputPaymentMethod" class="form-control">
                <option value="none">{lang key='paymentmethoddefault'}</option>
                {foreach $paymentmethods as $method}
                  <option value="{$method.sysname}" {if $method.sysname eq $defaultpaymentmethod} selected="selected" {/if}>{$method.name}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label for="inputBillingContact" class="form-label">{lang key='defaultbillingcontact'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-receipt-text-icon lucide-receipt-text">
                  <path d="M4 2v20l2-1 2 1 2-1 2 1 2-1 2 1 2-1 2 1V2l-2 1-2-1-2 1-2-1-2 1-2-1-2 1Z" />
                  <path d="M14 8H8" />
                  <path d="M16 12H8" />
                  <path d="M13 16H8" />
                </svg>
              </div>
              <select name="billingcid" id="inputBillingContact" class="form-control">
                <option value="0">{lang key='usedefaultcontact'}</option>
                {foreach $contacts as $contact}
                  <option value="{$contact.id}" {if $contact.id eq $billingcid} selected="selected" {/if}>{$contact.name}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="form-group">
            <label for="inputLanguage" class="form-label">{lang key='clientarealanguage'}</label>
            <div class="prepend-icon">
              <div class="form-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-languages-icon lucide-languages">
                  <path d="m5 8 6 6" />
                  <path d="m4 14 6-6 2-3" />
                  <path d="M2 5h12" />
                  <path d="M7 2h1" />
                  <path d="m22 22-5-10-5 10" />
                  <path d="M14 18h6" />
                </svg>
              </div>
              <select name="accountLanguage" id="inputAccountLanguage" class="form-control" {if in_array('language', $uneditablefields)} disabled="disabled" {/if}>
                <option value="">{lang key='default'}</option>
                {foreach $languages as $language}
                  <option value="{$language}" {if $language eq $clientLanguage} selected="selected" {/if}>{$language|ucfirst}</option>
                {/foreach}
              </select>
            </div>
          </div>
        </div>

        {if $showTaxIdField}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputTaxId" class="form-label">{lang key=$taxIdLabel}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                    <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                  </svg>
                </div>
                <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$clientTaxId}" {if in_array('tax_id', $uneditablefields)} disabled="disabled" {/if} autocomplete="off" />
              </div>
            </div>
          </div>
        {/if}

        {if $customfields}
          {foreach $customfields as $customfield}
            <div class="col-md-6">
              <div class="form-group">
                <label class="form-label" for="customfield{$customfield.id}">{$customfield.name}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                      <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
                      <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                  </div>
                  <div class="control">
                    {$customfield.input} {$customfield.description}
                  </div>
                </div>
              </div>
            </div>
          {/foreach}
        {/if}
      </div>
    </div>
  </div>
  {* Card container for email preferences *}
  {if $emailPreferencesEnabled}
    <div class="mb-10">
      <h3 class="card-title">{lang key='clientareacontactsemails'}</h3>
      <div class="row small-gutters row-gap-3">
        {foreach $emailPreferences as $emailType => $value}
          <div class="col-lg-6">
            <label class="form-check">
              <input type="hidden" name="email_preferences[{$emailType}]" value="0">
              <input type="checkbox" class="form-check-input" name="email_preferences[{$emailType}]" id="{$emailType}Emails" value="1" {if $value} checked="checked" {/if} />
              <span class="checkmark"></span>
              {lang key="emailPreferences."|cat:$emailType}
            </label>
          </div>
        {/foreach}
      </div>
    </div>
  {/if}
  {* Card container for marketing email option *}
  {if $showMarketingEmailOptIn}
    <div class="card mb-10">
      <div class="card-body">
        <h3 class="card-title">{lang key='emailMarketing.joinOurMailingList'}</h3>
        <p class="text-sm color-foreground mb-4">{$marketingEmailOptInMessage}</p>
        <input type="checkbox" name="marketingoptin" value="1" {if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success form-check-input" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
      </div>
    </div>
  {/if}
  <div class="form-group d-flex flex-wrap col-gap-2 justify-content-end">
    <input class="btn btn-ghost-light" type="reset" value="{lang key='cancel'}" />
    <input class="btn btn-primary" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
  </div>
</form>