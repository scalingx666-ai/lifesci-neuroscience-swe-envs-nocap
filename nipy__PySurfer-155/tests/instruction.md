# Issue

**Title:** WIP:  adapt Brain.save_movie() API for imageio

## Description

Following up on

`imageio` parameters: http://imageio.readthedocs.io/en/latest/format_ffmpeg.html#parameters-for-saving

Probably the most sense would make to provide access to all of `imageio`'s options. I've saved a couple of movies and `imageio` seems to have sensible defaults (variable bitrate, hence I removed our fixed bitrate default). We could keep the existing keyword arguments so we don't break code that used positional arguments. Are there better alternatives? I am not sure how to document in case we just include a `**kwargs` in the signature. Should the documentation just include a link to `imageio`'s documentation?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89056ab94e71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.