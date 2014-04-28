% rebase('main_page.tpl', title='CardboardBot Logs')
% import datetime

<div class="row">
  <div class="small-12 columns">
    <h1>CardboardBot logging</h1>
    <div class="row" style="margin-bottom: 10px;">
      <div class="small-2 columns">
        <strong>Timestamp</strong>
	  </div>
	  <div class="small-2 columns">
        <strong>Sender</strong>
	  </div>
	  <div class="small-8 columns">
        <strong>Message</strong>
      </div>
	</div>
    <%
      for row in logs:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%x %X")
      sender = row[1]
      message = row[2]
    %>
	<div class="row" style="margin-bottom: 10px;">
	  <div class="small-2 columns">
	    {{datestring}}
      </div>
	  <div class="small-2 columns">
	    {{sender}}
	  </div>
	  <div class="small-8 columns">
	    {{message}}
	  </div>
	</div>
    % end
  </div>
</div>