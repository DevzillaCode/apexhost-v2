{if $loggedin && $innerTemplate}
    {include file="$template/includes/alert.tpl" type="error" message="{lang key='noPasswordResetWhenLoggedIn'}"}
{else}
    {if $successMessage}
        {include file="$template/includes/alert.tpl" type="success" msg=$successTitle}
       <div class="container-fluid py-8">
            <p>{$successMessage}</p>
            <a class="btn btn-primary btn-sm mt-4" href="login.php">{lang key="loginbutton"}</a>
       </div>
    {else}
        {if $innerTemplate}
            {include file="$template/password-reset-$innerTemplate.tpl"}
        {/if}
    {/if}
{/if}