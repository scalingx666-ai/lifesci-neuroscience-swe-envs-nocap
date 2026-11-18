# Issue

**Title:** fix: Make a copy of connection tuples to avoid mutating wf.connect() arguments

## Description

Uncovered in nipreps/fmriprep#3668. Passing a list to `workflow.connect()` mutates the list if any of the connections uses an inline function. Regression test fails without fix:

```
============================================= FAILURES =============================================
________________________________ test_connect_preserves_input_list _________________________________

    def test_connect_preserves_input_list():
        """Regression test for connection list mutation.
    
        This only occurs when the connection contains an inline function node.
        """
        pipe = pe.Workflow(name="pipe")
        pipe.config["execution"]["poll_sleep_duration"] = 0.01
        mod1 = pe.Node(EngineTestInterface(input1=2), name="mod1")
        mod2 = pe.MapNode(EngineTestInterface(), iterfield="input1", name="mod2")
    
        connection_list = [(mod1, mod2, [(('output1', _add_one), 'input1')])]
        expected = [
            (in_node, out_node, deepcopy(connections))
            for in_node, out_node, connections in connection_list
        ]
        assert connection_list == expected
    
        pipe.connect(connection_list)
>       assert connection_list == expected
E       AssertionError: assert [(pipe.mod1, ..., 'input1')])] == [(pipe.mod1, ..., 'input1')])]
E         
E         At index 0 diff: (pipe.mod1, pipe.mod2, [(('output1', 'def _add_one(x):\n    return x + 1\n', ()), 'input1')]) != (pipe.mod1, pipe.mod2, [(('output1', <function _add_one at 0x7f3e059abab0>), 'input1')])
E         
E         Full diff:
E          
E         
E         ...Full output truncated (18 lines hidden), use '-vv' to show

nipype/pipeline/engine/tests/test_workflows.py:60: AssertionError
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4c671fe5581`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.