{* HostingSolutions *}
{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
  <section class="hosting-solutions-section section-padding-large">
    <div class="container-fluid">
      {* section-title *}
      {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="T_hostingSolutionsTitle"}" tagline="{lang key="T_hostingSolutionsDesc"}"}
      {* hosting-solutions-cards *}
      <div class="row" data-gap-y="30px">
        {* col *}
        <div class="col-lg-6">
          {* ui-content *}
          <div class="ui-content position-relative h-100 mr-lg-4">
            <div class="ui-content-inner d-flex flex-column justify-content-between align-items-start h-100">
              {* title *}
              <div>
                <h3 class="ui-content-subtitle position-relative gradient-text gradient-primary title-5 font-weight-bold mb-3">{lang key="T_hostingSolutionsMoreFeatures"}</h3>
                <h2 class="ui-content-title position-relative title-1 font-weight-bold color-foreground mb-10">{lang key="T_hostingSolutionsMainTitle"}</h2>
              </div>
              {* link *}
              <a href="/whmcs/register.php" class="nt-btn nt-btn-default">{lang key="getStartedNow"}
                <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 72 72">
                  <path fill="currentColor" d="M49.212 51.534L67 35.036L49.212 18.538l-3.789 4.076l10.396 9.641H5v5.562h50.819l-10.396 9.642z" />
                  <path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" d="M49.212 51.534L67 35.036L49.212 18.538l-3.789 4.076l10.396 9.641H5v5.562h50.819l-10.396 9.642z" />
                </svg>
              </a>
              </a>
            </div>
          </div>
        </div>
        {* col *}
        <div class="col-lg-6 ml-auto">
          {* row *}
          <div class="row" data-gap-y="30px">
            {foreach $productGroups as $productGroup}
              {if $productGroup@index < 4}
                {* col *}
                <div class="col-12">
                  {* ps-card *}
                  <div class="ps-card">
                    <a href="{$productGroup->getRoutePath()}" class="ps-title title-5 font-weight-medium color-foreground mb-4">{$productGroup.name}</a>
                    <p class="ps-desc text-size-base color-muted-foreground">{$productGroup.tagline}</p>
                  </div>
                </div>
              {/if}
            {/foreach}
            {if $registerdomainenabled}
              {* col *}
              <div class="col-12">
                {* ps-card *}
                <div class="ps-card">
                  <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="ps-title title-5 font-weight-medium color-foreground mb-4">{lang key='orderregisterdomain'}</a>
                  <p class="ps-desc text-size-base color-muted-foreground">{lang key='secureYourDomain'}</p>
                </div>
              </div>
            {/if}
            {if $transferdomainenabled}
              {* col *}
              <div class="col-12">
                {* ps-card *}
                <div class="ps-card">
                  <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="ps-title title-5 font-weight-medium color-foreground mb-4">{lang key='transferYourDomain'}</a>
                  <p class="ps-desc text-size-base color-muted-foreground">{lang key='transferExtend'}</p>
                </div>
              </div>
            {/if}
          </div>
        </div>
      </div>
    </div>
  </section>
{/if}