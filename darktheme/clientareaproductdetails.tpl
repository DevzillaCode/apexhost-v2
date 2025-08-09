{* Display module action results *}
{if $modulecustombuttonresult}
  {if $modulecustombuttonresult == "success"}
    <!-- Success Alert -->
    <div class="alert-container">
      <div class="alert alert-success alert-float" id="alertModuleCustomButtonSuccess" role="alert">
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
            <p class="alert-message">{lang key='moduleactionsuccess'}</p>
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
    <!-- Error Alert -->
    <div class="alert-container">
      <div class="alert alert-danger alert-float" id="alertModuleCustomButtonFailed" role="alert">
        <div>
          <!-- alert-icon -->
          <div class="alert-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-off-icon lucide-circle-off">
              <path d="m2 2 20 20" />
              <path d="M8.35 2.69A10 10 0 0 1 21.3 15.65" />
              <path d="M19.08 19.08A10 10 0 1 1 4.92 4.92" />
            </svg>
          </div>
          <!-- alert-content -->
          <div class="alert-content">
            <!-- alert-message -->
            <p class="alert-message">{lang key='moduleactionfailed'} {$modulecustombuttonresult}</p>
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

{* Display pending cancellation notice *}
{if $pendingcancellation}
  <!-- Pending Cancellation -->
  <div class="alert-container">
    <div class="alert alert-danger alert-float" id="alertPendingCancellation" role="alert">
      <div>
        <!-- alert-icon -->
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
            <circle cx="12" cy="12" r="10" />
            <path d="m15 9-6 6" />
            <path d="m9 9 6 6" />
          </svg>
        </div>
        <!-- alert-content -->
        <div class="alert-content">
          <!-- alert-message -->
          <p class="alert-message">{lang key='cancellationrequestedexplanation'}</p>
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

{* Display unpaid invoice alert *}
{if $unpaidInvoice}
  <!-- Unpaid Invoice Alert -->
  <div class="alert-container">
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
      <div>
        {* alert-icon *}
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-notepad-text-icon lucide-notepad-text">
            <path d="M8 2v4" />
            <path d="M12 2v4" />
            <path d="M16 2v4" />
            <rect width="16" height="18" x="4" y="4" rx="2" />
            <path d="M8 10h6" />
            <path d="M8 14h8" />
            <path d="M8 18h5" />
          </svg>
        </div>
        {* alert-content *}
        <div class="alert-content">
          {* alert-message *}
          <p class="alert-message">{$unpaidInvoiceMessage}</p>
          {* Quick pay button for unpaid invoice *}
          <a href="viewinvoice.php?id={$unpaidInvoice}" class="alert-link">
            {lang key='payInvoice'}
          </a>
        </div>
        {* close-alert *}
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

