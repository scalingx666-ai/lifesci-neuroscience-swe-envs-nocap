# Issue

**Title:** chore(deps): bump handlebars from 4.0.10 to 4.5.3

## Description

Bumps [handlebars](https://github.com/wycats/handlebars.js) from 4.0.10 to 4.5.3.
<details>
<summary>Changelog</summary>

*Sourced from [handlebars's changelog](https://github.com/wycats/handlebars.js/blob/master/release-notes.md).*

> ## v4.5.3 - November 18th, 2019
> Bugfixes:
>
> - fix: add "no-prototype-builtins" eslint-rule and fix all occurences - f7f05d7
> - fix: add more properties required to be enumerable - 1988878
>
> Chores / Build:
> - fix: use !== 0 instead of != 0 - c02b05f
> - add chai and dirty-chai and sinon, for cleaner test-assertions and spies,
>   deprecate old assertion-methods  - 93e284e, 886ba86, 0817dad, 93516a0
>
> Security:
>
> - The properties `__proto__`, `__defineGetter__`, `__defineSetter__` and `__lookupGetter__`
>   have been added to the list of "properties that must be enumerable".
>   If a property by that name is found and not enumerable on its parent,
>   it will silently evaluate to `undefined`. This is done in both the compiled template and the "lookup"-helper.
>   This will prevent new Remote-Code-Execution exploits that have been
>   published recently.
>
> Compatibility notes:
>
> - Due to the security-fixes. The semantics of the templates using
>   `__proto__`, `__defineGetter__`, `__defineSetter__` and `__lookupGetter__` in the respect that those expression now return
>   `undefined` rather than their actual value from the proto.
> - The semantics have not changed in cases where the properties are  enumerable, as in:
>
> ```js
> {
>   __proto__: 'some string'
> }
> ```
>
> - The change may be breaking in that respect, but we still only
>   increase the patch-version, because the incompatible use-cases
>   are not intended, undocumented and far less important than fixing
>   Remote-Code-Execution exploits on existing systems.
>
>
>
> [Commits](https://github.com/wycats/handlebars.js/compare/v4.5.2...v4.5.3)
>
> ## v4.5.2 - November 13th, 2019
> # Bugfixes
>
> - fix: use String(field) in lookup when checking for "constructor" - d541378
> - test: add fluent API for testing Handlebars - c2ac79c
>
> Compatibility notes:
> - no incompatibility are to be expected
></tr></table> ... (truncated)
</details>
<details>
<summary>Commits</summary>

-  v4.5.3
-  Update release notes
-  fix: add "no-prototype-builtins" eslint-rule and fix all occurences
-  fix: add more properties required to be enumerable
-  test/chore: add chai/expect and sinon to "runtime"-environment
-  test: add sinon as global variable to eslint in the specs
-  test: add sinon.js for spies, deprecate current assertions
-  chore: add chai and dirty-chai for better test assertions
-  fix: use !== 0 instead of != 0
-  v4.5.2
- Additional commits viewable in [compare view](https://github.com/wycats/handlebars.js/compare/v4.0.10...v4.5.3)
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=handlebars&package-manager=npm_and_yarn&previous-version=4.0.10&new-version=4.5.3)](https://help.github.com/articles/configuring-automated-security-fixes)

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
- `@dependabot ignore this [patch|minor|major] version` will close this PR and stop Dependabot creating any more for this minor/major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/urish/muse-js/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ae2e71a8889`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.