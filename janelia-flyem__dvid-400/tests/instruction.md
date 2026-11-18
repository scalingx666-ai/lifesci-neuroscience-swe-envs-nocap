# Issue

**Title:** Bump github.com/golang/glog from 1.1.0 to 1.2.4

## Description

Bumps [github.com/golang/glog](https://github.com/golang/glog) from 1.1.0 to 1.2.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/golang/glog/releases">github.com/golang/glog's releases</a>.</em></p>
<blockquote>
<h2>v1.2.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Fail if log file already exists by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#74</a>:
<ul>
<li>glog: Don't try to create/rotate a given syncBuffer twice in the same second</li>
<li>glog: introduce createInDir function as in internal version</li>
<li>glog: have createInDir fail if the file already exists</li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.2.3...v1.2.4">https://github.com/golang/glog/compare/v1.2.3...v1.2.4</a></p>
<h2>v1.2.3</h2>
<h2>What's Changed</h2>
<ul>
<li>glog: check that stderr is valid before using it by default by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#72</a></li>
<li>glog: fix typo by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#73</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.2.2...v1.2.3">https://github.com/golang/glog/compare/v1.2.2...v1.2.3</a></p>
<h2>v1.2.2</h2>
<h2>What's Changed</h2>
<ul>
<li>glog: avoid calling user.Current() on windows by <a href="https://github.com/bentekkie"><code>@​bentekkie</code></a> in <a href="">golang/glog#69</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.2.1...v1.2.2">https://github.com/golang/glog/compare/v1.2.1...v1.2.2</a></p>
<h2>v1.2.1</h2>
<h2>What's Changed</h2>
<ul>
<li>glog: don't hold mutex when sync'ing by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#68</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.2.0...v1.2.1">https://github.com/golang/glog/compare/v1.2.0...v1.2.1</a></p>
<h2>v1.2.0</h2>
<h2>What's Changed</h2>
<ul>
<li>glog: add context variants and logsink tests by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#66</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.1.2...v1.2.0">https://github.com/golang/glog/compare/v1.1.2...v1.2.0</a></p>
<h2>v1.1.2</h2>
<p>Bugfix release.</p>
<h2>What's Changed</h2>
<ul>
<li>glog: populate symlinks -log_link directory by <a href="https://github.com/chressie"><code>@​chressie</code></a> in <a href="">golang/glog#64</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/golang/glog/compare/v1.1.1...v1.1.2">https://github.com/golang/glog/compare/v1.1.1...v1.1.2</a></p>
<h2>v1.1.1</h2>
<p>Bugfixes since the larger v1.1.0, which have been addressed.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a0e3c40</code></a> glog: have createInDir fail if the file already exists</li>
<li><a href=""><code>7139da2</code></a> glog: introduce createInDir function as in internal version</li>
<li><a href=""><code>dd58629</code></a> glog: Don't try to create/rotate a given syncBuffer twice in the same second</li>
<li><a href=""><code>04dbec0</code></a> glog: fix typo (<a href="">#73</a>)</li>
<li><a href=""><code>459cf3b</code></a> glog: check that stderr is valid before using it by default (<a href="">#72</a>)</li>
<li><a href=""><code>9730314</code></a> glog: avoid calling user.Current() on windows (<a href="">#69</a>)</li>
<li><a href=""><code>861d094</code></a> glog: don't hold mutex when sync'ing (<a href="">#68</a>)</li>
<li><a href=""><code>b256bbe</code></a> glog: add context variants to most log functions</li>
<li><a href=""><code>bcf3184</code></a> glog/internal/logsink: add logsink tests</li>
<li><a href=""><code>6b9d7f7</code></a> glog: populate symlinks -log_link directory (<a href="">#64</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/golang/glog/compare/v1.1.0...v1.2.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github.com/golang/glog&package-manager=go_modules&previous-version=1.1.0&new-version=1.2.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/400)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b93c7ec05d09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.