# Issue

**Title:** [FIX] Bump pymdown-extensions to >=10.21.2 to restore code-block rendering

## Description

.

Restores fenced code-block rendering for blocks nested inside list items
(e.g. the `Plain` examples in "Storage of derived datasets" and the
`make_filetree_example` tree in "Study dataset"). On the current
`latest` build these collapsed to inline `<code>` with the language tag
visible as literal text (`Plain <dataset>/derivatives/…`).

## Root cause

<details>
<summary>Pygments 2.20.0 + pymdownx ≤10.21 interaction</summary>

* Pygments 2.20.0 (2026-03-29) tightened `HtmlFormatter.__init__` to
  call `html.escape()` on the `filename` option. With a `None` value
  this now raises `AttributeError: 'NoneType' object has no attribute
  'replace'`.
* `pymdownx.highlight` ≤10.21 passes `filename=title` and `title`
  defaults to `None` when the code block has no title.
* `pymdownx.superfences` catches the exception and silently abandons
  the fence. Python-Markdown's own `fenced_code` doesn't process
  fences nested inside list items, so the ` ```Plain … ``` ` block
  ends up parsed as inline code: `<p><code>Plain …</code></p>`.

`pymdown-extensions` 10.21.2 fixes the upstream defect (release notes:
"Latest Pygments versions cannot handle a 'filename' for code block
titles of `None`."). 10.21.3 adds an unrelated snippets security fix.

</details>

## Change

* `pyproject.toml`: `pymdown-extensions>=9.2.0` → `>=10.21.2`
* `tools/schemacode/pyproject.toml` (`[render]` extra): same bump
* `uv.lock`: pins to 10.21.3 (current latest)

Floor is set to 10.21.2 (the minimum that ); the lockfile
picks up 10.21.3, superseding the open dependabot PR for the same bump.

## Verification

Built locally on this branch (`mkdocs build`) and confirmed:

* "Storage of derived datasets" `Plain` blocks now emit
  `<div class="highlight"><pre>…</pre></div>` (matches `stable`).
* "Study dataset" filetree macro output also renders as a proper code
  block.
* No literal "Plain" text leaks into the rendered HTML.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f637dc697033`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.