{* page-title *}
<!-- Page header with title and tagline -->
{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='knowledgebasetitle'}" tagline="{lang key='knowledgebasetagline'}"}

{* Search Form *}
<!-- Search form container with card styling -->
<div class="card mb-8">
  <div class="card-body">
    <!-- Include the knowledgebase search component -->
    {include file="$template/components/search/KnowledgebaseSearch.tpl"}
  </div>
</div>

<!-- Knowledgebase categories section (only shows if categories exist) -->
{if $kbcats}
  <!-- Grid layout for knowledgebase categories -->
  <div class="row">
    <!-- Loop through each knowledgebase category -->
    {foreach $kbcats as $category}
      <div class="col-xl-6">
        <!-- Category card with specific knowledgebase styling -->
        <div class="card kb-category mb-4">
          <!-- Category link wrapping the entire card content -->
          <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" class="card-body" data-id="{$category.id}">
            <!-- Category title with badge and edit button -->
            <span class="h5 m-0">
              <!-- Badge showing number of articles in category -->
              <span class="badge badge-info float-right">
              {lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}
            </span>
            <!-- Folder icon -->
            <i class="fal fa-folder fa-fw"></i>
            {$category.name}
            <!-- Edit button (only shows if user has edit permissions) -->
            {if $category.editLink}
              <button class="btn btn-sm btn-light show-on-card-hover" id="btnEditCategory-{$category.id}" data-url="{$category.editLink}" type="button">
                {lang key="edit"}
              </button>
            {/if}
          </span>
          <!-- Category description -->
          <p class="m-0 text-muted"><small>{$category.description}</small></p>
        </a>
      </div>
    </div>
  {/foreach}
</div>
{/if}

<!-- Articles section (shows if articles exist OR if no categories exist) -->
{if $kbarticles || !$kbcats}
  <div class="card border-0 rounded-md my-4">
    {* card-header *}
    <!-- Section header with star icon -->
    <div class="card-header d-flex align-items-center col-gap-2">
      <!-- Star icon -->
      <svg class="title-6 color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
        <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
      </svg>
      <!-- Dynamic section title (changes based on whether viewing tagged articles or all articles) -->
      <h3 class="title-6 font-weight-semibold color-foreground mb-0">
        {if $tag}
          {lang key='kbviewingarticlestagged'} '{$tag}'
        {else}
          {lang key='knowledgebasearticles'}
        {/if}
      </h3>
    </div>

    <!-- Articles list container -->
    <div class="py-4 px-4 d-flex flex-column row-gap-2">
      <!-- Loop through each article -->
      {foreach $kbarticles as $kbarticle}
        <!-- Individual article card -->
        <article class="card article-card --has-hover d-flex align-items-start rounded-sm border-0 col-gap-2" data-id="{$kbarticle.id}">
          <!-- Article link wrapper -->
          <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" title="{$kbarticle.title}" aria-label="{$kbarticle.title}" class="d-flex align-items-start w-100 col-gap-2" data-id="{$kbarticle.id}">
            <!-- Document icon -->
            <svg class="color-muted-foreground me-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z" />
              <path d="M14 2v4a2 2 0 0 0 2 2h4" />
              <path d="M10 9H8" />
              <path d="M16 13H8" />
              <path d="M16 17H8" />
            </svg>

            <!-- Article information -->
            <div class="d-flex flex-column">
              <!-- Article title -->
              <h3 class="text-size-base color-neutral-300 mb-1 font-weight-semibold">{$kbarticle.title}</h3>
              <!-- Article preview (truncated to 100 characters) -->
              <p class="text-size-sm color-muted-foreground mb-0">{$kbarticle.article|truncate:100:"..."}</p>
            </div>
          </a>
        </article>
      {foreachelse}
        <!-- Message shown when no articles are found -->
        <p class="--text-muted text-size-base font-weight-medium">{lang key='knowledgebasenoarticles'}</p>
      {/foreach}
    </div>
  </div>
{/if}

<!-- Navigation buttons -->
<!-- Back button using browser history -->
<a href="javascript:history.go(-1)" class="btn btn-light">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
    <path d="m12 19-7-7 7-7" />
    <path d="M19 12H5" />
  </svg>
  {lang key='clientareabacklink'}
</a>

<!-- Edit category button (only shows if user has edit permissions for current category) -->
{if $kbcurrentcat.editLink}
  <a href="{$kbcurrentcat.editLink}" class="btn btn-info float-right">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pencil-icon lucide-pencil">
      <path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z" />
      <path d="m15 5 4 4" />
    </svg>
    {lang key='edit'}
  </a>
{/if}