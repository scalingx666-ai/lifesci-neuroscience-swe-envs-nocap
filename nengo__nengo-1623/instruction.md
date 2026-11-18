# Issue

**Title:** Combine rates/spikes state into single output variable

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

A couple changes to simplify working with the new neuron type refactoring (motivated by adding support for the refactoring in NengoDL).

- f87a464 Combines the "rates"/"spikes" state into a single "output" state in all cases. Separating them required a lot of `output = state["rates"] if "rates" in state else state["spikes"]` style code and didn't really add any functional advantages. The only place it was used was to signal to the user whether a neuron type was spiking or not via the `spiking` attribute (which looked up the keys in `state`). This was replaced with a manually specified `spiking` attribute for each neuron type (which seems roughly equal complexity to manually specifying either the "spikes" or "rates" state).
- c92678f Unrelated fix for some sphinx errors triggered by a new release or something.
- 4d4251b Adds a `state` property to `SimNeurons` and `SimProcess` that mimics the pre-refactoring `state` attribute (i.e., dereferences the state indices into actual Signals). This was just a code snippet that I was repeating a lot when working with those ops, so made sense to centralize it, and it also makes it easier to write code that is cross-compatibile pre/post refactoring.
- 2a2a93c Makes the "output" attribute (formerly "rates"/"spikes") a mandatory/automatic feature of NeuronTypes. It was implicitly required previously, in that our code assumed that the output signal exists (e.g., for the purposes of connecting from a neuron object). But there was no guarantee that it actually did exist (it relied on all NeuronTypes manually specifying the "output" state variable). Since it is mandatory it makes more sense to just always include it (reducing boilerplate and avoiding the possibility of that signal not existing). I also think it makes sense conceptually to distinguish between the output signal and other state, as they are treated differently. The main difference is that neuron ops depend on the current value of the state signals to compute their output (i.e., the state signals are `incs` or `updates`; they're currently marked as `sets`, but we plan on changing that, see ). The `output` signal, on the other hand, I think makes more sense conceptually as a `set` (i.e., the neuron op just sets that signal to some value, it does not depend on the current value of the `output` to compute its `output`). It feels weird to think of the neuron's output activity as part of the "state" of those neurons (in the same way that we wouldn't think of the neuron's input signal as part of the "state" of the neurons).
The one significant change as a result is that you cannot set the initial state of the "output" variable. However, we were not reading the initial state of the output variable in any of our neuron types, and (for the reasons outlined above) I don't think any neuron type would/should be.
- e5e4d9f This test was only passing due to a lucky seed; Tanh neurons cannot be inhibited as this test is trying to do, since they can output negative values. Which I think is fine, we don't really need to include Tanh in that test.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->

 depends on this PR

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Covered by existing tests

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
<!--- If the PR warrants it, indicate where a reviewer should start reviewing. -->
<!--- All lengthy PRs and complicated average PRs warrant this section. -->
<!--- If the PR is quick or straightforward, remove this section. -->

I'd go through the commits sequentially, since they can be taken independently and build on each other.

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
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de345f6d201a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.