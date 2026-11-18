# Issue

**Title:** Read what a resource puts in the payload

## Description

## What

The graph already says a route reaches `ArticleResource`. What the response actually carries — the last hop of the request, and the only part a consumer of the API ever sees — was left inside the file:

```
resource  ArticleResource@toArray
  fqcn, method, file, flowSteps, members, visibility
```

A reader asking "what does this endpoint return" had to open the resource. Now the node carries it:

| key | value |
|---|---|
| `id` | `$this->id` |
| `title` | `$this->title` |
| `Article::FIELD_SLUG` | `$this->slug` |
| `author` | `new AuthorResource($this->author)` |
| `tags` | `$this->whenLoaded('tags')` |
| `...` | `$this->meta()` |

`PhpStructureInspector::payloadKeys()` reads them; `GraphBuilder` puts them on the `resource` node as `payloadKeys`, beside `members` — the same shape and the same place `validationRules` already occupies for a Form Request, so the sidebar renders them through its property list with no frontend change. A section of their own, like the "Validation rules" one, is the natural follow-up and needs a rebuilt asset bundle, so I left it out of this PR rather than committing a bundle built on my toolchain. Happy to add it if you want it here.

## What it will and will not claim

The extractor answers with what it can actually read, and says nothing where it cannot:

- **A literal key** is given as written.
- **A key that is not a literal** is printed as the expression it is, so `Article::FIELD_SLUG` appears instead of the row disappearing. A reader can see there is a key there and where it comes from.
- **A spread** (`...$this->meta()`) is one row keyed `...`. The payload has more in it than the rows above, and a list that quietly omitted it would read as complete.
- **A list item with no key** is `*`, the stand-in `ValidationRulesExtractor` already uses for one.
- **A payload it cannot enumerate yields nothing at all**: `return parent::toArray($request)`, an array built up over several statements, a merge. An empty list is "this was not readable", never "this payload has no keys" — which is why the data key is omitted entirely rather than set to `[]`.

Both branches of a conditional `toArray()` are read, in the order they are returned. A resource that returns one shape to an editor and another to everyone else has two payloads, and both are worth seeing.

## Cost

One extra parse per resource file, memoised per file for the build — the same shape as `inspectFile()` beside it, and for the same reason: a resource composing a sibling makes GraphBuilder ask about the same file twice. Nothing else in a scan changes; no new pass, no new traversal of the project.

## Tests

`tests/Unit/ResourcePayloadKeysTest.php`, with a `resource-payloads` fixture project:

- the keys of a conditional `toArray()`, both branches, in order
- the expression that fills each key, including a nested resource and a `whenLoaded`
- a constant key, printed rather than dropped
- a spread, as its own row
- `parent::toArray()` and an array built up over statements → nothing
- a file that is not there → nothing
- the same file asked twice → the same answer (the memo)
- the wiring: a route reaches the resource, and the node the builder makes for it carries the payload

Full suite green (263 passed, 866 assertions) over two `--order-by=random` runs, phpstan 0 errors, pint clean. The diff is additive — 206 new lines in `PhpStructureInspector`, none removed.

## Relationship to the other open PRs

Independent of #92-#96; different file, different subsystem.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.