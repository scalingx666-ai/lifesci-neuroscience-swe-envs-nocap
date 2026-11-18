# Issue

**Title:** Help with cracks in large meshes when switching between resolutions in neuroglancer

## Description

Hello!

We (myself and @aranega) were using igneous to convert some meshes to neuroglancer precomputed format, and we noticed some cracks could appear in neuroglancer in the mesh when switching between resolutions for the mesh in neuroglancer.

If you load just one LOD in neuroglancer the mesh was fine, but when neuroglancer tried to load a low res mesh first and then start filling in certain parts of the octree with a higher res mesh there could be cracks that appear in neuroglancer.

When we looked into it, it appeared to be because the triangles from the low res mesh could cross the bounds in the octree at the lower levels of the tree, which meant neuroglancer couldn't correctly remove all the triangles from the low res mesh when loading a higher res mesh. Here's a comparison with/without this patch here to address that (blue = patched, yellow = original):
![image](https://github.com/user-attachments/assets/d666357f-5d1c-4b07-9eb3-996bcd1bf5b9)
![image](https://github.com/user-attachments/assets/a5d875a5-89d9-4654-9a75-4ad920b4f174)

And they are very similar if you force the highest or lowest LOD
![image](https://github.com/user-attachments/assets/1425e035-7938-4b70-836a-b4b3b5ba28d5)

So we changed this by forcing the triangles to be cutoff at the bounds of the octree at the next level of the tree, exactly the same way the submeshes are being computed (could refactor to have a separate function which both call if of interest). There's also one other change here, which is to compute the bounds of the mesh from the maximal over all LODs. We had some cases where LODX could be outside the bounds of the original mesh by a voxel.

It's entirely possible that we're missing something in how to use igneous, in which case, apologies for the noise. However, this change here was very helpful for us in processing meshes. We've created a script which reproduces this with a large sphere and included that here in case this change is helpful for igneous.

Happy to expand on anything here, and thank you very much!

## Reproducing this and trying the patch

This bash script should do the whole lot, installing the patched/original igneous pipeline, running the conversion, and making a small CORS server to view the locally created meshes. Should be run with a python env or conda env already activated as it calls `pip`:
```bash
SPECIFIC_URL="https://neuroglancer-demo.appspot.com/#!%7B%22dimensions%22:%7B%22x%22:%5B2e-8%2C%22m%22%5D%2C%22y%22:%5B2e-8%2C%22m%22%5D%2C%22z%22:%5B4e-8%2C%22m%22%5D%7D%2C%22position%22:%5B1020.2938842773438%2C508.11944580078125%2C305.6950988769531%5D%2C%22crossSectionScale%22:1%2C%22projectionOrientation%22:%5B-0.17969447374343872%2C-0.23714053630828857%2C-0.0713435634970665%2C0.9520422220230103%5D%2C%22projectionScale%22:1516%2C%22layers%22:%5B%7B%22type%22:%22segmentation%22%2C%22source%22:%7B%22url%22:%22http://127.0.0.1:8080/test_no_patch/%7Cneuroglancer-precomputed:%22%2C%22transform%22:%7B%22matrix%22:%5B%5B1%2C0%2C0%2C1024%5D%2C%5B0%2C1%2C0%2C0%5D%2C%5B0%2C0%2C1%2C0%5D%5D%2C%22outputDimensions%22:%7B%22x%22:%5B2e-8%2C%22m%22%5D%2C%22y%22:%5B2e-8%2C%22m%22%5D%2C%22z%22:%5B4e-8%2C%22m%22%5D%7D%7D%2C%22subsources%22:%7B%22default%22:true%2C%22mesh%22:true%7D%2C%22enableDefaultSubsources%22:false%7D%2C%22tab%22:%22rendering%22%2C%22annotationColor%22:%22#ff006f%22%2C%22hoverHighlight%22:false%2C%22meshRenderScale%22:17.988638396135663%2C%22segments%22:%5B%221%22%5D%2C%22segmentQuery%22:%221%22%2C%22segmentDefaultColor%22:%22#ffe74d%22%2C%22name%22:%22test_no_patch%20%28yellow%29%22%7D%2C%7B%22type%22:%22segmentation%22%2C%22source%22:%7B%22url%22:%22http://127.0.0.1:8080/test_patch/%7Cneuroglancer-precomputed:%22%2C%22subsources%22:%7B%22default%22:true%2C%22mesh%22:true%7D%2C%22enableDefaultSubsources%22:false%7D%2C%22tab%22:%22rendering%22%2C%22annotationColor%22:%22#00fffb%22%2C%22hoverHighlight%22:false%2C%22meshRenderScale%22:5.574619126417438%2C%22segments%22:%5B%221%22%5D%2C%22segmentQuery%22:%221%22%2C%22segmentDefaultColor%22:%22#00b3ff%22%2C%22name%22:%22test_patch%20%28blue%29%22%7D%5D%2C%22showAxisLines%22:false%2C%22showSlices%22:false%2C%22selectedLayer%22:%7B%22layer%22:%22test_patch%20%28blue%29%22%7D%2C%22layout%22:%223d%22%2C%22toolPalettes%22:%7B%22Palette%22:%7B%22row%22:2%2C%22tools%22:%5B%7B%22layer%22:%22test_patch%20%28blue%29%22%2C%22type%22:%22meshRenderScale%22%7D%2C%7B%22layer%22:%22test_no_patch%20%28yellow%29%22%2C%22type%22:%22meshRenderScale%22%7D%5D%7D%7D%7D"

echo "Downloading script from GitHub gists"
curl https://gist.githubusercontent.com/seankmartin/3247e2e67768a7a987e3f748004b111d/raw/df6b6291e229df9057f5c3bbfbbbf3d1f1050c2b/minimal_igneous.py > minimal_igneous.py
echo

echo "Install base igneous"
pip install git+https://github.com/seung-lab/igneous.git
echo

echo "Convert to precomputed format with igneous..."
python minimal_igneous.py test_no_patch
echo

echo "Install patched igneous"
pip install git+https://github.com/MetaCell/igneous.git@feat/patch-octree
echo

echo "Convert to precomputed format with patched igneous..."
python minimal_igneous.py test_patch
echo

echo "Please navigate to this URL: $SPECIFIC_URL"

echo "Launch node server with support for range requests..."
npx http-server test_mesh/ --cors=authorization
echo
```

The minimal igneous script is available on [github gists](https://gist.github.com/seankmartin/3247e2e67768a7a987e3f748004b111d), but including it here too for completeness

```Python
from pathlib import Path
from argparse import ArgumentParser

import igneous.task_creation as tc
from taskqueue import LocalTaskQueue
import numpy as np
from cloudvolume import CloudVolume

# Reduce the shape if you have memory issues -- but problem
# tends to be more visible with larger meshes
def generate_basic_object(output_path, shape=(1024, 1024, 512), radius=0.8):
    x = np.linspace(-1, 1, shape[0])
    y = np.linspace(-1, 1, shape[1])
    z = np.linspace(-1, 1, shape[2])
    xx, yy, zz = np.meshgrid(x, y, z, indexing="ij")

    sphere = xx**2 + yy**2 + zz**2 <= radius**2
    sphere = sphere.astype(np.uint32)

    CloudVolume.from_numpy(
        sphere,
        vol_path=output_path,
        resolution=(20, 20, 40),
        chunk_size=(256, 256, 128),
        layer_type="segmentation",
        progress=True,
        compress=False,
    )


def convert(layer_path, num_lod):
    tq = LocalTaskQueue()
    tasks = tc.create_meshing_tasks(
        layer_path,
        mip=0,
        shape=(256, 256, 256),
        sharded=True,
        fill_missing=True,
        max_simplification_error=10,
        simplification=True,
        mesh_dir="mesh",
    )
    tq.insert(tasks)
    tq.execute()

    tasks = tc.create_mesh_manifest_tasks(
        layer_path,
        magnitude=3,
        mesh_dir="mesh",
    )
    tq.insert(tasks)
    tq.execute()

    tasks = tc.create_sharded_multires_mesh_tasks(
        layer_path,
        num_lod=num_lod,
        min_chunk_size=(32, 32, 16),
        mesh_dir="mesh",
    )
    tq.insert(tasks)
    tq.execute()


def clean_mesh_folder(output_path: str | Path, mesh_directory: str = "mesh"):
    """Remove unnecessary files from the mesh folder

    The conversion produces extra unnecessary files, so we clean up
    The only needed files are the info file, and any file that ends with .shard
    However, if the sharding fails, we may have other files, so we only delete
    If there is at least one shard file
    """
    output_path = Path(output_path)
    mesh_dir = output_path / mesh_directory
    if mesh_dir.exists() and any(f.name.endswith(".shard") for f in mesh_dir.iterdir()):
        for f in mesh_dir.iterdir():
            if f.is_file() and not (f.name == "info" or f.name.endswith(".shard")):
                f.unlink()


def main(output_folder="test_mesh", num_lod=4):
    here = Path(__file__).parent
    output_path = here / "test_mesh" / output_folder
    output_cloudvolume = f"file://{output_path.resolve()}"
    generate_basic_object(output_path=output_cloudvolume)
    convert(output_cloudvolume, num_lod)
    clean_mesh_folder(output_path=output_path)


if __name__ == "__main__":
    parser = ArgumentParser(
        description="Generate a basic object and convert it to mesh."
    )
    parser.add_argument(
        "output_folder",
        type=str,
        default="test_mesh",
        help="Output folder for the mesh.",
    )
    parser.add_argument(
        "--num_lod",
        type=int,
        default=4,
        help="Number of levels of detail for the mesh.",
    )
    args = parser.parse_args()
    main(output_folder=args.output_folder, num_lod=args.num_lod)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e79078a51f25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.