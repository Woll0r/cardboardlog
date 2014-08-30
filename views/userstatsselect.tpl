% rebase('main_page.tpl', title="CardboardBot User Stats", stats=0)

<div class="row">
  <div class="small-12 columns">
	<ul>
	% for user in users:
	  <li><a href="/stats/user/{{user[0]}}">{{user[1]}}</a></li>
	% end
	</ul>
  </div>
</div>