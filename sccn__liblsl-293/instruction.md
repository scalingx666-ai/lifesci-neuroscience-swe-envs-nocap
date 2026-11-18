# Issue

**Title:** Fix MSVC compilation issues caused by non-ASCII source characters

## Description

This patch fixes an issue where non-ASCII characters in the source code can cause compilation warnings or even errors in CJK locales.

For example, on my Windows 11 system with the Simplified Chinese locale, the local code page is CP936. Although the source files are encoded in UTF-8, as of Visual Studio 2026, the Microsoft compiler still cannot correctly read UTF-8 files without a BOM by default. As a result, it falls back to the system code page when parsing the source files, which can lead to the following warnings and errors:

* D:\liblsl\include\lsl\common.h(1,1): warning C4819: The file contains a character that cannot be represented in the current code page (936). Save the file in Unicode format to prevent data loss. [D:\liblsl\build-x86-windows-static\lslver.vcxproj]
* D:\liblsl\testing\int\network.cpp(79,2): error C2001: Newline in constant [D:\liblsl\build-x86-windows-static\testing\lsl_test_internal.vcxproj]
* D:\liblsl\testing\int\network.cpp(79,1): error C1057: Unexpected end-of-file in macro expansion

<details>
<summary>Build log:</summary>

```
D:\liblsl>mkdir build-x86-windows-static

D:\liblsl>cd build-x86-windows-static

D:\liblsl\build-x86-windows-static>cmake .. -DCMAKE_TOOLCHAIN_FILE="D:\vcpkg\scripts\buildsystems\vcpkg.cmake" -DVCPKG_TARGET_TRIPLET=x86-windows-static -DCMAKE_GENERATOR_PLATFORM=Win32 -DLSL_BUILD_STATIC=ON -DLSL_BUNDLED_BOOST=OFF -DLSL_FETCH_PUGIXML=OFF -DCMAKE_INSTALL_PREFIX=install -DLSL_UNITTESTS=ON -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -DLSL_TOOLS=ON
-- Building for: Visual Studio 18 2026
-- Selecting Windows SDK version 10.0.26100.0 to target Windows 10.0.26200.
-- The C compiler identification is MSVC 19.51.36256.0
-- The CXX compiler identification is MSVC 19.51.36256.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: D:/Program Files/Microsoft Visual Studio/18/Community/VC/Tools/MSVC/14.51.36231/bin/Hostx64/x86/cl.exe - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: D:/Program Files/Microsoft Visual Studio/18/Community/VC/Tools/MSVC/14.51.36231/bin/Hostx64/x86/cl.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found
-- Found Threads: TRUE
-- Found Git: D:/Program Files/Git/cmd/git.exe (found version "2.55.0.windows.2")
-- Git version information: dev/v1.16.2-161-ge651023c
-- Using system pugixml
-- Using system Boost
CMake Warning (dev) at D:/vcpkg/installed/x86-windows-static/share/boost/vcpkg-cmake-wrapper.cmake:3 (_find_package):
  Policy CMP0167 is not set: The FindBoost module is removed.  Run "cmake
  --help-policy CMP0167" for policy details.  Use the cmake_policy command to
  set the policy and suppress this warning.

Call Stack (most recent call first):
  D:/vcpkg/scripts/buildsystems/vcpkg.cmake:893 (include)
  cmake/Dependencies.cmake:70 (find_package)
  CMakeLists.txt:18 (include)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- Found Boost: D:/vcpkg/installed/x86-windows-static/share/boost/BoostConfig.cmake (found version "1.92.0")
-- int/inireader.cppint/network.cppint/stringfuncs.cppint/streaminfo.cppint/samples.cppint/postproc.cppint/serialization_v100.cppint/sync_endian.cppint/tcpserver.cppint/sendbuffer.cpp
-- Included LSLCMake helpers, rev. 18
-- LSL: Detected architecture: i386
-- LSL: Detected OS: Win
-- Configuring done (14.9s)
-- Generating done (0.1s)
-- Build files have been written to: D:/liblsl/build-x86-windows-static

D:\liblsl\build-x86-windows-static>cmake --build . --config Release --target install
适用于 .NET Framework MSBuild 版本 18.9.1+a81b43525

  1>Checking Build System
  Building Custom Rule D:/liblsl/build-x86-windows-static/_deps/catch2-src/src/CMakeLists.txt
  catch_chronometer.cpp
  catch_benchmark_function.cpp
  catch_run_for_at_least.cpp
  catch_stats.cpp
  catch_generator_exception.cpp
  catch_generators.cpp
  catch_generators_random.cpp
  catch_reporter_automake.cpp
  catch_reporter_common_base.cpp
  catch_reporter_compact.cpp
  catch_reporter_console.cpp
  catch_reporter_cumulative_base.cpp
  catch_reporter_event_listener.cpp
  catch_reporter_helpers.cpp
  catch_reporter_junit.cpp
  catch_reporter_multi.cpp
  catch_reporter_registrars.cpp
  catch_reporter_sonarqube.cpp
  catch_reporter_streaming_base.cpp
  catch_reporter_tap.cpp
  正在编译...
  catch_reporter_teamcity.cpp
  catch_reporter_xml.cpp
  catch_interfaces_capture.cpp
  catch_interfaces_config.cpp
  catch_interfaces_exception.cpp
  catch_interfaces_generatortracker.cpp
  catch_interfaces_registry_hub.cpp
  catch_interfaces_reporter.cpp
  catch_interfaces_reporter_factory.cpp
  catch_interfaces_testcase.cpp
  catch_approx.cpp
  catch_assertion_result.cpp
  catch_config.cpp
  catch_get_random_seed.cpp
  catch_message.cpp
  catch_registry_hub.cpp
  catch_session.cpp
  catch_tag_alias_autoregistrar.cpp
  catch_test_case_info.cpp
  catch_test_spec.cpp
  正在编译...
  catch_timer.cpp
  catch_tostring.cpp
  catch_totals.cpp
  catch_translate_exception.cpp
  catch_version.cpp
  catch_assertion_handler.cpp
  catch_case_insensitive_comparisons.cpp
  catch_clara.cpp
  catch_commandline.cpp
  catch_console_colour.cpp
  catch_context.cpp
  catch_debug_console.cpp
  catch_debugger.cpp
  catch_decomposer.cpp
  catch_enforce.cpp
  catch_enum_values_registry.cpp
  catch_errno_guard.cpp
  catch_exception_translator_registry.cpp
  catch_fatal_condition_handler.cpp
  catch_floating_point_helpers.cpp
  正在编译...
  catch_getenv.cpp
  catch_istream.cpp
  catch_lazy_expr.cpp
  catch_leak_detector.cpp
  catch_list.cpp
  catch_message_info.cpp
  catch_output_redirect.cpp
  catch_parse_numbers.cpp
  catch_polyfills.cpp
  catch_random_number_generator.cpp
  catch_random_seed_generation.cpp
  catch_reporter_registry.cpp
  catch_reporter_spec_parser.cpp
  catch_result_type.cpp
  catch_reusable_string_stream.cpp
  catch_run_context.cpp
  catch_section.cpp
  catch_singletons.cpp
  catch_source_line_info.cpp
  catch_startup_exception_registry.cpp
  正在编译...
  catch_stdstreams.cpp
  catch_string_manip.cpp
  catch_stringref.cpp
  catch_tag_alias_registry.cpp
  catch_test_case_info_hasher.cpp
  catch_test_case_registry_impl.cpp
  catch_test_case_tracker.cpp
  catch_test_failure_exception.cpp
  catch_test_registry.cpp
  catch_test_spec_parser.cpp
  catch_textflow.cpp
  catch_uncaught_exceptions.cpp
  catch_wildcard_pattern.cpp
  catch_xmlwriter.cpp
  catch_matchers.cpp
  catch_matchers_container_properties.cpp
  catch_matchers_exception.cpp
  catch_matchers_floating_point.cpp
  catch_matchers_predicate.cpp
  catch_matchers_quantifiers.cpp
  正在编译...
  catch_matchers_string.cpp
  catch_matchers_templated.cpp
  catch_matchers_impl.cpp
  Catch2.vcxproj -> D:\liblsl\build-x86-windows-static\_deps\catch2-build\src\Release\Catch2.lib
  Building Custom Rule D:/liblsl/testing/CMakeLists.txt
  catch_main.cpp
  catch_main.vcxproj -> D:\liblsl\build-x86-windows-static\testing\catch_main.dir\Release\catch_main.lib
  Building Custom Rule D:/liblsl/testing/CMakeLists.txt
  bytecmp.cpp
  common.vcxproj -> D:\liblsl\build-x86-windows-static\testing\common.dir\Release\common.lib
  Building Custom Rule D:/liblsl/CMakeLists.txt
  api_config.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/api_config.cpp”)

  cancellation.cpp
  common.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/common.cpp”)

  consumer_queue.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/consumer_queue.cpp”)

  data_receiver.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/data_receiver.cpp”)

  info_receiver.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/info_receiver.cpp”)

  inlet_connection.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/inlet_connection.cpp”)

  lsl_resolver_c.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/lsl_resolver_c.cpp”)

  lsl_inlet_c.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/lsl_inlet_c.cpp”)

  lsl_outlet_c.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/lsl_outlet_c.cpp”)

  lsl_streaminfo_c.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/lsl_streaminfo_c.cpp”)

  lsl_xml_element_c.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/lsl_xml_element_c.cpp”)

  netinterfaces.cpp
  resolver_impl.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/resolver_impl.cpp”)

  resolve_attempt_udp.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/resolve_attempt_udp.cpp”)

  sample.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/sample.cpp”)

  send_buffer.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/send_buffer.cpp”)

  socket_utils.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/socket_utils.cpp”)

  stream_info_impl.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/stream_info_impl.cpp”)

  stream_outlet_impl.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/stream_outlet_impl.cpp”)

  正在编译...
  tcp_server.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/tcp_server.cpp”)

  time_postprocessor.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/time_postprocessor.cpp”)

  time_receiver.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/time_receiver.cpp”)

  udp_server.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/udp_server.cpp”)

  cast.cpp
  endian.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslobj.vcxproj]
  (编译源文件“../src/util/endian.cpp”)

  inireader.cpp
  strfuns.cpp
  loguru.cpp
  lslobj.vcxproj -> D:\liblsl\build-x86-windows-static\lslobj.dir\Release\lslobj.lib
  Building Custom Rule D:/liblsl/build-x86-windows-static/_deps/catch2-src/src/CMakeLists.txt
  catch_main.cpp
  Catch2WithMain.vcxproj -> D:\liblsl\build-x86-windows-static\_deps\catch2-build\src\Release\Catch2Main.lib
  Building Custom Rule D:/liblsl/CMakeLists.txt
  buildinfo.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lsl.vcxproj]
  (编译源文件“../src/buildinfo.cpp”)

  lsl.vcxproj -> D:\liblsl\build-x86-windows-static\Release\lsl.lib
  Building Custom Rule D:/liblsl/testing/CMakeLists.txt
  DataType.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/DataType.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/DataType.cpp”)

  discovery.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/discovery.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/discovery.cpp”)

  move.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/move.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/move.cpp”)

  streaminfo.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/streaminfo.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/streaminfo.cpp”)

  sync_outlet.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/sync_outlet.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/sync_outlet.cpp”)

  time.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/time.cpp”)

D:\liblsl\include\lsl_cpp.h(618,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\build
-x86-windows-static\testing\lsl_test_exported.vcxproj]
  (编译源文件“../../testing/ext/time.cpp”)

    正在创建库 D:/liblsl/build-x86-windows-static/testing/Release/lsl_test_exported.lib 和对象 D:/liblsl/build-x86-windows-stat
  ic/testing/Release/lsl_test_exported.exp
  正在生成代码
  Previous IPDB not found, fall back to full compilation.
  All 15618 functions were compiled because no usable IPDB/IOBJ from previous compilation was found.
  已完成代码的生成
  lsl_test_exported.vcxproj -> D:\liblsl\build-x86-windows-static\testing\Release\lsl_test_exported.exe
  Building Custom Rule D:/liblsl/testing/CMakeLists.txt
  inireader.cpp
  network.cpp
D:\liblsl\testing\int\network.cpp(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\b
uild-x86-windows-static\testing\lsl_test_internal.vcxproj]
D:\liblsl\testing\int\network.cpp(79,2): error C2001: 字符串字面量中的换行符 [D:\liblsl\build-x86-windows-static\testing\lsl_test_
internal.vcxproj]
D:\liblsl\testing\int\network.cpp(94,1): error C2001: 字符串字面量中的换行符 [D:\liblsl\build-x86-windows-static\testing\lsl_test_
internal.vcxproj]
D:\liblsl\testing\int\network.cpp(141,1): error C2001: 字符串字面量中的换行符 [D:\liblsl\build-x86-windows-static\testing\lsl_test
_internal.vcxproj]
D:\liblsl\testing\int\network.cpp(79,1): error C1057: 宏扩展中遇到意外的文件结束 [D:\liblsl\build-x86-windows-static\testing\lsl_tes
t_internal.vcxproj]
  stringfuncs.cpp
  streaminfo.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/streaminfo.cpp”)

  samples.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/samples.cpp”)

  postproc.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/postproc.cpp”)

  serialization_v100.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/serialization_v100.cpp”)

  sync_endian.cpp
D:\liblsl\testing\int\sync_endian.cpp(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\libl
sl\build-x86-windows-static\testing\lsl_test_internal.vcxproj]
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/sync_endian.cpp”)

  tcpserver.cpp
D:\liblsl\testing\int\tcpserver.cpp(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl
\build-x86-windows-static\testing\lsl_test_internal.vcxproj]
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/tcpserver.cpp”)

  sendbuffer.cpp
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\testing\lsl_test_internal.vcxproj]
  (编译源文件“../../testing/int/sendbuffer.cpp”)

  Building Custom Rule D:/liblsl/testing/CMakeLists.txt
  runtime_config.cpp
    正在创建库 D:/liblsl/build-x86-windows-static/testing/Release/lsl_test_runtime_config.lib 和对象 D:/liblsl/build-x86-window
  s-static/testing/Release/lsl_test_runtime_config.exp
  正在生成代码
  Previous IPDB not found, fall back to full compilation.
  All 14843 functions were compiled because no usable IPDB/IOBJ from previous compilation was found.
  已完成代码的生成
  lsl_test_runtime_config.vcxproj -> D:\liblsl\build-x86-windows-static\testing\Release\lsl_test_runtime_config.exe
  Building Custom Rule D:/liblsl/CMakeLists.txt
  lslver.c
D:\liblsl\include\lsl\common.h(1,1): warning C4819: 该文件包含不能在当前代码页(936)中表示的字符。请将该文件保存为 Unicode 格式以防止数据丢失 [D:\liblsl\buil
d-x86-windows-static\lslver.vcxproj]
  (编译源文件“../testing/lslver.c”)

    正在创建库 D:/liblsl/build-x86-windows-static/Release/lslver.lib 和对象 D:/liblsl/build-x86-windows-static/Release/lslver.e
  xp
  正在生成代码
  Previous IPDB not found, fall back to full compilation.
  All 1451 functions were compiled because no usable IPDB/IOBJ from previous compilation was found.
  已完成代码的生成
  lslver.vcxproj -> D:\liblsl\build-x86-windows-static\Release\lslver.exe

D:\liblsl\build-x86-windows-static>cmake --build . --config Release --target testing
适用于 .NET Framework MSBuild 版本 18.9.1+a81b43525
MSBUILD : error MSB1009: 项目文件不存在。
开关:testing.vcxproj

D:\liblsl\build-x86-windows-static>ctest -C Release
Test project D:/liblsl/build-x86-windows-static
No tests were found!!!

D:\liblsl\build-x86-windows-static>cd ..
```

