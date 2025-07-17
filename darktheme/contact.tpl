{* Contact page template for user inquiries *}
{* Define path for template images *}
{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}

{* Main contact page container *}
<div class="contact-page">
  {* Page sections container *}
  <div class="page-sections">
    {* Left section with page title and navigation *}
    <div class="left-section">
      {* Content area *}
      <div class="content text-md-left text-center">
        <h1 class="title-2 color-foreground font-weight-semibold mb-2">{lang key='contact.title'}</h1>
        <p class="text-size-base">{lang key='contact.description'}</p>
        {* Navigation links *}
        <div class="float-links">
          <div class="d-flex align-items-center justify-content-md-start justify-content-center flex-wrap">
            <a href="{$WEB_ROOT}" class="theme-link mx-3">{lang key='clientareanavhome'}</a>
            <a href="{$WEB_ROOT}/knowledgebase.php" class="theme-link mx-3">{lang key='knowledgebase'}</a>
            <a href="{$WEB_ROOT}/announcements.php" class="theme-link mx-3">{lang key='announcements'}</a>
            <a href="{$WEB_ROOT}/contact.php" class="theme-link mx-3">{lang key='contact'}</a>
          </div>
        </div>
      </div>
    </div>
    {* Right section with contact form *}
    <div class="right-section">
      {* Content area *}
      <div class="content">
        {* Show success message after form submission *}
        {if $sent}
          {include file="$template/includes/alert.tpl" type="success" msg="{lang key='contact.success'}" textcenter=true}
        {/if}
        {* Show error message if form submission fails *}
        {if $errormessage}
          {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
        {* Contact form *}
        {if !$sent}
          <form method="post" action="contact.php" role="form">
            <input type="hidden" name="action" value="send" />
            {* Form body *}
            <div class="form-body">
              {* Full Name Input *}
              <div class="form-group">
                <label for="inputName" class="col-form-label">{lang key='contact.clientName'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-round-icon lucide-user-round">
                      <circle cx="12" cy="8" r="5" />
                      <path d="M20 21a8 8 0 0 0-16 0" />
                    </svg>
                  </div>
                  <input type="text" name="name" id="inputName" class="form-control" value="{$name}" placeholder="{lang key='contact.clientNamePlaceholder'}" autofocus autocomplete="off">
                </div>
              </div>
              {* Email Input *}
              <div class="form-group">
                <label for="inputEmail" class="col-form-label">{lang key='contact.clientEmail'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                      <path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7" />
                      <rect x="2" y="4" width="20" height="16" rx="2" />
                    </svg>
                  </div>
                  <input type="email" name="email" id="inputEmail" class="form-control" value="{$email}" placeholder="{lang key='contact.clientEmailPlaceholder'}" autocomplete="off">
                </div>
              </div>
              {* Subject Input *}
              <div class="form-group">
                <label for="inputSubject" class="col-form-label">{lang key='contact.subject'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-book-marked-icon lucide-book-marked">
                      <path d="M10 2v8l3-3 3 3V2" />
                      <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H19a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20" />
                    </svg>
                  </div>
                  <input type="text" name="subject" id="inputSubject" class="form-control" value="{$subject}" placeholder="{lang key='contact.subjectPlaceholder'}" autocomplete="off">
                </div>
              </div>
              {* Message Input *}
              <div class="form-group">
                <label for="inputMessage" class="col-form-label">{lang key='contact.message'}</label>
                <div class="prepend-icon">
                  <div class="form-float-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-message-circle-icon lucide-message-circle">
                      <path d="M7.9 20A9 9 0 1 0 4 16.1L2 22Z" />
                    </svg>
                  </div>
                  <textarea name="message" rows="7" class="form-control" id="inputMessage" placeholder="{lang key='contact.messagePlaceholder'}">{$message}</textarea>
                </div>
              </div>
              {* CAPTCHA if enabled *}
              {if $captcha}
                <div class="text-center margin-bottom">
                  {include file="$template/includes/captcha.tpl"}
                </div>
              {/if}
              {* Submit Button *}
              <div class="form-group mt-6">
                <button type="submit" name="submit" class="btn btn-light btn-block{$captcha->getButtonClass($captchaForm)}">{lang key='contact.send'}</button>
              </div>
            </div>
          </form>
        {/if}
      </div>
    </div>
  </div>
</div>