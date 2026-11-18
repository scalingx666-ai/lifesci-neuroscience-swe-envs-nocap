# Issue

**Title:** NF optimize 4D timeseries performance and add interactive timeseries panel

## Description

While pycortex previously supported 4D data, the implementation was somewhat inefficient and slow. This PR improves the overall speed and algorithms for processing 4D timeseries data and adds a new time-series panel to the pycortex viewer. Additionally, I've included two example scripts to demonstrate these changes. Please take a look and review! #

### Added files
These are example scripts to demonstrate timeseries functionalities
1. `examples/timeseries/README.txt`
2. `examples/timeseries/encoding_model_timeseries.py`
3. `examples/timeseries/rgb_timeseries.py`

### Edited files
1. `cortex/dataset/braindata.py`
	**min/max in to_json (_nan_to_num_bounds() on line 714)**
The original calls np.nan_to_num(data).min() and then .max(). nan_to_num copies the whole array, so this makes two full copies just to read two numbers. For 4D movies, that's several GB allocated, which was a large part of the viewer's startup time. I changed it to walk the array one slice at a time and keep a running min/max. The result is identical because nan_to_num is elementwise and min/max are associative, but only one slice is in memory at a time and the data is converted once instead of twice.
	**hashing**
The original hashes array.tobytes(), which also copies the whole array first (which is the slow part for 4D data). I changed it to hash the array's buffer directly through a memoryview.
5. `cortex/webgl/data.py`
	Packaging renders every frame of a 4D dataset into a PNG mosaic before show() returns. The original implementation took several minutes to load about 500 volumes of a run before the server started. I added a `lazy=True` mode that packs only frame 0 up front and packs the rest in get_image() when the browser or user asks (e.g., clicking the "timeseries" button). The viewer now opens in seconds instead of minutes.
6. `cortex/webgl/view.py`
	**New /timeseries endpoint**
I added a handler that slices the timecourse out of the array Python already holds and returns JSON.
	**Startup order of show()**
Original show() (e.g., webshow()) did all packaging and surface cache work before printing the URL, so the terminal looked frozen on 4D data. I start the server and print the URL first, then run the heavy background work in _prepare(), with handlers waiting on a threading.Event.
	**1D timeseries traces (for design matrix / regressors)**
I pull plain 1D ndarrays out of the show() dict and return them with each timeseries response, so you can pass {"run": vol, "stimulus": regressor} and overlay them.
7. `cortex/webgl/resources/js/dataset.js`
A movie pulls every frame into the browser on page load (requiring a long wait for all volumes). I changed it to load volume (frame) 0 first, stream the rest in the background, and use setPriority() to re-aim the stream at the frame the user jumps to.

8. `cortex/webgl/resources/js/mriview.js`
I added a timeseries button to the movie controls, wired picks to fetch from /timeseries, and added seekFrame() so clicking a timepoint moves the brain. dataBuffersReady now checks that frame 0 exists rather than checking array length, since the texture array is sparse.
9. `cortex/webgl/resources/js/figure.js`
I added a canvas panel for timeseries with a checkbox, a color picker, and a raw / z-scored toggle button.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d2e47143310`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.