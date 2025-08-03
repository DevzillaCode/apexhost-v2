{if $errormessage}
  <div class="alert alert-danger">
    <div>{$errormessage}</div>
  </div>
{elseif !$productGroup}
  <div class="alert alert-info">
    <div>{lang key='orderForm.selectCategory'}</div>
  </div>
{/if}