{*
  AnnouncementsPagination.tpl
  This template displays pagination controls for the announcements list.
  It creates a navigation component with numbered pages, previous/next buttons, and proper accessibility.

  STRUCTURE:
  - Navigation container with ARIA label for screen readers
  - Unordered list containing pagination items
  - Each item can be a page number, previous/next button, or ellipsis
  - Items can have disabled or active states

  CSS CLASSES:
  - theme-pagination: Main container styling
  - theme-pagination-list: List container with flexbox layout
  - pagination-item: Individual pagination button container
  - pagination-link: Clickable link for each pagination item
  - disabled: Applied to non-clickable items (current page, out of range)
  - active: Applied to the current page for visual highlighting

  VARIABLES:
  - $pagination: Array of pagination items from WHMCS
  - $item.link: URL for the pagination link
  - $item.text: Display text (page number, "Previous", "Next", etc.)
  - $item.disabled: Boolean indicating if item is clickable
  - $item.active: Boolean indicating if item is current page
*}

{* Main pagination navigation container *}
<nav class="theme-pagination my-3" aria-label="Announcements navigation">
  {* Pagination list container *}
  <ul class="theme-pagination-list">
    {* Loop through each pagination item provided by WHMCS *}
    {foreach $pagination as $item}
      {* Individual pagination item with conditional classes *}
      <li class="pagination-item{if $item.disabled} disabled{/if}{if $item.active} active{/if}">
        {* Clickable pagination link *}
        <a class="pagination-link" href="{$item.link}">{$item.text}</a>
      </li>
    {/foreach}
  </ul>
</nav>