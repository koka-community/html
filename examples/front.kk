/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html

import html/layout

// todo: this deserves a PR to go into std/core?
fun do(action : () -> e a) : e a
  action()

struct cnode
  swarm : string
  ip : string
  ncores : int
  avail-ram : int
  total-ram : int

effect val cnodes-info : list<cnode>

fun frontpage(): <pure,cnodes-info> component
  val template = tmpl/basic(page-head = fn(layout) {
    page-head(tmpl/basic)(layout)
    link("stylesheet", "text/css", "/front.css")
  })
  val title = "The Front Page"

  with super <- default()
  with page <- named handler
    fun page-title() title
    fun body-content()
      with build
      h3
        text(title)
        // todo: text("&nbsp;") might work in current early stage,
        //       but `text()` should really escape HTML sequences,
        //       then we'll need a `raw()` HTML function in parallel,
        //       and ultimately we'd better add the `fun nbsp() {raw("&nbsp;")}` 
        // nbsp()
        span
          add-attr("style", "font-size: 70%;")
          a("/data.csv")
            text("download csv")
      table
        thead
          tr
            th
              text("Swarm")
            th
              text("IP")
            th
              text("#CPU Cores")
            th
              text("RAM")
        tbody
          with ci <- cnodes-info.foreach
          tr
            td
              text(ci.swarm)
            td
              text(ci.ip)
            td
              text(ci.ncores.show)
            td
              text(ci.avail-ram.show ++ "/" ++ ci.total-ram.show)
    fun body-begin-scripts()
      super.body-begin-scripts()
    fun body-end-scripts()
      with build
      register-child(super.body-end-scripts())
      src/script("/front.js")

  layout(template, page)

fun main()
  val page = do
    with val cnodes-info = [
      Cnode("dev", "192.168.11.50", 8, 16, 30),
      Cnode("dev", "192.168.11.51", 8, 18, 30),
      Cnode("gpu01", "192.168.11.20", 8, 65, 128),
      Cnode("gpu02", "192.168.11.21", 8, 90, 128),
    ]
    frontpage()
  println(page.show)
