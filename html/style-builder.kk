
struct style-rule
  selector: list<string>
  properties: list<(string, string)>

struct style-sheet
  rules: list<style-rule>

fun rule/show(r: style-rule): string
  r.selector.join(", ") ++ " {\n" ++ r.properties.map(fn(p)
    "  \"" ++ p.fst ++ "\": \"" ++ p.snd ++ "\";\n"
  ).join("") ++ "}\n"

fun stylesheet/show(s: style-sheet): string
  s.rules.map(fn(r) rule/show(r)).join("\n")

effect stylesheet-builder
  fun add-rule_(r: style-rule): ()

effect style-builder
  fun add-property(key: string, value: string): ()
  fun add-selector(selector: string): ()

fun stylesheet(build-tree: () -> <stylesheet-builder|e> ()): e style-sheet
  var rules := []
  with handler
    fun add-rule_(r)
      rules := Cons(r, rules)
    return(_)
      Style-sheet(rules.reverse)
  build-tree()

fun add-rule(f: () -> <style-builder,stylesheet-builder|e> ()): <stylesheet-builder|e> ()
  var properties := []
  var selectors := []
  with handler
    fun add-property(key, value)
      properties := Cons((key,value), properties)
    fun add-selector(sel)
      selectors := Cons(sel, selectors)
    return(_)
      add-rule_(Style-rule(selectors, properties.reverse))
  f()
