# Issue

**Title:** Bump beartype from 0.20.2 to 0.22.4

## Description

Bumps [beartype](https://github.com/beartype/beartype) from 0.20.2 to 0.22.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/beartype/beartype/releases">beartype's releases</a>.</em></p>
<blockquote>
<h2>Beartype 0.22.4: Now Less Hated by Poetry</h2>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> catastrophically explodes all over your monitor. An oily black residue redolent of snail mucus slides off the screen, dripping with a maddening cadence into the crevices of your trusty mechanical keyboard:</p>
<pre lang="bash"><code># Via &quot;pip&quot;, the once-great venerable master packager now fallen on hard times:
$ pip install --upgrade beartype        # &lt;-- you go, pipe-smoking pip
<h1>Via &quot;uv&quot;, the plucky upstart spiky-haired kid wielding a sword larger than its body:</h1>
<p>$ uv lock --upgrade-package beartype    # &lt;-- you do what you need to do, ultraviolet radiation
</code></pre></p>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> never gets tired of bug-eyed dudes punching squinty-eyed dudes. Childhood memories do not fade.</p>
<p><img src="https://media1.tenor.com/m/HK-WlNloWp8AAAAd/blood-sport-jean-claude-van-damme.gif" alt="" />
<!-- raw HTML omitted -->Left: <em><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code>.</em> Right: <em>Poetry and <code>pipenv</code> together as one dude.</em><!-- raw HTML omitted --></p>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> is helping <a href="https://github.com/leycec"><code>@​leycec</code></a> and his beautiful science wife to eat food. Thanks entirely to...</p>
<h2>GitHub Sponsors: Befriend the Bear and Get a Bear for Life</h2>
<p>This release comes courtesy these proud <a href="https://github.com/sponsors/leycec">GitHub Sponsors</a>, without whom everyone in the <a href="https://github.com/leycec"><code>@​leycec</code></a> family would currently be eating grasshoppers in the abandoned back lot again:</p>
<ul>
<li><a href="https://github.com/sesco-llc"><code>@​sesco-llc</code></a> (SESCO Enterprises), &quot;The Power of Innovation in Trading&quot;: <!-- raw HTML omitted --><em>this inspires me to get out of the house and do something</em><!-- raw HTML omitted -->
<a href="https://sescollc.com">https://sescollc.com</a></li>
<li><a href="https://github.com/DylanModesitt"><code>@​DylanModesitt</code></a> (Dylan Modesitt), quantitative strategies energy trading associate: <!-- raw HTML omitted --><em>...wikipedia, don't fail me now!</em><!-- raw HTML omitted -->
<a href="https://dylanmodesitt.com">https://dylanmodesitt.com</a></li>
<li><strong>[Tidelift][]</strong>, graciously paying out recurring income to security-sensitive open-source projects like <a href="https://github.com/beartype"><code>@​beartype</code></a>: <!-- raw HTML omitted --><em>so much hype</em><!-- raw HTML omitted -->
<a href="https://www.sonarsource.com/products/sonarqube/advanced-security">https://www.sonarsource.com/products/sonarqube/advanced-security</a></li>
</ul>
<p>If you represent a security-conscious corporate, government, or non-profit, the <em>best</em> way bar none for you to support <a href="https://github.com/beartype"><code>@​beartype</code></a> and secure your own workflow is by subscribing to <strong>[Tidelift][]</strong> through <strong>[SonarQube Advanced Security][].</strong> Security giant [Sonar][] recently acquired [Tidelift][], guaranteeing the economic viability of the Tidelift model for billions of future open-source projects that have yet to be born. Join the jargon-laden conversation and pay someone else to think about unreadable acronyms like SAST, SCA, and SBOM for once.</p>
<p>Thanks so much, masters of fintech and lifted tides.</p>
<p><img src="https://media1.tenor.com/m/7JR7sD8oTiUAAAAC/who-are-you-do-i-know-you.gif" alt="" />
<!-- raw HTML omitted -->The Masters of Fintech and Lifted Tides. <em>That's who.</em><!-- raw HTML omitted --></p>
<h2>Gods Not Another Patch Release. What's Wrong with You, <a href="https://github.com/beartype"><code>@​beartype</code></a>?</h2>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> is a patch release that guarantees compatibility with both <a href="https://python-poetry.org"><strong>Poetry</strong></a> and <a href="https://pipenv.pypa.io/en/latest"><strong><code>pipenv</code></strong></a>. Previously, <a href="https://github.com/beartype"><code>@​beartype</code></a> just assumed that Poetry and <code>pipenv</code> liked <a href="https://github.com/beartype"><code>@​beartype</code></a>. What's not to like about <a href="https://github.com/beartype"><code>@​beartype</code></a>, guys? Huh!? Apparently...</p>
<p><strong>Everything.</strong> <a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.3</code> broke the assumption that everybody likes <a href="https://github.com/beartype"><code>@​beartype</code></a>. Our prior release shipped a <code>pyproject.toml</code> file with a PEP 440-compliant version string:</p>
<pre lang="toml"><code>requires-python = &quot;&gt;=3.10,!=3.14rc1,!=3.14rc2&quot;
</code></pre>
<p>That syntax is valid. But Poetry and <code>pipenv</code> didn't care. They do what they want! And they didn't want to have anything to do with <a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.3</code>. We disagree, but that's fair enough. Everyone has bad opinions.</p>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> resolves these trivial incompatibilities with popular devtooling. <a href="https://github.com/beartype"><code>@​beartype</code></a> <code>0.22.4</code> also promises this will <em>never</em> happen again. A new integration test in the <a href="https://github.com/beartype"><code>@​beartype</code></a> test suite guarantees Poetry and <code>pipenv</code> compatibility, safeguarding both your QA stack and sanity against midnight regressions at 4:52AM.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d543d7c</code></a> Beartype 0.22.4: Now Less Hated by Poetry</li>
<li><a href=""><code>b25aa9b</code></a> Poetry compatibility x 2.</li>
<li><a href=""><code>65f2d2d</code></a> Poetry compatibility x 1.</li>
<li><a href=""><code>67dc586</code></a> <strong>Beartype 0.22.4</strong> started.</li>
<li><a href=""><code>97022c9</code></a> Beartype 0.22.3: Yo Dawg We Heard You Like Redis</li>
<li><a href=""><code>ed3092b</code></a> <code>gemini-cli</code> x 3.</li>
<li><a href=""><code>89a5c54</code></a> <code>gemini-cli</code> x 2.</li>
<li><a href=""><code>991addc</code></a> Bluesky social links.</li>
<li><a href=""><code>b33685c</code></a> Bump actions/upload-pages-artifact in the github-actions group (<a href="">#566</a>)</li>
<li><a href=""><code>d44915b</code></a> <code>@dataclasses.dataclass</code> + <code>redis.Redis</code>.</li>
<li>Additional commits viewable in <a href="https://github.com/beartype/beartype/compare/v0.20.2...v0.22.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=beartype&package-manager=pip&previous-version=0.20.2&new-version=0.22.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64699cec765b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.