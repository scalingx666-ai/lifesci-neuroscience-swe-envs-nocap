# Issue

**Title:** Bugfix: Replace removed `sun.misc` Base64 classes with `java.util.Base64`

## Description

### Problem

`sun.misc.BASE64Decoder` and `sun.misc.BASE64Encoder` are JDK-internal classes that were **removed in Java 9**. Matlab versions shipping a newer JRE (R2026a uses Java 11) cannot even parse the files that import them:

```
Line 298: Error: File: import_label.m Line: 27 Column: 8
Unable to find or import 'sun.misc.BASE64Decoder'. Imported names must end with '.*' or be fully qualified.

Call stack:
>import_anatomy_fs.m at 298
>import_anatomy.m at 78
>bst_call.m at 28
>tree_callbacks.m>@(h,ev)bst_call(@import_anatomy,iSubject,0) at 575
```

Because an `import` is resolved when the function is parsed, even the two files that never use the decoder crash. This breaks importing any anatomy with FreeSurfer/CAT12 labels, reading and writing GIFTI surfaces, and the snapshots in HTML reports.

### Changes

Added `bst_base64()` in `toolbox/misc`, so the Java dependency lives in a single place:

```matlab
bytes = bst_base64('decode', str);    % str  : char array (line breaks allowed)
  str = bst_base64('encode', bytes);  % bytes: int8/uint8 vector (or Java byte[])
```

It uses `java.util.Base64` (Java >= 8), and falls back to `matlab.net.base64decode/encode` (Matlab >= R2016b) and then to the old `sun.misc` classes, so older installations keep working unchanged.

To keep the behaviour identical to the previous code, the helper:
- tolerates line breaks and white spaces in the encoded string (as `decodeBuffer` did),
- returns `int8` when decoding (as `decodeBuffer` did), so the existing `typecast()` and `dunzip()` calls are unchanged,
- strips the line breaks when encoding (this was done by the callers before).

Updated callers:

| File | Change |
| --- | --- |
| `toolbox/io/import_label.m` | removed the unused `import` |
| `toolbox/io/in_tess_gii.m` | removed the unused `import` |
| `toolbox/io/in_gii.m` | decoding of `Base64Binary` / `GZipBase64Binary` data arrays |
| `toolbox/io/out_tess_gii.m` | encoding of the vertices and faces |
| `toolbox/process/bst_report.m` | encoding of the PNG snapshots |

### Testing

Matlab R2026a Update 4 (Java 11.0.32), macOS:

- Base64 round-trip on 5000 random bytes, on `float32` arrays, on known test vectors (`Brainstorm` <-> `QnJhaW5zdG9ybQ==`), and on CRLF-wrapped input: all exact
- `in_gii` / `in_tess_gii` on a `GZipBase64Binary` surface (`external/ImaGIN/private/SEEG_cortex_hip_amy_8196.surf.gii`): 7861 vertices, 15359 faces decoded correctly
- Full `in_tess_gii` -> `out_tess_gii` -> `in_tess_gii` round-trip: faces identical, vertex max difference 0
- FreeSurfer anatomy import through the GUI, which was the original failure, now completes

Happy to adjust the naming or the location of the helper if you prefer something else.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4daefc0358e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.