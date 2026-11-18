# Issue

**Title:** Add `NeuroExplorerSortingExtractor`

## Description

This adds a sorting extractor for NeuroExplorer, for which we already have a recording extractor.

One problem is that python-neo exposes both neuron variables and waveform variables as spike channels, and in Plexon exports every unit comes with a `_wf` variable holding the same spike train with snippets and a `_template` variable holding its mean waveform as a single spike. Reading all of them as units would duplicate every neuron, so only the neuron variables (the spike channels without waveforms) become units. I kept the filtering local and override the index mapping so each unit still reads its own spike channel.

Doing this made realize there are some problems with the python-neo reader. I will tackle that separately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.