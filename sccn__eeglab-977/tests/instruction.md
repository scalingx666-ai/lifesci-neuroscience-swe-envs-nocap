# Issue

**Title:** fix: accumulate ANOVA sums of squares in double

## Description

<!-- CURSOR_AGENT_PR_BODY_BEGIN -->
Double inputs to the ANOVA helpers were accumulated in single. Sums of squares are cancellations (ssA = expA - expT, ssAS = expAS - expA - expS + expT, and the same pattern for the other terms), so single precision, about 7 digits, drops most of the shared magnitude. F was off by about 0.6% relative. p = 1-fcdf(F) saturated to 0 below about 6e-8 because that subtraction runs on a single F (eps(single(1))/2 is about 5.96e-8).

Accumulators are explicit double. These files already pass a class to zeros, and nothing nearby uses class(data) or 'like'. Matching the input class would leave single cells in single. With double accumulators, double inputs stay double through the sums, so F and p are double.

Single inputs were still accumulated in single. sum of a single array is single, and a single slice added to a double accumulator is evaluated in single before the result is stored. anova2_cell did VE = VE + sum(single.^2), which replaces VE with a single, so F came back single. anova2rm_cell added the other factor into AS and BS in single, and sq = sq + sum(single.^2) made the interaction term single. On single data that was about 2.4e-3 off the double result. anova1rm_cell writes each cell into its own AS slice once, so the later sums were already double; it now casts the same way so the square cannot fall back to single.

STUDY measures written by std_erp, std_ersp, and std_spec are single, and std_readdata allocates its gathered arrays single, so the main EEGLAB path is that single-input case. Each cell is passed through double() inside the accumulation loop, then summed and squared. One cell at a time, not a cast of every condition at the statcond entry, so memory only grows for the accumulators. mean in anova2_cell, and the dormant anova1_cell mymean/mystd, also run on double(data). Squares are formed after the cast. sum of an already-squared single array with an outtype of double would still square in single, so the cast has to come first. Outputs are double for single and double inputs.

The resident cost is the double accumulators. Single was there on purpose. anova2rm_cell is aimed at thousands of array ANOVAs (its 200-by-400 example), and statcond already drops back when a resampling buffer does not fit.

anova1rm_cell AS has one element per input sample. It grows from 4 bytes to 8 bytes per sample, an extra half of a double copy of the input. sq is one value per measure. The loop also holds the current cell as double and then releases it.

anova2rm_cell AS has N/b elements, BS has N/a, AB has N/n (N = all samples). For a 2-by-2 design those three arrays are about N elements. A 64 x 100 x 200 map with 20 subjects and 2 x 2 conditions is N = 1.024e8 samples, about 781 MiB already stored as double. The accumulators go from about 410 MiB as single to about 820 MiB as double. One cell of that map is 64 x 100 x 200 x 20, about 195 MiB, held only for the current iteration. The whole input is not duplicated.

anova2_cell stores cell means in m and the within-cell sum of squares in VE. For that same map and a 2-by-2 design, m is about 5.1e6 elements, about 20 MiB as single and about 41 MiB as double. That is not a second copy of the data. anova1_cell's live path is the anova2_cell call at line 76.

Cast sites:

functions/statistics/anova1rm_cell.m:67-68 (accumulators), line 73 (double of the cell; squares at line 84)
functions/statistics/anova2_cell.m:87-88 (accumulators), line 91 (double of the cell), mymean at line 236. Complex magnitudes are abs of that double slice, lines 103-106.
functions/statistics/anova2rm_cell.m:83-86, 99-102, 115-118, 131-134 (accumulators), casts at lines 89, 105, 121, 137
functions/statistics/anova1_cell.m:98, 107, 116 are ones(..., 'double') after the return on line 78, so they do not run today. mymean and mystd at lines 146 and 152 cast the same way if that branch is revived.

Left single on purpose:

statcond.m:261 allocates surrogval as measures by naccu. Parametric ANOVA does not read it. For the map above and naccu = 2000 that buffer is about 9.5 GiB as single. The fast resampling path replaces surrogval with the ANOVA output, so those surrogate F arrays become double (about twice that buffer). The slow path still writes into the single buffer.

concatdata.m allocates its concatenation single. surrogdistrib uses that for permutation and bootstrap, not for the parametric sums of squares.

ttest_cell.m and ttest2_cell.m have no single allocations.

Commented-out allocations in anova2_cell.m (lines 127, 146-147, 167-168, 188-189) were left as written.

A box run of eeglab_tests against this branch failed 20 of 103 statcond tests, exactly ANOVA regression cases 3-6 and 15-30. F moved by up to 5.9e-3 relative and p by up to 0.13 relative. Those fixtures were recorded with single output and need re-recording after merge.

must_close allows an absolute error of (nSum*mag)^2*eps(1). That is one ulp of the square of a sum of nSum samples of size mag, which is the term the bracket formulas cancel. A pure relative check rejects the forceanova paired F (got about 7.26e-7, classical reference about 1.01e-22) even though both are the cancelled residual of a zero effect at offset 1000. For an F of ordinary size the relative tolerance still applies. The script also runs all four anova*_cell functions, and statcond's four ANOVA modes, on single copies of the same designs. Single-input results are compared to classical sums of squares of the quantized values.

Parametric ANOVA p-values were 1-fcdf(F, df1, df2). That subtraction cancels. The tail lives in the last bits of a cdf that has already rounded to 1, so p is exactly 0 once it drops below about an ulp of 1. At F = 117.5 with 7 and 24 degrees of freedom the upper tail is about 5.3e-17 and 1-fcdf returns 0.

fcdf(..., 'upper') is that tail, and current MATLAB documents it. Octave's statistics package added the flag in 1.5.3 (January 2023). Older packages still ship fcdf and error on the extra argument, so the library does not call fcdf. betainc is in base MATLAB and base Octave. The direct call betainc(df2./(df2+df1.*F), df2/2, df1/2) is the incomplete-beta identity for the upper tail. When p is close to 1, x = df2/(df2+df1*F) rounds near 1. At df (1, 200) and F = 2^-38 the rounded x is already about 7.4e-10 off the true argument, and a box run saw absolute errors up to 4.4e-9, against about 2e-16 for 1-fcdf. df1 = 1 is the two-condition ANOVA. When F < df2/df1, which is the same cut as x > 0.5, the complementary form is betainc(df1.*F./(df2+df1.*F), df1/2, df2/2, 'upper'). Octave NEWS-4.4 (2018-04-30) is when betainc gained "upper". EEGLAB tests Octave 6.1, and mytcdf in statcond.m already calls betainc with 'upper' and 'lower', so the complement uses that flag.

betainc errors on NaN and on an argument outside [0, 1]. Cancellation also produces F < 0, and a negative F makes that argument greater than 1. In 3000 near-null designs, 2958 of 6000 calls errored, with a minimum F of -Inf. myfpval returns NaN when F is NaN, returns 1 when F <= 0 (including -Inf), and passes only F > 0 entries to betainc. Inf goes through the direct call, argument 0, so p is 0. The result keeps size(F) and class(F). functions/statistics/private/myfpval.m holds that function. Both statcond.m and teststat.m sit in the parent folder, so both see it and other callers do not. statcond uses it at the one-way line 378 and the two-way lines 411-413. teststat uses it at lines 422-424 (pA, pB, pAB). The t-test lines (340-343, 465, 485) still use 2*tcdf(-abs(T)). The two-condition help sentence says tcdf when the Statistics Toolbox is available, otherwise the built-in mytcdf. The See also line names BETAINC.