</details>

Screenshot:

<img width="2880" height="1800" alt="屏幕截图 2026-09-06 130137" src="https://github.com/user-attachments/assets/979b7b8f-e16d-43e0-adae-bc045bcb15c8" />


A large number of `warning C4819` messages can easily flood the build log and obscure other useful compiler output.

I used the following script to identify and print the non-ASCII characters in the source code:

```python
from pathlib import Path


ROOT_DIRS = [
    "include",
    "src",
    "examples",
    "testing",
]

EXTENSIONS = {
    ".h",
    ".c",
    ".cpp",
}


def check_file(path: Path):
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError as e:
        print(f"[ERROR] {path}: Not a valid UTF-8 file")
        print(f"        {e}")
        return

    for line_no, line in enumerate(text.splitlines(), start=1):
        for column_no, char in enumerate(line, start=1):
            if ord(char) > 0x7F:
                print(
                    f"{path}:{line_no}:{column_no}: "
                    f"{char!r} (U+{ord(char):04X})"
                )


def main():
    root = Path.cwd()

    for dirname in ROOT_DIRS:
        directory = root / dirname

        if not directory.is_dir():
            print(f"[WARNING] Directory not exist: {directory}")
            continue

        for path in directory.rglob("*"):
            if path.is_file() and path.suffix.lower() in EXTENSIONS:
                check_file(path)


if __name__ == "__main__":
    main()
```

