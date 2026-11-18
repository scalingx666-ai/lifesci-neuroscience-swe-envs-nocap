# Build notes - Neuroscience & Neuroimaging

Repo2RLEnv pr_diff (v0.9.6), Harbor-format output. Domain: neuroscience.

## Funnel

| Stage | Count |
|---|---|
| Domain candidates (deduped) | 632 |
| After active+star+noise filter | 305 |
| Final target list (cap unlimited) | 305 |
| Repos with >=1 task | 225 |
| Repos with 0 tasks | 67 |
| Total tasks (unlimited (no per-repo cap)) | 15570 |

## Generation

- Shared task bank: each repo generated once (pr_diff, limit=3,
  max_files_per_pr=15, min_loc_changed=2), 4-way concurrency,
  rate-limit-aware with .done checkpoint resume.
- Per-domain consolidation: rank by reward_calibration.loc_changed desc,
  keep ALL qualifying tasks (no per-repo cap). Zero-yield repos are NOT fabricated.
- Overlap with the 3 published cancer editions is allowed (user decision);
  domains are independent selections, not a partition of one repo set.

## Zero-yield repos (informational, 67)

- tirthajyoti/Data-science-best-resources
- offchan42/machine-learning-curriculum
- YichiZhang98/SAM4MIS
- bitzhangcy/Neural-PDE-Solver
- open-thought/system-2-research
- wyg5208/nct
- zhao62/Deep-Residual-Shrinkage-Networks
- ankitshah009/all-about-ai-residency
- CHAOZHAO-1/DG-PHM
- snailpt/CTNet
- facebookresearch/algonauts-2025
- ucdavis/erplab
- SpikeCalls/FlyDrones
- neurolabusc/AppleSiliconForNeuroimaging
- MouseLand/rastermap
- SuperBruceJia/EEG-Motor-Imagery-Classification-CNNs-TensorFlow
- Frankweb33/flybrain-robot-bridge
- ZitongLu1996/NeuroRA
- spm/spm12
- RonanB96/Low-Cost-EEG-Based-BCI
- arjunmnath/books
- canlab/Neuroimaging_Pattern_Masks
- ozcelikfu/brain-diffuser
- NSBLab/BrainEigenmodes
- netstim/leaddbs
- gongzix/NeuroClips
- MIC-DKFZ/MITK-Diffusion
- paulcbogdan/NiChord
- alanqrwang/keymorph
- wzhlearning/fNIRS-Transformer
- LieberInstitute/HumanPilot
- amrzhd/MRISkullStripping
- ColeLab/ColeAnticevicNetPartition
- sidchop/RepoNeuroVis
- syf0122/brain_state_pred
- MICA-MNI/micaopen
- RealityBending/Pyllusion
- volBrain-net/AssemblyNet
- dheerajnbhat/Brain-Tumor-Detection
- razvanmarinescu/brain-coloring
- seelikat/neuro-visual-reconstruction-dataset-index
- braph-software/BRAPH-2
- MKnierim/openbci-ceegrids
- DanceSkyCode/Bratrix
- shyammarjit/EEG-Emotion-Recognition
- snastase/narratives
- courtois-neuromod/algonauts_2025.competitors
- microsoft/automated-brain-explanations
- jyejay/3D_ConvNeXt_for_fMRI
- HennyJie/IBGNN
- wwu-mmll/deepmriprep
- USC-InfoLab/NeuroGNN
- lukassnoek/NI-edu
- BIVectors/BRAVEHEART
- NathanKlineInstitute/NATVIEW_EEGFMRI
- GWeindel/hmp
- jtcostello/bcisimulator
- KonstantinosBarmpas/NeuroRVQ
- tjiagoM/spatio-temporal-brain
- rufinv/VAE-GAN-CelebA
- wwu-mmll/deepbet
- lebowang-ucr/cGCN_fMRI
- rmldj/hcp-utils
- cnuzh/LG-GNN
- shi3z/auto-excitement
- facebookresearch/dynadiff
- OishiLab/OpenMAP-T1

## Caveats

- Static validation only; real grading needs an LLM judge key + Docker.
- inline_dockerfile mode skips image build (no Docker daemon needed to publish).
- Provider secrets in upstream diffs were redacted before public release.
