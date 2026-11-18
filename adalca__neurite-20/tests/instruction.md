# Issue

**Title:** Fix MeanStream and CovStream

## Description

Hi @adalca,

Here are the fixes corresponding to . In the process, I noticed two extra bugs not mentioned in the original vxm issue:
- `CovStream` has a broadcasting error due to a few lines out of order (stack pasted below).
-  Both `MeanStream` and `CovStream` should have different behaviors in train/test mode. The original code would update `self.mean`, `self.count`, and `self.cov` every time the layer is called. I.e., instead of using frozen moving moments for test batches it would update them for every test batch. Fixed by explicitly checking for training status with the `_get_training_value()` function, and modifying `call` accordingly.

Stack for `CovStream` broadcasting error:

```bash
Epoch 1/2
---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
<ipython-input-6-d9fac15cce89> in <module>
----> 1 net.fit(
      2     [dummy_moving, dummy_fixed],
      3     [dummy_fixed, zero_phi],
      4     epochs=2,
      5     batch_size=4,

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/keras/engine/training.py in _method_wrapper(self, *args, **kwargs)
     64   def _method_wrapper(self, *args, **kwargs):
     65     if not self._in_multi_worker_mode():  # pylint: disable=protected-access
---> 66       return method(self, *args, **kwargs)
     67 
     68     # Running inside `run_distribute_coordinator` already.

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/keras/engine/training.py in fit(self, x, y, batch_size, epochs, verbose, callbacks, validation_split, validation_data, shuffle, class_weight, sample_weight, initial_epoch, steps_per_epoch, validation_steps, validation_batch_size, validation_freq, max_queue_size, workers, use_multiprocessing)
    846                 batch_size=batch_size):
    847               callbacks.on_train_batch_begin(step)
--> 848               tmp_logs = train_function(iterator)
    849               # Catch OutOfRangeError for Datasets of unknown size.
    850               # This blocks until the batch has finished executing.

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/def_function.py in __call__(self, *args, **kwds)
    578         xla_context.Exit()
    579     else:
--> 580       result = self._call(*args, **kwds)
    581 
    582     if tracing_count == self._get_tracing_count():

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/def_function.py in _call(self, *args, **kwds)
    625       # This is the first call of __call__, so we have to initialize.
    626       initializers = []
--> 627       self._initialize(args, kwds, add_initializers_to=initializers)
    628     finally:
    629       # At this point we know that the initialization is complete (or less

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/def_function.py in _initialize(self, args, kwds, add_initializers_to)
    503     self._graph_deleter = FunctionDeleter(self._lifted_initializer_graph)
    504     self._concrete_stateful_fn = (
--> 505         self._stateful_fn._get_concrete_function_internal_garbage_collected(  # pylint: disable=protected-access
    506             *args, **kwds))
    507 

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/function.py in _get_concrete_function_internal_garbage_collected(self, *args, **kwargs)
   2444       args, kwargs = None, None
   2445     with self._lock:
-> 2446       graph_function, _, _ = self._maybe_define_function(args, kwargs)
   2447     return graph_function
   2448 

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/function.py in _maybe_define_function(self, args, kwargs)
   2775 
   2776       self._function_cache.missed.add(call_context_key)
-> 2777       graph_function = self._create_graph_function(args, kwargs)
   2778       self._function_cache.primary[cache_key] = graph_function
   2779       return graph_function, args, kwargs

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/function.py in _create_graph_function(self, args, kwargs, override_flat_arg_shapes)
   2655     arg_names = base_arg_names + missing_arg_names
   2656     graph_function = ConcreteFunction(
-> 2657         func_graph_module.func_graph_from_py_func(
   2658             self._name,
   2659             self._python_function,

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/func_graph.py in func_graph_from_py_func(name, python_func, args, kwargs, signature, func_graph, autograph, autograph_options, add_control_dependencies, arg_names, op_return_value, collections, capture_by_value, override_flat_arg_shapes)
    979         _, original_func = tf_decorator.unwrap(python_func)
    980 
--> 981       func_outputs = python_func(*func_args, **func_kwargs)
    982 
    983       # invariant: `func_outputs` contains only Tensors, CompositeTensors,

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/eager/def_function.py in wrapped_fn(*args, **kwds)
    439         # __wrapped__ allows AutoGraph to swap in a converted function. We give
    440         # the function a weak reference to itself to avoid a reference cycle.
--> 441         return weak_wrapped_fn().__wrapped__(*args, **kwds)
    442     weak_wrapped_fn = weakref.ref(wrapped_fn)
    443 

~/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/func_graph.py in wrapper(*args, **kwargs)
    966           except Exception as e:  # pylint:disable=broad-except
    967             if hasattr(e, "ag_error_metadata"):
--> 968               raise e.ag_error_metadata.to_exception(e)
    969             else:
    970               raise

ValueError: in user code:

    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/keras/engine/training.py:571 train_function  *
        outputs = self.distribute_strategy.run(
    ./ext/neurite-master/neurite/tf/layers.py:1711 call  *
        new_mean, new_count = _mean_update(self.mean, self.count, x, self.cap)
    ./ext/neurite-master/neurite/tf/layers.py:1823 _mean_update  *
        new_mean = pre_mean * (1-alpha) + (this_sum/this_bs) * alpha
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/ops/math_ops.py:984 binary_op_wrapper
        return func(x, y, name=name)
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/ops/math_ops.py:1276 _add_dispatch
        return gen_math_ops.add_v2(x, y, name=name)
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/ops/gen_math_ops.py:482 add_v2
        _, _, _op, _outputs = _op_def_library._apply_op_helper(
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/op_def_library.py:742 _apply_op_helper
        op = g._create_op_internal(op_type_name, inputs, dtypes=None,
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/func_graph.py:593 _create_op_internal
        return super(FuncGraph, self)._create_op_internal(  # pylint: disable=protected-access
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/ops.py:3319 _create_op_internal
        ret = Operation(
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/ops.py:1816 __init__
        self._c_op = _create_c_op(self._graph, node_def, inputs,
    /home/ubuntu/anaconda3/envs/tf2/lib/python3.8/site-packages/tensorflow/python/framework/ops.py:1657 _create_c_op
        raise ValueError(str(e))

    ValueError: Dimensions must be equal, but are 2 and 128 for '{{node model/cov_stream/add_1}} = AddV2[T=DT_FLOAT](model/cov_stream/mul, model/cov_stream/mul_1)' with input shapes: [8,8,2], [128].
```

Let me know if you would like any changes. :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56fb0148d18c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.