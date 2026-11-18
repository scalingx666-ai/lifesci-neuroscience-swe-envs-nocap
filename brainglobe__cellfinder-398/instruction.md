# Issue

**Title:** Optimize cell detection

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**

Our lab has whole cleared brain light sheet images. We previously used Imaris for cell counting but wanted to test open source approaches. When I ran it on our brain (1500 image stack), it seemed to not finish even after a day. Looking closer I saw that cluster splitting is where it stalled because it took too long. Hence I started optimizing the code and ended up with this PR...

**What does this PR do?**

1. It jits more of the cell detection code
2. It optimizes structures to be more efficient
3. Updated `split_cells` to use multiprocessing, which helps when there are a fair number of them.

## How has this PR been tested?

I ran the pipeline upto and including the initial cell detection that generates the points of 300k cells on the whole brain. Then, before the splitting stage I dumped the cell coordinates and parameters used by the pipeline to initialize `VolumeFilter` and then tested with a small subset of those cells using the following script to make sure the number of cells didn't change with each commit.



I also used this code for profiling:

```py
import time
import multiprocessing
import numpy as np
from numba import types, typed, set_num_threads
import cProfile
import pstats
from pstats import SortKey

from brainglobe_utils.cells.cells import Cell
from cellfinder.core.detect.filters.volume.structure_splitting import split_cells
from cellfinder.core.detect.filters.volume.volume_filter import VolumeFilter, sphere_volume


if __name__ == "__main__":
    # set_num_threads(6)
    data = np.load(r"D:\code\cellcount\cellcount\volume_cells.npz", allow_pickle=False)
    unknowns = [(name, data[str(name)]) for name in data["unknowns"]]
    artifacts = [(name, data[str(name)]) for name in data["artifacts"]]
    to_split = [(name, data[str(name)]) for name in data["to_split"]]

    filter = VolumeFilter(
        soma_diameter=7,
        soma_size_spread_factor=1.4,
        n_planes=1555,
        n_locks_release=59,
        save_planes=False,
        plane_directory=None,
        start_plane=1555,
        max_cluster_size=1348,
        outlier_keep=False,
        artifact_keep=False,
        setup_params=(np.zeros((3848, 3222), dtype=np.uint32), 7, 1, 3, 0.6, 0)
    )

    # this is used for the earlier commits
    # maps = filter.cell_detector.coords_maps
    # for key, value in to_split[:1]:
    #     maps[key] = value
    # cells = filter.get_results()
    #
    # for key, value in to_split[:10]:
    #     maps[key] = value

    # use this for final commit
    mp_ctx = multiprocessing.get_context("spawn")
    with mp_ctx.Pool(10) as worker_pool:
        for key, value in to_split[:1]:
            filter.cell_detector.add_points(key, value)
        cells = filter.get_results(worker_pool)
        filter.cell_detector.coords_maps.clear()

        for key, value in to_split[:20]:
            filter.cell_detector.add_points(key, value)

        ts = time.perf_counter()
        # cProfile.run("cells = filter.get_results(worker_pool)", "stats_main10")
        cells = filter.get_results(worker_pool)
        # cells = filter.get_results()
        print(f"Elapsed = {time.perf_counter() - ts}, num cells = {len(cells)}")
        # p = pstats.Stats('stats_main10')
        # p.sort_stats(SortKey.TIME).print_stats()
```

## Is this a breaking change?

I don't think so. Like I changed `process` to not call directly `get_results` and `get_results` needs a worker pool arg. But these are really all internal API, not user side API.


## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

Changes
---------

I'm going to list the changes in the order of the commits. There's two measures, the duration measured using `time` and `cprofile` data. And I tested it with 10 clusters.

The duration for `main` branch:

`Elapsed = 19.57954730000347, num cells = 86`

<details>
 <summary> With cProfile</summary>

