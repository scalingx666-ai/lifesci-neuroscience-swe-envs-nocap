# Issue

**Title:** Fix: report memory exhaustion instead of exiting silently, and allow a configured limit

## Description

## A scan that runs out of memory says nothing at all

On a large application `brain:scan` ends like this:

```
 ○ Scanning routes..    ✓ routes.. 380 routes (0.01s)
 ○ Scanning middleware..    ✓ middleware.. (0.00s)
 ○ Analyzing controllers..    ✓ controllers.. 223 controllers (0.21s)
 ○ Tracing full lifecycle..
```

Nine lines, stopping mid-step, exit code 255. No mention of memory, no PHP fatal, nothing in the Laravel log, empty stderr. It reads like the scanner gave up for no reason.

It ran out of memory. Measured on the same project: `--memory-limit=1024M` exits 255, `1536M` and `2048M` complete. And the reason nothing is printed is the same reason it died — with the heap full there is nothing left to allocate a report with, so PHP's own "Allowed memory size … exhausted" never renders either.

The default is `1024M`, and `normalizeMemoryLimit()` enforces `1024M` as the **minimum** the command will accept. So the value that fails is the lowest one available, the user cannot go lower, and nothing in the output suggests going higher.

### Saying what happened

The fatal is still readable at shutdown through `error_get_last()`. What is missing at that point is memory to act on it, so the command holds 256KB back and releases it first:

```php
$reserve = str_repeat(' ', MemoryExhaustionNotice::RESERVE_BYTES);

register_shutdown_function(function () use (&$reserve, $limitInEffect): void {
    $reserve = null;
    $notice = MemoryExhaustionNotice::forLastError(error_get_last(), $limitInEffect);
    if ($notice !== null) {
        $this->newLine();
        $this->error($notice);
    }
});
```

Which turns the silence into:

```
The scan ran out of memory at --memory-limit=1024M. Raise it (--memory-limit=2048M),
lift it entirely (--memory-limit=-1), or set `memory_limit` in config/laravel-brain.php
so every scan of this project gets the larger value.
```

The suggested value is double what did not fit, keeping the unit it was given, so the advice is a command to run rather than an invitation to guess.

A side effect worth knowing: with the reserve released, **PHP's own fatal renders too**. Before the change that run printed nothing; after it, the same run prints `Allowed memory size of 1073741824 bytes exhausted` as well as the line above. The reserve is not only for our message — it is what lets any error reporting work at that moment.

**And it depends on how the heap fills, which is why this looks intermittent.** Measured at a 32M limit, varying the size of the allocation that finally fails:

| failing allocation | without the reserve | with the reserve |
|---|---|---|
| 1 MB | printed | printed |
| 100 KB | printed | printed |
| 1 KB | **silent** | printed |
| 64 B | **silent** | printed |

A run that dies asking for one large block leaves that much slack behind and would have reported itself anyway. A run that dies in small increments has nothing left — and small increments is what parsing does, which is why the scan is the case that goes quiet. (Boundary measured by @SanderMuller in review; I had claimed the silence unconditionally.)

### Setting it once per project

The limit now comes from config, so an application that needs 2G stops relying on everyone remembering the flag:

```php
// config/laravel-brain.php
'memory_limit' => env('LARAVEL_BRAIN_MEMORY_LIMIT', '1024M'),
```

`--memory-limit` still wins for a single run. Omitted, the option falls through to the config, which defaults to the previous `1024M` — so nothing changes for anyone who does not set it. The signature default moved from `1024M` to empty for that reason; that is the only way to tell "not passed" from "passed the same value".

### Why the message is its own class

`MemoryExhaustionNotice` is separated from the command so the decision can be tested without exhausting memory inside a test. 7 tests: the message names the limit and the config key, the suggestion doubles, the unit is preserved, an unparseable limit still yields something concrete, and it stays silent for a normal exit, for an unrelated fatal, and for a warning that merely mentions memory. That last one matters — claiming a memory problem for an unrelated crash sends the reader the wrong way.

### Verification

- Reproduced against a real application, before and after, at the default limit: 9 lines and silence before; the same run with the notice and PHP's own fatal after. Exit code stays 255 either way, which is correct — this reports the failure, it does not swallow it.
- `254 → 261 passed`, PHPStan 0 errors, Pint clean.

PHPStan caught the first shape of this, where the reserve was a property: `never read, only written`. It was right — the reserve's lifetime belongs to the shutdown handler, not to the command object, so it is a local captured by reference now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.