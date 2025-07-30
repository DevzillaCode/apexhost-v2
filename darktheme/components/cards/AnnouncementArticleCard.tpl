{*
  AnnouncementArticleCard.tpl
  This template displays a single announcement article card.
  It shows the announcement title, an optional edit button, and the announcement text or summary (with images removed).
  You can edit this file to change how announcement articles look on your site.
*}
<div class="announcement-article-card p-5">
  {* article-body *}
  <div class="article-body">
    {* Announcement Title with Link *}
    <a class="article-title theme-link d-inline-flex title-5 font-weight-semibold color-foreground mb-4" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
      {$announcement.title}
    </a>
    {*
        If the user has permission, show an edit button for this announcement.
        The edit button links to the announcement's edit page.
      *}
    {if $announcement.editLink}
      <a href="{$announcement.editLink}" class="btn btn-semi-ghost-secondary btn-xxs show-on-hover ml-2 mb-2" aria-label="{lang key='edit'}" title="{lang key='edit'}">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-line-icon lucide-pencil-line">
          <path d="M13 21h8" />
          <path d="m15 5 4 4" />
          <path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z" />
        </svg>
        {lang key='edit'}
      </a>
    {/if}
    {*
      We remove <img> tags (images) from the announcement text and summary below.
      This is done so that only the text is shown, and any images in the content are hidden.
      The regex_replace filter finds and deletes any <img ...> HTML tags.
      You can safely edit the text or summary above without worrying about images showing up here.
    *}
    {* Article Text *}
    <article class="article-text text-size-base color-neutral-300 mb-4">
      {*
        If the announcement text is short (less than 350 characters), show the full text (without images).
        Otherwise, show the summary (also without images).
      *}
      {if $announcement.text|strip_tags|strlen < 350}
        {$announcement.text|regex_replace:'/<img[^>]*>/':''}
      {else}
        {$announcement.summary|regex_replace:'/<img[^>]*>/':''}
      {/if}
    </article>
  </div>
  {* article-footer *}
  <div class="article-footer pt-4">
    {* article-info-div *}
    <div class="article-info-div text-size-sm font-weight-medium color-muted-foreground d-inline-flex align-items-center justify-content-center rounded-pill">
      {* Display the author of the announcement, if available *}
      {$carbon->createFromTimestamp($announcement.timestamp)->format('jS F Y')}
    </div>
  </div>
</div>