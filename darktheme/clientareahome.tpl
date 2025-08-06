{include file="$template/includes/flashmessage.tpl"}

{* row *}
<div class="row small-gutters mb-10 row-gap-4">
  {* col -> services *}
  <div class="col-lg-3 col-md-6">
    {* div *}
    <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-primary">
      {* text *}
      <div class="text">
        {* state *}
        <div class="title-3 font-weight-semibold">{$clientsstats.productsnumactive}</div>
        {* title *}
        <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='navservices'}</div>
      </div>
      {* icon *}
      <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-package-icon lucide-package">
          <path d="M11 21.73a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73z" />
          <path d="M12 22V12" />
          <polyline points="3.29 7 12 12 20.71 7" />
          <path d="m7.5 4.27 9 5.15" />
        </svg>
        <a href="clientarea.php?action=services" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='navservices'}" aria-label="{lang key='navservices'}">
          <span class="sr-only">{lang key='navservices'}</span>
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
            <path d="M5 12h14" />
            <path d="m12 5 7 7-7 7" />
          </svg>
        </a>
      </div>
    </div>
  </div>
  {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
    {* col -> domains *}
    <div class="col-lg-3 col-md-6">
      {* div *}
      <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-success">
        {* text *}
        <div class="text">
          {* state *}
          <div class="title-3 font-weight-semibold">{$clientsstats.numactivedomains}</div>
          {* title *}
          <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='navdomains'}</div>
        </div>
        {* icon *}
        <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
            <circle cx="12" cy="12" r="10" />
            <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
            <path d="M2 12h20" />
          </svg>
          <a href="clientarea.php?action=domains" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='navdomains'}" aria-label="{lang key='navdomains'}">
            <span class="sr-only">{lang key='navdomains'}</span>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
              <path d="M5 12h14" />
              <path d="m12 5 7 7-7 7" />
            </svg>
          </a>
        </div>
      </div>
    </div>
  {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
    {* col -> affiliates *}
    <div class="col-lg-3 col-md-6">
      {* div *}
      <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-warning">
        {* text *}
        <div class="text">
          {* state *}
          <div class="title-3 font-weight-semibold">{$clientsstats.numaffiliatesignups}</div>
          {* title *}
          <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='affiliatessignups'}</div>
        </div>
        {* icon *}
        <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users-icon lucide-users">
            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
            <path d="M16 3.128a4 4 0 0 1 0 7.744" />
            <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
            <circle cx="9" cy="7" r="4" />
          </svg>
          <a href="affiliates.php" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='affiliatessignups'}" aria-label="{lang key='affiliatessignups'}">
            <span class="sr-only">{lang key='affiliatessignups'}</span>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
              <path d="M5 12h14" />
              <path d="m12 5 7 7-7 7" />
            </svg>
          </a>
        </div>
      </div>
    </div>
  {else}
    {* col -> quotes *}
    <div class="col-lg-3 col-md-6">
      {* div *}
      <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-warning">
        {* text *}
        <div class="text">
          {* state *}
          <div class="title-3 font-weight-semibold">{$clientsstats.numquotes}</div>
          {* title *}
          <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='quotes'}</div>
        </div>
        {* icon *}
        <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-quote-icon lucide-quote">
            <path d="M16 3a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2 1 1 0 0 1 1 1v1a2 2 0 0 1-2 2 1 1 0 0 0-1 1v2a1 1 0 0 0 1 1 6 6 0 0 0 6-6V5a2 2 0 0 0-2-2z" />
            <path d="M5 3a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2 1 1 0 0 1 1 1v1a2 2 0 0 1-2 2 1 1 0 0 0-1 1v2a1 1 0 0 0 1 1 6 6 0 0 0 6-6V5a2 2 0 0 0-2-2z" />
          </svg>
          <a href="clientarea.php?action=quotes" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='quotes'}" aria-label="{lang key='quotes'}">
            <span class="sr-only">{lang key='quotes'}</span>
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
              <path d="M5 12h14" />
              <path d="m12 5 7 7-7 7" />
            </svg>
          </a>
        </div>
      </div>
    </div>
  {/if}
  {* col -> tickets *}
  <div class="col-lg-3 col-md-6">
    {* div *}
    <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-info">
      {* text *}
      <div class="text">
        {* state *}
        <div class="title-3 font-weight-semibold">{$clientsstats.numactivetickets}</div>
        {* title *}
        <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='navtickets'}</div>
      </div>
      {* icon *}
      <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-tickets-icon lucide-tickets">
          <path d="m4.5 8 10.58-5.06a1 1 0 0 1 1.342.488L18.5 8" />
          <path d="M6 10V8" />
          <path d="M6 14v1" />
          <path d="M6 19v2" />
          <rect x="2" y="8" width="20" height="13" rx="2" />
        </svg>
        <a href="supporttickets.php" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='navtickets'}" aria-label="{lang key='navtickets'}">
          <span class="sr-only">{lang key='navtickets'}</span>
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
            <path d="M5 12h14" />
            <path d="m12 5 7 7-7 7" />
          </svg>
        </a>
      </div>
    </div>
  </div>
  {* col -> invoices *}
  <div class="col-lg-3 col-md-6">
    {* div *}
    <div class="bg-card relative-hover position-relative text-card-foreground rounded-md py-4 px-4 shadow-sm border gap-6 d-flex align-items-center justify-content-between border-bottom-width-2 border-bottom-danger">
      {* text *}
      <div class="text">
        {* state *}
        <div class="title-3 font-weight-semibold">{$clientsstats.numunpaidinvoices}</div>
        {* title *}
        <div class="text-base text-uppercase font-weight-medium text-muted mt-2">{lang key='navinvoices'}</div>
      </div>
      {* icon *}
      <div class="icon position-relative rounded-circle d-inline-flex align-items-center justify-content-center size-6 border bg-dark">
        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scroll-text-icon lucide-scroll-text">
          <path d="M15 12h-5" />
          <path d="M15 8h-5" />
          <path d="M19 17V5a2 2 0 0 0-2-2H4" />
          <path d="M8 21h12a2 2 0 0 0 2-2v-1a1 1 0 0 0-1-1H11a1 1 0 0 0-1 1v1a2 2 0 1 1-4 0V5a2 2 0 1 0-4 0v2a1 1 0 0 0 1 1h3" />
        </svg>
        <a href="clientarea.php?action=invoices" class="tile-link btn-square btn-xs btn-secondary dropdown-toggle-split btn-circle position-absolute" title="{lang key='navinvoices'}" aria-label="{lang key='navinvoices'}">
          <span class="sr-only">{lang key='navinvoices'}</span>
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
            <path d="M5 12h14" />
            <path d="m12 5 7 7-7 7" />
          </svg>
        </a>
      </div>
    </div>
  </div>
