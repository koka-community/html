/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
module html/layout

import html/html

pub rec type page<e>
  Page(
    page-title: string,
    body-content: (?self: page<e>) -> e component,
    body-begin-scripts: (?self: page<e>) -> e component,
    body-end-scripts: (?self: page<e>) -> e component,

    page-head: (?self: page<e>) -> <html-tree|e> (),
    page-body: (?self: page<e>) -> <html-tree|e> ()
  )

pub val tmpl/default : forall<e> page<e> = Page(
  page-title = "Default Page"
  , body-content = fn(?self)
      with build
      ()
  , body-begin-scripts = fn(?self)
      with build
      src/script("/init-page.js")
  , body-end-scripts = fn(?self)
      with build
      src/script("/site.js")
  , page-head = fn(?self)
      head
        meta("charset", "UTF-8")
        link("icon", "image/png", "icons/favicon.png")
        title
          text(self.page-title)
  , page-body = fn(?self)
      body
        register-child(body-begin-scripts(self)())
        register-child(body-content(self)())
        register-child(body-end-scripts(self)())
    // : <html-tree|e> () // how to type-anno a lambda fn?
)

pub fun html/layout(self: page<e>) : <pure|e> component
  html
    page-head(self)()
    page-body(self)()
