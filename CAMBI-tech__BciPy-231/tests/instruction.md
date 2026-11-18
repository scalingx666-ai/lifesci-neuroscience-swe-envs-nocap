# Issue

**Title:** #182106570 ; Acquisition Channel Specifications

## Description

# Overview

Added functionality for configuration channel specifications for a given device.

## Ticket

https://www.pivotaltracker.com/story/show/182106570

## Contributions

- Refactored `devices` module to allow channels to be specified as either a list of names or a list of `ChannelSpec` objects, which provide additional information about a channel including the option to override the label when used in BciPy.
- Refactored `LslRecordingThread` to use overridden channel labels if provided.
- Refactored `lsl_server` to use the additional channel metadata if provided.
- Added unit tests

## Test

- Ran all unit tests
- Created a new entry in the devices.json file with additional channel metadata. Used this device for mocking a data server. Ran a calibration session with the device, confirming that the LSL metadata logged used the channel names and the raw_data used the channel labels. Ran offline_analysis on the data and proceeded with a Copy Phrase task.

```
    {
        "name": "Demo_channel_spec",
        "content_type": "EEG",
        "channels": [
            {"name": "ch1", "label": "P4", "type": "EEG", "units": "microvolts"},
            {"name": "ch2", "label": "Fz", "type": "EEG", "units": "microvolts"},
            {"name": "ch3", "label": "Pz", "type": "EEG", "units": "microvolts"},
            {"name": "ch4", "label": "F7", "type": "EEG", "units": "microvolts"},
            {"name": "ch5", "label": "PO8", "type": "EEG", "units": "microvolts"},
            {"name": "ch6", "label": "PO7", "type": "EEG", "units": "microvolts"},
            {"name": "ch7", "label": "Oz", "type": "EEG", "units": "microvolts"},
            {"name": "ch8", "label": "TRG","type": "EEG", "units": "microvolts"}
        ],
        "sample_rate": 300.0,
        "connection_methods": ["TCP", "LSL"],
        "description": "Alias to DSI-VR300 for backwards compatibility.",
        "excluded_from_analysis": ["TRG"]
    }
```

## Documentation

- Added some additional documentation in the README file for the acquisition module.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01a50ffb9c7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.