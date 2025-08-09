<div class="alert-container">
  <div class="alert alert-float alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $additionalClasses} {$additionalClasses}{/if}{if $hide} w-hidden{/if}" {if $idname} id="{$idname}" {/if}>
    <div>
      {* alert-icon *}
      <div class="alert-icon">
        {if isset($type) && $type == "error"}
          {* Error Icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ban-icon lucide-ban">
            <path d="M4.929 4.929 19.07 19.071" />
            <circle cx="12" cy="12" r="10" />
          </svg>
        {elseif isset($type) && $type == "danger"}
          {* Danger Icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-triangle-alert-icon lucide-triangle-alert">
            <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3" />
            <path d="M12 9v4" />
            <path d="M12 17h.01" />
          </svg>
        {elseif isset($type) && $type == "success"}
          {* Success Icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
            <circle cx="12" cy="12" r="10" />
            <path d="m9 12 2 2 4-4" />
          </svg>
        {elseif isset($type) && $type == "info"}
          {* Info Icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-megaphone-icon lucide-megaphone">
            <path d="M11 6a13 13 0 0 0 8.4-2.8A1 1 0 0 1 21 4v12a1 1 0 0 1-1.6.8A13 13 0 0 0 11 14H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z" />
            <path d="M6 14a12 12 0 0 0 2.4 7.2 2 2 0 0 0 3.2-2.4A8 8 0 0 1 10 14" />
            <path d="M8 6v8" />
          </svg>
        {elseif isset($type) && $type == "warning"}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-alert-icon lucide-circle-alert">
            <circle cx="12" cy="12" r="10" />
            <line x1="12" x2="12" y1="8" y2="12" />
            <line x1="12" x2="12.01" y1="16" y2="16" />
          </svg>
        {else}
          {* Info Icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-megaphone-icon lucide-megaphone">
            <path d="M11 6a13 13 0 0 0 8.4-2.8A1 1 0 0 1 21 4v12a1 1 0 0 1-1.6.8A13 13 0 0 0 11 14H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2z" />
            <path d="M6 14a12 12 0 0 0 2.4 7.2 2 2 0 0 0 3.2-2.4A8 8 0 0 1 10 14" />
            <path d="M8 6v8" />
          </svg>
        {/if}
      </div>
      {* alert-content *}
      <div class="alert-content">
        {if $errorshtml}
          {* alert-message *}
          <h2 class="alert-title">{lang key='clientareaerrors'}</h2>
          {* alert-list *}
          <ul class="alert-list">
            {$errorshtml}
          </ul>
        {else}
          {if $title}
            {* alert-title *}
            <h2 class="alert-title">{$title}</h2>
          {/if}
          {if isset($message) && is_string($message)}
            {* alert-message *}
            <p class="alert-message">{$message|strip_tags|escape}</p>
          {else}
            {* alert-message *}
            <p class="alert-message">{$msg|strip_tags|escape}</p>
          {/if}
        {/if}
      </div>
      {* close-alert *}
      <div class="alert-dismissible">
        <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
            <circle cx="12" cy="12" r="10" />
            <path d="m15 9-6 6" />
            <path d="m9 9 6 6" />
          </svg>
        </button>
      </div>
    </div>
  </div>
</div>