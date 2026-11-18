# Issue

**Title:** DOC: clarify in config documentation that we log to stderr not stdout

## Description

We also have handling of DATALAD_LOG_OUTPUT but it is not interfaced in common_cfg.py thus I do not mention

*Proof*:
```shell
❯ DATALAD_LOG_LEVEL=debug datalad wtf 2>&1 | head -n 2
[DEBUG] Not retro-fitting GitRepo with deprecated symbols, datalad-deprecated package not found 
[DEBUG] Command line args 1st pass for DataLad 1.1.5. Parsed: Namespace(cfg_overrides=None, change_path=None, _=False, log_level='warning', common_on_failure=None, common_report_status=None, common_report_type=None, common_result_renderer='tailored', common_debug=False, common_idebug=False, version=None) Unparsed: ['wtf'] 
❯ DATALAD_LOG_LEVEL=debug datalad wtf 2>/dev/null | head -n 2
# WTF
## configuration <SENSITIVE, report disabled by configuration>
```

and code is here https://github.com/datalad/datalad/blob/HEAD/datalad/log.py#L614

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e2dfecec8c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.