# Issue

**Title:** Add edge aliasing and edge constraints

## Description

This PR adds support for edge aliases (first described in #110) and comparisons between edge attributes with values and with other edges.

This enables syntax like this:

```py
A -> B as ab
B -> A as ba

ab.weight > ba.weight
```

- [x] Add support in the DSL
- [x] Add support in the parser + transformer
- [x] Add support in the executors:
  - [x] GrandIso
  - [x] NetworkX
  - [x] NeuPrint
  - [x] Neo4j

I am going to push macro support in a separate PR, since this one is getting pretty lengthy already!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16e5f845c696`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.