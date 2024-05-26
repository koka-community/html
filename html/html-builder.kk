/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import std/core/undiv

// Component with children or inner html
type component
  Component(tag: string, children: html-children = SelfClosing, classes: list<string> = [])
  InnerHtml(html: string)

type html-children
  Components(childs: list<component>)
  SelfClosing

effect html-tree
  fun register-child(t: component): ()

fun html(build-tree: () -> <html-tree> ()): component
  var children := ctx _
  with handler 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    return(x)
      Component("html", Components(children ++. Nil), [])
  build-tree()

fun nested/component(tag: string, classes: list<string> = [], build-tree: () -> <html-tree> ())
  var children := ctx _
  with override 
     fun register-child(cdata)
        children := children ++ ctx Cons(cdata, _)
     return(x)
        register-child(Component(tag, Components(children ++. Nil), classes))
  build-tree()

fun component/show(c: component, indent: int = 0): string
  match c
    Component(tag, SelfClosing, classes) ->
      "<" ++ tag ++ " class=\"" ++ classes.join(" ") ++ "\" />"
    Component(tag, Components(children), classes) ->
      val child-indent = indent + 2
      val child-indentation = indentation(child-indent)
      "<" ++ tag ++ " class=\"" ++ classes.join(" ") ++ "\">\n" 
        ++ child-indentation ++
        children.map(
          fn(child) child.pretend-decreasing.show(indent = child-indent)
        ).join("\n" ++ child-indentation) ++ "\n" ++
      indent.indentation ++ "</" ++ tag ++ ">"
    InnerHtml(inner) -> inner

fun indentation(indent: int): string
  " ".repeat(indent)