<div class="tab-content">
  {* Main Overview Tab *}
  <div class="tab-pane fade show active" role="tabpanel" id="tabOverview">
    {if $tplOverviewTabOutput}
      {* Custom overview tab output *}
      {$tplOverviewTabOutput}
    {else}
      {* Main product details card *}
      <div class="card">
        <div class="card-body">
          <div class="product-details">
            <div class="row row-gap-4">
              {* Product status and information column *}
              <div class="col-12">
                {* Custom product status section *}
                <div class="custom-product-status">
                  {* Main product information *}
                  <div class="main-info-se">
                    <h3 class="product-title">{$product}</h3>
                    <h4 class="product-subtitle">{$groupname}</h4>
                    <span class="label status status-{$rawstatus|strtolower}">{$status}</span>
                  </div>

                  {* Registration and payment details *}
                  <div class="details-se">
                    <div class="text-bar">
                      <!-- Registration Date -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='clientareahostingregdate'}</p>
                        <p class="text-muted">{$regdate}</p>
                      </div>
                      <!-- First Payment Amount -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='firstpaymentamount'}</p>
                        <p class="text-muted">
                          {if $firstpaymentamount neq $recurringamount}
                            {$firstpaymentamount}
                          {else}
                            {$recurringamount}
                          {/if}
                        </p>
                      </div>
                    </div>
                  </div>

                  {* Recurring amount and quantity *}
                  <div class="details-se">
                    <div class="text-bar">
                      <!-- Recurring Amount -->
                      {if $billingcycle != "{lang key='orderpaymenttermonetime'}" && $billingcycle != "{lang key='orderfree'}"}
                        <div class="text">
                          <p class="font-weight-semibold">{lang key='recurringamount'}</p>
                          <p class="text-muted">{$recurringamount}</p>
                        </div>
                      {/if}
                      <!-- Quantity -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='quantity'}</p>
                        <p class="text-muted">
                          {if $quantitySupported && $quantity > 1}
                            {$quantity}
                          {else}
                            {lang key='orderquantitynotsupported'}
                          {/if}
                        </p>
                      </div>
                    </div>
                  </div>

                  {* Billing cycle and next due date *}
                  <div class="details-se">
                    <div class="text-bar">
                      <!-- Billing Cycle -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='orderbillingcycle'}</p>
                        <p class="text-muted">{$billingcycle}</p>
                      </div>
                      <!-- Next Due Date -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='clientareahostingnextduedate'}</p>
                        <p class="text-muted">{$nextduedate}</p>
                      </div>
                    </div>
                  </div>

                  {* Payment method and suspend reason *}
                  <div class="details-se last-details-se">
                    <div class="text-bar">
                      <!-- Payment Method -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='orderpaymentmethod'}</p>
                        <p class="text-muted">{$paymentmethod}</p>
                      </div>
                      <!-- Suspend Reason -->
                      <div class="text">
                        <p class="font-weight-semibold">{lang key='suspendreason'}</p>
                        <p class="text-muted">
                          {if $suspendreason}
                            {$suspendreason}
                          {else}
                            {lang key='nosuspendreason'}
                          {/if}
                        </p>
                      </div>
                    </div>
                  </div>

                  {* Product action buttons *}
                  {if $showRenewServiceButton === true || $showcancelbutton === true || $packagesupgrade === true}
                    <div class="product-actions d-flex col-gap-2">
                      {* Upgrade button *}
                      {if $packagesupgrade}
                        <a href="upgrade.php?type=package&id={$id}" class="btn btn-semi-ghost-success btn-xs">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-fading-arrow-up-icon lucide-circle-fading-arrow-up">
                            <path d="M12 2a10 10 0 0 1 7.38 16.75" />
                            <path d="m16 12-4-4-4 4" />
                            <path d="M12 16V8" />
                            <path d="M2.5 8.875a10 10 0 0 0-.5 3" />
                            <path d="M2.83 16a10 10 0 0 0 2.43 3.4" />
                            <path d="M4.636 5.235a10 10 0 0 1 .891-.857" />
                            <path d="M8.644 21.42a10 10 0 0 0 7.631-.38" />
                          </svg>
                          {lang key='upgrade'}
                        </a>
                      {/if}
                      {* Renew button *}
                      {if $showRenewServiceButton === true}
                        <a href="{routePath('service-renewals-service', $id)}" class="btn btn-semi-ghost-info btn-xs">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-ccw-icon lucide-refresh-ccw">
                            <path d="M21 12a9 9 0 0 0-9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                            <path d="M3 3v5h5" />
                            <path d="M3 12a9 9 0 0 0 9 9 9.75 9.75 0 0 0 6.74-2.74L21 16" />
                            <path d="M16 16h5v5" />
                          </svg>
                          {lang key='renewService.titleSingular'}
                        </a>
                      {/if}
                      {* Cancel/Cancellation button *}
                      {if $showcancelbutton}
                        <a href="clientarea.php?action=cancel&id={$id}" class="btn btn-semi-ghost-danger btn-xs {if $pendingcancellation}disabled{/if}">
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
                      {/if}
                    </div>
                  {/if}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {* Hook output for additional content *}
      {foreach $hookOutput as $output}
        <div class="my-4">
          {$output}
        </div>
      {/foreach}

      {* Conditional tabs based on available data *}
      {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}
        <!-- Navigation tabs -->
        <ul class="nav nav-tabs responsive-tabs-sm mt-8">
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

        <!-- Tab content container -->
        <div class="tab-content product-details-tab-container">
          {* Domain/Server information tab content *}
          {if $domain}
            <div class="tab-pane fade show active" role="tabpanel" id="domain">
              <div class="d-flex flex-column row-gap-2">
                {if $type eq "server"}
                  {* Server-specific information *}
                  <div class="row">
                    <div class="col-lg-2 col-md-4"><strong>{lang key='serverhostname'}</strong></div>
                    <div class="col-lg-10 col-md-8">{$domain}</div>
                  </div>
                  {if $dedicatedip}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='primaryIP'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$dedicatedip}</div>
                    </div>
                  {/if}
                  {if $assignedips}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='assignedIPs'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$assignedips|nl2br}</div>
                    </div>
                  {/if}
                  {if $ns1 || $ns2}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='domainnameservers'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$ns1}<br />{$ns2}</div>
                    </div>
                  {/if}
                {else}
                  {* Hosting account information *}
                  {if $domain}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='orderdomain'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$domain}</div>
                    </div>
                  {/if}
                  {if $username}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='serverusername'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$username}</div>
                    </div>
                  {/if}
                  {if $serverdata}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='servername'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$serverdata.hostname}</div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='domainregisternsip'}</strong></div>
                      <div class="col-lg-10 col-md-8">{$serverdata.ipaddress}</div>
                    </div>
                    {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                      <div class="row">
                        <div class="col-lg-2 col-md-4"><strong>{lang key='domainnameservers'}</strong></div>
                        <div class="col-lg-10 col-md-8">
                          {if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
                          {if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
                          {if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
                          {if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
                          {if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}
                        </div>
                      </div>
                    {/if}
                  {/if}

                  {* SSL Status Information *}
                  {if $domain && $sslStatus}
                    <div class="row">
                      <div class="col-lg-2 col-md-4"><strong>{lang key='sslState.sslStatus'}</strong></div>
                      <div class="col-lg-10 col-md-8{if $sslStatus->isInactive()} ssl-inactive{/if}">
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
                      <div class="row">
                        <div class="col-lg-2 col-md-4"><strong>{lang key='sslState.startDate'}</strong></div>
                        <div class="col-lg-10 col-md-8" id="ssl-startdate">
                          {if !$sslStatus->needsResync() || $sslStatus->startDate}
                            {$sslStatus->startDate->toClientDateFormat()}
                          {else}
                            {lang key='loading'}
                          {/if}
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-2 col-md-4"><strong>{lang key='sslState.expiryDate'}</strong></div>
                        <div class="col-lg-10 col-md-8" id="ssl-expirydate">
                          {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                            {$sslStatus->expiryDate->toClientDateFormat()}
                          {else}
                            {lang key='loading'}
                          {/if}
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-2 col-md-4"><strong>{lang key='sslState.issuerName'}</strong></div>
                        <div class="col-lg-10 col-md-8" id="ssl-issuer">
                          {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                            {$sslStatus->issuerName}
                          {else}
                            {lang key='loading'}
                          {/if}
                        </div>
                      </div>
                    {/if}
                  {/if}
                {/if}
              </div>

              <br>
              <!-- Action buttons for domain management -->
              <div class="d-flex flex-wrap gap-2">
                <a href="http://{$domain}" class="btn btn-semi-ghost-info btn-sm" target="_blank">
                  {lang key='visitwebsite'}
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
                    <path d="M5 12h14" />
                    <path d="m12 5 7 7-7 7" />
                  </svg>
                </a>
                {if $domainId}
                  <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-semi-ghost-secondary btn-sm" target="_blank">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
                      <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
                      <circle cx="12" cy="12" r="3" />
                    </svg>
                    {lang key='managedomain'}
                  </a>
                {/if}
              </div>
            </div>
          {elseif $moduleclientarea}
            {* Module client area tab *}
            <div class="tab-pane fade show active text-center" role="tabpanel" id="manage">
              <div class="text-center module-client-area">
                {$moduleclientarea}
              </div>
            </div>
          {/if}

          {* Configuration options tab *}
          {if $configurableoptions}
            <div class="tab-pane fade{if !$domain && !$moduleclientarea} show active{/if}" role="tabpanel" id="configoptions">
              <div class="d-flex flex-column row-gap-2">
                {foreach from=$configurableoptions item=configoption}
                  <div class="row">
                    <div class="col-lg-2 col-md-4"><strong>{$configoption.optionname}</strong></div>
                    <div class="col-lg-10 col-md-8">
                      {if $configoption.optiontype eq 3}
                        {if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}
                      {elseif $configoption.optiontype eq 4}
                        {$configoption.selectedqty} x {$configoption.selectedoption}
                      {else}
                        {$configoption.selectedoption}
                      {/if}
                    </div>
                  </div>
                {/foreach}
              </div>
            </div>
          {/if}

          {* Metrics tab *}
          {if $metricStats}
            <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} show active{/if}" role="tabpanel" id="metrics">
              <div class="text-center p-3">
                <h4 class="title-6 mb-2">{lang key='metrics.title'}</h4>
                {include file="$template/clientareaproductusagebilling.tpl"}
              </div>
            </div>
          {/if}

          {* Additional information tab *}
          {if $customfields}
            <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$metricStats} show active{/if}" role="tabpanel" id="additionalinfo">
              <div class="d-flex flex-column row-gap-2">
                {foreach from=$customfields item=field}
                  <div class="row">
                    <div class="col-lg-2 col-md-4"><strong>{$field.name}</strong></div>
                    <div class="col-lg-10 col-md-8">{$field.value}</div>
                  </div>
                {/foreach}
              </div>
            </div>
          {/if}

          {* Resource usage tab *}
          {if $lastupdate}
            <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} show active{/if}" role="tabpanel" id="resourceusage">
              <div class="row">
                <div class="col-12">
                  <div class="row">
                    <!-- Disk Space Usage -->
                    <div class="col-sm-6">
                      <h4 class="title-6 mb-2">{lang key='diskSpace'}</h4>
                      <input type="text" value="{$diskpercent|substr:0:-1}" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                      <p class="text-muted mt-2">{$diskusage}MB / {$disklimit}MB</p>
                    </div>
                    <!-- Bandwidth Usage -->
                    <div class="col-sm-6">
                      <h4 class="title-6 mb-2">{lang key='bandwidth'}</h4>
                      <input type="text" value="{$bwpercent|substr:0:-1}" class="form-control dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                      <p class="text-muted mt-2">{$bwusage}MB / {$bwlimit}MB</p>
                    </div>
                  </div>
                </div>
              </div>
              <p class="text-muted mt-2">{lang key='clientarealastupdated'}: {$lastupdate}</p>

              {* JavaScript for usage dials *}
              <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
              <script>
                jQuery(function() {
                  jQuery(".dial-usage").knob({
                    'format': function(v) {
                      return v + '%';
                    }
                  });
                });
              </script>
            </div>
          {/if}
        </div>
      {/if}
    {/if}
  </div>

  {* Downloads tab *}
  <div class="tab-pane fade" role="tabpanel" id="tabDownloads">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">{lang key='downloadstitle'}</h3>

        {if $downloads}
          <div class="alert alert-info">
            <div>
              <p class="alert-message">{lang key="clientAreaProductDownloadsAvailable"}</p>
            </div>
          </div>

          <div class="row">
            {foreach from=$downloads item=download}
              <div class="col-12">
                <h4 class="title-6 mb-2">{$download.title}</h4>
                <p class="text-muted mb-4">{$download.description}</p>
                <p>
                  <a href="{$download.link}" class="btn btn-semi-ghost-info btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-download-icon lucide-download">
                      <path d="M12 15V3" />
                      <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                      <path d="m7 10 5 5 5-5" />
                    </svg>
                    {lang key='downloadname'}
                  </a>
                </p>
              </div>
            {/foreach}
          </div>
        {else}
          <div class="alert alert-info">
            <div>
              <p class="alert-message">{lang key="noDownloads"}</p>
            </div>
          </div>
        {/if}
      </div>
    </div>
  </div>

  {* Addons tab *}
  <div class="tab-pane fade" id="tabAddons">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">{lang key='clientareahostingaddons'}</h3>

        {if $addonsavailable}
          <div class="alert alert-info">
            <div>
              <p class="alert-message">{lang key="clientAreaProductAddonsAvailable"}</p>
            </div>
          </div>
        {/if}

        <div class="row">
          {foreach from=$addons item=addon}
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  {$addon.name}
                  <div class="float-right label status-{$addon.rawstatus|strtolower}">{$addon.status}</div>
                </div>
                <div class="row card-body">
                  <div class="col-md-6">
                    <p>{$addon.pricing}</p>
                    <p>{lang key='registered'}: {$addon.regdate}</p>
                    <p>{lang key='clientareahostingnextduedate'}: {$addon.nextduedate}</p>
                  </div>
                </div>
                <div class="card-footer">
                  <a href="#" class="btn btn-semi-ghost-secondary btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
                      <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
                      <circle cx="12" cy="12" r="3" />
                    </svg>
                    {lang key='manage'}
                  </a>
                </div>
              </div>
            </div>
          {/foreach}
        </div>
      </div>
    </div>
  </div>

  {* Change Password tab *}
  <div class="tab-pane fade" id="tabChangepw">
    <div class="card">
      <div class="card-body">
        <h3 class="card-title">{lang key='serverchangepassword'}</h3>

        {* Display password change results *}
        {if $modulechangepwresult}
          {if $modulechangepwresult == "success"}
            <div class="alert alert-success">
              <div>
                <p class="alert-message">{$modulechangepasswordmessage}</p>
              </div>
            </div>
          {elseif $modulechangepwresult == "error"}
            <div class="alert alert-danger">
              <div>
                <p class="alert-message">{$modulechangepasswordmessage|strip_tags}</p>
              </div>
            </div>
          {/if}
        {/if}

        {* Password change form *}
        <form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw">
          <input type="hidden" name="id" value="{$id}" />
          <input type="hidden" name="modulechangepassword" value="true" />

          <!-- New Password Field -->
          <div class="form-group row has-feedback mb-4">
            <label class="col-xl-4 form-label">{lang key='newpassword'}</label>
            <div class="col-xl-5">
              <input type="password" class="form-control" name="newpw" id="inputNewPassword1" autocomplete="off" />
              {* Password strength indicator can be included here *}
            </div>
            <div class="col-xl-3">
              <button type="button" class="btn btn-light btn-block btn-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                {lang key='generatePassword.btnLabel'}
              </button>
            </div>
          </div>

          <!-- Confirm New Password Field -->
          <div class="form-group row has-feedback mb-4">
            <label class="col-xl-4 form-label">{lang key='confirmnewpassword'}</label>
            <div class="col-xl-5">
              <input type="password" class="form-control" name="confirmpw" id="inputNewPassword2" autocomplete="off" />
              <div id="inputNewPassword2Msg"></div>
            </div>
          </div>

          <!-- Form Action Buttons -->
          <div class="form-group row">
            <div class="offset-xl-4 col-xl-6">
              <div class="d-flex col-gap-2">
                <input class="btn btn-primary btn-sm" type="submit" value="{lang key='clientareasavechanges'}" />
                <input class="btn btn-semi-ghost-secondary btn-sm" type="reset" value="{lang key='cancel'}" />
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>