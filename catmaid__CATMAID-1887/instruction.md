# Issue

**Title:** Use 64 bit IDs in `concept` table

## Description

**This branch should be merged only after the upcoming CATMAID release.**

Like discussed in issue catmaid/catmaid#1848, IDs in the `concept` table (and all tables inheriting from it) should use the `bigint` type rather than `int`. So far I couldn't find a problem with this migration---I applied it in my development environments and will continue testing. If anyone is willing to look through the migration that would be very nice!

While we still have some headroom for the datasets we work with at the moment, keeping the IDs of concept table based tables (inheritance) at 32 bit would have been a limit at some point. Already we see large segmentation datasets that make this headroom rather small. Therefore this migration will rewrite all concept based tables as well as tables that reference them through foreign keys so that 64 bit IDs are used.

This migration also updates the review table to use 64 bit IDs. It also fixes the history views of the `catmaid_sampler` table, which haven't been kept up to date with column changes.

In addition a lot of missing foreign key constraints have been added. They shouldn't have a big import on performance and in fact no real difference could be measured.

The column order of concept changed slightly to improve the column alignment and reduce padding. So far we wasted 4 Bytes per row, because project_id occupied 4 Bytes and required 4 Bytes of padding for alignment, because it was followed by a bigint. This is changed now and no more padding is needed. This also lowers the impact on storage of the change to 64 bit IDs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1bbfb27cbcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.