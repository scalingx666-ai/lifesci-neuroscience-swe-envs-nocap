# Issue

**Title:** [MRG] FIX:  make screenshot() before starting movie

## Description

I sometimes get an issue where the first `screenshot()` is returned at a different resolution (traceback below). If this is not just my system then this PR would fix that.

```
In [6]: brain.save_movie('R2262-loosetttt.mov', time_dilation=.004)
WARNING:root:IMAGEIO FFMPEG_WRITER WARNING: input image is not divisible by macro_block_size=16, resizing from (739, 800) to (752, 800) to ensure video compatibility with most codecs and players. To prevent resizing, make your input image divisible by the macro_block_size or set the macro_block_size to None (risking incompatibility). You may also see a FFMPEG warning concerning speedloss due to data not being aligned.
---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
<ipython-input-6-ca7ef3819486> in <module>()
----> 1 brain.save_movie('R2262-loosetttt.mov', time_dilation=.004)

/Users/christian/Code/PySurfer/surfer/viz.py in save_movie(self, fname, time_dilation, tmin, tmax, framerate, interpolation, codec, bitrate, **kwargs)
   2253         images = (self.screenshot() for _ in
   2254                   self._iter_time(time_idx, interpolation))
-> 2255         imageio.mimwrite(fname, images, **kwargs)
   2256
   2257     def animate(self, views, n_steps=180., fname=None, use_cache=False,

/Users/christian/anaconda/envs/mayavi/lib/python2.7/site-packages/imageio/core/functions.pyc in mimwrite(uri, ims, format, **kwargs)
    316
    317             # Add image
--> 318             writer.append_data(im)
    319
    320     # Return a result if there is any

/Users/christian/anaconda/envs/mayavi/lib/python2.7/site-packages/imageio/core/format.pyc in append_data(self, im, meta)
    464             im = asarray(im)
    465             # Call
--> 466             return self._append_data(im, total_meta)
    467
    468         def set_meta_data(self, meta):

/Users/christian/anaconda/envs/mayavi/lib/python2.7/site-packages/imageio/plugins/ffmpeg.pyc in _append_data(self, im, meta)
    559             # Check size of image
    560             if size != self._size:
--> 561                 raise ValueError('All images in a movie should have same size')
    562             if depth != self._depth:
    563                 raise ValueError('All images in a movie should have same '

ValueError: All images in a movie should have same size
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79beb158a734`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.