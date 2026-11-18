# Issue

**Title:** Fixes a couple of minor warnings

## Description

numba casting warning
```
NumbaTypeSafetyWarning: unsafe cast from uint64 to int64. Precision may be lost.
    overlapping_ids = overlapping_j_list[i]
```



`__del__` called before object is fully instantiated
```
Exception ignored in: <function BinaryRecordingExtractor.__del__ at 0x7006e81db6a0>
Traceback (most recent call last):
  File "/home/alessio/Documents/codes/spike_sorting/spikeinterface/spikeinterface/src/spikeinterface/core/binaryrecordingextractor.py", line 165, in __del__
    for segment in self.segments:
  File "/home/alessio/Documents/codes/spike_sorting/spikeinterface/spikeinterface/src/spikeinterface/core/baserecording.py", line 172, in segments
    return self._segments
AttributeError: 'BinaryFolderRecording' object has no attribute '_segments'
```

Would close  #4528

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ce685455302`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.