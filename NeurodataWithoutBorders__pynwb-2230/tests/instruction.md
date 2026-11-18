# Issue

**Title:** Read files whose dates carry a sub-minute UTC offset

## Description

I ran into this while working with `session1.nwb` from the Karpowicz 2025 cursor-control deposit on Dryad (https://datadryad.org/dataset/doi:10.5061/dryad.q83bk3jtp): `NWBHDF5IO.read()` refused to open it, raising `ParserError: Unknown string format`. The reason is that its `session_start_time` is `1900-10-01T00:00:00-05:50:36`, a sub-minute UTC offset (a placeholder artifact from attaching a `pytz` zone without calling `localize`), and `dateutil` rejects any offset with a seconds component, so a 237 MB file is unreadable over one metadata string. These offsets are outside ISO 8601, so pynwb itself never writes them, but I think we should still be able to read old files that another tool wrote this way. So I made date parsing on read (`session_start_time`, `timestamps_reference_time`, `file_create_date`, and `Subject.date_of_birth`) fall back to parsing the sub-minute offset itself, and raise a clear `ValueError` naming the field when a value is genuinely unparseable. (`datetime.fromisoformat` only accepts these offsets from Python 3.11, so the fallback handles the offset directly to keep working on the 3.10 floor.) What do you think?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2eab605bc576`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.