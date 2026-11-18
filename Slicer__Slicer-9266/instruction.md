# Issue

**Title:** ENH: Fix macOS bundle verification and add 'packageverify' target

## Description

SlicerCPackBundleVerify.cmake was broken: it was never wired into the build and contained a syntax error. By relying on BundleUtilities' verify_app() it also both missed real packaging errors and raised false alarms:
 - missed errors: verify_app() treats unresolved @rpath references as warnings, so a bundle missing entire frameworks (e.g. Qt not embedded) still reported success.
 - false alarms: it emitted "cannot resolve" warnings for @rpath items even on a correct bundle.

The script was not used in the build process, but it is a useful feature, therefore instead of removing it, I got it rewritten by Claude to perform a strict, dyld-accurate self-containment check, and add a 'packageverify' convenience target that runs it against the bundle staged by CPack.

For every Mach-O file in the bundle the script parses "otool -l" and:
 - FATAL: reports frameworks with a missing binary (empty .framework skeleton) and dependent libraries that do not resolve to a file inside the bundle. @rpath is expanded against each binary's own LC_RPATH plus the main executable's (dyld builds its run-path list from the whole load chain), so plugins that carry no rpath of their own are handled without false positives.
 - WARNING: reports non-relocatable LC_RPATH entries (build-tree leaks or foreign paths baked into bundled Python wheels; harmless because dyld ignores paths that do not exist), optional external backends under /usr/local or /opt (e.g. the Qt SQL drivers), and unresolved weak dependencies.

The script verifies the already-built package, so run 'make package' first:

  make package
  make packageverify

Example output on a bundle where Qt failed to be embedded:

```
kyle@rootmacs-Mac-mini Slicer-build % make packageverify Verifying packaged application bundle is self-contained -- Verifying bundle is self-contained: /Users/kyle/d/Slicer-Release/Slicer-build/_CPack_Packages/macosx-amd64/DragNDrop/Slicer-5.13.0-2026-07-04-macosx-amd64/3D Slicer 5.13.0-2026-07-04.app

ERROR: 27 framework(s) do not contain their binary (empty '.framework' skeleton -- the fixup did not embed the library):
  - QtCore.framework
  - QtCore5Compat.framework
  - QtDesigner.framework ...
  - QtWebEngineWidgets.framework
  - QtWidgets.framework
  - QtXml.framework

ERROR: 30 dependency(ies) do not resolve inside the bundle:
  - [MISSING] @rpath/Frameworks/QtWidgets.framework/Versions/A/QtWidgets referenced by 253 binary(ies), e.g. Contents/bin/Python/vtkmodules/vtkRenderingQt.cpython-312-darwin.so
  - [MISSING] @rpath/Frameworks/QtGui.framework/Versions/A/QtGui referenced by 272 binary(ies), e.g. Contents/lib/QtPlugins/sqldrivers/libqsqlpsql.dylib ...
  - [MISSING] @rpath/QtNetwork.framework/Versions/A/QtNetwork referenced by 6 binary(ies), e.g. Contents/lib/QtPlugins/tls/libqcertonlybackend.dylib
  - [MISSING] @rpath/QtCore.framework/Versions/A/QtCore referenced by 6 binary(ies), e.g. Contents/lib/QtPlugins/tls/libqcertonlybackend.dylib

WARNING: 8 non-relocatable LC_RPATH entry(ies) (absolute paths leaking the build/packaging machine or bundled Python wheels; non-fatal -- dyld ignores paths that do not exist):
  - /Users/kyle/Qt6/6.9.3/macos/lib present in 246 binary(ies), e.g. Contents/bin/Python/vtkmodules/vtkRenderingQt.cpython-312-darwin.so
  - /Users/runner/work/Pillow/Pillow/build/deps/darwin/lib present in 1 binary(ies), e.g. Contents/lib/Python/lib/python3.12/site-packages/PIL/.dylibs/libjpeg.62.4.0.dylib ...
  - /Users/kyle/d/Slicer-Release/teem-build/bin present in 269 binary(ies), e.g. Contents/lib/QtPlugins/designer/libqMRMLWidgetsPlugins.so
  - /Users/kyle/d/Slicer-Release/qRestAPI-build present in 2 binary(ies), e.g. Contents/lib/Slicer-5.13/libqSlicerBaseQTCore.dylib

WARNING: 2 dependency(ies) on optional external libraries (/usr/local, /opt) that are not bundled by design (non-fatal; disables only the corresponding plugin, e.g. a Qt SQL driver):
  - /usr/local/lib/libmimerapi.dylib
  - /usr/local/opt/libiodbc/lib/libiodbc.2.dylib

CMake Error at /Users/kyle/d/Slicer/CMake/SlicerCPackBundleVerify.cmake:504 (message):
  Bundle verification FAILED with 57 error(s): the application bundle is not
  self-contained.  See the report above.

make[3]: *** [CMake/LastConfigureStep/CMakeFiles/packageverify] Error 1
make[2]: *** [CMake/LastConfigureStep/CMakeFiles/packageverify.dir/all] Error 2
make[1]: *** [CMake/LastConfigureStep/CMakeFiles/packageverify.dir/rule] Error 2
make: *** [packageverify] Error 2
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `143b942237aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.