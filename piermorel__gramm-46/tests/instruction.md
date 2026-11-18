# Issue

**Title:** Added more customization options to geom_bar

## Description

As discussed, I added more customization of bars via user input into geom_bar.
Including auto EdgeColor and auto FaceColor (or data-driven color as Pier seems to call it).

Small example script + output:

```
x=[ones(4,1);2*ones(4,1)];
y=rand(8,1);
c=x;
l=[1:4,1:4]';
xc = arrayfun(@num2str,x,'unif',0);

clear g
g=gramm('x',xc,'y',y,'color',c,'lightness',l);
g.set_names('y','','x','');
g.geom_bar('dodge',1.5,'width',1.2,'EdgeColor','auto','FaceColor','none','LineWidth',2);
figure('Position',[100 100 400 300]);
g.draw();

set([g.facet_axes_handles],'YTick',[])
set([g.facet_axes_handles],'YColor',[1 1 1])
set([g.facet_axes_handles],'LineWidth',1)
```

![image](https://user-images.githubusercontent.com/17245881/28169889-f7967680-67e3-11e7-9802-f78e852510df.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e2f3dfb00ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.