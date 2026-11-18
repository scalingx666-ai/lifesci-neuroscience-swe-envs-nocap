# Issue

**Title:** Fix extra garbage sample transmitted when outlet is destroyed

## Description

@cboulay This might be the origin of this extra sample as described in  and 

This PR and the text below is AI-generated / guided, I'm not a C-dev and I don't have the bandwidth to learn enough about the language- but it seems like a plausible explanation. Can you have a look?

### Problem

When an LSL outlet is destroyed while inlets are still connected, an extra sample containing garbage data is transmitted to the inlets. This causes two issues:

1. Extra sample in recorded data: The inlet receives one more sample than was actually pushed by the application
2. Corrupted clock offsets: The extra sample can trigger a clock offset measurement with garbage values, which corrupts timestamp synchronization in downstream tools like `pyxdf`.

### Root cause:

In `tcp_server::end_serving()`, a "ping" sample is pushed to wake up blocked transfer threads:

```
send_buffer_->push_sample(factory_->new_sample(lsl_clock(), true));
```

The problem is that `factory_->new_sample()` creates a real sample object with:
- A valid timestamp (`lsl_clock()`)
- `pushthrough = true` (forces immediate transmission)
- Uninitialized channel data (whatever was in the freelist memory)

The transfer thread checks `if (!samp) continue`; to skip "blank" samples, but this only checks if the pointer is null—the ping sample is a valid object, so it gets serialized and transmitted.

### Fix

Push an empty `sample_p()` instead of creating a real sample:

```
send_buffer_->push_sample(sample_p());
```

This works because:
- The empty `sample_p` (null intrusive_ptr) still triggers the condition variable notification, waking up blocked threads
- The existing check `if (!samp) continue`; correctly skips null samples
- No garbage data is ever created or transmitted

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61cab1eb47a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.