```
D:\code\cellcount\Scripts\python.exe D:\code\cellcount\cellcount\__init__.py 
D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:34: NumbaTypeSafetyWarning: unsafe cast from int32 to uint64. Precision may be lost.
  d[key] = value
D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:39: NumbaTypeSafetyWarning: unsafe cast from int64 to uint64. Precision may be lost.
  return d[key]
<string>:3: NumbaTypeSafetyWarning: unsafe cast from uint64 to int64. Precision may be lost.
Elapsed = 23.919210099964403, num cells = 86
Tue Apr  9 22:20:08 2024    stats_main10

         232428 function calls (232427 primitive calls) in 0.392 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     4140    0.086    0.000    0.086    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:266(_walk)
     8080    0.083    0.000    0.104    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1129(roll)
      100    0.029    0.000   23.896    0.239 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:45(ball_filter_imgs)
     4340    0.022    0.000    0.128    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:132(append)
     4140    0.014    0.000    0.100    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:170(walk)
     4440    0.013    0.000    0.013    0.000 {method 'astype' of 'numpy.ndarray' objects}
     2400    0.011    0.000    0.033    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:101(_mean)
     4240    0.011    0.000   23.542    0.006 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\boxing.py:59(wrapper)
     8080    0.010    0.000    0.015    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1330(normalize_axis_tuple)
     2766    0.008    0.000    0.008    0.000 {method 'reduce' of 'numpy.ufunc' objects}
       10    0.007    0.001    0.015    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:23(coords_to_volume)
     2100    0.006    0.000    0.008    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:6(get_2d_bins)
     8554    0.006    0.000    0.006    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:685(__init__)
      100    0.005    0.000    0.011    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:6(make_sphere)
     4220    0.004    0.000    0.004    0.000 {built-in method numpy.array}
      100    0.004    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:147(__getitem__)
     4274    0.004    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numba\core\serialize.py:30(_numba_unpickle)
     2400    0.004    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:67(_count_reduce_items)
       10    0.004    0.000   23.900    2.390 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:109(iterative_ball_filter)
     4140    0.003    0.000    0.008    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:163(get_middle_plane)
     8080    0.003    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1380(<listcomp>)
     8080    0.003    0.000    0.003    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1216(<dictcomp>)
     4150    0.003    0.000    0.003    0.000 {method 'copy' of 'numpy.ndarray' objects}
      100    0.003    0.000    0.003    0.000 <string>:2(method)
     2310    0.002    0.000    0.002    0.000 {built-in method numpy.zeros}
      100    0.002    0.000    0.068    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:20(__init__)
     8680    0.002    0.000    0.002    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:125(ready)
    12580    0.002    0.000    0.002    0.000 {built-in method numpy.core._multiarray_umath.normalize_axis_index}
      400    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:139(atleast_3d)
      400    0.002    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:659(dstack)
      300    0.002    0.000    0.042    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:108(<listcomp>)
     4800    0.002    0.000    0.003    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_ufunc_config.py:452(_no_nep50_warning)
    12880    0.002    0.000    0.002    0.000 {built-in method numpy.asanyarray}
     5600    0.002    0.000    0.004    0.000 {built-in method builtins.next}
     2400    0.002    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\contextlib.py:102(__init__)
     2400    0.001    0.000    0.035    0.000 {method 'mean' of 'numpy.ndarray' objects}
      100    0.001    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3050(_bind)
     2100    0.001    0.000    0.040    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:58(binned_mean_2d)
      100    0.001    0.000    0.052    0.001 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:76(bin_mean_3d)
     8554    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:709(max)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:139(__exit__)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:279(helper)
     8180    0.001    0.000    0.001    0.000 {method 'items' of 'dict' objects}
     8080    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:85(empty_like)
      100    0.001    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\base.py:119(__call__)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:130(__enter__)
     8080    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1125(_roll_dispatcher)
     8080    0.001    0.000    0.001    0.000 {built-in method _operator.index}
     2100    0.001    0.000    0.001    0.000 {method 'reshape' of 'numpy.ndarray' objects}
     6160    0.001    0.000    0.001    0.000 {built-in method builtins.isinstance}
      100    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:136(ones)
     4500    0.001    0.000    0.001    0.000 {built-in method math.ceil}
     4800    0.001    0.000    0.001    0.000 {built-in method builtins.issubclass}
     2400    0.000    0.000    0.000    0.000 {method 'set' of '_contextvars.ContextVar' objects}
     2400    0.000    0.000    0.000    0.000 {method 'reset' of '_contextvars.ContextVar' objects}
     2400    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
      300    0.000    0.000    0.000    0.000 {built-in method numpy.arange}
     4344    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
      100    0.000    0.000    0.001    0.000 C:\Prog\Python\Python310\lib\inspect.py:2787(args)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2840(apply_defaults)
       10    0.000    0.000   23.916    2.392 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:164(split_cells)
      310    0.000    0.000    0.000    0.000 {built-in method numpy.empty}
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:71(_wrapreduction)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2177(sum)
       86    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:25(__init__)
      100    0.000    0.000    0.000    0.000 <string>:2(ctor)
        1    0.000    0.000   23.917   23.917 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:137(get_results)
      400    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:655(_dstack_dispatcher)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:207(_arrays_for_stack_dispatcher)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:29(<listcomp>)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2810(kwargs)
     2300    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2699(kind)
       20    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:19(<listcomp>)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:170(<listcomp>)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:146(check_centre_in_cuboid)
  922/921    0.000    0.000    0.000    0.000 {built-in method builtins.len}
      100    0.000    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3181(bind)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:59(_sanitize_position)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2779(__init__)
      400    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:72(<dictcomp>)
      800    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2687(name)
      400    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:3006(parameters)
      100    0.000    0.000    0.000    0.000 {method 'values' of 'mappingproxy' objects}
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:176(__getitem__)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:153(concatenate)
        1    0.000    0.000   23.917   23.917 {built-in method builtins.exec}
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:223(<listcomp>)
      300    0.000    0.000    0.000    0.000 {method 'items' of 'mappingproxy' objects}
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_detection.py:49(get_structure_centre)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:135(_atleast_3d_dispatcher)
      201    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
      120    0.000    0.000    0.000    0.000 {method 'min' of 'numpy.ndarray' objects}
      100    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
      120    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:43(_amin)
       86    0.000    0.000    0.000    0.000 {method 'all' of 'numpy.ndarray' objects}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:37(<listcomp>)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\core\dispatcher.py:858(__get__)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:37(_getitem)
       11    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:909(__iter__)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2172(_sum_dispatcher)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:61(_all)
       60    0.000    0.000    0.000    0.000 {method 'max' of 'numpy.ndarray' objects}
      258    0.000    0.000    0.000    0.000 {built-in method math.isnan}
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:1080(copyto)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:669(result_type)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:198(__len__)
      172    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
       20    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:17(get_shape)
       60    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:39(_amax)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:192(__iter__)
       10    0.000    0.000    0.000    0.000 {built-in method builtins.max}
        2    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:77(_from_meminfo_ptr)
        1    0.000    0.000   23.917   23.917 <string>:1(<module>)
       12    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:166(_typed)
        2    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:88(__new__)
        2    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:107(__init__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:62(_iter)
        3    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1724(isEnabledFor)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:28(<listcomp>)
       24    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:160(_numba_type_)
       20    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:202(sphere_volume)
       10    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:27(_length)
        2    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:149(_parse_arg)
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:840(items)
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1455(debug)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1467(info)
        2    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x00007FFC2BFFC920}
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:862(__init__)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:865(__len__)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```
</details>

