/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html-builder
import style-builder


pub inline fun text(s: string): <component-builder|e> ()
  register-child(InnerHtml(s))

pub inline fun classcomponent(name: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  component(name)
    add-classes(classes)
    build-tree()

pub inline fun a(href: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("a", classes=classes)
    add-attr("href",href)
    build-tree()

pub inline fun abbr(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("abbr", build-tree, classes)

pub inline fun address(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("address", build-tree, classes)

pub inline fun article(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("article", build-tree, classes)

pub inline fun aside(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("aside", build-tree, classes)

pub inline fun audio(src: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("audio", classes=classes)
    add-attr("src", src)
    build-tree()

pub inline fun bold(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("b", build-tree, classes)

pub inline fun b(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("b", build-tree, classes)

pub inline fun base(href: string): <component-builder|e> ()
  register-child(Component("base", attributes=[("href",href)]))

pub inline fun blockquote(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("blockquote", build-tree, classes)

pub inline fun body(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("body",build-tree, classes)

pub inline fun br(): <component-builder> ()
  register-child(Component("br"))

pub inline fun button(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("button",build-tree, classes)

pub inline fun canvas(width: int, height: int, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("canvas", classes=classes)
    add-attr("width",width.show)
    add-attr("height",height.show)
    build-tree()

pub inline fun caption(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("caption",build-tree, classes)

pub inline fun cite(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("cite",build-tree, classes)

pub inline fun code(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("code",build-tree, classes)

pub inline fun col(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("col",build-tree, classes)

pub inline fun details(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("details",build-tree, classes)

pub inline fun dialog(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("dialog",build-tree, classes)

pub inline fun div(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("div",build-tree, classes)

pub inline fun em(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("em",build-tree, classes)

pub inline fun figure(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("figure",build-tree, classes)

pub inline fun footer(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("footer",build-tree, classes)

pub inline fun form(action: string, method: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("form", classes=classes)
    add-attr("action",action)
    add-attr("method",method)
    build-tree()

pub inline fun head(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("head",build-tree, classes)

pub inline fun header(i: int, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("h" ++ i.show,build-tree, classes)

pub inline fun h1(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(1, build-tree, classes)

pub inline fun h2(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(2, build-tree, classes)

pub inline fun h3(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(3, build-tree, classes)

pub inline fun h4(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(4, build-tree, classes)

pub inline fun h5(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(5, build-tree, classes)

pub inline fun h6(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  header(6, build-tree, classes)

pub inline fun hgroup(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("hgroup",build-tree, classes)

pub inline fun hr(classes: list<string> = []): <component-builder> ()
  register-child(Component("hr", classes=classes))

pub inline fun i(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("i",build-tree, classes)

pub inline fun img(src: string, alt: string, classes: list<string> = []): <component-builder> ()
  register-child(Component("img", classes=classes, attributes=[("src",src),("alt",alt)]))

pub inline fun input(name: string, kind: string, value: string, classes: list<string> = []): <component-builder> ()
  register-child(Component("input", classes=classes, attributes=[("name",name),("type",kind),("value",value)]))

pub inline fun label(for: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("label", classes=classes)
    add-attr("for",for)
    build-tree()

pub inline fun li(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("li", build-tree, classes)

pub inline fun link(rel: string, href: string, kind: string): <component-builder> ()
  register-child(Component("link", attributes=[("rel",rel),("href",href),("type",kind)]))

pub inline fun main(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("main", build-tree, classes)

pub inline fun menu(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("menu", build-tree, classes)

pub inline fun meta(name: string, content: string): <component-builder> ()
  register-child(Component("meta", attributes=[("name",name),("content",content)]))

pub inline fun nav(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("nav", build-tree, classes)

pub inline fun noscript(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("noscript", build-tree, classes)

pub inline fun object(data: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("object", classes=classes)
    add-attr("data",data)
    build-tree()

pub inline fun ol(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("ol", build-tree, classes)

pub inline fun optgroup(label: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("optgroup", classes=classes)
    add-attr("label",label)
    build-tree()

pub inline fun option(value: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("option", classes=classes)
    add-attr("value",value)
    build-tree()

pub inline fun p(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("p", build-tree, classes)

pub inline fun param(name: string, value: string): <component-builder> ()
  register-child(Component("param", attributes=[("name",name),("value",value)]))

pub inline fun src/script(src: string, defer: bool = False, async: bool = False): <component-builder> ()
  register-child(Component("script", attributes=[("src",src)], bool-attrs=(if defer then ["defer"] else []) ++ (if async then ["async"] else [])))

pub inline fun text/script(s: string, defer: bool = False, async: bool = False): <component-builder> ()
  component("script")
    set-bool-attr("defer",defer)
    set-bool-attr("async",async)
    register-child(InnerHtml(s))

pub inline fun search(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("search", build-tree, classes)

pub inline fun section(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("section", build-tree, classes)

pub inline fun select(name: string, id: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("select", classes=classes)
    add-attr("name",name)
    add-attr("id",id)
    build-tree()

pub inline fun span(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("span", build-tree, classes)

pub inline fun strong(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("strong", build-tree, classes)

pub inline fun style(build-tree: () -> <stylesheet-builder|e> ()): <component-builder|e> ()
  component("style")
    register-child(InnerHtml(mask<component-builder>{stylesheet(build-tree).show})) 
  
pub inline fun text/style(s: string): <component-builder> ()
  component("style")
    register-child(InnerHtml(s))

pub inline fun sub(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("sub", build-tree, classes)

pub inline fun summary(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("summary", build-tree, classes)

pub inline fun sup(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("sup", build-tree, classes)

pub inline fun svg(src: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("svg", classes=classes)
    add-attr("src",src)
    build-tree()

pub inline fun table(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("table", build-tree, classes)

pub inline fun tbody(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("tbody", build-tree, classes)

pub inline fun td(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("td", build-tree, classes)

pub inline fun template(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("template", build-tree, classes)

pub inline fun textarea(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("textarea", build-tree, classes)

pub inline fun tfoot(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("tfoot", build-tree, classes)

pub inline fun th(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("th", build-tree, classes)

pub inline fun thead(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("thead", build-tree, classes)

pub inline fun title(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("title", build-tree, classes)

pub inline fun tr(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("tr", build-tree, classes)

pub inline fun ul(build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("ul", build-tree, classes)

pub inline fun video(src: string, build-tree: () -> <component-builder|e> (), classes: list<string> = []): <component-builder|e> ()
  classcomponent("video", classes=classes)
    add-attr("src",src)
    build-tree()
