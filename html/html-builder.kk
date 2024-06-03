/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import std/core/undiv

// Component with children or inner html
type component
  Component(tag: string, children: html-children = SelfClosing, classes: list<string> = [], attributes: list<(string, string)> = [])
  InnerHtml(html: string)

type html-children
  Components(childs: list<component>)
  SelfClosing

effect html-tree
  fun register-child(t: component): ()
  fun add-attr(k: string, v: string): ()
  fun add-class(c: string): ()

fun add-attrs(attrs: list<(string, string)>): <html-tree> ()
  attrs.foreach(fn((k, v)) add-attr(k, v))

fun add-classes(classes: list<string>): <html-tree> ()
  classes.foreach(add-class)

fun html(build-tree: () -> <html-tree|e> ()): e component
  var children := ctx _
  var attrs := ctx _
  var classes := ctx _
  with handler 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    fun add-attr(k, v)
      attrs := attrs ++ ctx Cons((k, v), _)
    fun add-class(c)
      classes := classes ++ ctx Cons(c, _)
    return(x)
      Component("html", Components(children ++. Nil), classes ++. Nil, attrs ++. Nil)
  build-tree()

fun nested/component(tag: string, build-tree: () -> <html-tree|e> ()) : <html-tree|e> ()
  var children := ctx _
  var attrs := ctx _
  var classes := ctx _
  with override 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    fun add-attr(k, v)
      attrs := attrs ++ ctx Cons((k, v), _)
    fun add-class(c)
      classes := classes ++ ctx Cons(c, _)
    return(x)
      register-child(Component(tag, Components(children ++. Nil), classes ++. Nil, attrs ++. Nil))
  build-tree()

fun show-classes(classes: list<string>): string
  match classes
    [] -> ""
    _  -> " class=\"" ++ classes.join(" ") ++ "\""

fun show-attrs(attrs: list<(string, string)>): string
  match attrs
    [] -> ""
    _ -> " " ++ attrs.map(fn((k, v)) " " ++ k ++ "=\"" ++ v ++ "\"").join("" )

fun component/show(c: component, indent: int = 0): string
  match c
    Component(tag, SelfClosing, classes, attrs) ->
      "<" ++ tag ++ show-classes(classes) ++ show-attrs(attrs) ++ " />"
    Component(tag, Components(children), classes, attrs) ->
      val child-indent = indent + 2
      val child-indentation = indentation(child-indent)
      "<" ++ tag ++ show-classes(classes) ++ show-attrs(attrs) ++ ">\n"
        ++ child-indentation ++
          children.map(
            fn(child) child.pretend-decreasing.show(indent = child-indent)
          ).join("\n" ++ child-indentation) ++ "\n" ++
      indent.indentation ++ "</" ++ tag ++ ">"
    InnerHtml(inner) -> inner

fun indentation(indent: int): string
  " ".repeat(indent)
