{* Display success/error alerts for registrar custom button actions *}
{if $registrarcustombuttonresult=="success"}
  {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" textcenter=true}
{elseif $registrarcustombuttonresult}
  {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}" textcenter=true}
{/if}

{* Show unpaid invoice alert with dynamic styling (danger for overdue, warning otherwise) *}
{if $unpaidInvoice}
  <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
    <div class="float-right">
      {* Quick pay button for unpaid invoice *}
      <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-light">
        {lang key='payInvoice'}
      </a>
    </div>
    {$unpaidInvoiceMessage}
  </div>
{/if}

{* Main tab content container with modern flexbox layout *}
<div class="tab-content d-flex flex-column gap-4">

  {* OVERVIEW TAB - Primary domain information and quick actions *}
  <div class="tab-pane fade show active" id="tabOverview">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='overview'}</h3>

        {* Display any system alerts (errors, warnings, info messages) *}
        {if $alerts}
          {foreach $alerts as $alert}
            {include file="$template/includes/alert.tpl" type=$alert.type msg="<strong>{$alert.title}</strong><br>{$alert.description}" textcenter=true}
          {/foreach}
        {/if}

        {* Show warning if domain status prevents management *}
        {if $systemStatus != 'Active'}
          <div class="alert alert-warning text-center" role="alert">
            {lang key='domainCannotBeManagedUnlessActive'}
          </div>
        {/if}

        {* Security alert when domain is unlocked (vulnerable to transfers) *}
        {if $lockstatus eq "unlocked"}
          {capture name="domainUnlockedMsg"}<strong>{lang key='domaincurrentlyunlocked'}</strong><br />{lang key='domaincurrentlyunlockedexp'}{/capture}
          {include file="$template/includes/alert.tpl" type="error" msg=$smarty.capture.domainUnlockedMsg}
        {/if}

        {* Domain information grid - responsive 2-column layout *}
        <div class="row mb-3">
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='clientareahostingdomain'}:</h5>
            {* Domain name with external link *}
            <a href="http://{$domain}" target="_blank">{$domain}</a>
          </div>
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='firstpaymentamount'}:</h5>
            <span>{$firstpaymentamount}</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='clientareahostingregdate'}:</h5>
            <span>{$registrationdate}</span>
          </div>
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='recurringamount'}:</h5>
            {* Recurring billing amount with renewal period *}
            {$recurringamount} {lang key='every'} {$registrationperiod} {lang key='orderyears'}
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='clientareahostingnextduedate'}:</h5>
            {$nextduedate}
          </div>
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='orderpaymentmethod'}:</h5>
            {$paymentmethod}
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-lg-6">
            <h5 class="text-size-base">{lang key='clientareastatus'}:</h5>
            {$status}
          </div>
        </div>

        {* SSL Certificate Status Information *}
        {if $sslStatus}
          <div class="row mb-3">
            <div class="col-lg-6{if $sslStatus->isInactive()} ssl-inactive{/if}">
              <h5 class="text-size-base">{lang key='sslState.sslStatus'}</h5>
              {* SSL status icon with dynamic attributes for JavaScript integration *}
              <img src="{$sslStatus->getImagePath()}" width="16" data-type="domain" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}" />
              <span id="statusDisplayLabel">
                {if !$sslStatus->needsResync()}
                  {$sslStatus->getStatusDisplayLabel()}
                {else}
                  {lang key='loading'}
                {/if}
              </span>
            </div>
            {* Show SSL start date only if certificate is active or syncing *}
            {if $sslStatus->isActive() || $sslStatus->needsResync()}
              <div class="col-lg-6">
                <h5 class="text-size-base">{lang key='sslState.startDate'}</h5>
                <span id="ssl-startdate">
                  {if !$sslStatus->needsResync() || $sslStatus->startDate}
                    {$sslStatus->startDate->toClientDateFormat()}
                  {else}
                    {lang key='loading'}
                  {/if}
                </span>
              </div>
            {/if}
          </div>
          {* SSL certificate details (issuer and expiry) *}
          {if $sslStatus->isActive() || $sslStatus->needsResync()}
            <div class="row">
              <div class="col-lg-6">
                <h5 class="text-size-base">{lang key='sslState.issuerName'}</h5>
                <span id="ssl-issuer">
                  {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                    {$sslStatus->issuerName}
                  {else}
                    {lang key='loading'}
                  {/if}
                </span>
              </div>
              <div class="col-lg-6">
                <h5 class="text-size-base">{lang key='sslState.expiryDate'}</h5>
                <span id="ssl-expirydate">
                  {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                    {$sslStatus->expiryDate->toClientDateFormat()}
                  {else}
                    {lang key='loading'}
                  {/if}
                </span>
              </div>
            </div>
          {/if}
        {/if}

        {* Custom output from registrar modules *}
        {if $registrarclientarea}
          <div class="moduleoutput">
            {* Replace legacy button class with Bootstrap class *}
            {$registrarclientarea|replace:'modulebutton':'btn'}
          </div>
        {/if}

        {* Plugin/hook system outputs for extensibility *}
        {foreach $hookOutput as $output}
          <div>
            {$output}
          </div>
        {/foreach}

        <br />

        {* Quick Action Links Section *}
        {* Only display if domain can be managed and at least one action is available *}
        {if $canDomainBeManaged
                    and (
                        $managementoptions.nameservers or
                        $managementoptions.contacts or
                        $managementoptions.locking or
                        $renew)}

        <h3 class="card-title">{lang key='doToday'}</h3>

        {* List of available management actions *}
        <ul class="list-unstyled d-flex flex-column gap-2">
          {* Nameserver management (tab link) *}
          {if $systemStatus == 'Active' && $managementoptions.nameservers}
            <li>
              <a data-toggle="tab" href="#tabNameservers">
                {lang key='changeDomainNS'}
              </a>
            </li>
          {/if}
          {* Contact information management (external page) *}
          {if $systemStatus == 'Active' && $managementoptions.contacts}
            <li>
              <a href="clientarea.php?action=domaincontacts&domainid={$domainid}">
                {lang key='updateWhoisContact'}
              </a>
            </li>
          {/if}
          {* Domain lock management (tab link) *}
          {if $systemStatus == 'Active' && $managementoptions.locking}
            <li>
              <a data-toggle="tab" href="#tabReglock">
                {lang key='changeRegLock'}
              </a>
            </li>
          {/if}
          {* Domain renewal (external page with routing) *}
          {if $renew}
            <li>
              <a href="{routePath('domain-renewal', $domain)}">
                {lang key='domainrenew'}
              </a>
            </li>
          {/if}
        </ul>

        {/if}

      </div>
    </div>
  </div>

  {* AUTO-RENEW TAB - Automatic renewal settings management *}
  <div class="tab-pane fade" id="tabAutorenew">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='domainsautorenew'}</h3>

        {* Success confirmation after changing auto-renew settings *}
        {if $changeAutoRenewStatusSuccessful}
          {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
        {/if}

        {* Explanation of auto-renew functionality *}
        <p class="mb-4">{lang key='domainrenewexp'}</p>

        {* Current auto-renew status with visual indicator *}
        <h4 class="text-size-base mb-4">{lang key='domainautorenewstatus'}: <span class="label label-{if $autorenew}success{else}danger{/if}">{if $autorenew}{lang key='domainsautorenewenabled'}{else}{lang key='domainsautorenewdisabled'}{/if}</span></h4>

        {* Toggle form for auto-renew status *}
        <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabAutorenew">
          <input type="hidden" name="id" value="{$domainid}">
          <input type="hidden" name="sub" value="autorenew" />
          {if $autorenew}
            {* Disable auto-renew option *}
            <input type="hidden" name="autorenew" value="disable">
            <button type="submit" class="btn btn-danger btn-sm">
              {lang key='domainsautorenewdisable'}
            </button>
          {else}
            {* Enable auto-renew option *}
            <input type="hidden" name="autorenew" value="enable">
            <button type="submit" class="btn btn-success btn-sm">
              {lang key='domainsautorenewenable'}
            </button>
          {/if}
        </form>
      </div>
    </div>
  </div>

  {* NAMESERVERS TAB - DNS nameserver configuration *}
  <div class="tab-pane fade" id="tabNameservers">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='domainnameservers'}</h3>

        {* Display nameserver-specific error messages *}
        {if $nameservererror}
          {include file="$template/includes/alert.tpl" type="error" msg=$nameservererror textcenter=true}
        {/if}
        {* Show result of nameserver save operation *}
        {if $subaction eq "savens"}
          {if $updatesuccess}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
          {elseif $error}
            {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
          {/if}
        {/if}

        {* Informational message about nameservers *}
        {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainnsexp'}"}

        {* Nameserver configuration form *}
        <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabNameservers">
          <input type="hidden" name="id" value="{$domainid}" />
          <input type="hidden" name="sub" value="savens" />

          {* Radio button selection: default vs custom nameservers *}
          <div class="d-flex gap-4 mb-6">
            <label class="form-check" for="inputNsDefault">
              {* Use default nameservers (disables custom input fields) *}
              <input type="radio" class="form-check-input" id="inputNsDefault" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)" {if $defaultns} checked{/if} />
              <span class="checkmark"></span>
              {lang key='nschoicedefault'}
            </label>

            <label class="form-check" for="inputNsCustom">
              {* Use custom nameservers (enables custom input fields) *}
              <input type="radio" class="form-check-input" id="inputNsCustom" name="nschoice" value="custom" onclick="disableFields('domnsinputs',false)" {if !$defaultns} checked{/if} />
              <span class="checkmark"></span>
              {lang key='nschoicecustom'}
            </label>
          </div>

          {* Input fields for up to 5 custom nameservers *}
          <div class="form-group d-flex flex-column gap-4 mb-4">
            {for $num=1 to 5}
              <div class="row">
                <label for="inputNs{$num}" class="col-sm-4 col-form-label">{lang key='clientareanameserver'} {$num}</label>
                <div class="col-md-7">
                  {* Individual nameserver input with dynamic disable/enable functionality *}
                  <input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" value="{$nameservers[$num].value}" />
                </div>
              </div>
            {/for}
          </div>

          {* Form submission button *}
          <div class="row">
            <div class="col-sm-8 offset-sm-4">
              <button type="submit" class="btn btn-primary btn-sm">
                {lang key='changenameservers'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  {* REGISTRAR LOCK TAB - Domain transfer protection *}
  <div class="tab-pane fade" id="tabReglock">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='domainregistrarlock'}</h3>

        {* Display result of lock status change *}
        {if $subaction eq "savereglock"}
          {if $updatesuccess}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
          {elseif $error}
            {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
          {/if}
        {/if}

        {* Information about domain locking feature *}
        {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainlockingexp'}"}

        {* Additional explanation text *}
        <p class="mb-4">{lang key='domainlockingexp'}</p>

        {* Current lock status with color-coded indicator *}
        {* NOTE: This has a bug - uses auto-renew language keys instead of lock-specific ones *}
        <h4 class="text-size-base mb-4">{lang key='domainreglockstatus'}: <span class="label label-{if $lockstatus == "locked"}success{else}danger{/if}">{if $lockstatus == "locked"}{lang key='domainsautorenewenabled'}{else}{lang key='domainsautorenewdisabled'}{/if}</span></h4>

        {* Toggle form for domain lock status *}
        <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabReglock">
          <input type="hidden" name="id" value="{$domainid}">
          <input type="hidden" name="sub" value="savereglock" />
          {if $lockstatus=="locked"}
            {* Show unlock button for locked domains *}
            <button type="submit" class="btn btn-danger btn-sm">
              {lang key='domainreglockdisable'}
            </button>
          {else}
            {* Show lock button for unlocked domains *}
            <button type="submit" class="btn btn-success btn-sm" name="reglock" value="1">
              {lang key='domainreglockenable'}
            </button>
          {/if}
        </form>
      </div>
    </div>
  </div>

  {* DOMAIN RELEASE TAB - Transfer domain away from current registrar *}
  <div class="tab-pane fade" id="tabRelease">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='domainrelease'}</h3>

        {* Display result of domain release operation *}
        {if $releaseDomainSuccessful}
          {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter="true"}
        {elseif !empty($error)}
          {include file="$template/includes/alert.tpl" type="error" msg="$error" textcenter="true"}
        {/if}

        {* Information about domain release/transfer process *}
        {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainreleasedescription'}"}

        {* Domain release form *}
        <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabRelease">
          <input type="hidden" name="sub" value="releasedomain">
          <input type="hidden" name="id" value="{$domainid}">

          {* Transfer tag input field *}
          <div class="form-group row mb-4">
            <label for="inputReleaseTag" class="col-lg-4 col-form-label">{lang key='domainreleasetag'}</label>
            <div class="col-lg-8">
              <input type="text" class="form-control" id="inputReleaseTag" name="transtag" />
            </div>
          </div>

          {* Form submission button *}
          <div class="row">
            <div class="col-lg-8 offset-lg-4">
              <button type="submit" class="btn btn-primary btn-sm">
                {lang key='domainrelease'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  {* ADDONS TAB - Additional domain services and features *}
  <div class="tab-pane fade" id="tabAddons">
    <div class="card extra-padding">
      <div class="card-body">
        <h3 class="card-title">{lang key='domainaddons'}</h3>

        {* General information about available addons *}
        <p>{lang key='domainaddonsinfo'}</p>

        <hr>

        {* ID Protection Addon - Privacy service *}
        {if $addons.idprotection}
          <div class="row mb-3">
            <div class="col-3 col-md-2 text-center">
              {* Shield icon represents privacy/protection *}
              <i class="fas fa-shield-alt fa-3x"></i>
            </div>
            <div class="col-9 col-md-10">
              <strong>{lang key='domainidprotection'}</strong><br />
              {lang key='domainaddonsidprotectioninfo'}<br />
              {* Form to enable/disable ID protection service *}
              <form action="clientarea.php?action=domainaddons" method="post">
                <input type="hidden" name="id" value="{$domainid}" />
                {if $addonstatus.idprotection}
                  {* Service is active - show disable option *}
                  <input type="hidden" name="disable" value="idprotect" />
                  <button type="submit" class="btn btn-danger btn-sm">
                    {lang key='disable'}
                  </button>
                {else}
                  {* Service is inactive - show purchase option with pricing *}
                  <input type="hidden" name="buy" value="idprotect" />
                  <button type="submit" class="btn btn-success btn-sm">
                    {lang key='domainaddonsbuynow'} {$addonspricing.idprotection}
                  </button>
                {/if}
              </form>
            </div>
          </div>
        {/if}

        {* DNS Management Addon - Advanced DNS control *}
        {if $addons.dnsmanagement}
          <hr>
          <div class="row">
            <div class="col-3 col-md-2 text-center">
              {* Cloud icon represents DNS/hosting services *}
              <i class="fas fa-cloud fa-3x"></i>
            </div>
            <div class="col-9 col-md-10">
              <strong>{lang key='domainaddonsdnsmanagement'}</strong><br />
              {lang key='domainaddonsdnsmanagementinfo'}<br />
              <form action="clientarea.php?action=domainaddons" method="post">
                <input type="hidden" name="id" value="{$domainid}" />
                {if $addonstatus.dnsmanagement}
                  {* Service is active - show manage and disable options *}
                  <input type="hidden" name="disable" value="dnsmanagement" />
                  <a class="btn btn-success" href="clientarea.php?action=domaindns&domainid={$domainid}">{lang key='manage'}</a>
                  <button type="submit" class="btn btn-danger btn-sm">
                    {lang key='disable'}
                  </button>
                {else}
                  {* Service is inactive - show purchase option with pricing *}
                  <input type="hidden" name="buy" value="dnsmanagement" />
                  <button type="submit" class="btn btn-success btn-sm">
                    {lang key='domainaddonsbuynow'} {$addonspricing.dnsmanagement}
                  </button>
                {/if}
              </form>
            </div>
          </div>
        {/if}

        {* Email Forwarding Addon - Email redirection service *}
        {if $addons.emailforwarding}
          <hr>
          <div class="row mb-3">
            <div class="col-3 col-md-2 text-center">
              {* Combined email and forward icons to represent email forwarding *}
              <i class="fas fa-envelope fa-3x">&nbsp;</i><i class="fas fa-share fa-2x"></i>
            </div>
            <div class="col-9 col-md-10">
              <strong>{lang key='domainemailforwarding'}</strong><br />
              {lang key='domainaddonsemailforwardinginfo'}<br />
              <form action="clientarea.php?action=domainaddons" method="post">
                <input type="hidden" name="id" value="{$domainid}" />
                {if $addonstatus.emailforwarding}
                  {* Service is active - show manage and disable options *}
                  <input type="hidden" name="disable" value="emailfwd" />
                  <a class="btn btn-success" href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{lang key='manage'}</a>
                  <button type="submit" class="btn btn-danger btn-sm">
                    {lang key='disable'}
                  </button>
                {else}
                  {* Service is inactive - show purchase option with pricing *}
                  <input type="hidden" name="buy" value="emailfwd" />
                  <button type="submit" class="btn btn-success btn-sm">
                    {lang key='domainaddonsbuynow'} {$addonspricing.emailforwarding}
                  </button>
                {/if}
              </form>
            </div>
          </div>
        {/if}

        <hr>
      </div>
    </div>
  </div>
</div>