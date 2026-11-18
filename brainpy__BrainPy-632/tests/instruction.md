# Issue

**Title:** Fix delayvar not correct in concat mode

## Description

<!--- Provide a general summary of your changes in the Title above -->
<!--- Please do remember to follow the contributing guidelines -->

## Description
The delay variable with "concat" update method seems not being updated correctly. See the following code for example:
```python
import brainpy.math as bm

spike = bm.zeros(5, dtype=bm.bool)
delay_len = 2

print('Rotation mode:')
spike_buffer = bm.LengthDelay(spike, delay_len, update_method='rotation')
for i in range(5):
    spike[i] = True
    spike_buffer.update(spike)
    spike_delay = spike_buffer.retrieve(delay_len)
    
    print(spike.value)
    print(spike_delay)
    print('')
    
print('Concat mode:')
spike = bm.zeros(5, dtype=bm.bool)
spike_buffer = bm.LengthDelay(spike, delay_len=delay_len, update_method='concat')
for i in range(5):
    spike[i] = True
    spike_buffer.update(spike)
    spike_delay = spike_buffer.retrieve(delay_len)
    
    print(spike.value)
    print(spike_delay)
    print('')
```
Output:
```
Rotation mode:
[ True False False False False]
[False False False False False]

[ True  True False False False]
[False False False False False]

[ True  True  True False False]
[ True False False False False]

[ True  True  True  True False]
[ True  True False False False]

[ True  True  True  True  True]
[ True  True  True False False]

Concat mode:
[ True  True  True  True  True]
[False False False False False]

[ True  True  True  True  True]
[False False False False False]

[ True  True  True  True  True]
[False False False False False]

[ True  True  True  True  True]
[False False False False False]

[ True  True  True  True  True]
[False False False False False]
```

The cause is in line 476 of `delayvars.py`, the code only update the first row of the data buffer matrix.

After fixing the issue, the above test code can run correctly:
```
Rotation mode:
[ True False False False False]
[False False False False False]

[ True  True False False False]
[False False False False False]

[ True  True  True False False]
[ True False False False False]

[ True  True  True  True False]
[ True  True False False False]

[ True  True  True  True  True]
[ True  True  True False False]

Concat mode:
[ True False False False False]
[False False False False False]

[ True  True False False False]
[False False False False False]

[ True  True  True False False]
[ True False False False False]

[ True  True  True  True False]
[ True  True False False False]

[ True  True  True  True  True]
[ True  True  True False False]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eb7cee3e105`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.