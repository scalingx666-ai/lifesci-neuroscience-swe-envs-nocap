# Issue

**Title:** Improve Clock.wait accuracy

## Description

It seems that Clock.wait() was not fully accurate and could return before the wait time was reached.

Here is what I measured before my fix:

```
In [3]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
1000

In [4]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
999

In [5]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
999

In [6]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
999

In [7]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
999

In [8]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time - t1)
1000

In [9]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time - t1)
1000

In [10]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time - t1)
1000

In [11]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time - t1)
1000
```

Likewise, using the monotonic timer gave me this:

```
In [5]: from expyriment.misc._timer import get_time

In [6]: get_time
Out[6]: <function expyriment.misc._timer.get_time()>

In [7]: t1 = get_time(); exp.clock.wait(1000); print(get_time() - t1)
0.9998227499891073

In [8]: t1 = get_time(); exp.clock.wait(1000); print(get_time() - t1)
0.9992837080499157

In [9]: t1 = get_time(); exp.clock.wait(1000); print(get_time() - t1)
1.0000693750334904

In [10]: t1 = get_time(); exp.clock.wait(1000); print(get_time() - t1)
0.9994772920617834

In [11]: t1 = get_time(); exp.clock.wait(1000); print(get_time() - t1)
1.000120082986541

In [12]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t)
0.9993992500239983

In [13]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t)
0.9995621669804677

In [14]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t)
0.9996588750509545

In [15]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t)
0.9994374999077991

In [16]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t)
0.999259041971527
```

This seemed incorrect to me.

I think the problem was flooring to int already when defining the start time (by calling Clock.time, which might return e.g. 123 while it might actually be already 123.4). I changed this now to have start as the monotonic time as float instead (similar to how we have done it in other wait methods, such as the keyboard).

With this I now get the following measurements:

```
In [2]: from expyriment.misc._timer import get_time

In [3]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t * 1000)
1000.141124939546

In [4]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t * 1000)
1000.1760839950293

In [5]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t * 1000)
1000.306916073896

In [6]: t1 = get_time(); exp.clock.wait(1000); t = get_time() - t1; print(t * 1000)
1000.1192919444293
```

And likewise:

```
In [4]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
1000

In [5]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
1000

In [6]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
1000

In [7]: exp.clock.reset_stopwatch(); exp.clock.wait(1000); print(exp.clock.stopwatch_time)
1000

In [8]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time-t1)
1000

In [9]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time-t1)
1000

In [10]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time-t1)
1000

In [11]: t1=exp.clock.time; exp.clock.wait(1000); print(exp.clock.time-t1)
1000
```

I am not sure why I see so much overhead here (up to 300ms), but when I actually do the profiling within the wait method, I get much smaller values (around 1000.005).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cd139da3dc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.