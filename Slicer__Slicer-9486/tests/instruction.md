# Issue

**Title:** BUG: Fail configure if qmake and Qt libraries are from different Qt installs

## Description

## Root cause

On the macOS arm64 factory (recoil), Homebrew Qt 6.11.1 is installed alongside the qt-everywhere build used by Slicer. Although `Qt6_DIR` points to the qt-everywhere install, the Qt tool packages were resolved from Homebrew:

```
Qt6_DIR:PATH=/D/Support/qt-everywhere-install-6.11.1-arm64/lib/cmake/Qt6
Qt6CoreTools_DIR:PATH=/opt/homebrew/lib/cmake/Qt6CoreTools
Qt6GuiTools_DIR:PATH=/opt/homebrew/lib/cmake/Qt6GuiTools
...
-- Setting QT_PLUGINS_DIR: /opt/homebrew/share/qt/plugins
-- Setting QT_LIBRARY_DIR: /opt/homebrew/lib
```

Qt looks up `Qt6<Module>Tools` with its own install directory only as a `PATHS` hint, which is searched after the default prefixes, and on arm64 macOS CMake includes `/opt/homebrew` in `CMAKE_SYSTEM_PREFIX_PATH`. Because `QT_PLUGINS_DIR` and `QT_LIBRARY_DIR` are queried from `Qt6::qmake`, the Homebrew `libqcocoa.dylib` (built with Vulkan, 24 Vulkan imports) was installed next to the qt-everywhere `QtGui` (built without Vulkan, 0 exports). This also affects the build-tree launcher settings, which explains the test failures on CDash.

I reproduced it with a minimal project and a clean environment (`env -i`, `PATH=/usr/bin:/bin:/usr/sbin:/sbin`).

## Change

After querying qmake, check that `Qt::Core` is located under qmake's `QT_INSTALL_PREFIX` and fail with an error that suggests `CMAKE_IGNORE_PREFIX_PATH` or `CMAKE_PREFIX_PATH`. The prefix is compared, not the lib directory, because on Windows `Qt::Core`'s location is the DLL in `bin/`.

## Testing (on recoil, CMake 3.31.8)

| Configuration | Result |
|---|---|
| `Qt6_DIR`=qt-everywhere (current factory setup) | Fails with the new error naming `/opt/homebrew/bin/qmake` |
| `Qt6_DIR`=qt-everywhere + `CMAKE_IGNORE_PREFIX_PATH=/opt/homebrew` | Passes, `QT_PLUGINS_DIR` = qt-everywhere plugins |
| `Qt6_DIR`=Homebrew Qt only | Passes |

Not yet tested on Windows or Linux.

The factory configuration will be fixed separately in Slicer/DashboardScripts.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c73e90edef47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.