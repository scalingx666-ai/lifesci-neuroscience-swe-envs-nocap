# Issue

**Title:** fix: should be plural SoftwareVersions for _physio.md (eye tracking)

## Description

As already prescribed

```
❯ grep -B7 SoftwareVer ./src/schema/rules/sidecars/continuous.yaml
PhysioHardware:
  selectors:
    - suffix == "physio"
  fields:
    DeviceSerialNumber: optional
    Manufacturer: optional
    ManufacturersModelName: optional
    SoftwareVersions: optional
```

More on this point:

-  

attn @bids-standard/bep020

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57b0a9424f61`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.