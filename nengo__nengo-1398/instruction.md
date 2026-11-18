# Issue

**Title:** Create a custom op for PES learning rule

## Description

**Motivation and context:**
<!--- Why is this change required? What problem does it solve? -->
<!--- If it addresses an open issue, please link to the issue here. -->

All the other learning rules act as `updates`, meaning that if you compute a parameter delta on step `t`  the weights change on `t+1`.  That's pretty standard for learning rule behaviour.

Our current PES implementation, on the other hand, actually applies the update on step `t`.  So you could, in theory, compute an error signal, update connection weights, and have that affect the behaviour of downstream ensembles on the same timestep.

One reason why I'd say this is bad is that, just conceptually, it is inconsistent with the behaviour of the other learning rules in Nengo, and I think the expected behaviour of learning rules in general.  Another reason is that it means you can get unexpected cycles in the graph if you don't have a synaptic delay on the error connection, e.g.:

``` python
import nengo

with nengo.Network() as net:
    a = nengo.Ensemble(10, 1)
    b = nengo.Node(size_in=1)
    c = nengo.Connection(a, b, synapse=None, learning_rule_type=nengo.PES())
    nengo.Connection(b, c.learning_rule, synapse=None)

with nengo.Simulator(net) as sim:
    # this network won't build, because it has cycles in the op graph
```

This PR changes PES so that it acts as an `update`, like the other rules.  In order to do this we have to implement a custom PES operator (so that we can specify its output should be an `update`).  Technically we could get away without a custom op, and instead build a delay into PES by sticking a `SimProcess(..., mode="update")` into `build_pes`.  But that seemed like a weird/awkward solution to me, pretending that we have a Process in the PES rule just so that it will act as an `update`.

One potential downside of this change is related to this comment from the `build_pes` docstring: "Generic operators are used because they are more likely to be implemented on other backends like Nengo OCL."  Note that this is only relevant to backends that use the Nengo builder, which I think is just `nengo_ocl` and `nengo_dl` at the moment.  @hunse could comment for `nengo_ocl`, but for `nengo_dl` I'd actually find it easier if PES had its own operator.  That makes it easier for me to build an efficient implementation of that operator, because I have control over how it is implemented internally rather than being tied to the generic operators.  In addition, our current PES implementation already has some weird elements in it (e.g., it uses the `ElementwiseInc` operator to perform an outer product, which isn't the defined/expected behaviour for `ElementwiseInc`).  So backends already kind of need to be aware of the PES rule, even without the custom operator.

The only other downside (I think) is that the custom operator no longer exposes the `correction` signal for probing (since it is now internal to the operator).  Technically this is a breaking change, although I'd say a minor one.  Most people probably didn't even know that was probeable, I'd guess.  And the correction is just equal to the error signal (which is still probeable) times a constant (`learning_rate / n_neurons`), so the information is still pretty easy to retrieve.  However, if anyone is really worried about this, we could have the `SimPES` operator output that signal just for probing.

**Interactions with other PRs:**
<!--- If this change depends on or conflicts with another PR please list it here. -->
<!--- If this PR contains commits from another PR, describe what commits in this PR are unique. -->
<!--- If this PR is independent, then remove this section. -->

#1392 / #1095 touch build_pes, so will need to be updated
#1254 also implemented a custom PES operator, with a slightly different approach (along with a bunch of other changes)

**How has this been tested?**
<!--- Please describe in detail how you tested your changes. -->
<!--- Reviewers will test your PR in at least this way. -->

Passes all existing tests, and I added a new test for the cycle case described above.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Average (neither quick nor lengthy)


**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)
- Breaking change (fix or feature that causes existing functionality to change)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] I have run the test suite locally and all tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `026b94398fc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.