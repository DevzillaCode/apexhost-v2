{if $featuredTlds}
  <div class="featured-tlds-container">
    <div class="row">
      {foreach $featuredTlds as $num => $tldinfo}
        {if $num % 3 == 0 && (count($featuredTlds) - $num < 3)}
          {if count($featuredTlds) - $num == 2}
            <div class="col-sm-2"></div>
          {else}
            <div class="col-sm-4"></div>
          {/if}
        {/if}
        <div class="col-lg-4 col-sm-6">
          <div class="featured-tld">
            <div class="img-container">
              <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
            </div>
            <div class="price {$tldinfo.tldNoDots}">
              {if is_object($tldinfo.register)}
                {$tldinfo.register->toPrefixed()}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
              {else}
                {lang key="domainregnotavailable"}
              {/if}
            </div>
          </div>
        </div>
      {/foreach}
    </div>
  </div>
{/if}