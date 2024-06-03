/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html

import html/layout

fun do(action : () -> e a) : e a
  action()

fun main()
  val page = web-tmpl-basic(page-head = {
    page-head(web-tmpl-basic)()
    link("stylesheet", "text/css", "/front.css")
  })

  val cmpt = do
    with create-component <- layout-html(page)

    with val page-title = "The Front Page"

    with fun body-content()
      h3
        text(page-title)
        // nbsp
        span
          add-attr("style", "font-size: 70%;")
          a("/data.csv")
            text("download csv")
      table
        thead
          tr
            th
              text("Col A")
            th
              text("Col B")
            th
              text("Col C")
        tbody
          with row <- list(1,5).foreach
          tr
            td
              text("Cell A" ++ row.show)
            td
              text("Cell B" ++ row.show)
            td
              text("Cell C" ++ row.show)

    with fun body-end-scripts()
      mask<body-end-scripts>
      body-end-scripts()
      src/script("/front.js")

    create-component()

  println(cmpt.show)
