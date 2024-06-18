/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import std/core/undiv
import html-builder

fun html(build-tree: () -> <html-tree|e> ()): e component
  var children := ctx _
  var attrs := ctx _
  var classes := ctx _
  var bool-attrs := []
  with handler 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    fun add-attr(k, v)
      attrs := attrs ++ ctx Cons((k, v), _)
    fun add-class(c)
      classes := classes ++ ctx Cons(c, _)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      Component("html", Components(children ++. Nil), classes ++. Nil, attrs ++. Nil, bool-attrs)
  build-tree()

fun nested/component(tag: string, build-tree: () -> <html-tree|e> ()) : <html-tree|e> ()
  var children := ctx _
  var attrs := ctx _
  var classes := ctx _
  var bool-attrs := []
  with override 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    fun add-attr(k, v)
      attrs := attrs ++ ctx Cons((k, v), _)
    fun add-class(c)
      classes := classes ++ ctx Cons(c, _)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      register-child(Component(tag, Components(children ++. Nil), classes ++. Nil, attrs ++. Nil, bool-attrs))
  build-tree()

fun component/build(build-tree: () -> <html-tree|e> ()): e component
  var children := ctx _
  var attrs := ctx _
  var classes := ctx _
  var bool-attrs := []
  with handler 
    fun register-child(cdata)
      children := children ++ ctx Cons(cdata, _)
    fun add-attr(k, v)
      attrs := attrs ++ ctx Cons((k, v), _)
    fun add-class(c)
      classes := classes ++ ctx Cons(c, _)
    fun set-bool-attr(k, v)
      val removed = bool-attrs.filter(fn(k1) k != k1)
      val next = if v then Cons(k, removed) else removed 
      bool-attrs := next
    return(x)
      val dchilds = children ++. Nil
      val dclass = classes ++. Nil
      val dattrs = attrs ++. Nil
      val battrs = bool-attrs
      match dchilds
        Cons(c, Nil) | (dclass.is-nil && dattrs.is-nil && battrs.is-nil) -> c
        _ -> Component("div", Components(dchilds), dclass, dattrs, battrs)
  build-tree()
