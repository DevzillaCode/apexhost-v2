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
  <div class="row small-gutters">
    <!-- Loop through each knowledgebase category -->
    {foreach $kbcats as $category}
      <div class="col-xl-6 mb-4">
        {* Card *}
        <!-- Category card with hover effect -->
        <div class="card --has-hover border-0 rounded-md">
          {* title *}
          <!-- Category link wrapping the entire card content -->
          <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" class="card-body d-flex flex-column" data-id="{$category.id}">
            <span>
              {* title *}
              <!-- Category title with folder icon and optional edit button -->
              <span class="title-6 font-weight-semibold color-foreground d-inline-flex align-items-center" data-gap-x="6px">
                {* icon *}
                <!-- Folder icon -->
                <svg class="color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-folder-icon lucide-folder">
                  <path d="M20 20a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.9a2 2 0 0 1-1.69-.9L9.6 3.9A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2Z" />
                </svg>
                {* category name *}
                {$category.name}
                {* edit link *}
                <!-- Edit button (only shows if user has edit permissions) -->
                {if $category.editLink}
                  <button class="btn btn-outline-light btn-xs show-on-hover" id="btnEditCategory-{$category.id}" data-url="{$category.editLink}" type="button">
                    Edit
                  </button>
                {/if}
              </span>
              {* badge *}
              <!-- Badge showing number of articles in category -->
            <span class="badge badge-light float-right">{lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}</span>
          </span>
          <!-- Category description -->
          <p class="text-size-base color-muted-foreground mb-0 mt-2"><small>{$category.description}</small></p>
        </a>
      </div>
    </div>
  {/foreach}
</div>
{else}
<!-- Show message when no knowledgebase categories are available -->
{include file="$template/includes/alert.tpl" type="info" msg="{lang key='knowledgebasenoarticles'}" textcenter=true}
{/if}

<!-- Most popular articles section (only shows if popular articles exist) -->
{if $kbmostviews}
  <div class="card border-0 rounded-md mb-4">
    {* card-header *}
    <!-- Section header with star icon -->
    <div class="card-header d-flex align-items-center col-gap-2">
      <!-- Star icon for popular articles -->
      <svg class="title-6 color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
        <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
      </svg>
      <h3 class="title-6 font-weight-semibold color-foreground mb-0">{lang key='knowledgebasepopular'}</h3>
    </div>

    <!-- Popular articles list -->
    <div class="card-body py-4 px-4 d-flex flex-column row-gap-2">
      <!-- Loop through each popular article -->
      {foreach $kbmostviews as $kbarticle}
        <!-- Individual article card -->
        <article class="card article-card --has-hover d-flex align-items-start border-0 rounded-sm" data-id="{$kbarticle.id}">
          <!-- Article link wrapper -->
          <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" title="{$kbarticle.title}" aria-label="{$kbarticle.title}" class="d-flex align-items-start w-100 col-gap-2">
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
      {/foreach}
    </div>
  </div>
{/if}