/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

// Convenience helpers derived from core-components primitives.
// These are thin wrappers over component/add-attr that cover common patterns
// so callers don't need trailing build-tree blocks for self-closing elements.

import html-builder
import core-components

// Inject raw HTML content verbatim (e.g. a Madoko-generated body fragment).
pub inline fun raw-html(s: string): <component-builder|e> ()
  register-child(InnerHtml(s))

// <link rel="stylesheet" href="...">
pub inline fun stylesheet(href: string): <component-builder|e> ()
  component("link")
    add-attr("rel", "stylesheet")
    add-attr("href", href)

// <script src="..."> with optional defer
pub inline fun script-src(src: string, defer: bool = False): <component-builder|e> ()
  component("script")
    add-attr("src", src)
    if defer then set-bool-attr("defer", True)

// <meta charset="UTF-8">
pub inline fun meta-charset(charset: string = "UTF-8"): <component-builder|e> ()
  component("meta")
    add-attr("charset", charset)

// <meta name="viewport" content="width=device-width, initial-scale=1">
pub inline fun meta-viewport(): <component-builder|e> ()
  component("meta")
    add-attr("name", "viewport")
    add-attr("content", "width=device-width, initial-scale=1")
