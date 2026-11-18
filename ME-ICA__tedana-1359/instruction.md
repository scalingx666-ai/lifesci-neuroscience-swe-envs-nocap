# Issue

**Title:** Bump pre-commit from 2.3.0 to 4.3.0

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 2.3.0 to 4.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.3.0</h2>
<h3>Features</h3>
<ul>
<li><code>language: docker</code> / <code>language: docker_image</code>: detect rootless docker.
<ul>
<li><a href="">#3446</a> PR by <a href="https://github.com/matthewhughes934"><code>@​matthewhughes934</code></a>.</li>
<li><a href="">#1243</a> issue by <a href="https://github.com/dkolepp"><code>@​dkolepp</code></a>.</li>
</ul>
</li>
<li><code>language: julia</code>: avoid <code>startup.jl</code> when executing hooks.
<ul>
<li><a href="">#3496</a> PR by <a href="https://github.com/ericphanson"><code>@​ericphanson</code></a>.</li>
</ul>
</li>
<li><code>language: dart</code>: support latest dart versions which require a higher sdk
lower bound.
<ul>
<li><a href="">#3507</a> PR by <a href="https://github.com/bc-lee"><code>@​bc-lee</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.2.0</h2>
<h3>Features</h3>
<ul>
<li>For <code>language: python</code> first attempt a versioned python executable for the default language version before consulting a potentially unversioned <code>sys.executable</code>.
<ul>
<li><a href="">#3430</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle error during conflict detection when a file is named &quot;HEAD&quot;
<ul>
<li><a href="">#3425</a> PR by <a href="https://github.com/tusharsadhwani"><code>@​tusharsadhwani</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.1.0</h2>
<h3>Features</h3>
<ul>
<li>Add <code>language: julia</code>.
<ul>
<li><a href="">#3348</a> PR by <a href="https://github.com/fredrikekre"><code>@​fredrikekre</code></a>.</li>
<li><a href="">#2689</a> issue <a href="https://github.com/jmuchovej"><code>@​jmuchovej</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Disable automatic toolchain switching for <code>language: golang</code>.
<ul>
<li><a href="">#3304</a> PR by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3300</a> issue by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3149</a> issue by <a href="https://github.com/nijel"><code>@​nijel</code></a>.</li>
</ul>
</li>
<li>Fix <code>language: r</code> installation when initiated by RStudio.
<ul>
<li><a href="">#3389</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3385</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.0.1</h2>
<h3>Fixes</h3>
<ul>
<li>Fix <code>pre-commit migrate-config</code> for unquoted deprecated stages names with
purelib <code>pyyaml</code>.
<ul>
<li><a href="">#3324</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">pre-commit-ci/issues#234</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.0.0</h2>
<h3>Features</h3>
<ul>
<li>Improve <code>pre-commit migrate-config</code> to handle more yaml formats.
<ul>
<li><a href="">#3301</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
<li>Handle <code>stages</code> deprecation in <code>pre-commit migrate-config</code>.
<ul>
<li><a href="">#3302</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#2732</a> issue by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
<li>Upgrade <code>ruby-build</code>.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.3.0 - 2025-08-09</h1>
<h3>Features</h3>
<ul>
<li><code>language: docker</code> / <code>language: docker_image</code>: detect rootless docker.
<ul>
<li><a href="">#3446</a> PR by <a href="https://github.com/matthewhughes934"><code>@​matthewhughes934</code></a>.</li>
<li><a href="">#1243</a> issue by <a href="https://github.com/dkolepp"><code>@​dkolepp</code></a>.</li>
</ul>
</li>
<li><code>language: julia</code>: avoid <code>startup.jl</code> when executing hooks.
<ul>
<li><a href="">#3496</a> PR by <a href="https://github.com/ericphanson"><code>@​ericphanson</code></a>.</li>
</ul>
</li>
<li><code>language: dart</code>: support latest dart versions which require a higher sdk
lower bound.
<ul>
<li><a href="">#3507</a> PR by <a href="https://github.com/bc-lee"><code>@​bc-lee</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.2.0 - 2025-03-18</h1>
<h3>Features</h3>
<ul>
<li>For <code>language: python</code> first attempt a versioned python executable for
the default language version before consulting a potentially unversioned
<code>sys.executable</code>.
<ul>
<li><a href="">#3430</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle error during conflict detection when a file is named &quot;HEAD&quot;
<ul>
<li><a href="">#3425</a> PR by <a href="https://github.com/tusharsadhwani"><code>@​tusharsadhwani</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.1.0 - 2025-01-20</h1>
<h3>Features</h3>
<ul>
<li>Add <code>language: julia</code>.
<ul>
<li><a href="">#3348</a> PR by <a href="https://github.com/fredrikekre"><code>@​fredrikekre</code></a>.</li>
<li><a href="">#2689</a> issue <a href="https://github.com/jmuchovej"><code>@​jmuchovej</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Disable automatic toolchain switching for <code>language: golang</code>.
<ul>
<li><a href="">#3304</a> PR by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3300</a> issue by <a href="https://github.com/AleksaC"><code>@​AleksaC</code></a>.</li>
<li><a href="">#3149</a> issue by <a href="https://github.com/nijel"><code>@​nijel</code></a>.</li>
</ul>
</li>
<li>Fix <code>language: r</code> installation when initiated by RStudio.
<ul>
<li><a href="">#3389</a> PR by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
<li><a href="">#3385</a> issue by <a href="https://github.com/lorenzwalthert"><code>@​lorenzwalthert</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.0.1 - 2024-10-08</h1>
<h3>Fixes</h3>
<ul>
<li>Fix <code>pre-commit migrate-config</code> for unquoted deprecated stages names with
purelib <code>pyyaml</code>.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b74a22d</code></a> v4.3.0</li>
<li><a href=""><code>cc899de</code></a> Merge pull request <a href="">#3507</a> from bc-lee/dart-fix</li>
<li><a href=""><code>2a0bcea</code></a> Downgrade Dart SDK version installed in the CI</li>
<li><a href=""><code>f1cc7a4</code></a> Make Dart pre-commit hook compatible with the latest Dart SDKs</li>
<li><a href=""><code>72a3b71</code></a> Merge pull request <a href="">#3504</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>c8925a4</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>a5fe6c5</code></a> Merge pull request <a href="">#3496</a> from ericphanson/eph/jl-startup</li>
<li><a href=""><code>6f1f433</code></a> Julia language: skip startup.jl file</li>
<li><a href=""><code>c681721</code></a> Merge pull request <a href="">#3499</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>4fd4537</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v2.3.0...v4.3.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pre-commit&package-manager=uv&previous-version=2.3.0&new-version=4.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `543225dd08d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.