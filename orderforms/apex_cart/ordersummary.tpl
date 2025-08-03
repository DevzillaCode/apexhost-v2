{if $producttotals}
  {* Product Information *}
  <div class="bordered-totals">
    <h4 class="bordered-totals-title">
      {$producttotals.productinfo.groupname} - {$producttotals.productinfo.name}
      <span class="title-price">{$producttotals.pricing.baseprice}</span>
    </h4>
    {if $producttotals.allowqty && $producttotals.qty > 1}
      <div class="bordered-totals-items">
        <div class="bordered-totals-item">
          <span class="text-left">{$LANG.orderForm.quantity}</span>
          <span class="text-right">{$producttotals.qty}</span>
        </div>
      </div>
    {/if}
  </div>

  {* Configuration Options *}
  {if $producttotals.configoptions}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.orderconfigpackage}</h4>
      <div class="bordered-totals-items">
        {foreach $producttotals.configoptions as $configoption}
          {if $configoption}
            <div class="bordered-totals-item">
              <span class="text-left">{$configoption.name}: {$configoption.optionname}</span>
              <span class="text-right">
                {$configoption.recurring}
                {if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}
              </span>
            </div>
          {/if}
        {/foreach}
      </div>
    </div>
  {/if}

  {* Addons *}
  {if $producttotals.addons}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.addons}</h4>
      <div class="bordered-totals-items">
        {foreach $producttotals.addons as $addon}
          <div class="bordered-totals-item">
            <span class="text-left">{$addon.name}</span>
            <span class="text-right">{$addon.recurring}</span>
          </div>
        {/foreach}
      </div>
    </div>
  {/if}

  {* Setup Fees *}
  {if $producttotals.pricing.setup}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.cartsetupfees}</h4>
      <div class="bordered-totals-items">
        <div class="bordered-totals-item">
          <span class="text-left">{$LANG.cartsetupfees}</span>
          <span class="text-right">{$producttotals.pricing.setup}</span>
        </div>
      </div>
    </div>
  {/if}

  {* Recurring Charges *}
  {if $producttotals.pricing.recurringexcltax}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.recurring}</h4>
      <div class="bordered-totals-items">
        {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
          <div class="bordered-totals-item">
            <span class="text-left">{$cycle}</span>
            <span class="text-right">{$recurring}</span>
          </div>
        {/foreach}
      </div>
    </div>
  {/if}

  {* Taxes *}
  {if $producttotals.pricing.tax1 || $producttotals.pricing.tax2}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.taxes}</h4>
      <div class="bordered-totals-items">
        {if $producttotals.pricing.tax1}
          <div class="bordered-totals-item">
            <span class="text-left">{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
            <span class="text-right">{$producttotals.pricing.tax1}</span>
          </div>
        {/if}
        {if $producttotals.pricing.tax2}
          <div class="bordered-totals-item">
            <span class="text-left">{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
            <span class="text-right">{$producttotals.pricing.tax2}</span>
          </div>
        {/if}
      </div>
    </div>
  {/if}

  {* Total *}
  <div class="total">
    <div>
      <span>{$LANG.ordertotalduetoday}</span>
      <span class="total-price">{$producttotals.pricing.totaltoday}</span>
    </div>
  </div>

{elseif !empty($renewals) || !empty($serviceRenewals)}

  {* Service Renewals *}
  {if !empty($serviceRenewals)}
    {if !empty($carttotals.renewalsByType.services)}
      <div class="bordered-totals">
        <h4 class="bordered-totals-title">{lang key='renewService.titleAltPlural'}</h4>
        <div class="bordered-totals-items">
          {foreach $carttotals.renewalsByType.services as $serviceId => $serviceRenewal}
            <div class="bordered-totals-item" id="cartServiceRenewal{$serviceId}">
              <span class="text-left">
                <div>{$serviceRenewal.name}</div>
                <div class="text-muted">{$serviceRenewal.domainName}</div>
                <div class="text-muted">{$serviceRenewal.billingCycle}</div>
              </span>
              <span class="text-right">
                {$serviceRenewal.recurringBeforeTax}
                <a onclick="removeItem('r','{$serviceId}','service'); return false;" href="#" id="linkCartRemoveServiceRenewal{$serviceId}" class="ml-2">
                  <i class="fas fa-fw fa-trash-alt"></i>
                </a>
              </span>
            </div>
          {/foreach}
        </div>
      </div>
    {/if}

    {if !empty($carttotals.renewalsByType.addons)}
      <div class="bordered-totals">
        <h4 class="bordered-totals-title">{lang key='renewServiceAddon.titleAltPlural'}</h4>
        <div class="bordered-totals-items">
          {foreach $carttotals.renewalsByType.addons as $serviceAddonId => $serviceAddonRenewal}
            <div class="bordered-totals-item" id="cartServiceAddonRenewal{$serviceAddonId}">
              <span class="text-left">
                <div>{$serviceAddonRenewal.name}</div>
                <div class="text-muted">{$serviceAddonRenewal.domainName}</div>
                <div class="text-muted">{$serviceAddonRenewal.billingCycle}</div>
              </span>
              <span class="text-right">
                {$serviceAddonRenewal.recurringBeforeTax}
                <a onclick="removeItem('r','{$serviceAddonId}','addon'); return false;" href="#" id="linkCartRemoveServiceAddonRenewal{$serviceAddonId}" class="ml-2">
                  <i class="fas fa-fw fa-trash-alt"></i>
                </a>
              </span>
            </div>
          {/foreach}
        </div>
      </div>
    {/if}

  {elseif !empty($renewals) && !empty($carttotals.renewalsByType.domains)}

    {* Domain Renewals *}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{lang key='domainrenewals'}</h4>
      <div class="bordered-totals-items">
        {foreach $carttotals.renewalsByType.domains as $domainId => $renewal}
          <div class="bordered-totals-item" id="cartDomainRenewal{$domainId}">
            <span class="text-left">
              <div>{$renewal.domain} - {$renewal.regperiod} {if $renewal.regperiod == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}</div>
              {if $renewal.dnsmanagement}
                <div class="text-muted">+ {lang key='domaindnsmanagement'}</div>
              {/if}
              {if $renewal.emailforwarding}
                <div class="text-muted">+ {lang key='domainemailforwarding'}</div>
              {/if}
              {if $renewal.idprotection}
                <div class="text-muted">+ {lang key='domainidprotection'}</div>
              {/if}
              {if $renewal.hasGracePeriodFee}
                <div class="text-muted">+ {lang key='domainRenewal.graceFee'}</div>
              {/if}
              {if $renewal.hasRedemptionGracePeriodFee}
                <div class="text-muted">+ {lang key='domainRenewal.redemptionFee'}</div>
              {/if}
            </span>
            <span class="text-right">
              {$renewal.priceBeforeTax}
              <a onclick="removeItem('r','{$domainId}','domain'); return false;" href="#" id="linkCartRemoveDomainRenewal{$domainId}" class="ml-2">
                <i class="fas fa-fw fa-trash-alt"></i>
              </a>
            </span>
          </div>
        {/foreach}
      </div>
    </div>
  {/if}

  {* Subtotal *}
  <div class="bordered-totals">
    <h4 class="bordered-totals-title">{lang key='ordersubtotal'}</h4>
    <div class="bordered-totals-items">
      <div class="bordered-totals-item">
        <span class="text-left">{lang key='ordersubtotal'}</span>
        <span class="text-right">{$carttotals.subtotal}</span>
      </div>
    </div>
  </div>

  {* Taxes *}
  {if ($carttotals.taxrate && $carttotals.taxtotal) || ($carttotals.taxrate2 && $carttotals.taxtotal2)}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.taxes}</h4>
      <div class="bordered-totals-items">
        {if $carttotals.taxrate}
          <div class="bordered-totals-item">
            <span class="text-left">{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
            <span class="text-right">{$carttotals.taxtotal}</span>
          </div>
        {/if}
        {if $carttotals.taxrate2}
          <div class="bordered-totals-item">
            <span class="text-left">{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
            <span class="text-right">{$carttotals.taxtotal2}</span>
          </div>
        {/if}
      </div>
    </div>
  {/if}

  {* Total *}
  <div class="total">
    <div>
      <span>{lang key='ordertotalduetoday'}</span>
      <span class="total-price">{$carttotals.total}</span>
    </div>
  </div>
  {* actions *}
  <div class="actions">
    <a href="{$WEB_ROOT}/cart.php?a=view" class="btn btn-primary btn-block btn-checkout{if $cartitems == 0} disabled{/if}" id="btnGoToCart">
      {lang key='viewcart'}
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
        <path d="M5 12h14" />
        <path d="m12 5 7 7-7 7" />
      </svg>
    </a>
  </div>

{else}
  <div class="view-cart-empty">
    {$LANG.cartempty}
  </div>
{/if}