The help examples in anova1_cell.m, anova1rm_cell.m, anova2_cell.m, and anova2rm_cell.m still show the direct beta identity. teststat keeps function teststat() with no inputs. rm_anova2 stores pA, pB, and pAB in rows 2-4, column 6. A no-argument teststat still compares pB to paired one-way statcond and pAB to paired two-way statcond. Those three lines call myfpval. The script does not enter rm_anova2 and does not run that battery. It checks the same formula against the embedded table, and requires statcond's parametric p to match the formula, including NaN, F <= 0, Inf, a map with one constant row, and single inputs.

The old parametric guard required fcdf and, when it was missing, switched the whole call to permutation. ANOVA no longer calls fcdf. The two-condition branch already uses tcdf when a Statistics Toolbox license is present and mytcdf otherwise, so a tcdf check that forced permutation would skip that fallback. The guard now checks nothing. The same fcdf check in pop_statparams.m is removed so the study GUI does not force permutation.

The eeglab_tests statcond ANOVA fixtures need re-recording for this as well as for the double accumulation. Cases 3-6 and 15-30 were the 20 of 103 statcond failures against the double-accumulation change (F up to 5.9e-3 relative, p up to 0.13 relative). Tails that used to come back as 0 now come back as the upper tail.

A box run of verify_anova_double at 98a79449 reported 703 PASS and 20 FAIL. Those 20 were ulp limits against fcdf(..., 'upper'), which disagreed with betainc by more than the allowance (about 6.7e-16 against a 5.9e-16 limit at F = 2, df 1 and 10). Against a 60-digit reference the large-F tail had a worst relative error of 6.8e-14 down to p about 1e-69, where 1-fcdf returned 0. At 8be2763e the same script reported 419 PASS and ALL PASS. At 489f23ca it reported 425 PASS. Constant data and zero-variance rows ran in 1-way, 2-way, repeated and unpaired designs, in single and double. Without the Statistics Toolbox every ANOVA ran and the p-values matched (difference 0).

The script compares the formula to a table of tails from mpmath at 80 decimal places. The reference is the direct lower tail, betainc(x, d2/2, d1/2) with x = d2/(d2+d1*F). The mpmath upper form was unreliable at 50 digits, so the table does not use it. Each p is the nearest double (17 significant digits). The Python that wrote the table is below. It is not in the .m file. A fifth column is kappa = |x*I'(x)/I(x)| on the branch myfpval takes. When F >= d2/d1 the branch is x = d2/(d2+d1*F) with parameters (d2/2, d1/2). Otherwise it is x = d1*F/(d2+d1*F) with parameters (d1/2, d2/2) and betainc's upper tail. The relative tolerance is the sum of two terms. Rounding x contributes 3*kappa*(eps(1)/2). betainc's own error is checked as C*max(df1, df2)/2*(eps(1)/2). MathWorks publishes no accuracy bound for betainc. C = 64 is a measured allowance for MATLAB R2025b, not a published bound. The measured maximum of that coefficient is 41. Four deep-tail rows sit on the sweep peaks: F = 3376199.4411113332 at df (1, 10), F = 54005932.785423741 at df (2, 10) and at df (10, 50), and F = 15391.855229902118 at df (170, 170). The (10, 50) row is where the measured coefficient reaches 41. With u = eps(1)/2 the worst error/limit ratio on the MATLAB R2025b sweep is 0.66. At F = 2^-38 and df (1, 200) the direct betainc of the rounded argument misses by about 7.4e-10, so that row also requires the direct call to miss by more than 1e-10 while the complement passes. statcond's parametric p must match the formula exactly (isequaln), including the constant row in a map, F <= 0 (p = 1), Inf (p = 0), NaN, and single inputs (double p). teststat's no-argument battery is not run.

No MATLAB in this environment, so this script was not executed. Save it as verify_anova_double.m in the EEGLAB root (the folder that contains functions/) and, from that directory, run matlab -batch "verify_anova_double". It needs the Statistics Toolbox (fcdf) for the older F-agreement checks. betainc itself is base MATLAB. Head 489f23ca30c743389930af7458d9d8f4d4041ed1.

