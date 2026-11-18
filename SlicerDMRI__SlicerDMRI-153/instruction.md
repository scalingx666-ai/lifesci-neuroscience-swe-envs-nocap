# Issue

**Title:** COMP: fix copydata ambiguity and missing math.h

## Description

Fixes two build errors related to updated VTK.

First was a missing math.h include and second was an ambiguous method invocation.

```
Building CXX object Libs/vtkDMRI/CMakeFiles/vtkDMRI.dir/vtkPolyDataTensorToColor.cxx.o
/home/pieper/slicer4/latest/Extensions/ExtensionsIndex-build/SlicerDMRI/Libs/vtkDMRI/vtkPolyDataTensorToColor.cxx: In member function ‘virtual int vtkPolyDataTensorToColor::RequestData(vtkInformation*, vtkInformationVector**, vtkInformationVector*)’:
/home/pieper/slicer4/latest/Extensions/ExtensionsIndex-build/SlicerDMRI/Libs/vtkDMRI/vtkPolyDataTensorToColor.cxx:380:36: error: call of overloaded ‘CopyData(vtkPointData*&, int, vtkIdType&)’ is ambiguous
  380 |       outPD->CopyData(pd,0,ptOffset);
      |                                    ^
In file included from /home/pieper/slicer4/latest/Slicer-superbuild/VTK/Common/DataModel/vtkPointData.h:29,
                 from /home/pieper/slicer4/latest/Extensions/ExtensionsIndex-build/SlicerDMRI/Libs/vtkDMRI/vtkPolyDataTensorToColor.cxx:21:
/home/pieper/slicer4/latest/Slicer-superbuild/VTK/Common/DataModel/vtkDataSetAttributes.h:519:8: note: candidate: ‘void vtkDataSetAttributes::CopyData(vtkDataSetAttributes*, vtkIdType, vtkIdType)’
  519 |   void CopyData(vtkDataSetAttributes* fromPd, vtkIdType fromId, vtkIdType toId);
      |        ^~~~~~~~
/home/pieper/slicer4/latest/Slicer-superbuild/VTK/Common/DataModel/vtkDataSetAttributes.h:521:8: note: candidate: ‘void vtkDataSetAttributes::CopyData(vtkDataSetAttributes*, vtkIdList*, vtkIdType)’
  521 |   void CopyData(vtkDataSetAttributes* fromPd, vtkIdList* fromIds, vtkIdType destStartId = 0);
      |        ^~~~~~~~
make[5]: *** [Libs/vtkDMRI/CMakeFiles/vtkDMRI.dir/build.make:100: Libs/vtkDMRI/CMakeFiles/vtkDMRI.dir/vtkPolyDataTensorToColor.cxx.o] Error 1
make[4]: *** [CMakeFiles/Makefile2:1753: Libs/vtkDMRI/CMakeFiles/vtkDMRI.dir/all] Error 2
make[3]: *** [Makefile:163: all] Error 2
make[2]: *** [CMakeFiles/inner.dir/build.make:113: inner-prefix/src/inner-stamp/inner-build] Error 2
make[1]: *** [CMakeFiles/Makefile2:239: CMakeFiles/inner.dir/all] Error 2
make: *** [Makefile:95: all] Error 2

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3116d085510b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.