<!DOCTYPE html>
{{framework "static/lib/mod.js"}}
<html>
<head>
    <title>Martini FIS</title>
</head>
<body>

    {{template "widget/header/header.tpl"}}
    
    <p>
        Hello, Martini
    </p>

    <script>

    var test = require('widget/test.js');
    test.init();

    </script>
    {{require "page/index.tpl"}}
</body>
</html>