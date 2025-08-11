{* Set asset path for template images *}
{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}
{* Check if state field is optional *}
{if in_array('state', $optionalFields)}
  <script>
    var statesTab = 10,
      stateNotRequired = true;
  </script>
{/if}

{* Load required JavaScript files *}
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
  {* Set password strength language strings *}
  window.langPasswordStrength = "{lang key='pwstrength'}";
  window.langPasswordWeak = "{lang key='pwstrengthweak'}";
  window.langPasswordModerate = "{lang key='pwstrengthmoderate'}";
  window.langPasswordStrong = "{lang key='pwstrengthstrong'}";
  jQuery(document).ready(function() {
    jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
  });
</script>

{* Main registration container *}
<div class="auth-page hide-labels">
  <div class="content d-flex align-items-center justify-content-center flex-column w-100">
    {* Show message if registration is disabled *}
    {if $registrationDisabled}
      {include file="$template/includes/alert.tpl" type="error" message="{lang key='registerCreateAccount'}"|cat:' <strong><a href="'|cat:" $WEB_ROOT"|cat:'/cart.php" class="alert-link">'|cat:"{lang key='registerCreateAccountOrder'}"|cat:'</a></strong>'}
    {/if}

    {* Show error message if exists *}
    {if $errormessage}
      {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    {* Registration form *}
    {if !$registrationDisabled}
      <form method="post" action="{$smarty.server.PHP_SELF}" class="wide" role="form" name="orderfrm" id="frmCheckout">
        <input type="hidden" name="register" value="true" />

        {* Linked accounts section *}
        {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}

        {* Personal information section *}
        <h3 class="title-5 mb-5">{lang key='orderForm.personalInformation'}</h3>
        <div class="row small-gutters mb-10 row-gap-4">
          {* First name field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputFirstName" class="form-label">{lang key='orderForm.firstName'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-icon lucide-user-round">
                    <circle cx="12" cy="8" r="5" />
                    <path d="M20 21a8 8 0 0 0-16 0" />
                  </svg>
                </div>
                <input type="text" name="firstname" id="inputFirstName" class="form-control" placeholder="{lang key='orderForm.firstName'}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus autocomplete="off">
              </div>
            </div>
          </div>

          {* Last name field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputLastName" class="form-label">{lang key='orderForm.lastName'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-icon lucide-user-round">
                    <circle cx="12" cy="8" r="5" />
                    <path d="M20 21a8 8 0 0 0-16 0" />
                  </svg>
                </div>
                <input type="text" name="lastname" id="inputLastName" class="form-control" placeholder="{lang key='orderForm.lastName'}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if} autocomplete="off">
              </div>
            </div>
          </div>

          {* Email field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputEmail" class="form-label">{lang key='orderForm.emailAddress'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                    <path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7" />
                    <rect x="2" y="4" width="20" height="16" rx="2" />
                  </svg>
                </div>
                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="{lang key='orderForm.emailAddress'}" value="{$clientemail}" required autocomplete="off">
              </div>
            </div>
          </div>

          {* Phone field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputPhone" class="form-label">{lang key='orderForm.phoneNumber'}</label>
              <input type="tel" name="phonenumber" id="inputPhone" class="form-control" placeholder="{lang key='orderForm.phoneNumber'}" value="{$clientphonenumber}" required autocomplete="off">
            </div>
          </div>
        </div>

        {* Billing address section *}
        <h3 class="title-5 mb-5">{lang key='orderForm.billingAddress'}</h3>
        <div class="row small-gutters mb-10 row-gap-4">
          {* Company name field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputCompanyName" class="form-label">{lang key='orderForm.companyName'}</label>
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
                <input type="text" name="companyname" id="inputCompanyName" class="form-control" placeholder="{lang key='orderForm.companyName'} ({lang key='orderForm.optional'})" value="{$clientcompanyname}" autocomplete="off">
              </div>
            </div>
          </div>

          {* Country field *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputCountry" class="form-label">{lang key='orderForm.country'}</label>
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
                <select class="form-control" name="country" id="inputCountry" autocomplete="true">
                  {foreach $clientcountries as $countryCode => $countryName}
                    <option value="{$countryCode}" {if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected" {/if}>
                      {$countryName}
                    </option>
                  {/foreach}
                </select>
              </div>
            </div>
          </div>

          {* Address fields *}
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputAddress1" class="form-label">{lang key='orderForm.streetAddress'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                    <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0" />
                    <circle cx="12" cy="10" r="3" />
                  </svg>
                </div>
                <input type="text" name="address1" id="inputAddress1" class="form-control" placeholder="{lang key='orderForm.streetAddress'}" value="{$clientaddress1}" {if !in_array('address1', $optionalFields)}required{/if} autocomplete="off">
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label for="inputAddress2" class="form-label">{lang key='orderForm.streetAddress2'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
                    <path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0" />
                    <circle cx="12" cy="10" r="3" />
                  </svg>
                </div>
                <input type="text" name="address2" id="inputAddress2" class="form-control" placeholder="{lang key='orderForm.streetAddress2'}" value="{$clientaddress2}" autocomplete="off">
              </div>
            </div>
          </div>

          {* City, State, Postcode fields *}
          <div class="col-md-4">
            <div class="form-group">
              <label for="inputCity" class="form-label">{lang key='orderForm.city'}</label>
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
                <input type="text" name="city" id="inputCity" class="form-control" placeholder="{lang key='orderForm.city'}" value="{$clientcity}" {if !in_array('city', $optionalFields)}required{/if} autocomplete="off">
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label for="state" class="form-label">{lang key='orderForm.state'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-milestone-icon lucide-milestone">
                    <path d="M12 13v8" />
                    <path d="M12 3v3" />
                    <path d="M4 6a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h13a2 2 0 0 0 1.152-.365l3.424-2.317a1 1 0 0 0 0-1.635l-3.424-2.318A2 2 0 0 0 17 6z" />
                  </svg>
                </div>
                <input type="text" name="state" id="state" class="form-control" placeholder="{lang key='orderForm.state'}" value="{$clientstate}" {if !in_array('state', $optionalFields)}required{/if} autocomplete="off">
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label for="inputPostcode" class="form-label">{lang key='orderForm.postcode'}</label>
              <div class="prepend-icon">
                <div class="form-float-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scan-icon lucide-scan">
                    <path d="M3 7V5a2 2 0 0 1 2-2h2" />
                    <path d="M17 3h2a2 2 0 0 1 2 2v2" />
                    <path d="M21 17v2a2 2 0 0 1-2 2h-2" />
                    <path d="M7 21H5a2 2 0 0 1-2-2v-2" />
                  </svg>
                </div>
                <input type="text" name="postcode" id="inputPostcode" class="form-control" placeholder="{lang key='orderForm.postcode'}" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if} autocomplete="off">
              </div>
            </div>
          </div>

          {* Tax ID field if enabled *}
          {if $showTaxIdField}
            <div class="col-sm-12">
              <div class="form-group">
                <label for="inputTaxId" class="form-label">{lang key='orderForm.state'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building-icon lucide-building">
                      <rect width="16" height="20" x="4" y="2" rx="2" ry="2" />
                      <path d="M9 22v-4h6v4" />
                      <path d="M8 6h.01" />
                      <path d="M16 6h.01" />
                      <path d="M12 6h.01" />
                      <path d="M12 10h.01" />
                      <path d="M12 14h.01" />
                      <path d="M16 10h.01" />
                      <path d="M16 14h.01" />
                      <path d="M8 10h.01" />
                      <path d="M8 14h.01" />
                    </svg>
                  </div>
                  <input type="text" name="tax_id" id="inputTaxId" class="form-control" placeholder="{$taxLabel} ({lang key='orderForm.optional'})" value="{$clientTaxId}" autocomplete="off">
                </div>
              </div>
            </div>
          {/if}
        </div>

        {* Additional information section *}
        {if $customfields || $currencies}
          <h3 class="title-5 mb-5">{lang key='orderadditionalrequiredinfo'}</h3>
          <div class="row">
            {* Custom fields *}
            {if $customfields}
              {foreach $customfields as $customfield}
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                    <div class="control">
                      {$customfield.input}
                      {if $customfield.description}
                        <span class="field-help-text">{$customfield.description}</span>
                      {/if}
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
            {if $customfields && count($customfields)%2 > 0 }
              <div class="clearfix"></div>
            {/if}

            {* Currency selection *}
            {if $currencies}
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="inputPostcode" class="form-label">{lang key='changeCurrency'}</label>
                  <div class="prepend-icon">
                    <div for="inputCurrency" class="form-float-icon">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-receipt-cent-icon lucide-receipt-cent">
                        <path d="M4 2v20l2-1 2 1 2-1 2 1 2-1 2 1 2-1 2 1V2l-2 1-2-1-2 1-2-1-2 1-2-1-2 1Z" />
                        <path d="M12 6.5v11" />
                        <path d="M15 9.4a4 4 0 1 0 0 5.2" />
                      </svg>
                    </div>
                    <select id="inputCurrency" name="currency" class="form-control">
                      {foreach $currencies as $curr}
                        <option value="{$curr.id}" {if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                      {/foreach}
                    </select>
                  </div>
                </div>
              </div>
            {/if}
          </div>
        {/if}

        {* Account security section *}
        <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="w-hidden" {/if}>
          <h3 class="title-5 mb-5">{lang key='orderForm.accountSecurity'}</h3>
          <div id="passwdFeedback" class="alert alert-info text-center col-sm-12 w-hidden"></div>
          <div class="row small-gutters mb-10 row-gap-4">
            {* Password fields *}
            <div class="col-md-6">
              <div class="form-group">
                <label for="inputNewPassword1" class="form-label">{lang key='clientareapassword'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                      <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
                      <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                  </div>
                  <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="form-control" placeholder="{lang key='clientareapassword'}" autocomplete="off" {if $remote_auth_prelinked} value="{$password}" {/if}>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="inputNewPassword2" class="form-label">{lang key='clientareaconfirmpassword'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                      <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
                      <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                    </svg>
                  </div>
                  <input type="password" name="password2" id="inputNewPassword2" class="form-control" placeholder="{lang key='clientareaconfirmpassword'}" autocomplete="off" {if $remote_auth_prelinked} value="{$password}" {/if}>
                </div>
              </div>
            </div>

            {* Password generator button *}
            <div class="col-xl-2 col-md-3 mr-auto">
              <div class="form-group">
                <button type="button" class="btn btn-secondary btn-sm generate-password btn-block" data-targetfields="inputNewPassword1,inputNewPassword2">
                  {lang key='generatePassword.btnLabel'}
                </button>
              </div>
            </div>

            {* Password strength meter *}
            <div class="col-md-6">
              <div class="password-strength-meter">
                <div class="progress progress-sm">
                  <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                  </div>
                </div>
                <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key='pwstrength'}: {lang key='pwstrengthenter'}</p>
              </div>
            </div>
          </div>
        </div>

        {* Security questions section *}
        {if $securityquestions}
          <h3 class="title-5 mb-5">{lang key='orderForm.securityQuestions'}</h3>
          <div class="row small-gutters mb-10 row-gap-4">
            <div class="col-6">
              <div class="form-group">
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shield-check-icon lucide-shield-check">
                      <path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z" />
                      <path d="m9 12 2 2 4-4" />
                    </svg>
                  </div>
                  <select name="securityqid" id="inputSecurityQId" class="field form-control">
                    <option value="">{lang key='clientareasecurityquestion'}</option>
                    {foreach $securityquestions as $question}
                      <option value="{$question.id}" {if $question.id eq $securityqid} selected{/if}>
                        {$question.question}
                      </option>
                    {/foreach}
                  </select>
                </div>
              </div>
            </div>
            <div class="col-6">
              <div class="form-group">
                <label for="inputSecurityQAns" class="form-label">{lang key='clientareasecurityanswer'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-type-icon lucide-type">
                      <path d="M12 4v16" />
                      <path d="M4 7V5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2" />
                      <path d="M9 20h6" />
                    </svg>
                  </div>
                  <input type="password" name="securityqans" id="inputSecurityQAns" class="field form-control" placeholder="{lang key='clientareasecurityanswer'}" autocomplete="off">
                </div>
              </div>
            </div>
          </div>
        {/if}

        {* Marketing email opt-in *}
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

        {* CAPTCHA *}
        {include file="$template/includes/captcha.tpl"}

        {* page-footer *}
        <div class="page-footer">
          {* Submit button *}
          <div class="row">
            <div class="col-xl-2 col-lg-3 col-md-3 ml-auto">
              <input class="btn btn-primary btn-wide btn-block{$captcha->getButtonClass($captchaForm)}" type="submit" value="{lang key='clientregistertitle'}" />
            </div>
          </div>
        </div>
      </form>
    {/if}
  </div>
</div>