{* Assign default FontAwesome chevron icons *}
{assign var='leftChevron' value='<i class="fas fa-chevron-left"></i>'}
{assign var='leftDubbleChevrons' value='<i class="fas fa-chevron-double-left"></i>'}
{assign var='rightChevron' value='<i class="fas fa-chevron-right"></i>'}
{assign var='rightDubbleChevrons' value='<i class="fas fa-chevron-double-right"></i>'}

{* Replace left chevron with custom SVG and add translated text for "Previous" *}
{assign var='leftChevronReplacement' value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-left-icon lucide-chevron-left"><path d="m15 18-6-6 6-6"/></svg>'}
{assign var='leftChevronReplacement' value=$leftChevronReplacement|cat:' '|cat:{lang key="tablepagesprevious"}}

{* Replace right chevron with translated text for "Next" and custom SVG *}
{assign var='rightChevronReplacement' value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right-icon lucide-chevron-right"><path d="m9 18 6-6-6-6"/></svg>'}
{assign var='rightChevronReplacement' value={lang key="tablepagesnext"}|cat:' '|cat:$rightChevronReplacement}

{* Replace double chevrons with custom SVG icons *}
{assign var='leftDubbleChevronsReplacement' value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-left-icon lucide-chevrons-left"><path d="m11 17-5-5 5-5"/><path d="m18 17-5-5 5-5"/></svg>'}
{assign var='rightDubbleChevronsReplacement' value='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevrons-right-icon lucide-chevrons-right"><path d="m6 17 5-5-5-5"/><path d="m13 17 5-5-5-5"/></svg>'}

{* Render pagination list *}
<ul class="pagination">
  {foreach $pagination as $item}
    {* Add appropriate classes based on item status (disabled, active, previous, next) *}
    <li class="pagination-item
      {if $item.disabled} disabled{/if}
      {if $item.active} active{/if}
      {if $item.text == $leftChevron} previous{/if}
      {if $item.text == $rightChevron} next{/if}">

      {* Replace default icons with custom SVGs and translations *}
      <a href="{$item.link}" class="pagination-link">
        {$item.text|replace:$leftChevron:$leftChevronReplacement|replace:$rightChevron:$rightChevronReplacement|replace:$leftDubbleChevrons:$leftDubbleChevronsReplacement|replace:$rightDubbleChevrons:$rightDubbleChevronsReplacement}
      </a>
    </li>
  {/foreach}
</ul>
