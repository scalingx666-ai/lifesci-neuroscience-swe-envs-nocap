# Issue

**Title:** New function hmrR_TaskNorm

## Description

% DESCRIPTION:
% Calculate the average of the HRF over the duration of the task with repetitions with different durations.
% Custom-made function by Anna Falivene for PhD Charlotte Johnson
%
% INPUT:
% dc: SNIRF.data container with the concentration data
% stim: SNIRF.stim container with the stimulus condition data
% deltat: defines the range before the onset and after the duration
% [tPre_onset tPost_duration]. Both positive (or null) values
% show: parameter to able/disable figure(). if show=0 no figure will
% appear, if =1 figures with the HBO and HBR concentration for each
% channel will appear
%
% OUTPUT:
% dcAvg: averaged results
% dcAvgStd: standard deviation across trials
% nTrials: the number of trials averaged
%
% USAGE OPTIONS:
% Stim_Normalization_on_Concentration_Data: [dcAvg, dcAvgStd, nTrials] = hmrR_StimNorm1(dc, stim, deltat, show )
%
% PARAMETERS:
% deltat: [0, 0]
% show: 1
%
% PREREQUISITES:
% Delta_OD_to_Conc: dc = hmrR_OD2Conc( dod, probe, ppf )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `592b270703aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.