</div>

{* Addons section for additional HTML content *}
{foreach $addons_html as $addon_html}
  <div class="addons-section mb-4">
    {$addon_html}
  </div>
{/foreach}

{* Client dashboard cards for dynamic panels *}
<div class="client-home-cards">
  <div class="row small-gutters row-gap-4">
    {* Full-width panels with colspan *}
    <div class="col-12">
      {function name=outputHomePanels}
        <div menuItemName="{$item->getName()}" class="card rounded-md shadow-sm border{if $item->getClass()} {$item->getClass()}{/if}" {if $item->getAttribute('id')} id="{$item->getAttribute('id')}" {/if}>
          {* Panel header *}
          <div class="card-header">
            <div class="d-flex align-items-center justify-content-between">
              <h3 class="title-6 font-weight-semibold">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i> {/if}
                {$item->getLabel()}
                {if $item->hasBadge()} <span class="badge">{$item->getBadge()}</span>{/if}
              </h3>
              {* Optional button for panel *}
              {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                <a href="{$item->getExtra('btn-link')}" class="btn btn-semi-ghost-secondary btn-xs">
                  {$item->getExtra('btn-text')}
                  {if $item->getExtra('btn-icon')}
                    {if $item->getExtra('btn-icon') == 'fas fa-arrow-right'}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right rtl-rotate">
                        <path d="M5 12h14" />
                        <path d="m12 5 7 7-7 7" />
                      </svg>
                    {elseif $item->getExtra('btn-icon') == 'fas fa-plus'}
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                        <path d="M5 12h14" />
                        <path d="M12 5v14" />
                      </svg>
                    {/if}
                  {/if}
                </a>
              {/if}
            </div>
          </div>
          {* Panel body content *}
          {if $item->hasBodyHtml()}
            <div class="card-body">
              {$item->getBodyHtml()}
            </div>
          {/if}
          {* Panel child items *}
          {if $item->hasChildren()}
            <div class="p-4 d-flex flex-column col-gap-4 {if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
              {foreach $item->getChildren() as $childItem}
                {if $childItem->getUri()}
                  <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="py-2 px-3 rounded-md hover-accent {if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}" {if $childItem->getAttribute('dataToggleTab')} data-toggle="tab" {/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}" {/if} id="{$childItem->getId()}">
                    {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i> {/if}
                    {$childItem->getLabel()}
                    {if $childItem->hasBadge()} <span class="badge">{$childItem->getBadge()}</span>{/if}
                  </a>
                {else}
                  <div menuItemName="{$childItem->getName()}" class="rounded-md p-3 hover-accent{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                    {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i> {/if}
                    {$childItem->getLabel()}
                    {if $childItem->hasBadge()} <span class="badge">{$childItem->getBadge()}</span>{/if}
                  </div>
                {/if}
              {/foreach}
            </div>
          {/if}
          {* Panel footer content *}
          {if $item->hasFooterHtml()}
            <div class="card-footer">
              {$item->getFooterHtml()}
            </div>
          {/if}
        </div>
      {/function}

      {* Render full-width panels with colspan *}
      {foreach $panels as $item}
        {if $item->getExtra('colspan')}
          {outputHomePanels}
          {assign "panels" $panels->removeChild($item->getName())}
        {/if}
      {/foreach}
    </div>
    {* Left column for odd-indexed panels *}
    <div class="col-md-6 col-lg-12 col-xl-6 d-flex flex-column row-gap-4">
      {foreach $panels as $item}
        {if $item@iteration is odd}
          {outputHomePanels}
        {/if}
      {/foreach}
    </div>
    {* Right column for even-indexed panels *}
    <div class="col-md-6 col-lg-12 col-xl-6 d-flex flex-column row-gap-4">
      {foreach $panels as $item}
        {if $item@iteration is even}
          {outputHomePanels}
        {/if}
      {/foreach}
    </div>
  </div>
</div>