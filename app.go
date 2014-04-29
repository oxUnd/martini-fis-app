package main

import (
    "github.com/go-martini/martini"
    "github.com/xiangshouding/martini-middleware/fis"
)

func main() {
    m := martini.Classic()
    m.Use(martini.Static("public"))
    m.Use(fis.Renderer(fis.Options{
        Directory:  "template",
        Extensions: []string{".tpl"},
    }))

    m.Get("/", func(r fis.Render) {
        r.HTML(200, "page/index", "")
    })
    m.Run()
}
