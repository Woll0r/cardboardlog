<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{title or 'No title'}}</title>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/normalize.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/css/foundation.min.css" />
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/vendor/modernizr.js"></script>
  </head>
  <body>
    <nav class="top-bar" data-topbar>
      <ul class="title-area">
        <li class="name">
          <h1><a href="/">CardboardLog</a></h1>
        </li>
		<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
      </ul>

      <section class="top-bar-section">
        <ul class="right">
		  <li class="divider"></li>
          <li><a href="/log">Chat logs</a></li>
		  <li class="divider"></li>
          <li><a href="/links">Links</a></li>
		  <li class="divider"></li>
          <li class="has-dropdown">
		    <a href="/stats">Statistics</a>
		    <ul class="dropdown">
			  <li><a href="/stats/messages">Messages</a></li>
			  <li><a href="/stats/links">Links</a></li>
			  <li><a href="/stats/ratio">Link ratio</a></li>
			  <li><a href="/stats/domains">Domains</a></li>
			  <li><a href="/stats/user">Users</a></li>
			</ul>
		  </li>
        </ul>
      </section>
    </nav>
    
	<div class="row">
	  <div class="small-12 columns">
	    <h1>{{title or 'No title'}}</h1>
	  </div>
	</div>
    <div id="contents"><div class="row"><div class="small-12 columns"><img alt="Loading" src="/static/img/loading.gif" /> Loading...</div></div></div>
    
    <footer class="row" style="max-width: 100%">
    <hr>
    <div class="small-12 columns">
      <ul class="inline-list right">
        <li>
          <a href="https://github.com/Woll0r/cardboardbot"><i class="fi-social-github"></i> Cardboardbot</a>
        </li>
        <li>
          <a href="https://github.com/Woll0r/cardboardlog"><i class="fi-social-github"></i> Cardboardlog</a>
        </li>
      </ul>
    </div>
  </footer>
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/vendor/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation/foundation.topbar.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.2.2/js/foundation/foundation.tooltip.min.js"></script>
    <script>
		function autorefresh() {
			$('#contents').load('{{page}}');
		}
		setInterval('autorefresh()', {{refreshrate}});
		
		autorefresh();
    </script>
  </body>
</html>
