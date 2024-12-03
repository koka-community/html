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
    body-content: (?self: page<e>) -> <component-builder|e> (),
    body-begin-scripts: (?self: page<e>) -> <component-builder|e> (),
    body-end-scripts: (?self: page<e>) -> <component-builder|e> (),
    page-head: (?self: page<e>) -> <component-builder|e> (),
    page-body: (?self: page<e>) -> <component-builder|e> ()
  )

pub val tmpl/default : forall<e> page<e> = Page(
  page-title = "Default Page"
  , body-content = fn(?self)
      ()
  , body-begin-scripts = fn(?self)
      src/script("/init-page.js")
  , body-end-scripts = fn(?self)
      src/script("/site.js")
  , page-head = fn(?self)
      head
        meta("charset", "UTF-8")
        link("icon", "image/png", "icons/favicon.png")
        title
          text(self.page-title)
  , page-body = fn(?self)
      body
        self.body-begin-scripts()()
        self.body-content()()
        self.body-end-scripts()()
)

pub fun html/layout(self: page<e>) : e component
  html
    self.page-head()()
    self.page-body()()
