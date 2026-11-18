# Issue

**Title:** [stat_boxplot] add option to not show outlier

## Description

Hello, 

Thanks a lot for creating this toolbox. This PR is here to add the option to stat_boxplot to not show the outliers. 
The issue arises when displaying a boxplot + jitterpoint, as the outlier will end up being displayed twice.

There is a solution to hide the outliers after, since we have the handle, but I think it's cleaner to be able to not show them (also I often forget to hide them). 

Here is a small example:

```matlab

x=repmat(1:10,1,100);
catx=repmat({'A' 'B' 'C' 'F' 'E' 'D' 'G' 'H' 'I' 'J'},1,100);
y=randn(1,1000)*3;
c=repmat([1 1 1 1 1 1 1 1 1 1    1 1 2 2 2 2 2 3 2 2     2 1 1 2 2 2 2 3 2 3     2 1 1 2 2 2 2 2 2 2],1,25);
y=2+y+x+c*0.5;

clear g
g(1,1)=gramm('x',catx,'y',y,'color',c);
g(1,1).geom_jitter()
g(1,1).stat_boxplot()

g(1,2)=gramm('x',catx,'y',y,'color',c);
g(1,2).geom_jitter()
g(1,2).stat_boxplot('outlier', false)


figure;
g.draw()

```


For the bloxplot, it might actually be nice to have a face_alpha parameter to set the alpha of the box. I often change it to 100% after the draw to see all the point behind the box.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48b178314d83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.