# Issue

**Title:** [add] print method for neuronlistz

## Description

Addresses #466 .

I simplified so it doesn't call expensive `contents.classes <- sapply(x, firstclass, USE.NAMES = F)`.

Artefact, we don't print the information about neuron types.

```r
> nzmv
'neuronlistz' containing 3000 neurons objects and 'data.frame' with 1 vars [998 kB]
```

Benchmark on 3000 neurons:

```r
# old
> system.time(print(nzmv))
'neuronlistz' containing 3000 'neuprintneuron' objects and 'data.frame' with 1 vars [998 kB]
   user  system elapsed 
 16.702   1.805  19.000 
# new
> system.time(print(nzmv))
'neuronlistz' containing 3000 neurons objects and 'data.frame' with 1 vars [998 kB]
   user  system elapsed 
  0.000   0.000   0.001 
```

Alternatively, we can add another rds that stores that info in zip? WDYT @jefferis ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88507a819c2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.