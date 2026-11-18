# Issue

**Title:** doc: Link to expired deprecation error class in docstrings

## Description

The docstring that reports the anticipated/effective deprecation error class looks like `<class ‘nibabel.deprecator.ExpiredDeprecationError’>` (the `repr()`). e.g.,

![](https://private-user-images.githubusercontent.com/83442/645175082-907747e9-58a8-4853-9fda-5063bd0be01b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3ODgzNzI4MTQsIm5iZiI6MTc4ODM3MjUxNCwicGF0aCI6Ii84MzQ0Mi82NDUxNzUwODItOTA3NzQ3ZTktNThhOC00ODUzLTlmZGEtNTA2M2JkMGJlMDFiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA5MDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwOTAyVDE4MDgzNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTc3ZDQ1NjMyMTRjNTc0YjA1NTBmODNiODc5MmY2ZjdkZTljZDlhOWRiZmZkZTAzZTdiMjA5YTA5YjVmNDVmYjcmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.sn-PFmMhPLS3_R8oTG-ZtTvIGiJZANhQ2IkU0PO47AA)

Given that this is in a docstring that will mostly be rendered, an RST link is more appropriate. 

[Example](https://nibabel-draft--1545.org.readthedocs.build/en/1545/reference/nibabel.casting.html#as-int):

<img width="721" height="325" alt="image" src="https://github.com/user-attachments/assets/b6f4a281-df18-46de-a872-0bb610c97139" />

Edit: In passing cleaned up the formatting of the testsetup/testcleanup blocks. Looks like we fixed the tests but didn't make sure things rendered well in #1315.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `014fc4a952aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.