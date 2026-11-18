# Issue

**Title:** Remove explicit LOGURU_STACKTRACES setting

## Description

The current loguru stacktrace configuration in liblsl can cause compilation failures on certain platforms. The relevant code is shown below.

cmake/ProjectOptions.cmake

```cmake
# Default LSL_DEBUGLOG to ON for Debug builds (single-config generators only)
string(COMPARE EQUAL "${CMAKE_BUILD_TYPE}" "Debug" _LSL_DEBUGLOG_DEFAULT)
option(LSL_DEBUGLOG "Enable (lots of) additional debug messages" ${_LSL_DEBUGLOG_DEFAULT})
```

cmake/Dependencies.cmake

```cmake
set_source_files_properties("thirdparty/loguru/loguru.cpp"
        PROPERTIES COMPILE_DEFINITIONS LOGURU_STACKTRACES=$<BOOL:${LSL_DEBUGLOG}>)
```

thirdparty/loguru/loguru.cpp

```cpp
#if defined(_WIN32) || defined(__CYGWIN__)
    #define LOGURU_PTHREADS    0
    #define LOGURU_WINTHREADS  1
    #ifndef LOGURU_STACKTRACES
        #define LOGURU_STACKTRACES 0
    #endif
#else
    #define LOGURU_PTHREADS    1
    #define LOGURU_WINTHREADS  0
    #ifdef __GLIBC__
        #ifndef LOGURU_STACKTRACES
            #define LOGURU_STACKTRACES 1
        #endif
    #else
        #ifndef LOGURU_STACKTRACES
            #define LOGURU_STACKTRACES 0
        #endif
    #endif
#endif

#if LOGURU_STACKTRACES
    #include <cxxabi.h>    // for __cxa_demangle
    #include <dlfcn.h>     // for dladdr
    #include <execinfo.h>  // for backtrace
#endif // LOGURU_STACKTRACES
```

As shown above, `LOGURU_STACKTRACES` depends on the GNU libc `backtrace` facility and is therefore not supported on all platforms, notably:

- Windows (MSVC)
- Linux with musl libc (see: https://github.com/ronchaine/libexecinfo)
- Android (see: )

Because `LSL_DEBUGLOG` defaults to `ON` for Debug builds when using a single-config generator, this forces `LOGURU_STACKTRACES` to be enabled and causes compilation errors on the platforms listed above.

To illustrate with Windows: when using the default Visual Studio generator (a multi-config generator), `CMAKE_BUILD_TYPE` is not set to `Debug`, so the problem does not surface. However, when using the Ninja generator (a single-config generator), the issue is triggered:

```
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug
cmake --build . --target install
```

https://github.com/SharpLSL/liblsl-ci-build/tree/loguru-stacktraces

https://github.com/SharpLSL/liblsl-ci-build/actions/runs/24925417393/job/72994456551

A straightforward workaround would be to skip the setting on Windows:

```cmake
if(NOT WIN32)
    set_source_files_properties("thirdparty/loguru/loguru.cpp"
        PROPERTIES COMPILE_DEFINITIONS LOGURU_STACKTRACES=$<BOOL:${LSL_DEBUGLOG}>)
endif()
```

However, this still does not address Linux musl libc or Android.

Testing showed that simply removing the `set_source_files_properties` call works well: loguru's built-in platform detection is already sensible — it defaults `LOGURU_STACKTRACES` to 0 on Windows and to 1
when `__GLIBC__` is defined.

It is also worth noting that loguru only prints a stack trace when `LOG_F(FATAL, ...)` is called, and liblsl does not currently log anything at the FATAL level.

Given the above, there are several possible approaches:

**Option 1: Always disable stacktraces** (since liblsl never logs at FATAL level)

```cmake
set_source_files_properties("thirdparty/loguru/loguru.cpp"
    PROPERTIES COMPILE_DEFINITIONS LOGURU_STACKTRACES=0)
```

**Option 2: Explicitly disable stacktraces when `LSL_DEBUGLOG` is OFF**

```cmake
if(NOT LSL_DEBUGLOG)
    set_source_files_properties("thirdparty/loguru/loguru.cpp"
        PROPERTIES COMPILE_DEFINITIONS LOGURU_STACKTRACES=0)
endif()
```

**Option 3: Remove the explicit `LOGURU_STACKTRACES` setting and let
loguru decide**

This PR uses Option 3. Other suggestions are welcome.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64988c6a14b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.