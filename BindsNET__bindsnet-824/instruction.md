# Issue

**Title:** chore(deps): Bump filelock from 3.32.5 to 4.2.1

## Description

Bumps [filelock](https://github.com/tox-dev/py-filelock) from 3.32.5 to 4.2.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>4.2.1</h2>
<ul>
<li>On a singleton wrapper, <code>close&gt;</code> and
<code>close&gt;</code> end only the holds that tasks acquired
through that wrapper. A reader that arrives during <code>close()</code> gets the closed error instead of joining the ending hold.
After synchronous code closes or force-releases the shared lock, the wrappers refuse to admit readers into the ended
hold, and <code>close()</code> on such a wrapper returns.
Closing one wrapper no longer ends a task's nested hold taken through another wrapper on the same path. <a href="">#832</a></li>
<li><code>ReadWriteLock</code> locks again after a <code>release()</code> that an exception from a signal handler interrupted.
The async read-write wrappers stop admitting readers into such a level. The async read-write locks forget a hold whose
backend release failed after the backend let go, and they free the memory of each acquire that times out or is canceled.
<code>AsyncFileLock</code> returns from <code>release()</code> after a few hundred acquires gave up behind a waiting one. An exception from a signal handler delivered while an <code>AsyncFileLock</code> call joins
its queue no longer blocks every later call on that lock. <a href="">#833</a></li>
<li>Fix <code>ReadWriteLock</code> acting on <code>-journal</code>, <code>-wal</code> or <code>-shm</code> files another process puts beside its
database: a write could land in another file, a reader could get in beside a writer, and an acquire could fail. SQLite
now opens the database by name only in a directory no other account can write, and through a private hard link
elsewhere. On Windows the directory's access control list decides. Where hard links are unavailable, keep the database
in a directory other accounts cannot write, such as one under <code>%LOCALAPPDATA%</code>. The lock removes link directories
through a checked descriptor rather than by name, reads a link directory's name only when the locking account owns it,
and leaves alone a directory with other content renamed onto a link directory's name. A database whose schema takes more
than a few kilobytes to load raises <code>ValueError</code> instead of running past the acquire timeout. <a href="">#834</a></li>
<li>Fix five bugs in opening the lock file. <code>UnixFileLock</code> no longer truncates a file it did not create,
such as one renamed to the lock path, and no longer applies <code>mode</code> to it. An <code>on_acquired</code> hook that writes holder
metadata now truncates the file itself. A lease (Linux) or an oplock (Windows) on the lock file or a soft lock's marker
no longer holds <code>acquire()</code> past its <code>timeout</code> or <code>blocking=False</code>, and an oplock no longer holds <code>release()</code>;
<code>ReadWriteLock</code> on Windows waits for its <code>timeout</code> and raises <code>Timeout</code>. On Windows,
a <code>mode</code> without group and other bits, such as <code>0o600</code>, now creates the lock file with an owner-only permission
list; the <code>ReadWriteLock</code> database gets the same. The soft locks' writability check no longer follows a
symlink swapped in at the lock path. On a filesystem without <code>flock</code>, a contender from another account now waits on a
marker it cannot write instead of raising <code>PermissionError</code>. <a href="">#835</a></li>
<li>Fix <code>SoftFileLock</code>, <code>MarkerSoftFileLock</code> and <code>SoftFileLease</code> removing
a live holder's marker in three cases: the holder and the contender run in Linux time namespaces with different boottime
offsets; only one of them can read the boot id; a process other than the owner rewrote the marker. Soft markers no
longer carry group or other write bits. A process name containing a carriage return or another line separator no longer
makes the stale check raise <code>ValueError</code>. When <code>/proc/self/ns/time</code> exists but cannot be read, the stale check
no longer compares start times and keeps the marker. <a href="">#836</a></li>
<li>The async read-write locks record their hold under a task owner, so synchronous code on the executor thread that took
the hold can no longer re-enter or release it. <code>AsyncSoftReadWriteLock</code> gives back one level on
release, so synchronous readers of a shared singleton keep theirs. <code>SoftReadWriteLock</code> tracks read
levels per thread: <code>release()</code> from a thread that holds none raises <code>RuntimeError</code>. After its heartbeat
recorded a lost hold, it refuses new acquires until that hold is released. <a href="">#838</a></li>
<li><code>StrictSoftFileLock</code> creates <code>&lt;path&gt;.filelock</code> and its <code>claims</code> directory with the lock's <code>mode</code>
and sets the sticky bit (a directory flag that lets only a file's owner remove it) on both. On the next acquisition it
narrows a directory it owns that an earlier release created wider; it leaves a directory of another account as it is,
so remove such leftovers by hand. It reaches <code>claims</code> through a descriptor opened without following symlinks; on
Windows it holds both directories open and refuses a junction (a directory that points at another directory). Under a
sticky parent such as <code>/tmp</code> it refuses a coordination directory of another account, as
<code>SoftReadWriteLock</code> does for <code>&lt;path&gt;.rw</code>. One read grace now covers a whole claim scan, a failed
claim cleanup no longer leaves the sentinel descriptor open, and a non-regular node at a sentinel private-record name
raises <code>SoftFileLockProtocolError</code>. On Windows, contenders read claims without blocking their owner's
unlink. <a href="">#839</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<p>.. towncrier-draft-entries:: Unreleased</p>
<p>.. towncrier release notes start</p>
<hr />
<p>4.2.4 (2026-10-19)</p>
<hr />
<ul>
<li>Keep GitHub Release notes free of extra blank lines while retaining the PyPI and version comparison links. :pr:<code>863</code></li>
</ul>
<hr />
<p>4.2.3 (2026-10-19)</p>
<hr />
<ul>
<li>Creating a lock on a Python 3.15 interpreter without <code>types.LazyImportType</code> no longer triggers <code>AttributeError</code> at
exit. :pr:<code>860</code></li>
<li>Handle <code>EFTYPE</code> when a no-follow open refuses a symlink in a soft reader/writer lock's protocol tree, so heartbeat
reports lost ownership rather than a transient refresh error.</li>
</ul>
<hr />
<p>4.2.2 (2026-10-18)</p>
<hr />
<ul>
<li>Fix a lock on a relative path that stayed held after a later <code>with lock:</code> ended, when an earlier <code>acquire()</code> had
failed because the working directory no longer exists. That call still raises :class:<code>FileNotFoundError</code>, and it now
leaves the lock's hold count unchanged. :pr:<code>856</code></li>
</ul>
<hr />
<p>4.2.1 (2026-10-17)</p>
<hr />
<ul>
<li>On a singleton wrapper, :meth:<code>AsyncReadWriteLock.close() &lt;filelock.AsyncReadWriteLock.close&gt;</code> and
:meth:<code>AsyncSoftReadWriteLock.close() &lt;filelock.AsyncSoftReadWriteLock.close&gt;</code> end only the holds that tasks acquired
through that wrapper. A reader that arrives during <code>close()</code> gets the closed error instead of joining the ending hold.
After synchronous code closes or force-releases the shared lock, the wrappers refuse to admit readers into the ended
hold, and <code>close()</code> on such a wrapper returns.
Closing one wrapper no longer ends a task's nested hold taken through another wrapper on the same path. :pr:<code>832</code></li>
<li>:class:<code>~filelock.ReadWriteLock</code> locks again after a <code>release()</code> that an exception from a signal handler interrupted.
The async read-write wrappers stop admitting readers into such a level. The async read-write locks forget a hold whose
backend release failed after the backend let go, and they free the memory of each acquire that times out or is canceled.
:class:<code>~filelock.AsyncFileLock</code> returns from <code>release()</code> after a few hundred acquires gave up behind a waiting one. An exception from a signal handler delivered while an :class:<code>~filelock.AsyncFileLock</code> call joins
its queue no longer blocks every later call on that lock. :pr:<code>833</code></li>
<li>Fix :class:<code>~filelock.ReadWriteLock</code> acting on <code>-journal</code>, <code>-wal</code> or <code>-shm</code> files another process puts beside its
database: a write could land in another file, a reader could get in beside a writer, and an acquire could fail. SQLite
now opens the database by name only in a directory no other account can write, and through a private hard link
elsewhere. On Windows the directory's access control list decides. Where hard links are unavailable, keep the database</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>60331bb</code></a> Release 4.2.1</li>
<li><a href=""><code>834bf13</code></a> 🧪 test(soft): skip Unix pin test on Windows</li>
<li><a href=""><code>9d15e38</code></a> fix(soft-rw): isolate subclass singleton registries (<a href="">#855</a>)</li>
<li><a href=""><code>e1e825b</code></a> 🐛 fix(open): keep lock files intact, honor deadlines and mode (<a href="">#835</a>)</li>
<li><a href=""><code>5e3f2ec</code></a> 🐛 fix(read-write): keep SQLite off shared names, bound schema (<a href="">#834</a>)</li>
<li><a href=""><code>bfa066d</code></a> 🐛 fix(strict): keep claim directories private to the lock (<a href="">#839</a>)</li>
<li><a href=""><code>977d2c3</code></a> 🐛 fix(soft): wait on an empty marker instead of evicting (<a href="">#846</a>)</li>
<li><a href=""><code>740ff66</code></a> 🐛 fix(soft): break stale markers without emptying the lock path (<a href="">#843</a>)</li>
<li><a href=""><code>86c6d5f</code></a> 🐛 fix(async): honor cancellation and per-thread gates (<a href="">#844</a>)</li>
<li><a href=""><code>eeceaa8</code></a> 🐛 fix(soft): keep live holders when owner identity differs (<a href="">#836</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.32.5...4.2.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=filelock&package-manager=pip&previous-version=3.32.5&new-version=4.2.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7ac73a37b3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.