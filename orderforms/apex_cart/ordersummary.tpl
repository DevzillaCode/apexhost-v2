{* Main product totals display - shows when purchasing new products *}
{if $producttotals}

  {* Product information section *}
  <div class="bordered-totals">
    <div class="titles-group">
      {* Show quantity if more than 1 *}
      <h4 class="product-name">{if $producttotals.allowqty && $producttotals.qty > 1}{$producttotals.qty} x {/if}{$producttotals.productinfo.name}</h4>
      <h4 class="product-group">{$producttotals.productinfo.groupname}</h4>
    </div>

    {* Base product price *}
    <div class="bordered-totals-item">
      <span class="text-left">{$producttotals.productinfo.name}</span>
      <span id="discount" class="text-right">{$producttotals.pricing.baseprice}</span>
    </div>

    {* Configurable options *}
    {foreach $producttotals.configoptions as $configoption}
      <div class="bordered-totals-item">
        <span class="text-left">{$configoption.name}: {$configoption.optionname}</span>
        <span class="text-right">{$configoption.recurring}{if $configoption.setup} + {$configoption.setup} {$LANG.ordersetupfee}{/if}</span>
      </div>
    {/foreach}

    {* Addons *}
    {foreach $producttotals.addons as $addon}
      <div class="bordered-totals-item">
        <span class="text-left">+ {$addon.name}</span>
        <span class="text-right">{$addon.recurring}</span>
      </div>
    {/foreach}

    {* Setup fees and recurring pricing *}
    {if $producttotals.pricing.setup || $producttotals.pricing.recurring || $producttotals.pricing.addons}
      {if $producttotals.pricing.setup}
        <div class="bordered-totals-item">
          <span class="text-left">{$LANG.cartsetupfees}:</span>
          <span class="text-right">{$producttotals.pricing.setup}</span>
        </div>
      {/if}
      {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
        <div class="bordered-totals-item">
          <span class="text-left">{$cycle}:</span>
          <span class="text-right">{$recurring}</span>
        </div>
      {/foreach}
    {/if}
  </div>

  {* Tax calculations *}
  {if $producttotals.pricing.tax1}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.taxes}</h4>
      <div class="bordered-totals-item">
        <span class="text-left">{$carttotals.taxname} @ {$carttotals.taxrate}%:</span>
        <span class="text-right">{$producttotals.pricing.tax1}</span>
      </div>
    </div>
  {/if}
  {if $producttotals.pricing.tax2}
    <div class="bordered-totals">
      <h4 class="bordered-totals-title">{$LANG.taxes}</h4>
      <div class="bordered-totals-item">
        <span class="text-left">{$carttotals.taxname2} @ {$carttotals.taxrate2}%:</span>
        <span class="text-right">{$producttotals.pricing.tax2}</span>
      </div>
    </div>
  {/if}

  {* Grand total *}
  <div class="total">
    <div>
      <span>{$LANG.total}</span>
      <span class="total-price">{$producttotals.pricing.totaltoday}</span>
    </div>
  </div>

  {* Renewals display - shows when renewing services/domains *}
{elseif !empty($renewals) || !empty($serviceRenewals)}

  {* Service renewals section *}
  {if !empty($serviceRenewals)}
    {if !empty($carttotals.renewalsByType.services)}
      <div class="bordered-totals">
        <div class="titles-group">
          <h4 class="product-name">{lang key='renewService.titleAltPlural'}</h4>
        </div>
        {foreach $carttotals.renewalsByType.services as $serviceId => $serviceRenewal}
          <div class="bordered-totals-item" id="cartServiceRenewal{$serviceId}">
            <div class="text-left">
              <div>{$serviceRenewal.name}</div>
              <div>{$serviceRenewal.domainName}</div>
            </div>
            <div class="text-right">
              <div>{$serviceRenewal.recurringBeforeTax}&nbsp;{$serviceRenewal.billingCycle}</div>
              {* Remove item button with trash icon *}
              <div>
                <a onclick="removeItem('r','{$serviceId}','service'); return false;" class="btn-square btn-semi-ghost-danger btn-xxs" href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6" />
                    <path d="M3 6h18" />
                    <path d="M8 6V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                  </svg>
                </a>
              </div>
            </div>
          </div>
        {/foreach}
      </div>
    {/if}

    {* Service addon renewals *}
    {if !empty($carttotals.renewalsByType.addons)}
      <div class="bordered-totals">
        {* Similar structure to service renewals *}
        {foreach $carttotals.renewalsByType.addons as $serviceAddonId => $serviceAddonRenewal}
          {* ... *}
        {/foreach}
      </div>
    {/if}
    {* Domain renewals section *}
  {elseif !empty($renewals) && !empty($carttotals.renewalsByType.domains)}
    <div class="bordered-totals">
      <div class="titles-group">
        <h4 class="product-name">{lang key='domainrenewals'}</h4>
      </div>
      {foreach $carttotals.renewalsByType.domains as $domainId => $renewal}
        <div class="bordered-totals-item" id="cartDomainRenewal{$domainId}">
          <span class="text-left">
            {$renewal.priceBeforeTax}&nbsp;{$renewal.domain} - {$renewal.regperiod} {if $renewal.regperiod == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}
          </span>
          <span class="text-right">
            {* Remove button with trash icon *}
            <a onclick="removeItem('r','{$domainId}','domain'); return false;" href="#" class="btn-square btn-semi-ghost-danger btn-xxs">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash-icon lucide-trash">
                {* SVG paths *}
              </svg>
            </a>
          </span>
        </div>

        {* Domain addons *}
        {if $renewal.dnsmanagement}
          <div class="clearfix">
            <span class="text-left">+ {lang key='domaindnsmanagement'}</span>
          </div>
        {/if}
        {* Other domain addons... *}
      {/foreach}
    </div>
  {/if}

  {* Tax calculations for renewals *}
  {if ($carttotals.taxrate && $carttotals.taxtotal) || ($carttotals.taxrate2 && $carttotals.taxtotal2)}
    {* Similar tax display as product totals *}
  {/if}

  {* Renewals totals *}
  <div class="total">
    <div>
      <span>{$LANG.ordersubtotal}</span>
      <span class="total-price">{$carttotals.subtotal}</span>
    </div>
    <div>
      <span>{lang key='ordertotalduetoday'}</span>
      <span class="total-price">{$carttotals.total}</span>
    </div>
  </div>
{/if}