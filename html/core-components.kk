/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html-builder


pub inline fun text(s: string): <html-tree> ()
  register-child(InnerHtml(s))

pub inline fun classcomponent(name: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  component(name) fn()
    add-classes(classes)
    build-tree()

pub inline fun a(href: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("a", classes=classes)
    add-attr("href",href)
    build-tree()

pub inline fun abbr(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("abbr", build-tree, classes)

pub inline fun address(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("address", build-tree, classes)

pub inline fun article(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("article", build-tree, classes)

pub inline fun aside(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("aside", build-tree, classes)

pub inline fun audio(src: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("audio", classes=classes)
    add-attr("src",src)
    build-tree()

pub inline fun bold(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("b", build-tree, classes)

pub inline fun b(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("b", build-tree, classes)

pub inline fun base(href: string): <html-tree> ()
  register-child(Component("base", attributes=[("href",href)]))

pub inline fun blockquote(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("blockquote", build-tree, classes)

pub inline fun body(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("body",build-tree, classes)

pub inline fun br(): <html-tree> ()
  register-child(Component("br"))

pub inline fun button(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("button",build-tree, classes)

pub inline fun canvas(width: int, height: int, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("canvas", classes=classes)
    add-attr("width",width.show)
    add-attr("height",height.show)
    build-tree()

pub inline fun caption(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("caption",build-tree, classes)

pub inline fun cite(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("cite",build-tree, classes)

pub inline fun code(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("code",build-tree, classes)

pub inline fun col(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("col",build-tree, classes)

pub inline fun details(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("details",build-tree, classes)

pub inline fun dialog(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("dialog",build-tree, classes)

pub inline fun div(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("div",build-tree, classes)

pub inline fun em(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("em",build-tree, classes)

pub inline fun figure(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("figure",build-tree, classes)

pub inline fun footer(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("footer",build-tree, classes)

pub inline fun form(action: string, method: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("form", classes=classes)
    add-attr("action",action)
    add-attr("method",method)
    build-tree()

pub inline fun head(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("head",build-tree, classes)

pub inline fun header(i: int, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("h" ++ i.show,build-tree, classes)

pub inline fun h1(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(1, build-tree, classes)

pub inline fun h2(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(2, build-tree, classes)

pub inline fun h3(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(3, build-tree, classes)

pub inline fun h4(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(4, build-tree, classes)

pub inline fun h5(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(5, build-tree, classes)

pub inline fun h6(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  header(6, build-tree, classes)

pub inline fun hgroup(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("hgroup",build-tree, classes)

pub inline fun hr(classes: list<string> = []): <html-tree> ()
  register-child(Component("hr", classes=classes))

pub inline fun i(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("i",build-tree, classes)

pub inline fun img(src: string, alt: string, classes: list<string> = []): <html-tree> ()
  register-child(Component("img", classes=classes, attributes=[("src",src),("alt",alt)]))

pub inline fun input(name: string, kind: string, value: string, classes: list<string> = []): <html-tree> ()
  register-child(Component("input", classes=classes, attributes=[("name",name),("type",kind),("value",value)]))

pub inline fun label(for: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("label", classes=classes)
    add-attr("for",for)
    build-tree()

pub inline fun li(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("li", build-tree, classes)

pub inline fun link(rel: string, href: string, kind: string): <html-tree> ()
  register-child(Component("link", attributes=[("rel",rel),("href",href),("type",kind)]))

pub inline fun main(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("main", build-tree, classes)

pub inline fun menu(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("menu", build-tree, classes)

pub inline fun meta(name: string, content: string): <html-tree> ()
  register-child(Component("meta", attributes=[("name",name),("content",content)]))

pub inline fun nav(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("nav", build-tree, classes)

pub inline fun noscript(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("noscript", build-tree, classes)

pub inline fun object(data: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("object", classes=classes)
    add-attr("data",data)
    build-tree()

pub inline fun ol(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("ol", build-tree, classes)

pub inline fun optgroup(label: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("optgroup", classes=classes)
    add-attr("label",label)
    build-tree()

pub inline fun option(value: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("option", classes=classes)
    add-attr("value",value)
    build-tree()

pub inline fun p(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("p", build-tree, classes)

pub inline fun param(name: string, value: string): <html-tree> ()
  register-child(Component("param", attributes=[("name",name),("value",value)]))

pub inline fun src/script(src: string, defer: bool = False, async: bool = False): <html-tree> ()
  register-child(Component("script", attributes=[("src",src),("defer",defer.show),("async",async.show)]))

pub inline fun text/script(s: string, defer: bool = False, async: bool = False): <html-tree> ()
  component("script")
    add-attr("defer",defer.show)
    add-attr("async",async.show)
    register-child(InnerHtml(s))

pub inline fun search(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("search", build-tree, classes)

pub inline fun section(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("section", build-tree, classes)

pub inline fun select(name: string, id: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("select", classes= classes) fn()
    add-attr("name",name)
    add-attr("id",id)
    build-tree()

pub inline fun span(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("span", build-tree, classes)

pub inline fun strong(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("strong", build-tree, classes)

// pub inline fun style(build-tree: () -> <style-tree> ()): <html-tree> ()
//   component("style")
  
pub inline fun text/style(s: string): <html-tree> ()
  component("style")
    register-child(InnerHtml(s))

pub inline fun sub(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("sub", build-tree, classes)

pub inline fun summary(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("summary", build-tree, classes)

pub inline fun sup(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("sup", build-tree, classes)

pub inline fun svg(src: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("svg", classes=classes)
    add-attr("src",src)
    build-tree()

pub inline fun table(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("table", build-tree, classes)

pub inline fun tbody(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("tbody", build-tree, classes)

pub inline fun td(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("td", build-tree, classes)

pub inline fun template(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("template", build-tree, classes)

pub inline fun textarea(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("textarea", build-tree, classes)

pub inline fun tfoot(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("tfoot", build-tree, classes)

pub inline fun th(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("th", build-tree, classes)

pub inline fun thead(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("thead", build-tree, classes)

pub inline fun title(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("title", build-tree, classes)

pub inline fun tr(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("tr", build-tree, classes)

pub inline fun ul(build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("ul", build-tree, classes)

pub inline fun video(src: string, build-tree: () -> <html-tree> (), classes: list<string> = []): <html-tree> ()
  classcomponent("video", classes=classes)
    add-attr("src",src)
    build-tree()