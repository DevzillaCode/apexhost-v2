{* Search Form *}
{include file="$template/components/search/KnowledgebaseSearch.tpl"}

{if $kbcats}
  <div class="row">
    {foreach $kbcats as $category}
      <div class="col-xl-6">
        <div class="card kb-category mb-4">
          <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" class="card-body" data-id="{$category.id}">
            <span class="h5 m-0">
              <span class="badge badge-info float-right">
              {lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}
            </span>
            <i class="fal fa-folder fa-fw"></i>
            {$category.name}
            {if $category.editLink}
              <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditCategory-{$category.id}" data-url="{$category.editLink}" type="button">
                {lang key="edit"}
              </button>
            {/if}
          </span>
          <p class="m-0 text-muted"><small>{$category.description}</small></p>
        </a>
      </div>
    </div>
  {/foreach}
</div>
{/if}

{if $kbarticles || !$kbcats}
  <div class="nt-card rounded-md mb-4">
    {* nt-card-header *}
    <div class="nt-card-header py-4 px-4 d-flex align-items-center" data-gap-x="10px">
      <svg class="title-6 color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
        <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
      </svg>
      <h3 class="title-6 font-weight-semibold color-foreground mb-0">
        {if $tag}
          {lang key='kbviewingarticlestagged'} '{$tag}'
        {else}
          {lang key='knowledgebasearticles'}
        {/if}
      </h3>
    </div>
    <div class="py-4 px-4 d-flex flex-column" data-gap-y="8px">
      {foreach $kbarticles as $kbarticle}
        <article class="nt-card --has-hover d-flex align-items-start p-2 rounded-sm" data-id="{$kbarticle.id}" data-gap-x="6px">
          <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" title="{$kbarticle.title}" aria-label="{$kbarticle.title}" class="d-flex align-items-start w-100" data-gap-x="6px" data-id="{$kbarticle.id}">
            <svg class="color-muted-foreground me-2" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z" />
              <path d="M14 2v4a2 2 0 0 0 2 2h4" />
              <path d="M10 9H8" />
              <path d="M16 13H8" />
              <path d="M16 17H8" />
            </svg>
            <div class="d-flex flex-column">
              <h3 class="text-size-base color-neutral-300 mb-1 font-weight-semibold">{$kbarticle.title}</h3>
              <p class="text-size-sm color-muted-foreground mb-0">{$kbarticle.article|truncate:100:"..."}</p>
            </div>
          </a>
        </article>
      {foreachelse}
        <p class="--text-muted text-size-base font-weight-medium">{lang key='knowledgebasenoarticles'}</p>
      {/foreach}

    </div>
  </div>
{/if}

<a href="javascript:history.go(-1)" class="nt-btn nt-btn-default">
  {lang key='clientareabacklink'}
</a>

{if $kbcurrentcat.editLink}
  <a href="{$kbcurrentcat.editLink}" class="nt-btn nt-btn-default float-right">
    <i class="fas fa-pencil-alt fa-fw"></i>
    {lang key='edit'}
  </a>
{/if}