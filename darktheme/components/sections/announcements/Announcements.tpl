{* Announcements Section *}
<section class="announcements-section section-padding-large pb-0">
  <div class="container-fluid">
    {* section-title *}
    {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="T_announcementsTitle"}" tagline="{lang key="T_announcementsDesc"}"}
    {* section-content *}
    <div class="section-content">
      {* row *}
      <div class="row row-gap-8">
        {foreach $announcements as $announcement}
          {if $announcement@index < 3}
            {* col *}
            <div class="col-xl-4 col-md-6">
              {* Announcement Card *}
              {include file="$template/components/cards/AnnouncementCard.tpl" announcement=$announcement}
            </div>
          {/if}
        {/foreach}
      </div>
    </div>
  </div>
</section>