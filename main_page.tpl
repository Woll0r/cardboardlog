<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{{title or 'No title'}}</title>
    <link rel="stylesheet" href="/static/css/foundation.css" />
    <script src="/static/js/vendor/modernizr.js"></script>
  </head>
  <body>
    <nav class="top-bar" data-topbar>
      <ul class="title-area">
        <li class="name">
          <h1><a href="#">CardboardLog</a></h1>
        </li>
      </ul>

      <section class="top-bar-section">
        <ul class="left">
          <li><a href="/log">Chat logs</a></li>
		  <li><a href="/links">Links</a></li>
        </ul>
      </section>
    </nav>
	
	{{!base}}
    
    <script src="/static/js/vendor/jquery.js"></script>
    <script src="/static/js/foundation.min.js"></script>
    <script>
      $(document).foundation();
    </script>
  </body>
</html>
