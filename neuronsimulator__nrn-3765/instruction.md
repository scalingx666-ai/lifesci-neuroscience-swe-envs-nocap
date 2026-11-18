# Issue

**Title:** gui: restore print newlines when pyrepl has OPOST off

## Description

test.py
```
from neuron import h, gui

def p():
    for i in range(5):
        print("hello")
        
p()     
   
h.xpanel("test")
h.xbutton("print", p)
h.xpanel()
```
Launch with
```
python -i test.py
```
And press the "print" button.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eaa74e51787`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.