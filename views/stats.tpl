% rebase('main_page.tpl', title="CardboardBot Stats", stats=1, included="graphsall.tpl")

<div class="row">
  <div class="small-12 columns">
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
    <h2><a href="/stats/messages">Messages</a></h2>
  </div>
</div>
<div class="row" data-equalizer>
  <div class="small-12 medium-3 columns">
	<div class="panel radius" data-equalizer-watch>
      <ol>
      % for row in messages:
      % percent = "{0:.2f}".format((row[1]/float(messagecount))*100)
        <li><span data-tooltip class="has-tip tip-bottom round" title="{{row[1]}} messages for {{percent}}% of total">{{row[0]}}</span></li>
      % end
      </ol>
    </div>
  </div>
  <div class="medium-9 columns show-for-medium-up">
	<div id="messageschart" data-equalizer-watch></div>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2><a href="/stats/links">Links</a></h2>
  </div>
</div>
<div class="row" data-equalizer>
  <div class="small-12 medium-3 columns">
	<div class="panel radius" data-equalizer-watch>
      <ol>
      % for row in links:
      % percent = "{0:.2f}".format((row[1]/float(linkcount))*100)
        <li><span data-tooltip class="has-tip tip-bottom round" title="{{row[1]}} links for {{percent}}% of total">{{row[0]}}</span></li>
      % end
      </ol>
    </div>
  </div>
  <div class="medium-9 columns show-for-medium-up">
	<div id="linkschart" data-equalizer-watch></div>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2><a href="/stats/ratio">Link ratio</a></h2>
  </div>
</div>
<div class="row" data-equalizer>
  <div class="small-12 medium-3 columns">
	<div class="panel radius" data-equalizer-watch>
      <ol>
      % for row in messagelinkratio:
      % ratio = "{0:.2f}".format(row[1])
        <li><span data-tooltip class="has-tip tip-bottom round" title="{{ratio}}% of messages were links">{{row[0]}}</span></li>
      % end
      </ol>
    </div>
  </div>
  <div class="medium-9 columns show-for-medium-up">
	<div id="linksratiochart" data-equalizer-watch></div>
  </div>
</div>
<div class="row">
  <div class="small-12 columns">
    <h2><a href="/stats/domains">Domains</a></h2>
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
<div class="row">
  <div class="small-12 columns">
    <h2>Hourly activity</h2>
  </div>
</div>
<div class="row">
  <div class="small-12">
    <div id="hourschart" style="height: 400px;"></div>
  </div>
</div>