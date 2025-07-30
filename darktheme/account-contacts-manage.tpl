{* Include JavaScript for dynamic state dropdown functionality *}
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

{* Page header with title and tagline for contact management *}
{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareanavcontacts'}" tagline="{lang key='clientareacontactsmanagetagline'}"}

{* Form for selecting or adding a contact *}
<div class="card mb-8">
	<div class="card-body">
		<form role="form" method="post" action="{routePath('account-contacts')}">
			<div class="row small-gutters">
				{* Dropdown to select existing contact or add new *}
				<label for="inputContactId" class="col-md-3 form-label inline-label">{lang key='clientareachoosecontact'}</label>
				<div class="col-md-6 ml-auto">
					<select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
						{foreach $contacts as $contact}
							<option value="{$contact.id}" {if $contact.id eq $contactid} selected="selected" {/if}>{$contact.name} - {$contact.email}</option>
						{/foreach}
						<option value="new">{lang key='clientareanavaddcontact'}</option>
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

{* Contact details and email preferences section *}
<div>
	{* Title for contact details *}
	<h3 class="card-title">{lang key="contactDetails"}</h3>
	{* Include flash message for success/error alerts *}
	{include file="$template/includes/flashmessage.tpl"}
	{* Display error messages if present *}
	{if $errorMessageHtml}
		{include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
	{/if}
	{* Form for editing contact details *}
	<form role="form" method="post" action="{routePath('account-contacts-save')}">
		<input type="hidden" name="contactid" value="{$contactid}" />
		<div class="row mb-10">
			{* Left column for personal details *}
			<div class="col-md-6 d-flex flex-column row-gap-4">
				{* First Name field *}
				<div class="form-group">
					<label for="inputFirstName" class="form-label">{lang key='clientareafirstname'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
								<path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="form-control" />
					</div>
				</div>
				{* Last Name field *}
				<div class="form-group">
					<label for="inputLastName" class="form-label">{lang key='clientarealastname'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-icon lucide-user">
								<path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
								<circle cx="12" cy="7" r="4"></circle>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="form-control" />
					</div>
				</div>
				{* Company Name field *}
				<div class="form-group">
					<label for="inputCompanyName" class="form-label">{lang key='clientareacompanyname'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2-icon lucide-building-2">
								<path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path>
								<path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path>
								<path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path>
								<path d="M10 6h4"></path>
								<path d="M10 10h4"></path>
								<path d="M10 14h4"></path>
								<path d="M10 18h4"></path>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="form-control" />
					</div>
				</div>
				{* Email field *}
				<div class="form-group">
					<label for="inputEmail" class="form-label">{lang key='clientareaemail'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
								<path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7"></path>
								<rect x="2" y="4" width="20" height="16" rx="2"></rect>
							</svg>
						</div>
						{* form-control *}
						<input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="form-control" />
					</div>
				</div>
				{* Phone Number field *}
				<div class="form-group">
					<label for="inputPhone" class="form-label">{lang key='clientareaphonenumber'}</label>
					<input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="form-control" />
				</div>
				{* Tax ID field *}
				<div class="form-group">
					<label for="inputTaxId" class="form-label">{lang key=$taxIdLabel}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-id-card-icon lucide-id-card">
								<path d="M16 10h2" />
								<path d="M16 14h2" />
								<path d="M6.17 15a3 3 0 0 1 5.66 0" />
								<circle cx="9" cy="11" r="2" />
								<rect x="2" y="5" width="20" height="14" rx="2" />
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$formdata.tax_id}" />
					</div>
				</div>
			</div>
			{* Right column for address details *}
			<div class="col-md-6 col-12 d-flex flex-column row-gap-4">
				{* Address Line 1 field *}
				<div class="form-group">
					<label for="inputAddress1" class="form-label">{lang key='clientareaaddress1'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
								<path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
								<circle cx="12" cy="10" r="3"></circle>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="form-control" />
					</div>
				</div>
				{* Address Line 2 field *}
				<div class="form-group">
					<label for="inputAddress2" class="form-label">{lang key='clientareaaddress2'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin-icon lucide-map-pin">
								<path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path>
								<circle cx="12" cy="10" r="3"></circle>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="form-control" />
					</div>
				</div>
				{* City field *}
				<div class="form-group">
					<label for="inputCity" class="form-label">{lang key='clientareacity'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-building2-icon lucide-building-2">
								<path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"></path>
								<path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"></path>
								<path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"></path>
								<path d="M10 6h4"></path>
								<path d="M10 10h4"></path>
								<path d="M10 14h4"></path>
								<path d="M10 18h4"></path>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="city" id="inputCity" value="{$formdata.city}" class="form-control" />
					</div>
				</div>
				{* State field *}
				<div class="form-group">
					<label for="inputState" class="form-label">{lang key='clientareastate'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-milestone-icon lucide-milestone">
								<path d="M12 13v8"></path>
								<path d="M12 3v3"></path>
								<path d="M4 6a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h13a2 2 0 0 0 1.152-.365l3.424-2.317a1 1 0 0 0 0-1.635l-3.424-2.318A2 2 0 0 0 17 6z"></path>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="state" id="inputState" value="{$formdata.state}" class="form-control" />
					</div>
				</div>
				{* Postcode field *}
				<div class="form-group">
					<label for="inputPostcode" class="form-label">{lang key='clientareapostcode'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scan-icon lucide-scan">
								<path d="M3 7V5a2 2 0 0 1 2-2h2"></path>
								<path d="M17 3h2a2 2 0 0 1 2 2v2"></path>
								<path d="M21 17v2a2 2 0 0 1-2 2h-2"></path>
								<path d="M7 21H5a2 2 0 0 1-2-2v-2"></path>
							</svg>
						</div>
						{* form-control *}
						<input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="form-control" />
					</div>
				</div>
				{* Country dropdown *}
				<div class="form-group">
					<label class="form-label" for="country">{lang key='clientareacountry'}</label>
					{* prepend-icon *}
					<div class="prepend-icon">
						{* form-float-icon *}
						<div class="form-float-icon">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
								<circle cx="12" cy="12" r="10" />
								<path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
								<path d="M2 12h20" />
							</svg>
						</div>
						{* form-control *}
						{$countriesdropdown|replace:'<select':'<select class="form-control custom-country-dropdown"'}
					</div>
				</div>
			</div>
		</div>

		{* Email preferences section *}
		<div class="mb-10">
			<h3 class="card-title">{lang key='clientareacontactsemails'}</h3>
			<div class="row small-gutters row-gap-3">
				{* Checkboxes for email preferences *}
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
			{* Delete contact button to trigger modal *}
			<button type="button" class="btn btn-ghost-danger" data-toggle="modal" data-target="#modalDeleteContact">{lang key='clientareadeletecontact'}</button>
			{* Reset form button *}
			<input class="btn btn-ghost-light" type="reset" value="{lang key='cancel'}" />
			{* Save changes button *}
			<input class="btn btn-primary" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
		</div>
	</form>
</div>

{* Modal for confirming contact deletion *}
<form method="post" action="{routePath('account-contacts-delete')}">
	<input type="hidden" name="contactid" value="{$contactid}">
	<div class="modal fade" id="modalDeleteContact">
		<div class="modal-dialog">
			<div class="modal-content">
				{* Modal header *}
				<div class="modal-header">
					<h4 class="modal-title">
						{lang key="clientareadeletecontact"}
					</h4>
					{* Close button with themed SVG icon *}
					<button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--foreground)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
							<path d="M18 6 6 18" />
							<path d="m6 6 12 12" />
						</svg>
					</button>
				</div>
				{* Modal body with confirmation message *}
				<div class="modal-body">
					<p>{lang key="clientareadeletecontactareyousure"}</p>
				</div>
				{* Modal footer with action buttons *}
				<div class="modal-footer">
					<button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
						{lang key="cancel"}
					</button>
					<button type="submit" class="btn btn-danger btn-xs btn-wide" id="btnCancelInviteConfirm">
						{lang key="confirm"}
					</button>
				</div>
			</div>
		</div>
	</div>
</form>