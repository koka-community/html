/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
module html/layout

import html/html

pub named effect page
  fun page-title(): string
  fun body-content(): component
  fun body-begin-scripts(): component
  fun body-end-scripts(): component

pub value struct page-builder<e>
  page-head : (ev<page>) -> <html-tree|e> ()
  page-body : (ev<page>) -> <html-tree|e> ()

pub val tmpl/basic : forall<e> page-builder<<pure|e>> = Page-builder(
  fn(pg) {
    head
      meta("charset", "UTF-8")
      link("icon", "image/png", "icons/favicon.png")
      title
        text(pg.page-title())
  },fn(pg) {
    body
      register-child(pg.body-begin-scripts())
      register-child(pg.body-content())
      register-child(pg.body-end-scripts())
  }
)

pub fun page/default(action: ev<page> -> <pure|e> a) : <pure|e> a
  val begin =
    with build
    src/script("/init-page.js")
  val end =
    with build
    src/script("/site.js")
  val body = 
    with build
    ()
  val title = "Default Page"
  with layout <- named handler
    fun page-title() title
    fun body-content() body
    fun body-begin-scripts() begin
    fun body-end-scripts() end
  action(layout)

pub fun html/layout(
  page: page-builder<<pure|e>>,
  layout: ev<page>
) : <pure|e> component
  html
    page-head(page)(layout)
    page-body(page)(layout)
