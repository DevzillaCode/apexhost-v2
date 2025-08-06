{* Announcement Card *}
<div class="announcement-card">
  {* card-cover *}
  <div class="card-cover d-flex align-items-center justify-content-center position-relative mb-3">
    {assign var="imgStart" value=$announcement.text|strpos:'<img'}
    {assign var="imgTag" value=$announcement.text|substr:$imgStart:200}
    {assign var="imgEnd" value=$imgTag|strpos:'>'}
    {assign var="imgSrc" value=$imgTag|substr:0:$imgEnd}
    {* If the image source is not empty, display it *}
    {* Extract the src attribute from the first <img> tag in the announcement text *}
    {assign var="imgStart" value=$announcement.text|strpos:'<img'}
    {if $imgStart !== false}
      {assign var="imgTag" value=$announcement.text|substr:$imgStart:200}
      {assign var="srcStart" value=$imgTag|strpos:'src="'}
      {if $srcStart !== false}
        {assign var="srcStartPos" value=$srcStart+5}
        {assign var="imgRest" value=$imgTag|substr:$srcStartPos}
        {assign var="srcEnd" value=$imgRest|strpos:'"'}
        {assign var="imgSrc" value=$imgRest|substr:0:$srcEnd}
        {if $imgSrc|substr:0:4 == 'http'}
          <img src="{$imgSrc}" alt="Announcement Image" class="cover-image img-fluid">
        {else}
          <img src="https://placehold.co/400x200" alt="Announcement Image" class="cover-image img-fluid">
        {/if}
      {else}
        <img src="https://placehold.co/400x200" alt="Announcement Image" class="cover-image img-fluid">
      {/if}
    {else}
      <img src="https://placehold.co/400x200" alt="Announcement Image" class="cover-image img-fluid">
    {/if}
  </div>
  {* card-info *}
  <div class="card-info d-flex align-items-center justify-content-start flex-warp mb-4 col-gap-3">
    {* info-div *}
    <div class="info-div d-inline-flex align-items-center py-2 px-3 text-size-sm color-foreground col-gap-2">
      <i class="fad fa-calendar-alt"></i>
      {$carbon->parse($announcement.rawDate)->format('jS F, Y')}
    </div>
    {* info-div *}
    <div class="info-div d-inline-flex align-items-center py-2 px-3 text-size-sm color-foreground col-gap-2">
      <i class="fad fa-clock"></i>
      {$carbon->parse($announcement.rawDate)->format('h:ia')}
    </div>
  </div>
  {* card-text *}
  <div class="card-text">
    <h3 class="card-title">
      <a href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="text-size-base color-foreground font-weight-semibold theme-link">
        {$announcement.title}
      </a>
    </h3>
  </div>
</div>