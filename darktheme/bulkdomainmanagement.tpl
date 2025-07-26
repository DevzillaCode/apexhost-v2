<div class="card mb-8">
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
            <div class="alert alert-error">
              <p class="bold">
                {lang key='clientareaerrors'}
              </p>
              <ul>
                {foreach $errors as $error}
                  <li>{$error}</li>
                {/foreach}
              </ul>
            </div>
          {else}
            <!-- Success alert -->
            <div class="alert alert-success">
              <p>
                {lang key='changessavedsuccessfully'}
              </p>
            </div>
          {/if}
        {/if}

        <!-- Information text -->
        <p class="mb-2">
          {lang key='domainbulkmanagementchangesaffect'}
        </p>

        <!-- List of affected domains -->
        <ul class="list-group mb-4">
          {foreach $domains as $domain}
            <li class="list-group-item">{$domain}</li>
          {/foreach}
        </ul>

        <!-- Radio buttons for nameserver choice -->
        <div class="d-flex flex-wrap align-items-center gap-2 mb-4">
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
            <label for="inputNs{$num}" class="col-sm-4 col-form-label">{lang key='clientareanameserver'} {$num}</label>
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
          <div class="alert alert-success">
            <p>
              {lang key='changessavedsuccessfully'}
            </p>
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
          <button type="submit" name="enable" class="btn btn-success btn-sm">
            {lang key='domainsautorenewenable'}
          </button>
          <button type="submit" name="disable" class="btn btn-danger btn-sm">
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
            <div class="alert alert-error">
              <p class="bold">
                {lang key='clientareaerrors'}
              </p>
              <ul>
                {foreach $errors as $error}
                  <li>{$error}</li>
                {/foreach}
              </ul>
            </div>
          {else}
            <!-- Success alert -->
            <div class="alert alert-success">
              <p>
                {lang key='changessavedsuccessfully'}
              </p>
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
          <button type="submit" name="enable" class="btn btn-success">
            {lang key='domainreglockenable'}
          </button>
          <button type="submit" name="disable" class="btn btn-danger">
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
            <div class="alert alert-error">
              <p class="bold">
                {lang key='clientareaerrors'}
              </p>
              <ul>
                {foreach $errors as $error}
                  <li>{$error}</li>
                {/foreach}
              </ul>
            </div>
          {else}
            <!-- Success alert -->
            <div class="alert alert-success">
              <p>
                {lang key='changessavedsuccessfully'}
              </p>
            </div>
          {/if}
        {/if}

        <!-- Information text -->
        <p class="mb-2">{lang key='domainbulkmanagementchangesaffect'}</p>

        <!-- List of affected domains -->
        <ul class="list-group mb-4">
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
        <div class="tab-content p-4">
          {foreach $contactdetails as $contactdetail => $values}
            <div class="tab-pane fade{if $values@first} show active{/if}" id="tab{$contactdetail}" role="tabpanel">

              <!-- Radio button for using existing contact -->
              <!-- NOTE: There's a typo in the HTML tag - "laebl" instead of "label" -->
              <label class="form-check" for="{$contactdetail}1">
                <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
                <span class="checkmark"></span>
                {lang key='domaincontactusexisting'}
              </label>

              <!-- Dropdown for selecting existing contact -->
              <div class="row">
                <div class="offset-1 col-10">
                  <div class="form-group">
                    <label for="{$contactdetail}3">{lang key='domaincontactchoose'}</label>
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

              <!-- Radio button for using custom contact information -->
              <label class="form-check" for="{$contactdetail}2">
                <input type="radio" class="form-check-input" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                {lang key='domaincontactusecustom'}
                <span class="checkmark"></span>
              </label>

              <!-- Generate form fields for each contact detail -->
              {foreach $values as $name => $value}
                <div class="form-group">
                  <label>{$contactdetailstranslations[$name]}</label>
                  <!-- Contact field input with IRTP field detection -->
                  <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if isset($irtpFields[$contactdetail]) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
                </div>
              {/foreach}
            </div>
          {/foreach}
        </div>

        <!-- Submit button for contact information changes -->
        <div class="text-center">
          <button type="submit" class="btn btn-primary">
            {lang key='clientareasavechanges'}
          </button>
        </div>

      {/if}

    </form>

  </div>
</div>

<!-- Back to domains list button -->
<a href="clientarea.php?action=domains" class="btn btn-light">
  <!-- Left arrow icon -->
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
    <path d="m12 19-7-7 7-7" />
    <path d="M19 12H5" />
  </svg>
  {lang key='clientareabacklink'}
</a>

<!-- JavaScript variable to disable internal tab selection -->
<script type="text/javascript">
  var disableInternalTabSelection = true;
</script>