---

Replaced accumulation of points in `coords_maps` from stacking each new point on the previous array to using a list of tuples, and each new point is simply added to the list. Also, fixed the types so that we don't get the warnings about type conversions:

`Elapsed = 1.2765582000138238, num cells = 86`

<details>
 <summary> With cProfile</summary>

```
D:\code\cellcount\Scripts\python.exe D:\code\cellcount\cellcount\__init__.py 
Elapsed = 2.038256699917838, num cells = 86
Tue Apr  9 22:32:48 2024    stats_main10

         232321 function calls (232320 primitive calls) in 0.534 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     4140    0.124    0.000    0.124    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:266(_walk)
     8080    0.118    0.000    0.144    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1129(roll)
      100    0.033    0.000    2.006    0.020 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:45(ball_filter_imgs)
     4340    0.031    0.000    0.177    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:132(append)
     2400    0.017    0.000    0.053    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:101(_mean)
     4140    0.017    0.000    0.141    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:170(walk)
     2766    0.015    0.000    0.015    0.000 {method 'reduce' of 'numpy.ufunc' objects}
       10    0.012    0.001    0.024    0.002 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:23(coords_to_volume)
     4241    0.012    0.000    1.519    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\boxing.py:59(wrapper)
     8080    0.012    0.000    0.018    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1330(normalize_axis_tuple)
     4440    0.011    0.000    0.011    0.000 {method 'astype' of 'numpy.ndarray' objects}
     2100    0.009    0.000    0.014    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:6(get_2d_bins)
     8554    0.009    0.000    0.009    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:685(__init__)
     4220    0.008    0.000    0.008    0.000 {built-in method numpy.array}
      100    0.007    0.000    0.014    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:6(make_sphere)
     2400    0.006    0.000    0.008    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:67(_count_reduce_items)
     4140    0.005    0.000    0.013    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:163(get_middle_plane)
      100    0.005    0.000    0.006    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:147(__getitem__)
     4150    0.004    0.000    0.004    0.000 {method 'copy' of 'numpy.ndarray' objects}
     8080    0.004    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1216(<dictcomp>)
     2310    0.004    0.000    0.004    0.000 {built-in method numpy.zeros}
       10    0.004    0.000    2.010    0.201 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:109(iterative_ball_filter)
     4273    0.003    0.000    0.003    0.000 D:\code\cellcount\lib\site-packages\numba\core\serialize.py:30(_numba_unpickle)
     8080    0.003    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1380(<listcomp>)
      300    0.003    0.000    0.068    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:108(<listcomp>)
      100    0.003    0.000    0.102    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:20(__init__)
      400    0.003    0.000    0.003    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:139(atleast_3d)
      400    0.003    0.000    0.006    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:659(dstack)
    12580    0.003    0.000    0.003    0.000 {built-in method numpy.core._multiarray_umath.normalize_axis_index}
     8680    0.002    0.000    0.002    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:125(ready)
     4800    0.002    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_ufunc_config.py:452(_no_nep50_warning)
     2400    0.002    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:102(__init__)
     5600    0.002    0.000    0.006    0.000 {built-in method builtins.next}
    12880    0.002    0.000    0.002    0.000 {built-in method numpy.asanyarray}
     2400    0.002    0.000    0.055    0.000 {method 'mean' of 'numpy.ndarray' objects}
     2400    0.002    0.000    0.005    0.000 C:\Prog\Python\Python310\lib\contextlib.py:139(__exit__)
     8554    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:709(max)
     2100    0.002    0.000    0.065    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:58(binned_mean_2d)
      100    0.002    0.000    0.083    0.001 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:76(bin_mean_3d)
      100    0.002    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3050(_bind)
     2400    0.001    0.000    0.004    0.000 C:\Prog\Python\Python310\lib\contextlib.py:279(helper)
     2100    0.001    0.000    0.001    0.000 {method 'reshape' of 'numpy.ndarray' objects}
     2400    0.001    0.000    0.004    0.000 C:\Prog\Python\Python310\lib\contextlib.py:130(__enter__)
     8180    0.001    0.000    0.001    0.000 {method 'items' of 'dict' objects}
     8080    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:85(empty_like)
     8080    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:1125(_roll_dispatcher)
     8080    0.001    0.000    0.001    0.000 {built-in method _operator.index}
      100    0.001    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\base.py:119(__call__)
     6159    0.001    0.000    0.001    0.000 {built-in method builtins.isinstance}
     4500    0.001    0.000    0.001    0.000 {built-in method math.ceil}
     4800    0.001    0.000    0.001    0.000 {built-in method builtins.issubclass}
     2400    0.001    0.000    0.001    0.000 {method 'set' of '_contextvars.ContextVar' objects}
     2400    0.001    0.000    0.001    0.000 {method 'reset' of '_contextvars.ContextVar' objects}
      100    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:136(ones)
      100    0.001    0.000    0.001    0.000 C:\Prog\Python\Python310\lib\inspect.py:2787(args)
     4344    0.001    0.000    0.001    0.000 {method 'append' of 'list' objects}
      300    0.000    0.000    0.000    0.000 {built-in method numpy.arange}
     2400    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
      100    0.000    0.000    0.001    0.000 C:\Prog\Python\Python310\lib\inspect.py:2840(apply_defaults)
       10    0.000    0.000    2.036    0.204 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:164(split_cells)
       86    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:25(__init__)
      310    0.000    0.000    0.000    0.000 {built-in method numpy.empty}
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2810(kwargs)
        1    0.000    0.000    2.037    2.037 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:137(get_results)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:71(_wrapreduction)
      100    0.000    0.000    0.000    0.000 <string>:2(ctor)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2177(sum)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:207(_arrays_for_stack_dispatcher)
     2300    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2699(kind)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:29(<listcomp>)
       86    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:146(check_centre_in_cuboid)
      400    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:655(_dstack_dispatcher)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:170(<listcomp>)
  922/921    0.000    0.000    0.000    0.000 {built-in method builtins.len}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:59(_sanitize_position)
      400    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
      100    0.000    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3181(bind)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:176(__getitem__)
       20    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:19(<listcomp>)
       10    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:223(<listcomp>)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:72(<dictcomp>)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_detection.py:54(get_structure_centre)
      800    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2687(name)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:153(concatenate)
      100    0.000    0.000    0.000    0.000 {method 'values' of 'mappingproxy' objects}
      300    0.000    0.000    0.000    0.000 {method 'items' of 'mappingproxy' objects}
        1    0.000    0.000    0.000    0.000 <string>:2(method)
      400    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:3006(parameters)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:37(_getitem)
      120    0.000    0.000    0.001    0.000 {method 'min' of 'numpy.ndarray' objects}
        1    0.000    0.000    2.037    2.037 {built-in method builtins.exec}
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2779(__init__)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:135(_atleast_3d_dispatcher)
       86    0.000    0.000    0.000    0.000 {method 'all' of 'numpy.ndarray' objects}
      201    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
      120    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:43(_amin)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:37(<listcomp>)
      100    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:61(_all)
       60    0.000    0.000    0.000    0.000 {method 'max' of 'numpy.ndarray' objects}
      258    0.000    0.000    0.000    0.000 {built-in method math.isnan}
       11    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:909(__iter__)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\core\dispatcher.py:858(__get__)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2172(_sum_dispatcher)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:1080(copyto)
       60    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:39(_amax)
       20    0.000    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:17(get_shape)
      172    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:669(result_type)
        1    0.000    0.000    2.037    2.037 <string>:1(<module>)
       10    0.000    0.000    0.000    0.000 {built-in method builtins.max}
       12    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:166(_typed)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:198(__len__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:192(__iter__)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:28(<listcomp>)
       24    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:160(_numba_type_)
        3    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1724(isEnabledFor)
       20    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:62(_iter)
       10    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:88(__new__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:77(_from_meminfo_ptr)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:107(__init__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:201(sphere_volume)
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1455(debug)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:27(_length)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:149(_parse_arg)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:840(items)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1467(info)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:862(__init__)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:865(__len__)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x00007FFC2BFFC920}
```
</details>

