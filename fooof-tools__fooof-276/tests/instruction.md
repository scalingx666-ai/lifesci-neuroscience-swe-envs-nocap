# Issue

**Title:** [ENH] - Update options to plot a broader frequency range

## Description

Responds to #245, and an alternative to #246

This PR adds functionality for making it easier to plot a model over a broader frequency range (across a frequency range beyond the fit range). It does so by making it easier to pass in frequency and power vectors to plot with a model. This strategy means that the model object does not store the broader range, but during exploration phases this can be visualized. 

Notes:
- This strategy generally means the broader range spectrum needs to be "around" (in memory) to be passed in explicitly. 
    - A limitation of this is that if a fooof object is reloaded, the broader range spectrum while not de facto be available for this.
    - The upshot of this is trying to find a balance between supporting evaluation without increasing the amount of data stored in the object and/or saved out, which could otherwise lead to managing a lot of extra data that is rarely used.
- The above points are in relation to the alternate strategy explored in #246 (I commented in that PR why I personally do not prefer that option). 
- Below is a fairly comprehensive exploration of this functionality, with the idea that this can / should be turned into a docsite example to illustrate the underlying points here, and show the functionality

For reviewing, @ryanhammonds and @voytek (if you have time) - before a code deep-dive, I would appreciate your thoughts on strategy here (comparing this to #246). If we like this approach then code should be reviewed as normal - I think it should be pretty solid, although there could be some tweaks on how to manage the API for `FOOOF.report` if y'all have any thoughts on that. 

## Demonstration

# Code for running following examples:
```
from fooof import FOOOF
from fooof.sim import gen_power_spectrum
freqs, powers = gen_power_spectrum([1, 150], [1, 100, 1], [[10, 0.15, 0.5], [25, 0.1, 2.5]])
```

### Using `plot_fm` to plot models on top of broader range power spectra

```
# With this PR, can do the following to plot the model on top of a broader frequency range
fm.plot(freqs=freqs, power_spectrum=powers, plt_log=True, freq_range=[3, 75])
```
Which gives the following output:
<img width="565" alt="Screen Shot 2023-07-05 at 10 57 44 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/428b86b1-d4ed-4298-96e1-e6e36f28a13a">


### Exploring frequency ranges using `fm.report`

```
fm = FOOOF()
fm.report(freqs, powers, freq_range=[3, 30], plt_log=True, plot_full_range=True)
```

This gives the following output:
<img width="500" alt="Screen Shot 2023-07-05 at 11 01 00 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/540b92d2-6724-4a85-baa6-ead0a70410d5">

In addition, these reports can be saved out.

```
# Save out model report, adding in a broader range frequency spectrum
fm.save_report('test_fm.pdf', freqs=freqs, power_spectrum=powers, plt_log=True, freq_range=[3, 75])
```

### Showing how this works with `FOOOFGroup`

This process can also be used from a FOOOFGroup object, to examine individual model fits:

```
from fooof.sim import gen_group_power_spectra
from fooof import FOOOFGroup

freqs, spectra = gen_group_power_spectra(10, [1, 150], [1, 100, 1], [[10, 0.15, 0.5], [25, 0.1, 2.5]])
fg = FOOOFGroup()
fg.fit(freqs, spectra, [3, 30])

# Then, plot the model over the broad range (can also make report / save, etc)
fg.get_fooof(ind).plot(freqs=freqs, power_spectrum=spectra[ind, :])
```
Output:
<img width="495" alt="Screen Shot 2023-07-05 at 11 15 47 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/f3dc9126-05e7-4733-b2ea-36d72eb13d99">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94fa407a9cb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.