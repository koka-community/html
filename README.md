# An experiment for building HTML

Usage

```
import html/html

fun other-component()
  text("Done!")

fun some-component()
  html
    div
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
<html class="">
  <div class="">
    <span class="red">
      Hello, World!
    </span>
    <span class="blue">
      Goodbye, World!
    </span>
    Done!
  </div>
</html>
```