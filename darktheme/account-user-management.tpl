{include file="$template/includes/flashmessage.tpl"}

<div class="mb-10">
  <div class="">
    <h3 class="card-title">{lang key="navUserManagement"}</h3>
    <p class="font-weight-medium mb-3">{lang key="userManagement.usersFound" count=$users->count()}</p>
    {* Accounts table *}
    <div class="border rounded-md overflow-hidden mb-10">
      <div class="table-responsive">
        <table class="table">
          <thead class="thead bg-muted">
            <tr>
              <th class="order-head"></th>
              <th class="table-head">{lang key="userManagement.name"}</th>
              <th class="table-head">{lang key="userManagement.emailAddress"}</th>
              <th class="table-head">{lang key="userManagement.role"}</th>
              <th class="table-head">{lang key="userManagement.twoFactorAuth"}</th>
              <th class="table-head">{lang key="userManagement.lastLogin"}</th>
              <th class="table-head" style="width: 320px">{lang key="userManagement.actions"}</th>
            </tr>
          </thead>
          <tbody class="tbody">
            {foreach $users as $user}
              {* table-row *}
              <tr class="table-row">
                {* table-cell -> order *}
                <td class="order-cell text-muted">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
                    <path d="m15 10 5 5-5 5" />
                    <path d="M4 4v7a4 4 0 0 0 4 4h12" />
                  </svg>
                </td>
                {* table-cell -> name *}
                <td class="table-cell">
                  <span class="font-weight-regular">{$user->fullName}</span>
                </td>
                {* table-cell -> email *}
                <td class="table-cell">
                  <span class="font-weight-regular">{$user->email}</span>
                </td>
                {* table-cell -> role *}
                <td class="table-cell">
                  {if $user->pivot->owner}
                    <span class="label label-success">{lang key="clientOwner"}</span>
                  {else}
                    <span class="label label-info">{lang key="userManagement.clientUser"}</span>
                  {/if}
                </td>
                {* table-cell -> auth *}
                <td class="table-cell">
                  {if $user->hasTwoFactorAuthEnabled()}
                    <span class="label label-success" title="{lang key="twoFactor.enabled"}">{lang key="userManagement.twoFactor.enabled"}</span>
                  {else}
                    <span class="label label-default" title={lang key="twoFactor.disabled"}>{lang key="userManagement.twoFactor.disabled"}</span>
                  {/if}
                </td>
                {* table-cell -> last login *}
                <td class="table-cell">
                  <span class="text-muted"><small>
                      {lang key="userManagement.lastLogin"}:
                      {if $user->pivot->hasLastLogin()}
                        {$user->pivot->getLastLogin()->diffForHumans()}
                      {else}
                        {lang key='never'}
                      {/if}
                    </small>
                  </span>
                </td>
                {* table-cell -> actions *}
                <td class="table-cell" style="width: 320px">
                  <a href="{routePath('account-users-permissions', $user->id)}" class="btn btn-ghost-light light btn-xs btn-manage-permissions{if $user->pivot->owner} disabled{/if}">
                    {lang key="userManagement.managePermissions"}
                  </a>
                  <a href="#" class="btn btn-ghost-danger btn-xs btn-remove-user{if $user->pivot->owner} disabled{/if}" data-id="{$user->id}">
                    {lang key="userManagement.removeAccess"}
                  </a>
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
    {* Invites accounts table *}
    {if $invites->count() > 0}
      <p class="font-weight-medium mb-3">{lang key="userManagement.pendingInvites" count=$invites->count()}</p>
      <div class="border rounded-md overflow-hidden mb-3">
        <div class="table-responsive">
          <table class="table">
            <thead class="thead bg-muted">
              <tr>
                <th class="order-head"></th>
                <th class="table-head">{lang key="userManagement.emailAddress"}</th>
                <th class="table-head">{lang key="userManagement.inviteSent"}</th>
                <th class="table-head" style="width: 320px">{lang key="userManagement.actions"}</th>
              </tr>
            </thead>
            <tbody class="tbody">
              {foreach $invites as $invite}
                {* table-row *}
                <tr class="table-row">
                  {* table-cell -> order *}
                  <td class="order-cell text-muted">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
                      <path d="m15 10 5 5-5 5" />
                      <path d="M4 4v7a4 4 0 0 0 4 4h12" />
                    </svg>
                  </td>
                  {* table-cell -> email *}
                  <td class="table-cell">
                    <span class="font-weight-regular">{$invite->email}</span>
                  </td>
                  {* table-cell -> date *}
                  <td class="table-cell">
                    <span class="text-muted">
                      <small>
                        {$invite->created_at->diffForHumans()}
                      </small>
                    </span>
                  </td>
                  {* table-cell -> actions *}
                  <td class="table-cell" style="width: 320px">
                    <form method="post" action="{routePath('account-users-invite-resend')}">
                      <input type="hidden" name="inviteid" value="{$invite->id}">
                      <button type="submit" class="btn btn-ghost-light btn-xs">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-cw-icon lucide-rotate-cw">
                          <path d="M21 12a9 9 0 1 1-9-9c2.52 0 4.93 1 6.74 2.74L21 8" />
                          <path d="M21 3v5h-5" />
                        </svg>
                        {lang key="userManagement.resendInvite"}
                      </button>
                      <button type="button" class="btn btn-ghost-danger btn-xs btn-cancel-invite" data-id="{$invite->id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
                          <path d="M18 6 6 18" />
                          <path d="m6 6 12 12" />
                        </svg>
                        {lang key="userManagement.cancelInvite"}
                      </button>
                    </form>
                  </td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </div>
    {/if}
    <p class="text-muted">* {lang key="userManagement.accountOwnerPermissionsInfo"}</p>
  </div>
