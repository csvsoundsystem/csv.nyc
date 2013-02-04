#!/bin/sh

name=$(mktemp)
twitter=$(mktemp)
web=$(mktemp)

# Add links.
cut -d, -f1,2 soundsystem.csv > $name
cut -d, -f3 soundsystem.csv | sed '2,$ s_^\(..*\)_<a href="https://twitter.com/\1/">\1</a>_' > $twitter
cut -d, -f4 soundsystem.csv |sed '2,$ s_^\(..*\)_<a href="\1">\1</a>_' > $web

echo '<html>
  <head>
    <style>
    * { margin: 0; padding: 0; width: 100%; height: 100%; }
    a, a:visited, a:active, a:hover { color: inherit; text-decoration: inherit; }
    a:hover { color: #444; }
    </style>
  </head>
  <body>
    <pre>'
paste -d, $name $twitter $web
echo '    </pre>
    <!-- Piwik --> 
    <script type="text/javascript">
    var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.thomaslevine.com/" : "http://piwik.thomaslevine.com/");'
    echo "document.write(unescape(\"%3Cscript src='\" + pkBaseURL + \"piwik.js' type='text/javascript'%3E%3C/script%3E\"));"
echo '    </script><script type="text/javascript">
    try {
    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 14);
    piwikTracker.trackPageView();
    piwikTracker.enableLinkTracking();
    } catch( err ) {}
    </script><noscript><p><img src="http://piwik.thomaslevine.com/piwik.php?idsite=14" style="border:0" alt="" /></p></noscript>
    <!-- End Piwik Tracking Code -->
  </body>
</html>'
