# Issue

**Title:** [SCHEMA][BUG] add error handling for non-existent schema dir

## Description

Caught this while trying to retrieve the schema from a non-existence source with pybids, but it should be handled here too.

```python
 self = HTTPPath('https://bids-specification.readthedocs.io/en/v99.99.99/schema.json', protocol='https')
  
      def iterdir(self) -> Iterator[Self]:
          """Yield path objects of the directory contents.
      
          Examples
          --------
          >>> from upath import UPath
          >>> p = UPath("memory:///foo/")
          >>> p.joinpath("bar.txt").touch()
          >>> p.joinpath("baz.txt").touch()
          >>> for child in p.iterdir():
          ...     print(child)
          MemoryPath('memory:///foo/bar.txt')
          MemoryPath('memory:///foo/baz.txt')
      
          """
          sep = self.parser.sep
          base = self
          if self.parts[-1:] == ("",):
              base = self.parent
          fs = base.fs
          base_path = base.path
          if not fs.isdir(base_path):
  >           raise NotADirectoryError(str(self))
  E           NotADirectoryError: https://bids-specification.readthedocs.io/en/v99.99.99/schema.json
  
  .tox/py312-full/lib/python3.12/site-packages/upath/core.py:1228: NotADirectoryError
  
  During handling of the above exception, another exception occurred:
  
  self = <bids.layout.tests.test_schema_config.TestSchemaConfig object at 0x10a39b530>
  
      def test_invalid_schema_version(self):
          """Test that loading invalid schema version raises appropriate error."""
          # Test with a non-existent version
          with pytest.raises(ValueError):
  >           Config.load({'schema_version': '99.99.99'})
  
  src/bids/layout/tests/test_schema_config.py:74: 
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
  src/bids/layout/models.py:230: in load
      return cls._from_schema(
  src/bids/layout/models.py:283: in _from_schema
      bids_schema = collect_schema(bids_version=bids_version)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  src/bids/utils.py:394: in collect_schema
      schema = load_schema(Path(uri))
               ^^^^^^^^^^^^^^^^^^^^^^
  .tox/py312-full/lib/python3.12/site-packages/bidsschematools/schema.py:250: in load_schema
      schema = Namespace.from_directory(schema_path)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  .tox/py312-full/lib/python3.12/site-packages/bidsschematools/types/namespace.py:265: in from_directory
      return cls.build(_read_yaml_dir(path))
                       ^^^^^^^^^^^^^^^^^^^^
  .tox/py312-full/lib/python3.12/site-packages/bidsschematools/types/namespace.py:278: in _read_yaml_dir
      for subpath in sorted(path.iterdir(), key=lambda p: p.name):
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
  
  self = HTTPPath('https://bids-specification.readthedocs.io/en/v99.99.99/schema.json', protocol='https')
  
      def iterdir(self) -> Iterator[Self]:
          it = iter(super().iterdir())
          try:
              item0 = next(it)
          except (StopIteration, NotADirectoryError):
  >           raise NotADirectoryError(str(self))
  E           NotADirectoryError: https://bids-specification.readthedocs.io/en/v99.99.99/schema.json
  
  .tox/py312-full/lib/python3.12/site-packages/upath/implementations/http.py:87: NotADirectoryError
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff2ceb931755`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.