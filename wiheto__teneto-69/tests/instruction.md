# Issue

**Title:** Reduced dependencies and added `check_packages` decorator

## Description

I forked `https://github.com/wiheto/teneto` and added that to my GitHub.  After that I adjusted files that loaded `bids`, `nilearn`, and `templateflow`.

There were more files that I needed to adjust than ones in `utils` as shown below.  Any function using one of those packages I had to add `check_packages` decorator or else there will be an import error.

```
# Version: 0.5.2-dev-c
(base) jespinozlt2-osx:teneto jespinoz$ grep -E -r "nilearn|templateflow|bids" teneto/ | grep ".py"
teneto//timeseries/remove_confounds.py:import nilearn
teneto//timeseries/remove_confounds.py:    Removes specified confounds using nilearn.signal.clean
teneto//timeseries/remove_confounds.py:        Dictionary of kawgs to pass to nilearn.signal.clean
teneto//timeseries/remove_confounds.py:    # nilearn works with time,node data
teneto//timeseries/remove_confounds.py:    cleaned_timeseries = nilearn.signal.clean(
teneto//classes/bids.py:import bids
teneto//classes/bids.py:# @check_neuro_packages(bids)
teneto//classes/bids.py:    bids_dir : str
teneto//classes/bids.py:        the directory that is in the bids_dir/derivatives/<selected_pipeline>/.
teneto//classes/bids.py:        With this, the input for netin with be from bids_dir/derivatives/[teneto-]tvc/,
teneto//classes/bids.py:        and the input for communities will be from bids_dir/derivatives/[teneto-]coms/.
teneto//classes/bids.py:    bids_filter : dict
teneto//classes/bids.py:    def __init__(self, bids_dir, selected_pipeline, bids_filter=None, bidsvalidator=False,
teneto//classes/bids.py:            self.BIDSLayout = bids.BIDSLayout(bids_dir, derivatives=True)
teneto//classes/bids.py:        self.bids_dir = bids_dir
teneto//classes/bids.py:        if bids_filter is None:
teneto//classes/bids.py:            self.bids_filter = {}
teneto//classes/bids.py:            self.bids_filter = bids_filter
teneto//classes/bids.py:        with open(tenetopath[0] + '/config/tenetobids/tenetobids_description.json') as f:
teneto//classes/bids.py:            self.tenetobids_description = json.load(f)
teneto//classes/bids.py:        self.tenetobids_description['PipelineDescription']['Version'] = tenetoversion
teneto//classes/bids.py:        with open(tenetopath[0] + '/config/tenetobids/tenetobids_structure.json') as f:
teneto//classes/bids.py:            self.tenetobids_structure = json.load(f)
teneto//classes/bids.py:    #    bids.
teneto//classes/bids.py:    def update_bids_layout(self):
teneto//classes/bids.py:        self.BIDSLayout = bids.BIDSLayout(self.bids_dir, derivatives=True)
teneto//classes/bids.py:            bids_dir/teneto-[output_pipeline]/
teneto//classes/bids.py:        output_pipeline_path = self.bids_dir + '/derivatives/' + output_pipeline
teneto//classes/bids.py:        datainfo = self.tenetobids_description.copy()
teneto//classes/bids.py:        self.update_bids_layout()
teneto//classes/bids.py:    def run(self, run_func, input_params, output_desc=None, output_pipeline_name=None, bids_filter=None, update_pipeline=True, exist_ok=None):
teneto//classes/bids.py:            For any other input that needs to be loaded loaded within the teneto_bidsstructure (communities, events, confounds),
teneto//classes/bids.py:            you can pass the value "bids" if they can be found within the current selected_pipeline.
teneto//classes/bids.py:            If they are found within a different selected_pipeline, type "bids_[selected_pipeline]".
teneto//classes/bids.py:        for f in self.tenetobids_structure[run_func]['module'].split('.'):
teneto//classes/bids.py:        functype = self.tenetobids_structure[run_func]['functype']
teneto//classes/bids.py:                        self.tenetobids_structure[run_func.split('.')[-1]]['output'])
teneto//classes/bids.py:                    save_path = self.bids_dir + '/derivatives/' + output_pipeline
teneto//classes/bids.py:                    # Probably should check the output type in tenetobidsstructure
teneto//classes/bids.py:            # Create new bids_filter dictionary that only contains sub/ses/run/task as other tags are dropped.
teneto//classes/bids.py:            bids_filter = dict(self.bids_filter)
teneto//classes/bids.py:            self.bids_filter = {}
teneto//classes/bids.py:            bids_filters_allowed = ['subject', 'ses', 'run', 'task']
teneto//classes/bids.py:            [self.update_bids_filter({'f': bids_filter[f]}) for f in bids_filters_allowed if f in bids_filter.keys()]
teneto//classes/bids.py:        self.update_bids_layout()
teneto//classes/bids.py:        Uses information in selected_pipeline and the bids layout and shows the files that will be processed when calling TenetoBIDS.run().
teneto//classes/bids.py:            filters = self.tenetobids_structure[output]['input']
teneto//classes/bids.py:        filters.update(self.bids_filter)
teneto//classes/bids.py:        funcs = self.tenetobids_structure.keys()
teneto//classes/bids.py:                s = self.tenetobids_structure[t]['input']['suffix']
teneto//classes/bids.py:    def update_bids_filter(self, filter_addons):
teneto//classes/bids.py:        """Updates TenetoBIDS.bids_filter
teneto//classes/bids.py:            dictionary that updates TenetoBIDS.bids_filter
teneto//classes/bids.py:        self.bids_filter.update(filter_addons)
teneto//classes/bids.py:    def get_confounds(self, bidsfile, confound_filters=None):
teneto//classes/bids.py:        bidsfile : BIDSDataFile or BIDSImageFile
teneto//classes/bids.py:        file_entities = bidsfile.get_entities()
teneto//classes/bids.py:    def load_data(self, bids_filter=None):
teneto//classes/bids.py:        bids_filter : dict
teneto//classes/bids.py:            default is None. If set, load data will load all files found by the bids_filter.
teneto//classes/bids.py:        if bids_filter is None:
teneto//classes/bids.py:            filters = dict(self.bids_filter)
teneto//classes/bids.py:            filters.update(bids_filter)
teneto//classes/bids.py:    def load_file(self, bidsfile):
teneto//classes/bids.py:        bidsfile : BIDSDataFile or BIDSImageFile
teneto//classes/bids.py:        sidecar = get_sidecar(bidsfile.dirname + '/' + bidsfile.filename)
teneto//classes/bids.py:            if hasattr(bidsfile, 'get_image'):
teneto//classes/bids.py:                data = bidsfile.get_image()
teneto//classes/bids.py:            elif hasattr(bidsfile, 'get_df'):
teneto//classes/bids.py:                # This can be changed if/when pybids is updated. Assumes index_col=0 in tsv file
teneto//classes/bids.py:                    bidsfile.dirname + '/' + bidsfile.filename)
teneto//classes/__init__.py:from .bids import TenetoBIDS
teneto//neuroimagingtools/fmriutils.py:import templateflow.api as tf
teneto//neuroimagingtools/fmriutils.py:from nilearn.input_data import NiftiLabelsMasker
teneto//neuroimagingtools/fmriutils.py:from .bidsutils import load_tabular_file
teneto//neuroimagingtools/fmriutils.py:        Specify which atlas you want to use (see github.com/templateflow/)
teneto//neuroimagingtools/fmriutils.py:        **kwargs for nilearn functions.
teneto//neuroimagingtools/fmriutils.py:    These functions make use of nilearn. Please cite templateflow and nilearn if used in a publicaiton.
teneto//neuroimagingtools/fmriutils.py:                         Run: templateflow.api.TF_LAYOUT.get_descs(atlas=' +
teneto//neuroimagingtools/bidsutils.py:def drop_bids_suffix(fname):
teneto//neuroimagingtools/__init__.py:from .bidsutils import drop_bids_suffix, \
teneto//neuroimagingtools/__init__.py:__all__ = ['make_parcellation', 'drop_bids_suffix',
```

