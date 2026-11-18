# Issue

**Title:** COMP: Fix `CodeSequenceMacro` implict declaration warning

## Description

Fix `CodeSequenceMacro` implict declaration warning: assign the instantiation arguments depending on the case and instantiate the class using them instead of using the assignment operator.

Fixes:
```
[215/263] Building CXX object Modules/Loadable/TractIO/TractIOCLI/CMakeFiles/VTK_to_DICOMTractLib.dir/VTK_to_DICOMTract.cxx.o
SlicerDMRI/Modules/Loadable/TractIO/TractIOCLI/VTK_to_DICOMTract.cxx:
 In function ‘int insert_polydata_scalars(TrcTrackSet*, vtkSmartPointer<vtkPolyData>)’:
SlicerDMRI/SlicerDMRI/Modules/Loadable/TractIO/TractIOCLI/VTK_to_DICOMTract.cxx:401:60:
 warning: implicitly-declared ‘CodeSequenceMacro& CodeSequenceMacro::operator=(const CodeSequenceMacro&)’ is deprecated [-Wdeprecated-copy]
  401 |       unitCode = CodeSequenceMacro("mm2/s", "UCUM", "mm2/s");
      |                                                            ^
In file included from SlicerDMRI/Slicer-build/DCMTK/dcmiod/include/dcmtk/dcmiod/iodcontentitemmacro.h:26,
                 from SlicerDMRI/Modules/Loadable/TractIO/TractIOCLI/VTK_to_DICOMTract.cxx:28:
SlicerDMRI/Slicer-build/DCMTK/dcmiod/include/dcmtk/dcmiod/iodmacro.h:55:5: note:
 because ‘CodeSequenceMacro’ has user-provided ‘CodeSequenceMacro::CodeSequenceMacro(const CodeSequenceMacro&)’
   55 |     CodeSequenceMacro(const CodeSequenceMacro& rhs);
      |     ^~~~~~~~~~~~~~~~~
SlicerDMRI/Modules/Loadable/TractIO/TractIOCLI/VTK_to_DICOMTract.cxx:405:59:
 warning: implicitly-declared ‘CodeSequenceMacro& CodeSequenceMacro::operator=(const CodeSequenceMacro&)’ is deprecated [-Wdeprecated-copy]
  405 |       unitCode = CodeSequenceMacro("1", "UCUM", "no units");
      |                                                           ^
In file included from SlicerDMRI/Slicer-build/DCMTK/dcmiod/include/dcmtk/dcmiod/iodcontentitemmacro.h:26,
                 from SlicerDMRI/Modules/Loadable/TractIO/TractIOCLI/VTK_to_DICOMTract.cxx:28:
SlicerDMRI/Slicer-build/DCMTK/dcmiod/include/dcmtk/dcmiod/iodmacro.h:55:5:
 note: because ‘CodeSequenceMacro’ has user-provided ‘CodeSequenceMacro::CodeSequenceMacro(const CodeSequenceMacro&)’
   55 |     CodeSequenceMacro(const CodeSequenceMacro& rhs);
      |     ^~~~~~~~~~~~~~~~~
```

raised for example at:
https://github.com/SlicerDMRI/SlicerDMRI/actions/runs/6686457985/job/18165832119#step:7:530

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bbe2cf9ddf7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.