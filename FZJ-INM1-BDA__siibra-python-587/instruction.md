# Issue

**Title:** fix: python closure is weird

## Description

fix closure bug

see a simplified reproduction:

```python

from concurrent.futures import ThreadPoolExecutor
from functools import partial

def call_fn(fn):
    fn()

def main():
    arr = []
    for i in range(10):
        def fn(j):
            print(j)
        arr.append(
            partial(fn, i)
        )
    
    with ThreadPoolExecutor(4) as ex:
        list(ex.map(
            call_fn,
            arr
        ))

def faulty():
    
    arr = []
    for i in range(10):
        def fn():
            print(i)
        arr.append(fn)
    
    with ThreadPoolExecutor(4) as ex:
        list(ex.map(
            call_fn,
            arr
        ))
    

if __name__ == "__main__":
    print("faulty")
    faulty()
    print("main")
    main()

```

prints

```
faulty
9
9
9
9
9
9
9
9
9
9
main
0
1
3
4
5
2
9
7
8
6
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26efca0ccdbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.