```matlab
function verify_anova_double
% Double-precision check for anova1_cell, anova1rm_cell, anova2_cell,
% anova2rm_cell, and statcond parametric ANOVA.
% Double and single inputs must return double F and p, matching classical
% sums of squares of those same values (single inputs are quantized first).
% The F tail matches the embedded mpmath table. NaN F, F <= 0, Inf, a map
% with one constant row, and single inputs are checked through statcond.

rootDir = pwd;
anovaFile = fullfile(rootDir, 'functions', 'statistics', 'anova1_cell.m');
if exist(anovaFile, 'file') ~= 2
    rootDir = fileparts(mfilename('fullpath'));
    anovaFile = fullfile(rootDir, 'functions', 'statistics', 'anova1_cell.m');
end
if exist(anovaFile, 'file') ~= 2
    error('Run this from the EEGLAB root (the folder that contains functions/)');
end
addpath(fullfile(rootDir, 'functions', 'statistics'));
addpath(fullfile(rootDir, 'functions', 'guifunc'));
if exist('fcdf', 'file') ~= 2
    error('fcdf is required (Statistics Toolbox)');
end

tol = 1e-7;
nFail = 0;
offset = 1000;
n = 40;
t = 1:n;
s = linspace(-1, 1, n);
th = 2*pi*t/n;
resid = {0.2*sin(th), 0.2*cos(th), []};
resid{3} = -(resid{1} + resid{2});
effect = [0 0 0.31];
rm = cell(1, 3);
for c = 1:3
    rm{c} = offset + s + effect(c) + resid{c};
end
shifts = [0 0 1];
ow = cell(1, 3);
for c = 1:3
    ow{c} = offset + sin(2*pi*t/n*c) + shifts(c);
end
rng(20261016);
n2 = 24;
tw = cell(2, 3);
for i = 1:2
    for j = 1:3
        tw{i,j} = offset + randn(1, n2) + 0.4*(i-1) + 0.3*(j-1) + 0.15*(i-1)*(j-1);
    end
end
owMap = cell(1, 3);
for c = 1:3
    owMap{c} = [ow{c}; offset + cos(2*pi*t/n*c) + shifts(c)];
end
twMap = cell(2, 3);
rng(7);
for i = 1:2
    for j = 1:3
        extra = offset + randn(1, n2) + 0.2*(i-1) + 0.1*(j-1);
        twMap{i,j} = [tw{i,j}; extra];
    end
end

[owMag, owN] = cell_scale(ow);
[rmMag, rmN] = cell_scale(rm);
[twMag, twN] = cell_scale(tw);
[ow2Mag, ow2N] = cell_scale(ow(1:2));
[rm2Mag, rm2N] = cell_scale(rm(1:2));
[mapMag, mapN] = cell_scale(owMap);
[twMapMag, twMapN] = cell_scale(twMap);

[F1, df1] = ref_anova1(ow);
[F1got, df1got] = anova1_cell(ow);
nFail = nFail + must_close('anova1_cell F', F1got, F1, tol, owMag, owN);
nFail = nFail + must_equal_df('anova1_cell df', df1got, df1);
p1ref = 1 - fcdf(F1, df1(1), df1(2));
nFail = nFail + must_tail('anova1_cell p', 1-fcdf(F1got, df1got(1), df1got(2)), p1ref, owMag, owN);

[Fmap, dfmap] = anova1_cell(owMap);
row2 = cell(1, 3);
for c = 1:3
    row2{c} = owMap{c}(2, :);
end
[Frow2, dfrow2] = ref_anova1(row2);
nFail = nFail + must_close('anova1_cell map F', Fmap(:), [F1; Frow2], tol, mapMag, mapN);
nFail = nFail + must_equal_df('anova1_cell map df', dfmap, df1);
nFail = nFail + must_equal_df('anova1_cell map df vs row2', dfrow2, df1);

[Frm, dfrm] = ref_anova1rm(rm);
[FrmGot, dfrmGot] = anova1rm_cell(rm);
nFail = nFail + must_close('anova1rm_cell F', FrmGot, Frm, tol, rmMag, rmN);
nFail = nFail + must_equal_df('anova1rm_cell df', dfrmGot, dfrm);
prmRef = 1 - fcdf(Frm, dfrm(1), dfrm(2));
nFail = nFail + must_tail('anova1rm_cell p', 1-fcdf(FrmGot, dfrmGot(1), dfrmGot(2)), prmRef, rmMag, rmN);

rmCol = cell(size(rm));
for c = 1:numel(rm)
    rmCol{c} = rm{c}(:);
end
[FrmCol, dfrmCol] = anova1rm_cell(rmCol);
nFail = nFail + must_close('anova1rm_cell column F', FrmCol, Frm, tol, rmMag, rmN);
nFail = nFail + must_equal_df('anova1rm_cell column df', dfrmCol, dfrm);

[FC, FR, FI, dfc, dfr, dfi] = anova2_cell(tw);
[FCref, FRref, FIref, dfcRef, dfrRef, dfiRef] = ref_anova2(tw);
nFail = nFail + must_close('anova2_cell FC', FC, FCref, tol, twMag, twN);
nFail = nFail + must_close('anova2_cell FR', FR, FRref, tol, twMag, twN);
nFail = nFail + must_close('anova2_cell FI', FI, FIref, tol, twMag, twN);
nFail = nFail + must_equal_df('anova2_cell dfC', dfc, dfcRef);
nFail = nFail + must_equal_df('anova2_cell dfR', dfr, dfrRef);
nFail = nFail + must_equal_df('anova2_cell dfI', dfi, dfiRef);
nFail = nFail + must_close('anova2_cell pC', 1-fcdf(FC, dfc(1), dfc(2)), 1-fcdf(FCref, dfcRef(1), dfcRef(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('anova2_cell pR', 1-fcdf(FR, dfr(1), dfr(2)), 1-fcdf(FRref, dfrRef(1), dfrRef(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('anova2_cell pI', 1-fcdf(FI, dfi(1), dfi(2)), 1-fcdf(FIref, dfiRef(1), dfiRef(2)), 1e-5, twMag, twN);

[fA, fB, fAB, dfA, dfB, dfAB] = anova2rm_cell(tw);
[fAref, fBref, fABref, dfAref, dfBref, dfABref] = ref_anova2rm(tw);
nFail = nFail + must_close('anova2rm_cell fA', fA, fAref, tol, twMag, twN);
nFail = nFail + must_close('anova2rm_cell fB', fB, fBref, tol, twMag, twN);
nFail = nFail + must_close('anova2rm_cell fAB', fAB, fABref, tol, twMag, twN);
nFail = nFail + must_equal_df('anova2rm_cell dfA', dfA, dfAref);
nFail = nFail + must_equal_df('anova2rm_cell dfB', dfB, dfBref);
nFail = nFail + must_equal_df('anova2rm_cell dfAB', dfAB, dfABref);
nFail = nFail + must_close('anova2rm_cell pA', 1-fcdf(fA, dfA(1), dfA(2)), 1-fcdf(fAref, dfAref(1), dfAref(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('anova2rm_cell pB', 1-fcdf(fB, dfB(1), dfB(2)), 1-fcdf(fBref, dfBref(1), dfBref(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('anova2rm_cell pAB', 1-fcdf(fAB, dfAB(1), dfAB(2)), 1-fcdf(fABref, dfABref(1), dfABref(2)), 1e-5, twMag, twN);

[fAmap, fBmap, fABmap, dfAmap, dfBmap, dfABmap] = anova2rm_cell(twMap);
nFail = nFail + must_close('anova2rm_cell map fA', fAmap(1), fA, tol, twMapMag, twMapN);
nFail = nFail + must_close('anova2rm_cell map fB', fBmap(1), fB, tol, twMapMag, twMapN);
nFail = nFail + must_close('anova2rm_cell map fAB', fABmap(1), fAB, tol, twMapMag, twMapN);
nFail = nFail + must_double('anova2rm_cell map fA', fAmap);
nFail = nFail + must_equal_df('anova2rm_cell map dfA', dfAmap, dfA);

tw4 = cell(2, 2);
for i = 1:2
    for j = 1:2
        tw4{i,j} = randn(2, 2, 2, 8);
    end
end
[fA4, fB4, fAB4] = anova2rm_cell(tw4);
[FC4, FR4, FI4] = anova2_cell(tw4);
nFail = nFail + must_double('anova2rm_cell nd4 fA', fA4);
nFail = nFail + must_double('anova2rm_cell nd4 fB', fB4);
nFail = nFail + must_double('anova2rm_cell nd4 fAB', fAB4);
nFail = nFail + must_double('anova2_cell nd4 FC', FC4);
nFail = nFail + must_double('anova2_cell nd4 FR', FR4);
nFail = nFail + must_double('anova2_cell nd4 FI', FI4);
if ~isequal(size(fA4), [2 2 2])
    fprintf('FAIL anova2rm_cell nd4 size %s\n', mat2str(size(fA4)));
    nFail = nFail + 1;
end

[Fs, dfs, ps] = statcond(ow, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nFail = nFail + must_close('statcond 1-way unpaired F', Fs, F1, tol, owMag, owN);
nFail = nFail + must_equal_df('statcond 1-way unpaired df', dfs, df1);
nFail = nFail + must_tail('statcond 1-way unpaired p', ps, p1ref, owMag, owN);

[Fs, dfs, ps] = statcond(rm, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nFail = nFail + must_close('statcond 1-way paired F', Fs, Frm, tol, rmMag, rmN);
nFail = nFail + must_equal_df('statcond 1-way paired df', dfs, dfrm);
nFail = nFail + must_tail('statcond 1-way paired p', ps, prmRef, rmMag, rmN);

[Fs, dfs, ps] = statcond(tw, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nFail = nFail + must_close('statcond 2-way unpaired FC', Fs{1}, FCref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way unpaired FR', Fs{2}, FRref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way unpaired FI', Fs{3}, FIref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way unpaired pC', ps{1}, 1-fcdf(FCref, dfcRef(1), dfcRef(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('statcond 2-way unpaired pR', ps{2}, 1-fcdf(FRref, dfrRef(1), dfrRef(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('statcond 2-way unpaired pI', ps{3}, 1-fcdf(FIref, dfiRef(1), dfiRef(2)), 1e-5, twMag, twN);
nFail = nFail + must_double('statcond 2-way unpaired pC', ps{1});

[Fs, dfs, ps] = statcond(tw, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nFail = nFail + must_close('statcond 2-way paired fA', Fs{1}, fAref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way paired fB', Fs{2}, fBref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way paired fAB', Fs{3}, fABref, tol, twMag, twN);
nFail = nFail + must_close('statcond 2-way paired pA', ps{1}, 1-fcdf(fAref, dfAref(1), dfAref(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('statcond 2-way paired pB', ps{2}, 1-fcdf(fBref, dfBref(1), dfBref(2)), 1e-5, twMag, twN);
nFail = nFail + must_close('statcond 2-way paired pAB', ps{3}, 1-fcdf(fABref, dfABref(1), dfABref(2)), 1e-5, twMag, twN);

[Fs, dfs, ps] = statcond(owMap, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nFail = nFail + must_close('statcond map F', Fs(:), [F1; Frow2], tol, mapMag, mapN);
nFail = nFail + must_double('statcond map p', ps);

[Ff, dff, pf] = statcond(ow(1:2), 'method', 'param', 'paired', 'off', 'forceanova', 'on', 'verbose', 'off');
[Ftwo, dftwo] = ref_anova1(ow(1:2));
nFail = nFail + must_close('statcond forceanova unpaired F', Ff, Ftwo, tol, ow2Mag, ow2N);
nFail = nFail + must_equal_df('statcond forceanova unpaired df', dff, dftwo);
nFail = nFail + must_close('statcond forceanova unpaired p', pf, 1-fcdf(Ftwo, dftwo(1), dftwo(2)), 1e-5, ow2Mag, ow2N);

[Ff, dff, pf] = statcond(rm(1:2), 'method', 'param', 'paired', 'on', 'forceanova', 'on', 'verbose', 'off');
[Ftwo, dftwo] = ref_anova1rm(rm(1:2));
nFail = nFail + must_close('statcond forceanova paired F', Ff, Ftwo, tol, rm2Mag, rm2N);
nFail = nFail + must_equal_df('statcond forceanova paired df', dff, dftwo);
nFail = nFail + must_double('statcond forceanova paired p', pf);

owS = cellsingle(ow);
rmS = cellsingle(rm);
twS = cellsingle(tw);
owMapS = cellsingle(owMap);
rmColS = cellsingle(rmCol);
[owSMag, owSN] = cell_scale(owS);
[rmSMag, rmSN] = cell_scale(rmS);
[twSMag, twSN] = cell_scale(twS);
[mapSMag, mapSN] = cell_scale(owMapS);

[F1sRef, df1sRef] = ref_anova1(owS);
[F1s, df1s] = anova1_cell(owS);
nFail = nFail + must_close('anova1_cell single F', F1s, F1sRef, tol, owSMag, owSN);
nFail = nFail + must_equal_df('anova1_cell single df', df1s, df1sRef);
p1sRef = 1 - fcdf(F1sRef, df1sRef(1), df1sRef(2));
nFail = nFail + must_tail('anova1_cell single p', 1-fcdf(F1s, df1s(1), df1s(2)), p1sRef, owSMag, owSN);

[FmapS, dfmapS] = anova1_cell(owMapS);
nFail = nFail + must_close('anova1_cell single map F', FmapS(:), ref_rows_anova1(owMapS), tol, mapSMag, mapSN);
nFail = nFail + must_equal_df('anova1_cell single map df', dfmapS, df1sRef);

[FrmsRef, dfrmsRef] = ref_anova1rm(rmS);
[Frms, dfrms] = anova1rm_cell(rmS);
nFail = nFail + must_close('anova1rm_cell single F', Frms, FrmsRef, tol, rmSMag, rmSN);
nFail = nFail + must_equal_df('anova1rm_cell single df', dfrms, dfrmsRef);
prmsRef = 1 - fcdf(FrmsRef, dfrmsRef(1), dfrmsRef(2));
nFail = nFail + must_tail('anova1rm_cell single p', 1-fcdf(Frms, dfrms(1), dfrms(2)), prmsRef, rmSMag, rmSN);

[FrmColS, dfrmColS] = anova1rm_cell(rmColS);
nFail = nFail + must_close('anova1rm_cell single column F', FrmColS, FrmsRef, tol, rmSMag, rmSN);
nFail = nFail + must_equal_df('anova1rm_cell single column df', dfrmColS, dfrmsRef);

[FCsRef, FRsRef, FIsRef, dfcsRef, dfrsRef, dfisRef] = ref_anova2(twS);
[FCs, FRs, FIs, dfcs, dfrs, dfis] = anova2_cell(twS);
nFail = nFail + must_close('anova2_cell single FC', FCs, FCsRef, tol, twSMag, twSN);
nFail = nFail + must_close('anova2_cell single FR', FRs, FRsRef, tol, twSMag, twSN);
nFail = nFail + must_close('anova2_cell single FI', FIs, FIsRef, tol, twSMag, twSN);
nFail = nFail + must_equal_df('anova2_cell single dfC', dfcs, dfcsRef);
nFail = nFail + must_equal_df('anova2_cell single dfR', dfrs, dfrsRef);
nFail = nFail + must_equal_df('anova2_cell single dfI', dfis, dfisRef);

[fAsRef, fBsRef, fABsRef, dfAsRef, dfBsRef, dfABsRef] = ref_anova2rm(twS);
[fAs, fBs, fABs, dfAs, dfBs, dfABs] = anova2rm_cell(twS);
nFail = nFail + must_close('anova2rm_cell single fA', fAs, fAsRef, tol, twSMag, twSN);
nFail = nFail + must_close('anova2rm_cell single fB', fBs, fBsRef, tol, twSMag, twSN);
nFail = nFail + must_close('anova2rm_cell single fAB', fABs, fABsRef, tol, twSMag, twSN);
nFail = nFail + must_equal_df('anova2rm_cell single dfA', dfAs, dfAsRef);
nFail = nFail + must_equal_df('anova2rm_cell single dfB', dfBs, dfBsRef);
nFail = nFail + must_equal_df('anova2rm_cell single dfAB', dfABs, dfABsRef);

twMapS = cellsingle(twMap);
[twMapSMag, twMapSN] = cell_scale(twMapS);
[fAmapS, fBmapS, fABmapS] = anova2rm_cell(twMapS);
twS1 = first_measure(twMapS);
[fA1s, fB1s, fAB1s] = ref_anova2rm(twS1);
nFail = nFail + must_close('anova2rm_cell single map fA', fAmapS(1), fA1s, tol, twMapSMag, twMapSN);
nFail = nFail + must_close('anova2rm_cell single map fB', fBmapS(1), fB1s, tol, twMapSMag, twMapSN);
nFail = nFail + must_close('anova2rm_cell single map fAB', fABmapS(1), fAB1s, tol, twMapSMag, twMapSN);

tw4S = cellsingle(tw4);
[fA4s, fB4s, fAB4s] = anova2rm_cell(tw4S);
[FC4s, FR4s, FI4s] = anova2_cell(tw4S);
nFail = nFail + must_double('anova2rm_cell nd4 single fA', fA4s);
nFail = nFail + must_double('anova2rm_cell nd4 single fB', fB4s);
nFail = nFail + must_double('anova2rm_cell nd4 single fAB', fAB4s);
nFail = nFail + must_double('anova2_cell nd4 single FC', FC4s);
nFail = nFail + must_double('anova2_cell nd4 single FR', FR4s);
nFail = nFail + must_double('anova2_cell nd4 single FI', FI4s);

[Fs, dfs, ps] = statcond(owS, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nFail = nFail + must_close('statcond single 1-way unpaired F', Fs, F1sRef, tol, owSMag, owSN);
nFail = nFail + must_tail('statcond single 1-way unpaired p', ps, p1sRef, owSMag, owSN);
nFail = nFail + must_double('statcond single 1-way unpaired p', ps);

[Fs, dfs, ps] = statcond(rmS, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nFail = nFail + must_close('statcond single 1-way paired F', Fs, FrmsRef, tol, rmSMag, rmSN);
nFail = nFail + must_tail('statcond single 1-way paired p', ps, prmsRef, rmSMag, rmSN);

[Fs, dfs, ps] = statcond(twS, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nFail = nFail + must_close('statcond single 2-way unpaired FC', Fs{1}, FCsRef, tol, twSMag, twSN);
nFail = nFail + must_close('statcond single 2-way unpaired FR', Fs{2}, FRsRef, tol, twSMag, twSN);
nFail = nFail + must_close('statcond single 2-way unpaired FI', Fs{3}, FIsRef, tol, twSMag, twSN);
nFail = nFail + must_double('statcond single 2-way unpaired pC', ps{1});

[Fs, dfs, ps] = statcond(twS, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nFail = nFail + must_close('statcond single 2-way paired fA', Fs{1}, fAsRef, tol, twSMag, twSN);
nFail = nFail + must_close('statcond single 2-way paired fB', Fs{2}, fBsRef, tol, twSMag, twSN);
nFail = nFail + must_close('statcond single 2-way paired fAB', Fs{3}, fABsRef, tol, twSMag, twSN);
nFail = nFail + must_double('statcond single 2-way paired pA', ps{1});

nFail = nFail + check_fp_grid();
nFail = nFail + check_fp_case('statcond 1-way unpaired tail', ow, 'off', 'off');
nFail = nFail + check_fp_case('statcond 1-way paired tail', rm, 'on', 'off');
nFail = nFail + check_fp_case('statcond 2-way unpaired tail', tw, 'off', 'off');
nFail = nFail + check_fp_case('statcond 2-way paired tail', tw, 'on', 'off');
nFail = nFail + check_fp_case('statcond forceanova unpaired tail', ow(1:2), 'off', 'on');
nFail = nFail + check_fp_case('statcond forceanova paired tail', rm(1:2), 'on', 'on');
nFail = nFail + check_fp_case('statcond single 1-way unpaired tail', owS, 'off', 'off');
nFail = nFail + check_fp_case('statcond single 1-way paired tail', rmS, 'on', 'off');
nFail = nFail + check_fp_case('statcond single 2-way unpaired tail', twS, 'off', 'off');
nFail = nFail + check_fp_case('statcond single 2-way paired tail', twS, 'on', 'off');
nFail = nFail + check_edges();

if nFail > 0
    error('verify_anova_double failed (%d checks)', nFail);
end
fprintf('ALL PASS\n');
end

function [F, df] = ref_anova1(data)
k = numel(data);
n = numel(data{1});
means = zeros(1, k);
ssw = 0;
for i = 1:k
    x = double(data{i}(:));
    means(i) = mean(x);
    ssw = ssw + sum((x - means(i)).^2);
end
grand = mean(means);
ssb = n * sum((means - grand).^2);
df = [k-1, k*(n-1)];
F = (ssb / df(1)) / (ssw / df(2));
end

function F = ref_rows_anova1(data)
nRow = size(data{1}, 1);
F = zeros(nRow, 1);
for r = 1:nRow
    row = cell(size(data));
    for c = 1:numel(data)
        row{c} = data{c}(r, :);
    end
    F(r) = ref_anova1(row);
end
end

function [F, df] = ref_anova1rm(data)
a = numel(data);
n = numel(data{1});
Y = zeros(n, a);
for i = 1:a
    Y(:, i) = double(data{i}(:));
end
grand = mean(Y(:));
cond = mean(Y, 1);
subj = mean(Y, 2);
ssA = n * sum((cond - grand).^2);
ssAS = sum(sum((Y - subj - cond + grand).^2));
df = [a-1, (a-1)*(n-1)];
F = (ssA / df(1)) / (ssAS / df(2));
end

function [FC, FR, FI, dfc, dfr, dfi] = ref_anova2(data)
a = size(data, 1);
b = size(data, 2);
n = numel(data{1});
M = zeros(a, b);
ve = 0;
for i = 1:a
    for j = 1:b
        x = double(data{i,j}(:));
        M(i,j) = mean(x);
        ve = ve + sum((x - M(i,j)).^2);
    end
end
grand = mean(M(:));
rowm = mean(M, 2);
colm = mean(M, 1);
ssR = b * n * sum((rowm - grand).^2);
ssC = a * n * sum((colm(:) - grand).^2);
ssI = n * sum(sum((M - rowm - colm + grand).^2));
dfr = [a-1, a*b*(n-1)];
dfc = [b-1, a*b*(n-1)];
dfi = [(a-1)*(b-1), a*b*(n-1)];
FR = (ssR / dfr(1)) / (ve / dfr(2));
FC = (ssC / dfc(1)) / (ve / dfc(2));
FI = (ssI / dfi(1)) / (ve / dfi(2));
end

function [fA, fB, fAB, dfA, dfB, dfAB] = ref_anova2rm(data)
a = size(data, 1);
b = size(data, 2);
n = numel(data{1});
Y = zeros(n, a, b);
for i = 1:a
    for j = 1:b
        Y(:, i, j) = double(data{i,j}(:));
    end
end
grand = mean(Y(:));
meanA = reshape(mean(mean(Y, 3), 1), 1, a);
meanB = reshape(mean(mean(Y, 2), 1), 1, b);
meanS = reshape(mean(mean(Y, 3), 2), n, 1);
meanAB = reshape(mean(Y, 1), a, b);
meanAS = reshape(mean(Y, 3), n, a);
meanBS = reshape(mean(Y, 2), n, b);
ssA = b * n * sum((meanA - grand).^2);
ssB = a * n * sum((meanB - grand).^2);
ssAB = n * sum(sum((meanAB - meanA(:) - meanB + grand).^2));
ssAS = b * sum(sum((meanAS - meanS - meanA + grand).^2));
ssBS = a * sum(sum((meanBS - meanS - meanB + grand).^2));
pred = meanAS + reshape(meanBS, n, 1, b) + reshape(meanAB, 1, a, b) ...
     - reshape(meanA, 1, a, 1) - reshape(meanB, 1, 1, b) - meanS + grand;
ssABS = sum((Y(:) - pred(:)).^2);
dfA = [a-1, (a-1)*(n-1)];
dfB = [b-1, (b-1)*(n-1)];
dfAB = [(a-1)*(b-1), (a-1)*(b-1)*(n-1)];
fA = (ssA / dfA(1)) / (ssAS / dfA(2));
fB = (ssB / dfB(1)) / (ssBS / dfB(2));
fAB = (ssAB / dfAB(1)) / (ssABS / dfAB(2));
end

function data1 = first_measure(data)
data1 = cell(size(data));
for k = 1:numel(data)
    data1{k} = data{k}(1, :);
end
end

function out = cellsingle(data)
out = data;
for k = 1:numel(out)
    out{k} = single(data{k});
end
end

function [mag, nSum] = cell_scale(data)
mag = 0;
for k = 1:numel(data)
    xk = double(data{k}(:));
    if ~isempty(xk)
        mag = max(mag, max(abs(xk)));
    end
end
if isvector(data{1})
    nObs = numel(data{1});
else
    nObs = size(data{1}, ndims(data{1}));
end
nSum = nObs * numel(data);
end

function nf = must_close(name, got, ref, tol, mag, nSum)
nf = must_double(name, got);
if nf
    return
end
if ~isequal(numel(got), numel(ref))
    fprintf('FAIL %s numel got %d ref %d\n', name, numel(got), numel(ref));
    nf = 1;
    return
end
% Bracket sums of squares cancel a square of a sum of nSum terms of size
% mag. That square is uncertain by one ulp, (nSum*mag)^2 * eps(double).
absFloor = (double(nSum) * double(mag))^2 * eps(1);
err = abs(double(got(:)) - double(ref(:)));
limit = max(tol * abs(double(ref(:))), absFloor);
if any(err > limit)
    fprintf('FAIL %s max err %.3e limit %.3e floor %.3e (got %.12g ref %.12g)\n', ...
        name, max(err), max(limit), absFloor, got(1), ref(1));
    nf = 1;
else
    fprintf('PASS %s  max err %.3e floor %.3e\n', name, max(err), absFloor);
end
end

function nf = must_tail(name, got, ref, mag, nSum)
nf = must_close(name, got, ref, 1e-5, mag, nSum);
p = double(got(1));
if ~(p < 1e-8 && p > 0)
    fprintf('FAIL %s tail p=%.3e, expected 0 < p < 1e-8\n', name, p);
    nf = nf + 1;
else
    fprintf('PASS %s tail p=%.3e\n', name, p);
end
end

function nf = must_double(name, val)
if isa(val, 'double')
    fprintf('PASS %s class double size %s\n', name, mat2str(size(val)));
    nf = 0;
else
    fprintf('FAIL %s class %s\n', name, class(val));
    nf = 1;
end
end

function nf = check_fp_grid()
ref = fp_ref_table();
nf = 0;
sawDirect = false;
for i = 1:size(ref, 1)
    F = ref(i, 1);
    d1 = ref(i, 2);
    d2 = ref(i, 3);
    pRef = ref(i, 4);
    got = f_tail(F, d1, d2);
    tag = sprintf('table F=%.6g df=%g,%g', F, d1, d2);
    kappa = ref(i, 5);
    nf = nf + must_mp(tag, got, pRef, kappa, d1, d2);
    if F == 2^-38 && d1 == 1 && d2 == 200
        bad = betainc(d2 ./ (d2 + d1 .* F), d2/2, d1/2);
        miss = abs(bad - pRef);
        if miss > 1e-10
            fprintf('PASS direct betainc misses by %.3e\n', miss);
            sawDirect = true;
        else
            fprintf('FAIL direct betainc abs err %.3e\n', miss);
            nf = nf + 1;
        end
    end
end
if ~sawDirect
    fprintf('FAIL table is missing F=2^-38 df=1,200\n');
    nf = nf + 1;
end
end

function ref = fp_ref_table()
% F, df1, df2, p, kappa. p is the double nearest the 80-digit lower tail.
% kappa is |x*I'(x)/I(x)| on the branch myfpval takes.
ref = [
  3.637978807091713e-12 1 10 0.99999851566931164 7.4216644579270701e-07;
  0.0001 1 10 0.99221797499097142 0.0039214253760500991;
  0.01 1 10 0.92232071856440834 0.041998644641088038;
  0.10000000000000001 1 10 0.75833153571117373 0.15515482638186018;
  0.5 1 10 0.49564750438311994 0.4456878768533411;
  1 1 10 0.34089313230205986 0.74333614890053135;
  2 1 10 0.18766987086960302 1.290848944335234;
  5 1 10 0.049332195639921771 2.8445559458228193;
  10 1 10 0.010119559735433714 5.3737070825606681;
  20 1 10 0.0011934668300203248 5.1963643095976435;
  50 1 10 3.4114010142784018e-05 5.081268982132964;
  100 1 10 1.5895531755964119e-06 5.0411363509101852;
  117.5 1 10 7.5552676756802793e-07 5.0350752801217382;
  150 1 10 2.4106242088140904e-07 5.0275398694250608;
  200 1 10 6.1490013680364217e-08 5.0206988758656843;
  300 1 10 8.7139052699459218e-09 5.0138288446380139;
  2253 1 10 4.1541194732478492e-13 5.0018483124640207;
  3.637978807091713e-12 1 200 0.99999848005708247 7.5997261387279175e-07;
  0.0001 1 200 0.99203125515328117 0.0040162453754702876;
  0.01 1 200 0.92044449250432103 0.043073388229885885;
  0.10000000000000001 1 200 0.75215942062399599 0.1593883408707728;
  0.5 1 200 0.48032319219861785 0.45753329843077517;
  1 1 200 0.31851884790974666 0.76156840626594668;
  2 1 200 0.15885401855752065 1.3179753893304456;
  5 1 200 0.026452163275470193 2.8864656988551487;
  10 1 200 0.0018091328303188878 5.4270208198638263;
  20 1 200 1.2970719228677296e-05 10.455527920686187;
  50 1 200 2.5185538210049251e-11 25.477374547321539;
  100 1 200 2.3774831444207593e-19 50.485827298250399;
  117.5 1 200 7.7942702312134654e-22 59.237148531859305;
  150 1 200 4.2485860033018002e-26 75.488808603460171;
  200 1 200 6.2556629943074126e-32 100.49033289537537;
  300 1 200 1.1651555149636511e-41 100.32792040292482;
  2253 1 200 7.9873823517933226e-111 100.04390783078149;
  3.637978807091713e-12 2 40 0.99999999999636202 3.637978807091713e-12;
  0.0001 2 40 0.99990000524980749 0.0001;
  0.01 2 40 0.99005230805211197 0.01;
  0.10000000000000001 2 40 0.90506290426665081 0.10000000000000001;
  0.5 2 40 0.61027094285882977 0.5;
  1 2 40 0.37688948287300073 1;
  2 2 40 0.14864362802414369 2;
  5 2 40 0.011529215046068469 5;
  10 2 40 0.0003007286598217175 10;
  20 2 40 9.5367431640625e-07 20;
  50 2 40 1.3141323697825354e-11 20;
  100 2 40 2.7351112277912534e-16 20;
  117.5 2 40 1.7969911983957998e-17 20;
  150 2 40 2.5800105729337147e-19 20;
  200 2 40 1.4864362802414369e-21 20;
  300 2 40 8.2718061255302767e-25 20;
  2253 2 40 7.7376877277084325e-42 20;
  3.637978807091713e-12 2 78 0.99999999999636202 3.637978807091713e-12;
  0.0001 2 78 0.99990000512802546 0.0001;
  0.01 2 78 0.99005110282770836 0.01;
  0.10000000000000001 2 78 0.90495323232607694 0.10000000000000001;
  0.5 2 78 0.60846127704352615 0.5;
  1 2 78 0.37254609219269813 1;
  2 2 78 0.14221626280829422 2;
  5 2 78 0.0090545170544103978 5;
  10 2 78 0.00013610452145982149 10;
  20 2 78 9.7339972674159824e-08 20;
  50 2 78 1.0600086637285516e-14 39;
  100 2 78 2.9781218579839086e-22 39;
  117.5 2 78 2.9205210486654015e-24 39;
  150 2 78 1.859984440875441e-27 39;
  200 2 78 1.9678932544671701e-31 39;
  300 2 78 2.3644571293945331e-37 39;
  2253 2 78 1.0072789437501032e-69 39;
  3.637978807091713e-12 7 24 1 3.1061181728867321e-39;
  0.0001 7 24 0.99999999999990341 3.3808330880433494e-13;
  0.01 7 24 0.99999906695886276 3.2424067802026942e-06;
  0.10000000000000001 7 24 0.99783429243321342 0.0070649022153751956;
  0.5 7 24 0.82517292291575461 0.50326460666247275;
  1 7 24 0.45531775138477448 1.8163990231674345;
  2 7 24 0.09728106055841558 5.0232517001804267;
  5 7 24 0.0013361435162796975 10.509966647027762;
  10 7 24 8.2523124717004681e-06 11.231921592928929;
  20 7 24 1.412160188060365e-08 11.610176799747105;
  50 7 24 8.8048160414252699e-13 11.842682786343113;
  100 7 24 3.4265548776473142e-16 11.921110206368388;
  117.5 7 24 5.3106031092595386e-17 11.932830453160406;
  150 7 24 3.0958355835744701e-18 11.947355443736505;
  200 7 24 1.062464701736936e-19 11.960497324840189;
  300 7 24 8.876048729196112e-22 11.973652045618127;
  2253 7 24 3.1746642218975529e-32 11.996488654027411;
  3.637978807091713e-12 10 50 1 1.2108008313762718e-55;
  0.0001 10 50 1 1.8989782841456046e-18;
  0.01 10 50 0.99999999638489212 1.7931142577668204e-08;
  0.10000000000000001 10 50 0.99976769911261976 0.0010702070418731181;
  0.5 10 50 0.88186459128390748 0.42445546890078706;
  1 10 50 0.45635690548036917 2.1048014037326528;
  2 10 50 0.053187688277809189 6.6129877090616738;
  5 10 50 5.1857903599739075e-05 21.327358931072879;
  10 10 50 5.9875963935798848e-09 23.119209794345036;
  20 10 50 3.3934133952512e-14 24.048886797005089;
  50 10 50 1.5205413687613532e-22 24.617038134603995;
  100 10 50 1.7329608910543269e-29 24.808104458965595;
  117.5 10 50 3.7755845792174064e-31 24.836632270946534;
  150 10 50 1.0886981462672333e-33 24.871977867253779;
  200 10 50 1.0348128423872362e-36 24.903949037263601;
  300 10 50 5.1860403992389992e-41 24.935943138932242;
  2253 10 50 1.0072351546494036e-62 24.991465181920063;
  3376199.4411113332 1 10 5.609888380142673e-29 5.0000012341288258;
  54005932.785423741 2 10 6.8020913923335215e-36 5;
  15391.855229902118 170 170 5.4409282190020422e-307 84.994606034684637;
  54005932.785423741 10 50 3.4585500023253091e-172 24.999999643913767];
end

function nf = check_fp_case(name, data, paired, forceanova)
[Fs, dfs, ps] = statcond(data, 'method', 'param', 'paired', paired, ...
    'forceanova', forceanova, 'verbose', 'off');
if ~iscell(ps)
    Fs = {Fs};
    dfs = {dfs};
    ps = {ps};
end
nf = 0;
for k = 1:numel(ps)
    expect = f_tail(Fs{k}, dfs{k}(1), dfs{k}(2));
    tag = sprintf('%s effect %d', name, k);
    if isa(ps{k}, 'double') && isequal(size(ps{k}), size(expect)) && isequaln(ps{k}, expect)
        fprintf('PASS %s matches formula\n', tag);
    else
        fprintf('FAIL %s\n', tag);
        nf = nf + 1;
    end
end
end

function nf = check_edges()
nf = 0;
nf = nf + check_nan_case('constant', {[4 4 4 4], [4 4 4 4], [4 4 4 4]}, 'off');
x = [1 2 3 4 5 6];
nf = nf + check_nan_case('identical groups', {x, x, x}, 'on');
A = [1 2 3 4 5 6];
B = [2 1 4 3 6 5];
C = [6 5 1 2 3 4];
[F, df, p] = statcond({A, B, C}, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nf = nf + must_value('zero-effect paired F', F, 0);
nf = nf + must_value('zero-effect paired p', p, 1);
h1 = ['412e84800035f407'; '412e84800088a4f2'; '412e847fffef2718'; '412e848000b31ae8'; '412e847fffa8cfc5'; '412e8480002e12b9'];
h2 = ['412e848000766b6e'; '412e8480000c5287'; '412e847fff9e8c4e'; '412e847fff873007'; '412e847fffc40145'; '412e8480001cdc86'];
h3 = ['412e847fff7baad6'; '412e847fffe4953b'; '412e847fffeb214c'; '412e84800046e3c4'; '412e8480001c22c4'; '412e8480002e9454'];
neg = {hex2num(h1).', hex2num(h2).', hex2num(h3).'};
[F, df, p] = statcond(neg, 'method', 'param', 'paired', 'on', 'verbose', 'off');
if isa(p, 'double') && F < 0 && p == 1
    fprintf('PASS negative F=%.6g p=1\n', F);
else
    fprintf('FAIL negative F got F=%.6g p=%.6g\n', F, p);
    nf = nf + 1;
end
infData = {[0 0 0 0], [1 1 1 1], [3 3 3 3]};
[F, df, p] = statcond(infData, 'method', 'param', 'paired', 'off', 'verbose', 'off');
nf = nf + must_inf_zero('Inf F', F, p);
[Fs, dfs, ps] = statcond(cellsingle(infData), 'method', 'param', 'paired', 'off', 'verbose', 'off');
nf = nf + must_inf_zero('single Inf F', Fs, ps);
nf = nf + check_nan_case('single constant', cellsingle({[4 4 4 4], [4 4 4 4], [4 4 4 4]}), 'off');
nf = nf + check_map();
nf = nf + check_twoway_constant();
end

function nf = check_map()
n = 8;
t = linspace(0, 1, n);
shifts = [0 4 8];
mild = [0 0.12 0.24];
g = cell(1, 3);
for j = 1:3
    row0 = 0.05 * sin(2 * pi * t) + shifts(j);
    row1 = 3 * ones(1, n);
    row2 = 0.4 * sin(2 * pi * t + 0.3) + mild(j);
    g{j} = [row0; row1; row2];
end
nf = check_map_data('map', g);
nf = nf + check_map_data('single map', cellsingle(g));
end

function nf = check_map_data(name, g)
[F, df, p] = statcond(g, 'method', 'param', 'paired', 'off', 'verbose', 'off');
expect = f_tail(F, df(1), df(2));
if ~(isa(p, 'double') && isequal(size(p), [3 1]) && isequaln(p, expect) && isnan(p(2)) && p(1) > 0 && p(1) < 1e-20 && p(3) > 0.2 && p(3) < 0.3)
    fprintf('FAIL %s p=%s class %s\n', name, mat2str(p, 5), class(p));
    nf = 1;
    return
end
fprintf('PASS %s p=[%.3e NaN %.3g]\n', name, p(1), p(3));
nf = 0;
end

function nf = check_twoway_constant()
a = {ones(1, 6), ones(1, 6); ones(1, 6), ones(1, 6)};
[F, df, p] = statcond(a, 'method', 'param', 'paired', 'on', 'verbose', 'off');
nf = 0;
for k = 1:3
    if ~(isa(p{k}, 'double') && isnan(F{k}) && isnan(p{k}) && isequaln(p{k}, f_tail(F{k}, df{k}(1), df{k}(2))))
        fprintf('FAIL two-way constant effect %d\n', k);
        nf = nf + 1;
    end
end
if nf == 0
    fprintf('PASS two-way constant NaN p\n');
end
end

function nf = check_nan_case(name, data, paired)
[F, df, p] = statcond(data, 'method', 'param', 'paired', paired, 'verbose', 'off');
if isa(p, 'double') && isequal(size(p), size(F)) && all(isnan(F(:))) && all(isnan(p(:))) && isequaln(p, f_tail(F, df(1), df(2)))
    fprintf('PASS %s NaN p\n', name);
    nf = 0;
else
    fprintf('FAIL %s\n', name);
    nf = 1;
end
end

function nf = must_value(name, got, ref)
if isa(got, 'double') && isequal(got, ref)
    fprintf('PASS %s\n', name);
    nf = 0;
else
    fprintf('FAIL %s got %s\n', name, mat2str(got));
    nf = 1;
end
end

function nf = must_inf_zero(name, F, p)
if isa(p, 'double') && isinf(F) && p == 0 && isequal(size(p), size(F))
    fprintf('PASS %s\n', name);
    nf = 0;
else
    fprintf('FAIL %s F=%s p=%s\n', name, mat2str(F), mat2str(p));
    nf = 1;
end
end

function p = f_tail(F, df1, df2)
p = ones(size(F), class(F));
p(isnan(F)) = NaN;
use = (F > 0);
if ~any(use(:))
    return
end
Fv = F(use);
lo = Fv < (df2 ./ df1);
pv = zeros(size(Fv), class(F));
if any(~lo(:))
    Ft = Fv(~lo);
    pv(~lo) = betainc(df2 ./ (df2 + df1 .* Ft), df2/2, df1/2);
end
if any(lo(:))
    Ft = Fv(lo);
    pv(lo) = betainc((df1 .* Ft) ./ (df2 + df1 .* Ft), df1/2, df2/2, 'upper');
end
p(use) = pv;
end

function rel = fp_rel(kappa, df1, df2)
% 3*kappa*(eps(1)/2) bounds rounding of x. The other term is a measured allowance for betainc's own error.
% C = 64 is a measured allowance for MATLAB R2025b (observed maximum 41),
% not a published bound.
C = 64;
u = eps(1)/2;
rel = (3 * kappa + C * max(df1, df2) / 2) * u;
end

function nf = must_mp(name, got, ref, kappa, df1, df2)
nf = must_double(name, got);
if nf
    return
end
got = double(got);
ref = double(ref);
rel = fp_rel(kappa, df1, df2);
err = abs(got - ref);
if ref == 0
    bad = got ~= 0;
    lim = 0;
else
    lim = rel .* abs(ref);
    bad = err > lim;
end
if bad
    fprintf('FAIL %s err %.3e lim %.3e (got %.12g ref %.12g)\n', name, err, lim, got, ref);
    nf = 1;
else
    fprintf('PASS %s rel %.3e\n', name, err / max(abs(ref), realmin));
end
end

function nf = must_equal_df(name, got, ref)
if isequal(got(:)', ref(:)')
    fprintf('PASS %s %s\n', name, mat2str(got));
    nf = 0;
else
    fprintf('FAIL %s got %s ref %s\n', name, mat2str(got), mat2str(ref));
    nf = 1;
end
end
```

