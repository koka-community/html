/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/

import html-builder

pub inline fun text(s: string): <html-tree|e> ()
  register-child(InnerHtml(s))

pub inline fun classcomponent(name: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  component(name)
    add-classes(classes)
    build-tree()

pub inline fun a(href: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("a", classes=classes)
    add-attr("href",href)
    build-tree()

pub inline fun abbr(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("abbr", build-tree, classes)

pub inline fun address(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("address", build-tree, classes)

pub inline fun article(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("article", build-tree, classes)

pub inline fun aside(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("aside", build-tree, classes)

pub inline fun audio(src: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("audio", classes=classes)
    add-attr("src", src)
    build-tree()

pub inline fun bold(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("b", build-tree, classes)

pub inline fun b(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("b", build-tree, classes)

pub inline fun base(href: string): <html-tree|e> ()
  register-child(Component("base", attributes=[("href",href)]))

pub inline fun blockquote(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("blockquote", build-tree, classes)

pub inline fun body(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("body",build-tree, classes)

pub inline fun br(): <html-tree> ()
  register-child(Component("br"))

pub inline fun button(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("button",build-tree, classes)

pub inline fun canvas(width: int, height: int, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("canvas", classes=classes)
    add-attr("width",width.show)
    add-attr("height",height.show)
    build-tree()

pub inline fun caption(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("caption",build-tree, classes)

pub inline fun cite(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("cite",build-tree, classes)

pub inline fun code(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("code",build-tree, classes)

pub inline fun col(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("col",build-tree, classes)

pub inline fun details(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("details",build-tree, classes)

pub inline fun dialog(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("dialog",build-tree, classes)

pub inline fun div(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("div",build-tree, classes)

pub inline fun em(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("em",build-tree, classes)

pub inline fun figure(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("figure",build-tree, classes)

pub inline fun footer(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("footer",build-tree, classes)

pub inline fun form(action: string, method: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("form", classes=classes)
    add-attr("action",action)
    add-attr("method",method)
    build-tree()

pub inline fun head(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("head",build-tree, classes)

pub inline fun header(i: int, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("h" ++ i.show,build-tree, classes)

pub inline fun h1(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(1, build-tree, classes)

pub inline fun h2(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(2, build-tree, classes)

pub inline fun h3(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(3, build-tree, classes)

pub inline fun h4(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(4, build-tree, classes)

pub inline fun h5(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(5, build-tree, classes)

pub inline fun h6(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  header(6, build-tree, classes)

pub inline fun hgroup(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("hgroup",build-tree, classes)

pub inline fun hr(classes: list<string> = []): <html-tree> ()
  register-child(Component("hr", classes=classes))

pub inline fun i(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("i",build-tree, classes)

pub inline fun img(src: string, alt: string, classes: list<string> = []): <html-tree> ()
  register-child(Component("img", classes=classes, attributes=[("src",src),("alt",alt)]))

pub inline fun input(name: string, kind: string, value: string, classes: list<string> = []): <html-tree> ()
  register-child(Component("input", classes=classes, attributes=[("name",name),("type",kind),("value",value)]))

pub inline fun label(for: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("label", classes=classes)
    add-attr("for",for)
    build-tree()

pub inline fun li(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("li", build-tree, classes)

pub inline fun link(rel: string, href: string, kind: string): <html-tree> ()
  register-child(Component("link", attributes=[("rel",rel),("href",href),("type",kind)]))

pub inline fun main(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("main", build-tree, classes)

pub inline fun menu(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("menu", build-tree, classes)

pub inline fun meta(name: string, content: string): <html-tree> ()
  register-child(Component("meta", attributes=[("name",name),("content",content)]))

pub inline fun nav(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("nav", build-tree, classes)

pub inline fun noscript(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("noscript", build-tree, classes)

pub inline fun object(data: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("object", classes=classes)
    add-attr("data",data)
    build-tree()

pub inline fun ol(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("ol", build-tree, classes)

pub inline fun optgroup(label: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("optgroup", classes=classes)
    add-attr("label",label)
    build-tree()

pub inline fun option(value: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("option", classes=classes)
    add-attr("value",value)
    build-tree()

pub inline fun p(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("p", build-tree, classes)

pub inline fun param(name: string, value: string): <html-tree> ()
  register-child(Component("param", attributes=[("name",name),("value",value)]))

pub inline fun src/script(src: string, defer: bool = False, async: bool = False): <html-tree> ()
  register-child(Component("script", attributes=[("src",src)], bool-attrs=(if defer then ["defer"] else []) ++ (if async then ["async"] else [])))

pub inline fun text/script(s: string, defer: bool = False, async: bool = False, ?component: nested-builder<e>): <html-tree|e> ()
  component("script")
    set-bool-attr("defer",defer)
    set-bool-attr("async",async)
    register-child(InnerHtml(s))

pub inline fun search(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("search", build-tree, classes)

pub inline fun section(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("section", build-tree, classes)

pub inline fun select(name: string, id: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("select", classes=classes)
    add-attr("name",name)
    add-attr("id",id)
    build-tree()

pub inline fun span(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("span", build-tree, classes)

pub inline fun strong(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("strong", build-tree, classes)

// pub inline fun style(build-tree: () -> <style-tree> ()): <html-tree|e> ()
//   component("style")
  
pub inline fun text/style(s: string, ?component: nested-builder<e>): <html-tree|e> ()
  component("style")
    register-child(InnerHtml(s))

pub inline fun sub(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("sub", build-tree, classes)

pub inline fun summary(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("summary", build-tree, classes)

pub inline fun sup(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("sup", build-tree, classes)

pub inline fun svg(src: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("svg", classes=classes)
    add-attr("src",src)
    build-tree()

pub inline fun table(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("table", build-tree, classes)

pub inline fun tbody(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("tbody", build-tree, classes)

pub inline fun td(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("td", build-tree, classes)

pub inline fun template(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("template", build-tree, classes)

pub inline fun textarea(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("textarea", build-tree, classes)

pub inline fun tfoot(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("tfoot", build-tree, classes)

pub inline fun th(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("th", build-tree, classes)

pub inline fun thead(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("thead", build-tree, classes)

pub inline fun title(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("title", build-tree, classes)

pub inline fun tr(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("tr", build-tree, classes)

pub inline fun ul(build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("ul", build-tree, classes)

pub inline fun video(src: string, build-tree: () -> <html-tree|e> (), classes: list<string> = [], ?component: nested-builder<e>): <html-tree|e> ()
  classcomponent("video", classes=classes)
    add-attr("src",src)
    build-tree()
