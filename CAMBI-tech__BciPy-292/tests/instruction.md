# Issue

**Title:** Acquisition chunk size

## Description

# Overview

Modified data consumers to specify the acquisition chunk size to override default value set by the device driver. This prevents data loss during recording and allows us to make realtime data queries to devices that set a chunk size in their lsl stream_outlet.

## Ticket

https://www.pivotaltracker.com/story/show/185934928

## Contributions

- Updated lsl_recorder and lsl_client to set a max_chunklen. According to the [LSL Documentation](https://labstreaminglayer.readthedocs.io/projects/liblsl/ref/inlet.html), when a max_chunklen is not set it defaults to the value provided by the stream_outlet. This was not a problem with the DSI driver since it did not set a chunk size. However, there is one set in the [TobiiPro Driver](https://github.com/CAMBI-tech/App-TobiiPro/blob/bb186c59cc4bea1618c9076904f0eba01530575c/mainwindow.cpp#L180).
- Added functionality to the lsl_server module to simulate serving data with a set chunk size.

## Test

- I simulated a chunk_size of 1200 while serving mock eye tracker data and ran a Calibration task. Analysis on the recorded raw_data was consistent with our latest experiment data in that there were around 15 seconds of data missing at the end.
- I also streamed the data in a visualizer and was able to observe lags in the data stream with 20 seconds between new data, consistent with the configured chunk_size (20 seconds * 60 samples per second).
- After setting the max_chunklen, I ran the same mock server with the chunk size set to 1200 and ran another Calibration task. I analyzed the data and confirmed that all of the data needed for offline_analysis was recorded.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8513c27f11d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.