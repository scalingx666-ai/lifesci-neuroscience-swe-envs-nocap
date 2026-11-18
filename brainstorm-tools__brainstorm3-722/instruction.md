# Issue

**Title:** Process: Sync recordings, add `xcorr` as sync method

## Description

Hello, 

This is a PR to use the approximation when std is detected to be large: 


Before: 
```
Lag difference between @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-eeg_run-02_band_notch_resample and @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-physio_run-02_resample : 91683.58 ms **(std: 83872.79 ms)**
Lag difference between @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-eeg_run-02_band_notch_resample and @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-nirs_run-02 : -277246.51 ms (std: 125.73 ms)
```

![image](https://github.com/user-attachments/assets/a5b9130e-ed90-42b0-a5a3-573031e24868)


The events are no longer synced with the analog trigger

After: 
```

Lag difference between @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-eeg_run-02_band_notch_resample and @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-physio_run-02_resample : 108628.00 ms (std: 0.00 ms)
Lag difference between @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-eeg_run-02_band_notch_resample and @rawsub-PA13_ses-EEGfNIRS02_task-sleep_mod-nirs_run-02 : -277228.00 ms (std: 0.00 ms)

```

![image](https://github.com/user-attachments/assets/8253511f-891c-4704-9eb3-c5a41ab59f10)

(synchronization are well aligned with the analog trigger)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `583876d9696d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.