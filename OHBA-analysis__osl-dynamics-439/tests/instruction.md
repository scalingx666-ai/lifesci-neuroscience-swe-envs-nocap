# Issue

**Title:** Add N-FINDR initialization of the mode covariances for DyNeMo and DIVE

## Description

Adds `init_method="nfindr"`, which sets the starting mode covariances from the data instead of starting every mode from (almost) the same covariance. The method was developed by @weiym97.

## The problem

With the default start every mode covariance is $D_k = \mathrm{diag}(1 + \epsilon_k)$ with $\epsilon_k$ small noise, so all modes start almost identical. During KL annealing the modes compete to explain the data, like a soft clustering that starts from identical centres. The strong modes are claimed first, and the fitted modes that are left over end up splitting a strong mode, merging two weak ones, or dying ($\alpha_k \approx 0$, so the covariance gets almost no gradient and never recovers). Starting from the true covariances gives a lower free energy, so this is a failure of the optimisation, not something the data can't support. More initialisations don't fix it: after 2 epochs the lowest loss tends to come from starts where a few modes have already taken over.

## The idea: window covariances fill a simplex whose corners are the modes

DyNeMo models $x_t \sim \mathcal{N}(0, C_t)$ with $C_t = \sum_k \alpha_{tk} D_k$, where $\alpha_{tk} \ge 0$ and $\sum_k \alpha_{tk} = 1$. For a window $W$ of $L$ samples with second moment $S_W = \frac{1}{L}\sum_{t \in W} x_t x_t^\top$,

$$\mathbb{E}[S_W \mid \alpha] = \sum_k \bar\alpha_{Wk} D_k, \qquad \bar\alpha_W = \frac{1}{L}\sum_{t \in W} \alpha_t ,$$

and $\bar\alpha_W$ is again non-negative and sums to one. This holds exactly, for any $L$. So the window second moments lie (up to window noise) in a simplex whose vertices are the mode covariances. This is the linear mixing model of hyperspectral unmixing, where each pixel's spectrum is a mixture of the spectra of pure materials, and finding the vertices is a standard problem there (endmember extraction). Finding the corners gives the modes without knowing $\alpha$, including weak modes: a mode that never dominates still pushes the cloud of windows out in its own direction.

## The procedure

`osl_dynamics.models.initialization.nfindr_covariances(time_series, n_modes, window_length=20)`:

1. **Window second moments.** Split the data into non-overlapping windows of $L$ samples and take the upper triangle of each second moment. With $p$ channels that is a vector of length $p(p+1)/2$.
2. **Signal subspace.** The noise-free points lie in a $(K-1)$-dimensional flat region, but the window noise is spread over all $p(p+1)/2$ directions. The top $K-1$ principal components keep the signal and drop most of the noise.
3. **Find the corners (N-FINDR, Winter 1999).** Choose the $K$ windows that span the simplex of largest volume. Start from $K$ random windows and keep replacing a vertex with the window that most increases the volume. The volume is a determinant, which is linear in each row, so every possible replacement of a vertex is scored at once. The best of 10 random starts is kept.
4. **Mixing weights of every window.** Each window is written as a non-negative, sum-to-one mixture of the $K$ vertices (non-negative least squares, with the sum-to-one constraint as a heavily weighted extra row).
5. **Least-squares covariances from all windows.** Fit the covariances to every window given the weights, then floor the eigenvalues at 1% of their mean so each covariance is positive definite. This pools all the windows instead of using the single noisy window N-FINDR picked for each mode.

`nfindr_initialization` (`init_method="nfindr"`) cuts the windows from `n_batches` (default 20) shuffled batches of the training data, after `take`. It then runs the same multi-start as `random_subset_initialization`, with every candidate starting from the N-FINDR covariances and freshly drawn RNN weights. Once a candidate has trained, the covariances are also set as the value `reset()` returns to. Training then continues as usual, and the covariances are still learnt.

## Limitations

- **Modes at the noise level can't be found this way.** A corner is only visible if the cloud of windows reaches out in that mode's direction by more than the window noise.
- **Modes that are never pure give mixed corners.** The starting covariance is then a blend and training has to do the rest.
- **Window length is a trade-off.** Longer windows are less noisy but less pure. 20 samples suits 250 Hz data; slower, fMRI-like data did better with 40–80. Windows are cut within each training sequence, so `window_length` should be at most `sequence_length`.
- **Zero means are assumed.** With `learn_means=True` the means are not initialised and a warning is given.
- **Fixed or given covariances.** If the covariances aren't learnt or `initial_covariances` are passed, this falls back to `random_subset_initialization` with a warning.
- **K above the true number.** The extra vertices come from noise, and DyNeMo can still switch those modes off. With K below the true number the best solution is a set of blends, so the start can be slightly worse than the default.

## Usage

```python
config = Config(..., learn_means=False, learn_covariances=True, init_method="nfindr")
model = Model(config)
model.train(data)  # N-FINDR initialization, then full training

# Or with other settings
model.nfindr_initialization(data, window_length=40, n_init=10, n_epochs=2)
```

## References
- M. E. Winter, "N-FINDR: an algorithm for fast autonomous spectral end-member determination in hyperspectral data", Proc. SPIE 3753 (1999).
- J. M. Bioucas-Dias et al., "Hyperspectral unmixing overview: geometrical, statistical, and sparse regression-based approaches", IEEE J-STARS 5 (2012).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78901d326297`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.