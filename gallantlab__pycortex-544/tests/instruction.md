# Issue

**Title:** FIX avoid using jQuery for getting numpy arrays

## Description

This was a nasty 🪲. To visualize a Vertex/VertexRGB object in a static viewer, the `NParray.fromURL` method in `datamodel.js` was using jQuery to fetch the numpy array with the data. However, jQuery by default serializes any type of data and so the binary buffer was automatically encoded as a string. This automatic serialization caused issues when a float32 array was saved (see below for an example.)

This PR completely rewrites the `NParray.fromURL` method to use an `XMLHttpRequest` instead of jQuery. In this way the buffer can be fetched as an arraybuffer, and all the portions of the buffer (header/data) can be decoded appropriately.

## Example code

```python
import cortex

vtx = cortex.Vertex.random("fsaverage")
cortex.webgl.make_static(
    outpath="test-viewer",
    data=vtx,
    recache=True,
)
```

```bash
python minimal-example-error.py && cd test-viewer && python -m http.server 23423
```

### Before
![image](https://github.com/gallantlab/pycortex/assets/6150554/68c38980-0bc8-47fa-990d-43a953155a57)


### After
![image](https://github.com/gallantlab/pycortex/assets/6150554/18837f96-49cc-47b6-8a5c-680d0e735bf4)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96bb47100629`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.