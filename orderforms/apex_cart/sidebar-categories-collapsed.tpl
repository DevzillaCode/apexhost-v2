{*
  Collapsed Sidebar Categories Template
  This template renders the collapsed (mobile/small screen) version of the sidebar categories.
  It loops through each panel in $secondarySidebar and includes the selector template for each.
  If the user is not logged in and multiple currencies are available, it shows a currency switcher.
*}
<div class="sidebar-collapsed">

  {* Loop through each sidebar panel and render its collapsed selector *}
  {foreach $secondarySidebar as $panel}
    <div class="panel theme-sidebar-panel mb-3">
      {* Include the sidebar categories selector for this panel *}
      {include file="orderforms/apex_cart/sidebar-categories-selector.tpl"}
    </div>
  {/foreach}

  {* Show currency selector if user is not logged in and currencies are available *}
  {if !$loggedin && $currencies}
    <div class="pull-right form-inline float-right mb-3">
      <form method="post" action="{$WEB_ROOT}/cart.php{if $action}?a={$action}{if $domain}&domain={$domain}{/if}{elseif $gid}?gid={$gid}{/if}">
        <select name="currency" onchange="submit()" class="form-control">
          <option value="">{$LANG.choosecurrency}</option>
          {foreach from=$currencies item=listcurr}
            <option value="{$listcurr.id}" {if $listcurr.id == $activeCurrency.id} selected{/if}>{$listcurr.code}</option>
          {/foreach}
        </select>
      </form>
    </div>
  {/if}

</div>