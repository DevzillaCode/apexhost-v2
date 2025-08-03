<section class="page-header">
  <div class="d-flex align-items-end justify-content-between gap-4 flex-wrap">
    <div>
      {if $headline}
        <h1 class="page-headline title-4 font-weight-bold">{$headline}</h1>
      {/if}
      {if $tagline}
        <p class="page-tagline text-size-base color-muted-foreground mt-1">{$tagline}</p>
      {/if}
    </div>
    {* check if this page is service renewals *}
    {if $templatefile == 'service-renewals'}
      {* Button to toggle service visibility *}
      <button id="hideShowServiceRenewalButton" class="btn btn-sm btn-semi-ghost-light service-renewals-quick-filter">
        <span class="to-hide">
          {lang key='renewService.hideShowServices.hide'}
        </span>
        <span class="to-show">
          {lang key='renewService.hideShowServices.show'}
        </span>
      </button>
    {/if}
  </div>
</section>