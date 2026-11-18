# Issue

**Title:** Surface Smoothing

## Description

Hello, 

This PR has three objectives: 
- (1) expose the smoothing function so it can be called more  easily from other scripts
- (2) Fix a bug on the computation of the mean distance of the vertex (that was using the binary vertCon as coordinate instead of the vertex coordinate) 
- (3) Smooth each connected region of the surface separately (useful when the mesh density is not the same in all regions)

(2)  
The following figure shows the impact of the error on the distance calculation by plotting the histogram of the distance between two connected vertex and the average used for calculation. For the current version,  the distances can only take 4 values: 0, sqrt(1), sqrt(2), or sqrt(3). Most of them are 0 and not shown. Surprisingly the result ended up being not that far ( 2.29 mm vs. 5.80 mm) -- Note it seems that the more dense the mesh is, the larger the issue is. 


![untitled](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/edb7b2ac-038b-436f-a9b4-79b8c77d1995)


Graph created using the following code: 

```matlab
    figure;
    ax1 = subplot(121);hold on;
    Vertices = SurfaceMat.VertConn;
    [vi,vj] = find(SurfaceMat.VertConn);
    tmp = sqrt((Vertices(vi,1) - Vertices(vj,1)).^2 + (Vertices(vi,2) - Vertices(vj,2)).^2 + (Vertices(vi,3) - Vertices(vj,3)).^2);
    histogram( tmp (tmp > 0 ));
    xline(mean(tmp),'-',sprintf('Mean Distance %.2f mm', 1000* full(mean(tmp))))
    xlim([-0.1 max(xlim(gca))])
    title('Vertices = SurfaceMat.VertConn;')


    ax2 = subplot(122); hold on;
    Vertices = SurfaceMat.Vertices;
    tmp = sqrt((Vertices(vi,1) - Vertices(vj,1)).^2 + (Vertices(vi,2) - Vertices(vj,2)).^2 + (Vertices(vi,3) - Vertices(vj,3)).^2);
    histogram( tmp (tmp > 0 ));
    xline(mean(tmp),'-',sprintf('Mean Distance %.2f mm', 1000* mean(tmp)))
    title('Vertices = SurfaceMat.Vertices;')

```
Note: this might be linked to the issue [JonathanC](https://neuroimage.usc.edu/forums/u/JonathanC) was trying to explain on the forum https://neuroimage.usc.edu/forums/t/spatial-smoothing-process-modification/11157/13 

(3)  Actually, I think it would be nice to find a solution that is not working based on the number of vertexes to smooth as this is not 100% constant across the cortex** and can vary even more if the surface used contains an additional surface with more vertices such as cerebellum or hippocampus. For example, when you merge the mid-surface with the hippocampus, the distribution of distance is as follows: 



![untitled2](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/fd7e5fa8-5533-4d1d-8c97-6d1cd47854ed)

where regions 1 and 2 are from the hippocampus, and regions 3-4 are from the cortex. See the following figure:
So using the same number of vertex for all the regions will lead to a wrong smoothing in some regions. (figure created using: https://gist.github.com/Edouard2laire/70f5124b305432440db348715126d1a1)


![untitled3](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/9f391f14-7f13-491c-9e88-9cd56d5caca4)


Here is the results of different smoothing: 

![Screenshot from 2023-09-20 18-31-19](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/c83e0935-4fd3-47a3-a49b-052a2b8c885b)


From left to right: the original map, the current version, the new version with a fixed FHMW, and the version with an FHWM per region. In this case, surfstat was called with 5.671 edges, 5.641 edges, 2.199 edges, and 2.18 edges. 

The difference between the last two versions is mainly in the hippocampus. 



Regards, 
Edouard

---
## Results with the code in this PR
Visual comparison of the spatial smoothing methods (surface 15k vertices), for two values of FWHM: 3 mm and 30 mm.

For both FWHM, the `Fix-` and `Adaptive-FWHM` methods (in old process) lead to similar results as the mean distance is similar in both hemispheres. These results are also similar to the ones obtained with the `Geodesic distance in edges` method (in new process).

As mentioned by @Edouard2laire, with this FWHM and surface, the bug implementation still gives good results for small FWHM in this surface size. However the bug has a big impact when smoothing with larger FWHM values (in this example surface) or smoothing surfaces with different mean distance (to this example surface). 

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/a834eec4-2c00-43a4-990b-a0ac81355dcb)

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/7f248231-1edf-4d2a-958c-6fcba37b3653)

---
## Impact for NIRS

Please consult

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83e7e9b1c86e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.