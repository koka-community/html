/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html


pub effect val page-title : string

pub effect fun body-begin-scripts() : component
  // : <html-tree|e> () // an explicit effect in result type of an operation is not allowed (yet)
pub effect fun body-content() : component
pub effect fun body-end-scripts() : component


pub value struct html-page
  page-head : () -> <html-effects,html-tree> ()
  page-body : () -> <html-effects,html-tree> ()

pub val web-tmpl-basic : html-page = Html-page(
  {
    head
      meta("charset", "UTF-8")
      link("icon", "image/png", "icons/favicon.png")
      title
        text(page-title)
  },{
    body
      register-child(body-begin-scripts())
      register-child(body-content())
      register-child(body-end-scripts())
  }
)

pub alias html-effects = <body-begin-scripts, body-content, body-end-scripts, page-title>

pub fun layout-html(
  page : html-page,
  create-component : (() -> <html-effects|e> component) -> <html-effects|e> component
) : e component

  with val page-title = "?!?"
  with fun body-begin-scripts() {build(fn() ())}
  with fun body-content() {build(fn() ())}
  with fun body-end-scripts() {build(fn() ())}
  create-component
    html
      page-head(page)()
      page-body(page)()
