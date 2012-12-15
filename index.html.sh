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
    </style>
  </head>
  <body>
    <pre>'
paste -d, $name $twitter $web
echo '    </pre>
  <script>
  window.location.href = "soundsystem.csv";
  </script>
  </body>
</html>'
