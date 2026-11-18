# Issue

**Title:** More progress bar improvements (incl. Jupyter lab support)

## Description

**Motivation and context:**
Jupyter lab disables the execution of Javascript which breaks the current progress bar implementation. Version 0.32 (not released yet, but release candidates are available from PyPI) fixing an updating issue in the VDOM support that allows the implementation of the progress bar without any Javascript. `VdomProgressBar` takes advantage of that and works in Jupyter Lab, it might also work in future versions of Jupyter Notebook and would then allow the removal of `HtmlProgressBar`.

As convenience I added a `VdomOrHtmlProgressBar` that provides both progress bars and the Jupyter client will select the preferred version (usually VDOM if VDOM is supported). This is the new default in clients the support IPython `display`.

There is some sort of code duplication in `VdomProgressBar` and `HtmlProgressBar` as they effectively both construct the same DOM. We could use the VDOM from `VdomProgressBar` and parse it to proper HTML for the `HtmlProgressBar`. However, this might be wasted effort if the `HtmlProgressBar` might get removed in the future. While it is not super complicated todo, the CSS attribute names need to converted from camel case to hyphen notation which might be mildly annoying. But I'm open to other opinions.

Furthermore, this adds a warning that gets displayed in Jupyter Notebook versions before 5 (which are not supported).

Addresses #1426. .

**Interactions with other PRs:**
none

**How has this been tested?**
Manually tried in Jupyter Notebook 5.4.1 + 4.4.1, Jupyter Lab 0.32.0rc1.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
I recommend going commit by commit as they are pretty independent.

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f9e8f423b5c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.