# Issue

**Title:** fix(inputs,algorithms,connect): deprecation aliases, regression fits, CSR guard, dtype

## Description

Fresh review of `brainpy/{connect,initialize,encoding,inputs,algorithms,tools}`.

- **Critical** — `spike_current`/`ramp_current` deprecation aliases forwarded to `constant_input` with wrong kwargs (crash); now forward to `spike_input`/`ramp_input`.
- **Critical** — `LogisticRegression.call` crashed (flattened targets then read `.shape[1]`); now inits a 1-D parameter vector.
- **High** — `ElasticNetRegression` trained with `add_bias=True` while predict used `self.add_bias` → feature-mismatch crash; now consistent.
- **High** — `CSRConn.build_csr` guard `pre_num != pre_num` was a tautology; now validates against `inptr.size-1`.
- **Medium** — `connect.coo2csr` scattered int counts into a uint32 buffer (int32→uint32 warning / future JAX error); now uses `get_idx_type()`.
- **Medium** — `polynomial_features` allocated one extra always-zero column (off-by-one).

Prior-audit C-23/C-24/H-46/H-47 verified already-fixed. In-scope: 509 passed. Findings: `docs/issues-found-20260619-small-modules.md`.

## Summary by Sourcery

Fix multiple correctness issues in offline regression algorithms, sparse connectivity utilities, and deprecated current input aliases, and document the findings from the small-modules audit.

Bug Fixes:
- Ensure LogisticRegression initializes a 1-D parameter vector so fitting no longer crashes on flattened targets.
- Make ElasticNetRegression use consistent polynomial feature construction between training and prediction, respecting the add_bias flag.
- Correct CSRConn.build_csr to validate the declared pre_size against the CSR indptr length and raise on inconsistencies.
- Update coo2csr to use the connection index dtype for count buffers to avoid int-to-uint scatter warnings and future JAX errors.
- Adjust polynomial_features to allocate the exact required number of feature columns, removing an always-zero extra column.
- Fix deprecated spike_current and ramp_current aliases to delegate to spike_input and ramp_input respectively instead of constant_input.

Documentation:
- Add an issues-found report documenting the results of the small-modules audit and the defects fixed in this change.

Tests:
- Expand and update unit tests for LogisticRegression and ElasticNetRegression to verify successful training, prediction, and numerical sanity.
- Add tests for CSRConn consistency checking and coo2csr warning-free behavior.
- Add tests to ensure deprecated spike_current and ramp_current aliases both warn and behave identically to the corresponding non-deprecated inputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ec07f467c01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.