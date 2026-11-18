# Issue

**Title:** Fix Dockerfiles and add GitHub Actions job

## Description

## Types of changes
- [x] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
1. When building the Docker images, I encountered an error with downloading the `DeepCSR` model.

    Command
    ```bash
    docker build -t neuronets/nobrainer:master-cpu -f docker/cpu.Dockerfile .
    ```
  
    Error
    ```bash
    #0 79.03 get(error): DeepCSR/deepcsr/1.0/CBSI.tar.gz (file) [not available; (Note that these git remotes have annex-ignore set: origin)]
    #0 79.03 get(error): DeepCSR/deepcsr/1.0/weights/best_model.pth (file) [not available; (Note that these git remotes have annex-ignore set: origin)]
    ```
    <br>
    <details>
    <summary>Click to expand the full error stack</summary>
    
    ```bash
    [+] Building 80.3s (11/12)                                                                                                 
     => [internal] load build definition from cpu.Dockerfile                                                              0.0s
     => => transferring dockerfile: 1.19kB                                                                                0.0s
     => [internal] load .dockerignore                                                                                     0.0s
     => => transferring context: 61B                                                                                      0.0s
     => [internal] load metadata for docker.io/tensorflow/tensorflow:2.10.0-jupyter                                       0.6s
     => [internal] load build context                                                                                     0.0s
     => => transferring context: 6.37kB                                                                                   0.0s
     => [1/8] FROM docker.io/tensorflow/tensorflow:2.10.0-jupyter@sha256:6c250696bc9a4d6ef869476a5e73dfc85b64dbd1449e7ed  0.0s
     => CACHED [2/8] RUN curl -sSL http://neuro.debian.net/lists/focal.us-nh.full | tee /etc/apt/sources.list.d/neurodeb  0.0s
     => CACHED [3/8] COPY [., /opt/nobrainer]                                                                             0.0s
     => CACHED [4/8] RUN cd /opt/nobrainer     && sed -i 's/tensorflow >=/tensorflow-cpu >=/g' setup.cfg                  0.0s
     => CACHED [5/8] RUN python3 -m pip install --no-cache-dir /opt/nobrainer datalad datalad-osf                         0.0s
     => CACHED [6/8] RUN git config --global user.email "neuronets@example.com"     && git config --global user.name "Ne  0.0s
     => ERROR [7/8] RUN datalad clone https://github.com/neuronets/trained-models /models     && cd /models && git-anne  79.6s
    ------                                                                                                                     
     > [7/8] RUN datalad clone https://github.com/neuronets/trained-models /models     && cd /models && git-annex enableremote osf-storage     && datalad get -r .:                                                                                       
    #0 0.583 [INFO] Attempting a clone into /models                                                                            
    #0 0.583 [INFO] Attempting to clone from https://github.com/neuronets/trained-models to /models                            
    #0 1.052 [INFO] Start enumerating objects                                                                                  
    #0 1.052 [INFO] Start counting objects 
    #0 1.057 [INFO] Start compressing objects 
    #0 1.090 [INFO] Start receiving objects 
    #0 1.269 [INFO] Start resolving deltas 
    #0 1.340 [INFO] Completed clone attempts for Dataset(/models) 
    #0 2.193 [INFO] Remote origin not usable by git-annex; setting annex-ignore 
    #0 2.207 [INFO] https://github.com/neuronets/trained-models/config download failed: Not Found 
    #0 2.642 install(ok): /models (dataset)
    #0 5.461 enableremote osf-storage ok
    #0 5.997 (recording state in git...)
    #0 6.575 [INFO] Ensuring presence of Dataset(/models) to get /models 
    #0 69.47 [ERROR] Received undecodable JSON output: b"runHandler: couldn't find handler" 
    #0 79.03 get(ok): DDIG/SynthMorph/1.0.0/brains/weights/brains-dice-vel-0.5-res-16-256f.h5 (file) [from osf-storage...]
    #0 79.03 get(ok): DDIG/SynthMorph/1.0.0/shapes/weights/shapes-dice-vel-3-res-8-16-32-256f.h5 (file) [from osf-storage...]
    #0 79.03 get(ok): DDIG/SynthStrip/1.0.0/weights/synthstrip.1.pt (file) [from osf-storage...]
    #0 79.03 get(ok): DDIG/VoxelMorph/1.0.0/weights/vxm_dense_brain_T1_3D_mse.h5 (file) [from osf-storage...]
    #0 79.03 get(error): DeepCSR/deepcsr/1.0/CBSI.tar.gz (file) [not available; (Note that these git remotes have annex-ignore set: origin)]
    #0 79.03 get(error): DeepCSR/deepcsr/1.0/weights/best_model.pth (file) [not available; (Note that these git remotes have annex-ignore set: origin)]
    #0 79.03 get(ok): UCL/SynthSR/1.0.0/general/weights/SynthSR_v10_210712.h5 (file) [from osf-storage...]
    #0 79.03 get(ok): UCL/SynthSR/1.0.0/hyperfine/weights/SynthSR_v10_210712_hyperfine.h5 (file) [from osf-storage...]
    #0 79.03 get(ok): UCL/SynthSeg/1.0.0/weights/SynthSeg.h5 (file) [from osf-storage...]
    #0 79.03 get(ok): lcn/parcnet/1.0.0/weights/dktatlas_identity_0.000_0.000_unet2d_320_0.050_60_pos_20_1.0.0.ckpt (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/ams/0.1.0/weights/meningioma_T1wc_128iso_v1.h5 (file) [from web...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_128/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_128/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_128/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_16/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_16/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_16/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_256/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_256/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_256/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_32/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_32/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_32/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_64/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_64/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_64/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_8/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_8/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/braingen/0.1.0/generator_res_8/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/brainy/0.1.0/weights/brain-extraction-unet-128iso-model.h5 (file)
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bvwn_multi_prior/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bvwn_multi_prior/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bvwn_multi_prior/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn_multi/weights/saved_model.pb (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn_multi/weights/variables/variables.data-00000-of-00001 (file) [from osf-storage...]
    #0 79.03 get(ok): neuronets/kwyk/0.4.1/bwn_multi/weights/variables/variables.index (file) [from osf-storage...]
    #0 79.03 action summary:
    #0 79.03   get (error: 2, ok: 37)
    ------
    cpu.Dockerfile:16
    --------------------
      15 |         && git config --global user.name "Neuronets maintainers"
      16 | >>> RUN datalad clone https://github.com/neuronets/trained-models /models \
      17 | >>>     && cd /models && git-annex enableremote osf-storage \
      18 | >>>     && datalad get -r .
      19 |     ENV LC_ALL=C.UTF-8 \
    --------------------
    ERROR: failed to solve: process "/bin/sh -c datalad clone https://github.com/neuronets/trained-models /models     && cd /models && git-annex enableremote osf-storage     && datalad get -r ." did not complete successfully: exit code: 1
    ```

