{if $errorMessageHtml}
  {include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
{/if}

{* Page header with title and tagline for contact management *}
{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareanavcontacts'}" tagline="{lang key='newContactsTagline'}"}

<script>
  var stateNotRequired = true;
  jQuery(document).ready(function() {
    WHMCS.form.register();
  });
</script>
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

{* Form for selecting or adding a contact *}
<div class="card mb-8">
  <div class="card-body">
    <form role="form" method="post" action="{routePath('account-contacts')}">
      <div class="row small-gutters">
        {* Dropdown to select existing contact or add new *}
        <label for="inputContactId" class="col-md-3 col-form-label inline-label">{lang key='clientareachoosecontact'}</label>
        <div class="col-md-6 ml-auto">
          <select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
            {foreach $contacts as $contact}
              <option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
            {/foreach}
            <option value="new" selected="selected">{lang key='clientareanavaddcontact'}</option>
          </select>
        </div>
        {* Submit button for contact selection *}
        <div class="col-md-2 mt-2 mt-md-0">
          <button type="submit" class="btn btn-light btn-block">{lang key='go'}</button>
        </div>
      </div>
    </form>
  </div>
</div>

{* Contact details section *}
<div>
  <h3 class="card-title">{lang key='clientareanavaddcontact'}</h3>
  <form role="form" method="post" action="{routePath('account-contacts-new')}">
    <div class="row mb-10">
      {* Left column for personal details *}
      <div class="col-md-6 d-flex flex-column row-gap-4">
        <div class="form-group">
          <label for="inputFirstName" class="col-form-label">{lang key='clientareafirstname'}</label>
          <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputLastName" class="col-form-label">{lang key='clientarealastname'}</label>
          <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputCompanyName" class="col-form-label">{lang key='clientareacompanyname'}</label>
          <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputEmail" class="col-form-label">{lang key='clientareaemail'}</label>
          <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputPhone" class="col-form-label">{lang key='clientareaphonenumber'}</label>
          <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="form-control" />
        </div>
        {if $showTaxIdField}
          <div class="form-group">
            <label for="inputTaxId" class="col-form-label">{lang key=$taxIdLabel}</label>
            <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$formdata.tax_id}" />
          </div>
        {/if}
      </div>
      {* Right column for address details *}
      <div class="col-md-6 col-12 d-flex flex-column row-gap-4">
        <div class="form-group">
          <label for="inputAddress1" class="col-form-label">{lang key='clientareaaddress1'}</label>
          <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputAddress2" class="col-form-label">{lang key='clientareaaddress2'}</label>
          <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputCity" class="col-form-label">{lang key='clientareacity'}</label>
          <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputState" class="col-form-label">{lang key='clientareastate'}</label>
          <input type="text" name="state" id="inputState" value="{$formdata.state}" class="form-control" />
        </div>
        <div class="form-group">
          <label for="inputPostcode" class="col-form-label">{lang key='clientareapostcode'}</label>
          <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="form-control" />
        </div>
        <div class="form-group">
          <label class="col-form-label" for="country">{lang key='clientareacountry'}</label>
          {$countriesdropdown|replace:'<select':'<select class="form-control custom-country-dropdown"'}
        </div>
      </div>
    </div>

    {* Email preferences section *}
    <div class="mb-10">
      <h3 class="card-title">{lang key='clientareacontactsemails'}</h3>
      <div class="row small-gutters row-gap-3">
        {foreach $formdata.emailPreferences as $emailType => $value}
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

    {* Form action buttons *}
    <div class="form-group d-flex flex-wrap col-gap-2 justify-content-end">
      <input class="btn btn-ghost-light" type="reset" value="{lang key='cancel'}" />
      <input class="btn btn-light" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
    </div>
  </form>
</div>