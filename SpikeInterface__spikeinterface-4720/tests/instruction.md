# Issue

**Title:** Fix encoding error in shellscript on Windows

## Description

When checking installed sorters on Windows, I get this error:
```
---------------------------------------------------------------------------
UnicodeDecodeError                        Traceback (most recent call last)
Cell In[10], line 1
----> 1 ss.installed_sorters()

File [~\Documents\Codes\spikeinterface\src\spikeinterface\sorters\sorterlist.py:84](file:///C:/Users/alejo/Documents/Codes/spikeinterface/src/spikeinterface/sorters/sorterlist.py#line=83), in installed_sorters()
     81 def installed_sorters():
     82     """Lists installed sorters."""
---> 84     return sorted([s.sorter_name for s in sorter_full_list if s.is_installed()])

File [~\Documents\Codes\spikeinterface\src\spikeinterface\sorters\external\hdsort.py:86](file:///C:/Users/alejo/Documents/Codes/spikeinterface/src/spikeinterface/sorters/external/hdsort.py#line=85), in HDSortSorter.is_installed(cls)
     84 @classmethod
     85 def is_installed(cls):
---> 86     if cls.check_compiled():
     87         return True
     88     return check_if_installed(cls.hdsort_path)

File [~\Documents\Codes\spikeinterface\src\spikeinterface\sorters\basesorter.py:380](file:///C:/Users/alejo/Documents/Codes/spikeinterface/src/spikeinterface/sorters/basesorter.py#line=379), in BaseSorter.check_compiled(cls)
    372 shell_cmd = f"""
    373 #!/bin/bash
    374 if ! [ -x "$(command -v {cls.compiled_name})" ]; then
   (...)    377 fi
    378 """
    379 shell_script = ShellScript(shell_cmd)
--> 380 shell_script.start()
    381 retcode = shell_script.wait()
    382 if retcode != 0:

File [~\Documents\Codes\spikeinterface\src\spikeinterface\sorters\utils\shellscript.py:90](file:///C:/Users/alejo/Documents/Codes/spikeinterface/src/spikeinterface/sorters/utils/shellscript.py#line=89), in ShellScript.start(self)
     86 self._process = subprocess.Popen(
     87     cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, bufsize=1, universal_newlines=True, encoding=encoding
     88 )
     89 with open(script_log_path, "w+") as script_log_file:
---> 90     for line in self._process.stdout:
     91         script_log_file.write(line)
     92         if self._verbose:
     93             # Print onto console depending on the verbose property passed on from the sorter class

File <frozen codecs>:325, in BufferedIncrementalDecoder.decode(self, input, final)
    322 'Could not get source, probably due dynamically evaluated source code.'

UnicodeDecodeError: 'utf-8' codec can't decode byte 0x8a in position 9: invalid start byte
```

The fix is to ignore these errors :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `217ddc50422a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.