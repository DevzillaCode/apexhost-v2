{* Search Form *}
{include file="$template/components/search/KnowledgebaseSearch.tpl"}

{if $kbcats}
  <div class="row small-gutters">
    {foreach $kbcats as $category}
      <div class="col-xl-6 --mb-4">
        {* Card *}
        <div class="nt-card --has-hover --p-4 --radius-md">
          {* title *}
          <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" class="d-flex flex-column" data-id="{$category.id}">
            <span>
              {* title *}
              <span class="--title-6 --font-semibold --color-foreground d-inline-flex align-items-center" data-gap-x="6px">
                {* icon *}
                <svg class="--color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-folder-icon lucide-folder">
                  <path d="M20 20a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.9a2 2 0 0 1-1.69-.9L9.6 3.9A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2Z" />
                </svg>
                {* category name *}
                {$category.name}
                {* edit link *}
                {if $category.editLink}
                  <button class="nt-btn --btn-shadow-default --btn-xs show-on-hover" id="btnEditCategory-{$category.id}" data-url="{$category.editLink}" type="button">
                    Edit
                  </button>
                {/if}
              </span>
              {* badge *}
            <span class="badge badge-default float-right">{lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}</span>
          </span>
          <p class="--text-base --color-muted-foreground --mb-0 --mt-2"><small>{$category.description}</small></p>
        </a>
      </div>
    </div>
  {/foreach}
</div>
{else}
{include file="$template/includes/alert.tpl" type="info" msg="{lang key='knowledgebasenoarticles'}" textcenter=true}
{/if}

{if $kbmostviews}
  <div class="nt-card --radius-md --mb-4">
    {* nt-card-header *}
    <div class="nt-card-header --py-4 --px-4 d-flex align-items-center" data-gap-x="10px">
      <svg class="--title-6 --color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
        <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
      </svg>
      <h3 class="--title-6 --font-semibold --color-foreground --mb-0">{lang key='knowledgebasepopular'}</h3>
    </div>
    <div class="--py-4 --px-4 d-flex flex-column" data-gap-y="8px">
      {foreach $kbmostviews as $kbarticle}
        <article class="nt-card --has-hover d-flex align-items-start --p-2 --radius-sm" data-id="{$kbarticle.id}" data-gap-x="6px">
          <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" title="{$kbarticle.title}" aria-label="{$kbarticle.title}" class="d-flex align-items-start w-100" data-gap-x="6px">
            <svg class="--color-muted-foreground me-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z" />
              <path d="M14 2v4a2 2 0 0 0 2 2h4" />
              <path d="M10 9H8" />
              <path d="M16 13H8" />
              <path d="M16 17H8" />
            </svg>
            <div class="d-flex flex-column">
              <h3 class="--text-base --color-neutral-300 --mb-1 --font-semibold">{$kbarticle.title}</h3>
              <p class="--text-sm --color-muted-foreground --mb-0">{$kbarticle.article|truncate:100:"..."}</p>
            </div>
          </a>
        </article>
      {/foreach}

    </div>
  </div>
{/if}