# Issue

**Title:** [SQL] General BIDS dataset and file tables

## Description

## Description

This PR adds the "BIDS storage tables" `bids_dataset` and `bids_file`, as well as related foreign key fields to the LORIS SQL schema.

The design of these tables follows from conversations held during various imaging meetings, with only the immediately needed parts included in this PR, and leaves out the future "good to have" but less trivial parts for later (the design here is nonetheless easily extensible).

The goals of these tables is as follows: 
1. Provide a uniform way to store information about which BIDS datasets are stored in the LORIS data directory. This information could _theoretically_ be retrieved today but is very complicated as different pipelines have different outputs.
2. Save information about where an imported BIDS file comes from, and especially what was its original name if it was renamed by the LORIS BIDS importer. This is notably needed to support the incremental import of BIDS derivatives, as BIDS derivatives are often named similarly to the original files they are derived from, which we currently forget the original names of.

The design of these tables is as follows:
  - `bids_dataset`: A BIDS dataset in LORIS, which may be imported using the BIDS importer or generated using the LORIS DICOM or MINC to BIDS converter.
  - `bids_file`: A BIDS file in a LORIS BIDS dataset, no matter its type.
     - Notably stores the source path of the file (before it was renamed).
     - Both the source and LORIS paths are relative to the BIDS dataset (not the LORIS data directory).
- Data-type-specific file tables now have a nullable foreign key to their corresponding BIDS file, so that the relation between a specific file and it BIDS information can easily be queried.

This PR goes hand-to-hand with  which populates the new general BIDS tables for the BIDS MRI and EEG importer.

This design can later be extended with other features such as the following, which are however outside of the scope of this PR:
- Link BIDS files to BIDS or general file types.
- Add permissions to the BIDS datasets to make a BIDS storage (and import) API.

## Revert patch

```sql
ALTER TABLE `physiological_file`
  DROP FOREIGN KEY `physiological_file_head_shape_file_id_fk`,
  ADD CONSTRAINT `physiological_file_head_shape_file_id_fk`
    FOREIGN KEY (`HeadShapeFileID`) REFERENCES `meg_ctf_head_shape_file` (`ID`);

ALTER TABLE `meg_ctf_head_shape_file`
  DROP FOREIGN KEY `meg_ctf_head_shape_file_bids_info_id_fk`,
  DROP KEY `meg_ctf_head_shape_file_bids_info_id_fk_idx`,
  DROP COLUMN `InsertTime`,
  DROP COLUMN `BidsInfoID`;

ALTER TABLE `physiological_event_file`
  DROP FOREIGN KEY `physiological_event_file_bids_info_id_fk`,
  DROP KEY `physiological_event_file_bids_info_id_fk_idx`,
  DROP COLUMN `BidsInfoID`;

ALTER TABLE `physiological_file`
  DROP FOREIGN KEY `physiological_file_bids_info_id_fk`,
  DROP KEY `physiological_file_bids_info_id_fk_idx`,
  DROP COLUMN `BidsInfoID`;

ALTER TABLE `files`
  DROP FOREIGN KEY `files_bids_info_id_fk`,
  DROP KEY `files_bids_info_id_fk_idx`,
  DROP COLUMN `BidsInfoID`;

DROP TABLE `bids_file`;

DROP TABLE `bids_dataset`; 
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.