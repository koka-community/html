# An experiment for building HTML

Usage

```
import html/html

fun other-component()
  text("Done!")

fun some-component()
  html
    head
      title
        text("Title of the document")
    body
      span(classes=["red"])
        text("Hello, World!")
      span(classes=["blue"])
        text("Goodbye, World!")
      other-component()

fun main()
  println(some-component().show)
```

Results in 
```
<html>
  <head>
    <title>
      Title of the document
    </title>
  </head>
  <body>
    <span class="red">
      Hello, World!
    </span>
    <span class="blue">
      Goodbye, World!
    </span>
    Done!
  </body>
</html>
```