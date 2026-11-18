# Issue

**Title:** DOC: fix up specification of Units for genetics_ukbb to be years

## Description

Prompted by checks in
- 

Looking at the data suggests that it is very unlikely to be months since capped at 89+ and for ukb it was not on toddlers

    ❯ head -n 6 genetics_ukbb/participants.tsv
    participant_id	age	sex	group	genetic_id	IDH	BatchID	VariationSetType	Assembly	GeneticDataType
    sub-01	48	M	patient	125425	yes	b001	CNV	hg38	SNP_intensity
    sub-02	60	M	control	125698	no	b001	CNV	hg38	SNP_intensity
    sub-03	72	M	patient	452589	yes	b002	SNV/CNV	hg19/hg38	WES/SNP_intensity
    sub-04	84	F	patient	325478	no	b002	CNV	hg38	SNP_intensity
    sub-05	89+	M	control	623589	yes	b002	SNV/CNV	hg19/hg38	WES/SNP_intensity

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90623baf90f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.