% rebase('main_page.tpl', title='CardboardBot Statistics')

<div class="row">
  <div class="large-6 columns">
	    <div class="panel radius text-center">
	      <h1>{{messagecount}}</h1>
	      <p>Messages processed</p>
	    </div>
  </div>
  <div class="large-6 columns">
	    <div class="panel radius text-center">
	      <h1>{{linkcount}}</h1>
	      <p>Links processed</p>
	    </div>
  </div>
</div>
<div class="row">
  <div class="large-6 columns">
    <ul data-bar-id="most-messages-chart">
      % for row in mostmessages:
	  <li data-value="{{row[1]}}">{{row[0]}}</li>
	  % end
    </ul>
    <div id="most-messages-chart"></div>
  </div>
  <div class="large-6 columns">
	    <ul data-bar-id="most-links-chart">
          % for row in mostlinks:
		  <li data-value="{{row[1]}}">{{row[0]}}</li>
		  % end
        </ul>
        <div id="most-links-chart"></div>
  </div>
</div>