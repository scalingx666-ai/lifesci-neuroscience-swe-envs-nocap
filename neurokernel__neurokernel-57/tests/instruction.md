# Issue

**Title:** Fixed tests and added support for mpi4py version 3

## Description

Made changes to fix both inline tests in ./neurokernel and unit tests in ./tests. Made changes to support mpi4py v3.0.0 and ran all tests to validate implementation. 

./neurokernel/core_gpu.py
Many tests assume the machine you're on has more than one GPU. This will not always be
true. When a GPU that doesn't exist is specified, assign a device that does exist at
random.

./neurokernel/mpi.py
The inline tests for mpi.py and mpi_proc.py need a routing table. For an __init__ with
named arguments routing_table needs to be included in the arguments or it won't be sent
to the mpi_backend

./neurokernel/mpi_backend.py
mpi4py has again changed the way to override pickle with dill in version 3.0.0
This change allows us to support version 3.0.0 of mpi4py along with previous versions

./neurokernel/mpi_proc.py
1) mpi4py has again changed the way to override pickle with dill in version 3.0.0 
   This change allows us to support version 3.0.0 of mpi4py along with previous versions

2) The inline tests in mpi.py and mpi_proc.py need a routing_table. If one does not exist
   issue a warning and create an empty RoutingTable(). This should only be necessary
   for the tests, or if someone extends mpi.Worker or mpi_proc.Process instead of
   extending core_gpu.Module for some reason.

./neurokernel/plsel.py
The specified MultiIndex for empty selector has one level. There needs to be one name
for an empty Selector('').     

./tests/test_core_gpu.py
There was a race condition where the post_run method would tell the parent it's done
and then write the output that was read by the parent. Many times the parent would
look for the output before the method wrote it and the test would error. This change
makes the post_run method write out the output before telling the parent it's done.

./tests/test_mixins.py
There was a mismatch in the expected format of the log messages.

./tests/test_mpi_proc.py
This test was really broken including trying to pass a method to the ProcessManager
when the process manager asserts if the argument passed is not derived from Method,
and calling the run() method on ProcessManager that was renamed spawn().

./tests/test_plsel.py
I can't find any selector or pattern code that returns pd.Index ... they all seem to
return MultiIndex. The responses from the tests looked good so I changed the expected
results to MultiIndex.
TODO - this test still fails on test_select_order() 

./tests/test_pm.py
I can't find any selector or pattern code that returns pd.Index ... they all seem to
return MultiIndex. The responses from the tests looked good so I changed the expected
results to MultiIndex.

## TODO - The test_pattern.py and test_lpu.py tests still fail.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9dab2275011f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.