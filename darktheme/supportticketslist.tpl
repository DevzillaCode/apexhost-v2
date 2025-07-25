<!-- Include table list component with filtering enabled on column 2 (status) -->
{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}

<!-- Page header with title and tagline -->
{include file="$template/components/heading/PageTitle.tpl"
  headline="{lang key='clientareatickets'}"
tagline="{lang key='clientareaticketstagline'}"
}

<!-- JavaScript for DataTable initialization and sorting -->
<script>
  jQuery(document).ready(function() {
    // Initialize DataTable and show the hidden table
    var table = jQuery('#tableTicketsList').show().DataTable();

    // Apply sorting based on URL parameters
    {if $orderby == 'did' || $orderby == 'dept'}
      table.order(0, '{$sort}');  // Sort by department column
    {elseif $orderby == 'subject' || $orderby == 'title'}
      table.order(1, '{$sort}');  // Sort by subject column
    {elseif $orderby == 'status'}
      table.order(2, '{$sort}');  // Sort by status column
    {elseif $orderby == 'lastreply'}
      table.order(3, '{$sort}');  // Sort by last reply column
    {/if}

    // Redraw table with applied sorting
    table.draw();

    // Hide loading indicator
    jQuery('#tableLoading').hide();
  });
</script>

<div class="clearfix">
  <!-- Tickets list table (initially hidden until DataTable loads) -->
  <table id="tableTicketsList" class="theme_datatable table w-hidden">
    <thead class="thead">
      <tr class="table-row">
        <!-- Empty header for the action arrow column -->
        <th class="order-head"></th>
        <th class="table-head">{lang key='supportticketsdepartment'}</th>
        <th class="table-head">{lang key='supportticketssubject'}</th>
        <th class="table-head">{lang key='supportticketsstatus'}</th>
        <th class="table-head">{lang key='supportticketsticketlastupdated'}</th>
      </tr>
    </thead>
    <tbody class="tbody">
      <!-- Loop through each support ticket -->
      {foreach $tickets as $ticket}
        <!-- Clickable table row that navigates to ticket view -->
        <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'" class="table-row">

          <!-- Action arrow icon column -->
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>

          <!-- Department name -->
          <td class="table-cell">
            {$ticket.department}
          </td>

          <!-- Ticket subject with ticket number and unread indicator -->
          <td class="table-cell">
            <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">
              <span class="ticket-number">#{$ticket.tid}</span>
              <!-- Subject with conditional unread styling -->
              <span class="ticket-subject{if $ticket.unread} unread{/if}">{$ticket.subject}</span>
            </a>
          </td>

          <!-- Ticket status with color-coded label -->
          <td class="table-cell">
            <!-- Status label with either predefined or custom color -->
            <span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}" {else}status-custom" style="background-color:{$ticket.statusColor}" {/if}>
            {$ticket.status|strip_tags}
          </span>
        </td>

        <!-- Last reply date -->
        <td class="table-cell">
          <!-- Hidden normalized date for sorting purposes -->
          <span class="w-hidden">{$ticket.normalisedLastReply}</span>
          <!-- Human-readable last reply date -->
          {$ticket.lastreply}
        </td>
      </tr>
      {/foreach}
    </tbody>
  </table>

  <!-- Loading indicator (shown while DataTable initializes) -->
  <div class="text-center" id="tableLoading">
    <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
  </div>