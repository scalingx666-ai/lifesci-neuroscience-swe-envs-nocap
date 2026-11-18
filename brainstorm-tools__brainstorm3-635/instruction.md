# Issue

**Title:** fix topography (NIRS)

## Description

Hi :)
When cloning a topography figure, I had the following error : 

```
Error using cell/ismember (line 34)
Input A of class double and input B of class cell must be cell arrays of character vectors, unless one is a character
vector.

Error in bst_getunits (line 46)
    if ismember(lower(DataType), {'results', 'sources', 'source'})

Error in bst_colormaps>ConfigureColorbar (line 1470)
                    [valScaled, fFactor, DisplayUnits] = bst_getunits( fmax, DataType, 'nirs', DisplayUnits);

Error in bst_colormaps (line 74)
eval(macro_method);

Error in panel_surface>UpdateSurfaceColormap (line 2053)
        bst_colormaps('ConfigureColorbar', hFig, ColormapInfo.Type, DataType, ColormapInfo.DisplayUnits);

Error in panel_surface (line 40)
eval(macro_method);

Error in figure_3d>ColormapChangedCallback (line 167)
    panel_surface('UpdateSurfaceColormap', hFig);
```


DataType is empty when cloning a topography. I guess it's because there is no surface associated to the topography since it's at the channel level. 


This fix is not perfect as after cloning the figure, the unit is written as 'invalid scale' until a new montage is selected and the color bar is updated. 

Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8ae8e441d81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.