% rebase('main_page.tpl', title='CardboardBot Statistics')

<div class="row">
  <div class="large-6 columns text-center">
	<h1>{{messagecount}}</h1>
	<p>Messages processed</p>
  </div>
  <div class="large-6 columns text-center">
	<h1>{{linkcount}}</h1>
	<p>Links processed</p>
  </div>
</div>
<div class="row">
  <div class="large-6 columns">
    <ol>
      % for row in mostmessages:
	  <li>{{row[0]}} with {{row[1]}} messages</li>
	  % end
    </ol>
  </div>
  <div class="large-6 columns">
	<ol>
      % for row in mostlinks:
	  <li>{{row[0]}} with {{row[1]}} links</li>
	  % end
    </ol>
  </div>
</div>