```python
import mpmath as mp
mp.mp.dps = 80

Fs = [2**-38, 1e-4, 1e-2, 0.1, 0.5, 1, 2, 5, 10, 20, 50, 100, 117.5, 150, 200, 300, 2253]
pairs = [(1, 10), (1, 200), (2, 40), (2, 78), (7, 24), (10, 50)]
extra = [(3376199.4411113332, 1, 10), (54005932.785423741, 2, 10), (15391.855229902118, 170, 170), (54005932.785423741, 10, 50)]

def fmt(x):
    return format(float(x), '.17g')

def row(F, d1, d2):
    Fm, d1m, d2m = mp.mpf(F), mp.mpf(d1), mp.mpf(d2)
    xlo = d2m / (d2m + d1m * Fm)
    p = mp.betainc(d2m / 2, d1m / 2, 0, xlo, regularized=True)
    if float(F) < float(d2) / float(d1):
        x = d1m * Fm / (d2m + d1m * Fm)
        a, b = d1m / 2, d2m / 2
    else:
        x = xlo
        a, b = d2m / 2, d1m / 2
    logk = a*mp.log(x) + (b - 1)*mp.log(1 - x) - mp.log(mp.beta(a, b)) - mp.log(p)
    print(fmt(F), d1, d2, fmt(p), fmt(mp.exp(logk)))

for d1, d2 in pairs:
    for F in Fs:
        row(F, d1, d2)
for F, d1, d2 in extra:
    row(F, d1, d2)
```

<!-- CURSOR_AGENT_PR_BODY_END -->

<div><a href="https://cursor.com/agents/bc-a0e4d8e7-4dc3-5c44-ab4f-438b37e55022?cursor_ref=pr_footer&cursor_cta=open_in_web"><picture><source media="(prefers-color-scheme: dark)" srcset="https://cursor.com/assets/images/open-in-web-dark.png"><source media="(prefers-color-scheme: light)" srcset="https://cursor.com/assets/images/open-in-web-light.png"><img alt="Open in Web" width="114" height="28" src="https://cursor.com/assets/images/open-in-web-dark.png"></picture></a>&nbsp;<a href="https://cursor.com/background-agent?bcId=bc-a0e4d8e7-4dc3-5c44-ab4f-438b37e55022&cursor_ref=pr_footer&cursor_cta=open_in_cursor"><picture><source media="(prefers-color-scheme: dark)" srcset="https://cursor.com/assets/images/open-in-cursor-dark.png"><source media="(prefers-color-scheme: light)" srcset="https://cursor.com/assets/images/open-in-cursor-light.png"><img alt="Open in Cursor" width="131" height="28" src="https://cursor.com/assets/images/open-in-cursor-dark.png"></picture></a>&nbsp;</div>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ac485f654d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.