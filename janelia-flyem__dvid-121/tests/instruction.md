# Issue

**Title:** Google storage bucket plugin

## Description

Inspired by Ignacio's BigTable plugin, I added a plugin for Google Storage.  While the latency to objects in Google's storage buckets is much worse than BigTable, this plugin might be useful in situations when batch access to cheaper storage is required.

It is unclear whether it might just be better to have a single DVID with an embedded leveldb on a Google VM for many use cases.  Assuming the latency is much better with an embedded leveldb on a VM, total read/write throughput might be superior to small cluster deployments using google buckets.  However, the cost of persistent disks is slightly more than google bucket storage and persistent disks appear to have a 10TB limit.  Furthermore, in some batch operations, such as image segmentation, the read/write throughput requirements are insignificant compared to the compute required.

This plugin is mostly disjoint from the rest of DVID.  The plugin has been tested by exercising part of the DVID API manually.  Formal testing still needs to be added.

Documentation on how to use the plugin is in the DVID wiki.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65bdb6cab019`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.