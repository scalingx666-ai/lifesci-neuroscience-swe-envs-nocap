# Issue

**Title:** Improve error handling

## Description

Let's take a simple example:

```
std::vector<std::string> formats = {"", "float32", "float64", "string", "int32", "int16", "int8", "int64"};
std::string format = "double64";
// convert the string to the format index
int fmt = std::distance(formats.begin(), std::find(formats.begin(), formats.end(), format);
try {
    lsl::stream_info info(streamname, "EEG", 1, 500, fmt);
} catch(..) { std::cout << "Error!" << std::endl; return; }
std::cout << info.created_at() << std::endl;
```

On a first glance, this should print the time the stream_info was created at.

On a second glance, the format is called `float64`, not `double64` so an exception should be thrown and the function should return.

In reality, a `lsl::stream_info` object is created, but the internal pointer is set to 0 so the call to `info.created_at()` will dereference a null pointer and everything will crash.

This PR first adds the helper macro `LSL_CATCH_EXCEPTIONS` and the helper function `create_object_noexcept` for the C-API to convert exceptions to error codes *and copy the error message to an internal variable*. The last error message can then be retrieved via the `lsl_last_error()` function.

After that, the C++ wrapper can check for errors (i.e. is the returned pointer valid) or throw an exception with the last error message.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fcc1bfc8acb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.