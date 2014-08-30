% rebase('main_page.tpl', title="CardboardBot User Stats: " + nick, stats=1, included="graphsuser.tpl")

<div class="row">
  <div class="small-12 columns">
    <ul class="small-block-grid-2 medium-block-grid-3 large-block-grid-4">
      <li>
        <div class="panel radius text-center">
          <h1>{{messagecount}}</h1>
          <p>Messages</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
          <h1>{{linkcount}}</h1>
          <p>Links</p>
        </div>
      </li>
      <li>
        <div class="panel radius text-center">
		  % linkpercentage = "{0:.2f}".format((linkcount/float(messagecount))*100)
          <h1>{{linkpercentage}}</h1>
          <p>Link ratio</p>
        </div>
      </li>
    </ul>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2>Domains</h2>
  </div>
</div>
<div class="row" data-equalizer>
  <div class="small-12 medium-3 columns">
	<div class="panel radius" data-equalizer-watch>
      <ol>
      % for row in domains:
      % percent = "{0:.2f}".format((row[1]/float(linkcount))*100)
        <li><span data-tooltip class="has-tip tip-bottom round" title="{{row[1]}} links for {{percent}}% of total">{{row[0]}}</span></li>
      % end
      </ol>
    </div>
  </div>
  <div class="medium-9 columns show-for-medium-up">
	<div id="domainschart" data-equalizer-watch></div>
  </div>
</div>