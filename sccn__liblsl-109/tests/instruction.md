# Issue

**Title:** C++ API: replace bare pointer with smart pointers.

## Description

As of now, each LSL C++ API class keeps a pointer to an opaque LSL object and calls a function (e.g. `lsl_destroy_outlet`) to deconstruct and deallocate the object in its own destructor.

This PR replaces the bare pointers with smart pointers so the compiler can keep track of the C API object lifetimes and generate copy and move constructors / assignment operators automatically.

Moreover, this makes it possible to pass the pointer to end users e.g. for calling C API functions and keep multiple copies of wrapper classes around:

``` cpp
std::shared_ptr<lsl::stream_outlet> raw_handle = stream_outlet(…).get_raw_handle();
// here, the stream outlet is already deconstructed, but the handle is still valid
lsl_push_foo(raw_handle.get());

auto outlet = stream_outlet(...);
auto outlet_copy = outlet;
outlet.push_chunk(...);
outlet_copy.push_chunk();
```

The only change in behaviour concerns `stream_info` objects, as the copy constructor previously performed a deep copy.
This is now accomplished by the `stream_info::clone()` method:

``` cpp
// stream_info copies are cheap, for independent copies clone() has to be used
lsl::stream_info info(...);
lsl::stream_info copy1(info), copy2(info), clone(info.clone());
copy1.desc().append_child("Dummy");
REQUIRE(copy2.desc().first_child().name() == std::string("Dummy"));
REQUIRE(clone.desc().first_child().empty());
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea87017cf373`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.