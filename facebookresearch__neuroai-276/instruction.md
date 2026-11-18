# Issue

**Title:** fix(neuralfetch): drop ambiguous same-onset markers in Alljoined-1.6M

## Description

## What does this PR do?

Fixes `neuralbench eeg image --dataset xu2025alljoined` aborting on Alljoined-1.6M.

The Emotiv marker stream stalls in 29 of the 1525 recordings and then flushes several
trial markers carrying one identical timestamp. In `sub-01/session_04/block_08`, five
*different* image IDs land on t=3.437122 s, followed by a 1.66 s gap against a normal
0.2 s inter-stimulus interval:

```
         start        dt       label  value
13    3.245737  0.199197  stim_train   7250
14    3.437122  0.191385  stim_train    936
15    3.437122  0.000000  stim_train   2542
16    3.437122  0.000000  stim_train   3835
17    3.437122  0.000000  stim_train   3748
18    3.437122  0.000000  stim_train   5047
19    5.097095  1.659973  stim_train    591
```

Since the image that evoked the EEG at that instant is unrecoverable, `list_segments`
rightly refuses to segment them:

```
ValueError: 5 triggers of the same type start at the same time on the same timeline
```

This PR drops every annotation that shares an onset with another in the same recording.
Dropping the whole group rather than keeping one survivor avoids silently pairing real
EEG with the wrong image.

**Scope**, from a scan of all 1525 recordings: 68 collision groups covering 160 markers
out of 1,665,400 stimulus markers (0.0096%). Every group holds distinct images, so none
is a harmless duplicate annotation. Ten of the twenty subjects are affected, including
`sub-01` and `sub-03`, so `--debug` fails too and no subject subset avoids it.

This matters for the Biosignal Challenge 2026: the [Track 1 guide](https://facebookresearch.github.io/neuroai/neuralbench/tutorials/07_biosignal_challenge_2026/plot_track1_eeg_to_image.html)
recommends `Xu2025Alljoined` as "the one to train on if you only pick one", so entrants
hit this immediately.

The dataset was onboarded before the duplicate-trigger guard existed, which is why it
validated clean at the time.

### Workaround for users on the current release

No new install needed — exclude the 29 affected recordings at the study level. Either add
`query` under `data.study.source` in a dataset YAML, or pass it as an override:

```python
evaluate_model(model, "eeg", "image", overrides={"data.study.source.query": QUERY})
```

```
not ((subject == 'Xu2025Alljoined/1' and session == 4 and run in [8, 15, 16, 17, 18])
  or (subject == 'Xu2025Alljoined/3' and session == 3 and run in [3])
  or (subject == 'Xu2025Alljoined/7' and session == 1 and run in [7])
  or (subject == 'Xu2025Alljoined/7' and session == 4 and run in [8])
  or (subject == 'Xu2025Alljoined/8' and session == 2 and run in [14, 19])
  or (subject == 'Xu2025Alljoined/8' and session == 4 and run in [3, 4, 5])
  or (subject == 'Xu2025Alljoined/10' and session == 1 and run in [11, 15])
  or (subject == 'Xu2025Alljoined/11' and session == 2 and run in [9])
  or (subject == 'Xu2025Alljoined/11' and session == 3 and run in [19])
  or (subject == 'Xu2025Alljoined/11' and session == 4 and run in [6])
  or (subject == 'Xu2025Alljoined/13' and session == 4 and run in [13])
  or (subject == 'Xu2025Alljoined/15' and session == 2 and run in [17])
  or (subject == 'Xu2025Alljoined/18' and session == 3 and run in [10, 13])
  or (subject == 'Xu2025Alljoined/20' and session == 3 and run in [10, 11, 14, 15, 18, 19])
  or (subject == 'Xu2025Alljoined/20' and session == 4 and run in [18]))
```

It drops 29 of 1520 recordings (1.9% of the data) rather than the 160 markers this PR
drops (0.0096%), so it is a stopgap, not an equivalent. A config-only equivalent is not
possible: `QueryEvents` runs on the concatenated events frame, and `start.duplicated()`
there is not scoped per timeline — every `Eeg` event starts at 0, so it would drop all
1520 of them.

## Related Issues

None filed; reported directly against the Track 1 guide.

## Checklist

- [ ] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

No test: the collisions only exist in the real 220 GB dataset, so a guard would have to
be a cluster-data test that skips everywhere else. Verified manually instead — the
original failure reproduces before the change and passes after (1107 -> 1102 triggers on
the affected timeline, exactly the five ambiguous ones dropped), across a five-group
timeline, the three-way groups in `sub-20`, the mislabeled `sub-08` file path, and a
clean control that still yields its original 1014 segments. `test_study_info[Xu2025Alljoined]`
still passes, since the timeline it validates has no collisions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33bc68c43a37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.