</details>

2. When building the GPU Docker image, encountered an error since `tensorflow-gpu` is deprecated.

    Command
    ```bash
    docker build -t neuronets/nobrainer:master-gpu -f docker/gpu.Dockerfile .
    ```
    
    Error
    ```bash
    ERROR: Failed building wheel for tensorflow-gpu
    ```
    <br>
    <details>
    <summary>Click to expand the full error stack</summary>
  
    ```bash
    [+] Building 374.1s (9/12)                                                                                                              docker:desktop-linux
     => [internal] load build definition from gpu.Dockerfile                                                                                                0.0s
     => => transferring dockerfile: 1.20kB                                                                                                                  0.0s
     => [internal] load .dockerignore                                                                                                                       0.0s
     => => transferring context: 61B                                                                                                                        0.0s
     => [internal] load metadata for docker.io/tensorflow/tensorflow:2.10.0-gpu-jupyter                                                                     5.7s
     => [1/8] FROM docker.io/tensorflow/tensorflow:2.10.0-gpu-jupyter@sha256:a72deb34d32e26cf4253608b0e86ebb4e5079633380c279418afb5a131c499d6               0.6s
     => => resolve docker.io/tensorflow/tensorflow:2.10.0-gpu-jupyter@sha256:a72deb34d32e26cf4253608b0e86ebb4e5079633380c279418afb5a131c499d6               0.0s
     => => sha256:cf6cb74c9ec4ff92634514468a6dd2323dead73720b58e1700b9478557668b3d 19.33kB / 19.33kB                                                        0.0s
     => => sha256:a72deb34d32e26cf4253608b0e86ebb4e5079633380c279418afb5a131c499d6 6.39kB / 6.39kB                                                          0.0s
     => [internal] load build context                                                                                                                       0.0s
     => => transferring context: 33.58kB                                                                                                                    0.0s
     => [2/8] RUN curl -sSL http://neuro.debian.net/lists/focal.us-nh.full | tee /etc/apt/sources.list.d/neurodebian.sources.list   && export GNUPGHOME=  280.3s
     => [3/8] COPY [., /opt/nobrainer]                                                                                                                      0.1s
     => [4/8] RUN cd /opt/nobrainer     && sed -i 's/tensorflow >=/tensorflow-gpu >=/g' setup.cfg                                                           0.2s 
     => ERROR [5/8] RUN python3 -m pip install --no-cache-dir /opt/nobrainer datalad datalad-osf                                                           87.2s 
    ------                                                                                                                                                       
     > [5/8] RUN python3 -m pip install --no-cache-dir /opt/nobrainer datalad datalad-osf:                                                                       
    1.078 Processing /opt/nobrainer                                                                                                                              
    1.097   Installing build dependencies: started                                                                                                               
    7.279   Installing build dependencies: finished with status 'done'                                                                                           
    7.280   Getting requirements to build wheel: started                                                                                                         
    7.871   Getting requirements to build wheel: finished with status 'done'
    7.874     Preparing wheel metadata: started
    8.316     Preparing wheel metadata: finished with status 'done'
    10.75 Collecting datalad
    13.04   Downloading datalad-0.19.2-py3-none-any.whl (1.3 MB)
    15.52 Collecting datalad-osf
    15.56   Downloading datalad_osf-0.3.0-py2.py3-none-any.whl (26 kB)
    15.81 Collecting joblib
    15.84   Downloading joblib-1.3.1-py3-none-any.whl (301 kB)
    16.14 Requirement already satisfied: numpy in /usr/local/lib/python3.8/dist-packages (from nobrainer==0+unknown) (1.23.2)
    16.25 Collecting nibabel
    16.33   Downloading nibabel-5.1.0-py3-none-any.whl (3.3 MB)
    18.33 Collecting scikit-image
    18.39   Downloading scikit_image-0.21.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (13.9 MB)
    24.10 Collecting click
    24.14   Downloading click-8.1.6-py3-none-any.whl (97 kB)
    24.37 Collecting tensorflow-probability>=0.11.0
    24.44   Downloading tensorflow_probability-0.20.1-py2.py3-none-any.whl (6.9 MB)
    28.77 Collecting fsspec
    28.79   Downloading fsspec-2023.6.0-py3-none-any.whl (163 kB)
    29.04 Collecting tensorflow-addons>=0.12.0
    29.06   Downloading tensorflow_addons-0.21.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (612 kB)
    29.46 Collecting tensorflow-gpu>=2.10.0
    29.48   Downloading tensorflow-gpu-2.12.0.tar.gz (2.6 kB)
    29.89 Requirement already satisfied: psutil in /usr/local/lib/python3.8/dist-packages (from nobrainer==0+unknown) (5.9.2)
    29.90 Requirement already satisfied: importlib-metadata>=3.6; python_version < "3.10" in /usr/local/lib/python3.8/dist-packages (from datalad) (4.12.0)
    29.98 Collecting distro; python_version >= "3.8"
    30.00   Downloading distro-1.8.0-py3-none-any.whl (20 kB)
    30.25 Collecting keyring!=23.9.0,>=20.0
    30.28   Downloading keyring-24.2.0-py3-none-any.whl (37 kB)
    30.52 Collecting iso8601
    30.58   Downloading iso8601-2.0.0-py3-none-any.whl (7.5 kB)
    30.90 Collecting tqdm>=4.32.0
    31.01   Downloading tqdm-4.65.0-py3-none-any.whl (77 kB)
    31.21 Collecting annexremote
    31.44   Downloading annexremote-1.6.0-py3-none-any.whl (25 kB)
    31.58 Collecting platformdirs
    31.71   Downloading platformdirs-3.9.1-py3-none-any.whl (16 kB)
    31.89 Collecting looseversion
    32.23   Downloading looseversion-1.3.0-py2.py3-none-any.whl (8.2 kB)
    32.62 Collecting keyrings.alt
    32.70   Downloading keyrings.alt-5.0.0-py3-none-any.whl (18 kB)
    32.82 Requirement already satisfied: chardet>=3.0.4 in /usr/lib/python3/dist-packages (from datalad) (3.0.4)
    32.96 Collecting boto
    33.61   Downloading boto-2.49.0-py2.py3-none-any.whl (1.4 MB)
    34.59 Collecting patool>=1.7
    34.61   Downloading patool-1.12-py2.py3-none-any.whl (77 kB)
    34.66 Requirement already satisfied: requests>=1.2 in /usr/lib/python3/dist-packages (from datalad) (2.22.0)
    34.77 Collecting humanize
    34.79   Downloading humanize-4.7.0-py3-none-any.whl (113 kB)
    34.84 Requirement already satisfied: packaging in /usr/local/lib/python3.8/dist-packages (from datalad) (21.3)
    34.84 Requirement already satisfied: typing-extensions>=4.0.0; python_version < "3.11" in /usr/local/lib/python3.8/dist-packages (from datalad) (4.3.0)
    34.90 Collecting fasteners>=0.14
    34.94   Downloading fasteners-0.18-py3-none-any.whl (18 kB)
    35.11 Collecting python-gitlab
    35.14   Downloading python_gitlab-3.15.0-py3-none-any.whl (135 kB)
    35.60 Collecting msgpack
    35.63   Downloading msgpack-1.0.5-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (322 kB)
    35.84 Collecting osfclient>=0.0.5
    35.86   Downloading osfclient-0.0.5-py2.py3-none-any.whl (39 kB)
    36.04 Collecting datalad-next>=1.0.0b3
    36.11   Downloading datalad_next-1.0.0b3-py3-none-any.whl (295 kB)
    36.20 Requirement already satisfied: importlib-resources>=1.3; python_version < "3.9" in /usr/local/lib/python3.8/dist-packages (from nibabel->nobrainer==0+unknown) (5.9.0)
    36.84 Collecting scipy>=1.8
    36.89   Downloading scipy-1.10.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (34.5 MB)
    58.51 Requirement already satisfied: pillow>=9.0.1 in /usr/local/lib/python3.8/dist-packages (from scikit-image->nobrainer==0+unknown) (9.2.0)
    58.65 Collecting imageio>=2.27
    58.80   Downloading imageio-2.31.1-py3-none-any.whl (313 kB)
    59.76 Collecting networkx>=2.8
    59.86   Downloading networkx-3.1-py3-none-any.whl (2.1 MB)
    60.72 Collecting PyWavelets>=1.1.1
    60.75   Downloading PyWavelets-1.4.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (6.9 MB)
    63.43 Collecting lazy_loader>=0.2
    63.52   Downloading lazy_loader-0.3-py3-none-any.whl (9.1 kB)
    63.90 Collecting tifffile>=2022.8.12
    63.94   Downloading tifffile-2023.7.10-py3-none-any.whl (220 kB)
    64.35 Requirement already satisfied: six>=1.10.0 in /usr/lib/python3/dist-packages (from tensorflow-probability>=0.11.0->nobrainer==0+unknown) (1.14.0)
    64.35 Requirement already satisfied: gast>=0.3.2 in /usr/local/lib/python3.8/dist-packages (from tensorflow-probability>=0.11.0->nobrainer==0+unknown) (0.4.0)
    64.36 Requirement already satisfied: decorator in /usr/local/lib/python3.8/dist-packages (from tensorflow-probability>=0.11.0->nobrainer==0+unknown) (5.1.1)
    64.36 Requirement already satisfied: absl-py in /usr/local/lib/python3.8/dist-packages (from tensorflow-probability>=0.11.0->nobrainer==0+unknown) (1.2.0)
    64.44 Collecting cloudpickle>=1.3
    64.45   Downloading cloudpickle-2.2.1-py3-none-any.whl (25 kB)
    64.58 Collecting dm-tree
    64.59   Downloading dm_tree-0.1.8-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (152 kB)
    64.80 Collecting typeguard<3.0.0,>=2.7
    64.82   Downloading typeguard-2.13.3-py3-none-any.whl (17 kB)
    65.00 Collecting python_version>"3.7"
    65.02   Downloading python_version-0.0.2-py2.py3-none-any.whl (3.4 kB)
    65.18 Requirement already satisfied: zipp>=0.5 in /usr/local/lib/python3.8/dist-packages (from importlib-metadata>=3.6; python_version < "3.10"->datalad) (3.8.1)
    65.33 Collecting jaraco.classes
    65.35   Downloading jaraco.classes-3.3.0-py3-none-any.whl (5.9 kB)
    65.49 Collecting jeepney>=0.4.2; sys_platform == "linux"
    65.53   Downloading jeepney-0.8.0-py3-none-any.whl (48 kB)
    65.67 Collecting SecretStorage>=3.2; sys_platform == "linux"
    65.70   Downloading SecretStorage-3.3.3-py3-none-any.whl (15 kB)
    65.74 Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.8/dist-packages (from packaging->datalad) (3.0.9)
    65.95 Collecting requests-toolbelt>=0.10.1
    65.97   Downloading requests_toolbelt-1.0.0-py2.py3-none-any.whl (54 kB)
    66.05 Collecting www-authenticate
    66.07   Downloading www-authenticate-0.9.2.tar.gz (2.4 kB)
    66.71 Collecting more-itertools
    66.77   Downloading more_itertools-10.0.0-py3-none-any.whl (55 kB)
    68.15 Collecting cryptography>=2.0
    68.18   Downloading cryptography-41.0.2-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.3 MB)
    69.51 Requirement already satisfied: cffi>=1.12 in /usr/local/lib/python3.8/dist-packages (from cryptography>=2.0->SecretStorage>=3.2; sys_platform == "linux"->keyring!=23.9.0,>=20.0->datalad) (1.15.1)
    69.51 Requirement already satisfied: pycparser in /usr/local/lib/python3.8/dist-packages (from cffi>=1.12->cryptography>=2.0->SecretStorage>=3.2; sys_platform == "linux"->keyring!=23.9.0,>=20.0->datalad) (2.21)
    69.52 Building wheels for collected packages: nobrainer, tensorflow-gpu, www-authenticate
    69.52   Building wheel for nobrainer (PEP 517): started
    70.20   Building wheel for nobrainer (PEP 517): finished with status 'done'
    70.20   Created wheel for nobrainer: filename=nobrainer-0+unknown-py3-none-any.whl size=119625 sha256=7e4f312ff5553b617e8c4dfecf7920a57e7906c4fdbd0a530551194cd2346a19
    70.20   Stored in directory: /tmp/pip-ephem-wheel-cache-mtspluf5/wheels/e0/28/10/869c673689a6102f067decf42fdd1a76d76f16c4c2e054aac3
    70.21   Building wheel for tensorflow-gpu (setup.py): started
    70.48   Building wheel for tensorflow-gpu (setup.py): finished with status 'error'
    70.48   ERROR: Command errored out with exit status 1:
    70.48    command: /usr/bin/python3 -u -c 'import sys, setuptools, tokenize; sys.argv[0] = '"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"'; __file__='"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"';f=getattr(tokenize, '"'"'open'"'"', open)(__file__);code=f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' bdist_wheel -d /tmp/pip-wheel-re6mi_9s
    70.48        cwd: /tmp/pip-install-vng1aifj/tensorflow-gpu/
    70.48   Complete output (17 lines):
    70.48   Traceback (most recent call last):
    70.48     File "<string>", line 1, in <module>
    70.48     File "/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py", line 37, in <module>
    70.48       raise Exception(TF_REMOVAL_WARNING)
    70.48   Exception:
    70.48   
    70.48   =========================================================
    70.48   The "tensorflow-gpu" package has been removed!
    70.48   
    70.48   Please install "tensorflow" instead.
    70.48   
    70.48   Other than the name, the two packages have been identical
    70.48   since TensorFlow 2.1, or roughly since Sep 2019. For more
    70.48   information, see: pypi.org/project/tensorflow-gpu
    70.48   =========================================================
    70.48   
    70.48   
    70.48   ----------------------------------------
    70.48   ERROR: Failed building wheel for tensorflow-gpu
    70.48   Running setup.py clean for tensorflow-gpu
    70.86   Building wheel for www-authenticate (setup.py): started
    71.34   Building wheel for www-authenticate (setup.py): finished with status 'done'
    71.34   Created wheel for www-authenticate: filename=www_authenticate-0.9.2-py3-none-any.whl size=2915 sha256=038b6891f644d9b5796176016f37ac623d194965e7d04f00cf7859beae3f2a77
    71.34   Stored in directory: /tmp/pip-ephem-wheel-cache-mtspluf5/wheels/2e/99/65/7f276f015ac28099997397b2c471b5be4417a340baba36f503
    71.34 Successfully built nobrainer www-authenticate
    71.34 Failed to build tensorflow-gpu
    72.55 Installing collected packages: distro, more-itertools, jaraco.classes, jeepney, cryptography, SecretStorage, keyring, iso8601, tqdm, annexremote, platformdirs, looseversion, keyrings.alt, boto, patool, humanize, fasteners, requests-toolbelt, python-gitlab, msgpack, datalad, osfclient, www-authenticate, datalad-next, datalad-osf, joblib, nibabel, scipy, imageio, networkx, PyWavelets, lazy-loader, tifffile, scikit-image, click, cloudpickle, dm-tree, tensorflow-probability, fsspec, typeguard, tensorflow-addons, python-version, tensorflow-gpu, nobrainer
    85.24     Running setup.py install for tensorflow-gpu: started
    85.59     Running setup.py install for tensorflow-gpu: finished with status 'error'
    85.59     ERROR: Command errored out with exit status 1:
    85.59      command: /usr/bin/python3 -u -c 'import sys, setuptools, tokenize; sys.argv[0] = '"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"'; __file__='"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"';f=getattr(tokenize, '"'"'open'"'"', open)(__file__);code=f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' install --record /tmp/pip-record-7gb8v2rm/install-record.txt --single-version-externally-managed --compile --install-headers /usr/local/include/python3.8/tensorflow-gpu
    85.59          cwd: /tmp/pip-install-vng1aifj/tensorflow-gpu/
    85.59     Complete output (17 lines):
    85.59     Traceback (most recent call last):
    85.59       File "<string>", line 1, in <module>
    85.59       File "/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py", line 37, in <module>
    85.59         raise Exception(TF_REMOVAL_WARNING)
    85.59     Exception:
    85.59     
    85.59     =========================================================
    85.59     The "tensorflow-gpu" package has been removed!
    85.59     
    85.59     Please install "tensorflow" instead.
    85.59     
    85.59     Other than the name, the two packages have been identical
    85.59     since TensorFlow 2.1, or roughly since Sep 2019. For more
    85.59     information, see: pypi.org/project/tensorflow-gpu
    85.59     =========================================================
    85.59     
    85.59     
    85.59     ----------------------------------------
    85.59 ERROR: Command errored out with exit status 1: /usr/bin/python3 -u -c 'import sys, setuptools, tokenize; sys.argv[0] = '"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"'; __file__='"'"'/tmp/pip-install-vng1aifj/tensorflow-gpu/setup.py'"'"';f=getattr(tokenize, '"'"'open'"'"', open)(__file__);code=f.read().replace('"'"'\r\n'"'"', '"'"'\n'"'"');f.close();exec(compile(code, __file__, '"'"'exec'"'"'))' install --record /tmp/pip-record-7gb8v2rm/install-record.txt --single-version-externally-managed --compile --install-headers /usr/local/include/python3.8/tensorflow-gpu Check the logs for full command output.
    85.98 WARNING: You are using pip version 20.2.4; however, version 23.2.1 is available.
    85.98 You should consider upgrading via the '/usr/bin/python3 -m pip install --upgrade pip' command.
    ------
    gpu.Dockerfile:13
    --------------------
      11 |     RUN cd /opt/nobrainer \
      12 |         && sed -i 's/tensorflow >=/tensorflow-gpu >=/g' setup.cfg
      13 | >>> RUN python3 -m pip install --no-cache-dir /opt/nobrainer datalad datalad-osf
      14 |     RUN git config --global user.email "neuronets@example.com" \
      15 |         && git config --global user.name "Neuronets maintainers"
    --------------------
    ERROR: failed to solve: process "/bin/bash -c python3 -m pip install --no-cache-dir /opt/nobrainer datalad datalad-osf" did not complete successfully: exit code: 1
    ```

  </details>

### Changes
- [x] Fix for item 1 - Only download the models from the `osf-storage` DataLad data source.
- [x] Fix for item 2 - Update the base images and the `tensorflow` package and version.
- [x] Add GitHub Actions job to test the build of the Docker images

## Checklist
- [x] Manually test that both the CPU and GPU Docker images build, and I can enter the containers and import `nobrainer` and `tensorflow`
- [x] I have added tests to cover my changes - Added GitHub Actions job
- [ ] I have updated documentation (if necessary)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adf7125f0041`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.