# Issue

**Title:** Don't rerun ICA if robustICA was used and clean up integration tests

## Description

.

This has been sitting around for a while and I thought it was a quick fix, but... sigh.

tedana's initial functionality was, if no components are accepted, rerun ICA & try again. The above issue claimed this caused problems if there's a user-provided mixing matrix, but ICA doesn't actually rerun in that situation. A newer problem noted in the comments of that issue is that, when robustICA is used properly, the mixing matrix should be nearly identical across repeated runs. That means, this wastes compute cycles to get the same result after multiple repetitions. This PR fixes the second issue and adds better warnings for situations where there are no accepted components.

In the process of addressing the above and adding tests, I came across some inefficiencies and problems in `test_integration.py` that might explain *some* of our unpredictable testing failures.

Changes proposed in this pull request:

- If there are no accepted components when using robustICA, ICA is not repeated and a warning message mentioning robustICA is logged
- If there are no accepted components with a user-supplied mixing matrix, ICA continues to not be repeated, but there is now a warning message mentioning the user-supplied mixing matrix.
- I also noticed we were running an identical `automatic.selection` twice in a row in `tedana.py`, which I suspect was an error after fixing of a past merge conflict. I delete the repetition here.
- integration tests
  - `cornell_three_echo_verbose_outputs.txt` was created to check file outputs when verbose was used
  - `reject_all_tree.json` was created so there's a rapidly executed tree that always rejects all components
  - `check_integration_outputs` is used to directly compare a file list to the outputted files. There was one exception to use for options, but with distinct executions of tedana outputing slightly different files, this was causing headaches. It is expanded so that we can specify the total number of expected components (useful if different iterations use different options for `--tedpca` and to accept a list of files to add or remove from the expected outputs without needed to hard-code a expected registry file for each option. This is also more interpretable than hard coding because the baseline set of files is hard-coded and each test as a comment to highlight the few files that are different.
    - There is also an option to not check the number of `figures/comp_???.png` files. Since robustICA with just the few iterations we use in integration tests might not always output the same number of stable components, I'm using this when robustICA is used & I think it will prevent some random testing failures.
  - `test_integration_three_echo` was slow and not working as expected. It included a repeated execution of tedana to test the overwrite, but the second repetition went to a different directory, so there wasn't actually any overwriting. I retained the first test (but converted it to our CLI test) and now have repeated tests in `test_integration_three_echo_noacc_rerun` which writes the no accepted components outputs twice to the same directory and confirms the correct warning messages.
    - I also noticed `test_integration_three_echo_external_regressors_motion_task_models` didn't call `download_test_data` which would result in CircleCI testing failures if that was run before another test downloaded the necessary data.
    - For `test_integration_three_echo` I changed from `aic` to `mdl` and, for `test_integration_three_echo_external_regressors_single_model` from `aic` to `0.9` which results in fewer components & should run faster
    - with `data_for_testing_info("path") added in #1217 I replaced two hardcoded calls to the path to using that function.

Added comments:

- The discussion in #980 suggested outputting an error, but I realized the above solution fits better with our existing design in that all results will be outputted and a warning is noted.
- One non-change of note: When there are no accepted components, tedana outputs the residual after all components are regressed out. The original meica (and earlier tedana?) functionality was to have a failure state such that optimally combined == denoised when there are no accepted components. I'm not changing this difference here.
- The overwrite test above doesn't work as expected (See note here: https://github.com/handwerkerd/tedana/blob/0293f8d0d9e2cc070a1ac5044d552c958b410b82/tedana/tests/test_integration.py#L392-L398 ). I'll open a separate issue to discuss what to do.
- This is also another reminder to eventually work on #920. There are block of repeated code if the mixing matrix is or is not applied and that makes understanding & working in this area of the code a lot harder.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2e82531bfa4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.