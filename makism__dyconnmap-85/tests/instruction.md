# Issue

**Title:** Upgrade to GitHub-native Dependabot

## Description

_Dependabot Preview will be shut down on August 3rd, 2021. In order to keep getting Dependabot updates, please merge this PR and migrate to GitHub-native Dependabot before then._

Dependabot has been fully integrated into GitHub, so you no longer have to install and manage a separate app. This pull request migrates your configuration from Dependabot.com to a config file, using the [new syntax][new_syntax]. When merged, we'll swap out `dependabot-preview` (me) for a new `dependabot` app, and you'll be all set!

With this change, you'll now use the [Dependabot page in GitHub][dependabot_page], rather than the [Dependabot dashboard][dashboard], to monitor your version updates, and you'll configure Dependabot through the new config file rather than a UI.

If you've got any questions or feedback for us, please let us know by creating an issue in the [dependabot/dependabot-core][issues] repository.

[Learn more about migrating to GitHub-native Dependabot][learn]

Please note that regular `@dependabot` commands do not work on this pull request.

[dashboard]: https://app.dependabot.com/
[dependabot_page]: https://github.com/makism/dyconnmap/network/updates
[issues]:
[learn]: http://docs.github.com/code-security/supply-chain-security/upgrading-from-dependabotcom-to-github-native-dependabot
[new_syntax]: https://help.github.com/en/github/administering-a-repository/configuration-options-for-dependency-updates
[org_secrets_url]: https://github.com/settings/secrets/dependabot
[repo_secrets_url]: https://github.com/makism/dyconnmap/settings/secrets/dependabot

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5dfb20d2fd1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.