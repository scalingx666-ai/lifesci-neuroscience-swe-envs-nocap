# Issue

**Title:** feat: Make it easier to use CountdownTimer in for/while loops

## Description

This comes out of me writing fairly repetitive code for quick tests of visual stimuli and realising there's a way to slightly streamline it... Extremely low priority, I just thought this would be nice & basically harmless.

### Example
Displaying a basic Polygon for 5s

Before:
```
from psychopy import visual
import time

win = visual.Window()
obj = visual.Polygon(win)

started = time.time()
while time.time() - started < 5:
    obj.draw()
    win.flip()
```

After:
```
from psychopy import clock, visual

win = visual.Window()
obj = visual.Polygon(win)

for t in clock.CountdownTimer(5):
    obj.draw()
    win.flip()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c7e1293ad37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.