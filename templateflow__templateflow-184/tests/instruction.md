# Issue

**Title:** ADD: intake for tpl-Elderly (OSF k9axq)

## Description

**Summary**
This PR submits the tpl-Elderly template for intake. The dataset follows TemplateFlow/BIDS naming and is distributed under CC-BY-4.0.
	•	GitHub (DataLad dataset): https://github.com/KazumichiOta/tpl-Elderly
	•	OSF node: k9axq (public)

**Data included**
	•	tpl-Elderly_res-01_T1w.nii.gz (1 mm isotropic)
	•	tpl-Elderly_res-01_desc-*_mask.nii.gz (amygdala, brainstem, caudate,  hippocampus, pallidum, putamen, thalamus, csf, gm, wm)
	•	template_description.json (res-01: shape [176, 208, 176], zooms [1.0, 1.0, 1.0])

Note: sum_dseg.nii.gz is not distributed (out of scope for this submission).

**Quick start (reproducible retrieval)**
OSF occasionally returns HTTP 410 to API queries; therefore web direct links are registered and we recommend fetching via web.

```bash 
datalad clone https://github.com/KazumichiOta/tpl-Elderly
cd tpl-Elderly
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
git annex get --from=web .
``` 

**(Optionally) if you prefer the OSF special remote**
```bash 
git annex enableremote osf-storage
git annex get --from=osf-storage . || git annex get --from=web .
```

**Links**
- OSF (public): https://osf.io/k9axq/
- Concept DOI (always latest): https://doi.org/10.5281/zenodo.16249928
- Dataset (this version v1.2): https://doi.org/10.5281/zenodo.17292948
- Article: https://doi.org/10.1016/j.neuroimage.2025.121473

**Intake checklist (tpl-Elderly, res-01, 1 mm)**
- [x] OSF public & License CC BY 4.0
- [x] `template_description.json`: Identifier=Elderly / res-01; zooms/shape/origin filled; License=CC-BY-4.0
- [x] ReferencesAndLinks: Article DOI / Concept DOI / v1.2 DOI
- [x] NIfTI: 176×208×176 / 1.0 mm; qform/sform = Scanner Anat; masks uint8 (0/1); no subcortical overlaps
- [x] Packaging only; **no scientific content change**

**License**
CC-BY-4.0. Please acknowledge the authors as listed in the intake TOML.

**Provenance**
“NIfTI headers of tpl-Elderly_res-01_T1w.nii.gz report 176×208×176 @ 1 mm, matching template_description.json (res-01).”

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17f2846cb557`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.