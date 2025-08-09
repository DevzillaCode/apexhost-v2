{if $errormessage}
  <div class="alert alert-danger">
    <div>
      <p class="alert-message">{$errormessage}</p>
    </div>
  </div>
{elseif !$productGroup}
  <div class="alert alert-info">
    <div>
      <p class="alert-message">{lang key='orderForm.selectCategory'}</p>
    </div>
  </div>
{/if}