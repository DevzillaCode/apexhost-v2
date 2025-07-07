{*
  AnnouncementArticleCard.tpl
  This template displays a single announcement article card.
  It shows the announcement title, an optional edit button, and the announcement text or summary (with images removed).
  You can edit this file to change how announcement articles look on your site.
*}
<div class="announcement-article-card --p-5">
  {* article-body *}
  <div class="article-body">
    {* Announcement Title with Link *}
    <a class="article-title d-inline-flex --title-5 --font-semibold --color-foreground --mb-4" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
      {$announcement.title}
    </a>
    {*
        If the user has permission, show an edit button for this announcement.
        The edit button links to the announcement's edit page.
      *}
    {if $announcement.editLink}
      <a href="{$announcement.editLink}" class="nt-square --btn-shadow-default --btn-sm --radius-full show-on-hover --ml-2 --mb-2" aria-label="{lang key='edit'}" title="{lang key='edit'}">
        <i class="fad fa-pencil-alt fa-fw"></i>
      </a>
    {/if}
    {*
      We remove <img> tags (images) from the announcement text and summary below.
      This is done so that only the text is shown, and any images in the content are hidden.
      The regex_replace filter finds and deletes any <img ...> HTML tags.
      You can safely edit the text or summary above without worrying about images showing up here.
    *}
    {* Article Text *}
    <article class="article-text --text-base --color-neutral-300 --mb-4">
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
  <div class="article-footer --pt-4">
    {* article-info-div *}
    <div class="article-info-div --text-sm --font-medium --color-muted-foreground d-inline-flex align-items-center justify-content-center --radius-pill">
      {* Display the author of the announcement, if available *}
      {$carbon->createFromTimestamp($announcement.timestamp)->format('jS F Y')}
    </div>
  </div>
</div>