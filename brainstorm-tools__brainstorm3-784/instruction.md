# Issue

**Title:** Fix downsize for some surface

## Description

For some surface,      VarInfo = whos('-file',file_fullpath(TessFile), 'Color'); is an empty structure making it not possible to downsample currently : 



```
Error using  ~= 
Not enough input arguments.

Error in tess_downsize (line 104)
    if all(VarInfo.size ~= 0)

Error in tree_callbacks>@(h,ev)tess_downsize(filenameFull,[],[]) (line 1227)
                        gui_component('MenuItem', jPopup, [], 'Less vertices...', IconLoader.ICON_DOWNSAMPLE, [], @(h,ev)tess_downsize(filenameFull, [], []));
 
```

Bug introduced in  


Edit: Actually, I am not sure I quite like the syntax : 

```matab    
 VarInfo = whos('-file',file_fullpath(TessFile), 'Color');
     if ~isempty(VarInfo) && all(VarInfo.size ~= 0)
         methods_str = methods_str(1); % Inhomogeneous mesh
     end


```  

and would more write something like (seems more consistent with the rest of the codebase)

```matlab

sTess = in_tess_bst(TessFile)
if isfield(sTess,  'Color')  && ~isempty(sTess.Color) 
    methods_str = methods_str(1); % Inhomogeneous mesh
end

``` 


This would allow to remove the other call to whos on line62 (VarInfo = whos('-file',file_fullpath(TessFile),'Vertices');)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbfc0b708732`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.