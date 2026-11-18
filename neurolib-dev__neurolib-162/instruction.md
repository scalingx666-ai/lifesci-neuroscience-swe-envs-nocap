# Issue

**Title:** Stimulus: Concatenated vs. Summed

## Description

Beast-mode for stimuli:
```python
ou = OrnsteinUhlenbeckProcess(mu=0.1, sigma=0.2, tau=2.0, num_iid=2)
sq = SquareInput(amplitude=0.2, period=60.0, num_iid=2)
sin = SinusoidalInput(amplitude=0.7, period=100.0, num_iid=2)
```
![image](https://user-images.githubusercontent.com/6525217/121514143-fdf32500-c9eb-11eb-8fb7-35656fa87624.png)

### Sum
```python
summed = ou + sq + sin
```
![image](https://user-images.githubusercontent.com/6525217/121514280-1feca780-c9ec-11eb-9bdd-ac36f5814823.png)

### Concatenation
#### same length ratios (can use `&`)
```python
conc = ou & sq & sin
```
![image](https://user-images.githubusercontent.com/6525217/121516038-149a7b80-c9ee-11eb-8d5f-c8865a04c482.png)

#### different length ratios (only class init)
```python
conc = ConcatenatedInput([ou, sq, sin], length_ratios=[1, 2, 3])
```
![image](https://user-images.githubusercontent.com/6525217/121516225-457ab080-c9ee-11eb-808e-7830f0cb1823.png)

### All together
```python
beast = (ou + sq) & (sq + sin)
```
![image](https://user-images.githubusercontent.com/6525217/121516411-76f37c00-c9ee-11eb-93db-032030b9e12c.png)

```python
beast = ConcatenatedInput([ou + sq, ou + sin], [2, 5])
```
![image](https://user-images.githubusercontent.com/6525217/121516657-c3d75280-c9ee-11eb-8289-ba9fa41bd387.png)

And so on...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90b868ebb31a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.