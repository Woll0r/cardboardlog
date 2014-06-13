% rebase('main_page.tpl', title="CardboardBot Message Stats", stats=1, included="graphsdomains.tpl")

<div class="row">
  <div class="small-12 columns">
	<div id="domainschart" style="height: 35em;"></div>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <table style="width: 100%;">
	  <thead>
	    <tr>
		  <th>Domain</th>
		  <th>Links</th>
		  <th>Percentage</th>
		</tr>
	  </thead>
	  <tbody>
	  % for row in domains:
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