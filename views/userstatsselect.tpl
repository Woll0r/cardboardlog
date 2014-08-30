% rebase('main_page.tpl', title="CardboardBot User Stats", stats=0)

<div class="row">
  <div class="small-12 columns">
	<ul>
	% for user in users:
	  <ul><a href="/stats/user/{{user.jid}}">{{user.nick}}</a></ul>
	% end
	</ul>
  </div>
</div>