---

Switched to using fortran layout for volume block because we constantly rotate (roll) the last axis - the z-axis, and fortran layout is column major order which is faster for rotating that axis.

`Elapsed = 1.227499600034207, num cells = 86`

<details>
 <summary> With cProfile</summary>

```
D:\code\cellcount\Scripts\python.exe D:\code\cellcount\cellcount\__init__.py 
Elapsed = 1.2761926999082789, num cells = 86
Tue Apr  9 22:37:51 2024    stats_main10

         151521 function calls (151520 primitive calls) in 0.224 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     4140    0.078    0.000    0.078    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:266(_walk)
     4340    0.019    0.000    0.020    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:135(append)
      100    0.017    0.000    1.260    0.013 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:45(ball_filter_imgs)
     2400    0.009    0.000    0.029    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:101(_mean)
     4140    0.009    0.000    0.087    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:170(walk)
     2766    0.007    0.000    0.007    0.000 {method 'reduce' of 'numpy.ufunc' objects}
     4241    0.006    0.000    1.059    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\boxing.py:59(wrapper)
     4440    0.006    0.000    0.006    0.000 {method 'astype' of 'numpy.ndarray' objects}
       10    0.005    0.001    0.011    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:23(coords_to_volume)
     2100    0.005    0.000    0.007    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:6(get_2d_bins)
     8554    0.005    0.000    0.005    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:685(__init__)
      100    0.004    0.000    0.008    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:6(make_sphere)
     4150    0.003    0.000    0.003    0.000 {method 'copy' of 'numpy.ndarray' objects}
      100    0.003    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:147(__getitem__)
     2400    0.003    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:67(_count_reduce_items)
     4140    0.003    0.000    0.005    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:163(get_middle_plane)
     4220    0.002    0.000    0.002    0.000 {built-in method numpy.array}
       10    0.002    0.000    1.262    0.126 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:109(iterative_ball_filter)
      400    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:139(atleast_3d)
      100    0.002    0.000    0.058    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:20(__init__)
     4273    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numba\core\serialize.py:30(_numba_unpickle)
      400    0.002    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:659(dstack)
     2310    0.002    0.000    0.002    0.000 {built-in method numpy.zeros}
     4800    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_ufunc_config.py:452(_no_nep50_warning)
      300    0.001    0.000    0.037    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:108(<listcomp>)
     2400    0.001    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\contextlib.py:102(__init__)
     5600    0.001    0.000    0.004    0.000 {built-in method builtins.next}
     2100    0.001    0.000    0.036    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:58(binned_mean_2d)
     8680    0.001    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:128(ready)
      100    0.001    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3050(_bind)
     2400    0.001    0.000    0.031    0.000 {method 'mean' of 'numpy.ndarray' objects}
      100    0.001    0.000    0.046    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\array_operations.py:76(bin_mean_3d)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:139(__exit__)
     8554    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:709(max)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:279(helper)
     2400    0.001    0.000    0.003    0.000 C:\Prog\Python\Python310\lib\contextlib.py:130(__enter__)
      100    0.001    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\base.py:119(__call__)
     2100    0.001    0.000    0.001    0.000 {method 'reshape' of 'numpy.ndarray' objects}
     6159    0.001    0.000    0.001    0.000 {built-in method builtins.isinstance}
     4500    0.001    0.000    0.001    0.000 {built-in method numpy.core._multiarray_umath.normalize_axis_index}
     4500    0.001    0.000    0.001    0.000 {built-in method math.ceil}
     4800    0.001    0.000    0.001    0.000 {built-in method builtins.issubclass}
     4800    0.001    0.000    0.001    0.000 {built-in method numpy.asanyarray}
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:136(ones)
     2400    0.000    0.000    0.000    0.000 {method 'set' of '_contextvars.ContextVar' objects}
      100    0.000    0.000    0.001    0.000 C:\Prog\Python\Python310\lib\inspect.py:2787(args)
     4344    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
     2400    0.000    0.000    0.000    0.000 {method 'reset' of '_contextvars.ContextVar' objects}
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2840(apply_defaults)
     2400    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
      300    0.000    0.000    0.000    0.000 {built-in method numpy.arange}
       86    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:25(__init__)
       10    0.000    0.000    1.274    0.127 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:164(split_cells)
      310    0.000    0.000    0.000    0.000 {built-in method numpy.empty}
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:71(_wrapreduction)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2810(kwargs)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:207(_arrays_for_stack_dispatcher)
        1    0.000    0.000    1.275    1.275 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:137(get_results)
     2300    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2699(kind)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\tools\geometry.py:29(<listcomp>)
      100    0.000    0.000    0.000    0.000 <string>:2(ctor)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2177(sum)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\shape_base.py:655(_dstack_dispatcher)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:146(check_centre_in_cuboid)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\lib\index_tricks.py:170(<listcomp>)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:59(_sanitize_position)
  922/921    0.000    0.000    0.000    0.000 {built-in method builtins.len}
      400    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
      100    0.000    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3181(bind)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:72(<dictcomp>)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:176(__getitem__)
      800    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2687(name)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:153(concatenate)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:223(<listcomp>)
      400    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:3006(parameters)
      400    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\shape_base.py:135(_atleast_3d_dispatcher)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_detection.py:54(get_structure_centre)
       20    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:19(<listcomp>)
      100    0.000    0.000    0.000    0.000 {method 'values' of 'mappingproxy' objects}
      300    0.000    0.000    0.000    0.000 {method 'items' of 'mappingproxy' objects}
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:37(_getitem)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2779(__init__)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:37(<listcomp>)
      120    0.000    0.000    0.000    0.000 {method 'min' of 'numpy.ndarray' objects}
       86    0.000    0.000    0.000    0.000 {method 'all' of 'numpy.ndarray' objects}
        1    0.000    0.000    1.275    1.275 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 <string>:2(method)
      100    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:61(_all)
      120    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:43(_amin)
      201    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
       11    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:909(__iter__)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\core\dispatcher.py:858(__get__)
      258    0.000    0.000    0.000    0.000 {built-in method math.isnan}
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:1080(copyto)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2172(_sum_dispatcher)
      172    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
       60    0.000    0.000    0.000    0.000 {method 'max' of 'numpy.ndarray' objects}
      100    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
        1    0.000    0.000    1.275    1.275 <string>:1(<module>)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:669(result_type)
       20    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:17(get_shape)
       60    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:39(_amax)
       10    0.000    0.000    0.000    0.000 {built-in method builtins.max}
       12    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:166(_typed)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:198(__len__)
       24    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:160(_numba_type_)
       10    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:28(<listcomp>)
       20    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:88(__new__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:192(__iter__)
        3    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1724(isEnabledFor)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:62(_iter)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:77(_from_meminfo_ptr)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:107(__init__)
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1455(debug)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:201(sphere_volume)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:149(_parse_arg)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:27(_length)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:840(items)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1467(info)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:865(__len__)
        1    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x00007FFC2C14C920}
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:862(__init__)
```
</details>

