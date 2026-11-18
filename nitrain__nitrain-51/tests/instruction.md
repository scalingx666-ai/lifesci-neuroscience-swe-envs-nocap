# Issue

**Title:** Fix #39 Metrics were not printed after each epoch (validation metrics)

## Description

Refactored for version 0.1.3. TODO update history.batch_metrics

- [x] Added a test for CategoricalAccuracy
- [ ] What should happen on History. on_epoch_end? Uncommenting this block would complain about a key not found exception in epoch_metrics (When using CategoricalAccuracy)
- [x] Removed unused fields Metrics classes
- [ ] What is self.history.batch_metrics.update(val_epoch_logs) for? Uncommenting this line would print an extra metric: 'val_acc_metric'
- [x] Removed self._in_train_loop as it wasn't really used(?) When set to False, the loss function would through an exception
- [x] Fix evaluate() should not run in training mode

@ncullen93 happy to hear your thoughts on the 2 points above or in general regarding this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c64f2db2261`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.