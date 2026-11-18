# Issue

**Title:** BUG: Fix invalid single step warning in scalars display widget

## Description

If the active scalar array was missing or constant then the data range was empty and the default 1.0 single step was applied to the displayed scalar range widget. If the widget range spanned less than one unit then ctkRangeWidget rejected the step and logged
"ctkRangeWidget::setSingleStep( 1 ) is outside valid bounds" on every widget update, flooding the application log (for example, twice for each opacity change from the subject hierarchy tree while the Models module was open).

Compute the single step from the actual slider range when the default step would exceed it, and increase the displayed decimals accordingly (previously the spin boxes showed no fractional digits in this case).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `891751aef18c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.