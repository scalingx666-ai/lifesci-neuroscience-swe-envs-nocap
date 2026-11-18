# Issue

**Title:** ANT Neuro SDK functions

## Description

Added ANT SDK info as custom config_board function `"get_info"`:

```python
board.config_board("get_info")
```
would return (for example):
```json
{
    "type": "EE411",
    "firmware_version": 12345,
    "serial_number": "424242",
    "sampling_rates": [500,512,1000,1024,2000,2048],
    "reference_ranges": [1,0.75,0.15],
    "bipolar_ranges": [1,0.75,0.15],
    "power_state": {
        "is_powered": 1,
        "is_charging": 0,
        "charging_level": -1
    }
}
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `389e3af810e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.