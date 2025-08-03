{* this is comment *}
{include file="orderforms/apex_cart/common.tpl"}

<div id="order-apex_cart">

  <div class="row">
    <div class="cart-sidebar">

      {include file="orderforms/apex_cart/sidebar-categories.tpl"}

    </div>
    <div class="cart-body">

      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareaaddons'}" tagline="{lang key='clientareaaddonstagline'}" }
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {if count($addons) == 0}
        <div id="noAddons" class="alert alert-warning text-center" role="alert">
          <div>{$LANG.cartproductaddonsnone}</div>
        </div>
        <div class="page-footer">
          <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-semi-ghost-secondary btn-wide">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
              <path d="m12 19-7-7 7-7" />
              <path d="M19 12H5" />
            </svg>
            {$LANG.orderForm.returnToClientArea}
          </a>
        </div>
      {/if}

      <div class="products">
        <div class="row row-eq-height row-gap-8">
          {foreach $addons as $num => $addon}
            <div class="col-md-6">
              <div class="product clearfix h-100" id="product{$num}">
                <form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="form-inline">
                  <input type="hidden" name="aid" value="{$addon.id}" />
                  <header class="w-100 mb-4">
                    <span>{$addon.name}</span>
                  </header>
                  <div class="product-desc">
                    <p class="mb-4">{$addon.description|nl2br}</p>
                    <div class="form-group w-100">
                      <select name="productid" id="inputProductId{$num}" class="form-control w-100">
                        {foreach $addon.productids as $product}
                          <option value="{$product.id}">
                            {$product.product}{if $product.domain} - {$product.domain}{/if}
                          </option>
                        {/foreach}
                      </select>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <footer class="text-right">
                    <div class="product-pricing">
                      {if $addon.free}
                        {$LANG.orderfree}
                      {else}
                        <span class="price">{$addon.recurringamount} {$addon.billingcycle}</span>
                        {if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
                      {/if}
                    </div>
                    <button type="submit" class="btn btn-success btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shopping-cart-icon lucide-shopping-cart">
                        <circle cx="8" cy="21" r="1" />
                        <circle cx="19" cy="21" r="1" />
                        <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12" />
                      </svg>
                      {$LANG.ordernowbutton}
                    </button>
                  </footer>
                </form>
              </div>
            </div>
          {/foreach}
        </div>
      </div>
    </div>
  </div>
</div>