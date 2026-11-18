# Issue

**Title:** [ENH] - Add getter functions for data & model components

## Description

This PR is an exploration related to our broader topic / discussion regarding the 'spacing' of the data, relating to whether we want, for example, parameter values in log or linear spaced values, and whether we want to have a compositional model which adds the components in log or linear space. This PR deals with the isolated data & model components. 

The `FOOOF` object stores the data, resulting model, as well as internal attributes of isolated data & model components. 

Specifically:
- "data" attributes:
    - 'full' data: `FOOOF.power_spectrum`
    - 'aperiodic only' data: `FOOOF._spectrum_peak_rm`
    - 'periodic only' data: `FOOOF._spectrum_flat`
- "model" attributes:
    - 'full' model: `FOOOF.fooofed_spectrum_`
    - 'aperiodic only' data: `FOOOF._ap_fit`
    - 'periodic only' data: `FOOOF._peak_fit`

These are all _available_, but some are indicated to be private, such that there is not a "proper" way to access them. More importantly, these components, which are computed and stored as an additive model in log space are not necessarily what one wants if one wants an additive _linear_ model. Without this update, getting component values in linear space, _that follow a linearly additive model_ is otherwise not particularly obvious - and yet when one does an analysis such as "computing aperiodic removed power", using the linear representation is arguably the way to go. 

This adds `getter` functions to access data & model components, officially supporting access to all of these attributes. Additionally, in getting these components, it allows for specifying a 'space' argument of 'log' or 'linear'. If set to 'log', you get the same as you would accessing the attributes directly (values in log10 space, and following the "additive in log space" combination). If set to 'linear', you get recomputed components in linear space. Notably, this is not just the "unlogged" component, but rather the transformed component such that the values are in linear space, and it follows the "additive in linear space" model - so linear AP + PE = linear power_spectrum (or model). For some, perhaps many use cases, when accessing these components, this linearly additive model is arguably what one wants. 

### Notes

This PR is _only_ about data & model components, and does not handle computing different spacings / additive models in parameter values - an update which is a bigger change, and is in progress for 2.0. Since this update is not a breaking change, it's currently targeted for 1.1 (might as well). 

### Reviewing

Note - at this stage I want to check in on this idea (review comments on the idea rather than details of the implementation are welcome). There are some details to double check if we like this idea, including things like naming (I'm not totally sold on the method / argument names - thoughts welcome).

### Example

The notable example(s) from this update are really about getting the linear values. 

Getting linear data components:
```
data_full_lin = fm.get_data('full', 'linear')
data_ap_lin = fm.get_data('aperiodic', 'linear')
data_pe_lin = fm.get_data('peak', 'linear')
plot_spectra(fm.freqs, [unlog(fm.power_spectrum), data_full_lin, data_ap_lin + data_pe_lin], 
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))
```
This is gives data components in linear-spaced values - that also add up in linear space, as seen from the output plot:

<img width="591" alt="Screen Shot 2023-07-26 at 1 14 53 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/d394c337-9e24-48d9-a2eb-fa6def86f026">


We can do the same for model components:
```
model_full_lin = fm.get_model('full', 'linear')
model_ap_lin = fm.get_model('aperiodic', 'linear')
model_pe_lin = fm.get_model('peak', 'linear')
plot_spectra(fm.freqs, [powers, model_full_lin, model_ap_lin + model_pe_lin], 
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))
```
<img width="619" alt="Screen Shot 2023-07-26 at 1 14 59 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/e27cedeb-d88b-4481-861f-f2e68825f7c4">

#### Full code for exploring examples

```
from fooof import FOOOF
from fooof.core.utils import unlog
from fooof.plts import plot_spectra
from fooof.sim import gen_power_spectrum
from fooof.utils.download import load_fooof_data

# Load example spectra - using real data here
freqs = load_fooof_data('freqs.npy', folder='data')
powers = load_fooof_data('spectrum.npy', folder='data')

fm = FOOOF(verbose=False)
fm.fit(freqs, powers)

# Data - log
data_full_log = fm.get_data_component('full', 'log')
data_ap_log = fm.get_data_component('aperiodic', 'log')
data_pe_log = fm.get_data_component('peak', 'log')
plot_spectra(fm.freqs, [fm.power_spectrum, data_full_log, data_ap_log + data_pe_log], 
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))

# Model - log
model_full_log = fm.get_model_component('full', 'log')
model_ap_log = fm.get_model_component('aperiodic', 'log')
model_pe_log = fm.get_model_component('peak', 'log')
plot_spectra(fm.freqs, [fm.power_spectrum, model_full_log, model_ap_log + model_pe_log],
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))

# Data - linear
data_full_lin = fm.get_data_component('full', 'linear')
data_ap_lin = fm.get_data_component('aperiodic', 'linear')
data_pe_lin = fm.get_data_component('peak', 'linear')
plot_spectra(fm.freqs, [unlog(fm.power_spectrum), data_full_lin, data_ap_lin + data_pe_lin], 
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))

# Model - linear
model_full_lin = fm.get_model_component('full', 'linear')
model_ap_lin = fm.get_model_component('aperiodic', 'linear')
model_pe_lin = fm.get_model_component('peak', 'linear')
plot_spectra(fm.freqs, [powers, model_full_lin, model_ap_lin + model_pe_lin], 
             linestyle=['-', 'dotted', 'dashed'], colors=['black', 'red', 'green'],
             alpha=[0.3, 0.75, 0.75], figsize=(6, 5))
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `312fed76a139`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.