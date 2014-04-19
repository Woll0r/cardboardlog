% rebase('main_page.tpl', title='CardboardBot Statistics')

<div class="row">
  <div class="large-12 columns">
    <ul class="small-block-grid-4">
	  <li>
	    <div class="panel radius text-center">
	      <h1>{{messagecount}}</h1>
	      <p>Messages processed</p>
	    </div>
	  </li>
	  <li>
	    <div class="panel radius text-center">
	      <h1>{{linkcount}}</h1>
	      <p>Links processed</p>
	    </div>
	  </li>
	  <li>
	    <ul data-bar-id="most-messages-chart">
          % for row in mostmessages:
		  <li data-value="{{row[1]}}">{{row[0]}}</li>
		  % end
        </ul>
        <div id="most-messages-chart"></div>
	  </li>
	  <li>
	    <ul data-bar-id="most-links-chart">
          % for row in mostlinks:
		  <li data-value="{{row[1]}}">{{row[0]}}</li>
		  % end
        </ul>
        <div id="most-links-chart"></div>
	  </li>
  </div>
</div>