# Issue

**Title:** CI: Use latest pip to ensure better dependency resolution

## Description

Doc dependency installation step shows:

```
ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.

We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.

sphinx-rtd-theme 1.0.0 requires docutils<0.18, but you'll have docutils 0.18 which is incompatible.
Successfully installed MarkupSafe-2.0.1 PyWavelets-1.1.1 PyYAML-6.0 Pygments-2.10.0 alabaster-0.7.12 babel-2.9.1 bids-validator-1.8.4 bleach-4.1.0 ci-info-0.2.0 click-8.0.3 colorclass-2.2.0 cycler-0.11.0 defusedxml-0.7.1 docopt-0.6.2 docutils-0.18 entrypoints-0.3 etelemetry-0.2.2 h5py-3.5.0 imageio-2.10.2 imagesize-1.2.0 ipython-genutils-0.2.0 isodate-0.6.0 jinja2-3.0.2 joblib-1.1.0 jupyter-client-7.0.6 jupyter-core-4.9.1 jupyterlab-pygments-0.1.2 kiwisolver-1.3.2 lxml-4.6.4 matplotlib-3.3.4 mistune-0.8.4 nbclient-0.5.4 nbconvert-6.2.0 nbformat-5.1.3 nbsphinx-0.8.7 nest-asyncio-1.5.1 networkx-2.6.3 nibabel-3.2.1 nilearn-0.8.1 nipype-1.7.0 nitransforms-21.0.0 niworkflows-1.4.2 num2words-0.5.10 numpy-1.21.4 packaging-21.2 pandas-1.3.4 pandocfilters-1.5.0 patsy-0.5.2 pbr-5.7.0 pillow-8.4.0 pockets-0.9.1 prov-2.0.0 pybids-0.13.2 pydot-1.4.2 pydotplus-2.0.2 python-dateutil-2.8.2 pytz-2021.3 pyzmq-22.3.0 rdflib-6.0.2 scikit-image-0.18.3 scikit-learn-1.0.1 scipy-1.7.1 seaborn-0.11.2 simplejson-3.17.5 snowballstemmer-2.1.0 sphinx-2.4.4 sphinx-argparse-0.3.1 sphinx-rtd-theme-1.0.0 sphinxcontrib-apidoc-0.3.0 sphinxcontrib-applehelp-1.0.2 sphinxcontrib-devhelp-1.0.2 sphinxcontrib-htmlhelp-2.0.0 sphinxcontrib-jsmath-1.0.1 sphinxcontrib-napoleon-0.7 sphinxcontrib-qthelp-1.0.3 sphinxcontrib-serializinghtml-1.1.5 sphinxcontrib-versioning-2.2.1 sqlalchemy-1.3.24 svgutils-0.3.4 templateflow-0.7.1 testpath-0.5.0 threadpoolctl-3.0.0 tifffile-2021.11.2 tornado-6.1 tqdm-4.62.3 traitlets-5.1.1 traits-6.3.1 transforms3d-0.3.1
WARNING: You are using pip version 20.2.3; however, version 21.3.1 is available.
```

Doc build step fails with:

```
#!/bin/bash -eo pipefail
make -C docs SPHINXOPTS="-W" BUILDDIR="_build/no_version_html" html
make: Entering directory '/tmp/gh-pages/docs'
PYTHONPATH=/tmp/gh-pages sphinx-build -b html -d _build/no_version_html/doctrees  -W . _build/no_version_html/html
Running Sphinx v2.4.4

Warning, treated as error:
node class 'meta' is already registered, its visitors will be overridden
make: *** [Makefile:61: html] Error 2
make: Leaving directory '/tmp/gh-pages/docs'

Exited with code exit status 2
```

Checking if just using the latest pip will fix the dependency conflict, which will fix the build failure, or if there's something else going on.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37808783b61b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.