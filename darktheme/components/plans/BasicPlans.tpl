{* Plans Prices Variables *}
{* ! IMPORTANT: Ensure these variables match the prices in the database *}
{assign var="basicPlanPrice" value="12.99"} {* ? Basic Plan Price: $12.99 *}
{assign var="standardPlanPrice" value="19.99"} {* ? Standard Plan Price: $19.99 *}
{assign var="popularPlanPrice" value="19.99"} {* ? Popular Plan Price: $19.99 *}
{assign var="premiumPlanPrice" value="29.99"} {* ? Premium Plan Price: $29.99 *}

{* Basic Plans *}
<section class="basic-plans-section section-padding-large">
  <div class="container-fluid">
    <!-- section-title -->
    {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="T_hostingPlans"}" tagline="{lang key="T_hostingPlansDescription"}<br />{lang key="T_hostingProducts"}"}
    {* Plan Cards *}
    {foreach $productGroups as $group}
      {if $group.name eq "Shared Hosting"}
        <!-- row -->
        <div class="row" data-gap-y="30px">
          {foreach $group.products as $product}
            <!-- col -->
            <div class="col-xl-3 col-md-6">
              <div class="regular-plan-card h-100 {if $product.isFeatured}popular{/if}">
                <!-- plan-header -->
                <div class="plan-header">
                  <!-- top-area -->
                  <div class="top-area d-flex align-items-center justify-content-between mb-6">
                    <!-- icon -->
                    <div class="icon d-flex align-items-center justify-content-center rounded-circle">
                      <i class="fad fa-certificate text-size-3xl color-foreground"></i>
                    </div>
                  </div>
                  <!-- plan-title -->
                  <div class="plan-title mb-3">
                    <h3 class="title title-4 font-weight-semibold">{$product.name}</h3>
                  </div>
                  <!-- plan-desc -->
                  <div class="plan-desc mb-6">
                    <p class="text text-size-sm">{$product.short_description}</p>
                  </div>
                  <!-- plan-price -->
                  <div class="plan-price mb-5">
                    <div class="sub-title text-size-sm font-weight-medium mb-2">{lang key="T_startFrom"}</div>
                    <h3 class="price title-4 font-weight-bold color-foreground">
                      {* ! IMPORTANT: If you change the product name in the admin area, update the names here to match. *}
                      {* ? The {$product.name} must exactly match the plan name set in the database. *}
                      <span class="currency font-weight-semibold">$</span>
                      {if $product.name == "Basic"}
                        {$basicPlanPrice} {* ? Basic Plan Price *}
                      {elseif $product.name == "Standard"}
                        {$standardPlanPrice} {* ? Standard Plan Price *}
                      {elseif $product.name == "Popular"}
                        {$popularPlanPrice} {* ? Popular Plan Price *}
                      {elseif $product.name == "Premium"}
                        {$premiumPlanPrice} {* ? Premium Plan Price *}
                      {else}
                        12.99 {* ! Default price if no match is found. *}
                      {/if}
                      <span class="duration text-size-sm font-weight-medium">/{lang key="T_month"}</span>
                    </h3>
                  </div>
                  <!-- plan-action -->
                  <div class="plan-action">
                    <a href="{$product.orderlink}" class="btn btn-light btn-block">{lang key="T_chooseThisPlan"}</a>
                  </div>
                </div>
                <!-- plan-features -->
                <div class="plan-features px-5">
                  <!-- features-title -->
                  <h5 class="features-title title-6 font-weight-semibold color-foreground mb-5">{lang key="T_topFeatures"}</h5>
                  <!-- features-list -->
                  <ul class="features-list list-unstyled d-flex flex-column" data-gap-y="12px">
                    <!-- list-item -->
                    {foreach $product.features as $feature => $value}
                      <div class="item" id="{$idPrefix}-feature{$value@iteration}">
                        <img src="{assetPath ns="img" file="checked.png"}" class="icon mr--sm-2 img-fluid" alt="icon">
                        {$value} {$feature}
                      </div>
                    {foreachelse}
                      {assign var="descriptionLines" value=explode("\n", $product.description)}
                      {foreach $descriptionLines as $line}
                        <li class="list-item d-flex align-items-center justify-content-start" data-gap-x="10px">
                          <svg class="icon d-inline-flex align-items-center" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g id="SVGRepo_bgCarrier" stroke-width="0" transform="translate(4.5600000000000005,4.5600000000000005), scale(0.62)">
                              <rect x="-2.4" y="-2.4" width="24" height="24" rx="14.4" fill="#ffffff" strokewidth="0"></rect>
                            </g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="CCCCCC" stroke-width="0.048"></g>
                            <g id="SVGRepo_iconCarrier">
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM16.0303 8.96967C16.3232 9.26256 16.3232 9.73744 16.0303 10.0303L11.0303 15.0303C10.7374 15.3232 10.2626 15.3232 9.96967 15.0303L7.96967 13.0303C7.67678 12.7374 7.67678 12.2626 7.96967 11.9697C8.26256 11.6768 8.73744 11.6768 9.03033 11.9697L10.5 13.4393L12.7348 11.2045L14.9697 8.96967C15.2626 8.67678 15.7374 8.67678 16.0303 8.96967Z" fill=""></path>
                            </g>
                          </svg>
                          <span class="text-size-base">
                            {$line}
                          </span>
                        </li>
                      {/foreach}
                    {/foreach}
                  </ul>
                </div>
              </div>
            </div>
          {/foreach}
        </div>
      {/if}
    {/foreach}
    {* Section Features *}
    <!-- section-features -->
    <div class="section-features d-flex align-items-center justify-content-center flex-wrap" data-gap-x="30px" data-gap-y="15px">
      <!-- line -->
      <div class="line d-flex align-items-center justify-content-center" data-gap-x="10px">
        <svg class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
          <path class="st0" d="M256,0C114.8,0,0,114.8,0,256s114.8,256,256,256s256-114.8,256-256S397.2,0,256,0z"></path>
          <path class="st1" fill="#ffffff" d="M385.8,201.8L247.1,340.4c-4.2,4.2-9.6,6.3-15.1,6.3s-10.9-2.1-15.1-6.3l-69.3-69.3c-8.3-8.3-8.3-21.8,0-30.2
        c8.3-8.3,21.8-8.3,30.2,0l54.3,54.3l123.6-123.6c8.3-8.3,21.8-8.3,30.2,0C394.1,179.9,394.1,193.4,385.8,201.8z"></path>
        </svg>
        <span class="text text-size-sm font-weight-medium color-neutral-300">{lang key="T_backupsMonthly"}</span>
      </div>
      <!-- line -->
      <div class="line d-flex align-items-center justify-content-center" data-gap-x="10px">
        <svg class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
          <path class="st0" d="M256,0C114.8,0,0,114.8,0,256s114.8,256,256,256s256-114.8,256-256S397.2,0,256,0z"></path>
          <path class="st1" fill="#ffffff" d="M385.8,201.8L247.1,340.4c-4.2,4.2-9.6,6.3-15.1,6.3s-10.9-2.1-15.1-6.3l-69.3-69.3c-8.3-8.3-8.3-21.8,0-30.2 c8.3-8.3,21.8-8.3,30.2,0l54.3,54.3l123.6-123.6c8.3-8.3,21.8-8.3,30.2,0C394.1,179.9,394.1,193.4,385.8,201.8z"></path>
        </svg>
        <span class="text text-size-sm font-weight-medium color-neutral-300">{lang key="T_freeWhiteGloveMigrations"}</span>
      </div>
      <!-- line -->
      <div class="line d-flex align-items-center justify-content-center" data-gap-x="10px">
        <svg class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
          <path class="st0" d="M256,0C114.8,0,0,114.8,0,256s114.8,256,256,256s256-114.8,256-256S397.2,0,256,0z"></path>
          <path class="st1" fill="#ffffff" d="M385.8,201.8L247.1,340.4c-4.2,4.2-9.6,6.3-15.1,6.3s-10.9-2.1-15.1-6.3l-69.3-69.3c-8.3-8.3-8.3-21.8,0-30.2 c8.3-8.3,21.8-8.3,30.2,0l54.3,54.3l123.6-123.6c8.3-8.3,21.8-8.3,30.2,0C394.1,179.9,394.1,193.4,385.8,201.8z"></path>
        </svg>
        <span class="text text-size-sm font-weight-medium color-neutral-300">{lang key="T_stagingEnvironments"}</span>
      </div>
    </div>
  </div>
</section>