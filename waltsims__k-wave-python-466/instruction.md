# Issue

**Title:** Bump deepdiff from 7.0.1 to 8.0.1

## Description

Bumps [deepdiff](https://github.com/seperman/deepdiff) from 7.0.1 to 8.0.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/seperman/deepdiff/releases">deepdiff's releases</a>.</em></p>
<blockquote>
<h2>8.0.0</h2>
<p>With the introduction of <code>threshold_to_diff_deeper</code>, the values returned are different than in previous versions of DeepDiff. You can still get the older values by setting <code>threshold_to_diff_deeper=0</code>. However to signify that enough has changed in this release that the users need to update the parameters passed to DeepDiff, we will be doing a major version update.</p>
<ul>
<li>[x] <code>use_enum_value=True</code> makes it so when diffing enum, we use the enum's value. It makes it so comparing an enum to a string or any other value is not reported as a type change.</li>
<li>[x] <code>threshold_to_diff_deeper=float</code> is a number between 0 and 1. When comparing dictionaries that have a small intersection of keys, we will report the dictionary as a <code>new_value</code> instead of reporting individual keys changed. If you set it to zero, you get the same results as DeepDiff 7.0.1 and earlier, which means this feature is disabled. The new default is 0.33 which means if less that one third of keys between dictionaries intersect, report it as a new object.</li>
<li>[x] Deprecated <code>ordered-set</code> and switched to <code>orderly-set</code>. The <code>ordered-set</code> package was not being maintained anymore and starting Python 3.6, there were better options for sets that ordered. I forked one of the new implementations, modified it, and published it as <code>orderly-set</code>.</li>
<li>[x] Added <code>use_log_scale:bool</code> and <code>log_scale_similarity_threshold:float</code>. They can be used to ignore small changes in numbers by comparing their differences in logarithmic space. This is different than ignoring the difference based on significant digits.</li>
<li>[x] json serialization of reversed lists.</li>
<li>[x] Fix for iterable moved items when <code>iterable_compare_func</code> is used.</li>
<li>[x] Pandas and Polars support.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/seperman/deepdiff/commits">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=deepdiff&package-manager=pip&previous-version=7.0.1&new-version=8.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2dfa2827844`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.