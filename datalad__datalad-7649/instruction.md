# Issue

**Title:** BF: replace url for codecov uploader for macos to versioned one with two archs

## Description

Otherwise we have been failing to upload codecov reports on appveyor for awhile.

The https://cli.codecov.io/macos/latest "folder" cannot be used directly -- url there is leading to versioned codecov release so I am using that one. Pros: no surprises.

Solution found at


Here is how two differ:

	❯ wget https://cli.codecov.io/v0.7.4/macos/codecov
    ...
	Length: 22362720 (21M) [application/octet-stream]
	Saving to: ‘codecov’

	codecov                100%[=========================>]  21.33M  81.5MB/s    in 0.3s

	2024-08-30 08:22:04 (81.5 MB/s) - ‘codecov’ saved [22362720/22362720]

	❯ wget https://uploader.codecov.io/latest/macos/codecov
    ...
	Length: 52719456 (50M) [application/octet-stream]
	Saving to: ‘codecov.1’

	codecov.1              100%[=========================>]  50.28M  88.9MB/s    in 0.6s

	2024-08-30 08:22:12 (88.9 MB/s) - ‘codecov.1’ saved [52719456/52719456]

	❯ file codecov*
	codecov:   Mach-O universal binary with 2 architectures: [x86_64:\012- Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>] [\012- arm64:\012- Mach-O 64-bit arm64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>]
	codecov.1: Mach-O 64-bit arm64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0b67ec44f9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.