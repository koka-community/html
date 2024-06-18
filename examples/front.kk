/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html

import html/layout
import html/static-builder

struct cnode
  swarm : string
  ip : string
  ncores : int
  avail-ram : int
  total-ram : int

effect val cnodes-info : list<cnode>

pub val frontpage = 
  val super = tmpl/default
  super(
    page-title = "The Front Page",
    page-head = fn(?self)
      super.page-head()()
      link("stylesheet", "text/css", "/front.css")
    , 
    body-content = fn(?self)
      h3
        text(self.page-title)
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
    , 
    body-end-scripts = fn(?self)
      super.body-end-scripts()()
      src/script("/front.js")
  )

fun main()
  val page =
    with val cnodes-info = [
      Cnode("dev", "192.168.11.50", 8, 16, 30),
      Cnode("dev", "192.168.11.51", 8, 18, 30),
      Cnode("gpu01", "192.168.11.20", 8, 65, 128),
      Cnode("gpu02", "192.168.11.21", 8, 90, 128),
    ]
    html/layout(frontpage)
  println(page.show)
