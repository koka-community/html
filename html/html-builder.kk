/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import std/core/undiv

// Component with children or inner html
type component
  Component(tag: string, children: html-children = SelfClosing, classes: list<string> = [], attributes: list<(string, string)> = [], bool-attrs: list<string> = [])
  InnerHtml(html: string)

type html-children
  Components(children: list<component>)
  SelfClosing

effect component-builder
  fun register-child(t: component): ()
  fun add-attr(k: string, v: string): ()
  fun set-bool-attr(k: string, b: bool): ()
  fun add-class(c: string): ()

fun add-attrs(attrs: list<(string, string)>): <component-builder> ()
  attrs.foreach(fn((k, v)) add-attr(k, v))

fun add-classes(classes: list<string>): <component-builder> ()
  classes.foreach(add-class)

fun html(build-tree: () -> <component-builder|e> ()): e component
  var children := []
  var attrs := []
  var classes := []
  var bool-attrs := []
  with handler 
    fun register-child(cdata)
      children := Cons(cdata, children)
    fun add-attr(k, v)
      attrs := Cons((k,v), attrs)
    fun add-class(c)
      classes := Cons(c, classes)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      Component("html", Components(children.reverse), classes, attrs, bool-attrs)
  build-tree()

fun nested/component(tag: string, build-tree: () -> <component-builder|e> ()) : <component-builder|e> ()
  var children := []
  var attrs := []
  var classes := []
  var bool-attrs := []
  with override 
    fun register-child(cdata)
      children := Cons(cdata, children)
    fun add-attr(k, v)
      attrs := Cons((k,v), attrs)
    fun add-class(c)
      classes := Cons(c,classes)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      register-child(Component(tag, Components(children.reverse), classes, attrs, bool-attrs))
  build-tree()

fun component/build(build-tree: () -> <component-builder|e> ()): e component
  var children := []
  var attrs := []
  var classes := []
  var bool-attrs := []
  with handler 
    fun register-child(cdata)
      children := Cons(cdata, children)
    fun add-attr(k, v)
      attrs := Cons((k,v),attrs)
    fun add-class(c)
      classes := Cons(c,classes)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      val dchilds = children.reverse
      // Need to assign these to local references to avoid the local effect in the match
      val dclass = classes 
      val dattrs = attrs
      val battrs = bool-attrs
      match dchilds
        Cons(c, Nil) | (dclass.is-nil && dattrs.is-nil && battrs.is-nil) -> c
        _ -> Component("div", Components(dchilds), classes, attrs, bool-attrs)
  build-tree()

fun show-classes(classes: list<string>): string
  match classes
    [] -> ""
    _  -> " class=\"" ++ classes.join(" ") ++ "\""

fun show-attrs(attrs: list<(string, string)>): string
  match attrs
    [] -> ""
    _ -> " " ++ attrs.map(fn((k, v)) k ++ "=\"" ++ v ++ "\"").join(" ")

fun show-bool-attrs(attrs: list<string>): string
  match attrs
    [] -> ""
    _ -> " " ++ attrs.join(" ")

fun component/show(c: component, indent: int = 0): string
  match c
    Component(tag, SelfClosing, classes, attrs, battrs) ->
      "<" ++ tag ++ show-classes(classes) ++ show-attrs(attrs) ++ show-bool-attrs(battrs) ++ " />"
    Component(tag, Components(children), classes, attrs, battrs) ->
      val child-indent = indent + 2
      val child-indentation = indentation(child-indent)
      "<" ++ tag ++ show-classes(classes) ++ show-attrs(attrs) ++ show-bool-attrs(battrs) ++ ">\n"
        ++ child-indentation ++
          children.map(
            fn(child) child.pretend-decreasing.show(indent = child-indent)
          ).join("\n" ++ child-indentation) ++ "\n" ++
      indent.indentation ++ "</" ++ tag ++ ">"
    InnerHtml(inner) -> inner

fun indentation(indent: int): string
  " ".repeat(indent)
