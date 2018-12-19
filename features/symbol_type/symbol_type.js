assert(Symbol("foo") !== Symbol("foo"))
const foo = Symbol()
const bar = Symbol()
assert(typeof foo === "symbol")
assert(typeof bar === "symbol")
var obj = {}
obj[foo] = "foo"
obj[bar] = "bar"
assert(JSON.stringify(obj)== "{}") // {}
assert(Object.keys(obj)== "[]") // []
assert(Object.getOwnPropertyNames(obj)== "[]") // []
assert(Object.getOwnPropertySymbols(obj)== "[]") // [ foo, bar ]