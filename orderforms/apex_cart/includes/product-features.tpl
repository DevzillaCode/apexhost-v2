{if count($productGroup.features) > 0}
  {* se-footer *}
  <div class="se-footer mt-10">
    {* se-footer-title *}
    <div class="se-footer-title text-size-xl font-weight-semibold color-foreground mb-5">{$LANG.orderForm.includedWithPlans}</div>
    {* row *}
    <div class="row row-gap-4">
      {foreach $productGroup.features as $features}
        <div class="col-lg-4 col-md-6">
          <!-- line -->
          <div class="line d-flex align-items-center justify-content-start col-gap-3">
            <svg class="icon width-5 color-accent" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
              <path class="st0" fill="currentColor" d="M256,0C114.8,0,0,114.8,0,256s114.8,256,256,256s256-114.8,256-256S397.2,0,256,0z"></path>
              <path class="st1" fill="#ffffff" d="M385.8,201.8L247.1,340.4c-4.2,4.2-9.6,6.3-15.1,6.3s-10.9-2.1-15.1-6.3l-69.3-69.3c-8.3-8.3-8.3-21.8,0-30.2 c8.3-8.3,21.8-8.3,30.2,0l54.3,54.3l123.6-123.6c8.3-8.3,21.8-8.3,30.2,0C394.1,179.9,394.1,193.4,385.8,201.8z"></path>
            </svg>
            <span class="text text-size-sm font-weight-medium">
              {$features.feature}
            </span>
          </div>
        </div>
      {/foreach}
    </div>
  </div>
{/if}