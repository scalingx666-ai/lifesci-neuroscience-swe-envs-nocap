# Issue

**Title:** fix: correct Ds loss wiring and scheduler hookup

## Description

While reviewing the public code, I found that the Ds update incorrectly uses Dy’s optimizer and scheduler.
Effect: Ds never updates. Dy steps twice per iteration and its LR decays twice. This can distort the seg-adversarial signal and weaken translation quality.

Current:

```python
loss_Ds = self.update_netD(self.Ds, real_seg, self.image_pool['Ds'].query(fake_seg),
                           self.optimizer['Dy'], self.lr_scheduler['Dy'])
```

Fix:

```python
loss_Ds = self.update_netD(self.Ds, real_seg, self.image_pool['Ds'].query(fake_seg),
                           self.optimizer['Ds'], self.lr_scheduler['Ds'])
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9063b2785728`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.