Output:

```
D:\liblsl\include\lsl_cpp.h:783:70: '…' (U+2026)
D:\liblsl\include\lsl_cpp.h:922:68: '…' (U+2026)
D:\liblsl\include\lsl\common.h:185:65: '…' (U+2026)
D:\liblsl\src\time_postprocessor.cpp:122:36: 'α' (U+03B1)
D:\liblsl\src\time_postprocessor.cpp:128:47: 'α' (U+03B1)
D:\liblsl\testing\blackhole.cpp:42:42: '…' (U+2026)
D:\liblsl\testing\int\network.cpp:79:33: '…' (U+2026)
D:\liblsl\testing\int\network.cpp:94:59: '…' (U+2026)
D:\liblsl\testing\int\network.cpp:141:28: '…' (U+2026)
D:\liblsl\testing\int\sync_endian.cpp:270:69: '—' (U+2014)
D:\liblsl\testing\int\tcpserver.cpp:86:32: '–' (U+2013)
```

There are two ways to address this issue:

* Explicitly specify the source file encoding:

```cmake
if(MSVC)
    target_compile_options(lslobj PRIVATE /source-charset:utf-8)
endif()
```

* Replace non-ASCII characters with ASCII characters.

This PR uses a combination of these two approaches to minimize the changes while eliminating the compilation warnings and errors:

* For non-ASCII characters in header files, replace them with ASCII characters to avoid generating a large number of `warning C4819` messages in projects that consume the library.
* For non-ASCII characters in test files, explicitly specify `/source-charset:utf-8`.
* `testing\blackhole.cpp` is left unchanged because it does not support the Windows platform.

If you have any other preferences or suggestions for how this should be handled, please let me know, and I can update the PR accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e651023ca679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.