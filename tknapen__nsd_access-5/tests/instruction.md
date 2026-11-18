# Issue

**Title:** return coco captions for a list of image indices

## Description

Hi Tomas,

I've had a quick go at implementing this. let me know what you think. 

are there cases in the 73K where the captions don't come from val2017 or train2017?

i've tested it now with the shared1000 and it works. 

```python
nsda = NSDAccess(nsd_dir)

print('collecting indices for the shared 1000')
# get a list of the stim1000 and sort
stim1000_dir = os.path.join(nsd_dir, 'nsddata', 'stimuli', 'nsd', 'shared1000', '*.png')
stim1000 = [os.path.basename(x)[:-4] for x in glob.glob(stim1000_dir)]
stim1000.sort()
stim_ids = [int(re.split('nsd', stim1000[x])[1]) for x, n in enumerate(stim1000)]
print('\t..done')

# Read in captions
print('reading coco captions for the shared 1000')
captions = nsda.read_image_coco_info(stim_ids, info_type='captions', show_annot=False)
```


ian

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0937b800e8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.