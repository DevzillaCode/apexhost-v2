{if $errormessage}
  <div class="alert alert-danger">
    {$errormessage}
  </div>
{elseif !$productGroup}
  <div class="alert alert-info">
    {lang key='orderForm.selectCategory'}
  </div>
{/if}