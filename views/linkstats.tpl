% rebase('main_page.tpl', title="CardboardBot Link Stats", stats=1, included="graphslinks.tpl")

<div class="row">
  <div class="small-12 columns">
    <table>
	  <thead>
	    <tr>
		  <th>Name</th>
		  <th>Links</th>
		  <th>Percentage</th>
		</tr>
	  </thead>
	  <tbody>
	  % for row in links:
      % percent = "{0:.2f}".format((row[1]/float(linkcount))*100)
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
<div class="row">
  <div class="small-12 columns">
	<div id="linkschart"></div>
  </div>
</div>