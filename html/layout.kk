/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html

pub named effect html-layout<e>
  fun page-title(): string
  fun body-content(): (() -> <html-tree|e> ())
  fun body-begin-scripts(): (() -> <html-tree|e> ())
  fun body-end-scripts(): (() -> <html-tree|e> ())

pub value struct html-page<e>
  page-head : (ev<html-layout<e>>) -> <html-tree|e> ()
  page-body : (ev<html-layout<e>>) -> <html-tree|e> ()

pub val web-tmpl-basic : forall<e> html-page<<pure|e>> = Html-page(
  fn(pg) {
    head
      meta("charset", "UTF-8")
      link("icon", "image/png", "icons/favicon.png")
      title
        text(pg.page-title())
  },fn(pg) {
    body
      pg.body-begin-scripts()()
      pg.body-content()()
      pg.body-end-scripts()()
  }
)

fun defaultpage(action: ev<html-layout<<pure|e>>> -> <pure|e> a) : <pure|e> a
  val begin = fn()
    src/script("/init-page.js")
  val end = fn()
    src/script("/site.js")
  val body = fn(){()}
  val title = "Default Page"
  with layout <- named handler
    fun page-title() title
    fun body-content() body
    fun body-begin-scripts() begin
    fun body-end-scripts() end
  action(layout)

pub fun layout-html(
  page: html-page<<pure|e>>,
  layout: ev<html-layout<<pure|e>>>
) : <pure|e> component
  html
    page-head(page)(layout)
    page-body(page)(layout)
