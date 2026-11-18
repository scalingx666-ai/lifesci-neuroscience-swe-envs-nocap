# Issue

**Title:** CI+DOC: keep placeholder-email "contributors" out of con/tributors

## Description

## Summary

 (a `[tributors]` cron
PR) proposed adding **`helli33`** as contributor #60. That account has **no
commits in datalad**. It has registered placeholder email addresses which
happen to be the *author* email of 11 commits in our history, and GitHub's
[contributors API][api] — con/tributors' only source — credits a commit to
whoever owns its author email.

This is the **fifth iteration of the same squat**: `manbat`,
`bhanuprasad14`, `yetanothertestuser` and `bobknob23987` are already in
`skip_users` for exactly this. No new commit triggered #7964 — GitHub simply
re-resolved those addresses to a newer account.

This PR adds `helli33` to `skip_users` and documents the mechanism in
`CONTRIBUTING.md`, next to the existing "AI assistants are not contributors"
section since both follow from the same attribution rule.

**#7964 should be closed, not merged** — per `CONTRIBUTING.md`, entries once
present in `.all-contributorsrc` are copied back into `.tributors` regardless
of `skip_users`.

<details><summary>The 11 commits, and how the squat was confirmed</summary>

| Author email            | #  | Commits                                                                                                   |
| ----------------------- | -- | --------------------------------------------------------------------------------------------------------- |
| `test@example.com`      | 9  | 7 from Sept 2026 (see below) + 8dbb940ef, 2ed29f8b5 `[DATALAD] added README` (2017 test fixtures)          |
| `committer@example.com` | 1  | 31f9c56ba `RF: removed unused path_only=False logic...`                                                    |
| `test@nowhere.com`      | 1  | c53298e46 `BF: trying to revert to use online clone of testrepo on windows`                                |

The same addresses resolve to *different* throwaway accounts depending on API
cache state, and every previous claimant is already in `skip_users`:

```
committer@example.com -> helli33
test@nowhere.com      -> yetanothertestuser   (skip_users since 2021)
test@example.com      -> bhanuprasad14        (skip_users since 2021)
bob@example.com       -> bobknob23987         (skip_users since 2021)
```

`bhanuprasad14` and `yetanothertestuser` have since **dropped out** of the
contributors API entirely — their claims lapsed and `helli33` picked all three
addresses up (9 + 1 + 1 = its reported 11 "contributions").

</details>

<details><summary>Why email-level filtering is not available upstream</summary>

Filtering on `@example.com` instead of maintaining a login list would catch
every future squatter at once, but con/tributors cannot do it today:

- `get_contributors()` uses `/repos/{repo}/contributors`, which returns only
  `{login, contributions, type, ...}` — the commit author email never appears.
- `update_lookup()` then calls `/users/{login}`, which returns the account's
  **profile** email. For these accounts that is `null`.
- `include_contributor()` tests `login in self.skip_users` — exact string
  match, no globs or regex.

So there is no email for con/tributors to match on. Catching this upstream
would need a new option that resolves each candidate login through
`/repos/{repo}/commits?author={login}` and skips it when every commit is
authored under a blocked address — one extra API call per new candidate.

</details>

## Collateral finding: 7 of those commits are ours

Seven of the 11 are **genuine contributions** that landed with the agent
sandbox's default `Test User <test@example.com>` identity instead of the
author's, so that work is currently credited to the squatter:

- #7929 → e0a73d54c, 8c9187bd8 (`push -u`, )
- #7920 → d1e665c15, 5edb26da0 (`add-archive-content` multi-archive)
- #7903 → 783741876 + 2 merge commits (`rerun --on-cmd-failure`)

All carry proper `Co-Authored-By:` trailers; only the author is wrong. This is
the failure mode `CONTRIBUTING.md` § "Recognizing contributions" already warns
about, just with a sandbox default rather than `Claude <noreply@anthropic.com>`.
`CONTRIBUTING.md` now asks contributors to set `user.name`/`user.email` in such
environments. `.mailmap` already folds these addresses into one
`Neuroimaging Community` entry, but it has no effect on GitHub's attribution.

## Test plan

- [x] `skip_users` parses as valid YAML and contains `helli33` (8 entries)
- [x] `helli33` is absent from `.all-contributorsrc`/`.tributors` on `maint`,
      so `skip_users` is sufficient — no cleanup needed
- [x] pre-commit (codespell, large files) passes
- [ ] **Close #7964** rather than merging it
- [ ] Follow-up: fix the git identity in cloud Claude Code / Copilot sandboxes
      so future PRs are not authored as `Test User`

[api]: https://docs.github.com/en/rest/repos/repos#list-repository-contributors

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eeb14aaef796`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.