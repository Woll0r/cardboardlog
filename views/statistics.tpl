% rebase('main_page.tpl', title='CardboardBot Statistics')

<div class="row">
  <div class="large-12 columns">
    <ul class="small-block-grid-2">
      <li>
        <div class="panel text-center">
	      <h1>{{messagecount}}</h1>
	      <p>Messages processed</p>
        </div>
      </li>
      <li>
        <div class="panel text-center">
	      <h1>{{linkcount}}</h1>
	      <p>Links processed</p>
        </div>
      </li>
      <li>
        <ol>
          % for row in mostmessages:
	      <li>{{row[0]}} with {{row[1]}} messages</li>
	      % end
        </ol>
      </li>
      <li>
	    <ol>
          % for row in mostlinks:
	      <li>{{row[0]}} with {{row[1]}} links</li>
	      % end
        </ol>
      </li>
	  <li>
	    <div class="panel text-center">
		  <h1>{{linkpercentage}}%</h1>
		  <p>Percentage of links</p>
		</div>
      </li>
	</ul>
  </div>
</div>