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


value struct cnode
  swarm : string
  ip : string
  ncores : int
  avail-ram : int
  total-ram : int

effect val cnodes-info : list<cnode>

fun front() : <cnodes-info> component

  /* todo: a PR to introduce the `super` keyword, to be used in record-updates?
          val page = basic-template(page-head = {
            page-head(super)()
            link("stylesheet", "text/css", "/front.css")
          })
  */
  val tmpl = basic-template(page-head = {
    page-head(basic-template)()
    link("stylesheet", "text/css", "/front.css")
  })

  with create-component <- layout-html(tmpl)
  // customization to the page template follows

  with val page-title = "The Front Page"

  with fun body-content() // admit no content from the template, fresh new here
    h3
      text(page-title)
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

  with fun body-end-scripts()
    // possibly prepand special contents for this page here

    do // include default contents from the template
      mask<body-end-scripts>
      body-end-scripts()

    // append special contents for this page
    src/script("/front.js")

  // materialize the page template with effective customization above
  create-component()


fun main()
  val page = do
    with val cnodes-info = [
      Cnode("dev", "192.168.11.50", 8, 30),
      Cnode("dev", "192.168.11.51", 8, 30),
      Cnode("gpu01", "192.168.11.20", 8, 128),
      Cnode("gpu02", "192.168.11.21", 8, 128),
    ]
    front()

  println(page.show)
