martini-fis-app
================

在go语言的martini-framwork环境下使用fis


### 安装

#### 安装gois

```
$ npm install -g gois
```
`gois` 扩展自[fis][0]，包含FIS的全部功能，包括添加md5、cdn、打包等等，详细请见FIS。


#### 安装fis的martini-middleware

```
$ go get github.com/go-martini/martini
$ go get github.com/xiangshouding/martini-middleware/fis
```

[martini-middleware/fis](https://github.com/xiangshouding/martini-middleware) 修改并重新发布了[render][1]，并包含所有render的方法。其中
添加了一些模板函数。

#### 下载demo

```
git clone https://github.com/xiangshouding/martini-fis-app.git
```

### 使用

```bash

➜  martini-fis-app git:(master) ✗ tree -L 1
.
├── README.md
├── app.go
├── public
├── src
└── template

```

#### 编译发布

src 目录下是FIS项目源码，编译后产出到public和template两个目录下。

```bash
$ gois release -d remote
```

#### app.go

app.go 是使用martini写的web程序；

```go
package main

import (
    "github.com/go-martini/martini"
    "github.com/xiangshouding/martini-middleware/fis" //引入FIS
)

func main() {
    m := martini.Classic()
    m.Use(martini.Static("public"))     //设置静态资源目录

    //martini使用FIS martini-middleware
    m.Use(fis.Renderer(fis.Options{
        Directory:  "template",         //设置模板目录
        Extensions: []string{".tpl"},   //设置模板扩展
    }))

    m.Get("/", func(r fis.Render) {
        r.HTML(200, "page/index", "")   //渲染模板
    })

    m.Run()
}

```

#### 运行

```bash
$ go run app.go
```

#### 访问

浏览器访问 [](http://127.0.0.1:3000) 查看效果


### 开发

#### javascript

widget 目录下的js都会被组件化；

| 源码 | 编译后 |
|:-----|:-------|
|console.log('test');|define('widget/test.js', function(require, exports, module){console.log('test');});

#### tpl

```html
{{framework "mod.js"}} //引入组件化库
{{require "widget/test.js"}} //页面加载test.js

<script>
var testjs = "{{uri `widget/test.js`}}" //动态加载test.js
</script>
```

静态资源在`</head>`前加载

### 扩展阅读

* [](fis.baidu.com)
* [](http://fex.baidu.com/blog/2014/04/fis-static-resource-management/)

[0]: https://github.com/fex-team/fis "fex-team/fis"
[1]: https://github.com/martini-contrib/render "martini-contrib/render"
