# Issue

**Title:** FBTractMeasurement: introduce measurement range clamping, and count excluded points

## Description

Clamps all of these:

```
+  clamped_ops["FractionalAnisotropy"] = Range(0.0, 1.0);
+  clamped_ops["RelativeAnisotropy"]   = Range(0.0, std::sqrt(2));
+  clamped_ops["LinearMeasurement"]    = Range(0.0, 1.0);
+  clamped_ops["PlanarMeasurement"]    = Range(0.0, 1.0);
+  clamped_ops["SphericalMeasurement"] = Range(0.0, 1.0);
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa03f78b6148`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.