/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html


pub value struct html-page<e>
  page-head : (ev<html-layout<e>>) -> <html-tree|e> ()
  page-body : (ev<html-layout<e>>) -> <html-tree|e> ()

pub val web-tmpl-basic : some<e> html-page<<pure|e>> = Html-page(
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

pub named effect html-layout<e>
  fun set-body-begin-scripts(begin-scrip: () -> <html-tree|e> ()): ()
  fun set-body-end-scripts(end-scrip: () -> <html-tree|e> ()): ()
  fun set-body-content(content: () -> <html-tree|e> ()): ()
  fun set-page-title(title: string): ()
  fun page-title(): string
  fun body-content(): (() -> <html-tree|e> ())
  fun body-begin-scripts(): (() -> <html-tree|e> ())
  fun body-end-scripts(): (() -> <html-tree|e> ())

fun defaultpage(action: ev<html-layout<<pure|e>>> -> <pure|e> a) : <pure|e> a
  var begin := fn()
    src/script("/init-page.js")
  var end := fn()
    src/script("/site.js")
  var body := fn(){()}
  var title := "Default Page"
  with layout <- named handler
    fun set-body-begin-scripts(b)
      begin := b
    fun set-body-end-scripts(e)
      end := e
    fun set-body-content(c)
      body := c
    fun set-page-title(t)
      title := t
    fun page-title()
      title
    fun body-content()
      body
    fun body-begin-scripts()
      begin
    fun body-end-scripts()
      end
  action(layout)

pub fun layout-html(
  page: html-page<<pure|e>>,
  layout: ev<html-layout<<pure|e>>>
) : <pure|e> component
  html
    page-head(page)(layout)
    page-body(page)(layout)
