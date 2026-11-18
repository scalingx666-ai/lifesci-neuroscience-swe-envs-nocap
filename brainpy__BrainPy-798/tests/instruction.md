# Issue

**Title:** Improve JointEq error message for second-order ODEs and add documentation

## Description

Users implementing second-order ODE systems (e.g., Jansen-Rit neural mass model) encountered a cryptic error when using `JointEq`: "Variable 'y3' has been used... Please change another name." The actual issue was incorrect function signature ordering, not a naming conflict.

## Changes

**Error Message Enhancement**
- Clarified that parameters before `t` are state variables; parameters after `t` are dependencies
- Each state variable must be the first parameter before `t` in exactly one derivative function
- Added signature pattern examples directly in the error message

**Documentation**
- Added section to `joint_equations.ipynb` covering second-order ODE systems
- Includes harmonic oscillator example and complete Jansen-Rit model implementation
- Explains the required signature pattern with concrete examples

**Tests**
- Added `test_second_order_ode` for harmonic oscillator validation
- Added `test_second_order_ode_wrong_signature` to verify improved error messaging

## Example

Incorrect (from original issue):
```python
def dy0(self, y0, y3, t):  # Both y0 and y3 before t
    return y3 / 1000
```

Correct:
```python
def dy0(self, y0, t, y3):  # Only y0 before t, y3 is dependency
    return y3 / 1000

def dy3(self, y3, t, y0, y1, y2):  # Only y3 before t, others are dependencies
    return (self.A * Sp - 2 * y3 - y0 / self.te * 1000) / self.te
```

The new error message shows the current function signature and pattern guidance when this mistake occurs.

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>Joint second-order odes?</issue_title>
> <issue_description>I'm writing a realization of Jansen-Rit model by inheriting from brainpy.dyn.NeuDyn. It is composed of 3 second-order ODEs, so I depart them into 6 first-order ODEs. I also want to use JointEq to solve them simultaneously. However, there is
> ```
> DiffEqError: Variable "y3" has been used, however we got a same variable name in <bound method jansenrit.dy0 of jansenrit0(mode=NonBatchingMode, size=(1,))>. Please change another name.
> ```
>
> Could you see how to fix that? It would be better if you could update some realizations of second-order ODE systems using JointEq in the documentation. I've attached the sub class I wrote:
>
> ```
> class jansenrit(bp.dyn.NeuDyn):
>     def __init__(self, size=1, A=3.25, te=10, B=22, ti=20, C = 135, e0=2.5, r=0.56, v0=6, method = 'rk4', **kwargs):
>         super(jansenrit, self).__init__(size = size, **kwargs)
>         self.A = A
>         self.te = te
>         self.B = B
>         self.ti = ti
>         self.C = C
>         self.e0 = e0
>         self.r = r
>         self.v0 = v0
>
>         self.y0 = bm.Variable(0*bm.ones(self.num))
>         self.y1 = bm.Variable(0*bm.ones(self.num))
>         self.y2 = bm.Variable(0*bm.ones(self.num))
>         self.y3 = bm.Variable(0*bm.ones(self.num))
>         self.y4 = bm.Variable(0*bm.ones(self.num))
>         self.y5 = bm.Variable(0*bm.ones(self.num))
>
>         self.integral = bp.odeint(f = self.derivative, method=method)
>
>     def dy0(self, y0, y3, t):
>         dy0 = y3/1000
>         return dy0
>
>     def dy3(self, y3, t, y0, y1, y2):
>         Sp = 2*self.e0/(1 + bm.exp(self.r*(self.v0 - y1 + y2)))
>         dy3 = (self.A *Sp- 2 * y3 - y0/self.te*1000)/self.te
>         return dy3
>
>     def dy1(self, y4, t):
>         dy1 = y4/1000
>         return dy1
>
>     def dy4(self, y4, t, y0, y1, inp=0.):
>         Se = 2*self.e0/(1 + bm.exp(self.r*(self.v0 - self.C*y0)))
>         dy4 = (self.A * (inp + 0.8 * self.C * Se) - 2*y4 - y1/self.te*1000)/self.te
>         return dy4
>
>     def dy2(self, y5, t):
>         dy2 = y5/1000
>         return dy2
>
>     def dy5(self, y5, t, y0, y2):
>         Si = 2*self.e0/(1 + bm.exp(self.r*(self.v0 - 0.25*self.C*y0)))
>         dy5 = (self.B * 0.25 * self.C * Si - 2*y5 - y2/self.ti*1000)/self.ti
>         return dy5
>
>     @property
>     def derivative(self):
>         return bp.JointEq([self.dy3, self.dy4, self.dy5, self.dy0, self.dy1, self.dy2])
>
>     def update(self, inp=0.):
>         _t = bp.share['t']
>         _dt = bp.share['dt']
>
>         y0, y3, y1, y4, y2, y5 = self.integral(self.y0.value, self.y3.value, self.y1.value, self.y4.value, self.y2.value, self.y5.value, _t, inp, _dt)
>         self.y0.value = y0
>         self.y1.value = y1
>         self.y2.value = y2
>         self.y3.value = y3
>         self.y4.value = y4
>         self.y5.value = y5
>
>     def reset_state(self):
>         self.y0.value = bm.zeros(self.num)
>         self.y1.value = bm.zeros(self.num)
>         self.y2.value = bm.zeros(self.num)
>         self.y3.value = bm.zeros(self.num)
>         self.y4.value = bm.zeros(self.num)
>         self.y5.value = bm.zeros(self.num)
> ```</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

- Fixes brainpy/BrainPy#797

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79208a8e1b37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.