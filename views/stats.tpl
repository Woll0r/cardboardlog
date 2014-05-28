% rebase('main_page.tpl', title="CardboardBot Stats")

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
    <ul class="medium-block-grid-2 large-block-grid-3">
      <li>
	    <div class="panel radius">
          <h3>Messages</h3>
          <ol>
          % for row in messages:
          % percent = "{0:.2f}".format((row[1]/float(messagecount))*100)
            <li><span data-tooltip class="has-tip tip-bottom round" title="{{row[1]}} messages for {{percent}}% of total">{{row[0]}}</span></li>
          % end
          </ol>
        </div>
	  </li>
	  <li>
        <div class="panel radius">
          <h3>Links</h3>
          <ol>
          % for row in links:
          % percent = "{0:.2f}".format((row[1]/float(linkcount))*100)
            <li><span data-tooltip class="has-tip tip-bottom round" title="{{row[1]}} messages for {{percent}}% of total">{{row[0]}}</span></li>
          % end
          </ol>
        </div>
	  </li>
	  <li>
        <div class="panel radius">
          <h3>Link/message ratio</h3>
          <ol>
          % for row in messagelinkratio:
          % ratio = "{0:.2f}".format(row[1])
            <li><span data-tooltip class="has-tip tip-bottom round" title="{{ratio}}% of messages were links">{{row[0]}}</span></li>
          % end
          </ol>
        </div>
	  </li>
	</ul>
  </div>
</div>