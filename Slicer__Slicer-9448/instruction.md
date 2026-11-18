# Issue

**Title:** ENH: Let an application set the file extensions its installer associates

## Description

The NSIS installer associated a fixed list of extensions (.mrml, .xcat, .mrb) with the application. The list is now the Slicer_FILE_ASSOCIATION_EXTENSIONS option, which defaults to the same three.  This will not change any functionality here, but will allow a custom application to add its own files to this list via `CMakeLists.txt`

Example:
```ruby
# Associate CUSTOM project files with the application, so that double-clicking one opens it
set(Slicer_FILE_ASSOCIATION_EXTENSIONS .mrml .xcat .mrb .CUSTOM)
mark_as_superbuild(Slicer_FILE_ASSOCIATION_EXTENSIONS)
```

@ebrahimebrahim (supporting custom applications)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `667f5192056f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.