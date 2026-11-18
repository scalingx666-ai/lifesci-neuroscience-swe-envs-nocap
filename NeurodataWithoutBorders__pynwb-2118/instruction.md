# Issue

**Title:** get_nwbfile_version/get_nwb_version: Fix parsing pre-semver version specifiers

## Description

In commit NeurodataWithoutBorders/nwb-schema@dba02ff (update YAML specs with 2.1.0 specs, 2019-08-19) the help for nwb_version was changed in the following regard:

```
--- a/core/nwb.file.yaml
+++ b/core/nwb.file.yaml
@@ -2,220 +2,231 @@ groups:
[...]
   - name: nwb_version dtype: text
-    doc: 'File version string. COMMENT: Eg, NWB-1.0.0. This will be the name of the
-      format with trailing major, minor and patch numbers.'
-    value: 2.0b
+    value: 2.0.2
+    doc: File version string. Use semantic versioning, e.g. 1.2.1. This will be the
+      name of the format with trailing major, minor and patch numbers.
```

While adopting semantic versioning for nwb_version is a good step, care needs to be taken to allow reading older files.

Versions of IPNWB prior to AllenInstitute/IPNWB@70c65d4 (Switch to newer NWB specification 2.2.4, 2020-04-15) did follow the old suggestion in prefixing nwb_version with `NWB-`.

Let's disregard that prefix as was previsously done with the suffix 'b' in 26538b3f (Fix handling of version 2.0b (#1651), 2023-02-24).

Close #2117

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43cfa7b4b31c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.