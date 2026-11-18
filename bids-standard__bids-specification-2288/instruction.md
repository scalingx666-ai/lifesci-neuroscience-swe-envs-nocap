# Issue

**Title:** chore: Ignore redirect warnings in link checks

## Description

Make CircleCI Green Again Campaign!

Add --no-warnings flag to linkchecker commands to prevent CI failures on HTTP redirect warnings (301/302/303), which are valid links.

<details>
<summary>motivated by the fact that we have it red although no errors reported
</summary> 

```shell
On branch bep038-atlases_tsv
nothing to commit, working tree clean
Installed 10 packages in 10ms
INFO linkcheck.cmdline 2025-12-18 23:48:55,119 MainThread Checking intern URLs only; use --check-extern to check extern URLs.
LinkChecker 10.6.0
Copyright (C) 2000-2016 Bastian Kleineidam, 2010-2025 LinkChecker Authors
LinkChecker comes with ABSOLUTELY NO WARRANTY!
This is free software, and you are welcome to redistribute it under
certain conditions. Look at the file `COPYING' within this distribution.
Read the documentation at https://linkchecker.github.io/linkchecker/
Write comments and bugs to https://github.com/linkchecker/linkchecker/issues

Start checking at 2025-12-18 23:48:55+000
WARNING bs4.dammit 2025-12-18 23:48:55,198 CheckThread-file:///home/circleci/project/site/sitemap.xml.gz Some characters could not be decoded, and were replaced with REPLACEMENT CHARACTER.
 1 thread active,    92 links queued,  907 links in 1000 URLs checked, runtime 1 seconds

Statistics:
Downloaded: 3.85MB.
Content types: 20 image, 122 text, 0 video, 0 audio, 155 application, 0 mail and 1166 other.
URL lengths: min=17, max=896, avg=66.

That's it. 1463 links in 1463 URLs checked. 0 warnings found. 0 errors found.
Stopped checking at 2025-12-18 23:49:00+000 (5 seconds)
LinkChecker 10.6.0
Copyright (C) 2000-2016 Bastian Kleineidam, 2010-2025 LinkChecker Authors
LinkChecker comes with ABSOLUTELY NO WARRANTY!
This is free software, and you are welcome to redistribute it under
certain conditions. Look at the file `COPYING' within this distribution.
Read the documentation at https://linkchecker.github.io/linkchecker/
Write comments and bugs to https://github.com/linkchecker/linkchecker/issues

Start checking at 2025-12-18 23:49:01+000
 1 thread active,    96 links queued,  852 links in 949 URLs checked, runtime 1 seconds
 1 thread active,   149 links queued, 1083 links in 1233 URLs checked, runtime 6 seconds
 1 thread active,   132 links queued, 1100 links in 1233 URLs checked, runtime 11 seconds
 1 thread active,   113 links queued, 1119 links in 1233 URLs checked, runtime 16 seconds
 1 thread active,   101 links queued, 1131 links in 1233 URLs checked, runtime 21 seconds
 1 thread active,    85 links queued, 1147 links in 1233 URLs checked, runtime 26 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 31 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 36 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 41 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 46 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 51 seconds
 1 thread active,    78 links queued, 1154 links in 1233 URLs checked, runtime 56 seconds
 1 thread active,    69 links queued, 1163 links in 1233 URLs checked, runtime 1 minute, 1 seconds
 1 thread active,    56 links queued, 1176 links in 1233 URLs checked, runtime 1 minute, 6 seconds
 1 thread active,    43 links queued, 1189 links in 1233 URLs checked, runtime 1 minute, 11 seconds
 1 thread active,    30 links queued, 1202 links in 1233 URLs checked, runtime 1 minute, 16 seconds

URL        `https://genomebiology.biomedcentral.com/articles/10.1186/s13059-017-1215-1'
Name       `Multi-omics approaches to disease'
Parent URL file:///home/circleci/project/site/modality-specific-files/genetic-descriptor.html, line 1876, col 268
Real URL   https://link.springer.com/article/10.1186/s13059-017-1215-1
Check time 1.252 seconds
Warning    [http-redirected] Redirected to
           `https://link.springer.com/article/10.1186/s13059-017-1215-1'
           status: 301 Moved Permanently.
           [http-redirected] Redirected to
           `https://idp.springer.com/authorize?response_type=cookie&client_id=springerlink&redirect_uri=https%3A%2F%2Flink.springer.com%2Farticle%2F10.1186%2Fs13059-017-1215-1'
           status: 303 See Other.
           [http-redirected] Redirected to
           `https://link.springer.com/article/10.1186/s13059-017-1215-1'
           status: 302 Found.
Result     Valid: 200 OK
 1 thread active,    22 links queued, 1210 links in 1235 URLs checked, runtime 1 minute, 21 seconds
 1 thread active,    12 links queued, 1220 links in 1235 URLs checked, runtime 1 minute, 26 seconds
 1 thread active,     5 links queued, 1227 links in 1235 URLs checked, runtime 1 minute, 31 seconds

Statistics:
Downloaded: 3.69MB.
Content types: 0 image, 230 text, 0 video, 0 audio, 7 application, 0 mail and 996 other.
URL lengths: min=17, max=141, avg=57.

That's it. 1233 links in 1235 URLs checked. 3 warnings found. 0 errors found.
Stopped checking at 2025-12-18 23:50:33+000 (1 minute, 32 seconds)

Exited with code exit status 1

```
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e76bedba1533`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.