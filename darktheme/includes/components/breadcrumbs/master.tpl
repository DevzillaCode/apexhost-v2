{* ========================================
  BREADCRUMB MASTER COMPONENT
  ========================================
  This template generates the breadcrumb navigation structure.
  It loops through the breadcrumb array and creates accessible navigation links.
  ======================================== *}

{* ========================================
  BREADCRUMB LIST STRUCTURE
  ========================================
  - Uses ordered list for semantic HTML
  - Bootstrap classes for styling
  - Accessible navigation structure
  ======================================== *}
<ol class="theme-breadcrumb list-unstyled mb-0">
  {* ========================================
    BREADCRUMB ITERATION
    ========================================
    Loop through each breadcrumb item
    ======================================== *}
  {foreach $breadcrumb as $item}
    {* ========================================
      BREADCRUMB ITEM
      ========================================
      - Active class for current page
      - ARIA current for accessibility
      - Conditional link wrapping
      ======================================== *}
    <li class="breadcrumb-item{if $item@last} active{/if}" {if $item@last} aria-current="page" {/if}>
      {* ========================================
        LINK CONDITIONAL LOGIC
        ========================================
        Only wrap in link if not the last item
        ======================================== *}
      {if !$item@last}<a href="{$item.link}">{/if}
        {$item.label}
        {if !$item@last}</a>{/if}
    </li>
  {/foreach}
</ol>