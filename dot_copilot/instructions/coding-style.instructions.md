---
applyTo: '**'
---
Prefer functional programming paradigms over imperative ones. Avoid mutating function arguments; return new values instead.

**TypeScript/JavaScript:**
- Use `.map()`, `.filter()`, `.reduce()` over `for`/`for...of` loops
- Prefer `const` over `let`
- Prefer immutable updates (`...spread`, `Object.assign`) over mutation

**Python:**
- Use list/dict/set comprehensions over `for` loops that build collections
- Prefer `map()`, `filter()`, and `functools` utilities where appropriate
- Use `dataclasses` or `TypedDict` for structured data over plain dicts where practical
