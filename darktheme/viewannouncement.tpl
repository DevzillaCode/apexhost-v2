{* Main announcement container *}
<div class="mb-8">
  {* Announcement title *}
  <h1 class="title-4 font-weight-semibold color-foreground mb-4">{$title}</h1>

  {* Announcement metadata - date and time *}
  <ul class="list-inline">
    {* Publication date *}
    <li class="list-inline-item color-muted-foreground text-size-sm pr-2">
      <i class="far fa-calendar-alt fa-fw"></i>
      {$carbon->createFromTimestamp($timestamp)->format('l, jS F, Y')}
    </li>

    {* Publication time *}
    <li class="list-inline-item color-muted-foreground text-size-sm pr-2">
      <i class="far fa-clock fa-fw"></i>
      {$carbon->createFromTimestamp($timestamp)->format('H:ia')}
    </li>
  </ul>

  {* Announcement content area *}
  <div class="announcements-text-area pt-8 text-size-base">
    {$text}
  </div>
</div>

{* Navigation and action buttons section *}
<div class="page-footer">
  <div class="d-flex justify-content-between">
    {* Back to announcements list button *}
    <a href="{routePath('announcement-index')}" class="btn btn-semi-ghost-secondary btn-wide">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left rtl-rotate">
        <path d="m12 19-7-7 7-7" />
        <path d="M19 12H5" />
      </svg>
      {lang key='clientareabacklink'}
    </a>

    {* Edit button - only show if user has edit permissions *}
    {if $editLink}
      <a href="{$editLink}" class="btn btn-semi-ghost-info btn-wide">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-line-icon lucide-pencil-line">
          <path d="M13 21h8" />
          <path d="m15 5 4 4" />
          <path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z" />
        </svg>
        {lang key='edit'}
      </a>
    {/if}
  </div>
</div>