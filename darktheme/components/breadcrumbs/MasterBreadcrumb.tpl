<ol class="theme-breadcrumb list-unstyled mb-0">
  {foreach $breadcrumb as $item}
    <li class="breadcrumb-item{if $item@last} active{/if} d-inline-flex align-items-center" data-gap-x="8px" {if $item@last} aria-current="page" {/if}>
      {if !$item@last}<a href="{$item.link}" class="link">{/if}
        {$item.label}
        {if !$item@last}</a>{/if}
      {if !$item@last}
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right rtl-rotate">
          <path d="m9 18 6-6-6-6"></path>
        </svg>
      {/if}
    </li>
  {/foreach}
</ol>