# Issue

**Title:** MRG, FIX: Safer exit

## Description

Under some circumstances #279 could lead to ugly exits like:
```
$ python -u ~/Desktop/brain.py 
Exception ignored in: <function Brain.__del__ at 0x7fd4dc0ac820>
Traceback (most recent call last):
  File "/home/larsoner/python/PySurfer/surfer/viz.py", line 2306, in __del__
  File "/home/larsoner/python/PySurfer/surfer/viz.py", line 2296, in close
  File "/home/larsoner/python/mayavi/mayavi/tools/figure.py", line 185, in close
  File "/home/larsoner/.local/lib/python3.8/site-packages/apptools/scripting/recordable.py", line 45, in _wrapper
  File "/home/larsoner/python/mayavi/mayavi/core/engine.py", line 491, in close_scene
  File "/home/larsoner/python/mayavi/tvtk/pyface/tvtk_scene.py", line 355, in close
  File "/home/larsoner/.local/lib/python3.8/site-packages/traits/trait_notifiers.py", line 400, in __call__
  File "/home/larsoner/.local/lib/python3.8/site-packages/traits/trait_notifiers.py", line 176, in _handle_exception
  File "/home/larsoner/.local/lib/python3.8/site-packages/traits/trait_notifiers.py", line 251, in _log_exception
ModuleNotFoundError: import of logging halted; None in sys.modules


$ python -u ~/Desktop/brain.py 
QWidget::paintEngine: Should no longer be called
QWidget::paintEngine: Should no longer be called
QWidget::paintEngine: Should no longer be called
QWidget::paintEngine: Should no longer be called
Exception ignored in: <function Brain.__del__ at 0x7f4021dc3820>
Traceback (most recent call last):
  File "/home/larsoner/python/PySurfer/surfer/viz.py", line 2309, in __del__
  File "/home/larsoner/python/PySurfer/surfer/viz.py", line 2305, in close
  File "/home/larsoner/.local/lib/python3.8/site-packages/traitsui/ui.py", line 260, in dispose
  File "/home/larsoner/.local/lib/python3.8/site-packages/traitsui/ui.py", line 595, in save_prefs
  File "/home/larsoner/.local/lib/python3.8/site-packages/traitsui/qt4/toolkit.py", line 327, in save_window
ModuleNotFoundError: import of traitsui.qt4 halted; None in sys.modules
```
This PR gets rid of these warnings for me.

@drammock reports that it still fixes the memory usage problems he had before #279

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3692eb4e13d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.