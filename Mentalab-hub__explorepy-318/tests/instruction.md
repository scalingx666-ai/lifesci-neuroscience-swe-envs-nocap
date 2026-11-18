# Issue

**Title:** Check device name before usb connection

## Description

Test script:

```
import explorepy

explorepy.set_bt_interface('usb')
for i in range(10):
    exp_device = explorepy.Explore()

    exp_device.connect('Explore_DAAV')
    exp_device.set_sampling_rate(sampling_rate=4000)
    exp_device.record_data( 'file_name' + str(i), do_overwrite=True, duration=10, file_type='csv', block=True)
    exp_device.disconnect()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdcdc0283a79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.