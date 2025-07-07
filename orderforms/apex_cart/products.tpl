{* Include the common template file for standard cart *}
{include file="orderforms/apex_cart/common.tpl"}

{* Include sidebar toggler *}
{include file="orderforms/apex_cart/includes/sidebar-toggle.tpl"}

{* Main container for the standard cart order form *}
<div id="order-standard_cart">
  {* row *}
  <div class="row cart-row justify-content-end" id="cart-row">
    {* Sidebar section for cart categories *}
    <div class="cart-sidebar sidebar" id="cart-sidebar">
      {* Include the categories sidebar template *}
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>
    {* Main body section for cart products *}
    <div class="cart-body cart-body-expanded" id="cart-body">

      {* Include cart header *}
      {include file="orderforms/apex_cart/includes/standard-cart-header.tpl" headline=$productGroup.headline|default:$productGroup.name tagline=$productGroup.tagline}

      {* Error message *}
      {include file="orderforms/apex_cart/includes/product-errors.tpl"}

      {* Include the collapsed categories template *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* product-cards *}
      <div class="product-cards">
        {* row *}
        <div class="row" data-gap-y="30px">
          {* Include the product cards template *}
          {include file="orderforms/apex_cart/includes/cards/standard-card.tpl"}
        </div>
        {* product-features *}
        {include file="orderforms/apex_cart/includes/product-features.tpl"}
      </div>

    </div>
  </div>
</div>

{* Include the recommendations modal template *}
{include file="orderforms/apex_cart/recommendations-modal.tpl"}