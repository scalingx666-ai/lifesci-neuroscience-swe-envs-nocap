# Issue

**Title:** ENH: Add flow diagram to reports

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

Iterated a bunch with Claude Fable 5 on a feature I've wanted : a flow diagram calculated on the fly based on what actually ran:

<img width="1313" height="1165" alt="Screenshot 2026-08-12 at 10 41 00 AM" src="https://github.com/user-attachments/assets/235c14aa-2b85-4bd4-9e7c-39b8a77b0884" />

The mechanics behind how to construct it are pretty simple:

1. Write a JSON result for each step that can then later be parsed.
2. Read those JSONs during report phase and construct a directed acyclic graph (DAG)
3. Lay that out using custom DAG layout + SVG + a little JS for interaction

<details>
<summary><strong>Why a custom-rolled graph layout</strong></summary>

(3) above turned out to be the tricky decision point, because there are libraries for this sort of thing. But there were requirements I had:

1. Right graph type: DAG + labeled edges + multi-parent nodes.
2. Self-contained, offline-safe output.
3. No new runtime burden: pip-installable pure Python for a tool users run on their own machines.

I looked at maybe a dozen other pieces of software instead, top alternative candidates were:

- ⛔ `mermaid` (js): adds ~3.5 MB of vendored JS into every report and lacks some features (like label mouseover support that SVG gives for free)
- ⛔ `grandalf` (python): only replaces the "layout" part of the code, which is not the hardest part to sort out (and adds a dep)
- ⛔ `pygal` (python): no node-link chart type
- ⛔  `chart.js` (js): no text search, no tooltips
- ❓ `d3-dag` (js): the closest. layout-only in the browser, though; trades ~240 lines of Python rendering for embedded JavaScript.

I had Claude implement `d3-dag` and `mermaid` and they at least worked, but weren't overall better (edge labels worse for d3, mermaid no mouseovers, etc.):

<img width="1710" height="611" alt="Screenshot 2026-08-12 at 2 13 42 PM" src="https://github.com/user-attachments/assets/f23309ef-2f95-4dc5-9591-5109812b50ec" />

If our graphs get far more complex at some point it could make sense to go with `d3-dag` probably, though.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffcdd44dc0fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.