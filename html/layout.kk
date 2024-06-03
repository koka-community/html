/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html


pub effect val page-title : string

pub effect fun body-begin-scripts() : ()
  // : <html-tree|e> () // an explicit effect in result type of an operation is not allowed (yet)
pub effect fun body-content() : ()
pub effect fun body-end-scripts() : ()


pub value struct html-page<e::E>
  page-head : () -> <html-tree|e> ()
  page-body : () -> <html-tree|e> ()

pub val web-tmpl-basic : html-page<<
    page-title,
    body-begin-scripts,
    body-content,
    body-end-scripts
>> = Html-page(
  ({
    head
      link("icon", "image/png", "icons/favicon.png")
      meta("charset", "UTF-8")
      title
        text(page-title)
  } : () -> <page-title,html-tree> ()),
  ({
    body
      body-begin-scripts()
      body-content()
      body-end-scripts()
  } : () -> <body-begin-scripts,body-content,body-end-scripts,html-tree> ())
)


pub fun layout-html(page : html-page<e>) : e component

  with val page-title = "?!?"

  with fun body-begin-scripts() {()}
  with fun body-content() {()}
  with fun body-end-scripts() {()}

/*
effects do not match
 inferred effect: $e
expected effect: <body-end-scripts|_e1>
*/
  html
    page-head(page)()
    page-body(page)()
