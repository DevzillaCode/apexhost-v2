{* Servers Locations Section *}
<section class="servers-locations-section section-padding-large">
  <div class="container-fluid">
    {* section-title *}
    {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="T_globalPerformanceTitle"}" tagline="{lang key="T_globalPerformanceDesc"}"}
    {* locations *}
    <div class="locations d-flex align-items-center justify-content-center flex-wrap" data-gap-x="45px">
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center --mb-5" data-gap-x="10px">
        {* location-image *}
        <div class="location-image">
          <img src="{$WEB_ROOT}/templates/apexhost/images/servers-flags/us.svg" class="img-fluid" alt="{lang key="USA"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center" data-gap-x="10px">
          <h3 class="location-name --text-base --color-foreground --font-medium mb-0">{lang key="NewYork"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center --text-base --font-medium --color-muted-foreground" data-gap-x="5px">8ms<i class="fas fa-sync-alt --text-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center --mb-5" data-gap-x="10px">
        {* location-image *}
        <div class="location-image">
          <img src="{$WEB_ROOT}/templates/apexhost/images/servers-flags/united-kingdom.svg" class="img-fluid" alt="{lang key="UK"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center" data-gap-x="10px">
          <h3 class="location-name --text-base --color-foreground --font-medium mb-0">{lang key="London"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center --text-base --font-medium --color-muted-foreground" data-gap-x="5px">15ms<i class="fas fa-sync-alt --text-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center --mb-5" data-gap-x="10px">
        {* location-image *}
        <div class="location-image">
          <img src="{$WEB_ROOT}/templates/apexhost/images/servers-flags/singapore.svg" class="img-fluid" alt="{lang key="Singapore"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center" data-gap-x="10px">
          <h3 class="location-name --text-base --color-foreground --font-medium mb-0">{lang key="Singapore"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center --text-base --font-medium --color-muted-foreground" data-gap-x="5px">35ms<i class="fas fa-sync-alt --text-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center --mb-5" data-gap-x="10px">
        {* location-image *}
        <div class="location-image">
          <img src="{$WEB_ROOT}/templates/apexhost/images/servers-flags/german.svg" class="img-fluid" alt="{lang key="Germany"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center" data-gap-x="10px">
          <h3 class="location-name --text-base --color-foreground --font-medium mb-0">{lang key="Frankfurt"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center --text-base --font-medium --color-muted-foreground" data-gap-x="5px">20ms<i class="fas fa-sync-alt --text-sm"></i></p>
        </div>
      </div>
      {* location-item *}
      <div class="location-item position-relative d-flex align-items-center --mb-5" data-gap-x="10px">
        {* location-image *}
        <div class="location-image">
          <img src="{$WEB_ROOT}/templates/apexhost/images/servers-flags/japan.svg" class="img-fluid" alt="{lang key="Japan"}">
        </div>
        {* location-info *}
        <div class="location-info d-flex align-items-center" data-gap-x="10px">
          <h3 class="location-name --text-base --color-foreground --font-medium mb-0">{lang key="Tokyo"}</h3>
          <p class="server-latency mb-0 d-inline-flex align-items-center --text-base --font-medium --color-muted-foreground" data-gap-x="5px">45ms<i class="fas fa-sync-alt --text-sm"></i></p>
        </div>
      </div>
    </div>
    {* locations-map *}
    <div class="locations-map mt-5">
      <img src="{$WEB_ROOT}/templates/apexhost/images/ui/map.png" class="map-image img-fluid" alt="{lang key="serversLocationsMap"}">
    </div>
  </div>
</section>