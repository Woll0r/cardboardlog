% import datetime
<div class="row">
  <div class="small-12 columns">
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
		for row in data:
		date = datetime.datetime.fromtimestamp(row[0])
		datestring = date.strftime("%x %X")
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

<!-- Foundation init, executed when jQuery loads the page -->
<script>
  $(document).foundation();
</script>