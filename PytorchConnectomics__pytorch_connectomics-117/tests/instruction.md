# Issue

**Title:** Dataset analysis functions

## Description

Added three functions for dataset analysis:
 
```python3
def voxel_instance_size(target: np.ndarray, ds_name: str) -> pd.DataFrame:
    ''' Calculate the voxel based size of each instance in an instance segmentation map.

        Args:
            target: The target data as numpy ndarray
            ds_name: Name of the dataset, saved in pd column

        Return
            A single column Panda data frame that contains the voxel-based instance sizes.
    '''
```

```python3
def distance_nn(target: np.ndarray, ds_name: str, iso=[1, 1, 1]) -> pd.DataFrame:
    ''' Caculate the distance to the NN for each instance in the target matrix. 

        Args:
            target: The target data as numpy ndarray
            iso: Axis scaling factor in case of anisotropy
            ds_name: Name of the dataset, saved in pd column

        Return
            A single column Panda data frame that contains the distance of each instance to its NN
    '''
```
```python3
def pixel_intensity(source: np.ndarray, target: np.ndarray, bOrF: str, ds_name: str) -> pd.DataFrame:
    ''' Retrives the intesity of each pixel. Writes them to a Pandas data frame.
        Can handle background for foreground.
        Args:
            source: Source numpy ndarray
            target: Target numpy ndarray
            bOrF: Either 'Foreground' or 'Background', indicates which intensities to estimate
            ds_name: Name of the dataset, saved in pd column

        Return
            A pandas frame with the intensity of each pixel, if the pixel belongs to the background
            or foreground, and the dataset it belongs to.
    '''
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e9051eec93d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.