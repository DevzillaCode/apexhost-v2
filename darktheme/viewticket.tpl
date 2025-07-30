{if $invalidTicketId}
  {include file="$template/includes/alert.tpl" type="danger" title="{lang key='thereisaproblem'}" message="{lang key='supportticketinvalid'}"}
{else}
  {if $closedticket}
    {include file="$template/includes/alert.tpl" type="warning" message="{lang key='supportticketclosedmsg'}"}
  {/if}
  {if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage message="Debug: Error Message"}
  {/if}
{/if}

{if !$invalidTicketId}
  {* card *}
  <div class="card extra-padding mb-4">
    {* card header *}
    <div class="card-header">
      {* row *}
      <div class="row">
        {* col *}
        <div class="col-lg-8">
          <h3 class="card-title mb-2">{lang key='supportticketsviewticket'} #{$tid}</h3>
          <p>
            {lang key='supportticketssubject'}:
            <strong>{$subject}</strong>
          </p>
        </div>
        {* col *}
        <div class="col-lg-4">
          <div class="actions d-flex align-items-center justify-content-end col-gap-2">
            <button id="ticketReply" type="button" class="btn btn-semi-ghost-info btn-xs" onclick="smoothScroll('#ticketReplyContainer')">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-reply-icon lucide-reply">
                <path d="M20 18v-2a4 4 0 0 0-4-4H4" />
                <path d="m9 17-5-5 5-5" />
              </svg>
              {lang key='supportticketsreply'}
            </button>
            {if $showCloseButton}
              {if $closedticket}
                <button class="btn btn-semi-ghostdanger btn-xs" disabled="disabled">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
                    <path d="M18 6 6 18" />
                    <path d="m6 6 12 12" />
                  </svg>
                  {lang key='supportticketsstatusclosed'}
                </button>
              {else}
                <button class="btn btn-semi-ghost-danger btn-xs" onclick="window.location='?tid={$tid}&amp;c={$c}&amp;closeticket=true'">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
                    <path d="M18 6 6 18" />
                    <path d="m6 6 12 12" />
                  </svg>
                  {lang key='supportticketsclose'}
                </button>
              {/if}
            {/if}
          </div>
        </div>
      </div>
    </div>
    {* card-body *}
    <div class="card-body d-flex flex-column row-gap-4">
      {foreach $descreplies as $reply}
        <div class="ticket-reply{if $reply.admin} staff{/if}">
          {* posted-by *}
          <div class="posted-by">
            {lang key="support.postedBy" name="<span class=\"posted-by-name font-weight-bold\">{$reply.requestor.name}</span>" date="<span class=\"posted-on font-weight-bold\">{$reply.date}</span>" requestorType="<span class=\"label requestor-badge requestor-type-{$reply.requestor.type_normalised} float-md-right\">{lang key='support.requestor.'|cat:$reply.requestor.type_normalised}</span>"}
          </div>
          {* message *}
          <div class="ticket-message p-4">
            {$reply.message}
            {if $reply.ipaddress}
              <div class="h-divider my-4"></div>
              {lang key='support.ipAddress'}: {$reply.ipaddress}
            {/if}
            {if $reply.id && $reply.admin && $ratingenabled}
              <div class="clearfix">
                {if $reply.rating}
                  <div class="rating-done">
                    {for $rating=1 to 5}
                      <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
                    {/for}
                    <div class="rated">{lang key='ticketreatinggiven'}</div>
                  </div>
                {else}
                  <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
                    <span class="star" rate="5"></span>
                    <span class="star" rate="4"></span>
                    <span class="star" rate="3"></span>
                    <span class="star" rate="2"></span>
                    <span class="star" rate="1"></span>
                  </div>
                {/if}
              </div>
            {/if}
          </div>
          {if $reply.attachments}
            <div class="h-divider mx-4"></div>
            <div class="ticket-attachments p-4">
              <h4 class="text-size-base mb-4">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-paperclip-icon lucide-paperclip">
                  <path d="m16 6-8.414 8.586a2 2 0 0 0 2.829 2.829l8.414-8.586a4 4 0 1 0-5.657-5.657l-8.379 8.551a6 6 0 1 0 8.485 8.485l8.379-8.551" />
                </svg>
                {lang key='supportticketsticketattachments'} ({$reply.attachments|count})
              </h4>
              {if $reply.attachments_removed} - {lang key='support.attachmentsRemoved'}{/if}
              <ul class="attachment-list">
                {foreach $reply.attachments as $num => $attachment}
                  <li class="attachment-item">
                    {if $reply.attachments_removed}
                      <span>
                        <figure>
                          <i class="far fa-file-minus"></i>
                        </figure>
                        <div class="caption">
                          {$attachment}
                        </div>
                      </span>
                    {else}
                      <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}" class="item-link">
                        <span>
                          <figure>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-file-icon lucide-file">
                              <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z" />
                              <path d="M14 2v4a2 2 0 0 0 2 2h4" />
                            </svg>
                          </figure>
                          <div class="caption">
                            {$attachment}
                          </div>
                        </span>
                      </a>
                    {/if}
                  </li>
                {/foreach}
              </ul>
            </div>
          {/if}
        </div>
      {/foreach}
    </div>
  </div>
  {* card *}
  <div class="card extra-padding d-print-none" id="ticketReplyContainer">
    <div class="card-body">
      {* card-title *}
      <h3 class="card-title mb-4">{lang key='supportticketsreply'}</h3>
      {* form *}
      <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
        {* row *}
        <div class="row row-gap-4 mb-4">
          <div class="form-group col-md-6">
            <label for="inputName" class="form-label">{lang key='supportticketsclientname'}</label>
            <input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}" {if $loggedin} disabled="disabled" {/if}>
          </div>
          <div class="form-group col-md-6">
            <label for="inputEmail" class="form-label">{lang key='supportticketsclientemail'}</label>
            <input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}" {if $loggedin} disabled="disabled" {/if}>
          </div>
        </div>
        {* message *}
        <div class="form-group mb-4">
          <label for="inputMessage" class="form-label">{lang key='contactmessage'}</label>
          <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
        </div>

        {* attachments *}
        <div class="form-group mb-8">
          <label for="inputAttachments" class="form-label">{lang key='supportticketsticketattachments'}</label>
          <div class="input-group mb-1 attachment-group">
            <input type="file" class="form-control form-control-md" name="attachments[]" id="inputAttachment1">
            <div class="input-group-append">
              <button class="btn btn-light" type="button" id="btnTicketAttachmentsAdd">
                <i class="fas fa-plus"></i>
                {lang key='addmore'}
              </button>
            </div>
          </div>
          <div class="file-upload w-hidden">
            <div class="input-group mb-1 attachment-group">
              <div class="custom-file">
                <label class="custom-file-label text-truncate">
                  {lang key='chooseFile'}
                </label>
                <input type="file" class="custom-file-input" name="attachments[]">
              </div>
            </div>
          </div>
          <div id="fileUploadsContainer"></div>
          <div class="text-muted">
            <small>{lang key='supportticketsallowedextensions'}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</small>
          </div>
        </div>

        <div class="card-footer d-flex justify-content-end col-gap-2">
          <input class="btn btn-ghost-light btn-wide" type="reset" value="{lang key='cancel'}" onclick="jQuery('#ticketReply').click()" />
          <button class="btn btn-primary btn-wide" type="submit" name="save"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-send-horizontal-icon lucide-send-horizontal">
              <path d="M3.714 3.048a.498.498 0 0 0-.683.627l2.843 7.627a2 2 0 0 1 0 1.396l-2.842 7.627a.498.498 0 0 0 .682.627l18-8.5a.5.5 0 0 0 0-.904z" />
              <path d="M6 12h16" />
            </svg>{lang key='supportticketsticketsubmit'}</button>
        </div>
      </form>

    </div>
  </div>
{/if}