# Issue

**Title:** fix(schema): Drop checks

## Description

Quick .

With `git -c diff.json.textconv="jq ." show`:

```diff
commit 9e6b142c4049074c17951fdb1c76b7dee1d1f7b5
Author: Christopher J. Markiewicz <markiewicz@stanford.edu>
Date:   Wed Jul 22 14:08:12 2026 -0400

    fix(schema): Drop checks

diff --git a/cli/src/schema-1.2.7-datacite.json b/cli/src/schema-1.2.7-datacite.json
index c8a3ce5d0..ab4b148ec 100644
--- a/cli/src/schema-1.2.7-datacite.json
+++ b/cli/src/schema-1.2.7-datacite.json
@@ -10425,28 +10425,15 @@
           "issue": {
             "code": "AUTHORS_AND_CITATION_FILE_MUTUALLY_EXCLUSIVE",
             "level": "error",
-            "message": "{path} file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
+            "message": "'CITATION.cff' file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
           },
           "selectors": [
-            "intersects([path], ['/CITATION.cff', '/datacite.yml'])"
+            "path == '/CITATION.cff'"
           ],
           "checks": [
             "!(\"Authors\" in dataset.dataset_description)"
           ]
         },
-        "SingleSourceDataciteFields": {
-          "issue": {
-            "code": "SINGLE_SOURCE_CITATION_FIELDS",
-            "level": "warning",
-            "message": "datacite.yml file found. The \"License\" field of 'dataset_description.json'\nshould be removed to avoid inconsistency.\n"
-          },
-          "selectors": [
-            "path == '/datacite.yml'"
-          ],
-          "checks": [
-            "!(\"License\" in dataset.dataset_description)"
-          ]
-        },
         "SingleSourceCitationFields": {
           "issue": {
             "code": "SINGLE_SOURCE_CITATION_FIELDS",
diff --git a/packages/openneuro-app/src/scripts/workers/schema-1.2.7-datacite.json b/packages/openneuro-app/src/scripts/workers/schema-1.2.7-datacite.json
index c8a3ce5d0..ab4b148ec 100644
--- a/packages/openneuro-app/src/scripts/workers/schema-1.2.7-datacite.json
+++ b/packages/openneuro-app/src/scripts/workers/schema-1.2.7-datacite.json
@@ -10425,28 +10425,15 @@
           "issue": {
             "code": "AUTHORS_AND_CITATION_FILE_MUTUALLY_EXCLUSIVE",
             "level": "error",
-            "message": "{path} file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
+            "message": "'CITATION.cff' file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
           },
           "selectors": [
-            "intersects([path], ['/CITATION.cff', '/datacite.yml'])"
+            "path == '/CITATION.cff'"
           ],
           "checks": [
             "!(\"Authors\" in dataset.dataset_description)"
           ]
         },
-        "SingleSourceDataciteFields": {
-          "issue": {
-            "code": "SINGLE_SOURCE_CITATION_FIELDS",
-            "level": "warning",
-            "message": "datacite.yml file found. The \"License\" field of 'dataset_description.json'\nshould be removed to avoid inconsistency.\n"
-          },
-          "selectors": [
-            "path == '/datacite.yml'"
-          ],
-          "checks": [
-            "!(\"License\" in dataset.dataset_description)"
-          ]
-        },
         "SingleSourceCitationFields": {
           "issue": {
             "code": "SINGLE_SOURCE_CITATION_FIELDS",
diff --git a/services/datalad/datalad_service/tasks/assets/schema-1.2.7-datacite.json b/services/datalad/datalad_service/tasks/assets/schema-1.2.7-datacite.json
index c8a3ce5d0..ab4b148ec 100644
--- a/services/datalad/datalad_service/tasks/assets/schema-1.2.7-datacite.json
+++ b/services/datalad/datalad_service/tasks/assets/schema-1.2.7-datacite.json
@@ -10425,28 +10425,15 @@
           "issue": {
             "code": "AUTHORS_AND_CITATION_FILE_MUTUALLY_EXCLUSIVE",
             "level": "error",
-            "message": "{path} file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
+            "message": "'CITATION.cff' file found. The \"Authors\" field of 'dataset_description.json'\nmust be removed to avoid inconsistency.\n"
           },
           "selectors": [
-            "intersects([path], ['/CITATION.cff', '/datacite.yml'])"
+            "path == '/CITATION.cff'"
           ],
           "checks": [
             "!(\"Authors\" in dataset.dataset_description)"
           ]
         },
-        "SingleSourceDataciteFields": {
-          "issue": {
-            "code": "SINGLE_SOURCE_CITATION_FIELDS",
-            "level": "warning",
-            "message": "datacite.yml file found. The \"License\" field of 'dataset_description.json'\nshould be removed to avoid inconsistency.\n"
-          },
-          "selectors": [
-            "path == '/datacite.yml'"
-          ],
-          "checks": [
-            "!(\"License\" in dataset.dataset_description)"
-          ]
-        },
         "SingleSourceCitationFields": {
           "issue": {
             "code": "SINGLE_SOURCE_CITATION_FIELDS",
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `968199fc8397`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.