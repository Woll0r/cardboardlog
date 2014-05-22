% import datetime
<div class="row">
  <div class="small-12 columns">
    <!--
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
	-->
	<table>
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