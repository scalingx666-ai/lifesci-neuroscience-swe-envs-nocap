# Issue

**Title:** ngraph operations inform when not a neuron is passed as an argument

## Description

This PR addresses the following problem (as reported by YJ on Salck)
 ```r
> n <- fafbseg:::read_l2skel("720575940630111628")
> prune_strahler(n, orderstoprune = 1)
Error in value[[3L]](cond) : 
  No points left after pruning. Consider lowering orders to prune!
```

But `prune_strahler(n[[1]], orderstoprune = 1)` works.

I suggest we make the error more explicit, i.e.:

```r
> strahler_order(n)
 Error in .verify_input_neuron(x) : 
Sorry, this function works only on `neuron` objects. Use `nlapply` to iterate over a neuronlist.
```

I rebuilt the docs too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46e4626d79d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.