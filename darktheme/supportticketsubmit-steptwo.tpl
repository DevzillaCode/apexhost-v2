{* Support ticket submission form - uses multipart/form-data for file uploads *}
<form method="post" action="{$smarty.server.PHP_SELF}?step=3" enctype="multipart/form-data" role="form">

  {* Support ticket submission form *}
  <div class="card extra-padding">
    {* Card body *}
    <div class="card-body">

      <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>

      {* Display error message if exists *}
      {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
      {/if}

      <div class="d-flex flex-column row-gap-4">

        {* Name and Email fields - disabled if user is logged in *}
        <div class="row row-gap-4">
          <div class="form-group col-md-6">
            <label class="form-label" for="inputName">{lang key='supportticketsclientname'}</label>
            <input type="text" name="name" id="inputName" value="{$name}" class="form-control{if $loggedin} disabled{/if}" {if $loggedin} disabled="disabled" {/if} />
          </div>
          <div class="form-group col-md-6">
            <label class="form-label" for="inputEmail">{lang key='supportticketsclientemail'}</label>
            <input type="email" name="email" id="inputEmail" value="{$email}" class="form-control{if $loggedin} disabled{/if}" {if $loggedin} disabled="disabled" {/if} />
          </div>
        </div>

        {* Ticket Subject *}
        <div class="row row-gap-4">
          <div class="form-group col-md-12">
            <label class="form-label" for="inputSubject">{lang key='supportticketsticketsubject'}</label>
            <input type="text" name="subject" id="inputSubject" value="{$subject}" class="form-control" />
          </div>
        </div>

        {* Department, Related Service and Priority selection *}
        <div class="row row-gap-4">
          <div class="form-group col-md-4">
            <label class="form-label" for="inputDepartment">{lang key='supportticketsdepartment'}</label>
            <select name="deptid" id="inputDepartment" class="form-control" onchange="refreshCustomFields(this)">
              {foreach $departments as $department}
                <option value="{$department.id}" {if $department.id eq $deptid} selected="selected" {/if}>
                  {$department.name}
                </option>
              {/foreach}
            </select>
          </div>

          {* Related Service dropdown - only shown if services exist *}
          {if $relatedservices}
            <div class="form-group col-md-4">
              <label class="form-label" for="inputRelatedService">{lang key='relatedservice'}</label>
              <select name="relatedservice" id="inputRelatedService" class="form-control">
                <option value="">{lang key='none'}</option>
                {foreach $relatedservices as $relatedservice}
                  <option value="{$relatedservice.id}" {if $relatedservice.id eq $selectedservice} selected="selected" {/if}>
                    {$relatedservice.name} ({$relatedservice.status})
                  </option>
                {/foreach}
              </select>
            </div>
          {/if}

          {* Priority selection *}
          <div class="form-group col-md-4">
            <label class="form-label" for="inputPriority">{lang key='supportticketspriority'}</label>
            <select name="urgency" id="inputPriority" class="form-control">
              <option value="High" {if $urgency eq "High"} selected="selected" {/if}>
                {lang key='supportticketsticketurgencyhigh'}
              </option>
              <option value="Medium" {if $urgency eq "Medium" || !$urgency} selected="selected" {/if}>
                {lang key='supportticketsticketurgencymedium'}
              </option>
              <option value="Low" {if $urgency eq "Low"} selected="selected" {/if}>
                {lang key='supportticketsticketurgencylow'}
              </option>
            </select>
          </div>
        </div>

        {* Message textarea with markdown editor *}
        <div class="form-group">
          <label class="form-label" for="inputMessage">{lang key='contactmessage'}</label>
          <textarea name="message" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_open">{$message}</textarea>
        </div>

        {* File attachments section with dynamic field addition *}
        <div class="form-group d-flex flex-column row-gap-2">
          <label class="form-label" for="inputAttachments">{lang key='supportticketsticketattachments'}</label>
          <div class="input-group mb-1 attachment-group">
            <input type="file" class="form-control form-control-md" name="attachments[]" id="inputAttachment1">
            <div class="input-group-append">
              <button class="btn btn-light" type="button" id="btnTicketAttachmentsAdd">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                  <path d="M5 12h14" />
                  <path d="M12 5v14" />
                </svg>
                {lang key='addmore'}
              </button>
            </div>
          </div>
          {* Template for additional file upload fields *}
          <div class="file-upload w-hidden">
            <div class="input-group mb-1 attachment-group">
              <input type="file" class="form-control form-control-md" name="attachments[]">
            </div>
          </div>
          <div id="fileUploadsContainer"></div>
          <div class="text-muted">
            <small>{lang key='supportticketsallowedextensions'}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</small>
          </div>
        </div>

        {* Container for custom fields - loaded dynamically *}
        <div id="customFieldsContainer">
          {include file="$template/supportticketsubmit-customfields.tpl"}
        </div>

        {* Hidden container for auto-answer suggestions *}
        <div id="autoAnswerSuggestions" class="w-hidden"></div>

        {* CAPTCHA section *}
        <div class="text-center">
          {include file="$template/includes/captcha.tpl"}
        </div>

        {* Form buttons *}
        <div class="card-footer d-flex justify-content-end col-gap-2">
          <a href="supporttickets.php" class="btn btn-ghost-light btn-wide">{lang key='cancel'}</a>
          <button type="submit" id="openTicketSubmit" class="btn btn-primary btn-wide disable-on-click{$captcha->getButtonClass($captchaForm)}">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-send-horizontal-icon lucide-send-horizontal">
              <path d="M3.714 3.048a.498.498 0 0 0-.683.627l2.843 7.627a2 2 0 0 1 0 1.396l-2.842 7.627a.498.498 0 0 0 .682.627l18-8.5a.5.5 0 0 0 0-.904z" />
              <path d="M6 12h16" />
            </svg>
            {lang key='supportticketsticketsubmit'}
          </button>
        </div>
      </div>

    </div>
  </div>

</form>

{* Load KB suggestions if available *}
{if $kbsuggestions}
  <script>
    jQuery(document).ready(function() {
      getTicketSuggestions();
    });
  </script>
{/if}