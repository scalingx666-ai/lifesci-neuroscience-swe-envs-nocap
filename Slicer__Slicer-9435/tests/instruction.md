# Issue

**Title:** ENH: Check contents of .txt files in the transforms reader

## Description

Transform files and text files both use the `.txt` extension, so the transforms reader and the text file reader reported the same confidence for any `.txt` file, and the reader that was registered first won. That is the transforms reader, so a plain text file dropped into the application was offered and loaded as a transform (and failed to load).

The transforms reader now looks at the beginning of `.txt` files:
- If the file looks like an ITK transform file (it starts with `#Insight Transform File`, or its first line that is not a comment specifies the transform type, `Transform: ...`), the confidence is 0.6, higher than the text file reader's.
- Otherwise the confidence is 0.3, lower than the text file reader's. It is still above zero, so the file can be loaded as a transform when that file type is requested explicitly.

Files with other extensions are handled as before.

Added `vtkSlicerTransformsReaderTest1`. It checks a transform file with and without the `#Insight Transform File` line, a plain text file, an empty file, and a `.tfm` file.

Tested in the web build of Slicer (SlicerWeb): plain `.txt` files are loaded as text nodes, and ITK transform `.txt` files as transforms. The new test was compiled there but has not been run in a desktop build yet.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ac8f3191a09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.