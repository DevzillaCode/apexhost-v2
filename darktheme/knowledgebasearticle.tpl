{* Display success message if user has already voted *}
{if $kbarticle.voted}
  {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
{/if}

{* Main article container *}
<div class="nt-card --radius-md --p-8 --mb-6">
  {* Article header with title and print button *}
  <h1 class="--title-4 --font-semibold --color-foreground --mb-4">
    {$kbarticle.title}
    {* Print button - positioned to the right *}
    <a href="#" class="nt-btn --btn-default --btn-sm float-right" onclick="window.print();return false">
      {* Printer icon SVG *}
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-printer-icon lucide-printer">
        <path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2" />
        <path d="M6 9V3a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6" />
        <rect x="6" y="14" width="12" height="8" rx="1" />
      </svg>
      {lang key='print'}
    </a>
  </h1>

  {* Article metadata section *}
  <ul class="list-inline d-flex align-items-center flex-wrap --mb-4" data-gap-x="8px" data-gap-y="8px">
    {* Display tags if they exist *}
    {if $kbarticle.tags}
      <li>
        <span class="badge badge-info badge-pill">
          {* Code icon for tags *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-code-icon lucide-code">
            <path d="m16 18 6-6-6-6" />
            <path d="m8 6-6 6 6 6" />
          </svg>
          {$kbarticle.tags}
        </span>
      </li>
    {/if}

    {* Display useful votes count *}
    <li class="list-inline-item --text-sm --pr-2 --color-muted-foreground --mx-4">
      <i class="fas fa-thumbs-up mr-2"></i>{$kbarticle.useful}
    </li>
  </ul>

  {* Separator line *}
  <hr>

  {* Main article content *}
  <article class="kb-text-area --text-base">
    {$kbarticle.text}
  </article>

  {* Voting section - only show if user hasn't voted yet *}
  {if !$kbarticle.voted}
    <hr>

    {* Voting section header *}
    <h4 class="--title-5 --color-foreground --mb-3">{lang key='knowledgebasehelpful'}</h4>

    {* Voting form *}
    <form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post" class="d-flex justify-content-between">
      {* Hidden input for vote action *}
      <input type="hidden" name="useful" value="vote">

      {* Vote buttons container *}
      <div>
        {* Yes/Helpful button *}
        <button class="nt-btn --btn-shadow-primary --btn-sm" type="submit" name="vote" value="yes">
          {* Thumbs up icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-thumbs-up-icon lucide-thumbs-up">
            <path d="M7 10v12" />
            <path d="M15 5.88 14 10h5.83a2 2 0 0 1 1.92 2.56l-2.33 8A2 2 0 0 1 17.5 22H4a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2h2.76a2 2 0 0 0 1.79-1.11L12 2a3.13 3.13 0 0 1 3 3.88Z" />
          </svg>
          {lang key='knowledgebaseyes'}
        </button>

        {* No/Not helpful button *}
        <button class="nt-btn --btn-shadow-danger --btn-sm" type="submit" name="vote" value="no">
          {* Thumbs down icon *}
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-thumbs-down-icon lucide-thumbs-down">
            <path d="M17 14V2" />
            <path d="M9 18.12 10 14H4.17a2 2 0 0 1-1.92-2.56l2.33-8A2 2 0 0 1 6.5 2H20a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.76a2 2 0 0 0-1.79 1.11L12 22a3.13 3.13 0 0 1-3-3.88Z" />
          </svg>
          {lang key='knowledgebaseno'}
        </button>
      </div>
    </form>
  {/if}
</div>

{* Related articles section *}
{if $kbarticles}
  <div class="card">
    {* Related articles header *}
    <div class="card-body">
      <h3 class="card-title m-0">
        <i class="fal fa-folder-open fa-fw"></i>
        {lang key='knowledgebaserelated'}
      </h3>
    </div>

    {* Related articles list *}
    <div class="list-group list-group-flush">
      {foreach $kbarticles as $kbarticle}
        {* Individual related article item *}
        <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" class="list-group-item kb-article-item" data-id="{$kbarticle.id}">
          <i class="fal fa-file-alt fa-fw text-black-50"></i>
          {$kbarticle.title}

          {* Edit button - only show if user has edit permissions *}
          {if $kbarticle.editLink}
            <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditArticle-{$kbarticle.id}" data-url="{$kbarticle.editLink}" type="button">
              {lang key="edit"}
            </button>
          {/if}

          {* Article preview text *}
          <small>{$kbarticle.article|truncate:100:"..."}</small>
        </a>
      {foreachelse}
        {* No related articles message *}
        <div class="list-group-item">
          {lang key='knowledgebasenoarticles'}
        </div>
      {/foreach}
    </div>
  </div>
{/if}

{* Navigation buttons section *}
{* Back button *}
<a href="javascript:history.go(-1)" class="nt-btn --btn-default --px-5">
  {lang key='clientareabacklink'}
</a>

{* Edit button - only show if user has edit permissions *}
{if $kbarticle.editLink}
  <a href="{$kbarticle.editLink}" class="nt-btn --btn-shadow-default float-right">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-icon lucide-pencil">
      <path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z" />
      <path d="m15 5 4 4" />
    </svg>
    {lang key='edit'}
  </a>
{/if}