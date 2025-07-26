{*
  Sidebar Categories Selector Template
  This template renders a mobile-friendly dropdown selector for sidebar categories.
  It is used for panels with the 'mobileSelect' extra attribute.
*}
{if $panel}
  {* Panel heading with title, icon, and badge *}
  <div class="panel-heading">
    <h3 class="panel-title d-flex align-items-center justify-content-between">
      {* Panel header text: icon, label, and badge *}
      <div class="panel-header-text d-flex align-items-center" data-gap-x="10px">
        {if $panel->hasIcon()}
          {* Display panel icon if available *}
          <i class="{$panel->getIcon()|replace:'fas':'fad'}"></i>
        {/if}
        {* Panel label *}
        <span class="panel-header-label">
          {$panel->getLabel()}
        </span>
        {if $panel->hasBadge()}
          {* Display badge if available *}
          <span class="badge">{$panel->getBadge()}</span>
        {/if}
      </div>
    </h3>
  </div>

  {* Panel body containing the category selector dropdown *}
  <div class="panel-body card-body">
    <form role="form">
      {* Dropdown select for child categories *}
      <select class="form-control" onchange="selectChangeNavigate(this)">
        {assign var='hasCurrent' value=false}
        {foreach $panel->getChildren() as $child}
          {* Each child becomes an option in the dropdown *}
          <option menuItemName="{$child->getName()}" value="{$child->getUri()}" {if $child->isCurrent()}selected="selected" {/if}>
            {$child->getLabel()}
            {if $child->hasBadge()}
              ({$child->getBadge()})
            {/if}
          </option>
          {* Track if any child is currently selected *}
          {if !$hasCurrent and $child->isCurrent()}
            {assign var='hasCurrent' value=true}
          {/if}
        {/foreach}
        {* If no child is currently selected, show a default option *}
        {if !$hasCurrent}
          <option value="" class="list-group-item" selected="" selected>- {lang key="cartchooseanothercategory"} -</option>
        {/if}
      </select>
    </form>
  </div>

  {* Optional panel footer content *}
  {if $panel->hasFooterHtml()}
    <div class="panel-footer card-footer">
      {$panel->getFooterHtml()}
    </div>
  {/if}
{/if}