---

Used an lru-cache for the computing the kernel. 

`Elapsed = 1.1849509000312537, num cells = 86`

<details>
 <summary> With cProfile</summary>

```
D:\code\cellcount\Scripts\python.exe D:\code\cellcount\cellcount\__init__.py 
Elapsed = 1.2268906999379396, num cells = 86
Tue Apr  9 22:40:04 2024    stats_main10

         74721 function calls (74720 primitive calls) in 0.167 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     4140    0.079    0.000    0.079    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:275(_walk)
     4340    0.019    0.000    0.019    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:144(append)
      100    0.017    0.000    1.211    0.012 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:45(ball_filter_imgs)
     4140    0.009    0.000    0.088    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:179(walk)
     4241    0.006    0.000    1.067    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\boxing.py:59(wrapper)
       10    0.005    0.001    0.011    0.001 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:23(coords_to_volume)
     4340    0.005    0.000    0.005    0.000 {method 'astype' of 'numpy.ndarray' objects}
     8554    0.004    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:685(__init__)
     4150    0.003    0.000    0.003    0.000 {method 'copy' of 'numpy.ndarray' objects}
     4220    0.002    0.000    0.002    0.000 {built-in method numpy.array}
     4140    0.002    0.000    0.005    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:172(get_middle_plane)
       10    0.002    0.000    1.213    0.121 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:109(iterative_ball_filter)
     4273    0.002    0.000    0.002    0.000 D:\code\cellcount\lib\site-packages\numba\core\serialize.py:30(_numba_unpickle)
      100    0.001    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3050(_bind)
     8680    0.001    0.000    0.001    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:137(ready)
      100    0.001    0.000    0.002    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\ball_filter.py:65(__init__)
     8554    0.001    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\getlimits.py:709(max)
      366    0.001    0.000    0.001    0.000 {method 'reduce' of 'numpy.ufunc' objects}
      100    0.001    0.000    0.004    0.000 D:\code\cellcount\lib\site-packages\numba\experimental\jitclass\base.py:119(__call__)
      110    0.000    0.000    0.000    0.000 {built-in method numpy.zeros}
      100    0.000    0.000    0.001    0.000 C:\Prog\Python\Python310\lib\inspect.py:2787(args)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2840(apply_defaults)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\numeric.py:136(ones)
       10    0.000    0.000    1.225    0.123 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:164(split_cells)
       86    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:25(__init__)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2810(kwargs)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:71(_wrapreduction)
      100    0.000    0.000    0.001    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2177(sum)
        1    0.000    0.000    1.226    1.226 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:137(get_results)
      310    0.000    0.000    0.000    0.000 {built-in method numpy.empty}
     2300    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2699(kind)
      100    0.000    0.000    0.000    0.000 <string>:2(ctor)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:146(check_centre_in_cuboid)
      800    0.000    0.000    0.000    0.000 {built-in method builtins.next}
     1344    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:59(_sanitize_position)
      100    0.000    0.000    0.002    0.000 C:\Prog\Python\Python310\lib\inspect.py:3181(bind)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:72(<dictcomp>)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:176(__getitem__)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:223(<listcomp>)
      800    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2687(name)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_detection.py:54(get_structure_centre)
      359    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
      120    0.000    0.000    0.000    0.000 {method 'min' of 'numpy.ndarray' objects}
      300    0.000    0.000    0.000    0.000 {method 'items' of 'mappingproxy' objects}
       20    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:19(<listcomp>)
      100    0.000    0.000    0.000    0.000 {method 'values' of 'mappingproxy' objects}
      400    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:3006(parameters)
       86    0.000    0.000    0.000    0.000 {method 'all' of 'numpy.ndarray' objects}
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\brainglobe_utils\cells\cells.py:37(<listcomp>)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:37(_getitem)
      100    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\inspect.py:2779(__init__)
      201    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
        1    0.000    0.000    1.226    1.226 {built-in method builtins.exec}
      120    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:43(_amin)
       86    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:61(_all)
       11    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:909(__iter__)
        1    0.000    0.000    0.000    0.000 <string>:2(method)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\core\dispatcher.py:858(__get__)
      258    0.000    0.000    0.000    0.000 {built-in method math.isnan}
  122/121    0.000    0.000    0.000    0.000 {built-in method builtins.len}
       60    0.000    0.000    0.000    0.000 {method 'max' of 'numpy.ndarray' objects}
      100    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
      100    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\fromnumeric.py:2172(_sum_dispatcher)
      100    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\multiarray.py:1080(copyto)
      172    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
       20    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:17(get_shape)
        1    0.000    0.000    1.226    1.226 <string>:1(<module>)
       60    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numpy\core\_methods.py:39(_amax)
       10    0.000    0.000    0.000    0.000 {built-in method builtins.max}
       12    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:166(_typed)
       10    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\structure_splitting.py:28(<listcomp>)
       20    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
       10    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
       24    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:160(_numba_type_)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:198(__len__)
        3    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1724(isEnabledFor)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:88(__new__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:192(__iter__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:62(_iter)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:77(_from_meminfo_ptr)
        2    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1455(debug)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\cellfinder\cellfinder\core\detect\filters\volume\volume_filter.py:201(sphere_volume)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:107(__init__)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:27(_length)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:840(items)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\logging\__init__.py:1467(info)
        1    0.000    0.000    0.000    0.000 D:\code\cellcount\lib\site-packages\numba\typed\typeddict.py:149(_parse_arg)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:862(__init__)
        1    0.000    0.000    0.000    0.000 C:\Prog\Python\Python310\lib\_collections_abc.py:865(__len__)
        1    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x00007FFC2C14C920}
```
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6a887f1721b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.