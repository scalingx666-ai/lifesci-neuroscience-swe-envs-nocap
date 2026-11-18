# Issue

**Title:** Apply cross-validation settings

## Description

## Correct cross-validation setting routing

This candidate preserves `stanbot8`'s original contribution and normally
integrates current `develop` through post-#1158 commit
`827040df0354b64516a2ef65ce0536b8a1b32225`.

- Candidate: `b09074bc70aeec2c73e5e946f35a0ac9d18c361c`
- Candidate tree: `b36e1d70a3b1ad94a0544c08ad4457d1db326aab`
- Integration merge: `6241572c4c30c6291adbfbab50d597088e05d13e`
- Live predecessor: `73f08385dd79978fdb04d94c0f1db17ad09c8c55`

.

## Behavior

Evaluation defaults and caller-supplied CV settings are resolved separately.
The effective public `evaluation.cv_kwargs` mapping is consulted on every
resolution, so mutating an individual key or replacing the mapping after
construction is honored without stale provenance.

Constructor capability is tri-state. Evaluation-injected defaults are sent
only to known-supported keywords, positional-only names never receive
implicit keyword defaults, and known-false colliding wrapper controls remain
wrapper-only. Explicit ordinary inner kwargs are retained for validation by
the real constructor, while opaque signatures retain explicit caller values
without guessing omitted defaults.
Wrapper controls such as `shuffle` and `random_state` stay bound to wrapper
state and reach the inner CV only when support is not known false.
CrossSubject calibration defaults remain internal rather than being mistaken
for caller intent.

`splitter.cv_kwargs` remains a truthful public mapping of direct and
evaluation-routed non-wrapper settings. The private resolution envelope is
removed before storage and serialization. Pickle round-trips preserve public
state and exact folds without leaking that envelope.

## Exact scope

Against integrated `develop`, the final diff is exactly:

- `docs/source/whats_new.rst`
- `moabb/evaluations/base.py`
- `moabb/evaluations/evaluations.py`
- `moabb/evaluations/splitters.py`
- `moabb/tests/test_evaluations.py`
- `moabb/tests/test_splits.py`

The production change is confined to the three evaluation modules. The larger
test matrix uses real `GroupKFold`, `GroupShuffleSplit`, `LeaveOneGroupOut`,
variadic, positional-only, and opaque splitters across WithinSession,
WithinSubject, CrossSession, CrossSubject, and CrossDataset paths. It pins seed
precedence, callable groups, wrapper state, mutability, public kwargs,
serialization, and actual train/test group disjointness.

The grouped `LearningCurveSplitter` behavior merged in #1158 is unchanged and
has a separate adversarial pickle/fold preservation check.

## Verification

```text
focused real-splitter selector
48 passed

moabb/tests/test_evaluations.py (excluding network tests)
133 passed

moabb/tests/test_splits.py (excluding network tests)
98 passed

pre-commit on all six paths
all applicable hooks passed

adversarial pickle checks
8 evaluation-created splitters and the grouped #1158 LearningCurve path passed
```

The six-path binary diff SHA-256 against current `develop` is
`bfac1f415678f794f725fb707bc723ddb5f921676153be0a18a40b59a1443b05`.
The worktree was clean at the exact candidate. Fresh hosted tests, docs,
pre-commit, link checks, What's News, Braindecode integration, and exact-head
human approval remain required before the repository's squash-only merge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `827040df0354`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.