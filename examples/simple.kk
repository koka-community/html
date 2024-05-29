/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html/html

fun other-component()
  text("Done!")

fun some-component()
  html
    head
      title
        text("Title of the document")
    body
      span({
        text("Hello, World!")
      }, classes=["red"])
      span({
        text("Goodbye, World!")
      }, classes=["blue"])
      other-component()

fun main()
  println(some-component().show)
