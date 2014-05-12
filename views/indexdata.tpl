% import datetime
% import urllib

<div class="row">
  <div class="small-12 columns">
    <h2>Statistics</h2>
    <ul class="small-block-grid-2 medium-block-grid-3 large-block-grid-4">
      <li>
        <div class="panel radius text-center">
          <h1>{{messagecount}}</h1>
          <p>Messages processed</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{cardboardbotmessagecount}}</h1>
          <p>Responses given</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{linkcount}}</h1>
          <p>Links processed</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{linkpercentage}}%</h1>
          <p>Percentage of links</p>
        </div>
      </li>
    </ul>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2>Last messages</h2>
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
      for row in logs:
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
<div class="row">
  <div class="small-12 columns">
    <h2>Last links</h2>
    <div class="row" style="margin-bottom: 10px;">
      <div class="small-3 medium-2 columns">
        <strong>Timestamp</strong>
	  </div>
	  <div class="small-3 medium-2 columns">
        <strong>Sender</strong>
	  </div>
	  <div class="small-6 medium-8 columns">
        <strong>Link</strong>
      </div>
	</div>
    <%
      for row in links:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%x %X")
      sender = row[1]
      url = "http://www.dereferer.org/?" + urllib.quote_plus(row[2])
      title = row[3]
    %>
    <div class="row" style="margin-bottom: 10px;">
	  <div class="small-3 medium-2 columns">
	    {{datestring}}
      </div>
	  <div class="small-3 medium-2 columns">
	    {{sender}}
	  </div>
	  <div class="small-6 medium-8 columns">
	    <a href="{{url}}" target="_blank">{{title}}</a>
	  </div>
	</div>
    % end
  </div>
</div>

<!-- Foundation init, executed when jQuery loads the page -->
<script>
  $(document).foundation();
</script>