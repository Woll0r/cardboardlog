% rebase('main_page.tpl', title='CardboardBot Links')
% import datetime

<div class="row">
  <div class="large-12 columns">
    <h1>CardboardBot links</h1>
    <table>
	  <tr>
	    <th>Timestamp</th>
		<th>Sender</th>
		<th>Link</th>
	  </tr>
	  <%
	    for row in data:
	    date = datetime.datetime.fromtimestamp(row[0])
		datestring = date.strftime("%x %X")
	    sender = row[1]
	    url = row[2]
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