{* Announcements Area *}
<div class="announcements-area mb-10">
  {* page-title *}
  {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='announcementsHeadline'}" tagline="{lang key='announcementsTagline'}"}
  {* announcements *}
  <div class="announcements-list">
    {foreach $announcements as $announcement}
      {* Announcements Article Card *}
      {include file="$template/components/cards/AnnouncementArticleCard.tpl"}
    {foreachelse}
      {* Announcements Errors *}
      {include file="$template/includes/alert.tpl" type="info" msg="{lang key='noannouncements'}"}
    {/foreach}
  </div>
</div>

{if $prevpage || $nextpage}
  {* Master Pagination *}
  {include file="$template/components/paginations/MasterPagination.tpl"}
{/if}

{if $announcementsFbRecommend}
  <script>
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) {
        return;
      }
      js = d.createElement(s);
      js.id = id;
      js.src = "//connect.facebook.net/{lang key='locale'}/all.js#xfbml=1";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
  </script>
{/if}