# Issue

**Title:** Bump sphinxcontrib-bibtex from 2.6.5 to 2.7.0

## Description

Bumps [sphinxcontrib-bibtex](https://github.com/mcmtroffaes/sphinxcontrib-bibtex) from 2.6.5 to 2.7.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mcmtroffaes/sphinxcontrib-bibtex/blob/develop/CHANGELOG.rst">sphinxcontrib-bibtex's changelog</a>.</em></p>
<blockquote>
<h2>2.7.0 (6 May 2026)</h2>
<ul>
<li>
<p><strong>BACKWARD INCOMPATIBLE</strong>
A new warning category, <code>duplicate_local_citation</code>, has been introduced.
It is triggered when a duplicate citation appears within the same document.
The existing <code>duplicate_citation</code> warning continues to report duplicates but now only across different documents.</p>
<p>In many cases, users maintain a separate bibliography for each document (often using a <code>docname in docnames</code> filter).
In such setups, duplicate citations across documents are usually acceptable, while duplicates within a single document are not.
This distinction allows users to suppress <code>duplicate_citation</code> warnings while still receiving <code>duplicate_local_citation</code> warnings.</p>
</li>
<li>
<p>When there are duplicate citations,
resolve locally first
(reported by drbenvincent, see issue <a href="">#385</a>).</p>
</li>
<li>
<p>The usage section of the documentation now starts with in-depth general considerations
to guide users towards best practice for the most common use cases.</p>
</li>
<li>
<p>Citation reference wrapper nodes now have a <code>bibtex-citation</code> CSS class,
to enable Sphinx themes to style citation elements separately from other content
(contributed by mmcky, see pull request <a href="">#383</a>).</p>
</li>
<li>
<p>Increase required pybtex-docutils version to 1.0.2
(reported by ego-thales).</p>
</li>
<li>
<p>Fix test suite for docutils 0.22
(fixed by mitya57, see pull request <a href="">#377</a>).</p>
</li>
<li>
<p>Dropped Python 3.9 support (EOL), added Python 3.14 support.</p>
</li>
<li>
<p>Fixed various deprecation warnings in Sphinx and docutils.</p>
</li>
<li>
<p>Improved header parsing.</p>
</li>
<li>
<p>Minimum required Sphinx version increased to 7.4.</p>
</li>
<li>
<p>Minimum required Docutils version increased to 0.20.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9dc8938</code></a> Prepare release 2.7.0. (<a href="">#388</a>)</li>
<li><a href=""><code>012bdab</code></a> Fix typo in changelog. [skip ci]</li>
<li><a href=""><code>257854e</code></a> Fix classifiers.</li>
<li><a href=""><code>cc987cb</code></a> Remove more dead code.</li>
<li><a href=""><code>a523908</code></a> Increment minimum required docutils, remove some dead code.</li>
<li><a href=""><code>0127d7f</code></a> Test against sphinx 8.x</li>
<li><a href=""><code>b77507d</code></a> Require sphinx 7.4 or higher.</li>
<li><a href=""><code>777bf56</code></a> Simplify header parse.</li>
<li><a href=""><code>ccbbef1</code></a> Type fix.</li>
<li><a href=""><code>8d1f0c1</code></a> Parse header rst from within footnote directive.</li>
<li>Additional commits viewable in <a href="https://github.com/mcmtroffaes/sphinxcontrib-bibtex/compare/2.6.5...2.7.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=sphinxcontrib-bibtex&package-manager=uv&previous-version=2.6.5&new-version=2.7.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e609c4eebd6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.