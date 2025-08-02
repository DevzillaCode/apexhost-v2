{* Module Custom Button Alert *}
{if $modulecustombuttonresult}
  {if $modulecustombuttonresult == "success"}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" idname="alertModuleCustomButtonSuccess"}
  {else}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}"|cat:' ':$modulecustombuttonresult idname="alertModuleCustomButtonFailed"}
  {/if}
{/if}

{* Pending Cancellation Alert *}
{if $pendingcancellation}
  {include file="$template/includes/alert.tpl" type="error" msg="{lang key='cancellationrequestedexplanation'}" idname="alertPendingCancellation"}
{/if}

{* Unpaid invoice Alert *}
{if $unpaidInvoice}
  <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
    <div class="d-flex align-items-center flex-wrap gap-4">
      <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-semi-ghost-info btn-xs">
        {lang key='payInvoice'}
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right-icon lucide-chevron-right">
          <path d="m9 18 6-6-6-6" />
        </svg>
      </a>
      {$unpaidInvoiceMessage}
    </div>
  </div>
{/if}

{* Tab Content *}
<div class="tab-content">
  {* Tab Overview *}
  <div class="tab-pane fade show active" role="tabpanel" id="tabOverview">
    {* Tab Content *}
    {if $tplOverviewTabOutput}
      {$tplOverviewTabOutput}
    {else}
      <div class="d-flex flex-column row-gap-4">
        {* Card *}
        <div class="card">
          <div class="card-body">
            {* Product Details *}
            <div class="product-details">
              {* Row *}
              <div class="row">
                {* Col *}
                <div class="col-md-6">
                  {* Product Status *}
                  <div class="product-status">
                    {* Product Icon *}
                    <div class="product-icon d-flex flex-column align-items-center">
                      {* icon-container *}
                      <div class="icon-container d-flex align-items-center justify-content-center mb-4">
                        {if $type eq "hostingaccount" || $type == "reselleraccount"}
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-hard-drive-icon lucide-hard-drive">
                            <line x1="22" x2="2" y1="12" y2="12" />
                            <path d="M5.45 5.11 2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
                            <line x1="6" x2="6.01" y1="16" y2="16" />
                            <line x1="10" x2="10.01" y1="16" y2="16" />
                          </svg>
                        {elseif $type eq "server"}
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-database-icon lucide-database">
                            <ellipse cx="12" cy="5" rx="9" ry="3" />
                            <path d="M3 5V19A9 3 0 0 0 21 19V5" />
                            <path d="M3 12A9 3 0 0 0 21 12" />
                          </svg>
                        {else}
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-archive-icon lucide-archive">
                            <rect width="20" height="5" x="2" y="3" rx="1" />
                            <path d="M4 8v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8" />
                            <path d="M10 12h4" />
                          </svg>
                        {/if}
                      </div>
                      {* text *}
                      <h3 class="title-4 mb-2">{$product}</h3>
                      <h4 class="title-6 text-muted">{$groupname}</h4>
                    </div>
                    {* Product Status Text *}
                    <div class="product-status-text product-status-{$rawstatus|strtolower}">
                      {$status}
                    </div>
                  </div>

                  {* Actions *}
                  {if $showRenewServiceButton === true || $showcancelbutton === true || $packagesupgrade === true}
                    <div class="row product-actions-wrapper row-gap-2 mt-4">
                      {if $packagesupgrade}
                        <div class="col-12">
                          <a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-block btn-semi-ghost-success">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-arrow-up-icon lucide-circle-arrow-up">
                              <circle cx="12" cy="12" r="10" />
                              <path d="m16 12-4-4-4 4" />
                              <path d="M12 16V8" />
                            </svg>
                            {lang key='upgrade'}
                          </a>
                        </div>
                      {/if}
                      {if $showRenewServiceButton === true}
                        <div class="col-12">
                          <a href="{routePath('service-renewals-service', $id)}" class="btn btn-block btn-semi-ghost-info">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-ccw-icon lucide-refresh-ccw">
                              <path d="M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                              <path d="M3 3v5h5" />
                              <path d="M3 12a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.74L21 16" />
                              <path d="M16 16h5v5" />
                            </svg>
                            {lang key='renewService.titleSingular'}
                          </a>
                        </div>
                      {/if}
                      {if $showcancelbutton}
                        <div class="col-12">
                          <a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-block btn-semi-ghost-danger {if $pendingcancellation}disabled{/if}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ban-icon lucide-ban">
                              <path d="M4.929 4.929 19.07 19.071" />
                              <circle cx="12" cy="12" r="10" />
                            </svg>
                            {if $pendingcancellation}
                              {lang key='cancellationrequested'}
                            {else}
                              {lang key='clientareacancelrequestbutton'}
                            {/if}
                          </a>
                        </div>
                      {/if}
                    </div>
                  {/if}

                </div>
                {* Col *}
                <div class="col-md-6 text-center">
                  <div class="d-flex flex-column align-items-center row-gap-4">
                    <div>
                      <h4 class="title-6 mb-1">{lang key='clientareahostingregdate'}</h4>
                      <p class="text-size-sm text-muted">
                        {$regdate}
                      </p>
                    </div>
                    {if $firstpaymentamount neq $recurringamount}
                      <div>
                        <h4 class="title-6 mb-1">{lang key='firstpaymentamount'}</h4>
                        <p class="text-size-sm text-muted">
                          {$firstpaymentamount}
                        </p>
                      </div>
                    {/if}
                    {if $billingcycle != "{lang key='orderpaymenttermonetime'}" && $billingcycle != "{lang key='orderfree'}"}
                      <div>
                        <h4 class="title-6 mb-1">{lang key='recurringamount'}</h4>
                        <p class="text-size-sm text-muted">
                          {$recurringamount}
                        </p>
                      </div>
                    {/if}
                    {if $quantitySupported && $quantity > 1}
                      <div>
                        <h4 class="title-6 mb-1">{lang key='quantity'}</h4>
                        <p class="text-size-sm text-muted">
                          {$quantity}
                        </p>
                      </div>
                    {/if}
                    <div>
                      <h4 class="title-6 mb-1">{lang key='orderbillingcycle'}</h4>
                      <p class="text-size-sm text-muted">
                        {$billingcycle}
                      </p>
                    </div>
                    <div>
                      <h4 class="title-6 mb-1">{lang key='clientareahostingnextduedate'}</h4>
                      <p class="text-size-sm text-muted">
                        {$nextduedate}
                      </p>
                    </div>
                    <div>
                      <h4 class="title-6 mb-1">{lang key='orderpaymentmethod'}</h4>
                      <p class="text-size-sm text-muted">
                        {$paymentmethod}
                      </p>
                    </div>
                    {if $suspendreason}
                      <div>
                        <h4 class="title-6 mb-2">{lang key='suspendreason'}</h4>
                        <p class="text-size-sm text-muted">
                          {$suspendreason}
                        </p>
                      </div>
                    {/if}
                  </div>

                </div>
              </div>

            </div>
          </div>
        </div>

        {* Hook *}
        {foreach $hookOutput as $output}
          <div>
            {$output}
          </div>
        {/foreach}

        {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}

          <div>
            <ul class="nav nav-tabs responsive-tabs-sm">
              {if $domain}
                <li class="nav-item">
                  <a href="#domain" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {if $type eq "server"}{lang key='sslserverinfo'}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{lang key='hostingInfo'}{else}{lang key='clientareahostingdomain'}{/if}</a>
                </li>
              {elseif $moduleclientarea}
                <li class="nav-item">
                  <a href="#manage" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {lang key='manage'}</a>
                </li>
              {/if}
              {if $configurableoptions}
                <li class="nav-item">
                  <a href="#configoptions" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea} active{/if}"><i class="fas fa-cubes fa-fw"></i> {lang key='orderconfigpackage'}</a>
                </li>
              {/if}
              {if $metricStats}
                <li class="nav-item">
                  <a href="#metrics" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions} active{/if}"><i class="fas fa-chart-line fa-fw"></i> {lang key='metrics.title'}</a>
                </li>
              {/if}
              {if $customfields}
                <li class="nav-item">
                  <a href="#additionalinfo" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$metricStats && !$configurableoptions} active{/if}"><i class="fas fa-info fa-fw"></i> {lang key='additionalInfo'}</a>
                </li>
              {/if}
              {if $lastupdate}
                <li class="nav-item">
                  <a href="#resourceusage" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} active{/if}"><i class="fas fa-inbox fa-fw"></i> {lang key='resourceUsage'}</a>
                </li>
              {/if}
            </ul>
            <div class="responsive-tabs-sm-connector">
              <div class="channel"></div>
              <div class="bottom-border"></div>
            </div>
            <div class="tab-content product-details-tab-container">
              {if $domain}
                <div class="tab-pane fade show active text-center" role="tabpanel" id="domain">
                  {if $type eq "server"}
                    <div class="row mb-2">
                      <div class="col-sm-5 text-right">
                        <strong>{lang key='serverhostname'}</strong>
                      </div>
                      <div class="col-sm-7 text-left">
                        {$domain}
                      </div>
                    </div>
                    {if $dedicatedip}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='primaryIP'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$dedicatedip}
                        </div>
                      </div>
                    {/if}
                    {if $assignedips}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='assignedIPs'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$assignedips|nl2br}
                        </div>
                      </div>
                    {/if}
                    {if $ns1 || $ns2}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='domainnameservers'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$ns1}<br />{$ns2}
                        </div>
                      </div>
                    {/if}
                  {else}
                    {if $domain}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='orderdomain'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$domain}
                        </div>
                      </div>
                    {/if}
                    {if $username}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='serverusername'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$username}
                        </div>
                      </div>
                    {/if}
                    {if $serverdata}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='servername'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$serverdata.hostname}
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='domainregisternsip'}</strong>
                        </div>
                        <div class="col-sm-7 text-left">
                          {$serverdata.ipaddress}
                        </div>
                      </div>
                      {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                        <div class="row mb-2">
                          <div class="col-sm-5 text-right">
                            <strong>{lang key='domainnameservers'}</strong>
                          </div>
                          <div class="col-sm-7 text-left">
                            {if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
                            {if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
                            {if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
                            {if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
                            {if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}
                          </div>
                        </div>
                      {/if}
                    {/if}
                    {if $domain && $sslStatus}
                      <div class="row mb-2">
                        <div class="col-sm-5 text-right">
                          <strong>{lang key='sslState.sslStatus'}</strong>
                        </div>
                        <div class="col-sm-7 text-left{if $sslStatus->isInactive()} ssl-inactive{/if}">
                          <img src="{$sslStatus->getImagePath()}" width="12" data-type="service" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}" />
                          <span id="statusDisplayLabel">
                            {if !$sslStatus->needsResync()}
                              {$sslStatus->getStatusDisplayLabel()}
                            {else}
                              {lang key='loading'}
                            {/if}
                          </span>
                        </div>
                      </div>
                      {if $sslStatus->isActive() || $sslStatus->needsResync()}
                        <div class="row mb-2">
                          <div class="col-sm-5 text-right">
                            <strong>{lang key='sslState.startDate'}</strong>
                          </div>
                          <div class="col-sm-7 text-left" id="ssl-startdate">
                            {if !$sslStatus->needsResync() || $sslStatus->startDate}
                              {$sslStatus->startDate->toClientDateFormat()}
                            {else}
                              {lang key='loading'}
                            {/if}
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-sm-5 text-right">
                            <strong>{lang key='sslState.expiryDate'}</strong>
                          </div>
                          <div class="col-sm-7 text-left" id="ssl-expirydate">
                            {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                              {$sslStatus->expiryDate->toClientDateFormat()}
                            {else}
                              {lang key='loading'}
                            {/if}
                          </div>
                        </div>
                        <div class="row mb-2">
                          <div class="col-sm-5 text-right">
                            <strong>{lang key='sslState.issuerName'}</strong>
                          </div>
                          <div class="col-sm-7 text-left" id="ssl-issuer">
                            {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                              {$sslStatus->issuerName}
                            {else}
                              {lang key='loading'}
                            {/if}
                          </div>
                        </div>
                      {/if}
                    {/if}
                    <br>
                    <p>
                      <a href="http://{$domain}" class="btn btn-semi-ghost-info btn-sm" target="_blank">
                        {lang key='visitwebsite'}
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                          <path d="M5 12h14" />
                          <path d="m12 5 7 7-7 7" />
                        </svg>
                      </a>
                      {if $domainId}
                        <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-light btn-sm" target="_blank">{lang key='managedomain'}</a>
                      {/if}
                    </p>
                  {/if}
                  {if $moduleclientarea}
                    <div class="text-center module-client-area">
                      {$moduleclientarea}
                    </div>
                  {/if}
                </div>
                {if $sslStatus}
                  <div class="tab-pane fade text-center" role="tabpanel" id="ssl-info">
                    {if $sslStatus->isActive()}
                      <div class="alert alert-success" role="alert">
                        {lang key='sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
                      </div>
                    {else}
                      <div class="alert alert-warning ssl-required" role="alert">
                        {lang key='sslInactive'}
                      </div>
                    {/if}
                  </div>
                {/if}
              {elseif $moduleclientarea}
                <div class="tab-pane fade{if !$domain} show active{/if} text-center" role="tabpanel" id="manage">
                  {if $moduleclientarea}
                    <div class="text-center module-client-area">
                      {$moduleclientarea}
                    </div>
                  {/if}
                </div>
              {/if}
              {if $configurableoptions}
                <div class="tab-pane fade{if !$domain && !$moduleclientarea} show active{/if} text-center" role="tabpanel" id="configoptions">
                  {foreach from=$configurableoptions item=configoption}
                    <div class="row">
                      <div class="col-sm-5">
                        <strong>{$configoption.optionname}</strong>
                      </div>
                      <div class="col-sm-7 text-left">
                        {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                      </div>
                    </div>
                  {/foreach}
                </div>
              {/if}
              {if $metricStats}
                <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} show active{/if}" role="tabpanel" id="metrics">
                  {include file="$template/clientareaproductusagebilling.tpl"}
                </div>
              {/if}
              {if $customfields}
                <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$metricStats} show active{/if} text-center" role="tabpanel" id="additionalinfo">
                  {foreach from=$customfields item=field}
                    <div class="row">
                      <div class="col-sm-5">
                        <strong>{$field.name}</strong>
                      </div>
                      <div class="col-sm-7 text-left">
                        {$field.value}
                      </div>
                    </div>
                  {/foreach}
                </div>
              {/if}
              {if $lastupdate}
                <div class="tab-pane fade text-center" role="tabpanel" id="resourceusage">
                  <div class="row">
                    <div class="col-sm-10 offset-sm-1">
                      <div class="row">
                        <div class="col-sm-6">
                          <h4>{lang key='diskSpace'}</h4>
                          <input type="text" value="{$diskpercent|substr:0:-1}" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                          <p>{$diskusage}MB / {$disklimit}MB</p>
                        </div>
                        <div class="col-sm-6">
                          <h4>{lang key='bandwidth'}</h4>
                          <input type="text" value="{$bwpercent|substr:0:-1}" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                          <p>{$bwusage}MB / {$bwlimit}MB</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <p class="text-muted mb-0">{lang key='clientarealastupdated'}: {$lastupdate}</p>
                  <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                  <script>
                    jQuery(function() {
                      jQuery(".dial-usage").knob({
                        'format': function(v) {
                          alert(v);
                        }
                      });
                    });
                  </script>
                </div>

              {/if}
            </div>
          </div>
        {/if}
      </div>
    {/if}
  </div>
</div>









<!-- Success Alert -->
<div class="alert alert-success" id="alertModuleCustomButtonSuccess">
  Module action was successful.
</div>

<!-- Error Alert -->
<div class="alert alert-danger" id="alertModuleCustomButtonFailed">
  Module action failed: Something went wrong.
</div>

<!-- Pending Cancellation -->
<div class="alert alert-danger" id="alertPendingCancellation">
  Cancellation requested. The service will terminate at the end of the billing period.
</div>

<!-- Unpaid Invoice (Overdue Example) -->
<div class="alert alert-danger" id="alertOverdueInvoice">
  <div class="d-flex align-items-center flex-wrap gap-4">
    <a href="viewinvoice.php?id=1234" class="btn btn-xs btn-semi-ghost-info">Pay Invoice
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right-icon lucide-chevron-right">
        <path d="m9 18 6-6-6-6" />
      </svg>
    </a>
    Your invoice #1234 is overdue. Please make payment immediately.
  </div>
</div>

<div class="tab-content">
  {* tab-overview *}
  <div class="tab-pane fade show active" role="tabpanel" id="tabOverview">
    {* card *}
    <div class="card">
      <div class="card-body">
        <div class="product-details">
          <div class="row row-gap-4">
            {* col *}
            <div class="col-12">
              {* custom-product-status *}
              <div class="custom-product-status">
                {* main-info-se *}
                <div class="main-info-se">
                  <h3 class="product-title">Basic Hosting Plan</h3>
                  <h4 class="product-subtitle">Shared Hosting</h4>
                  <span class="label status status-active">Active</span>
                </div>
                {* details-se *}
                <div class="details-se">
                  <div class="text-bar">
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Registration Date</p>
                      <p class="text-muted">2023-01-01</p>
                    </div>
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">First Payment Amount</p>
                      <p class="text-muted">$10.00 USD</p>
                    </div>
                  </div>
                </div>
                {* details-se *}
                <div class="details-se">
                  <div class="text-bar">
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Recurring Amount</p>
                      <p class="text-muted">$5.00 USD</p>
                    </div>
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Quantity</p>
                      <p class="text-muted">2</p>
                    </div>
                  </div>
                </div>
                {* details-se *}
                <div class="details-se">
                  <div class="text-bar">
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Billing Cycle</p>
                      <p class="text-muted">Monthly</p>
                    </div>
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Monthly</p>
                      <p class="text-muted">2025-08-15</p>
                    </div>
                  </div>
                </div>
                {* details-se *}
                <div class="details-se last-details-se">
                  <div class="text-bar">
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Payment Method</p>
                      <p class="text-muted">PayPal</p>
                    </div>
                    <!-- text -->
                    <div class="text">
                      <p class="font-weight-semibold">Suspend Reason</p>
                      <p class="text-muted">Payment overdue</p>
                    </div>
                  </div>
                </div>
                {* actions *}
                <div class="product-actions">
                  <a href="upgrade.php?type=package&id=1" class="btn btn-semi-ghost-success btn-xs">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-fading-arrow-up-icon lucide-circle-fading-arrow-up">
                      <path d="M12 2a10 10 0 0 1 7.38 16.75" />
                      <path d="m16 12-4-4-4 4" />
                      <path d="M12 16V8" />
                      <path d="M2.5 8.875a10 10 0 0 0-.5 3" />
                      <path d="M2.83 16a10 10 0 0 0 2.43 3.4" />
                      <path d="M4.636 5.235a10 10 0 0 1 .891-.857" />
                      <path d="M8.644 21.42a10 10 0 0 0 7.631-.38" />
                    </svg>
                    Upgrade
                  </a>
                  <a href="/clientarea.php?action=renew&id=1" class="btn btn-semi-ghost-info btn-xs">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-ccw-icon lucide-refresh-ccw">
                      <path d="M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                      <path d="M3 3v5h5" />
                      <path d="M3 12a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.74L21 16" />
                      <path d="M16 16h5v5" />
                    </svg>
                    Renew
                  </a>
                  <a href="clientarea.php?action=cancel&id=1" class="btn btn-semi-ghost-danger btn-xs">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ban-icon lucide-ban">
                      <path d="M4.929 4.929 19.07 19.071" />
                      <circle cx="12" cy="12" r="10" />
                    </svg>
                    Cancellation Requested
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    {* hook *}
    {foreach $hookOutput as $output}
      <div class="my-4">
        {$output}
      </div>
    {/foreach}
    <ul class="nav nav-tabs responsive-tabs-sm">
      <li class="nav-item">
        <a href="#domain" data-toggle="tab" class="nav-link active">
          <i class="fas fa-globe fa-fw"></i> Hosting Info
        </a>
      </li>
      <li class="nav-item">
        <a href="#manage" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Manage
        </a>
      </li>
      <li class="nav-item">
        <a href="#configoptions" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Configuration
        </a>
      </li>
      <li class="nav-item">
        <a href="#metrics" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Metrics
        </a>
      </li>
      <li class="nav-item">
        <a href="#additionalinfo" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Additional Info
        </a>
      </li>
      <li class="nav-item">
        <a href="#resourceusage" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Resource Usage
        </a>
      </li>
      <li class="nav-item">
        <a href="#tabDownloads" data-toggle="tab" class="nav-link">
          <i class="fas fa-globe fa-fw"></i> Downloads
        </a>
      </li>
    </ul>
    <div class="tab-content product-details-tab-container">
      {* domain *}
      <div class="tab-pane fade show active" role="tabpanel" id="domain">
        <div class="d-flex flex-column row-gap-2">
          <div class="row">
            <div class="col-sm-2"><strong>Domain</strong></div>
            <div class="col-sm-9">example.com</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>Username</strong></div>
            <div class="col-sm-9">user123</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>Server Name</strong></div>
            <div class="col-sm-9">server1.hostingco.com</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>Server IP</strong></div>
            <div class="col-sm-9">192.168.0.1</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>Nameservers</strong></div>
            <div class="col-sm-9">
              ns1.hostingco.com (192.168.0.2)<br>
              ns2.hostingco.com (192.168.0.3)
            </div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>SSL Status</strong></div>
            <div class="col-sm-9">
              <img src="path/to/ssl/active.png" width="12" />
              <span>Active</span>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>SSL Start Date</strong></div>
            <div class="col-sm-9">2025-01-01</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>SSL Expiry Date</strong></div>
            <div class="col-sm-9">2026-01-01</div>
          </div>

          <div class="row">
            <div class="col-sm-2"><strong>SSL Issuer</strong></div>
            <div class="col-sm-9">Let's Encrypt</div>
          </div>
        </div>

        <br>
        <div class="d-flex flex-wrap gap-2">
          <a href="http://example.com" class="btn btn-semi-ghost-info btn-sm" target="_blank">
            Visit Website
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
              <path d="M5 12h14" />
              <path d="m12 5 7 7-7 7" />
            </svg></a>
          <a href="clientarea.php?action=domaindetails&id=1" class="btn btn-semi-ghost-secondary btn-sm" target="_blank">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
              <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
              <circle cx="12" cy="12" r="3" />
            </svg>
            Manage Domain
          </a>
        </div>
      </div>
      {* moduleclientarea *}
      <div class="tab-pane fade" role="tabpanel" id="manage">
        <div class="text-center module-client-area">
          {$moduleclientarea}
        </div>
      </div>
      {* configoptions *}
      <div class="tab-pane fade" role="tabpanel" id="configoptions">
        <div class="d-flex flex-column row-gap-2">
          <div class="row">
            <div class="col-sm-2"><strong>Backup Option</strong></div>
            <div class="col-sm-9">Yes</div>
          </div>
          <div class="row">
            <div class="col-sm-2"><strong>Storage Space</strong></div>
            <div class="col-sm-9">5 x 10GB</div>
          </div>
        </div>
      </div>
      {* metrics *}
      <div class="tab-pane fade" role="tabpanel" id="metrics">
        <div class="text-center p-3">
          <h4 class="title-6 mb-2">Usage Metrics</h4>
          <p>No billing data available (static preview).</p>
        </div>
      </div>
      {* additionalinfo *}
      <div class="tab-pane fade" role="tabpanel" id="additionalinfo">
        <div class="d-flex flex-column row-gap-2">
          <div class="row">
            <div class="col-sm-2"><strong>Site Purpose</strong></div>
            <div class="col-sm-9">Portfolio Website</div>
          </div>
          <div class="row">
            <div class="col-sm-2"><strong>Account Manager</strong></div>
            <div class="col-sm-9">John Doe</div>
          </div>
        </div>
      </div>
      {* resourceusage *}
      <div class="tab-pane fade" role="tabpanel" id="resourceusage">
        <div class="row">
          <div class="col-12">
            <div class="row">
              <div class="col-sm-6">
                <h4 class="title-6 mb-2">Disk Space</h4>
                <input type="text" value="40" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                <p class="text-muted mt-2">4GB / 10GB</p>
              </div>
              <div class="col-sm-6">
                <h4 class="title-6 mb-2">Bandwidth</h4>
                <input type="text" value="60" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                <p class="text-muted mt-2">60GB / 100GB</p>
              </div>
            </div>
          </div>
        </div>
        <p class="text-muted mt-2">Last Updated: 2025-07-29</p>
      </div>
    </div>

  </div>

  {* downloads *}
  <div class="tab-pane fade active show" role="tabpanel" id="tabDownloads">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">Available Downloads</h3>

        <div class="alert alert-info">Downloads available for this product.</div>

        <div class="row">
          <div class="col-12">
            <h4 class="title-6 mb-2">User Manual PDF</h4>
            <p class="text-muted mb-4">Complete product documentation and usage guide.</p>
            <p>
              <a href="/downloads/manual.pdf" class="btn btn-semi-ghost-info btn-sm">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-download-icon lucide-download">
                  <path d="M12 15V3" />
                  <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                  <path d="m7 10 5 5 5-5" />
                </svg>
                Download
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>

  {* addons *}
  <div class="tab-pane fade show active" id="tabAddons">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">Product Addons</h3>

        <div class="alert alert-info">Addons are available for this product.</div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                Extra IP Address
                <div class="float-right label status-active">Active</div>
              </div>
              <div class="row card-body">
                <div class="col-md-6">
                  <p>$2.00/mo</p>
                  <p>Registered: 2024-10-01</p>
                  <p>Next Due Date: 2025-10-01</p>
                </div>
              </div>
              <div class="card-footer">
                <a href="#" class="btn btn-semi-ghost-secondary btn-sm">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
                    <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
                    <circle cx="12" cy="12" r="3" />
                  </svg>
                  Manage
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  {* change-password *}
  <div class="tab-pane fade show active" id="tabChangepw">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">Change Password</h3>

        <form class="using-password-strength" method="post" action="#">
          <input type="hidden" name="id" value="1" />
          <input type="hidden" name="modulechangepassword" value="true" />

          <div class="form-group row has-feedback mb-4">
            <label class="col-xl-4 form-label">New Password</label>
            <div class="col-xl-5">
              <input type="password" class="form-control" name="newpw" />
              <!-- pwstrength.tpl can be skipped in test -->
            </div>
            <div class="col-xl-3">
              <button type="button" class="btn btn-light btn-block btn-sm">Generate Password</button>
            </div>
          </div>

          <div class="form-group row has-feedback mb-4">
            <label class="col-xl-4 form-label">Confirm New Password</label>
            <div class="col-xl-5">
              <input type="password" class="form-control" name="confirmpw" />
            </div>
          </div>

          <div class="form-group row">
            <div class="offset-xl-4 col-xl-6">
              <div class="d-flex col-gap-2">
                <input class="btn btn-primary btn-sm" type="submit" value="Save Changes" />
                <input class="btn btn-semi-ghost-secondary btn-sm" type="reset" value="Cancel" />
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>



{* order-summary *}
<div class="order-summary" id="orderSummary">
  {* Loading spinner for order summary *}
  <div class="loader w-hidden" id="orderSummaryLoader">
    <svg class="fa-spin" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-loader-icon lucide-loader">
      <path d="M12 2v4" />
      <path d="m16.2 7.8 2.9-2.9" />
      <path d="M18 12h4" />
      <path d="m16.2 16.2 2.9 2.9" />
      <path d="M12 18v4" />
      <path d="m4.9 19.1 2.9-2.9" />
      <path d="M2 12h4" />
      <path d="m4.9 4.9 2.9 2.9" />
    </svg>
  </div>
  {* Order summary title *}
  <h2 class="order-summary-title">{$LANG.ordersummary}</h2>
  {* Dynamic content container for cart totals *}
  <div class="summary-container">
    {* subtotal *}
    <div class="subtotal clearfix">
      <span class="pull-left float-left">{$LANG.ordersubtotal}</span>
      <span id="subtotal" class="pull-right float-right">{$subtotal}</span>
    </div>
    {* tax *}
    {if $promotioncode || $taxrate || $taxrate2}
      <div class="bordered-totals">
        {if $promotioncode}
          <div class="clearfix">
            <span class="pull-left float-left">{$promotiondescription}</span>
            <span id="discount" class="pull-right float-right">{$discount}</span>
          </div>
        {/if}
        {if $taxrate}
          <div class="clearfix">
            <span class="pull-left float-left">{$taxname} @ {$taxrate}%</span>
            <span id="taxTotal1" class="pull-right float-right">{$taxtotal}</span>
          </div>
        {/if}
        {if $taxrate2}
          <div class="clearfix">
            <span class="pull-left float-left">{$taxname2} @ {$taxrate2}%</span>
            <span id="taxTotal2" class="pull-right float-right">{$taxtotal2}</span>
          </div>
        {/if}
      </div>
    {/if}
    {* recurring *}
    <div class="recurring-totals clearfix">
      <span class="pull-left float-left">{$LANG.orderForm.totals}</span>
      <span id="recurring" class="pull-right float-right recurring-charges">
        <span id="recurringMonthly" {if !$totalrecurringmonthly}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringmonthly}</span> {$LANG.orderpaymenttermmonthly}<br />
        </span>
        <span id="recurringQuarterly" {if !$totalrecurringquarterly}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringquarterly}</span> {$LANG.orderpaymenttermquarterly}<br />
        </span>
        <span id="recurringSemiAnnually" {if !$totalrecurringsemiannually}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringsemiannually}</span> {$LANG.orderpaymenttermsemiannually}<br />
        </span>
        <span id="recurringAnnually" {if !$totalrecurringannually}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringannually}</span> {$LANG.orderpaymenttermannually}<br />
        </span>
        <span id="recurringBiennially" {if !$totalrecurringbiennially}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringbiennially}</span> {$LANG.orderpaymenttermbiennially}<br />
        </span>
        <span id="recurringTriennially" {if !$totalrecurringtriennially}style="display:none;" {/if}>
          <span class="cost">{$totalrecurringtriennially}</span> {$LANG.orderpaymenttermtriennially}<br />
        </span>
      </span>
    </div>

    {* total due today *}
    <div class="total-due-today total-due-today-padded">
      <span id="totalDueToday" class="amt">{$total}</span>
      <span>{$LANG.ordertotalduetoday}</span>
    </div>

    {* express checkout buttons *}
    <div class="express-checkout-buttons">
      {foreach $expressCheckoutButtons as $checkoutButton}
        {$checkoutButton}
        <div class="separator">
          - {$LANG.or|strtoupper} -
        </div>
      {/foreach}
    </div>

    {* actions *}
    <div class="d-flex col-gap-2 justify-content-end">
      <a href="{$WEB_ROOT}/cart.php" class="btn btn-ghost-secondary btn-sm btn-continue-shopping" id="continueShopping">
        {$LANG.orderForm.continueShopping}
      </a>
      <a href="{$WEB_ROOT}/cart.php?a=checkout&e=false" class="btn btn-success btn-checkout{if $cartitems == 0} disabled{/if}" id="checkout">
        {$LANG.orderForm.checkout}
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
          <path d="M5 12h14" />
          <path d="m12 5 7 7-7 7" />
        </svg>
      </a>
    </div>

  </div>
</div>