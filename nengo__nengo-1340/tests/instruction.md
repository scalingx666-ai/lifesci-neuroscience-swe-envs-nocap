# Issue

**Title:** Progress bar fixes

## Description

**Motivation and context:**
As noted in #1314 it can take a long time for the build progress bar to appear. This PR partially addresses this problem by fixing some problems:

* The counting of steps was off so that the progress bar thought the build was completed way to early causing an ETA of 0s (the appearance of the progress bar is based on this estimate exceeding a threshold).
* The progress bar should not just appear when the ETA exceeds a threshold, but also when enough time has elapsed (e.g. a long time could have elapsed but the ETA alone might be below the threshold because very few steps remain).
* A significant amount of time can be spend on shrinking the cache and thus I've included this as an additional step in the progress bar (more precisely the whole building of the top-level network is included as a step).

I think this improves the build progress bar enough to merge these changes. However, some issues are left open:

* The progress bar can still take some time to appear if the first decoder solver takes a long time. I don't think that this can be fixed without spawning a separate thread which will add its own slew of problems. We could also ditch the `AutoProgressbar` and immediately display the progress bars.
* It is hard to know how much time will be spent on shrinking the cache which make the ETA inaccurate (especially for small networks, for large networks this should be less of a problem). This could potentially be solved by storing how long the cache shrink took in earlier builds and using that as an estimate. However, this is not super straight forward to implement and I am doubtful that it is worth the developer time and added code complexity.
* The optimizer run is not included in the progress bar at all (it will run after the build progress bar displays finished). Again, there are some complications with including this into the progress bar at themoment (but maybe less so as for the previous point). Still, I have no idea how to predict the run time or even the number of iterations beforehand ...

**Interactions with other PRs:**
none

**How has this been tested?**
I used this script to manually test it on the console:
```python
import nengo

with nengo.Network() as model:
    e1 = nengo.Ensemble(4000, 20)
    e2 = nengo.Ensemble(4000, 20)
    n = nengo.Node(size_in=20)
    nengo.Connection(e1, n)
    nengo.Connection(e2, n)

with nengo.Simulator(model) as sim:
    pass
```

An automated test seems extremely hard to implement.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [ ] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `defb617a99f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.