% import datetime
% import urllib

% rebase('main_page.tpl', title="CardboardBot")

<div class="row">
  <div class="small-12 columns">
    <h2><a href="/stats">Statistics</a></h2>
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
    <h2><a href="/log">Last messages</a></h2>
    <table style="width: 100%">
      <thead>
        <tr class="row">
          <th class="small-3 medium-2 columns">Timestamp</th>
          <th class="small-3 medium-2 columns">Sender</th>
          <th class="small-6 medium-8 columns">Message</th>
        </tr>
      </thead>
      <tbody>
        <%
        for row in logs:
        date = datetime.datetime.fromtimestamp(row[0])
        datestring = date.strftime("%d/%m/%Y %H:%M:%S")
        sender = row[1]
        message = row[2]
        %>
        <tr class="row">
          <td class="small-3 medium-2 columns">{{datestring}}</td>
          <td class="small-3 medium-2 columns">{{sender}}</td>
          <td class="small-6 medium-8 columns">{{message}}</td>
        </tr>
        % end
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2><a href="/links">Last links</a></h2>
    <table style="width: 100%">
      <thead>
        <tr class="row">
          <th class="small-3 medium-2 columns">Timestamp</th>
          <th class="small-3 medium-2 columns">Sender</th>
          <th class="small-6 medium-8 columns">Link</th>
        </tr>
      </thead>
      <tbody>
      <%
      for row in links:
      date = datetime.datetime.fromtimestamp(row[0])
      datestring = date.strftime("%d/%m/%Y %H:%M:%S")
      sender = row[1]
      url = "http://www.dereferer.org/?" + urllib.quote_plus(row[2])
      title = row[3]
      %>
        <tr class="row">
          <td class="small-3 medium-2 columns">{{datestring}}</td>
          <td class="small-3 medium-2 columns">{{sender}}</td>
          <td class="small-6 medium-8 columns"><a href="{{url}}" target="_blank">{{title}}</a></td>
        </tr>
      % end
      </tbody>
    </table>
  </div>
</div>