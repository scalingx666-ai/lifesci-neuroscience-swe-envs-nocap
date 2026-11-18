# Issue

**Title:** Let the rules extractor read source, not only a path

## Description

## What

`ValidationRulesExtractor` can only be reached with a path on disk. A caller that already holds
the source has to write a temp file to ask it anything.

The parser layer below it already offers both forms — `PhpFileParser::parseCode()` sits beside
`parse()` and returns the same shape. This adds the matching pair to the extractor:

```php
$extractor->hasNonAbstractRulesMethodInCode($source);
$extractor->extractFromCode($source);
```

Three kinds of caller are shut out today: something reading a git blob, which never has a path;
an editor or language-server integration looking at an unsaved buffer; and anything that has
already read the file and would otherwise pay for a second read and a second parse.

## The file variant does not go through the code variant

The obvious refactor is to have `extractFromFile()` read the file and hand the string to
`extractFromCode()`. That would be wrong here. `PhpFileParser::parse()` is what consults the
shared parse cache; `parseCode()` always parses. `hasNonAbstractRulesMethod()` is asked thousands
of times in a build, so routing paths through the code variant re-reads and re-parses every file
on every call.

That is not a guess. Built both ways and measured a full scan:

| application | meeting after the parse | file variant delegating to the code variant |
|---|---:|---:|
| B | 1,818 ms | 5,381 ms — **3.0×** |
| A | 2,667 ms | 13,067 ms — **4.9×** |

Medians with the arms interleaved back to back, three reps on B and two on A. The spread within
each arm is under 10%, so nothing here rests on the rep count.

So the two entry points meet *after* parsing instead, at a private method taking the AST. There
is still exactly one implementation of the analysis, which is the part worth not duplicating.

Two things are worth knowing about that measurement, because both would let this regression ship
unnoticed. The test suite passes either way — a parity test compares the two variants to each
other, and both are equally correct when one is four times slower. And the parse counter reads
1,582 either way, because `PhpFileParser::$parseCount` is incremented in `parseFile()`, not in
`parseCode()`, so parses driven through the code path are invisible to it. Wall clock is the only
instrument that sees this.

## What this is not

It does not make the extractor usable for comparing two revisions of a form request. That needs
something this return shape cannot express: the ability to say *"this side cannot be
enumerated"* and stay silent. An unkeyed item or a spread can hide any number of fields, a
class-constant key resolves against whichever codebase is loaded, and a `rules()` that builds its
array up before returning it is not readable at all. `list<RuleRow>` has no way to report that —
a keyless item comes back as the field `'*'`, which is a value, not a signal. Field names also
arrive as pretty-printed source, quotes included.

Serving that would mean a second, stricter contract, which is a different change and arguably a
different package's job. This one enumerates one present-tense file for a graph.

## Nothing else moves

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is
byte-identical to `main` on three applications. Scan time and parse counts are unchanged against
`main` with the arms interleaved, which is what "additive" should mean.

## Tests

`230 passed (794 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Five new. One asks the same fixture both ways and asserts the answers are equal, so a change that
reaches only one variant fails here. The rest cover what only the new entry point can reach:
source that never was a file, source that does not parse, an abstract `rules()` — the one branch
of the shared path a happy-path test never touches — and the difference between a `rules()` this
cannot read and no `rules()` at all, since both return no rows and only one of them means there
is no validation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89f243945a65`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.