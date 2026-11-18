# Issue

**Title:** [raisinbread] Synchronize raisinbread exports

## Description

## Brief summary of changes

This PR synchronizes raisinbread exports. Most of these discrepancies appear to be the result of Raisinbread SQL files being modified manually instead of being regenerated using tools/exporters/DB_dump_table_data.php as described in raisinbread/README.md.

<img width="677" height="229" alt="image" src="https://github.com/user-attachments/assets/7be45ef3-9875-4d6e-92f9-5b1a46f9b28d" />

Note: RB_Config.sql and RB_users.sql were intentionally left unchanged because the only differences are developer-specific values (IP addresses and passwords) that should not be committed. All other SQL files should be updated.

**RB_ephys_browser_file_type.sql:** e.g. sort to stay consistent across all RB tables
```diff
diff --git a/raisinbread/RB_files/RB_ephys_browser_file_type.sql b/raisinbread/RB_files/RB_ephys_browser_file_type.sql
index 1cdafd7c1..5d6f0ad87 100644
--- a/raisinbread/RB_files/RB_ephys_browser_file_type.sql
+++ b/raisinbread/RB_files/RB_ephys_browser_file_type.sql
@@ -1,13 +1,13 @@
 SET FOREIGN_KEY_CHECKS=0;
 TRUNCATE TABLE `ephys_browser_file_type`;
 LOCK TABLES `ephys_browser_file_type` WRITE;
-INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('set');
+INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('archive');
 INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('bdf');
-INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('vhdr');
-INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('vsm');
-INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('edf');
 INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('cnt');
 INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('ctf');
-INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('archive');
+INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('edf');
+INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('set');
+INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('vhdr');
+INSERT INTO `ephys_browser_file_type` (`Type`) VALUES ('vsm');
 UNLOCK TABLES;
 SET FOREIGN_KEY_CHECKS=1;
 ```
 
**RB_media.sql:** e.g. normalize language_id values to integers
```diff
diff --git a/raisinbread/RB_files/RB_media.sql b/raisinbread/RB_files/RB_media.sql
index 59040f7f5..319225dc4 100644
--- a/raisinbread/RB_files/RB_media.sql
+++ b/raisinbread/RB_files/RB_media.sql
@@ -1,32 +1,32 @@
 SET FOREIGN_KEY_CHECKS=0;
 TRUNCATE TABLE `media`;
 LOCK TABLES `media` WRITE;
-INSERT INTO `media` (`id`, `session_id`, `instrument`, `date_taken`, `comments`, `file_name`, `file_type`, `data_dir`, `uploaded_by`, `hide_file`, `last_modified`, `language_id`) VALUES (1,2,NULL,'1001-01-01',NULL,'MTL002_V1.py','text/x-python-script','/data/uploads/','admin',0,'2016-08-11 18:10:57','1');
+INSERT INTO `media` (`id`, `session_id`, `instrument`, `date_taken`, `comments`, `file_name`, `file_type`, `data_dir`, `uploaded_by`, `hide_file`, `last_modified`, `language_id`) VALUES (1,2,NULL,'1001-01-01',NULL,'MTL002_V1.py','text/x-python-script','/data/uploads/','admin',0,'2016-08-11 18:10:57',1);
```
**RB_policiesI18n.sql:** e.g. normalize apostrophe escaping in French translations
```diff
diff --git a/raisinbread/RB_files/RB_policiesI18n.sql b/raisinbread/RB_files/RB_policiesI18n.sql
index feb6a32af..05ca3a1b7 100644
--- a/raisinbread/RB_files/RB_policiesI18n.sql
+++ b/raisinbread/RB_files/RB_policiesI18n.sql
@@ -2,11 +2,11 @@ SET FOREIGN_KEY_CHECKS=0;
 TRUNCATE TABLE `policiesI18n`;
 SET NAMES utf8mb4;
 LOCK TABLES `policiesI18n` WRITE;
-INSERT INTO `policiesI18n` (`PolicyID`, `LanguageID`, `Content`, `SwalTitle`, `HeaderButtonText`, `AcceptButtonText`, `DeclineButtonText`, `CreatedAt`, `UpdatedAt`) VALUES (1, 2, 'En utilisant cet outil de consultation des données, vous reconnaissez qu''il s''agit d''une version bêta et qu''il peut ne pas fonctionner comme prévu. Vous vous engagez également à l''utiliser de manière responsable et à ne pas faire un usage abusif des données.','Conditions d''utilisation','Conditions d''utilisation','Oui, j''accepte','Déclin','2026-05-28 10:54:21','2026-05-28 10:54:21');
+INSERT INTO `policiesI18n` (`PolicyID`, `LanguageID`, `Content`, `SwalTitle`, `HeaderButtonText`, `AcceptButtonText`, `DeclineButtonText`, `CreatedAt`, `UpdatedAt`) VALUES (1,2,'En utilisant cet outil de consultation des données, vous reconnaissez qu\'il s\'agit d\'une version bêta et qu\'il peut ne pas fonctionner comme prévu. Vous vous engagez également à l\'utiliser de manière responsable et à ne pas faire un usage abusif des données.','Conditions d\'utilisation','Conditions d\'utilisation','Oui, j\'accepte','Déclin','2026-05-28 10:54:21','2026-05-28 10:54:21'); 
```

**RB_sex.sql:** e.g. remove unnecessary whitespace
```diff
diff --git a/raisinbread/RB_files/RB_sex.sql b/raisinbread/RB_files/RB_sex.sql
index df4c39f8d..39d6d1e33 100644
--- a/raisinbread/RB_files/RB_sex.sql
+++ b/raisinbread/RB_files/RB_sex.sql
@@ -1,8 +1,8 @@
 SET FOREIGN_KEY_CHECKS=0;
 TRUNCATE TABLE `sex`;
 LOCK TABLES `sex` WRITE;
-INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Female', '#2FA4E7');
-INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Male', '#1C70B6');
-INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Other', '#4AE8C2');
+INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Female','#2FA4E7');
+INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Male','#1C70B6');
+INSERT INTO `sex` (`Name`, `Colour`) VALUES ('Other','#4AE8C2');
 UNLOCK TABLES;
 SET FOREIGN_KEY_CHECKS=1;
 ```

#### Testing instructions (if applicable)

1. Follow the steps described in the corresponding issue

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e66009c1641`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.