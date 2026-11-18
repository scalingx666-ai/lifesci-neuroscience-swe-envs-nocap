# Issue

**Title:** ASC, lib_system_check.py: prevent errors when R pkg list is empty

## Description

@afni-rickr : this is a very minor suggestion.

When no R packages are installed, running the system check produces this traceback error:
```
Traceback (most recent call last):
  File "/home/ptaylor/abin/afni_system_check.py", line 719, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/ptaylor/abin/afni_system_check.py", line 713, in main
    rv = me.execute()
  File "/home/ptaylor/abin/afni_system_check.py", line 695, in execute
    if self.sys_check: self.show_system_info()
                       ~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/ptaylor/abin/afni_system_check.py", line 615, in show_system_info
    self.sinfo.show_all_sys_info()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/ptaylor/abin/afnipy/lib_system_check.py", line 2353, in show_all_sys_info
    self.check_dependent_progs()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/home/ptaylor/abin/afnipy/lib_system_check.py", line 1667, in check_dependent_progs
    self.check_R_libs()
    ~~~~~~~~~~~~~~~~~^^
  File "/home/ptaylor/abin/afnipy/lib_system_check.py", line 1962, in check_R_libs
    pver = self.get_R_lib_ver('phia')
  File "/home/ptaylor/abin/afnipy/lib_system_check.py", line 1921, in get_R_lib_ver
    sl = so[0].split()
         ~~^^^
IndexError: list index out of range
```

The current PR puts in a check to avoid that woe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16839884bbf6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.