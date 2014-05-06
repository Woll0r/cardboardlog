<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{title or 'No title'}}</title>
    <link rel="stylesheet" href="/static/css/foundation.css" />
	<link rel="stylesheet" href="/static/css/foundation-icons.css" />
    <script src="/static/js/vendor/modernizr.js"></script>
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
          <li><a href="/stats">Statistics</a></li>
        </ul>
      </section>
    </nav>
    
	<div class="row">
	  <div class="small-12 columns">
	    <h1>{{title or 'No title'}}</h1>
	  </div>
	</div>
    <div id="contents">&nbsp;</div>
    
    <footer class="row" style="max-width: 100%">
    <hr>
    <div class="small-12 columns">
      <ul class="inline-list right">
        <li>
          <a href="https://github.com/Woll0r/cardboardbot"><i class="fi-github"></i> Cardboardbot</a>
        </li>
        <li>
          <a href="https://github.com/Woll0r/cardboardlog"><i class="fi-github"></i> Cardboardlog</a>
        </li>
      </ul>
    </div>
  </footer>
    
    <script src="/static/js/vendor/jquery.js"></script>
    <script src="/static/js/foundation.min.js"></script>
    <script src="/static/js/foundation/foundation.topbar.js"></script>
    <script>
	    $(document).foundation();
		
		function autorefresh() {
			$('#contents').load('{{page}}');
		}
		setInterval('autorefresh()', {{refreshrate}});
		
		autorefresh();
    </script>
  </body>
</html>
