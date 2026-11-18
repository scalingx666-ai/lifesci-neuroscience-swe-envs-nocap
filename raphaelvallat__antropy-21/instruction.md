# Issue

**Title:** Fixed division by zero in linear regresion function (with test)

## Description

Hi,

Just extending the information provided in the previous PR (), I provide a serie of screenshots about the problem I was facing when computing the detrended fluctuation of my signals. 

See below one of the segments of my signal where the method fails:

![Screenshot from 2022-11-17 08-24-32](https://user-images.githubusercontent.com/9532966/202382408-352981a9-322c-4f65-9e6d-6c4631d592f9.png)

Results of the tests with this signal:
![Screenshot from 2022-11-17 08-36-07](https://user-images.githubusercontent.com/9532966/202382896-42d6c409-5e04-4345-bcee-e2a07ab190b4.png)

After the proposed solution:
![Screenshot from 2022-11-17 09-27-52](https://user-images.githubusercontent.com/9532966/202383175-17ec5059-37d2-4ff9-b138-8ee4a33ebc90.png)

I hope these new commits and test help to clarify the issue.

Thanks,
Tino

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88fea895dc46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.