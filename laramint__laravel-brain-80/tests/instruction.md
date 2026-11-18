# Issue

**Title:** Stop parsing most of app/ to find facades

## Description

## What

The facade scan reads every PHP file under `app/` and parses the ones containing `extends`. On a
large codebase that is most of them, so this one analyzer accounted for the majority of all
parsing in a scan — every other analyzer only parses code a route can reach.

A facade reaches Illuminate's `Facade` through `extends`, and naming that class leaves the token
behind, so the filter can ask for the name instead of the keyword. On its own that is still far
too loose: `use Illuminate\Support\Facades\Log;` contains `Facade`, and most files in a Laravel
application carry a line like it — the filter ends up admitting anything that *uses* a facade
rather than anything that *defines* one. Dropping the framework's `Facades\` path segment before
the match leaves the bare mention that only a definition has, and leaves the base class itself
intact, since `Illuminate\Support\Facades\Facade` still reads `Illuminate\Support\Facade`
afterwards.

| application | php files in app/ | admitted by `extends` | admitted now |
|---|---:|---:|---:|
| A | 1,089 | 758 (70%) | **2** |
| B | 1,899 | 1,036 (55%) | **15** |
| C | 4,181 | 3,369 (81%) | **7** |

C has no application facades at all. It was parsing 3,369 files to find that out.

## Cost

| application | scan before | scan after | | facade phase | parses |
|---|---:|---:|---|---:|---|
| A | 2,511 ms | 2,375 ms | −5% | 180 → 30 ms | 950 → 717 |
| B | 1,717 ms | 1,476 ms | −14% | 383 → 124 ms | 1,582 → 1,035 |
| C | 3,196 ms | 1,398 ms | **−56%** | 1,926 → 195 ms | 3,704 → 690 |

Medians of four interleaved runs in one session, warm. The phase drops from 7%, 22% and 60% of a
scan to 1%, 8% and 14%.

What is left is close to the floor of this design. The phase now parses 4, 54 and 7 files; almost
everything it still spends goes on walking `app/` and reading each file to apply the filter, which
no filter can be cheaper than.

> An earlier revision of this description reported B as 2,029 → 1,550 ms. That pair was measured
> in two sittings and the baseline was contaminated; the parse counts were right but the wall
> clock was not. Every number above comes from a single interleaved run of all arms.

## The hole it would leave, and how it is closed

A facade can extend an app-level base whose file names `Facade` while the child's does not:

```php
namespace App\Support\Facades;
abstract class Base extends \Illuminate\Support\Facades\Facade {}  // admitted

namespace App\Support;
use App\Support\Facades\Base;
class Reporting extends Base {}                                    // nothing to match on
```

`isInFacadeChain()` resolves transitively, so `Reporting` is a facade — and the filter alone would
drop it silently, which is the worst kind of wrong here: a missing facade is invisible unless you
diff two graphs.

So the filter is a first pass. Every class confirmed to sit in the chain is recorded, including an
abstract intermediate that can never be a facade itself but is exactly what a child reaches the
base through. Files not read in round one are re-offered whenever a new such name appears, until a
round adds nothing. It is string work — a held-back file is parsed only once it mentions one of
those names.

Across 7,169 files in three applications the second pass finds nothing, because none of them use
that shape. It is here so the ones that do keep working, and it has a test that fails when the
pass is removed.

## Gate

Full build output — graph, all subgraphs, manifest, totals, the tracer's edge list — is
**byte-identical on all three applications**, 14.7 MB, 19.2 MB and 40.0 MB of dump apiece. That is
the check that matters: the registry could shrink without a single test failing.

The filter was also judged against ground truth computed independently of it: parse every file
under `app/`, index every class by FQCN, walk each `extends` chain, and collect the files defining
a class that reaches `Illuminate\Support\Facades\Facade`. Every one of those files is admitted
directly, without leaning on the second pass.

## Tests

`211 passed (751 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05a31095910`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.