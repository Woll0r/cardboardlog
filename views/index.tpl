% rebase('main_page.tpl', title='CardboardBot')
% import datetime
% import urllib

<div class="row">
  <div class="small-12 columns">
    <h1>Cardboardbot</h1>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2>Statistics</h2>
    <ul class="small-block-grid-4">
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
    <div class="row">
      <div class="small-2 columns">
        <p><strong>Timestamp<strong></p>
	  </div>
	  <div class="small-2 columns">
        <p><strong>Sender</strong></p>
	  </div>
	  <div class="small-8 columns">
        <p><strong>Message</strong></p>
      </div>
	</div>
    <%
      for row in logs:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%x %X")
      sender = row[1]
      message = row[2]
    %>
	<div class="row">
	  <div class="small-2 columns">
	    <p>{{datestring}}</p>
      </div>
	  <div class="small-2 columns">
	    <p>{{sender}}</p>
	  </div>
	  <div class="small-8 columns">
	    <p>{{message}}</p>
	  </div>
	</div>
    % end
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2>Last links</h2>
    <table>
      <tr>
        <th>Timestamp</th>
        <th>Sender</th>
        <th>Link</th>
      </tr>
      <%
        for row in links:
        date = datetime.datetime.fromtimestamp(row[0])
        datestring = date.strftime("%x %X")
        sender = row[1]
        url = "http://www.dereferer.org/?" + urllib.quote_plus(row[2])
        title = row[3]
      %>
      <tr>
        <td style="white-space: nowrap">{{date}}</td>
        <td style="white-space: nowrap">{{sender}}</td>
        <td><a href="{{url}}" target="_blank">{{title}}</a></td>
      </tr>
      % end
    </table>
  </div>
</div>