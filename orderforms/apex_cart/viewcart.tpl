{*
  Shopping Cart Template
  This template handles the display of the shopping cart, including products, domains, addons, and checkout process.
*}

{* Include checkout template if in checkout mode *}
{if $checkout}
  {include file="orderforms/$carttpl/checkout.tpl"}
{else}

  {* JavaScript variables for state handling *}
  <script>
    // Define state tab index value
    var statesTab = 10;
    var stateNotRequired = true;
  </script>

  {* Include common template components *}
  {include file="orderforms/apex_cart/common.tpl"}

  {* Include StatesDropdown JavaScript *}
  <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

  {* Main cart container *}
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
          {* Primary cart content *}
          <div class="secondary-cart-body">

            {* Promotions and error messages container *}
            <div class="d-flex flex-column row-gap-4">

              {* Promotion message *}
              {if $promoerrormessage}
                <div class="alert alert-warning" role="alert">
                  {$promoerrormessage}
                </div>
              {elseif $errormessage}
                <div class="alert alert-danger" role="alert">
                  <p>{$LANG.orderForm.correctErrors}:</p>
                  <ul>
                    {$errormessage}
                  </ul>
                </div>
              {elseif $promotioncode && $rawdiscount eq "0.00"}
                <div class="alert alert-info" role="alert">
                  {$LANG.promoappliedbutnodiscount}
                </div>
              {elseif $promoaddedsuccess}
                <div class="alert alert-success" role="alert">
                  {$LANG.orderForm.promotionAccepted}
                </div>
              {/if}

              {* Display bundle requirements warnings *}
              {if $bundlewarnings}
                <div class="alert alert-warning" role="alert">
                  <strong>{$LANG.bundlereqsnotmet}</strong><br />
                  <ul>
                    {foreach from=$bundlewarnings item=warning}
                      <li>{$warning}</li>
                    {/foreach}
                  </ul>
                </div>
              {/if}

              {* Main cart form *}
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
                                    <div class="config-item-title">{lang key="orderdomain"}</div>
                                    <div class="config-item-value">{$product.domain}</div>
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
                                      <div class="config-item-title">{lang key="quantity"}</div>
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
                      {* item-title *}
                      <h4 class="item-title">
                        {$addon.name}
                        <span class="item-name ml-auto">{$addon.productname}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-addon-{$num}" aria-expanded="false" aria-controls="collapse-addon-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-addon-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {if $addon.domainname}
                                {* col *}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">{lang key="orderdomain"}</div>
                                    <div class="config-item-value">{$addon.domainname}</div>
                                  </div>
                                </div>
                              {/if}
                              {if $showAddonQtyOptions && $addon.allowqty === 2}
                                {* col *}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title"></div>
                                    <div class="config-item-value">
                                      <input type="number" name="addonqty[{$num}]" value="{$addon.qty}" class="form-control text-center" min="0" />
                                    </div>
                                    <div class="config-item-price ml-auto text-right">
                                      <button type="submit" class="btn btn-semi-ghost-secondary btn-xxs">
                                        {$LANG.orderForm.update}
                                      </button>
                                    </div>
                                  </div>
                                </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$addon.totaltoday}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$addon.billingcyclefriendly}</span>
                              {if $addon.setup}
                                <span class="fee-label label label-secondary">{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}</span>
                              {/if}
                              {if $addon.isProrated}
                                <span class="fee-label label label-secondary">({$LANG.orderprorata} {$addon.prorataDate})</span>
                              {/if}
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('a','{$num}')">
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
                  {/foreach}

                  {* Domains *}
                  {foreach $domains as $num => $domain}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">
                        {if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}
                        <span class="item-name ml-auto">{$domain.domain}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-domain-{$num}" aria-expanded="false" aria-controls="collapse-domain-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-domain-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {* Domain name *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">{lang key="orderdomain"}</div>
                                  <div class="config-item-value">{$domain.domain}</div>
                                  <div class="config-item-price ml-auto text-right"><a href="{$domain.domain}" class="btn btn-xxs btn-primary" target="_blank">{$domain.domain}</a></div>
                                </div>
                              </div>

                              {* Domain options *}
                              {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">{lang key="domainAddons"}</div>
                                    <div class="config-item-value">
                                      {* addons-list *}
                                      <ul class="addons-list">
                                        {if $domain.dnsmanagement}
                                          <li>
                                            {$LANG.domaindnsmanagement}
                                          </li>
                                        {/if}
                                        {if $domain.emailforwarding}
                                          <li>
                                            {$LANG.domainemailforwarding}
                                          </li>
                                        {/if}
                                        {if $domain.idprotection}
                                          <li>
                                            {$LANG.domainidprotection}
                                          </li>
                                        {/if}
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              {/if}

                              {* Domain period selection *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">{$LANG.orderregperiod}</div>
                                  {if count($domain.pricing) == 1 || $domain.type == 'transfer'}
                                    <div class="config-item-value">{$domain.regperiod} {$domain.yearsLanguage}</div>
                                  {else}
                                    <div class="dropdown">
                                      <button class="btn btn-semi-ghost-secondary btn-xxs dropdown-toggle" type="button" id="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        {$domain.regperiod} {$domain.yearsLanguage}
                                      </button>
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
                                  {/if}
                                  <div class="config-item-price ml-auto text-right">{$domain.price}</div>
                                </div>
                              </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$domain.price}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$domain.regperiod} {$domain.yearsLanguage}</span>
                              {if isset($domain.renewprice)}
                                <span class="fee-label label label-secondary">
                                  {lang key='domainrenewalprice'} {$domain.renewprice->toPrefixed()}{$domain.shortRenewalYearsLanguage}
                                </span>
                              {/if}
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <a href="{$WEB_ROOT}/cart.php?a=confdomains" class="btn btn-semi-ghost-info btn-xxs">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-settings-icon lucide-settings">
                                  <path d="M9.671 4.136a2.34 2.34 0 0 1 4.659 0 2.34 2.34 0 0 0 3.319 1.915 2.34 2.34 0 0 1 2.33 4.033 2.34 2.34 0 0 0 0 3.831 2.34 2.34 0 0 1-2.33 4.033 2.34 2.34 0 0 0-3.319 1.915 2.34 2.34 0 0 1-4.659 0 2.34 2.34 0 0 0-3.32-1.915 2.34 2.34 0 0 1-2.33-4.033 2.34 2.34 0 0 0 0-3.831A2.34 2.34 0 0 1 6.35 6.051a2.34 2.34 0 0 0 3.319-1.915" />
                                  <circle cx="12" cy="12" r="3" />
                                </svg>
                                {$LANG.orderForm.edit}
                              </a>
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('d','{$num}')">
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
                  {/foreach}

                  {* Service Renewals *}
                  {foreach $renewalsByType['services'] as $num => $service}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">
                        {lang key='renewService.titleAltSingular'}
                        <span class="item-name ml-auto">{$service.name}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-renewal-service-{$num}" aria-expanded="false" aria-controls="collapse-renewal-service-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-renewal-service-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {* Service Name *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">{$LANG.service}</div>
                                  <div class="config-item-value">{$service.name}</div>
                                </div>
                              </div>

                              {* Domain *}
                              {if $service.domainName}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">{$LANG.orderdomain}</div>
                                    <div class="config-item-value">{$service.domainName}</div>
                                  </div>
                                </div>
                              {/if}

                              {* Billing Cycle *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">{$LANG.orderbillingcycle}</div>
                                  <div class="config-item-value">{$service.billingCycle}</div>
                                </div>
                              </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$service.recurringBeforeTax}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$service.billingCycle}</span>
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('r','{$num}','service')">
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
                  {/foreach}

                  {* Addon Renewals *}
                  {foreach $renewalsByType['addons'] as $num => $service}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">
                        {lang key='renewServiceAddon.titleAltSingular'}
                        <span class="item-name ml-auto">{$service.name}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-renewal-addon-{$num}" aria-expanded="false" aria-controls="collapse-renewal-addon-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-renewal-addon-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {* Addon Name *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">Addon</div>
                                  <div class="config-item-value">{$service.name}</div>
                                  <div class="config-item-price ml-auto text-right">---</div>
                                </div>
                              </div>

                              {* Domain *}
                              {if $service.domainName}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Domain</div>
                                    <div class="config-item-value">{$service.domainName}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {* Billing Cycle *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">Billing Cycle</div>
                                  <div class="config-item-value">{$service.billingCycle}</div>
                                  <div class="config-item-price ml-auto text-right">---</div>
                                </div>
                              </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$service.recurringBeforeTax}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$service.billingCycle}</span>
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('r','{$num}','addon')">
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
                  {/foreach}

                  {* Domain Renewals *}
                  {foreach $renewalsByType['domains'] as $num => $domain}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">
                        {$LANG.domainrenewal}
                        <span class="item-name ml-auto">{$domain.domain}</span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-domain-renewal-{$num}" aria-expanded="false" aria-controls="collapse-domain-renewal-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-domain-renewal-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {* Domain name *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">Domain</div>
                                  <div class="config-item-value">{$domain.domain}</div>
                                  <div class="config-item-price ml-auto text-right">---</div>
                                </div>
                              </div>

                              {* Domain options *}
                              {if $domain.dnsmanagement}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">DNS Management</div>
                                    <div class="config-item-value">{$LANG.domaindnsmanagement}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {if $domain.emailforwarding}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Email Forwarding</div>
                                    <div class="config-item-value">{$LANG.domainemailforwarding}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {if $domain.idprotection}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">ID Protection</div>
                                    <div class="config-item-value">{$LANG.domainidprotection}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {* Renewal period *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">Renewal Period</div>
                                  <div class="config-item-value">{$domain.regperiod} {$LANG.orderyears}</div>
                                  <div class="config-item-price ml-auto text-right">{$domain.price}</div>
                                </div>
                              </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$domain.price}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$domain.regperiod} {$LANG.orderyears}</span>
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('r','{$num}','domain')">
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
                  {/foreach}

                  {* Upgrades *}
                  {foreach $upgrades as $num => $upgrade}
                    {* items *}
                    <div class="item">
                      {* item-title *}
                      <h4 class="item-title">
                        {$LANG.upgrade}
                        <span class="item-name ml-auto">
                          {if $upgrade->type == 'service'}
                            {$upgrade->originalProduct->name} → {$upgrade->newProduct->name}
                          {elseif $upgrade->type == 'addon'}
                            {$upgrade->originalAddon->name} → {$upgrade->newAddon->name}
                          {/if}
                        </span>
                        <button class="btn-square btn-semi-ghost-secondary btn-xxs rounded-circle rotate-180" data-toggle="collapse" type="button" data-target="#collapse-upgrade-{$num}" aria-expanded="false" aria-controls="collapse-upgrade-{$num}">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down-icon lucide-chevron-down">
                            <path d="m6 9 6 6 6-6" />
                          </svg>
                        </button>
                      </h4>

                      {* item-content *}
                      <div class="collapse" id="collapse-upgrade-{$num}">
                        <div class="item-content">
                          {* product-config *}
                          <div class="product-config">
                            {* row *}
                            <div class="row row-gap-1">
                              {* Upgrade Type *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">Type</div>
                                  <div class="config-item-value">
                                    {if $upgrade->type == 'service'}
                                      Service Upgrade
                                    {elseif $upgrade->type == 'addon'}
                                      Addon Upgrade
                                    {/if}
                                  </div>
                                  <div class="config-item-price ml-auto text-right">---</div>
                                </div>
                              </div>

                              {* Product Group *}
                              {if $upgrade->type == 'service'}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Product Group</div>
                                    <div class="config-item-value">{$upgrade->originalProduct->productGroup->name}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {* Domain *}
                              {if $upgrade->type == 'service' && $upgrade->service->domain}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Domain</div>
                                    <div class="config-item-value">{$upgrade->service->domain}</div>
                                    <div class="config-item-price ml-auto text-right">---</div>
                                  </div>
                                </div>
                              {/if}

                              {* Quantity *}
                              {if $showUpgradeQtyOptions && $upgrade->allowMultipleQuantities}
                                <div class="col-12">
                                  <div class="config-item">
                                    <div class="config-item-title">Quantity</div>
                                    <div class="config-item-value">
                                      <input type="number" name="upgradeqty[{$num}]" value="{$upgrade->qty}" class="form-control text-center" min="{$upgrade->minimumQuantity}" />
                                    </div>
                                    <div class="config-item-price ml-auto text-right">
                                      <button type="submit" class="btn btn-semi-ghost-secondary btn-xxs">
                                        {$LANG.orderForm.update}
                                      </button>
                                    </div>
                                  </div>
                                </div>
                              {/if}

                              {* Billing Cycle *}
                              <div class="col-12">
                                <div class="config-item">
                                  <div class="config-item-title">New Billing Cycle</div>
                                  <div class="config-item-value">{$upgrade->localisedNewCycle}</div>
                                  <div class="config-item-price ml-auto text-right">{$upgrade->newRecurringAmount}</div>
                                </div>
                              </div>
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
                              {$LANG.total}: <span class="item-footer-total-price">{$upgrade->newRecurringAmount}</span>
                            </div>
                            <div class="d-flex align-items-center col-gap-2">
                              <span class="fee-label label label-secondary">{$upgrade->localisedNewCycle}</span>
                            </div>
                          </div>
                          <div class="col-6">
                            {* actions *}
                            <div class="item-actions">
                              <button type="button" class="btn btn-semi-ghost-danger btn-xxs btn-remove-from-cart" onclick="removeItem('u','{$num}')">
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

                        {* upgrade credit *}
                        {if $upgrade->totalDaysInCycle > 0}
                          <div class="row mt-3">
                            <div class="col-12">
                              <div class="upgrade-credit">
                                <div class="d-flex justify-content-between align-items-center">
                                  <div>
                                    <div class="upgrade-credit-title">{$LANG.upgradeCredit}</div>
                                    <div class="upgrade-calc-msg">
                                      {lang key="upgradeCreditDescription" daysRemaining=$upgrade->daysRemaining totalDays=$upgrade->totalDaysInCycle}
                                    </div>
                                  </div>
                                  <div class="upgrade-credit-amount">-{$upgrade->creditAmount}</div>
                                </div>
                              </div>
                            </div>
                          </div>
                        {/if}
                      </div>
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
                <div class="view-cart-hook">
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
                {if $cartitems}
                  {foreach $products as $num => $product}
                    <div class="bordered-totals">
                      <h4 class="bordered-totals-title">{$product.productinfo.groupname} - {$product.productinfo.name} <span class="title-price">{$product.pricing.baseprice->toFull()}</span></h4>
                    </div>
                  {/foreach}
                  {* tax *}
                  {if $taxrate || $taxrate2}
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
                  {if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
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
                  {/if}
                  {* promotioncode *}
                  {if $promotioncode}
                    <div class="bordered-totals">
                      <h4 class="bordered-totals-title">
                        <span class="title-span">
                          {$LANG.orderdiscount}
                          <svg data-toggle="tooltip" data-placement="top" title="{$promotiondescription}" data-html="true" class="tooltip-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-question-mark-icon lucide-circle-question-mark">
                            <circle cx="12" cy="12" r="10" />
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3" />
                            <path d="M12 17h.01" />
                          </svg>
                        </span>
                        <span id="discount" class="title-price">{$discount}</span>
                      </h4>
                    </div>
                  {/if}
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
                {else}
                  <div class="view-cart-empty">
                    {$LANG.cartempty}
                  </div>
                {/if}
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