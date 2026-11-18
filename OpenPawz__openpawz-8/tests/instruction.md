# Issue

**Title:** chore(deps): bump matrix-sdk from 0.9.0 to 0.10.0 in /src-tauri

## Description

Bumps [matrix-sdk](https://github.com/matrix-org/matrix-rust-sdk) from 0.9.0 to 0.10.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matrix-org/matrix-rust-sdk/releases">matrix-sdk's releases</a>.</em></p>
<blockquote>
<h2>matrix-sdk 0.10.0</h2>
<h2>What's Changed</h2>
<h3>Features</h3>
<ul>
<li>Allow to set and check whether an image is animated via its <code>ImageInfo</code>.
(<a href="">#4503</a>)</li>
<li>Implement <code>Default</code> for <code>BaseImageInfo</code>, <code>BaseVideoInfo</code>, <code>BaseAudioInfo</code> and
<code>BaseFileInfo</code>.
(<a href="">#4503</a>)</li>
<li>Expose <code>Client::server_versions()</code> publicly to allow users of the library to
get the versions of Matrix supported by the homeserver.
(<a href="">#4519</a>)</li>
<li>Create <code>RoomPrivacySettings</code> helper to group room settings functionality
related to room access and visibility.
(<a href="">#4401</a>)</li>
<li>Enable HTTP/2 support in the HTTP client.
(<a href="">#4566</a>)</li>
<li>The media contents stored in the media cache can now be controlled with a
<code>MediaRetentionPolicy</code> and the new <code>Media</code> methods <code>media_retention_policy()</code>,
<code>set_media_retention_policy()</code>, <code>clean_up_media_cache()</code>.
(<a href="">#4571</a>)</li>
</ul>
<h3>Refactor</h3>
<ul>
<li>[<strong>breaking</strong>]: The reexported types <code>SyncTimelineEvent</code> and <code>TimelineEvent</code> have been fused into a single type <code>TimelineEvent</code>, and its field <code>push_actions</code> has been made <code>Option</code>al (it is set to <code>None</code> when  we couldn't compute the push actions, because we lacked some information).
(<a href="">#4568</a>)</li>
<li>[<strong>breaking</strong>] Move the optional <code>RequestConfig</code> argument of the
<code>Client::send()</code> method to the <code>with_request_config()</code> builder method. You
should call <code>Client::send(request).with_request_config(request_config).await</code>
now instead.
(<a href="">#4443</a>)</li>
<li>[<strong>breaking</strong>] Remove the <code>AttachmentConfig::with_thumbnail()</code> constructor and
replace it with the <code>AttachmentConfig::thumbnail()</code> builder method. You should
call <code>AttachmentConfig::new().thumbnail(thumbnail)</code> now instead.
(<a href="">#4452</a>)</li>
<li>[<strong>breaking</strong>] <code>Room::send_attachment()</code> and <code>RoomSendQueue::send_attachment()</code>
now take any type that implements <code>Into&lt;String&gt;</code> for the filename.
(<a href="">#4451</a>)</li>
<li>[<strong>breaking</strong>] <code>Recovery::are_we_the_last_man_standing()</code> has been renamed to <code>is_last_device()</code>.
(<a href="">#4522</a>)</li>
<li>[<strong>breaking</strong>] The <code>matrix_auth</code> module is now at <code>authentication::matrix</code>.
(<a href="">#4575</a>)</li>
<li>[<strong>breaking</strong>] The <code>oidc</code> module is now at <code>authentication::oidc</code>.
(<a href="">#4575</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4c46e42</code></a> chore: Release matrix-sdk version 0.10.0</li>
<li><a href=""><code>0d4bc65</code></a> chore: Enable releases for the test crates</li>
<li><a href=""><code>5e1bae0</code></a> feat(ffi): Add <code>RoomPreview::forget</code> action in the FFI layer</li>
<li><a href=""><code>77a67de</code></a> fix(ui): Fix performance of <code>ReadReceiptTimelineUpdate::apply</code>.</li>
<li><a href=""><code>f27eb4d</code></a> fix[oidc]: fix docstring in oidc module</li>
<li><a href=""><code>05814c5</code></a> refactor(ffi): Map client API errors to <code>ClientError::MatrixApi</code>, containing ...</li>
<li><a href=""><code>d5d9898</code></a> feat: Upgrade Ruma to 0.12.1</li>
<li><a href=""><code>3f71d9a</code></a> fix(sdk): Improve performance of <code>RoomEvents::maybe_apply_new_redaction</code>.</li>
<li><a href=""><code>b077f45</code></a> test(room_preview): Add tests for where <code>get_room_preview</code> gets its data from...</li>
<li><a href=""><code>648d527</code></a> fix(room_preview): Return room preview info based on local data for banned ro...</li>
<li>Additional commits viewable in <a href="https://github.com/matrix-org/matrix-rust-sdk/compare/matrix-sdk-0.9.0...matrix-sdk-0.10.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matrix-sdk&package-manager=cargo&previous-version=0.9.0&new-version=0.10.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71c155645e6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.