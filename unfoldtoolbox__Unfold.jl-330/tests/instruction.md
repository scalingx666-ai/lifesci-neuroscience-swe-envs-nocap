# Issue

**Title:** Warn on out-of-bounds events in epoch function

## Description

`Unfold.epoch` silently creates all-missing epochs when event latencies exceed data bounds - typically after downsampling data without adjusting event indices.

## Changes

- **Detection**: Track events where entire epoch range falls outside `[1, size(data, 2)]`
- **Warning**: Emit actionable message listing problematic event indices with remediation steps
- **Tests**: Cover before-start, after-end, and mixed valid/invalid scenarios

## Example

```julia
# Data downsampled 2x, but event latencies not adjusted
data = randn(1, 500)
events = DataFrame(:latency => [50, 250, 900])  # Event 3 beyond bounds

ep, times = Unfold.epoch(data, events, (-0.1, 0.5), 100)
# ⚠ Warning: 1 event(s) at indices [3] are completely out of bounds and result
#   in epochs filled with missing values. This often happens when data was
#   downsampled without adjusting event latencies. Consider: (1) adjusting
#   event latencies to match the downsampled data, or (2) filtering out
#   invalid events before epoching.
```

Previously failed silently.

> [!WARNING]
>
> <details>
> <summary>Firewall rules blocked me from connecting to one or more addresses (expand for details)</summary>
>
> #### I tried to connect to the following addresses, but was blocked by firewall rules:
>
> - `gist.github.com`
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (dns block)
> - `https://api.github.com/repos/BioJulia/Automa.jl/tarball/a8f503e8e1a5f583fbef15a8440c8c7e32185df2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/FedeClaudi/MyterialColors.jl/tarball/01d8466fb449436348999d7c6ad740f8f853a579`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/FedeClaudi/Term.jl/tarball/dfb5cd0af7f67f7487287fa7f83860fe0cb45899`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/FluxML/MacroTools.jl/tarball/1e0228a030642014fe5cfe68c2c0a818f9e3f522`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaApproximation/FastGaussQuadrature.jl/tarball/0044e9f5e49a57e88205e8f30ab73928b05fe5b6`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/ArrayInterface.jl/tarball/d81ae5489e13bc03567d4fbbb06c546a5e53c857`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/CatIndices.jl/tarball/a0f80a09780eed9b1d106a1bf62041c2efc995bc`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/CustomUnitRanges.jl/tarball/1a3f97f907e6dd8983b744d2642651bb162a3f7a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/FFTViews.jl/tarball/cbdf14d1e8c7c8aacbe8b19862e0179fd08321c2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaArrays/FillArrays.jl/tarball/2f979084d1e13948a3352cf64a25df6bd3b4dca3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/MappedArrays.jl/tarball/0ee4497a4e80dbd29c058fcee6493f5219556f40`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/MosaicViews.jl/tarball/7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/OffsetArrays.jl/tarball/117432e406b5c023f665fa73dc26e79ec3630151`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/PaddedViews.jl/tarball/0fac6313486baae819364c52b4f483450a9d793f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/ShiftedArrays.jl/tarball/503688b59397b3307443af35cd953a13e8005c16`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/StackViews.jl/tarball/be1cf4eb0ac528d96f5115b4ed80c26a8d8ae621`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/StaticArrayInterface.jl/tarball/96381d50f1ce85f2663584c8e886a6ca97e60554`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/StaticArrays.jl/tarball/eee1b9ad8b29ef0d936e3ec9838c7ec089620308`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/StaticArraysCore.jl/tarball/6ab403037779dae8c514bad259f32a447262455a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaArrays/TiledIteration.jl/tarball/1176cc31e867217b06928e2f140c90bd1bc88283`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Bzip2_jll.jl/tarball/1b96ea4a01afe0ea4090c5c8039690672dd13f2e`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/FFTW_jll.jl/tarball/6d6219a004b8cf1e0b4dbe27a2860b8e04eba0be`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/HDF5_jll.jl/tarball/e94f84da9af7ce9c6be049e9067e511e17ff89ec`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Hwloc_jll.jl/tarball/3d468106a05408f9f7b6f161d9e7715159af247b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/IntelOpenMP_jll.jl/tarball/ec1debd61c300961f98064cfb21287613ad7f303`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Libiconv_jll.jl/tarball/be484f5c92fad0bd8acfef35fe017900b0b73809`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Lz4_jll.jl/tarball/191686b1ac1ea9c89fc52e996ad15d1d241d1e33`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/MKL_jll.jl/tarball/282cadc186e7b2ae0eeadbd7a4dffed4196ae2aa`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/MPICH_jll.jl/tarball/9341048b9f723f2ae2a72a5269ac2f15f80534dc`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/MPItrampoline_jll.jl/tarball/e214f2a20bdd64c04cd3e4ff62d3c9be7e969a59`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/MicrosoftMPI_jll.jl/tarball/bc95bf4149bf535c09602e3acdf950d9b4376227`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/NLopt_jll.jl/tarball/b0154a615d5b2b6cf7a2501123b793577d0b9950`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/OpenMPI_jll.jl/tarball/ab6596a9d8236041dcd59b5b69316f28a8753592`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/OpenSpecFun_jll.jl/tarball/1346c9208249809840c91b26703912dff463d335`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Rmath_jll.jl/tarball/58cdd8fb2201a6267e1db87ff148dd6c1dbd8ad8`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/XML2_jll.jl/tarball/80d3930c6347cfce7ccf96bd3bafdf079d9c0390`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Xorg_libpciaccess_jll.jl/tarball/4909eb8f1cbf6bd4b1c30dd18b2ead9019ef2fad`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/Zstd_jll.jl/tarball/446b23e73536f84e8037f5dce465e92275f6a308`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/libaec_jll.jl/tarball/13b760f97c6e753b47df30cb438d4dc3b50df282`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaBinaryWrappers/oneTBB_jll.jl/tarball/1350188a69a6e46f799d3945beef36435ed7262f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCI/BenchmarkTools.jl/tarball/7fecfb1123b8d0232218e2da0c213004ff15358d`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCollections/AbstractTrees.jl/tarball/2d9c9a55f9c93e8887ad391fbae72f8ef55e1177`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCollections/DataStructures.jl/tarball/e357641bb3e0638d353c4b29ea0e40ea644066a6`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCollections/IterTools.jl/tarball/42d5f897009e7ff2cf88db414a389e5ed1bdd023`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCollections/OrderedCollections.jl/tarball/05868e21324cede2207c6f0f466b4bfef6d5e7ee`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaCollections/SortingAlgorithms.jl/tarball/64d974c2e6fdf07f8155b5b2ca2ffa9069b608d9`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDSP/DSP.jl/tarball/5989debfc3b38f736e69724818210c67ffee4352`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/CSV.jl/tarball/deddd8725e5e1cc49ee205a1964256043720a6c3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/CategoricalArrays.jl/tarball/73acb4ed51b1855e1b5ce5c610334363a98d13f1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/DataAPI.jl/tarball/abe83f3a2f1b857aac70ef8b269080af17764bbe`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/DataFrames.jl/tarball/d8928e9169ff76c6281f39a659f9bca3a573f24c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/DataFramesMeta.jl/tarball/b0652fb7f3c094cf453bf22e699712a0bed9fc83`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/DelimitedFiles.jl/tarball/9e2f36d3c96a820c678f2f1f1782582fcf685bae`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/InvertedIndices.jl/tarball/6da3c4316095de0f5ee2ebd875df8721e7e0bdbe`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/Missings.jl/tarball/ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/Parsers.jl/tarball/7d2f8f21da5db6a806faf7b9b292296da42b2810`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/PooledArrays.jl/tarball/36d8b4b899628fb92c2749eb488d884a926614d3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/SentinelArrays.jl/tarball/ebe7e59b37c400f694f52b58c93d26201387da70`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/SplitApplyCombine.jl/tarball/c06d695d51cfb2187e6848e98d6252df9101c588`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/StructTypes.jl/tarball/159331b30e94d7b11379037feeb9b690950cace8`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/TableMetadataTools.jl/tarball/c0405d3f8189bb9a9755e429c6ea2138fca7e31f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/Tables.jl/tarball/f2c1efbc8f3a609aadf318094f8fc5204bdaf344`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/TypedTables.jl/tarball/84fd7dadde577e01eb4323b7e7b9cb51c62c60d4`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaData/WeakRefStrings.jl/tarball/b1be2855ed9ed8eac54e5caff2afcdb442d52c23`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDebug/CodeTracking.jl/tarball/b7231a755812695b8046e8471ddc34c8268cbad5`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDiff/ChainRulesCore.jl/tarball/e4c6a16e77171a5f5e25e9646617ab1c276c5607`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDiff/DiffResults.jl/tarball/782dd5f4561f5d267313f23853baaaa4c52ea621`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDiff/DiffRules.jl/tarball/23163d55f885173722d1e4cf0f6110cdbaf7e272`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDiff/DifferentiationInterface.jl/tarball/7ae99144ea44715402c6c882bfef2adbeadbc4ce`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaDiff/FiniteDiff.jl/tarball/9340ca07ca27093ff68418b7558ca37b05f8aeb1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDiff/ForwardDiff.jl/tarball/eef4c86803f47dcb61e9b8790ecaa96956fdd8ae`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDocs/DocStringExtensions.jl/tarball/7442a5dfe1ebb773c29cc2962a8980f47221d76c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaDocs/Highlights.jl/tarball/9e13b8d8b1367d9692a90ea4711b4278e4755c32`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaFunctional/CompositionsBase.jl/tarball/802bb88cd69dfd1509f6670416bd4434015693ad`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaGPU/Adapt.jl/tarball/7e35fca2bdfba44d797c53dfe63a51fabf39bfc0`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGeometry/CoordinateTransformations.jl/tarball/a692f5e257d332de1e554e4566a4e5a8a72de2b2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGeometry/Quaternions.jl/tarball/4d8c1b7c3329c1885b857abb50d08fa3f4d9e3c8`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGeometry/Rotations.jl/tarball/5680a9276685d392c87407df00d57c9924d9f11e`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGraphics/ColorTypes.jl/tarball/67e11ee83a43eb71ddc950302c53bf33f0690dfe`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGraphics/ColorVectorSpace.jl/tarball/8b3b6f87ce8f65a2b4f857528fd8d70086cd72b1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaGraphics/Colors.jl/tarball/37ea44092930b1811e666c3bc38065d7d87fcc74`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/CodecBzip2.jl/tarball/84990fa864b7f2b4901901ca12736e45ee79068c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/CodecLz4.jl/tarball/d58afcd2833601636b48ee8cbeb2edcb086522c2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaIO/CodecZlib.jl/tarball/962834c22b66e32aa10f7611c08c8ca4e20749a9`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/CodecZstd.jl/tarball/da54a6cd93c54950c15adf1d336cfd7d71f51a56`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaIO/FileIO.jl/tarball/6522cfb3b8fe97bec632252263057996cbd3de20`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/HDF5.jl/tarball/e856eef26cf5bf2b0f95f8f4fc37553c72c8641c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/JLD2.jl/tarball/d97791feefda45729613fafeccc4fbef3f539151`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/JSON.jl/tarball/b3ad4a0255688dcb895a52fafbaae3023b588a90`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/Suppressor.jl/tarball/6dbb5b635c5437c68c28c2ac9e39b87138f37c0a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaIO/TranscodingStreams.jl/tarball/0c45878dcfdcfa8480052b6ab162cdd138781742`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaImages/ImageBase.jl/tarball/eb49b82c172811fd2c86759fa0553a2221feb909`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaImages/ImageCore.jl/tarball/8c193230235bbcee22c8066b0374f63b5683c2d3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaImages/ImageFiltering.jl/tarball/52116260a234af5f69969c5286e6a5f8dc3feab8`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaImages/ImageTransformations.jl/tarball/dfde81fafbe5d6516fb864dc79362c5c6b973c82`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaInterop/CEnum.jl/tarball/389ad5c84de1ae7cf0e28e381131c98ea87d54fc`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLang/Compat.jl/tarball/9d8a54ce4b17aa5bdce0ea5c34bc5e7c340d16ad`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLang/JuliaSyntax.jl/tarball/937da4713526b96ac9a178e2035019d3b78ead4a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLang/PrecompileTools.jl/tarball/07a921781cab75691315adc645096ed5e370cb77`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLang/ScopedValues.jl/tarball/c3b2323466378a2ba15bea4b2f73b081e022f473`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLinearAlgebra/ArrayLayouts.jl/tarball/e0b47732a192dd59b9d079a06d04235e2f833963`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLinearAlgebra/BandedMatrices.jl/tarball/02fa77c70ba84361b9bc9ff28523bd9d78519265`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLinearAlgebra/IterativeSolvers.jl/tarball/59545b0a2b27208b0650df0a46b8e3019f85055b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLinearAlgebra/ToeplitzMatrices.jl/tarball/338d725bd62115be4ba7ffa891d85654e0bfb1a1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaLinearAlgebra/WoodburyMatrices.jl/tarball/248a7031b3da79a127f14e5dc5f417e26f9f6db7`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaLogging/ProgressLogging.jl/tarball/f0803bc1171e455a04124affa9c21bba5ac4db32`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/AbstractFFTs.jl/tarball/d92ad398961a3ed262d8bf04a1a2b8340f915fef`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/Bessels.jl/tarball/4435559dc39793d53a9e3d278e185e920b4619ef`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/Combinatorics.jl/tarball/c761b00e7755700f9cdf5b02039939d1359330e1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/FFTW.jl/tarball/97f08406df914023af55ade2f843c39e99c5d969`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/FixedPointNumbers.jl/tarball/05882d6995ae5c12bb5f36dd2ed3f61c98cbb172`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/HypergeometricFunctions.jl/tarball/68c173f4f449de5b438ee67ed0c9c748dc31a2ec`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/Interpolations.jl/tarball/65d505fa4c0d7072990d659ef3fc086eb6da8208`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/InverseFunctions.jl/tarball/a779299d77cd080bf77b97535acecd73e1c5e5cb`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaMath/IrrationalConstants.jl/tarball/b2d91fe939cae05960e760110b328288867b5758`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/NaNMath.jl/tarball/9b8215b1ee9e78a293f99797cd31375471b2bcae`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/Polynomials.jl/tarball/972089912ba299fba87671b025cd0da74f5f54f7`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/QuadGK.jl/tarball/9da16da70037ba9d701192e27befedefb91ec284`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/RealDot.jl/tarball/9f0a1b71baaf7650f4fa8a1d168c7fb6ee41f0c9`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/Roots.jl/tarball/8a433b1ede5e9be9a7ba5b1cc6698daa8d718f1d`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/SpecialFunctions.jl/tarball/f2685b435df2613e25fc10ad8c26dddb8640f547`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMath/TensorCore.jl/tarball/1feb45f88d133a655e001435632f019a9a1bcdb6`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaMixedModels/MixedModelsDatasets.jl/tarball/ac0036e4f1829db000db46aad4cd5a207bba8465`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaNLSolvers/LineSearches.jl/tarball/9ea3422d03222c6de679934d1c08f0a99405aa03`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaNLSolvers/NLSolversBase.jl/tarball/25a6638571a902ecfb1ae2a18fc1575f86b1d4df`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaNLSolvers/Optim.jl/tarball/48968edaf014f67e58fe4c8a4ce72d392aed3294`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaObjects/Accessors.jl/tarball/856ecd7cebb68e5fc87abecd2326ad59f0f911f3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaObjects/ConstructionBase.jl/tarball/b4b092499347b18a015186eae3042f72267106cb`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPackaging/JLLWrappers.jl/tarball/0533e564aae234aff59ab625543145446d8b6ec2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPackaging/Preferences.jl/tarball/522f093a29b31a93e34eaea17ba055d850edea28`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPackaging/Requires.jl/tarball/62389eeff14780bfe55195b7204c0d8738436d64`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPackaging/Scratch.jl/tarball/9b81b8393e50b7d4e6d0a9f14e192294d3b7c109`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaParallel/MPI.jl/tarball/c105fe467859e7f6e9a852cb15cb4301126fac07`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPhysics/Unitful.jl/tarball/57e1b2c9de4bd6f40ecb9de4ac1797b81970d008`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaPlots/Plots.jl/tarball/5c3d09cc4f31f5fc6af001c250bf1278733100ff`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaRandom/StableRNGs.jl/tarball/4f96c596b8c8258cc7d3b19797854d368f243ddc`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaServices/ConcurrentUtilities.jl/tarball/d9d26935a0bcffc87d2613ce14c527c99fc543fd`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaServices/StructUtils.jl/tarball/9297459be9e338e546f5c4bedb59b3b5674da7f1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaServices/WorkerUtilities.jl/tarball/cd1659ba0d57b71a464a29e64dbc67cfe83d54e7`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaSmoothOptimizers/AMD.jl/tarball/45a1272e3f809d36431e57ab22703c6896b8908f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaSmoothOptimizers/Krylov.jl/tarball/125d65fe5042faf078383312dd060adf11d90802`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaSmoothOptimizers/LDLFactorizations.jl/tarball/70f582b446a1c3ad82cf87e62b878668beef9d13`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaSmoothOptimizers/LinearOperators.jl/tarball/80f975f228586a745c8716ff3aa33715fe9ee188`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaSmoothOptimizers/QPSReader.jl/tarball/374833c0c1fd5cc623278581bf0c8259d7b35f10`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaStats/Distributions.jl/tarball/fbcc7610f6d8348428f722ecbe0e6cfe22e672c6`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/GLM.jl/tarball/3bcb30438ee1655e3b9c42d97544de7addc9c589`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/LogExpFunctions.jl/tarball/13ca9e2586b89836fd20cccf56e57e2b9ae7f38f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/MLBase.jl/tarball/ac79beff4257e6e80004d5aee25ffeee79d91263`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/MixedModels.jl/tarball/9292e6f1a91ff530ecb3387ccf68ade3a57ad07c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/PDMats.jl/tarball/e4cff168707d441cd6bf3ff7e4832bdf34278e4a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/Rmath.jl/tarball/5b3d50eb374cea306873b371d3f8d3915a018f0b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/Statistics.jl/tarball/ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/StatsAPI.jl/tarball/178ed29fd5b2a2cfc3bd31c13375ae925623ff36`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/StatsBase.jl/tarball/aceda6f4e598d331548e04cc6b2124a6148138e3`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/StatsFuns.jl/tarball/91f091a8716a6bb38417a6e6f274602a19aaa685`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStats/StatsModels.jl/tarball/b12d37d25a2378f01abba02591cfd39a6cc4936f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStrings/InlineStrings.jl/tarball/8f3d257792a522b4601c24a577954b0a8cd7334d`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStrings/LaTeXStrings.jl/tarball/dda21b8cbd6a6c40d9d02a73230f9d70fed6918c`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaStrings/StringViews.jl/tarball/f2dcb92855b31ad92fe8f079d4f75ac57c93e4b8`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaTesting/ExprTools.jl/tarball/27415f162e6028e81c72b82ef756bf321213b6ec`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/JuliaTesting/Mocking.jl/tarball/2c140d60d7cb82badf06d8783800d0bcd1a7daa2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaTime/TZJData.jl/tarball/72df96b3a595b7aab1e101eb07d2a435963a97e2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/JuliaTime/TimeZones.jl/tarball/d422301b2a1e294e3e4214061e44f338cafe18a2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/KristofferC/Crayons.jl/tarball/249fe38abf76d48563e2f4556bebd215aa317e15`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/KristofferC/TimerOutputs.jl/tarball/3748bd928e68c7c346b52125cf41fff0de6937d0`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/LilithHafner/AliasTables.jl/tarball/9876e1e164b144ca45e9e3198d0b689cadfed9ff`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/LilithHafner/PtrArrays.jl/tarball/1d36ef11a9aaf1e8b74dacc6a731dd1de8fd493d`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/MichaelHatherly/CommonMark.jl/tarball/351d6f4eaf273b753001b2de4dffb8279b100769`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/RePsychLing/MixedModelsSim.jl/tarball/9bbcfdc15ed571358e9dafe160dcfd44f0cac353`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SciML/ADTypes.jl/tarball/f7304359109c768cf32dc5fa2d371565bb63b68a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SciML/CommonSolve.jl/tarball/78ea4ddbcf9c241827e7035c3a03e2e456711470`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/SciML/CommonWorldInvalidations.jl/tarball/ae52d1c52048455e85a387fbee9be553ec2b68d0`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SciML/IfElse.jl/tarball/debdd00ffef04665ccbb3e150747a77560e8fad1`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SciML/SciMLPublic.jl/tarball/0ba076dbdce87ba230fff48ca9bca62e1f345c9b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SciML/Static.jl/tarball/49440414711eddc7227724ae6e570c7d5559a086`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/SimonDanisch/UnicodeFun.jl/tarball/53915e50200959667e78a92a418594b428dffddf`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/andyferris/Dictionaries.jl/tarball/a55766a9c8f66cf19ffcdbdb1444e249bb4ace33`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/andyferris/Indexing.jl/tarball/ce1566720fd6b19ff3411404d4b977acd4814f9f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/apache/arrow-julia/tarball/404265cd8128a2515a81d5eae16de90fdef05101`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/apache/arrow-julia/tarball/4a69a3eadc1f7da78d950d1ef270c3a62c1f7e01`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/beacon-biosignals/Effects.jl/tarball/7fa33d3a2b536008e45c106ba5e776156d5fac79`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/c42f/FastClosures.jl/tarball/acebe244d53ee1b461970f8910c235b259e772ef`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/dancasimiro/WAV.jl/tarball/7e7e1b4686995aaf4ecaaf52f6cd824fa6bd6aa5`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/domluna/JuliaFormatter.jl/tarball/eeb150b63d8bfdca04a0c367a8b95d3863fdc892`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/ds4dm/Tulip.jl/tarball/d9415a833b926da3f753133a50d5ce316c51bc67`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/eschnett/SIMD.jl/tarball/e24dc23107d426a096d3eae6c165b921e74c18e4`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/fredrikekre/EnumX.jl/tarball/7bebc8aad6ee6217c78c5ddcf7ed289d65d0263e`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/getzze/RobustModels.jl/tarball/390b628433d196f93b006b109a6d3c14c93be322`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/haberdashPI/MetaArrays.jl/tarball/6647f7d45a9153162d6561957405c12088caf537`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/haberdashPI/SignalBase.jl/tarball/14cb05cba5cc89d15e6098e7bb41dcef2606a10a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/halleysfifthinc/Peaks.jl/tarball/75d0ce1c30696d77bc60840222d7fc5d549ebf5f`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/jipolanco/BSplineKit.jl/tarball/48b9300555c54256c12a539a3025f8d2075bea6a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/jkrumbiegel/Chain.jl/tarball/765487f32aeece2cf28aa7038e29c31060cb5a69`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/jump-dev/MathOptInterface.jl/tarball/7fb98657926ccb4de8f9bb96cda453700ca39a8b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/jump-dev/MutableArithmetics.jl/tarball/22df8573f8e7c593ac205455ca088989d0a2c7a0`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/jump-dev/NLopt.jl/tarball/624785b15005a0e0f4e462b27ee745dbe5941863`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/jw3126/Setfield.jl/tarball/c5391c6ace3bc430ca630251d02ea9687169ca68`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/mauro3/Parameters.jl/tarball/34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/mauro3/SimpleTraits.jl/tarball/be8eeac05ec97d379347584fa9fe2f5f76795bcb`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/mauro3/UnPack.jl/tarball/387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/org-arl/SignalAnalysis.jl/tarball/a9f9b846649b264f2eca91049ab35e44c533f62a`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/queryverse/DataValueInterfaces.jl/tarball/bfc1187b79289637fa0ef6d4436ebdfe6905cbd6`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/queryverse/IteratorInterfaceExtensions.jl/tarball/a3f24677c21f5bbe9d2a714f95dcd58337fb2856`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/queryverse/TableTraits.jl/tarball/c06b2f539df1c6efa794486abfb6ed2022561a39`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/quinnj/JSON3.jl/tarball/411eccfe8aba0814ffa0fdf4860913ed09c34975`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/rdeits/CommonSubexpressions.jl/tarball/cda2cfaebb4be89c9084adaca7dd7333369715c5`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/rfourquet/BitIntegers.jl/tarball/091d591a060e43df1dd35faab3ca284925c48e46`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/rofinn/FilePathsBase.jl/tarball/3bab2c5aa25e7840a4b065805c0cdfc01f3068d2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (http block)
> - `https://api.github.com/repos/ronisbr/PrettyTables.jl/tarball/c5a07210bd060d6a8491b0ccdee2fa0235fc00bf`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/ronisbr/StringManipulation.jl/tarball/a3c1536470bf8c5e02096ad4853606d7c8f62721`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/simonster/Reexport.jl/tarball/45e428421666073eab6f2da5c9d310d99bb12f9b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/timholy/AxisAlgorithms.jl/tarball/01b8ccb13d68535d73d2b0c23e39bd23155fb712`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/timholy/ComputationalResources.jl/tarball/52cb3ec90e8a8bea0e62e275ba577ad0f74821f7`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/timholy/PositiveFactorizations.jl/tarball/17275485f373e6673f7e7f97051f703ed5b15b20`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/timholy/ProgressMeter.jl/tarball/fbb92c6c56b34e1a2c4c36058f68f332bec840e7`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/timholy/Ratios.jl/tarball/1342a47bf3260ee108163042310d26f2be5ec90b`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/unfoldtoolbox/UnfoldSim.jl/tarball/8a4eeeec174d05b8488e5ee1f166309a06bbbe69`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/vchuravy/HashArrayMappedTries.jl/tarball/2eaa69a7cab70a52b9687c8bf950a5a93ec895ae`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `https://api.github.com/repos/vtjnash/Glob.jl/tarball/83cb0092e2792b9e3a865b6655e88f5b862607e2`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (http block)
> - `pkg.julialang.org`
>   - Triggering command: `/usr/bin/julia julia --project=. -e using Pkg; Pkg.test(&#34;Unfold&#34;; test_args=[&#34;utilities&#34;])` (dns block)
>   - Triggering command: `/usr/local/julia1.12.4/bin/julia /usr/local/julia1.12.4/bin/julia -C native -J/usr/local/julia1.12.4/lib/julia/sys.so -g1 --output-o /home/REDACTED/.julia/compiled/v1.12/MKL_jll/jl_5Mo0WI --output-ji /home/REDACTED/.julia/compiled/v1.12/MKL_jll/jl_zdSKui --output-incremental=yes --startup-file=no --history-file=no --warn-overwrite=yes --color=yes -` (dns block)
>   - Triggering command: `/usr/bin/julia julia --project=./test -e
using Pkg
Pkg.instantiate()
 --warn-overwrite=yes --color=yes -` (dns block)
>
> If you need me to access, download, or install something from one of these locations, you can either:
>
> - Configure [Actions setup steps](https://gh.io/copilot/actions-setup-steps) to set up my environment, which run before the firewall is enabled
> - Add the appropriate URLs or hosts to the custom allowlist in this repository's [Copilot coding agent settings](https://github.com/unfoldtoolbox/Unfold.jl/settings/copilot/coding_agent) (admins only)
>
> </details>

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93c74ead54e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.