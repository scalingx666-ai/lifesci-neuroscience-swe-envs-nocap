# Issue

**Title:** improve python example

## Description

There are some improvement for python examples as below:

1. Validate clientId and clientSecret before using. Throw an exception if user set an invalid information
2. Replace websocket.create_connection() by websocket.WebSocketApp()  to help handle response message more easily
3. Use callbacks function instead of waiting response in while loop
4. Handle some error and warnings related to headset connection and profile to fix issues which customer raised before
5. Remove async folder because they are lack of many APIs and  cause confused. 
6. Refactor all examples
7. Add more optional parameters for createRecord, exportRecord api

Please help to review. Thanks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70469dba6303`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.