<!DOCTYPE html>
{{framework "static/lib/mod.js"}}
<html>
<head>
    <title>{{.title}}</title>
</head>
<body>

    {{template "widget/header/header.tpl"}}
    
    <p>
        Hello, Martini
    </p>

    <script>

    var test = require('/widget/test.js');
    test.init();

    </script>
    {{require "page/index.tpl"}}
</body>
</html>