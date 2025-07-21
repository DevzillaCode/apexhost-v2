{* Include flash message for success/error alerts *}
{include file="$template/includes/flashmessage.tpl"}

{* Card container for user permissions management *}
<div class="card">
  <div class="card-body">
    {* Card title for permissions management *}
    <h3 class="card-title">{lang key='userManagement.managePermissions'}</h3>
    {* Display user email *}
    <p class="mb-3">{$user->email}</p>
    {* Permissions section title *}
    <p class="title-5 color-foreground font-weight-semibold mb-3">{lang key="userManagement.permissions"}</p>
    {* Form for managing user permissions *}
    <form method="post" action="{routePath('account-users-permissions-save', $user->id)}">
      {* Loop through available permissions *}
      {foreach $permissions as $permission}
        <label class="form-check">
          <input type="checkbox" class="form-check-input" name="perms[{$permission.key}]" value="1" {if $userPermissions->hasPermission($permission.key)} checked{/if}>
          <span class="checkmark"></span>
          {$permission.title}
          <span class="d-none d-md-inline">-</span>
          <br class="d-md-none">
          <span class="text-muted">{$permission.description}</span>
        </label>
        <br>
      {/foreach}
      {* Form action buttons *}
      <div class="d-flex col-gap-2 justify-content-end mt-4">
        {* Cancel button *}
        <a href="{routePath('account-users')}" class="btn btn-ghost-light btn-sm">
          {lang key="cancel"}
        </a>
        {* Save changes button *}
        <button type="submit" class="btn btn-light btn-sm">
          {lang key="clientareasavechanges"}
        </button>
      </div>
    </form>
  </div>
</div>