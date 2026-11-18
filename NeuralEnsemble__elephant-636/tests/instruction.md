# Issue

**Title:** [Fix] CuBIC, SPADE with scipy 1.14.0, deprecated `.A` attribute in `scipy.sparse` matrices`

## Description

## Description
This PR addresses the issue arising from the deprecation of the `.A` attribute in `scipy.sparse` matrices starting with `scipy==1.14.0` . 

The `.A` attribute was  used to convert sparse matrices to dense `ndarray` format. 

However, this attribute was deprecated and has been removed in favor of the more explicit `.toarray()` method.

This deprecation was introduced with `scipy==1.11.0`. The PR removing it is #20499, see: <

See also release notes: <https://docs.scipy.org/doc/scipy/release/1.14.0-notes.html#expired-deprecations>

## Changes
### SPADE
Replaced the use of .A with .toarray() in the `_build_context` function in the  `spade` module.
This change preserves the functionality of converting a `coo_matrix` to a dense format without breaking the code due to the deprecated attribute.

This was done following the official recommendation, see property docstring:

```
    @property
    def A(self) -> np.ndarray:
        """DEPRECATED: Return a dense array.
        .. deprecated:: 1.11.0
            `.A` is deprecated and will be removed in v1.14.0.
            Use `.toarray()` instead.
        """
        if isinstance(self, sparray):
            message = ("`.A` is deprecated and will be removed in v1.14.0. "
                       "Use `.toarray()` instead.")
            warn(VisibleDeprecationWarning(message), stacklevel=2)
        return self.toarray()
```

### Cubic
Ensure numeric precision of data ndarray is float64.

On Windows test fail with:
```bash
__________________________ CubicTestCase.test_cubic ___________________________

self = <elephant.test.test_cubic.CubicTestCase testMethod=test_cubic>

    def test_cubic(self):
    
        # Computing the output of CuBIC for the test data AnalogSignal
        xi, p_vals, k, test_aborted = cubic.cubic(
            self.data_signal, alpha=self.alpha)
    
        # Check the types of the outputs
        self.assertIsInstance(xi, int)
        self.assertIsInstance(p_vals, list)
        self.assertIsInstance(k, list)
    
        # Check that the number of tests is the output order of correlation
        self.assertEqual(xi, len(p_vals))
    
        # Check that all the first  xi-1 tests have not passed the
        # significance level alpha
        for p in p_vals[:-1]:
            self.assertGreater(self.alpha, p)
    
        # Check that the last p-value has passed the significance level
        self.assertGreater(p_vals[-1], self.alpha)
    
        # Check that the number of cumulant of the output is 3
        self.assertEqual(3, len(k))
    
        # Check the analytical constrain of the cumulants for which K_1<K_2
        self.assertGreater(k[1], k[0])
    
        # Check the computed order of correlation is the expected
        # from the test data
        self.assertEqual(xi, self.xi)
    
        # Computing the output of CuBIC for the test data Array
>       xi, p_vals, k, test_aborted = cubic.cubic(
            self.data_array, alpha=self.alpha)

elephant\test\test_cubic.py:74: 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
elephant\cubic.py:142: in cubic
    pval = _H03xi(kappa, xi, L)
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

kappa = [0.03, -0.1303980335803358, 3.000090626933894], xi = 1, L = 100000

    def _H03xi(kappa, xi, L):
        """
        Computes the p_value for testing  the :math:`H_0: k_3(data)<=k^*_{3,\\xi}`
        hypothesis of CuBIC in the stationary rate version
    
        Parameters
        -----
        kappa : list
            The first three cumulants of the populaton of spike trains
        xi : int
            The the maximum order of correlation :math:`\\xi` supposed in the
            hypothesis for which is computed the p value of :math:`H_0`
        L : float
            The length of the orginal population histogram on which is performed
            the CuBIC analysis
    
        Returns
        -----
        p : float
            The p-value of the hypothesis tests
        """
    
        # Check the order condition of the cumulants necessary to perform CuBIC
        if kappa[1] < kappa[0]:
>           raise ValueError(f"The null hypothesis H_0 cannot be tested: the "
                             f"population count histogram variance ({kappa[1]}) "
                             f"is less than the mean ({kappa[0]}). This can "
                             f"happen when the spike train population is not "
                             f"large enough or the bin size is small.")
E           ValueError: The null hypothesis H_0 cannot be tested: the population count histogram variance (-0.1303980335803358) is less than the mean (0.03). This can happen when the spike train population is not large enough or the bin size is small.
```

This seems similar to:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdd98eefe997`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.