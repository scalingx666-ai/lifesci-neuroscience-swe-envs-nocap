# Issue

**Title:** Partial directed coherence

## Description

Changes:
- Improved functions for calculating post-hoc spectral properties.
- Added functions to calculate partial coherence and partial directed coherence.
- Added definitions to docstrings.
- **Benchmarked multitaper calculations against the Matlab HMM-MAR toolbox.**

Generated multitaper spectra using the HMM-MAR with:
```
load('data/X.mat')  % contains fields for x and a

options = struct('Fs',250);
options.fpass = [1 45];
options.tapers = [4 7];
options.p = 0;
options.win = 500;
options.to_do = [1 1]; % do coh and pdc
options.order = 0;

mt = hmmspectramt(x,[size(a,1)],a,options);
save('data/mt.mat', 'mt')
```

Tested against osl-dynamics with:
```
import numpy as np
from scipy import io
from osl_dynamics.analysis import spectral
from osl_dynamics.utils import plotting

state = 1
chan1 = 11
chan2 = 20

mat = io.loadmat("data/mt.mat", simplify_cells=True)
mat = mat["mt"]["state"][state]
mat_f = mat["f"]
mat_cpsd = np.moveaxis(mat["psd"], 0, -1)
mat_coh = np.moveaxis(mat["coh"], 0, -1)
mat_pcoh = np.moveaxis(mat["pcoh"], 0, -1)
mat_pdc = np.moveaxis(mat["pdc"], 0, -1)

x = np.load("data/x.npy")
a = np.load("data/a.npy")

f, cpsd = spectral.multitaper_spectra(
    data=x,
    alpha=a,
    sampling_frequency=250,
    frequency_range=[1, 45],
    calc_cpsd=True,
)
cpsd = cpsd[state]

# Note, we use a different normalisation compared to HMM-MAR
# which is why we have the factor of 2 difference
plotting.plot_line(
    [f, mat_f, f, mat_f],
    [cpsd[chan1, chan2].real, 2 * mat_cpsd[chan1, chan2].real,
     cpsd[chan1, chan2].imag, 2 * mat_cpsd[chan1, chan2].imag],
    labels=["Python - Real", "Matlab - Real", "Python - Imag", "Matlab - Imag"],
    x_label="Frequency (Hz)",
    y_label="PSD (a.u.)",
    filename="plots/psd.png",
)

coh = spectral.coherence_spectra(cpsd)

plotting.plot_line(
    [f, mat_f],
    [coh[chan1, chan2], mat_coh[chan1, chan2]],
    labels=["Python", "Matlab"],
    x_label="Frequency (Hz)",
    y_label="Coherence",
    filename="plots/coh.png",
)

pcoh = spectral.partial_coherence_spectra(cpsd)

plotting.plot_line(
    [f, mat_f],
    [pcoh[chan1, chan2], mat_pcoh[chan1, chan2]],
    labels=["Python", "Matlab"],
    x_label="Frequency (Hz)",
    y_label="Coherence",
    filename="plots/pcoh.png",
) 

pdc = spectral.partial_directed_coherence_spectra(
    f=f,
    cpsd=cpsd,
    sampling_frequency=250,
)

plotting.plot_line(
    [f, mat_f],
    [pdc[chan1, chan2], mat_pdc[chan1, chan2]],
    labels=["Python", "Matlab"],
    x_label="Frequency (Hz)",
    y_label="PDC",
    filename="plots/pdc.png",
)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `680cad3f8842`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.