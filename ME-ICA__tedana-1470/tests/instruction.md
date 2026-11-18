# Issue

**Title:** Add tabs to the HTML report

## Description

.

Changes proposed in this pull request:

- Split the HTML report into **Info**, **ICA**, **Carpet**, **Decay** and **Tree** tabs, rather than one long scroll.
- Add a **Tree** tab, which is new content: a summary of the component selection decision tree and the classification of every component at each node.
- Only render a tab when it has content, so reports never show an empty tab.

### Tab contents

| Tab | Contents |
|---|---|
| Info | Run info table, About tedana, References |
| ICA | Component plots, robust ICA clustering (`--ica_method robustica`), external regressor correlations |
| Carpet | Carpet plots, global signal control (`--gscontrol`) |
| Decay | Adaptive mask, T2\*/S0 summary plots, decay model fit (RMSE) |
| Tree | Decision tree nodes, component status by node |

The two sections the issue did not place explicitly went where they seemed to belong: global signal control with the carpet plots (both are denoised-data QC), and the external regressor heatmap with ICA (it is a component-level metric). Happy to move either.

### No new dependencies

The tab bar reuses the PureCSS menu styles the report already loads from CDN, plus ~30 lines of vanilla JS. Tabs follow the ARIA tabs pattern: `role="tablist"`/`tab`/`tabpanel`, `aria-selected`, roving `tabindex`, and arrow/Home/End key navigation.

Each active pane uses `display: flow-root` so it contains the existing `float: left` children. That avoids touching the ~300 lines of legacy float CSS.

### The Tree tab

Both tables are built with `pandas.to_html()` from files the workflows already write — `desc-ICA_decision_tree.json` and `desc-ICA_status_table.tsv` — so no new outputs are produced and no output manifests change.

Two things about the real data are worth flagging for review, since they drove the code:

- `n_true`/`n_false` are only reported by nodes that make a decision (17 of 27 on a three-echo run), so those cells are blank for the others.
- `node_label` is a string for some nodes and a list for others, so list labels are joined.

### Conditional tabs

`ica_reclassify` does not re-estimate T2\*/S0, so a report it writes to a **new** output directory has no Decay tab at all rather than an empty one. It does write both decision tree files, so its Tree tab is populated.

Note this depends on the output directory, not the workflow: reclassifying into an **existing** tedana directory leaves the old decay figures on disk, so the Decay tab appears and shows the previous run's fits. That behaviour predates this PR (those sections already rendered), but tabs make it more visible, so it may deserve a follow-up.

### Testing

`html_report.py` had no unit tests. Added five, covering the parts most likely to break silently: that empty Decay/Tree tabs are omitted, that Decay appears when *any one* of its figure sets exists, and that the tree tables survive the two schema quirks above.

Verified end-to-end in a browser against local three-echo and reclassify test data:

- Report opens on Info; all five tabs present; reclassify report correctly shows four.
- Bokeh plots render at full size when the ICA tab is first opened. Since Info is the default tab, the plots load inside a hidden pane — safe here only because every figure uses fixed pixel sizing and no `sizing_mode`, so no resize workaround was needed. Worth knowing if anyone later makes those plots responsive.
- Component tap still swaps the component image; carpet buttons still switch the carpet plot; the Rica button still works over every tab; no console errors.

`docs/outputs.rst` described sections by their vertical position ("Below the carpet plots is..."), which tabs invalidate, so that prose now names the owning tab.

### Unrelated bug spotted

Clicking empty space in the kappa/rho plot requests `comp_undefined.png`, because the tap callback's `selected_idx >= 0` is true for an empty selection array. This reproduces on reports generated before this PR, so it is pre-existing and left alone — happy to open a separate issue.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `017c1e70d6ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.