# Issue

**Title:** Fix: the sidebar counts ignore the search box and the method chips

## Description

> **Stacked on #107**, which is stacked on #99, #100 and #101. The last commit is this PR; the five below it are that stack. No other merged branch touches `frontend/src`, so the stack is frontend-isolated and this diff is the whole of it.

## Filtering the sidebar changed the route tree and nothing else

`Routes`, `Risks` and `Recent` kept their unfiltered numbers. The `Risks` and `Recent` **lists** kept their unfiltered contents too — type a query, switch to `Risks`, and every flagged route in the application is still sitting there.

Measured on a 621-route application:

| | before | after |
|---|---|---|
| chips narrowed to `DELETE` | `Routes 621 · Risks 2 · Recent 0` above a tree of 125 | `125 · 0 · 0` |
| search `logout` | `Routes 621 · Risks 2 · Recent 0` above a tree of one, two cards under `Risks` | `1 · 1 · 0`, one card: `POST /gui/logout` |

The `Routes` count was the honest one only by accident: it read `tabs.length`, and `tabs` is the unfiltered set, so it agreed with the tree exactly when no filter was on.

## Before and after

Captured with Playwright against a 621-route application, driving the sidebar rather than posing it, so the pair comes out of one repeatable run. Same scan data, same viewport, only the commit differs.

**Search `logout`, `Routes` tab.** The count is the application's whole route list; the tree under it has one entry.

| before | after |
|---|---|
| <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/before-routes.png" width="420"> | <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/after-routes.png" width="420"> |

**Search `logout`, `Risks` tab.** The second bug, and the one the table above cannot show: the list itself ignored the query, so `/broadcasting/auth` is sitting there under a search for `logout`.

| before | after |
|---|---|
| <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/before-risks.png" width="420"> | <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/after-risks.png" width="420"> |

**Chips narrowed to `DELETE`.** `Routes 621` above a tree of 125, and `Risks 2` above what is now an empty set.

| before | after |
|---|---|
| <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/before-delete.png" width="420"> | <img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/108-sidebar-counts/after-delete.png" width="420"> |

The 125 is not 125 `DELETE` routes: console commands, broadcast channels, schedules and Filament pages have no HTTP method, so the method chips do not apply to them and they stay. That is existing behaviour of the tree filter, now applied consistently to the counts as well.

## The cause

Three derivations, three different inputs:

```ts
const tree      = useMemo(() => buildTree(tabs.filter(/* query + methods */)), …)
const riskTabs  = useMemo(() => tabs.filter(…),  [tabs])   // unfiltered
const recentTabs= useMemo(() => tabs.filter(…),  [tabs])   // unfiltered

{ id: 'routes', count: tabs.length }        // unfiltered
{ id: 'risks',  count: highRiskCount }      // a prop from the parent
{ id: 'recent', count: recentCount }        // a prop from the parent
```

The filter now runs once, into `filteredTabs`, and every list and every count comes from it. Each count is taken from the list it labels rather than computed alongside it.

## A second disagreement, which the same change settles

`highRiskCount` is the parent's `high`-and-`critical` tally. The list under that badge shows **everything with a risk level** — `riskOf(t) !== 'none'`. So the badge and its own list disagreed whenever a route was `medium` or `low`, silently, and agreed only on applications where every finding happened to be high. That is why this has been sitting there: on the application I found it on, both findings are `high`, so `2` was right for the wrong reason.

The list is the intentional one — the empty state says "No flagged routes", `FlagCard` renders a severity chip per card, and `RISK_ORDER` exists to sort mixed severities. So the count was simply reading the wrong variable.

**The toolbar's `High-risk` pill is untouched.** It says high-risk, it means high-risk, and it is deliberately global — it is the one number that should not move when you filter.

`highRiskCount` and `recentCount` are gone from this component's props, and `recentCount` from the parent, which had no other consumer. Leaving them would have left the second source of truth that caused this.

## Empty states no longer deny what a filter is hiding

`No flagged routes. ✓` claims a clean bill of health. With a filter on it meant "none matching", which is a different statement and the checkmark makes it the wrong one. Both that and `Nothing changed since the previous scan.` now say which they mean.

## Folded in from #107's review: `Math.max(...array)`

That review noted the spread throws `RangeError` past roughly 124,000 elements, and I said I would fold it into whichever change next rebuilt the frontend. This is it, and it is visible here rather than smuggled into a deletion.

Five call sites across the layered, circle and grid layouts now `reduce` instead. Nothing observed is close to the limit — the largest single tab measured is 177 nodes and the largest whole graph around 10,000 — so this fixes nothing anyone has hit. It is one line either way and a layout that throws is a blank screen. Empty input still yields `-Infinity` exactly as the spread did, and every caller already guards for it, so the behaviour is identical everywhere it is reachable.

## Verified

In a browser, against a real application's scan data, on the built bundle:

- both filters recalculate all three counts, together and separately
- the `Risks` list narrows with its count — `logout` leaves exactly `POST /gui/logout`
- the new empty state appears under a filter, the old one still appears without
- Circle still lays out with no overlapping cards after the `reduce` change
- console clean throughout

`tsc -b` clean, `npm run lint` clean, `254 passed (853 assertions)`, PHPStan clean, Pint clean.

**The shipped bundle matches the source**: rebuilding this branch from scratch produces the identical content hash, `index-CBIplkO3.js`, and one entry chunk ships — the superseded one is deleted, as in #107.

---

*Correction to this description, found by taking the screenshots: the `search logout` row originally read `Routes 1` for the before state. It is `Routes 621` — the count read the unfiltered set, which is the whole point of the bug. The narrative below the table said so correctly; the table row did not.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.