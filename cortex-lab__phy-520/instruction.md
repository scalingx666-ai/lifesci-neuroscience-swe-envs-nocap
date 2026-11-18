# Issue

**Title:** Fix contiguous bug.

## Description

Fixing this error:

```
19:56:30 [W] Error when loading `/Users/shabnamkadir/globalphy/simple_data/test_hybrid_120sec.phy/cluster_store/0/main/waveforms_spikes`: 'utf-8' codec can't decode byte 0x80 in position 0: invalid start byte.

---------------------------------------------------------------------------
BufferError                               Traceback (most recent call last)
<ipython-input-6-f9aba4144653> in <module>()
      1 model = KwikModel(kwik_path)
----> 2 session = Session(kwik_path)

/Users/shabnamkadir/globalphy/phy/phy/cluster/session.py in __init__(self, kwik_path, clustering, model, use_store, phy_user_dir, waveform_filter)
     83                                       default_settings_path=settings_path,
     84                                       vm_classes=self._vm_classes,
---> 85                                       gui_classes=self._gui_classes,
     86                                       )
     87

/Users/shabnamkadir/globalphy/phy/phy/io/base.py in __init__(self, model, path, phy_user_dir, default_settings_path, vm_classes, gui_classes)
    380         self._pre_open()
    381         if model or path:
--> 382             self.open(path, model=model)
    383
    384     def _create_settings(self, default_settings_path):

/Users/shabnamkadir/globalphy/phy/phy/cluster/session.py in open(self, kwik_path, model)
    126     def open(self, kwik_path=None, model=None):
    127         self._backup_kwik(kwik_path)
--> 128         return super(Session, self).open(model=model, path=kwik_path)
    129
    130     @property

/Users/shabnamkadir/globalphy/phy/phy/io/base.py in open(self, path, model)
    433         self.experiment_path = (op.realpath(path)
    434                                 if path else self.phy_user_dir)
--> 435         self.emit('open')
    436
    437     def reopen(self):

/Users/shabnamkadir/globalphy/phy/phy/utils/event.py in emit(self, event, *args, **kwargs)
    108                 kwargs = {n: v for n, v in kwargs.items()
    109                           if n in argspec.args}
--> 110             res.append(callback(*args, **kwargs))
    111         return res
    112

/Users/shabnamkadir/globalphy/phy/phy/cluster/session.py in on_open(self)
    213
    214     def on_open(self):
--> 215         self._create_cluster_store()
    216
    217     def on_close(self):

/Users/shabnamkadir/globalphy/phy/phy/cluster/session.py in _create_cluster_store(self)
    191                                   features_masks_chunk_size=cs,
    192                                   waveforms_n_spikes_max=wns,
--> 193                                   waveforms_excerpt_size=wes,
    194                                   )
    195

/Users/shabnamkadir/globalphy/phy/phy/io/kwik/store_items.py in create_store(model, spikes_per_cluster, path, features_masks_chunk_size, waveforms_n_spikes_max, waveforms_excerpt_size, waveforms_chunk_size)
    706                                 n_spikes_max=waveforms_n_spikes_max,
    707                                 excerpt_size=waveforms_excerpt_size,
--> 708                                 chunk_size=waveforms_chunk_size,
    709                                 )
    710     cluster_store.register_item(ClusterStatistics)

/Users/shabnamkadir/globalphy/phy/phy/io/store.py in register_item(self, item_cls, **kwargs)
    542         """
    543         # Instantiate the item.
--> 544         item = item_cls(cluster_store=self, **kwargs)
    545         assert item.fields is not None
    546

/Users/shabnamkadir/globalphy/phy/phy/io/kwik/store_items.py in __init__(self, *args, **kwargs)
    385             spc = self._selector.subset_spikes_clusters(self.model.cluster_ids)
    386             if self.disk_store:
--> 387                 self.disk_store.save_file('waveforms_spikes', spc)
    388         self._spikes_per_cluster = spc
    389

/Users/shabnamkadir/globalphy/phy/phy/io/store.py in save_file(self, filename, data)
    200     def save_file(self, filename, data):
    201         path = op.realpath(op.join(self._directory, filename))
--> 202         _save_json(path, data)
    203
    204     def load_file(self, filename):

/Users/shabnamkadir/globalphy/phy/phy/utils/_misc.py in _save_json(path, data)
    117     path = op.realpath(op.expanduser(path))
    118     with open(path, 'w') as f:
--> 119         json.dump(data, f, cls=_CustomEncoder, indent=2)
    120
    121

/Users/shabnamkadir/miniconda/envs/globalphy/lib/python3.4/json/__init__.py in dump(obj, fp, skipkeys, ensure_ascii, check_circular, allow_nan, cls, indent, separators, default, sort_keys, **kw)
    176     # could accelerate with writelines in some versions of Python, at
    177     # a debuggability cost
--> 178     for chunk in iterable:
    179         fp.write(chunk)
    180

/Users/shabnamkadir/miniconda/envs/globalphy/lib/python3.4/json/encoder.py in _iterencode(o, _current_indent_level)
    420             yield from _iterencode_list(o, _current_indent_level)
    421         elif isinstance(o, dict):
--> 422             yield from _iterencode_dict(o, _current_indent_level)
    423         else:
    424             if markers is not None:

/Users/shabnamkadir/miniconda/envs/globalphy/lib/python3.4/json/encoder.py in _iterencode_dict(dct, _current_indent_level)
    394                 else:
    395                     chunks = _iterencode(value, _current_indent_level)
--> 396                 yield from chunks
    397         if newline_indent is not None:
    398             _current_indent_level -= 1

/Users/shabnamkadir/miniconda/envs/globalphy/lib/python3.4/json/encoder.py in _iterencode(o, _current_indent_level)
    427                     raise ValueError("Circular reference detected")
    428                 markers[markerid] = o
--> 429             o = _default(o)
    430             yield from _iterencode(o, _current_indent_level)
    431             if markers is not None:

/Users/shabnamkadir/globalphy/phy/phy/utils/_misc.py in default(self, obj)
     60     def default(self, obj):
     61         if isinstance(obj, np.ndarray):
---> 62             data_b64 = base64.b64encode(obj.data).decode('utf8')
     63             return dict(__ndarray__=data_b64,
     64                         dtype=str(obj.dtype),

/Users/shabnamkadir/miniconda/envs/globalphy/lib/python3.4/base64.py in b64encode(s, altchars)
     60     """
     61     # Strip off the trailing newline
---> 62     encoded = binascii.b2a_base64(s)[:-1]
     63     if altchars is not None:
     64         assert len(altchars) == 2, repr(altchars)

BufferError: memoryview: underlying buffer is not C-contiguous

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c753dd3f2f91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.