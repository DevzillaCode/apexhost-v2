{foreach $products as $key => $product}
  {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
  {* col *}
  <div class="col-md-6">
    {* standard-card *}
    <div class="standard-card featured-card {if $product.isFeatured}popular{/if} position-relative p-8 h-100 d-flex flex-column justify-content-between" id="{$idPrefix}">
      {* standard-card-header *}
      <div class="standard-card-header d-flex align-items-center justify-content-between pb-8 mb-8">
        <h2 class="card-headline color-foreground title-4 mb-0" id="{$idPrefix}-name">{$product.name}</h2>
        {if $product.stockControlEnabled}
          <span class="card-qty text-size-sm color-muted-foreground">{$product.qty} {$LANG.orderavailable}</span>
        {/if}
      </div>
      {* standard-card-body *}
      <div class="standard-card-body">
        <div class="row" data-gap-y="15px">
          {* col *}
          {foreach $product.features as $feature => $value}
            <div class="col-lg-6">
              <div class="fea-item d-flex align-items-center">
                <svg class="icon d-inline-flex align-items-center" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <g id="SVGRepo_bgCarrier" stroke-width="0" transform="translate(4.5600000000000005,4.5600000000000005), scale(0.62)">
                    <rect x="-2.4" y="-2.4" width="24" height="24" rx="14.4" fill="#ffffff" strokewidth="0"></rect>
                  </g>
                  <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="CCCCCC" stroke-width="0.048"></g>
                  <g id="SVGRepo_iconCarrier">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM16.0303 8.96967C16.3232 9.26256 16.3232 9.73744 16.0303 10.0303L11.0303 15.0303C10.7374 15.3232 10.2626 15.3232 9.96967 15.0303L7.96967 13.0303C7.67678 12.7374 7.67678 12.2626 7.96967 11.9697C8.26256 11.6768 8.73744 11.6768 9.03033 11.9697L10.5 13.4393L12.7348 11.2045L14.9697 8.96967C15.2626 8.67678 15.7374 8.67678 16.0303 8.96967Z" fill=""></path>
                  </g>
                </svg>
                <span class="color-neutral-300 text-size-base">{$value} {$feature}</span>
              </div>
            </div>
          {foreachelse}
            {assign var="descriptionLines" value=explode("\n", $product.description)}
            {foreach $descriptionLines as $line}
              {if $line|trim != ""}
                <div class="col-lg-6">
                  <div class="fea-item d-flex align-items-center">
                    <svg class="icon d-inline-flex align-items-center" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g id="SVGRepo_bgCarrier" stroke-width="0" transform="translate(4.5600000000000005,4.5600000000000005), scale(0.62)">
                        <rect x="-2.4" y="-2.4" width="24" height="24" rx="14.4" fill="#ffffff" strokewidth="0"></rect>
                      </g>
                      <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="CCCCCC" stroke-width="0.048"></g>
                      <g id="SVGRepo_iconCarrier">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM16.0303 8.96967C16.3232 9.26256 16.3232 9.73744 16.0303 10.0303L11.0303 15.0303C10.7374 15.3232 10.2626 15.3232 9.96967 15.0303L7.96967 13.0303C7.67678 12.7374 7.67678 12.2626 7.96967 11.9697C8.26256 11.6768 8.73744 11.6768 9.03033 11.9697L10.5 13.4393L12.7348 11.2045L14.9697 8.96967C15.2626 8.67678 15.7374 8.67678 16.0303 8.96967Z" fill=""></path>
                      </g>
                    </svg>
                    <span class="color-neutral-300 text-size-base">{$line|trim}</span>
                  </div>
                </div>
              {/if}
            {/foreach}
          {/foreach}
        </div>
      </div>
      {* standard-card-footer *}
      <div class="standard-card-footer pt-8 mt-8">
        {* row *}
        <div class="row align-items-center">
          {* col *}
          <div class="col-lg-6">
            {* card-price *}
            <div class="d-flex align-items-center" data-gap-x="10px">
              <span class="card-price text-size-lg font-weight-semibold color-foreground">
                <span class="card-sign text-size-lg color-foreground">
                  {$product.pricing.minprice.price|substr:0:1}
                </span>
                {$product.pricing.minprice.price|substr:1}
              </span>

              <span class="card-currency text-size-sm color-muted-foreground">
                <span class="card-cycle">
                  {if $product.pricing.minprice.cycle eq "monthly"}
                    /Month
                  {elseif $product.pricing.minprice.cycle eq "quarterly"}
                    /Quarter
                  {elseif $product.pricing.minprice.cycle eq "semiannually"}
                    /6 Months
                  {elseif $product.pricing.minprice.cycle eq "annually"}
                    /Year
                  {elseif $product.pricing.minprice.cycle eq "biennially"}
                    /2 Years
                  {elseif $product.pricing.minprice.cycle eq "triennially"}
                    /3 Years
                  {/if}
                </span>
              </span>
            </div>

          </div>
          {* col *}
          <div class="col-lg-6 text-lg-right text-center mt-lg-0 mt-4">
            <a href="{$product.productUrl}" id="{$idPrefix}-order-button" {if $product.hasRecommendations} data-has-recommendations="1" {/if} class="nt-btn nt-btn-default">{$LANG.ordernowbutton}<i class="fad fa-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
{/foreach}