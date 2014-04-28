% rebase('main_page.tpl', title='CardboardBot Links')
% import datetime
% import urllib

<div class="row">
  <div class="small-12 columns">
    <h1>CardboardBot links</h1>
    <div class="row" style="margin-bottom: 10px;">
      <div class="small-2 columns">
        <strong>Timestamp</strong>
	  </div>
	  <div class="small-2 columns">
        <strong>Sender</strong>
	  </div>
	  <div class="small-8 columns">
        <strong>Link</strong>
      </div>
	</div>
    <%
      for row in data:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%x %X")
      sender = row[1]
      url = "http://www.dereferer.org/?" + urllib.quote_plus(row[2])
      title = row[3]
    %>
    <div class="row" style="margin-bottom: 10px;">
	  <div class="small-2 columns">
	    {{datestring}}
      </div>
	  <div class="small-2 columns">
	    {{sender}}
	  </div>
	  <div class="small-8 columns">
	    <a href="{{url}}" target="_blank">{{title}}</a>
	  </div>
	</div>
    % end
  </div>
</div>