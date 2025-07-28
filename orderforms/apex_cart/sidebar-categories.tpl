{* SVG icon variables *}
{assign var="svgSocialBee" value='<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="m8 2l1.88 1.88m4.24 0L16 2M9 7V6a3 3 0 1 1 6 0v1M5 7a3 3 0 1 0 2.2 5.1C9.1 10 12 7 12 7s2.9 3 4.8 5.1A3 3 0 1 0 19 7Zm2.56 5h8.87M7.5 17h9"/><path d="M15.5 10.7c.9.9 1.4 2.1 1.5 3.3c0 5.8-5 8-5 8s-5-2.2-5-8c.1-1.2.6-2.4 1.5-3.3"/></g></svg>'}
{assign var="svgSSLCertificates" value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shield-check-icon lucide-shield-check"><path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z"/><path d="m9 12 2 2 4-4"/></svg>'}
{assign var="svgEmailServices" value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-at-sign-icon lucide-at-sign"><circle cx="12" cy="12" r="4"/><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-4 8"/></svg>'}
{assign var="svgSharedHosting" value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-share2-icon lucide-share-2"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" x2="15.42" y1="13.51" y2="17.49"/><line x1="15.41" x2="8.59" y1="6.51" y2="10.49"/></svg>'}


{* Map labels to SVG variables for easy lookup *}
{assign var="svgIcons" value=[
  'SocialBee' => $svgSocialBee,
  'SSL Certificates' => $svgSSLCertificates,
  'E-mail Services' => $svgEmailServices,
  'Shared Hosting' => $svgSharedHosting
]}

{foreach $secondarySidebar as $panel}
  {* Panel container: Each panel represents a sidebar section *}
  <div menuItemName="{$panel->getName()}" class="panel theme-sidebar-panel mb-4 toggler-sidebar-panel {if $panel->getClass()}{$panel->getClass()}{else}panel-sidebar{/if}{if $panel->getExtra('mobileSelect') and $panel->hasChildren()} hidden-sm hidden-xs d-none d-md-block{/if}" {if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}" {/if}>
    {* Panel heading with title, icon, and badge *}
    <div class="panel-heading">
      <h3 class="panel-title d-flex align-items-center justify-content-between mb-0">
        <div class="panel-header-text d-flex align-items-center" data-gap-x="10px">
          {if $panel->hasIcon()}
            <i class="{$panel->getIcon()|replace:'fas':'fad'} text-size-sm"></i>
          {/if}
          <span class="panel-header-label text-size-sm color-foreground">
            {$panel->getLabel()}
          </span>
          {if $panel->hasBadge()}
            <span class="badge">{$panel->getBadge()}</span>
          {/if}
        </div>
        <i class="fad fa-chevron-up card-minimise panel-minimise pull-right float-right text-size-sm"></i>
      </h3>
    </div>

    {if $panel->hasBodyHtml()}
      {* Optional panel body content *}
      <div class="panel-body card-body collapsable-card-body">
        {$panel->getBodyHtml()}
      </div>
    {/if}

    {if $panel->hasChildren()}
      {* List of child links or items for this panel *}
      <div class="panel-body">
        <div class="theme-sidebar-list{if $panel->getChildrenAttribute('class')} {$panel->getChildrenAttribute('class')}{/if}">
          {foreach $panel->getChildren() as $child}
            {if $child->getUri()}
              {* Sidebar link item *}
              <a menuItemName="{$child->getName()}" href="{$child->getUri()}" class="sidebar-list-item d-flex align-items-center {if $child->isDisabled()} disabled{/if}{if $child->getClass()} {$child->getClass()}{/if}{if $child->isCurrent()} active{/if}" {if $child->getAttribute('dataToggleTab')} data-toggle="tab" {/if}{if $child->getAttribute('target')} target="{$child->getAttribute('target')}" {/if} id="{$child->getId()}" data-gap-x="8px">
                {* SVG output: if label matches, show SVG; else, fallback to icon or placeholder *}
                {if isset($svgIcons[$child->getLabel()])}
                  {$svgIcons[$child->getLabel()] nofilter}
                {elseif $child->hasIcon()}
                  <i class="{$child->getIcon()|replace:'fas':'fad'}"></i>&nbsp;
                {else}
                  {$svgPlaceHolder}
                {/if}
                {* Display the label and optional badge *}
                {$child->getLabel()}
                {if $child->hasBadge()}
                  &nbsp;<span class="badge">{$child->getBadge()}</span>
                {/if}
              </a>
            {else}
              {* Sidebar non-link item *}
              <div menuItemName="{$child->getName()}" class="list-group-item{if $child->getClass()} {$child->getClass()}{/if}" id="{$child->getId()}">
                {if $child->hasIcon()}
                  <i class="{$child->getIcon()|replace:'fas':'fad'}"></i>&nbsp;
                {/if}
                {$child->getLabel()}
                {if $child->hasBadge()}
                  &nbsp;<span class="badge">{$child->getBadge()}</span>
                {/if}
              </div>
            {/if}
          {/foreach}
        </div>
      </div>
    {/if}

    {if $panel->hasFooterHtml()}
      {* Optional panel footer content *}
      <div class="panel-footer clearfix">
        {$panel->getFooterHtml()}
      </div>
    {/if}
  </div>

  {if $panel->getExtra('mobileSelect') and $panel->hasChildren()}
    {* Mobile dropdown version of the panel for small screens *}
    <div class="panel hidden-lg hidden-md d-md-none{if $panel->getClass()}{$panel->getClass()}{else} panel-default{/if}" {if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}" {/if}>
      {include file="orderforms/apex_cart/sidebar-categories-selector.tpl"}
    </div>
  {/if}
{/foreach}