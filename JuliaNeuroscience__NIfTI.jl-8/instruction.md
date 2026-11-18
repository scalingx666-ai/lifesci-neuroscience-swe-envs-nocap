# Issue

**Title:** Support big endian files

## Description

@SimonDanisch and I were looking for standard test data, and I found https://nifti.nimh.nih.gov/nifti-1/data. These seemed to be the standard test data sets, so I was initially surprised that these wouldn't open. A little poking around revealed that it was an endianness issue. MappedArrays makes this trivial to support even with mmap.

From playing with it a little, I'd say the indexing needs work: I get errors from very trivial operations, like
```julia
julia> maximum(img)
ERROR: MethodError: no method matching setindex!(::UInt8, ::Float32, ::Int64)
 in getindex(::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}, ::CartesianIndex{3}) at /home/tim/.julia/v0.5/NIfTI/src/NIfTI.jl:540
 in next(::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}, ::Tuple{CartesianRange{CartesianIndex{3}},CartesianIndex{3}}) at ./abstractarray.jl:683
 in mapfoldl(::Base.#identity, ::Function, ::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}) at ./reduce.jl:62
 in _mapreduce(::Function, ::Function, ::Base.LinearSlow, ::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}) at ./reduce.jl:167
 in mapreduce(::Function, ::Function, ::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}) at ./reduce.jl:169
 in maximum(::NIfTI.NIVolume{UInt8,3,Array{UInt8,3}}) at ./reduce.jl:302
 in eval(::Module, ::Any) at ./boot.jl:234
```
I'm planning on just extracting the `raw` field manually, so it's not a big issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f217aac10d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.