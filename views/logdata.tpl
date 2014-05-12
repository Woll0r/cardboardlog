% import datetime
<div class="row">
  <div class="small-12 columns">
    <div class="row" style="margin-bottom: 10px;">
      <div class="small-3 medium-2 columns">
        <strong>Timestamp</strong>
	  </div>
	  <div class="small-3 medium-2 columns">
        <strong>Sender</strong>
	  </div>
	  <div class="small-6 medium-8 columns">
        <strong>Message</strong>
      </div>
	</div>
    <%
      for row in data:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%x %X")
      sender = row[1]
      message = row[2]
    %>
	<div class="row" style="margin-bottom: 10px;">
	  <div class="small-3 medium-2 columns">
	    {{datestring}}
      </div>
	  <div class="small-3 medium-2 columns">
	    {{sender}}
	  </div>
	  <div class="small-6 medium-8 columns">
	    {{message}}
	  </div>
	</div>
    % end
  </div>
</div>

<!-- Foundation init, executed when jQuery loads the page -->
<script>
  $(document).foundation();
</script>