{* Include checkout template components *}
{if $checkout}
  {include file="orderforms/$carttpl/checkout.tpl"}
{else}

  {* Script *}
  <script>
    // Define state tab index value
    var statesTab = 10;
    var stateNotRequired = true;
  </script>

  {* Include common template components *}
  {include file="orderforms/apex_cart/common.tpl"}

  {* Script *}
  <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

  {* Main container *}
  <div id="order-apex_cart">
    {* row *}
    <div class="row">

      {* Left sidebar with categories *}
      <div class="cart-sidebar">
        {include file="orderforms/apex_cart/sidebar-categories.tpl"}
      </div>

      {* Main content area *}
      <div class="cart-body">

        <!-- Page header with title and tagline -->
        {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='cartreviewcheckout'}" tagline="{lang key='clientareacheckouttagline'}" }

        {* Mobile collapsed sidebar *}
        {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

        {* row *}
        <div class="row">
          {* content *}
          <div class="secondary-cart-body">

            {* Promotions *}
            <div class="d-flex flex-column row-gap-4">

              {* Promotion message *}
              {if $promoerrormessage}
                <div class="alert alert-warning text-center" role="alert">
                  <div>
                    {$promoerrormessage}
                  </div>
                </div>
              {elseif $errormessage}
                <div class="alert alert-danger" role="alert">
                  <div>
                    <p>{$LANG.orderForm.correctErrors}:</p>
                    <ul>
                      {$errormessage}
                    </ul>
                  </div>
                </div>
              {elseif $promotioncode && $rawdiscount eq "0.00"}
                <div class="alert alert-info text-center" role="alert">
                  <div>{$LANG.promoappliedbutnodiscount}</div>
                </div>
              {elseif $promoaddedsuccess}
                <div class="alert alert-success text-center" role="alert">
                  <div>{$LANG.orderForm.promotionAccepted}</div>
                </div>
              {/if}

              {* Bundle requirements *}
              {if $bundlewarnings}
                <div class="alert alert-warning" role="alert">
                  <div>
                    <strong>{$LANG.bundlereqsnotmet}</strong><br />
                    <ul>
                      {foreach from=$bundlewarnings item=warning}
                        <li>{$warning}</li>
                      {/foreach}
                    </ul>
                  </div>
                </div>
              {/if}

              {* Form *}
              <form method="post" action="{$smarty.server.PHP_SELF}?a=view">
                {* View cart items *}
                <div class="view-cart-items">

                  {* Products *}
                  {foreach $products as $num => $product}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">{$product.productinfo.groupname}<span class="item-name ml-auto">{$product.productinfo.name}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-{$num}" aria-expanded="false" aria-controls="collapse-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>
                      {* item-content *}
                      <div class="collapse" id="collapse-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {if $product.domain}
                                {* col *}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Domain</div>
                                    <div class="config-item-value">{$product.domain}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}
                              {if $product.configoptions}
                                {foreach key=confnum item=configoption from=$product.configoptions}
                                  {* col *}
                                  <div class="col-12">
                                    <div class="config-item">
                                      <div class="config-item-title">{$configoption.name}</div>
                                      <div class="config-item-value">{$configoption.optionname}</div>
                                      {if $configoption.recurring}
                                        <div class="config-item-price ml-auto text-right">
                                          {$configoption.recurring->toFull()}
                                        </div>
                                      {elseif $configoption.optionprice}
                                        <div class="config-item-price ml-auto text-right">
                                          {$configoption.optionprice}
                                        </div>
                                      {else}
                                        <div class="config-item-price ml-auto text-right">
                                          {lang key='orderfree'}
                                        </div>
                                      {/if}
                                    </div>
                                  </div>
                                {/foreach}
                              {/if}
                              {if !$showqtyoptions}
                                {if !$product.allowqty}
                                  {* col *}
                                  <div class="col-12">
                                    <div class="config-item">
                                      <div class="config-item-title">Quantity</div>
                                      <div class="config-item-value">{$product.qty}</div>
                                      <div class="config-item-price ml-auto text-right">{$product.pricing.baseprice->toFull()}</div>
                                    </div>
                                  </div>
                                {/if}
                              {/if}
                            </div>
                          </div>
                        </div>
                      </div>
                      {* item-footer *}
                      <div class="item-footer">
                        {* row *}
                        <div class="row align-items-end">
                          <div class="col-6 d-flex flex-column row-gap-2">
                            {* item-footer-total *}
                            <div class="item-footer-total">
                              {$LANG.total}: <span class="item-footer-total-price">{$product.pricing.totalTodayExcludingTaxSetup}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$product.billingcyclefriendly}</span>
                              {if $product.pricing.productonlysetup}
                                <span class="fee-label label label-secondary">{$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}</span>
                              {/if}
                              {if $product.proratadate}
                                <span class="fee-label label label-secondary">({$LANG.orderprorata} {$product.proratadate})</span>
                              {/if}
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$num}" class="btn btn-semi-ghost-info btn-xxs">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
                                  <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
                                  <circle cx="12" cy="12" r="3" />
                                </svg>
                                {$LANG.orderForm.edit}
                              </a>
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('p','{$num}')">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2-icon lucide-trash-2">
                                  <path d="M10 11v6" />
                                  <path d="M14 11v6" />
                                  <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                  <path d="M3 6h18" />
                                  <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                                </svg>
                                {$LANG.orderForm.remove}
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    {* Product Addons *}
                    {foreach $product.addons as $addonnum => $addon}
                      {* items *}
                      <div class="item">
                        {* row *}
                        <div class="row">
                          {* col - addon *}
                          <div class="col-sm-5">
                            {* item-title *}
                            <span class="item-title">
                              {$addon.name}
                            </span>
                            {* item-group *}
                            <span class="item-group">
                              {$LANG.orderaddon}
                            </span>
                          </div>
                          {* col - quantity *}
                          {if $showAddonQtyOptions}
                            <div class="col-sm-2 item-qty">
                              {if $addon.allowqty === 2}
                                <input type="number" name="paddonqty[{$num}][{$addonnum}]" value="{$addon.qty}" class="form-control text-center" min="0" />
                                <button type="submit" class="btn btn-xs">
                                  {$LANG.orderForm.update}
                                </button>
                              {/if}
                            </div>
                          {/if}
                          {* col - price *}
                          <div class="{if $showAddonQtyOptions}col-sm-4{else}col-sm-6{/if} item-price">
                            <div class="d-flex align-items-center justify-content-end gap-4">
                              <span>{$addon.totaltoday}</span>
                              <span class="cycle">{$addon.billingcyclefriendly}</span>
                              {if $addon.setup}{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}{/if}
                              {if $addon.isProrated}<br />({$LANG.orderprorata} {$addon.prorataDate}){/if}
                            </div>
                          </div>
                          {* col - actions *}
                          <div class="col-12">
                            {* actions *}
                            <div class="cart-items-actions">
                              <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('pa','{$num}_{$addonnum}')">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                  <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                  <path d="M3 6h18" />
                                  <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                                </svg>
                                {$LANG.orderForm.remove}
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    {/foreach}
                  {/foreach}

                  {* Standalone Addons *}
                  {foreach $addons as $num => $addon}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - addon *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {$addon.name}
                          </span>
                          {* item-group *}
                          <span class="item-group">
                            {$addon.productname}
                          </span>
                          {* item-domain *}
                          {if $addon.domainname}
                            <span class="item-domain">
                              {$addon.domainname}
                            </span>
                          {/if}
                        </div>
                        {* col - quantity *}
                        {if $showAddonQtyOptions}
                          <div class="col-sm-2 item-qty">
                            {if $addon.allowqty === 2}
                              <input type="number" name="addonqty[{$num}]" value="{$addon.qty}" class="form-control text-center" min="0" />
                              <button type="submit" class="btn btn-xs">
                                {$LANG.orderForm.update}
                              </button>
                            {/if}
                          </div>
                        {/if}
                        {* col - price *}
                        <div class="{if $showAddonQtyOptions}col-sm-4{else}col-sm-6{/if} item-price">
                          <div class="d-flex align-items-center justify-content-end gap-4">
                            <span>{$addon.totaltoday}</span>
                            <span class="cycle">{$addon.billingcyclefriendly}</span>
                            {if $addon.setup}{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}{/if}
                            {if $addon.isProrated}<br />({$LANG.orderprorata} {$addon.prorataDate}){/if}
                          </div>
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('a','{$num}')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  {/foreach}

                  {* Domains *}
                  {foreach $domains as $num => $domain}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - domain *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}
                          </span>
                          {* item-domain *}
                          {if $domain.domain}
                            <span class="item-domain">
                              {$domain.domain}
                            </span>
                          {/if}
                          {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
                          {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
                          {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
                        </div>
                        {* col - price *}
                        <div class="col-sm-7 item-price">
                          {if count($domain.pricing) == 1 || $domain.type == 'transfer'}
                            <div class="d-flex align-items-center justify-content-end gap-4">
                              <span name="{$domain.domain}Price">{$domain.price}</span>
                              <span class="cycle">{$domain.regperiod} {$domain.yearsLanguage}</span>
                              <span class="renewal cycle">
                                {if isset($domain.renewprice)}{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}{/if}</span>
                              </span>
                            </div>
                          {else}
                            {* div *}
                            <div class="d-flex align-items-center justify-content-end gap-4">
                              {* price *}
                              <span name="{$domain.domain}Price">{$domain.price}</span>
                              {* dropdown *}
                              <div class="dropdown">
                                {* dropdown-button *}
                                <button class="btn btn-secondary btn-xs dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  {$domain.regperiod} {$domain.yearsLanguage}
                                  <span class="caret"></span>
                                </button>
                                {* dropdown-menu *}
                                <ul class="dropdown-menu" aria-labelledby="{$domain.domain}Pricing">
                                  {foreach $domain.pricing as $years => $price}
                                    <li class="dropdown-item">
                                      <a href="#" class="dropdown-link" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
                                        {$years} {if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if} @ {$price.register}
                                      </a>
                                    </li>
                                  {/foreach}
                                </ul>
                              </div>
                              {* renewal *}
                              <span class="renewal cycle">
                                {lang key='domainrenewalprice'} <span class="renewal-price cycle">{if isset($domain.renewprice)}{$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}{/if}</span>
                              </span>
                            </div>
                          {/if}
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <a href="{$WEB_ROOT}/cart.php?a=confdomains" class="btn btn-ghost-info btn-xs">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-line-icon lucide-pencil-line">
                                <path d="M13 21h8" />
                                <path d="m15 5 4 4" />
                                <path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z" />
                              </svg>
                              {$LANG.orderForm.edit}
                            </a>
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('d','{$num}')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  {/foreach}

                  {* Service Renewals *}
                  {foreach $renewalsByType['services'] as $num => $service}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - service *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {lang key='renewService.titleAltSingular'}
                          </span>
                          {* item-group *}
                          <span class="item-group">
                            {$service.name}
                          </span>
                          {* item-domain *}
                          <span class="item-domain">
                            {$service.domainName}
                          </span>
                        </div>
                        {* col - price *}
                        <div class="col-sm-6 item-price">
                          <div class="d-flex align-items-center justify-content-end gap-4">
                            <span>{$service.recurringBeforeTax}</span>
                            <span class="cycle">{$service.billingCycle}</span>
                          </div>
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('r','{$num}','service')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  {/foreach}

                  {* Addon Renewals *}
                  {foreach $renewalsByType['addons'] as $num => $service}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - addon *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {lang key='renewServiceAddon.titleAltSingular'}
                          </span>
                          {* item-group *}
                          <span class="item-group">
                            {$service.name}
                          </span>
                          {* item-domain *}
                          <span class="item-domain">
                            {$service.domainName}
                          </span>
                        </div>
                        {* col - price *}
                        <div class="col-sm-6 item-price">
                          <div class="d-flex align-items-center justify-content-end gap-4">
                            <span>{$service.recurringBeforeTax}</span>
                            <span class="cycle">{$service.billingCycle}</span>
                          </div>
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('r','{$num}','addon')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  {/foreach}

                  {* Domain Renewals *}
                  {foreach $renewalsByType['domains'] as $num => $domain}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - domain *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {$LANG.domainrenewal}
                          </span>
                          {* item-domain *}
                          <span class="item-domain">
                            {$domain.domain}
                          </span>
                          {if $domain.dnsmanagement}&nbsp;&raquo; {$LANG.domaindnsmanagement}<br />{/if}
                          {if $domain.emailforwarding}&nbsp;&raquo; {$LANG.domainemailforwarding}<br />{/if}
                          {if $domain.idprotection}&nbsp;&raquo; {$LANG.domainidprotection}<br />{/if}
                        </div>
                        {* col - price *}
                        <div class="col-sm-6 item-price">
                          <div class="d-flex align-items-center justify-content-end gap-4">
                            <span>{$domain.price}</span>
                            <span class="cycle">{$domain.regperiod} {$LANG.orderyears}</span>
                          </div>
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('r','{$num}','domain')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  {/foreach}

                  {* Upgrades *}
                  {foreach $upgrades as $num => $upgrade}
                    {* items *}
                    <div class="item">
                      {* row *}
                      <div class="row">
                        {* col - upgrade *}
                        <div class="col-sm-5">
                          {* item-title *}
                          <span class="item-title">
                            {$LANG.upgrade}
                          </span>
                          {* item-group *}
                          <span class="item-group">
                            {if $upgrade->type == 'service'}
                              {$upgrade->originalProduct->productGroup->name}<br>{$upgrade->originalProduct->name} => {$upgrade->newProduct->name}
                            {elseif $upgrade->type == 'addon'}
                              {$upgrade->originalAddon->name} => {$upgrade->newAddon->name}
                            {/if}
                          </span>
                          {* item-domain *}
                          <span class="item-domain">
                            {if $upgrade->type == 'service'}
                              {$upgrade->service->domain}
                            {/if}
                          </span>
                        </div>
                        {* col - quantity *}
                        {if $showUpgradeQtyOptions}
                          <div class="col-sm-2 item-qty">
                            {if $upgrade->allowMultipleQuantities}
                              <input type="number" name="upgradeqty[{$num}]" value="{$upgrade->qty}" class="form-control text-center" min="{$upgrade->minimumQuantity}" />
                              <button type="submit" class="btn btn-xs">
                                {$LANG.orderForm.update}
                              </button>
                            {/if}
                          </div>
                        {/if}
                        {* col - price *}
                        <div class="{if $showUpgradeQtyOptions}col-sm-4{else}col-sm-6{/if} item-price">
                          <div class="d-flex align-items-center justify-content-end gap-4">
                            <span>{$upgrade->newRecurringAmount}</span>
                            <span class="cycle">{$upgrade->localisedNewCycle}</span>
                          </div>
                        </div>
                        {* col - actions *}
                        <div class="col-12">
                          {* actions *}
                          <div class="cart-items-actions">
                            <button type="button" class="btn btn-ghost-danger btn-xs btn-remove-from-cart" onclick="removeItem('u','{$num}')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                                <path d="M3 6h18" />
                                <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                              </svg>
                              {$LANG.orderForm.remove}
                            </button>
                          </div>
                        </div>
                      </div>
                      {* upgrade credit row *}
                      {if $upgrade->totalDaysInCycle > 0}
                        <div class="row row-upgrade-credit">
                          <div class="col-sm-7">
                            <span class="item-group">
                              {$LANG.upgradeCredit}
                            </span>
                            <div class="upgrade-calc-msg">
                              {lang key="upgradeCreditDescription" daysRemaining=$upgrade->daysRemaining totalDays=$upgrade->totalDaysInCycle}
                            </div>
                          </div>
                          <div class="col-sm-4 item-price">
                            <span>-{$upgrade->creditAmount}</span>
                          </div>
                        </div>
                      {/if}
                    </div>
                  {/foreach}

                  {if $cartitems == 0}
                    <div class="view-cart-empty">
                      {$LANG.cartempty}
                    </div>
                  {/if}

                </div>
                {* empty-card *}
                {if $cartitems > 0}
                  <div class="mt-4 text-right">
                    <button type="button" class="btn btn-ghost-danger btn-xs" id="btnEmptyCart">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-brush-cleaning-icon lucide-brush-cleaning">
                        <path d="m16 22-1-4" />
                        <path d="M19 13.99a1 1 0 0 0 1-1V12a2 2 0 0 0-2-2h-3a1 1 0 0 1-1-1V4a2 2 0 0 0-4 0v5a1 1 0 0 1-1 1H6a2 2 0 0 0-2 2v.99a1 1 0 0 0 1 1" />
                        <path d="M5 14h14l1.973 6.767A1 1 0 0 1 20 22H4a1 1 0 0 1-.973-1.233z" />
                        <path d="m8 22 1-4" />
                      </svg>
                      <span>{$LANG.emptycart}</span>
                    </button>
                  </div>
                {/if}
              </form>

              {* hook *}
              {foreach $hookOutput as $output}
                <div>
                  {$output}
                </div>
              {/foreach}

              {* gateways *}
              {foreach $gatewaysoutput as $gatewayoutput}
                <div class="view-cart-gateway-checkout">
                  {$gatewayoutput}
                </div>
              {/foreach}

              {* tabs *}
              <div class="view-cart-tabs mt-4">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="nav-item active">
                    <a href="#applyPromo" class="nav-link active" aria-controls="applyPromo" role="tab" data-toggle="tab" {if $template == 'twenty-one'} aria-selected="true" {else} aria-expanded="true" {/if}>
                      {$LANG.orderForm.applyPromoCode}
                    </a>
                  </li>
                  {if $taxenabled && !$loggedin}
                    <li role="presentation" class="nav-item">
                      <a href="#calcTaxes" class="nav-link" aria-controls="calcTaxes" role="tab" data-toggle="tab" {if $template == 'twenty-one'} aria-selected="false" {else} aria-expanded="false" {/if}>
                        {$LANG.orderForm.estimateTaxes}
                      </a>
                    </li>
                  {/if}
                </ul>
                {* tab-content *}
                <div class="tab-content d-flex flex-column row-gap-4">
                  {* tab-pane *}
                  <div role="tabpanel" class="tab-pane active promo" id="applyPromo">
                    {* promo *}
                    {if $promotioncode}
                      <div class="view-cart-promotion-code mb-4">
                        {$promotioncode} - {$promotiondescription}
                      </div>
                      <div class="text-center">
                        <a href="{$WEB_ROOT}/cart.php?a=removepromo" class="btn btn-danger btn-xs">
                          {$LANG.orderForm.removePromotionCode}
                        </a>
                      </div>
                    {else}
                      <form method="post" action="{$WEB_ROOT}/cart.php?a=view">
                        <div class="form-group mb-4">
                          <label for="promocode" class="form-label">{lang key='clientareafirstname'}</label>
                          {* prepend-icon *}
                          <div class="prepend-icon">
                            {* form-float-icon *}
                            <div class="form-float-icon">
                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ticket-icon lucide-ticket">
                                <path d="M2 9a3 3 0 0 1 0 6v2a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-2a3 3 0 0 1 0-6V7a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2Z" />
                                <path d="M13 5v2" />
                                <path d="M13 17v2" />
                                <path d="M13 11v2" />
                              </svg>
                            </div>
                            {* form-control *}
                            <input type="text" name="promocode" id="inputPromotionCode" class="form-control" placeholder="{lang key="orderPromoCodePlaceholder"}" required="required">
                          </div>
                        </div>
                        <button type="submit" name="validatepromo" class="btn btn-block btn-light" value="{$LANG.orderpromovalidatebutton}">
                          {$LANG.orderpromovalidatebutton}
                        </button>
                      </form>
                    {/if}
                  </div>
                  {* tab-pane *}
                  <div role="tabpanel" class="tab-pane" id="calcTaxes">
                    {* form *}
                    <form method="post" action="{$WEB_ROOT}/cart.php?a=setstateandcountry" class="d-flex flex-column row-gap-4">
                      {* form-group - row *}
                      <div class="form-group row">
                        <label for="inputState" class="pt-sm-2 col-sm-4 control-label">{$LANG.orderForm.state}</label>
                        <div class="col-sm-8">
                          <input type="text" name="state" id="inputState" value="{$clientsdetails.state}" class="form-control" {if $loggedin} disabled="disabled" {/if} />
                        </div>
                      </div>
                      {* form-group - row *}
                      <div class="form-group row">
                        <label for="inputCountry" class="pt-sm-2 col-sm-4 control-label">{$LANG.orderForm.country}</label>
                        <div class="col-sm-8">
                          <select name="country" id="inputCountry" class="form-control">
                            {foreach $countries as $countrycode => $countrylabel}
                              <option value="{$countrycode}" {if (!$country && $countrycode == $defaultcountry) || $countrycode eq $country} selected{/if}>
                                {$countrylabel}
                              </option>
                            {/foreach}
                          </select>
                        </div>
                      </div>
                      <div class="form-group text-right">
                        <button type="submit" class="btn btn-light btn-sm">
                          {$LANG.orderForm.updateTotals}
                        </button>
                      </div>
                    </form>

                  </div>
                </div>
              </div>
            </div>

          </div>
          {* secondary sidebar *}
          <div class="secondary-cart-sidebar">
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
                <div class="bordered-totals">
                  <h4 class="bordered-totals-title">{$LANG.orderdiscount}</h4>
                  <div class="bordered-totals-item">
                    <span class="text-left">{$promotiondescription}</span>
                    <span id="discount" class="text-right">{$discount}</span>
                  </div>
                </div>
                {* tax *}
                {if $promotioncode || $taxrate || $taxrate2}
                  {* promotioncode *}
                  {if $promotioncode}
                    <div class="bordered-totals">
                      <h4 class="bordered-totals-title">{$LANG.orderdiscount}</h4>
                      <div class="bordered-totals-item">
                        <span class="text-left">{$promotiondescription}</span>
                        <span id="discount" class="text-right">{$discount}</span>
                      </div>
                    </div>
                  {/if}
                  {* tax *}
                  {if $taxrate}
                    <div class="bordered-totals">
                      <h4 class="bordered-totals-title">{lang key="taxes"}</h4>
                      <div class="bordered-totals-item">
                        <span class="text-left">{$taxname} @ {$taxrate}%</span>
                        <span id="taxTotal1" class="text-right">{$taxtotal}</span>
                      </div>
                    </div>
                  {/if}
                  {* tax2 *}
                  {if $taxrate2}
                    <div class="bordered-totals">
                      <h4 class="bordered-totals-title">{lang key="taxes"}</h4>
                      <div class="bordered-totals-item">
                        <span class="text-left">{$taxname2} @ {$taxrate2}%</span>
                        <span id="taxTotal2" class="text-right">{$taxtotal2}</span>
                      </div>
                    </div>
                  {/if}
                {/if}
                {* recurring *}
                <div class="bordered-totals">
                  <h4 class="bordered-totals-title">{$LANG.recurring}</h4>
                  <div class="bordered-totals-item">
                    <span class="text-left">{$LANG.ordertotalrecurring}</span>
                    <span id="recurring" class="text-right">
                      <span id="recurringMonthly" {if !$totalrecurringmonthly}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringmonthly}</span>
                        <span class="period">{$LANG.orderpaymenttermmonthly}</span>
                      </span>
                      <span id="recurringQuarterly" {if !$totalrecurringquarterly}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringquarterly}</span>
                        <span class="period">{$LANG.orderpaymenttermquarterly}</span>
                      </span>
                      <span id="recurringSemiAnnually" {if !$totalrecurringsemiannually}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringsemiannually}</span>
                        <span class="period">{$LANG.orderpaymenttermsemiannually}</span>
                      </span>
                      <span id="recurringAnnually" {if !$totalrecurringannually}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringannually}</span>
                        <span class="period">{$LANG.orderpaymenttermannually}</span>
                      </span>
                      <span id="recurringBiennially" {if !$totalrecurringbiennially}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringbiennially}</span>
                        <span class="period">{$LANG.orderpaymenttermbiennially}</span>
                      </span>
                      <span id="recurringTriennially" {if !$totalrecurringtriennially}style="display:none;" {/if}>
                        <span class="cost text-right mr-1">{$totalrecurringtriennially}</span>
                        <span class="period">{$LANG.orderpaymenttermtriennially}</span>
                      </span>
                    </span>
                  </div>
                </div>

                {* total *}
                <div class="total">
                  <div>
                    <span>{$LANG.total}</span>
                    <span class="total-price">
                      <span class="old-price">{$subtotal}</span>{$total}
                    </span>
                  </div>
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
                <div class="actions">
                  <a href="{$WEB_ROOT}/cart.php?a=checkout&e=false" class="btn btn-primary btn-block btn-checkout{if $cartitems == 0} disabled{/if}" id="checkout">
                    {$LANG.orderForm.checkout}
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                      <path d="M5 12h14" />
                      <path d="m12 5 7 7-7 7" />
                    </svg>
                  </a>
                  <a href="{$WEB_ROOT}/cart.php" class="d-none btn btn-ghost-secondary btn-sm btn-block btn-continue-shopping" id="continueShopping">
                    {$LANG.orderForm.continueShopping}
                  </a>
                </div>

              </div>
            </div>
          </div>
        </div>

        {* remove item modal *}
        <form method="post" action="{$WEB_ROOT}/cart.php">
          <input type="hidden" name="a" value="remove" />
          <input type="hidden" name="r" value="" id="inputRemoveItemType" />
          <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
          <input type="hidden" name="rt" value="" id="inputRemoveItemRenewalType">
          <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                {* modal-header *}
                <div class="modal-header">
                  <h4 class="modal-title">{lang key='orderForm.removeItem'}</h4>
                  <button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
                      <path d="M18 6 6 18"></path>
                      <path d="m6 6 12 12"></path>
                    </svg>
                  </button>
                </div>
                {* modal-body *}
                <div class="modal-body">
                  <p>{lang key='cartremoveitemconfirm'}</p>
                </div>
                {* modal-footer *}
                <div class="modal-footer">
                  <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
                    {$LANG.cancel}
                  </button>
                  <button type="submit" class="btn btn-danger btn-xs btn-wide" id="btnRemoveUserConfirm">
                    {$LANG.confirm}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>

        {* empty cart modal *}
        <form method="post" action="{$WEB_ROOT}/cart.php">
          <input type="hidden" name="a" value="empty" />
          <div class="modal fade modal-remove-item" id="modalEmptyCart" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title">{$LANG.emptycart}</h4>
                </div>
                <div class="modal-body">
                  <p>{$LANG.cartemptyconfirm}</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
                    {$LANG.cancel}
                  </button>
                  <button type="submit" class="btn btn-danger btn-xs btn-wide" id="btnRemoveUserConfirm">
                    {$LANG.confirm}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>

    </div>
  </div>

  {* Recommendations modal *}
  {include file="orderforms/apex_cart/recommendations-modal.tpl"}
{/if}