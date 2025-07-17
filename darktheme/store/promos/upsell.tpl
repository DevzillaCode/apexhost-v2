<div class="promo-banner promo-banner-rounded {$promotion->getClass()} border">
  <div class="card-body">
    <div class="icon-left">
      <a href="{$promotion->getLearnMoreRoute()}">
        <img src="{$promotion->getImagePath()}">
      </a>
    </div>

    <div class="content">

      <h3 class="title-4 font-weight-semibold">
        {$promotion->getHeadline()}
        {if $promotion->getLearnMoreRoute()}
          <small><a href="{$promotion->getLearnMoreRoute()}">{lang key='learnmore'}...</a></small>
        {/if}
      </h3>
      <h4 class="title-4 font-weight-medium">{$promotion->getTagline()}</h4>

      {if $promotion->getDescription()}
        <p>{$promotion->getDescription()}</p>
      {/if}

      {if $promotion->hasFeatures()}
        <ul class="mt-3">
          {assign "promotionFeatures" $promotion->getFeatures()}
          {foreach $promotionFeatures as $key=>$feature}
            <li class="{if $key < ($promotionFeatures|@count / 2)}left{else}right{/if} d-flex align-items-center mb-2">
              <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                <circle cx="12" cy="12" r="10" />
                <path d="m9 12 2 2 4-4" />
              </svg>{$feature}
            </li>
          {/foreach}
        </ul>
      {/if}

      <form method="post" action="{$targetUrl}">
        {foreach $inputParameters as $key => $value}
          <input type="hidden" name="{$key}" value="{$value}">
        {/foreach}
        <button type="submit" class="btn btn-success">
          {if $product->isFree()}
            {$promotion->getCta()}
            {lang key="orderfree"}
          {else}
            {$promotion->getCta()} {$product->name}
            {lang key="fromJust"}
            {if $product->pricing()->first()->isYearly()}
              {$product->pricing()->first()->yearlyPrice()}
            {elseif $product->pricing()->first()->isOneTime()}
              {$product->pricing()->first()->oneTimePrice()}
            {else}
              {$product->pricing()->first()->monthlyPrice()}
            {/if}
          {/if}
        </button>
      </form>

    </div>

  </div>
</div>