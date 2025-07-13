<div class="alert alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $additionalClasses} {$additionalClasses}{/if}{if $hide} w-hidden{/if}" {if $idname} id="{$idname}" {/if}>
  {* alert-icon *}
  <div class="alert-icon">
    {if $message.type == "error"}
      {* Error Icon *}
      <svg xmlns="http://www.w3.org/2000/svg" class="lucide lucide-alert-circle" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10" />
        <line x1="12" y1="8" x2="12" y2="12" />
        <line x1="12" y1="16" x2="12.01" y2="16" />
      </svg>
    {elseif $message.type == "success"}
      {* Success Icon *}
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-smile-icon lucide-smile">
        <circle cx="12" cy="12" r="10" />
        <path d="M8 14s1.5 2 4 2 4-2 4-2" />
        <line x1="9" x2="9.01" y1="9" y2="9" />
        <line x1="15" x2="15.01" y1="9" y2="9" />
      </svg>
    {elseif $message.type == "warning"}
      {* Warning Icon *}
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-triangle-alert-icon lucide-triangle-alert">
        <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3" />
        <path d="M12 9v4" />
        <path d="M12 17h.01" />
      </svg>
    {else}
      {* Info Icon *}
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-question-mark-icon lucide-circle-question-mark">
        <circle cx="12" cy="12" r="10" />
        <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3" />
        <path d="M12 17h.01" />
      </svg>
    {/if}
  </div>
  {* alert-content *}
  <div class="alert-content">
    {if $errorshtml}
      <h2 class="alert-title text-size-base font-weight-semibold">{lang key='clientareaerrors'}</h2>
      <ul class="alert-list">
        {$errorshtml}
      </ul>
    {else}
      {if $title}
        <h2 class="alert-title text-size-base font-weight-semibold">{$title}</h2>
      {/if}
      {$msg}
    {/if}
  </div>
</div>