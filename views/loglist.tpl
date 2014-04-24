% rebase('main_page.tpl', title='CardboardBot Logs')
% import datetime

<div class="row">
  <div class="large-12 columns">
    <h1>CardboardBot logging</h1>
    <table>
      <tr>
        <th>Timestamp</th>
        <th>Sender</th>
        <th>Message</th>
      </tr>
      <%
        for row in data:
        date = datetime.datetime.fromtimestamp(row[0])
        datestring = date.strftime("%x %X")
        sender = row[1]
        message = row[2]
      %>
      <tr>
        <td style="white-space: nowrap">{{date}}</td>
        <td style="white-space: nowrap">{{sender}}</td>
        <td>{{message}}</td>
      </tr>
      % end
    </table>
  </div>
</div>