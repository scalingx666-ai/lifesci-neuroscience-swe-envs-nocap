# Issue

**Title:** [FIX][SCHEMA] Updating <properties:> to enable easy object recursion

## Description

For metadata of "type: object". Ensured all keys become metadata objects. This would enable a much more elegant and streamlined design for creating relevant namespaces from metadata, by allowing object keys to be recursively defined as metadata objects themselves. 

Making this consistent would make it more machine readable, and allow for treatment of property keys as "strict" objects with an easily findable definition (i.e. shema.objects.metadata.get(name)).

This is sometimes done, i.e. for StimulusPresentation:

```yaml
StimulusPresentation:
  name: StimulusPresentation
  display_name: Stimulus Presentation
  description: |
    Object containing key-value pairs related to the software used to present
    the stimuli during the experiment.
  type: object
recommended:
    - OperatingSystem
    - ScreenDistance
    - ScreenRefreshRate
    - ScreenResolution
    - ScreenSize
    - SoftwareName
    - SoftwareRRID
    - SoftwareVersion
    - Code
    - HeadStabilization
  properties:
    OperatingSystem:
      $ref: objects.metadata.OperatingSystem
    ScreenDistance:
      $ref: objects.metadata.ScreenDistance
    ScreenRefreshRate:
      $ref: objects.metadata.ScreenRefreshRate
```

But othertimes ignored, i.e. for DeidentificationMethodCodeSequence:

```yaml
DeidentificationMethodCodeSequence:
  name: DeidentificationMethodCodeSequence
  display_name: Deidentification Method Code Sequence
  description: |
    A sequence of code objects describing the mechanism or method use to remove the Patient's identity.
    Corresponds to [DICOM Tag 0012, 0064](https://dicomlookup.com/dicomtags/(0012,0064))
    `De-identification Method Code Sequence`.
  type: array
  items:
    type: object
    recommended_fields:
      - CodeValue
      - CodeMeaning
      - CodingSchemeDesignator
      - CodingSchemeVersion
    properties:
      CodeValue:
        name: CodeValue
        type: string
        description: |
          An identifier that is unambiguous within the Coding Scheme
          denoted by Coding Scheme Designator and Coding Scheme Version.
          Corresponds to [DICOM Tag 0008, 0100](https://dicomlookup.com/dicomtags/(0008,0100)) `Code Value`.
      CodeMeaning:
        name: CodeMeaning
        type: string
        description: |
          Text that has meaning to a human and conveys the meaning of the term
          Corresponds to [DICOM Tag 0008, 0104](https://dicomlookup.com/dicomtags/(0008,0104)) `Code Meaning`.
      CodingSchemeDesignator:
        name: CodingSchemeDesignator
        type: string
        description: |
          The identifier of the coding scheme in which the coded entry is defined.
          Corresponds to [DICOM Tag 0008, 0102](https://dicomlookup.com/dicomtags/(0008,0102))
          `Coding Scheme Designator`.
      CodingSchemeVersion:
        name: CodingSchemeVersion
        type: string
        description: |
          An identifier of the version of the coding scheme if necessary to resolve ambiguity.
          Corresponds to [DICOM Tag 0008, 0103](https://dicomlookup.com/dicomtags/(0008,0103)) `Coding Scheme Version`.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db1c0871057f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.