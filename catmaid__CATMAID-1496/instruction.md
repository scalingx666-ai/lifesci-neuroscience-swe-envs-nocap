# Issue

**Title:** Node back-end: return epoch timestamps instead of parsed string

## Description

This cuts JSON generation time in half, which can be >100ms for large
result sets. Consequently, overlay nodes nodes now store the edition
time as a second based epoch time number, which is the format Postgres
uses. To make this work with with string based state checking an
accessor has been added to the overlay node prototype, so that the ISO
string representation can be generated on demand and to set a value
based on a ISO string.

Not requiring DataTime objects to be converted to JSON on the back-end
also allows us to remove the use of the DjangoJSONEncoder and use the
standard encoder. If it turns out to be worth it, this would allow using
alternative JSON encodes, e.g. ujson.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2891240fada`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.