I also adjusted the `setup.py`:
```
"""General setup for module."""

from setuptools import setup, find_packages

VERSION = "teneto/_version.py"
VERSION = open(VERSION, "rt").read()
VERSION = VERSION.split('"')[1]

setup(name='teneto',
      version=VERSION,
      python_requires='>3.5',
      setup_requires=['pytest-runner'],
      tests_require=['pytest'],
      install_requires=[
          ## Required
          'statsmodels>=0.8.0',
          'networkx>=2.0',
          'python-louvain>=0.13',
          'pandas>=0.21',
          'scipy>=1.4.1',
          'numpy>=1.16.1',
          "matplotlib >=3.1",
          ## Optional for neural
          #'nilearn>=0.6.0',
          #'pybids>=0.9',
          #'templateflow>=0.4.1',
          ],
      description='Temporal network tools',
      packages=find_packages(),
      author='William Hedley Thompson',
      author_email='hedley@startmail.com',
      url='https://www.github.com/wiheto/teneto',
      download_url='https://github.com/wiheto/teneto/archive/0.3.3.tar.gz',
      package_data={'': ['./teneto/data']},
      include_package_data=True,
      entry_points={
          'console_scripts': ['teneto = teneto.__main__:main']
      },
      long_description='Temporal network tools. \
        A package for deriving, analysing and plotting temporal network representations. \
        Additional tools for temporal network analysis with neuroimaging contexts.')
```

and `requirements.txt`
```
scipy>=1.4.1
numpy>=1.16.1
#scikit-learn>=0.20.3
#seaborn==0.8.1
matplotlib>=3.1.0
pandas>=0.21
#python-igraph>=0.7.1
#louvain >= 0.6.1
statsmodels>=0.8.0
networkx>=2.0
python-louvain>=0.13
#tables>=3.4.4
#scikit-optimize>=0.5.2
#pybids==0.9.5
#nilearn>=0.6.1
#templateflow>=0.4.1rc5
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b6a2fe6f725`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.