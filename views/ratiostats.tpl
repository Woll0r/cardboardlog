% rebase('main_page.tpl', title="CardboardBot Ratio Stats", stats=1, included="graphsratio.tpl")

<div class="row">
  <div class="small-12 columns">
    <table>
	  <thead>
	    <tr>
		  <th>Name</th>
		  <th>Ratio</th>
		</tr>
	  </thead>
	  <tbody>
	  % for row in messagelinkratio:
      % ratio = "{0:.2f}".format(row[1])
        <tr>
	      <td>{{row[0]}}</td>
		  <td>{{ratio}}</td>
	    </tr>
      % end
	  </tbody>
	</table>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
	<div id="linksratiochart"></div>
  </div>
</div>