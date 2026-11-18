# Issue

**Title:** Bump beartype from 0.18.5 to 0.19.0

## Description

Bumps [beartype](https://github.com/beartype/beartype) from 0.18.5 to 0.19.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/beartype/beartype/releases">beartype's releases</a>.</em></p>
<blockquote>
<h2>Beartype 0.19.0: A Flying Man-Pig Gives the Thumbs Up of QA</h2>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0 gently glides into your CI workflow for a <del>crash</del> miracle landing. Engines go <em>brrrrrrrr.</em></p>
<p><img src="https://media1.tenor.com/m/NO25qNwRMDUAAAAC/porco-rosso-plane.gif" alt="" />
<!-- raw HTML omitted --><em><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0 narrowly avoids the grazing sheep in this terrifying metaphor.</em><!-- raw HTML omitted --></p>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0 invites you to experience either the future of QA <em>or</em> a new catastrophe for QA – all from the comfort of your (t)rusty keyboard. It now thrums with untold power and the lurid afterglow of our out-of-control release cycle.</p>
<pre lang="bash"><code>pip install --upgrade beartype    # &lt;-- engines hit full throttle, stomach hits full empty
</code></pre>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0 is proudly brought to you by...</p>
<h2>GitHub Sponsors: When You Befriend the Bear, You Got a Bear</h2>
<p>This release comes courtesy these proud <a href="https://github.com/sponsors/leycec">GitHub Sponsors</a>, without whom <a href="https://github.com/leycec"><code>@​leycec</code></a>'s cats would currently be eating grasshoppers:</p>
<ul>
<li><a href="https://github.com/sesco-llc"><code>@​sesco-llc</code></a> (SESCO Enterprises), &quot;The Power of Innovation in Trading&quot;: <!-- raw HTML omitted --><em>this inspires me to get out of the house and do something</em><!-- raw HTML omitted -->
<a href="https://sescollc.com">https://sescollc.com</a></li>
<li><a href="https://github.com/DylanModesitt"><code>@​DylanModesitt</code></a> (Dylan Modesitt), quantitative strategies energy trading associate: <!-- raw HTML omitted --><em>...wikipedia, don't fail me now!</em><!-- raw HTML omitted -->
<a href="https://dylanmodesitt.com">https://dylanmodesitt.com</a></li>
<li><a href="https://github.com/tactile-metrology"><code>@​tactile-metrology</code></a> (Tactile Metrology), &quot;Software and hardware that you can touch.&quot; When I want to be touched by software and hardware, I call <a href="https://github.com/tactile-metrology"><code>@​tactile-metrology</code></a>:
<a href="https://metrolo.gy">https://metrolo.gy</a>   <!-- raw HTML omitted -->imagine if this domain actually worked. <em>how cool would that be!?</em><!-- raw HTML omitted --></li>
</ul>
<p>Thanks so much, masters of fintech and metrology.</p>
<p><img src="https://media1.tenor.com/m/eP5wF2oH6E4AAAAC/falling-land.gif" alt="" />
<!-- raw HTML omitted -->The Masters of Fintech and Metrology. <em>That's who.</em><!-- raw HTML omitted --></p>
<h2><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0: What Broke This Time?</h2>
<p><!-- raw HTML omitted --><em>Probably, a whole lot. Hopefully, a whole little. The truth lies in the middle.</em><!-- raw HTML omitted --></p>
<p><a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0 sidles up to your codebase in its blind spot with something suspicious in its paws. Questionable new features include:</p>
<ul>
<li>
<p><code>beartype.door.infer_hint()</code>: let BeartypeAI™ write your type hints for you, because you no longer have <a href="https://en.wikipedia.org/wiki/Will_to_power"><em>der Wille zur Macht</em></a> to constantly deal with all this <strong>[</strong><code>redacted pejorative</code><strong>]</strong>:</p>
<pre lang="python"><code># I've got a crazy object here, @beartype. What's the crazy type hint that
# matches my crazy object? This is gonna really suck. I can *FEEL* it coming
# through my monitor tonight.
&gt;&gt;&gt; beartype.door.infer_hint(pygments.lexers.PythonLexer().tokens[&quot;root&quot;])
list[typing.Union[tuple[str | collections.abc.Callable[
typing.Concatenate[object, object, ...], object], ...], tuple[str |
pygments.token._TokenType[str], ...], typing.Annotated[
collections.abc.Collection[str], beartype.vale.IsInstance[
pygments.lexer.include]]]]  # &lt;-- I have no idea. Neither does that cute intern.
</code></pre>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f17bbed</code></a> Beartype 0.19.0: A Flying Man-Pig Gives the Thumbs Up of QA</li>
<li><a href=""><code>00a5520</code></a> <a href="https://github.com/beartype"><code>@​beartype</code></a> 0.19.0: <em>All abooooooard!</em></li>
<li><a href=""><code>62d40dc</code></a> <strong>Beartype 0.19.0rc3</strong> started.</li>
<li><a href=""><code>b355139</code></a> Beartype 0.19.0 RC 2: Prelude to Bug-free Bliss</li>
<li><a href=""><code>2a86c99</code></a> Shallow PEP 646 + 692 x 4.</li>
<li><a href=""><code>2760fed</code></a> Shallow PEP 692 x 3.</li>
<li><a href=""><code>c6a3f1a</code></a> Shallow PEP 692 x 2.</li>
<li><a href=""><code>8f56cc9</code></a> Shallow PEP 692 x 1.</li>
<li><a href=""><code>a427eea</code></a> <code>mypy</code> + <code>pyright</code>: Be Silent, You!</li>
<li><a href=""><code>fe20269</code></a> Forward reference resolution exception improved.</li>
<li>Additional commits viewable in <a href="https://github.com/beartype/beartype/compare/v0.18.5...v0.19.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=beartype&package-manager=pip&previous-version=0.18.5&new-version=0.19.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca00488f4106`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.