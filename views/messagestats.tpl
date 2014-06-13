% rebase('main_page.tpl', title="CardboardBot Message Stats", stats=1, included="graphsmessages.tpl")

<div class="row">
  <div class="small-12 columns">
	<div id="messageschart" style="height: 15em;"></div>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <table style="width: 100%;">
	  <thead>
	    <tr>
		  <th>Name</th>
		  <th>Messages</th>
		  <th>Percentage</th>
		</tr>
	  </thead>
	  <tbody>
	  % for row in messages:
      % percent = "{0:.2f}".format((row[1]/float(messagecount))*100)
        <tr>
	      <td>{{row[0]}}</td>
		  <td>{{row[1]}}</td>
		  <td>{{percent}}</td>
	    </tr>
      % end
	  </tbody>
	</table>
  </div>
</div>
