{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}

{* Servers Locations Section *}
<section class="servers-locations-section section-padding-large">
  <div class="container-fluid">
    {* section-title *}
    {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="T_globalPerformanceTitle"}" tagline="{lang key="T_globalPerformanceDesc"}"}
    {* locations *}
    <div class="locations d-flex align-items-center justify-content-center flex-wrap col-gap-10">
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center mb-5 col-gap-3">
        {* location-image *}
        <div class="location-image">
          <img src="{$assetPath}servers-flags/us.svg" class="img-fluid" alt="{lang key="USA"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center col-gap-3">
          <h3 class="location-name text-size-base color-foreground font-weight-medium mb-0">{lang key="NewYork"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center text-size-base font-weight-medium color-muted-foreground col-gap-1">8ms<i class="fas fa-sync-alt text-size-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center mb-5 col-gap-3">
        {* location-image *}
        <div class="location-image">
          <img src="{$assetPath}servers-flags/united-kingdom.svg" class="img-fluid" alt="{lang key="UK"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center col-gap-3">
          <h3 class="location-name text-size-base color-foreground font-weight-medium mb-0">{lang key="London"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center text-size-base font-weight-medium color-muted-foreground col-gap-1">15ms<i class="fas fa-sync-alt text-size-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center mb-5 col-gap-3">
        {* location-image *}
        <div class="location-image">
          <img src="{$assetPath}servers-flags/singapore.svg" class="img-fluid" alt="{lang key="Singapore"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center col-gap-3">
          <h3 class="location-name text-size-base color-foreground font-weight-medium mb-0">{lang key="Singapore"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center text-size-base font-weight-medium color-muted-foreground col-gap-1">35ms<i class="fas fa-sync-alt text-size-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center mb-5 col-gap-3">
        {* location-image *}
        <div class="location-image">
          <img src="{$assetPath}servers-flags/german.svg" class="img-fluid" alt="{lang key="Germany"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center col-gap-3">
          <h3 class="location-name text-size-base color-foreground font-weight-medium mb-0">{lang key="Frankfurt"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center text-size-base font-weight-medium color-muted-foreground col-gap-1">20ms<i class="fas fa-sync-alt text-size-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center mb-5 col-gap-3">
        {* location-image *}
        <div class="location-image">
          <img src="{$assetPath}servers-flags/japan.svg" class="img-fluid" alt="{lang key="Japan"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center col-gap-3">
          <h3 class="location-name text-size-base color-foreground font-weight-medium mb-0">{lang key="Tokyo"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center text-size-base font-weight-medium color-muted-foreground col-gap-1">45ms<i class="fas fa-sync-alt text-size-sm"></i></p>
        </div>
      </div>
    </div>
    {* locations-map *}
    <div class="locations-map mt-5">
      <img src="{$assetPath}ui/map.png" class="map-image img-fluid" alt="{lang key="serversLocationsMap"}">
    </div>
  </div>
</section>