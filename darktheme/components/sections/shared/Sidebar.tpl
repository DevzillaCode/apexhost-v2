{foreach $sidebar as $item}
  {* Panel container: Each panel represents a sidebar section *}
  <div menuItemName="{$item->getName()}" class="panel theme-sidebar-panel mb-4 toggler-sidebar-panel{if $item->getClass()} {$item->getClass()}{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} d-none d-md-block{/if}" {if $item->getAttribute('id')} id="{$item->getAttribute('id')}" {/if}>

    {* Panel heading with title, icon, and badge *}
    <div class="panel-heading">
      <h3 class="panel-title d-flex align-items-center justify-content-between mb-0">
        <div class="panel-header-text d-flex align-items-center gap-3">
          {if $item->hasIcon()}
            <i class="{$item->getIcon()|replace:'fas':'fad'} text-size-sm"></i>
          {/if}
          <span class="panel-header-label text-size-sm color-foreground">
            {$item->getLabel()}
          </span>
          {if $item->hasBadge()}
            <span class="badge">{$item->getBadge()}</span>
          {/if}
        </div>
        <i class="fad fa-chevron-up card-minimise panel-minimise pull-right float-right text-size-sm"></i>
      </h3>
    </div>

    {if $item->hasBodyHtml()}
      {* Optional panel body content *}
      <div class="panel-body collapsable-card-body">
        <div class="theme-sidebar-list" role="navigation">
          {$item->getBodyHtml()}
        </div>
      </div>
    {/if}

    {if $item->hasChildren()}
      {* List of child links or items for this panel *}
      <div class="panel-body">
        <div class="theme-sidebar-list{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}" role="navigation">
          {foreach $item->getChildren() as $childItem}
            {if $childItem->getUri()}
              {* Sidebar link item *}
              <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="sidebar-list-item {if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}" {if $childItem->getAttribute('dataToggleTab')} data-toggle="list" {/if} {assign "customActionData" $childItem->getAttribute('dataCustomAction')} {if is_array($customActionData)} data-active="{$customActionData['active']}" data-identifier="{$customActionData['identifier']}" data-serviceid="{$customActionData['serviceid']}" {/if} {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}" {/if} id="{$childItem->getId()}">
                {if $childItem->hasIcon()}
                  {if is_array($customActionData)}
                    <span class="loading" style="display: none;">
                      <i class="fad fa-spinner fa-spin fa-fw"></i>
                    </span>
                  {/if}
                  <i class="{$childItem->getIcon()|replace:'fas':'fad'}"></i>&nbsp;
                {/if}
                {$childItem->getLabel()}
                {if $childItem->hasBadge()}
                  &nbsp;<span class="badge">{$childItem->getBadge()}</span>
                {/if}
              </a>
            {else}
              {* Sidebar non-link item *}
              <div menuItemName="{$childItem->getName()}" class="sidebar-list-item no-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}{if $childItem->isCurrent()}active{/if}">
                {if $childItem->hasIcon()}
                  <i class="{$childItem->getIcon()|replace:'fas':'fad'}"></i>&nbsp;
                {/if}
                {$childItem->getLabel()}
                {if $childItem->hasBadge()}
                  &nbsp;<span class="badge">{$childItem->getBadge()}</span>
                {/if}
              </div>
            {/if}
          {/foreach}
        </div>
      </div>
    {/if}

    {if $item->hasFooterHtml()}
      <div class="panel-footer card-footer clearfix">
        {$item->getFooterHtml()}
      </div>
    {/if}
  </div>
  {if $item->getExtra('mobileSelect') and $item->hasChildren()}
    {* Mobile Select only supports dropdown menus *}
    <div class="panel theme-sidebar-panel hidden-lg hidden-md d-md-none mb-3" {if $item->getAttribute('id')} id="{$item->getAttribute('id')}" {/if}>
      {* Panel heading with title, icon, and badge *}
      <div class="panel-heading">
        <h3 class="panel-title d-flex align-items-center justify-content-between">
          {* Panel header text: icon, label, and badge *}
          <div class="panel-header-text d-flex align-items-center" data-gap-x="10px">
            {if $item->hasIcon()}
              {* Display panel icon if available *}
              <i class="{$item->getIcon()|replace:'fas':'fad'}"></i>
            {/if}
            {* Panel label *}
            <span class="panel-header-label">
              {$item->getLabel()}
            </span>
            {if $item->hasBadge()}
              {* Display badge if available *}
              <span class="badge">{$item->getBadge()}</span>
            {/if}
          </div>
        </h3>
      </div>

      <div class="panel-body">
        <form role="form">
          <select class="theme-select" onchange="selectChangeNavigate(this)">
            {foreach $item->getChildren() as $childItem}
              <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" {if $childItem->isCurrent()}selected="selected" {/if}>
                {$childItem->getLabel()}
                {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
              </option>
            {/foreach}
          </select>
        </form>
      </div>
      {if $item->hasFooterHtml()}
        <div class="panel-footer card-footer">
          {$item->getFooterHtml()}
        </div>
      {/if}
    </div>
  {/if}
{/foreach}