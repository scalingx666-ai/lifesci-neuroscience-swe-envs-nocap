# Issue

**Title:** RF: Support "flat" ASCII-encoded GIFTI DataArrays

## Description

Hi @effigies I hope you're well!

I had a report from a FSLeyes user who has used a [MATLAB GIfTI library](https://github.com/gllmflndn/gifti) to generate some `.gii` files that were failing to load in FSLeyes. The GIfTI files that this library generates are ASCII-encoded, but without any newlines to separate elements along the first dimension, e.g.. instead of the conventional:

```xml
<DataArray Dimensionality="2"
           Dim0="3"
           Dim1="3"
           Encoding="ASCII">
  <Data>155.17539978 135.58103943 98.30715179
        140.33973694 190.0491333  73.24776459
        157.3598938  196.97969055 83.65809631
  </Data>
</DataArray>
```
these files instead contain
```xml
<DataArray Dimensionality="2"
           Dim0="3"
           Dim1="3"
           Encoding="ASCII">
  <Data>155.17539978 135.58103943 98.30715179 140.33973694 190.0491333 73.24776459 157.3598938 196.97969055 83.65809631</Data>
</DataArray>
```

Once again, the GIfTI specification is light on details as to the expected format of ASCII-encoded data arrays - all it says is (from Section *2.3.4.5 Encoding*):
 
> The Data element contains ASCII text with each value separated by whitespace

But every ASCII-encoded GIfTI file I've encountered has contained newlines to separate elements along the first dimension.

In any case, when using nibabel to load such a file (e.g. the `ascii_flat_data.gii` test file in this PR), the loaded data arrays are one dimensional, e.g.:

```python
import nibabel as nib
img = nib.load('ascii_flat_data.gii')
print('Expected shape:', img.darrays[0].dims)
print('Actual shape:  ', img.darrays[0].data.shape)
```
```
>> Expected shape: [10, 3]
>> Actual shape:   (30,)
```

It turns out that, for non-ASCII-encoded data arrays, the `nibabel.gifit.parse_gifti_fast.read_data_block` function [will ensure](https://github.com/nipy/nibabel/blob/27c24272661be944598eb93a9f278f7fa0fd0022/nibabel/gifti/parse_gifti_fast.py#L135-L137) that the loaded array has the shape specified in the `DataArray` attributes. But [this is not the case](https://github.com/nipy/nibabel/blob/27c24272661be944598eb93a9f278f7fa0fd0022/nibabel/gifti/parse_gifti_fast.py#L73-L77)  for ASCII-encoded arrays.

This PR contains a small patch which ensures that ASCII-encoded arrays are reshaped to the expected dimensionality. 

There is a slight complexity in that [one of the existing unit tests](https://github.com/nipy/nibabel/blob/27c24272661be944598eb93a9f278f7fa0fd0022/nibabel/gifti/tests/test_parse_gifti_fast.py#L53) is expecting the result to be 1D when loading a file [that contains an array of shape `(1, 3)`](https://github.com/nipy/nibabel/blob/27c24272661be944598eb93a9f278f7fa0fd0022/nibabel/gifti/tests/data/ascii.gii#L66-L68). 

I added the `.squeeze()` call in to preserve this behaviour, but I'm not sure whether a better option is to always return the shape specified in the `DataArray` attributes. I'm not sure how widely used ASCII-encoded GIFTIs, so am unsure of the potential impact of such a change. It's obviously unlikely that one would encounter a `POINTSET` or `TRIANGLE` array with a dimension of length 1, but it could occur with `SHAPE` or `TIMESERIES` arrays.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27c24272661b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.