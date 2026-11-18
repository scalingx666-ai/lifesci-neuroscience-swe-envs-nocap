# Issue

**Title:** Reworking NeuronType.current and NeuronType.rates

## Description

**Motivation and context:**
In #1419, @arvoelke pointed out that the docstring of the `current` method (and, by association, `rates`) did not reflect the way in which these methods are being used. When I looked into it more, I realized that these were not usages that I intended, hence the incorrect docstrings, but also that these usages were now the majority of use cases because they allow for more efficient code.

To explain, `current` is just a tiny helper function that does `gain * x + bias`. I originally intended for all three of these variables to be of shape `(n_neurons,)`, so it's all simple element-wise multiplication. However, at some point we started passing in `x` values with shapes `(n_samples, 1)`, which due to NumPy's broadcasting rules, ends up giving you a result that is of shape `(n_samples, n_neurons)`.

The use case I was envisioning, passing in `(n_neurons,)`, lets you provide different `x` values to each neuron. When passing in `(n_samples, 1)`, you provide the same input to all neuron, but you can provide multiple inputs at once. When passing in `(n_samples, n_neurons)`, you can provide multiple inputs and those inputs can be different for each neuron. Hopefully it's obvious that the more efficient thing to do is to just call `current` once with all of the samples (usually eval_points), so that tends to be the most common use case. Passing in `(n_samples, 1)` ends up being useful when generating response curves, since you want to see every neuron's response to the same input. Passing in `(n_neurons,)` is, in most cases, just an inefficient version of passing in `(n_samples, n_neurons)`.

Note that in all of these cases, `x` has already been projected onto the neuron's encoding vector and has been scaled by the radius, which has further confused things because

1. We don't have a separate name for the original input vector `x` and the `x` we're using in this case.
2. I called `x` the "input vector" in the previous docstring, which is sort of defensible but quite confusing.

Also note that while everything I said above was for `current`, the same is also true of `rates` because `rates` first calls `current` and then makes other variables the same shape as the value returned by `current`.

With all that context, it is hopefully easier to understand the changes that I made in this PR. I have essentially implemented two ways to clear up the confusion that I've explained above.

The first way (commit 81a6fdf692cbe40215aa89) tries to maintain backwards compatibility, but make things slightly more consistent, but having `current` (and consequently `rates`) always return a 2d array of shape `(n_samples, n_neurons)`, even if the cases with 1 sample -- which, as I have noted above, ends up being a relatively rare use case, even though it was the one in the docstring. It was relatively easy to fix any tests that were failing as a result of this change, though it resulted in some ugliness in parts.

The second way (commit 0c0d96510220ca5a) attempts to embrace the more common use cases, at the cost of backwards compatibility. This commit assumes that we pretty much always want to be passing in more than one sample, and makes the one-sample case the slightly awkward one (e.g., you have to pass in something of shape `(1, n_neurons)` if you really want one sample). This was also somewhat easy to fix, and I think the result is easier to deal with and easier to explain. However, it may be the case that other backends are relying on the current behavior.

So, if anyone has any thoughts on whether one of these two approaches is preferred, or if there's some obviously better third option I haven't thought of, please share it here. Also, if anyone knows of any usages of these methods that will be affected by these changes (@arvoelke ?) it would be good to know ahead of time to either defer this to a 3.0 release or at least knowingly break a few things.

**How has this been tested?**
The usual test suite.

**How long should this take to review?**

- Average (neither quick nor lengthy)

**Types of changes:**

- Breaking change (fix or feature that causes existing functionality to change)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89954cb40806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.