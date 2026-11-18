# Issue

**Title:** [FIX] Accept decoder features with or without the feature_group prefix

## Description

No issue filed; found while running NiMARE decoders on Neurosynth v7.

With `feature_group` set, `Decoder._preprocess_input` matched columns against `features` by full name, then stripped the group prefix and indexed the annotations with the bare names. So combining `feature_group` with `features` always failed: full names raised `KeyError: "None of [...] are in the [columns]"`, and bare names matched nothing ("No features identified"). This affects every decoder, since the logic is in the base class.

Changes proposed in this pull request:

- Match each requested feature by its full column name or by its name within the group, so both `"pain"` and `"terms_abstract_tfidf__pain"` work, as does a mix.
- Keep full column names in `features_` and in the output index, as the `feature_group`-only path already does.
- Add a parametrized test (bare, full, mixed spellings) on `NeurosynthDecoder`. The existing `featuregroup_failure` test still raises, now because those features have no studies above the frequency threshold.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Support flexible feature-name matching for decoders that use feature groups.

Bug Fixes:
- Allow decoder features to be specified with or without the feature-group prefix while consistently retaining full column names in decoder outputs.

Documentation:
- Update decoder parameter documentation to describe support for prefixed and unprefixed feature names.

Tests:
- Add coverage for bare, fully prefixed, and mixed feature-name inputs in NeurosynthDecoder.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.