# Issue

**Title:** [candidate_parameters] add project-specific registration fields

## Description

## Brief summary of changes

- Adds project-specific rules for candidate parameters, including whether each field is required and shown on New Profile.
- Displays configured fields on New Profile and Candidate Parameters, with numeric input support.
- Validates and saves parameter values when creating a candidate.

#### Testing instructions

The screenshots use two manually configured test fields: **Visit plan for candidate** (`candidate_plan`) and **Study score** (`study_score`). These are local test fixtures and are not created by the PR migration.

After applying the PR migration and building the frontend, run the SQL below in your local test database. It creates the field definitions, links them to the Candidate Parameters category, and enables both as required registration fields for **Pumpernickel**.

These instructions assume your test database contains **Pumpernickel** and **Rye**. Adjust the project names if needed.

<details>
<summary>SQL to configure the test fields</summary>

```sql
START TRANSACTION;

INSERT INTO parameter_type_category (Name)
SELECT 'Candidate Parameters'
WHERE NOT EXISTS (
    SELECT 1
    FROM parameter_type_category
    WHERE Name = 'Candidate Parameters'
);

INSERT INTO parameter_type (Name, Type, Description, SourceFrom, Queryable)
SELECT
    'candidate_plan',
    'enum(''6month'',''12month'')',
    'Visit plan for candidate',
    'parameter_candidate',
    1
WHERE NOT EXISTS (
    SELECT 1
    FROM parameter_type
    WHERE Name = 'candidate_plan'
        AND SourceFrom = 'parameter_candidate'
);

INSERT INTO parameter_type (Name, Type, Description, SourceFrom, Queryable)
SELECT
    'study_score',
    'numeric',
    'Study score',
    'parameter_candidate',
    1
WHERE NOT EXISTS (
    SELECT 1
    FROM parameter_type
    WHERE Name = 'study_score'
        AND SourceFrom = 'parameter_candidate'
);

SET @candidate_category = (
    SELECT ParameterTypeCategoryID
    FROM parameter_type_category
    WHERE Name = 'Candidate Parameters'
    ORDER BY ParameterTypeCategoryID
    LIMIT 1
);

INSERT INTO parameter_type_category_rel
    (ParameterTypeID, ParameterTypeCategoryID)
SELECT pt.ParameterTypeID, @candidate_category
FROM parameter_type pt
WHERE pt.SourceFrom = 'parameter_candidate'
    AND pt.Name IN ('candidate_plan', 'study_score')
    AND NOT EXISTS (
        SELECT 1
        FROM parameter_type_category_rel rel
        WHERE rel.ParameterTypeID = pt.ParameterTypeID
            AND rel.ParameterTypeCategoryID = @candidate_category
    );

INSERT INTO parameter_candidate_rules
    (ParameterTypeID, ProjectID, Required, ShowOnRegistration)
SELECT pt.ParameterTypeID, p.ProjectID, 1, 1
FROM parameter_type pt
JOIN Project p ON p.Name = 'Pumpernickel'
WHERE pt.SourceFrom = 'parameter_candidate'
    AND pt.Name IN ('candidate_plan', 'study_score')
ON DUPLICATE KEY UPDATE Required = 1, ShowOnRegistration = 1;

SELECT
    pt.Name,
    pt.Type,
    pt.Description,
    p.Name AS Project,
    rules.Required,
    rules.ShowOnRegistration
FROM parameter_type pt
JOIN parameter_candidate_rules rules USING (ParameterTypeID)
JOIN Project p USING (ProjectID)
WHERE pt.SourceFrom = 'parameter_candidate'
    AND pt.Name IN ('candidate_plan', 'study_score')
    AND p.Name = 'Pumpernickel';

COMMIT;
```

</details>

1. Open `/new_profile/` and select **Pumpernickel**. Confirm **Visit plan for candidate** and **Study score** appear.
2. Switch to **Rye** and confirm these two fields disappear, then switch back to **Pumpernickel**.
3. Complete the other required registration fields, select **12month**, leave **Study score** empty, and click **Create**. Confirm the missing required value prevents submission.
4. Confirm a nonnumeric **Study score** cannot be submitted.
5. Enter **42** for **Study score**, create the candidate, and copy the new DCCID.
6. Open `/candidate_parameters/?candID=<DCCID>&identifier=<DCCID>`, replacing both placeholders with that DCCID. Confirm **12month** and **42** appear and are stored in `parameter_candidate`.
7. Change **Study score** to **43**, click **Update**, and reload. Confirm the saved value remains **43**.

#### Link(s) to related issue(s)

- 
- Related to #11133, which handles RegistrationCohort separately.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8452bb453b34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.