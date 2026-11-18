# Issue

**Title:** Do not recurse into .git when looking for plugins

## Description

When using a custom plugin folder which is version controlled by git, phy recurses into all the subfolders which is unneccessary. This PR excludes paths with `.git` when phy is searching plugins in plugin.py

```
14:59:22.415 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git`.
14:59:22.415 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/77`.
14:59:22.415 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/7a`.
14:59:22.415 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/62`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/47`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/d0`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/b4`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/pack`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/78`.
14:59:22.416 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/4b`.
14:59:22.417 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/01`.
14:59:22.417 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/e2`.
14:59:22.417 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/c1`.
14:59:22.417 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/6f`.
14:59:22.417 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/d4`.
14:59:22.418 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/ac`.
14:59:22.418 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/18`.
14:59:22.418 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/37`.
14:59:22.418 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/2e`.
14:59:22.418 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/81`.
14:59:22.419 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/25`.
14:59:22.419 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/5d`.
14:59:22.419 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/48`.
14:59:22.419 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/info`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/b8`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/3d`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/b3`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/09`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/52`.
14:59:22.420 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/30`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/46`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/4d`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/9f`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/db`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/fd`.
14:59:22.421 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/objects/4c`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/logs/refs`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/logs/refs/remotes`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/logs/refs/remotes/origin`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/logs/refs/heads`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/refs/remotes`.
14:59:22.422 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/refs/remotes/origin`.
14:59:22.423 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/refs/tags`.
14:59:22.423 [D] plugin:74            Scanning `/home/ycan/repos/phy_plugins/.git/refs/heads`.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7fc468c4ba4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.