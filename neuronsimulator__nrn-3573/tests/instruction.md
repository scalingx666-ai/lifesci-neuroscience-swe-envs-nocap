# Issue

**Title:** HOC object operator overloading: arithmetic and comparison

## Description

This is most of #3570 BUT PythonObjects don't work, which was the point. Regular HocObjects do.

A test that almost worked on a previous commit:

```
oc>objref pyobj, rxd, cyt, ca, cl, n, reaction, cacl2
oc>
oc>{
>       oc>    if (nrnpython("from neuron import n, rxd")) {
>               oc>        pyobj = new PythonObject()
>               oc>        rxd = pyobj.rxd
>               oc>        n = pyobj.n
>               oc>        create soma
>               oc>        cyt = rxd.Region(n.allsec())
>               oc>        ca = rxd.Species(cyt, 0, "ca", 2, 1)
>               oc>        print "created ca"
>               oc>        cl = rxd.Species(cyt, 0, "cl", -1, 1)
>               oc>        print "created cl"
>               oc>        cacl2 = rxd.Species(cyt, 0, "cacl2", 0, 0)
>               oc>        print "preparing to define reaction"
>               oc>    }
>       oc>}
created ca
created cl
preparing to define reaction
oc>objref cacl2
oc>cacl2 = ca + 2 * cl
initcode failed with 1 left
oc>cacl2 = ca 
oc>cacl2 = ca + cl
oc>cacl2 = ca + cl + cl
initcode failed with 1 left
oc>
```

and at some poimnt I printed out ca + cl and that was fine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `435a3dbdccba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.