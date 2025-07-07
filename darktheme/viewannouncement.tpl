<div class="nt-card --radius-md --p-8 --mb-6">
  <h1 class="--title-4 --font-semibold --color-foreground --mb-4">{$title}</h1>
  <ul class="list-inline">
    <li class="list-inline-item --color-muted-foreground --text-sm --pr-2">
      <i class="far fa-calendar-alt fa-fw"></i>
      {$carbon->createFromTimestamp($timestamp)->format('l, jS F, Y')}
    </li>
    <li class="list-inline-item --color-muted-foreground --text-sm --pr-2">
      <i class="far fa-clock fa-fw"></i>
      {$carbon->createFromTimestamp($timestamp)->format('H:ia')}
    </li>
    <div class="announcements-text-area --pt-8 --px-6 --text-base">
      {$text}
    </div>
  </ul>
</div>

<a href="{routePath('announcement-index')}" class="nt-btn --btn-default --px-5">
  {lang key='clientareabacklink'}
</a>

{if $editLink}
  <a href="{$editLink}" class="nt-btn --btn-shadow-default float-right">
    <i class="fad fa-pencil-alt fa-fw"></i>
    {lang key='edit'}
  </a>
{/if}