{* page-title *}
<!-- Page header with title and tagline -->
{include file="$template/components/heading/PageTitle.tpl" headline="{lang key='clientareadownloads'}" tagline="{lang key='clientareadownloadstagline'}"}

{* search-form *}
<!-- Search form container with card styling -->
<div class="card">
  <div class="card-body">
    <!-- Include the downloads search component -->
    {include file="$template/components/search/DownloadsSearch.tpl"}
  </div>
</div>

<!-- Download categories section (only shows if categories exist) -->
{if $dlcats}
  <!-- Grid layout for download categories with responsive columns -->
  <div class="row small-gutters mt-8 row-gap-4">
    <!-- Loop through each download category -->
    {foreach $dlcats as $category}
      <div class="col-xl-6">
        <!-- Category card with hover effect -->
        <div class="card --has-hover border-0">
          <!-- Category link wrapping the entire card content -->
          <a href="{routePath('download-by-cat', {$category.id}, {$category.urlfriendlyname})}" class="card-body d-flex flex-column">
            <span>
              <!-- Category title with folder icon -->
              <span class="title-6 font-weight-semibold color-foreground d-inline-flex align-items-center col-gap-2">
                <!-- Folder icon -->
                <svg class="color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 20a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.9a2 2 0 0 1-1.69-.9L9.6 3.9A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2Z"></path>
                </svg>
                {$category.name}
              </span>
              <!-- Badge showing number of downloads in category -->
            <span class="badge badge-light float-right">{lang key="downloads.numDownload{if $category.numarticles != 1}s{/if}" num=$category.numarticles}</span>
          </span>
          <!-- Category description -->
          <p class="text-size-base color-muted-foreground mb-0 mt-2"><small>{$category.description}</small></p>
        </a>
      </div>
    </div>
  {/foreach}
</div>
{else}
<!-- Show message when no download categories are available -->
{include file="$template/includes/alert.tpl" type="info" msg="{lang key='downloadsnone'}"}
{/if}

<!-- Most popular downloads section (only shows if popular downloads exist) -->
{if $mostdownloads}
  <div class="card border-0 mt-8">
    <!-- Section header with star icon -->
    <div class="card-header">
      <h3 class="title-6 font-weight-semibold color-foreground mb-0 d-flex align-items-center col-gap-2">
        <!-- Star icon for popular downloads -->
        <svg class="title-6 color-foreground" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path>
        </svg>
        {lang key='downloadspopular'}
      </h3>
    </div>

    <!-- Popular downloads list -->
    <div class="card-body p-4">
      <!-- Loop through each popular download -->
      {foreach $mostdownloads as $download}
        <!-- Individual download article card -->
        <article class="card article-card --has-hover d-flex align-items-start p-4 rounded-sm border-0" data-id="{$download.id}" data-gap-x="6px" style="column-gap: 6px;">

          <!-- Restriction label (only shows for client-only downloads) -->
          {if $download.clientsonly}
            <span class="label label-danger">
              <i class="fas fa-lock fa-fw"></i>
              {lang key='restricted'}
            </span>
          {/if}

          <!-- Download link wrapper -->
          <a href="{$download.link}" title="{$download.title}" aria-label="{$download.title}" class="d-flex align-items-start w-100 col-gap-2">
            <!-- File type icon (dynamically generated based on file type) -->
            {$download.type|replace:'alt':' class="text-size-lg mt-1" alt'}

            <!-- Download information -->
            <div class="d-flex flex-column">
              <!-- Download title -->
              <h3 class="text-size-base color-neutral-300 mb-1 font-weight-semibold">{$download.title}</h3>
              <!-- Download description -->
              <p class="text-size-sm color-muted-foreground mb-1">{$download.description}</p>
              <!-- File size information -->
              <p class="text-size-sm color-muted-foreground mb-0"><strong>{lang key='downloadsfilesize'}: {$download.filesize}</strong></p>
            </div>
          </a>
        </article>
      {/foreach}
    </div>
  </div>
{/if}