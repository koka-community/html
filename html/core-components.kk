/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html-builder

fun component/div(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  nested/component("div", classes=classes, build-tree=build-tree)

fun component/br(): <html-tree> ()
  register-child(Component("br"))

fun component/text(s: string): <html-tree> ()
  register-child(InnerHtml(s))

fun component/span(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  nested/component("span", classes=classes, build-tree=build-tree)
