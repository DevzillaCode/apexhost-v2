<div class="card extra-padding mb-8">
  <div class="card-body">

    <!-- Bulk domain management form -->
    <form method="post" action="{$smarty.server.PHP_SELF}?action=bulkdomain">
      <!-- Hidden inputs for form processing -->
      <input type="hidden" name="update" value="{$update}">
      <input type="hidden" name="save" value="1">

      <!-- Loop through domain IDs and create hidden inputs for each -->
      {foreach $domainids as $domainid}
        <input type="hidden" name="domids[]" value="{$domainid}" />
      {/foreach}

      <!-- NAMESERVERS MANAGEMENT SECTION -->
      {if $update eq "nameservers"}
        <h3 class="card-title">{lang key='changenameservers'}</h3>

        <!-- Display success/error messages after form submission -->
        {if $save}
          {if $errors}
            <!-- Error alert with list of errors -->
            <div class="alert-container">
              <div class="alert alert-danger alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-slash-icon lucide-circle-slash">
                      <circle cx="12" cy="12" r="10" />
                      <line x1="9" x2="15" y1="15" y2="9" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message bold">{lang key='clientareaerrors'}</p>
                    <ul class="alert-list">
                      {foreach $errors as $error}
                        <li>{$error}</li>
                      {/foreach}
                    </ul>
                  </div>
                  <!-- close-alert -->
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
          {else}
            <!-- Success alert -->
            <div class="alert-container">
              <div class="alert alert-success alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                      <circle cx="12" cy="12" r="10" />
                      <path d="m9 12 2 2 4-4" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message">{lang key='changessavedsuccessfully'}</p>
                  </div>
                  <!-- close-alert -->
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
          {/if}
        {/if}

        <!-- Information text -->
        <p class="mb-2">
          {lang key='domainbulkmanagementchangesaffect'}
        </p>

        <!-- List of affected domains -->
        <ul class="list-group mb-8">
          {foreach $domains as $domain}
            <li class="list-group-item">{$domain}</li>
          {/foreach}
        </ul>

        <!-- Radio buttons for nameserver choice -->
        <div class="d-flex flex-wrap align-items-center gap-4 mb-6">
          <!-- Default nameservers option -->
          <label class="form-check" for="nsChoiceDefault">
            <input id="nsChoiceDefault" type="radio" class="form-check-input" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)" checked />
            <span class="checkmark"></span>
            {lang key='nschoicedefault'}
          </label>

          <!-- Custom nameservers option -->
          <label class="form-check" for="nsChoiceCustom">
            <input id="nsChoiceCustom" type="radio" class="form-check-input" name="nschoice" value="custom" onclick="disableFields('domnsinputs', '')" />
            <span class="checkmark"></span>
            {lang key='nschoicecustom'}
          </label>
        </div>

        <!-- Generate 5 nameserver input fields using a loop -->
        {for $num=1 to 5}
          <div class="form-group row mb-4">
            <label for="inputNs{$num}" class="col-sm-4 form-label">{lang key='clientareanameserver'} {$num}</label>
            <div class="col-sm-7">
              <input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" />
            </div>
          </div>
        {/for}

        <!-- Submit button for nameserver changes -->
        <div class="row">
          <div class="col-sm-8 offset-sm-4">
            <button type="submit" class="btn btn-primary">
              {lang key='changenameservers'}
            </button>
          </div>
        </div>

        <!-- AUTO-RENEW MANAGEMENT SECTION -->
      {elseif $update eq "autorenew"}

        <h3 class="card-title">{lang key='domainautorenewstatus'}</h3>

        <!-- Display success message after form submission -->
        {if $save}
          <div class="alert-container">
            <div class="alert alert-success alert-float">
              <div>
                <!-- alert-icon -->
                <div class="alert-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                    <circle cx="12" cy="12" r="10" />
                    <path d="m9 12 2 2 4-4" />
                  </svg>
                </div>
                <!-- alert-content -->
                <div class="alert-content">
                  <!-- alert-message -->
                  <p class="alert-message">{lang key='changessavedsuccessfully'}</p>
                </div>
                <!-- close-alert -->
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
        {/if}

        <!-- Information about auto-renew -->
        <p class="mb-2">{lang key='domainautorenewinfo'}</p>
        <p class="mb-2">{lang key='domainautorenewrecommend'}</p>
        <p class="mb-4">{lang key='domainbulkmanagementchangeaffect'}</p>

        <!-- List of affected domains -->
        <ul class="list-group mb-4">
          {foreach $domains as $domain}
            <li class="list-group-item">{$domain}</li>
          {/foreach}
        </ul>

        <!-- Enable/disable auto-renew buttons -->
        <div class="d-flex flex-wrap align-items-center gap-2">
          <button type="submit" name="enable" class="btn btn-semi-ghost-success btn-sm">
            {lang key='domainsautorenewenable'}
          </button>
          <button type="submit" name="disable" class="btn btn-semi-ghost-danger btn-sm">
            {lang key='domainsautorenewdisable'}
          </button>
        </div>

        <!-- REGISTRATION LOCK MANAGEMENT SECTION -->
      {elseif $update eq "reglock"}

        <h3 class="card-title">{lang key='domainreglockstatus'}</h3>

        <!-- Display success/error messages after form submission -->
        {if $save}
          {if $errors}
            <!-- Error alert with list of errors -->
            <div class="alert-container">
              <div class="alert alert-danger alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-slash-icon lucide-circle-slash">
                      <circle cx="12" cy="12" r="10" />
                      <line x1="9" x2="15" y1="15" y2="9" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message bold">{lang key='clientareaerrors'}</p>
                    <ul class="alert-list">
                      {foreach $errors as $error}
                        <li>{$error}</li>
                      {/foreach}
                    </ul>
                  </div>
                  <!-- close-alert -->
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
          {else}
            <!-- Success alert -->
            <div class="alert-container">
              <div class="alert alert-success alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                      <circle cx="12" cy="12" r="10" />
                      <path d="m9 12 2 2 4-4" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message">{lang key='changessavedsuccessfully'}</p>
                  </div>
                  <!-- close-alert -->
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
          {/if}
        {/if}

        <!-- Information about registration lock -->
        <p class="mb-2">{lang key='domainreglockinfo'}</p>
        <p class="mb-2">{lang key='domainreglockrecommend'}</p>
        <p class="mb-4">{lang key='domainbulkmanagementchangeaffect'}</p>

        <!-- List of affected domains -->
        <ul class="list-group mb-4">
          {foreach $domains as $domain}
            <li class="list-group-item">{$domain}</li>
          {/foreach}
        </ul>

        <!-- Enable/disable registration lock buttons -->
        <div class="d-flex flex-wrap align-items-center gap-2">
          <button type="submit" name="enable" class="btn btn-semi-ghost-success">
            {lang key='domainreglockenable'}
          </button>
          <button type="submit" name="disable" class="btn btn-semi-ghost-danger">
            {lang key='domainreglockdisable'}
          </button>
        </div>

        <!-- CONTACT INFORMATION MANAGEMENT SECTION -->
      {elseif $update eq "contactinfo"}

        <h3 class="card-title">{lang key='domaincontactinfoedit'}</h3>

        <!-- Display success/error messages after form submission -->
        {if $save}
          {if $errors}
            <!-- Error alert with list of errors -->
            <div class="alert-container">
              <div class="alert alert-danger alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-slash-icon lucide-circle-slash">
                      <circle cx="12" cy="12" r="10" />
                      <line x1="9" x2="15" y1="15" y2="9" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message bold">{lang key='clientareaerrors'}</p>
                    <ul class="alert-list">
                      {foreach $errors as $error}
                        <li>{$error}</li>
                      {/foreach}
                    </ul>
                  </div>
                  <!-- close-alert -->
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
          {else}
            <!-- Success alert -->
            <div class="alert-container">
              <div class="alert alert-success alert-float">
                <div>
                  <!-- alert-icon -->
                  <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                      <circle cx="12" cy="12" r="10" />
                      <path d="m9 12 2 2 4-4" />
                    </svg>
                  </div>
                  <!-- alert-content -->
                  <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message">{lang key='changessavedsuccessfully'}</p>
                  </div>
                  <!-- close-alert -->
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
          {/if}
        {/if}

        <!-- Information text -->
        <p class="mb-2">{lang key='domainbulkmanagementchangesaffect'}</p>

        <!-- List of affected domains -->
        <ul class="list-group mb-6">
          {foreach $domains as $domain}
            <li class="list-group-item">{$domain}</li>
          {/foreach}
        </ul>

        <!-- Tab navigation for different contact types (Admin, Tech, Billing, etc.) -->
        <ul class="nav nav-tabs responsive-tabs-sm" role="tablist">
          {foreach $contactdetails as $contactdetail => $values}
            <li class="nav-item">
              <a class="nav-link{if $values@first} active{/if}" id="tabSelector{$contactdetail}" data-toggle="tab" href="#tab{$contactdetail}" role="tab">{$contactdetail}</a>
            </li>
          {/foreach}
        </ul>

        <!-- Visual connector for responsive tabs -->
        <div class="responsive-tabs-sm-connector">
          <div class="channel"></div>
          <div class="bottom-border"></div>
        </div>

        <!-- Tab content for contact information forms -->
        <div class="tab-content">
          {foreach $contactdetails as $contactdetail => $values}
            <div class="tab-pane fade{if $values@first} show active{/if}" id="tab{$contactdetail}" role="tabpanel">

              {* Radio buttons for using existing or custom contact *}
              <div class="d-flex flex-wrap align-items-center gap-4 my-4">
                <!-- Radio button for using existing contact -->
                <label class="form-check" for="{$contactdetail}1">
                  <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
                  <span class="checkmark"></span>
                  {lang key='domaincontactusexisting'}
                </label>
                <!-- Radio button for using custom contact information -->
                <label class="form-check" for="{$contactdetail}2">
                  <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                  <span class="checkmark"></span>
                  {lang key='domaincontactusecustom'}
                </label>
              </div>

              <!-- Dropdown for selecting existing contact -->
              <div class="row mb-4">
                <div class="col-12">
                  <div class="form-group">
                    <label class="form-label" for="{$contactdetail}3">{lang key='domaincontactchoose'}</label>
                    <input type="hidden" name="sel[{$contactdetail}]" value="">
                    <select id="{$contactdetail}3" class="form-control {$contactdetail}defaultwhois" name="sel[{$contactdetail}]" disabled>
                      <!-- Primary account contact option -->
                      <option value="u{$clientsdetails.userid}">{lang key='domaincontactprimary'}</option>
                      <!-- Additional contacts -->
                      {foreach $contacts as $contact}
                        <option value="c{$contact.id}">{$contact.name}</option>
                      {/foreach}
                    </select>
                  </div>
                </div>
              </div>

              <!-- Generate form fields for each contact detail -->
              {foreach $values as $name => $value}
                <div class="form-group mb-4">
                  <label class="form-label" for="contactdetails[{$contactdetail}][{$name}]">{$contactdetailstranslations[$name]}</label>
                  <!-- Contact field input with IRTP field detection -->
                  <input type="text" id="contactdetails[{$contactdetail}][{$name}]" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if isset($irtpFields[$contactdetail]) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
                </div>
              {/foreach}
            </div>
          {/foreach}
        </div>

        <!-- Submit button for contact information changes -->
        <button type="submit" class="btn btn-primary btn-sm mt-4">
          {lang key='clientareasavechanges'}
        </button>

      {/if}

    </form>

  </div>
</div>

<!-- Back to domains list button -->
<div class="page-footer">
  <a href="clientarea.php?action=domains" class="btn btn-semi-ghost-secondary btn-wide">
    <!-- Left arrow icon -->
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left rtl-rotate rtl-rotate">
      <path d="m12 19-7-7 7-7" />
      <path d="M19 12H5" />
    </svg>
    {lang key='clientareabacklink'}
  </a>
</div>

<!-- JavaScript variable to disable internal tab selection -->
<script type="text/javascript">
  var disableInternalTabSelection = true;
</script>