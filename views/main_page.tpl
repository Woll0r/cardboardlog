<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{title or 'No title'}}</title>
    <link rel="stylesheet" href="/static/css/foundation.css" />
	<link rel="stylesheet" href="/static/css/pizza.css" />
    <script src="/static/js/vendor/modernizr.js"></script>
  </head>
  <body>
    <nav class="top-bar" data-topbar>
      <ul class="title-area">
        <li class="name">
          <h1><a href="/">CardboardLog</a></h1>
        </li>
      </ul>

      <section class="top-bar-section">
        <ul class="left">
          <li><a href="/log">Chat logs</a></li>
		  <li><a href="/links">Links</a></li>
		  <li><a href="/stats">Statistics</a></li>
        </ul>
      </section>
    </nav>
	
	{{!base}}
    
	<footer class="row" style="max-width: 100%">
    <hr>
    <div class="large-12 columns">
      <ul class="inline-list right">
	    <li>
        <li>
          <a href="https://github.com/Woll0r/cardboardbot">Cardboardbot on Github</a>
        </li>
		<li>
		  <a href="https://github.com/Woll0r/cardboardlog">Cardboardlog on Github</a>
		</li>
      </ul>
    </div>
  </footer>
	
    <script src="/static/js/vendor/jquery.js"></script>
    <script src="/static/js/foundation.min.js"></script>
	<script src="/static/js/vendor/dependencies.js"></script>
	<script src="/static/js/pizza.min.js"></script>
    <script>
	  Pizza.init();
      $(document).foundation();
    </script>
  </body>
</html>