</div>

<div class="card">
  <div class="card-body">
    <h3 class="card-title">{lang key="userManagement.inviteNewUser"}</h3>

    <p class="mb-4">{lang key="userManagement.inviteNewUserDescription"}</p>

    <form method="post" action="{routePath('account-users-invite')}">
      <div class="form-group mb-4">
        <input type="email" name="inviteemail" placeholder="name@example.com" class="form-control" value="{$formdata.inviteemail}">
      </div>
      {* form-group *}
      <div class="form-group d-flex col-gap-4 mb-4">
        <label class="form-check">
          <input type="radio" class="form-check-input" name="permissions" value="all" checked="checked">
          <span class="checkmark"></span>
          {lang key="userManagement.allPermissions"}
        </label>
        <label class="form-check">
          <input type="radio" class="form-check-input" name="permissions" value="choose">
          <span class="checkmark"></span>
          {lang key="userManagement.choosePermissions"}
        </label>
      </div>
      <div class="well mb-4 w-hidden" id="invitePermissions">
        {foreach $permissions as $permission}
          <label class="form-check mb-2">
            <input type="checkbox" class="form-check-input" name="perms[{$permission.key}]" value="1">
            <span class="checkmark"></span>
            {$permission.title}
            <span class="d-none d-md-inline">-</span>
            <br class="d-md-none">
            <span class="text-muted">{$permission.description}</span>
          </label>
          <br>
        {/foreach}
      </div>
      <button type="submit" class="btn btn-light btn-sm btn-wide ">
        {lang key="userManagement.sendInvite"}
      </button>
    </form>

  </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
  <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<form method="post" action="{routePath('account-users-remove')}">
  <input type="hidden" name="userid" id="inputRemoveUserId">
  <div class="modal fade" id="modalRemoveUser">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">
            {lang key="userManagement.removeAccess"}
          </h4>
          <button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
              <path d="M18 6 6 18" />
              <path d="m6 6 12 12" />
            </svg>
          </button>
        </div>
        <div class="modal-body">
          <p>{lang key="userManagement.removeAccessSure"}</p>
          <p>{lang key="userManagement.removeAccessInfo"}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
            {lang key="cancel"}
          </button>
          <button type="submit" class="btn btn-danger btn-xs btn-wide" id="btnRemoveUserConfirm">
            {lang key="confirm"}
          </button>
        </div>
      </div>
    </div>
  </div>
</form>

<form method="post" action="{routePath('account-users-invite-cancel')}">
  <input type="hidden" name="inviteid" id="inputCancelInviteId">
  <div class="modal fade" id="modalCancelInvite">
    <div class="modal-dialog">
      <div class="modal-content">
        {* modal-header *}
        <div class="modal-header">
          <h4 class="modal-title">
            {lang key="userManagement.cancelInvite"}
          </h4>
          <button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
              <path d="M18 6 6 18" />
              <path d="m6 6 12 12" />
            </svg>
          </button>
        </div>
        {* modal-body *}
        <div class="modal-body">
          <p>{lang key="userManagement.cancelInviteSure"}</p>
          <p>{lang key="userManagement.cancelInviteInfo"}</p>
        </div>
        {* modal-footer *}
        <div class="modal-footer">
          <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
            {lang key="cancel"}
          </button>
          <button type="submit" class="btn btn-light btn-xs btn-wide" id="btnCancelInviteConfirm">
            {lang key="confirm"}
          </button>
        </div>
      </div>
    </div>
  </div>
</form>

<script>
  jQuery(document).ready(function() {
    jQuery('input:radio[name=permissions]').change(function() {
      if (this.value === 'choose') {
        jQuery('#invitePermissions').slideDown();
      } else {
        jQuery('#invitePermissions').slideUp();
      }
    });
    jQuery('.btn-manage-permissions').click(function(e) {
      if (jQuery(this).attr('disabled')) {
        e.preventDefault();
      }
    });
    jQuery('.btn-remove-user').click(function(e) {
      e.preventDefault();
      if (jQuery(this).attr('disabled')) {
        return;
      }
      jQuery('#inputRemoveUserId').val(jQuery(this).data('id'));
      jQuery('#modalRemoveUser').modal('show');
    });
    jQuery('.btn-cancel-invite').click(function(e) {
      e.preventDefault();
      jQuery('#inputCancelInviteId').val(jQuery(this).data('id'));
      jQuery('#modalCancelInvite').modal('show');
    });
  });
</script>