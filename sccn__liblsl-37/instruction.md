# Issue

**Title:** Add optional move support to C++ API types

## Description

For compilers with enabled C++11 support, this adds move constructors to the header classes.
This allows passing objects to be passed into classes while ensuring that the underlying objects are deleted when they go out of scope.

Example:

``` cpp

struct Streampair {
	lsl::stream_outlet out_;
	lsl::stream_inlet in_;

	Streampair(lsl::stream_outlet &&out, lsl::stream_inlet &&in)
		: out_(std::move(out)), in_(std::move(in)) {}
};

static Streampair create_streampair(const lsl::stream_info &info) {
	lsl::stream_outlet out(info);
	auto found_stream_info(lsl::resolve_stream("name", info.name(), 1, 2.0));
	if (found_stream_info.empty()) throw std::runtime_error("outlet not found");
	lsl::stream_inlet in(found_stream_info[0]);

	in.open_stream(2);
	out.wait_for_consumers(2);
	return Streampair(std::move(out), std::move(in));
}
```

The second commit adds a unit test that checks both move constructor, assignment operators and destructors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a0778cbc77a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.