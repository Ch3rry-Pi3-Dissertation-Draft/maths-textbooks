```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 23}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Steps And Convolution}
```
# Chapter 23 - Steps And Convolution

Chapters 21 and 22 developed forward and inverse Laplace transforms for
functions described by one formula. Real inputs often switch on late, switch
off again, or change formula at known times. Products of transforms also need
a time-domain interpretation.

This chapter introduces two tools for those situations:

-   the **unit step function**, which describes switching and delay
-   **convolution**, which corresponds to multiplication in the transform domain

We will build piecewise signals, derive the second-shifting theorem, calculate
convolutions directly, invert products, and solve convolution-type integral
equations. Transforming derivatives and solving differential-equation
initial-value problems begins in Chapter 24.

```{=latex}
\Needspace{20\baselineskip}
```
## The Unit Step As A Switch {#block-1-the-unit-step-as-a-switch}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to read a shifted unit step as an instruction that changes value
at a specified time.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definition {#the-definition-2}

```{=latex}
\Needspace{10\baselineskip}
```
The unit step function is:

$$
u(t)=
\begin{cases}
0, & t<0,\\
1, & t\geq0.
\end{cases}
$$

```{=latex}
\Needspace{10\baselineskip}
```
A step shifted to time $a>0$ is:

$$
\boxed{
u(t-a)=
\begin{cases}
0, & t<a,\\
1, & t\geq a.
\end{cases}
}.
$$

Here $a$ is the switching time. The expression $t-a$ becomes zero when
$t=a$.

The exact value assigned at the single point $t=a$ does not affect a Laplace
integral. Some books use $u(0)=1/2$; the transform formulas are unchanged.

```{=latex}
\Needspace{12\baselineskip}
```
### Read The Shift Before Calculating {#read-the-shift-before-calculating-3}

For $u(t-4)$:

-   if $t<4$, then $u(t-4)=0$
-   if $t\geq4$, then $u(t-4)=1$

Therefore $u(t-4)$ switches on at $t=4$.

By contrast, $u(t+4)=u(t-(-4))$ switches at $t=-4$. On the transform domain
$t\geq0$, it is already on.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> solve the step's argument equal to zero; that value is the switch location.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiplying By A Step {#multiplying-by-a-step-4}

```{=latex}
\Needspace{10\baselineskip}
```
Let $q(t)$ be any function. Then:

$$
u(t-a)q(t)=
\begin{cases}
0, & t<a,\\
q(t), & t\geq a.
\end{cases}
$$

The step does not alter the formula after the switch. It suppresses that
formula before the switch.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
u(t-2)(t^2+1)=
\begin{cases}
0, & 0\leq t<2,\\
t^2+1, & t\geq2.
\end{cases}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Finite Pulse {#a-finite-pulse-5}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
p(t)=u(t-2)-u(t-5).
$$

Check the three time intervals separately.

```{=latex}
\Needspace{10\baselineskip}
```
For $0\leq t<2$, both steps are off:

$$
p(t)=0-0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $2\leq t<5$, the first step is on and the second is off:

$$
p(t)=1-0=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $t\geq5$, both steps are on:

$$
p(t)=1-1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combining the three interval checks gives the pulse formula:

$$
\boxed{
p(t)=
\begin{cases}
0, & 0\leq t<2,\\
1, & 2\leq t<5,\\
0, & t\geq5.
\end{cases}
}.
$$

The first step switches the pulse on; the second step switches it off.

```{=latex}
\Needspace{12\baselineskip}
```
### The Transform Of A Shifted Step {#the-transform-of-a-shifted-step-6}

```{=latex}
\Needspace{10\baselineskip}
```
Because $u(t-a)=0$ before $a$ and $1$ after $a$:

$$
\begin{aligned}
\mathcal{L}\{u(t-a)\}
&=\int_0^\infty e^{-st}u(t-a)\,dt\\
&=\int_a^\infty e^{-st}\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, evaluate the improper integral:

$$
\begin{aligned}
\int_a^\infty e^{-st}\,dt
&=\left[-\frac1s e^{-st}\right]_a^\infty\\
&=0-\left(-\frac1s e^{-as}\right)\\
&=\frac{e^{-as}}s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The evaluated improper integral gives the shifted-step transform:

$$
\boxed{
\mathcal{L}\{u(t-a)\}=\frac{e^{-as}}s,
\qquad a>0, s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

The factor $u(t-a)$ is zero before $t=a$ and one afterward. Differences of
steps create finite windows, and a delayed switch contributes the transform
factor $e^{-as}$.

```{=latex}
\Needspace{20\baselineskip}
```
## Building Piecewise Signals {#block-2-building-piecewise-signals}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to convert a piecewise function into one step-function formula and
verify that formula on every interval.

```{=latex}
\Needspace{12\baselineskip}
```
### The Baseline-And-Changes Method {#the-baseline-and-changes-method-9}

Start with the formula valid from $t=0$. At each switching time, add a step
multiplied by the required change.

```{=latex}
\Needspace{10\baselineskip}
```
If a signal begins at level $L_0$, changes by $J_1$ at $t=a$, and changes by
$J_2$ at $t=b$, write:

$$
h(t)=L_0+J_1u(t-a)+J_2u(t-b).
$$

The coefficients $J_1$ and $J_2$ are **jumps**, not necessarily the new
levels.

```{=latex}
\Needspace{12\baselineskip}
```
### A Three-Level Example {#a-three-level-example-10}

```{=latex}
\Needspace{10\baselineskip}
```
Represent:

$$
h(t)=
\begin{cases}
1, & 0\leq t<2,\\
4, & 2\leq t<5,\\
-1, & t\geq5.
\end{cases}
$$

The baseline is $1$.

```{=latex}
\Needspace{10\baselineskip}
```
At $t=2$, the level changes from $1$ to $4$, so the jump is:

$$
4-1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=5$, the level changes from $4$ to $-1$, so the jump is:

$$
-1-4=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the step representation is:

$$
\boxed{
h(t)=1+3u(t-2)-5u(t-5)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify Every Interval {#verify-every-interval-11}

```{=latex}
\Needspace{10\baselineskip}
```
For $0\leq t<2$, both steps are zero:

$$
h(t)=1+3(0)-5(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $2\leq t<5$, only the first step is one:

$$
h(t)=1+3(1)-5(0)=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $t\geq5$, both steps are one:

$$
h(t)=1+3(1)-5(1)=-1.
$$

The compact expression reproduces all three pieces.

```{=latex}
\Needspace{12\baselineskip}
```
### A Delayed Ramp That Becomes Flat {#a-delayed-ramp-that-becomes-flat-12}

![A delayed ramp that becomes a plateau](books/assets/chapter_23/chapter_23_figure-1.png)

```{=latex}
\Needspace{10\baselineskip}
```
The graph represents:

$$
g(t)=
\begin{cases}
0, & 0\leq t<1,\\
t-1, & 1\leq t<3,\\
2, & t\geq3.
\end{cases}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Switch on a ramp at $t=1$:

$$
(t-1)u(t-1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=3$, subtract a new ramp with the same slope:

$$
\boxed{
g(t)=(t-1)u(t-1)-(t-3)u(t-3)
}.
$$

The second term cancels the slope after $t=3$ without cancelling the height
already accumulated.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Ramp And Plateau {#verify-the-ramp-and-plateau-13}

```{=latex}
\Needspace{10\baselineskip}
```
For $0\leq t<1$, both steps are off:

$$
g(t)=0-0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $1\leq t<3$, only the first step is on:

$$
g(t)=(t-1)-0=t-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $t\geq3$, both steps are on:

$$
\begin{aligned}
g(t)
&=(t-1)-(t-3)\\
&=t-1-t+3\\
&=2.
\end{aligned}
$$

This final cancellation explains the plateau.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Construction Errors {#common-construction-errors-14}

Avoid these mistakes:

-   using the new level as a step coefficient instead of the change in level
-   forgetting that every earlier step remains on at later times
-   writing $(t-a)u(t-b)$ when the local formula should start from zero at $b$
-   checking only one interval

The safest test is to substitute step values on every interval.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

Build a piecewise signal from its baseline and later changes. For changing
slopes, add or subtract shifted local formulas and verify every time interval.

```{=latex}
\Needspace{20\baselineskip}
```
## Translation In Time {#block-3-translation-in-time}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to understand why a delay in time becomes multiplication by
$e^{-as}$ in the transform domain.

```{=latex}
\Needspace{12\baselineskip}
```
### The Second-Shifting Theorem {#the-second-shifting-theorem-17}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
F(s)=\mathcal{L}\{f(t)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then, for $a>0$:

$$
\boxed{
\mathcal{L}\{u(t-a)f(t-a)\}
=e^{-as}F(s)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading the same pair backward gives:

$$
\boxed{
\mathcal{L}^{-1}\{e^{-as}F(s)\}
=u(t-a)f(t-a)
}.
$$

The step and the shifted argument must appear together.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Shift Carefully {#derive-the-shift-carefully-18}

```{=latex}
\Needspace{10\baselineskip}
```
Because the step is zero before $a$:

$$
\mathcal{L}\{u(t-a)f(t-a)\}
=\int_a^\infty e^{-st}f(t-a)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the substitution:

$$
v=t-a,
\qquad
t=v+a,
\qquad
dt=dv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The lower limit $t=a$ becomes $v=0$. Substitute into the integral:

$$
\begin{aligned}
\int_a^\infty e^{-st}f(t-a)\,dt
&=\int_0^\infty e^{-s(v+a)}f(v)\,dv\\
&=e^{-as}\int_0^\infty e^{-sv}f(v)\,dv\\
&=e^{-as}F(s).
\end{aligned}
$$

This derivation shows exactly where the exponential delay factor comes from.

```{=latex}
\Needspace{12\baselineskip}
```
### An Inverse Delayed-Sine Example {#an-inverse-delayed-sine-example-19}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}^{-1}\left\{
e^{-3s}\frac2{s^2+4}
\right\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First identify the unshifted inverse:

$$
F(s)=\frac2{s^2+2^2}
\quad\Longrightarrow\quad
f(t)=\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factor $e^{-3s}$ gives a delay of $a=3$. Replace $t$ by $t-3$ inside
$f$ and attach the step $u(t-3)$:

$$
\boxed{
\mathcal{L}^{-1}\left\{
e^{-3s}\frac2{s^2+4}
\right\}
=u(t-3)\sin\bigl(2(t-3)\bigr)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Forward Delayed-Polynomial Example {#a-forward-delayed-polynomial-example-20}

```{=latex}
\Needspace{10\baselineskip}
```
Find the transform of:

$$
u(t-4)(t-4)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $f(t)=t^2$, whose transform is:

$$
F(s)=\mathcal{L}\{t^2\}=\frac{2}{s^3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the delay $a=4$:

$$
\boxed{
\mathcal{L}\{u(t-4)(t-4)^2\}
=e^{-4s}\frac2{s^3}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### When The Formula Is Not Written Locally {#when-the-formula-is-not-written-locally-21}

Find $\mathcal{L}\{u(t-2)t^2\}$.

```{=latex}
\Needspace{10\baselineskip}
```
The second-shifting theorem needs a function of $t-2$, but the given factor is
$t^2$. Write:

$$
t=(t-2)+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Square both sides:

$$
\begin{aligned}
t^2
&=\bigl((t-2)+2\bigr)^2\\
&=(t-2)^2+4(t-2)+4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting the rewritten square into the switched expression gives:

$$
u(t-2)t^2
=u(t-2)\left[(t-2)^2+4(t-2)+4\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding unshifted function is $f(v)=v^2+4v+4$, with transform:

$$
\begin{aligned}
F(s)
&=\frac2{s^3}+\frac4{s^2}+\frac4s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the delay factor:

$$
\boxed{
\mathcal{L}\{u(t-2)t^2\}
=e^{-2s}\left(
\frac2{s^3}+\frac4{s^2}+\frac4s
\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Ramp-Plateau Signal {#transform-the-ramp-plateau-signal-22}

```{=latex}
\Needspace{10\baselineskip}
```
Block 2 found:

$$
g(t)=(t-1)u(t-1)-(t-3)u(t-3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Each term is a delayed copy of $f(t)=t$, for which
$F(s)=1/s^2$. Apply the second-shifting theorem to each delay:

$$
\begin{aligned}
\mathcal{L}\{(t-1)u(t-1)\}
&=\frac{e^{-s}}{s^2},\\
\mathcal{L}\{(t-3)u(t-3)\}
&=\frac{e^{-3s}}{s^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use linearity:

$$
\boxed{
\mathcal{L}\{g(t)\}
=\frac{e^{-s}-e^{-3s}}{s^2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Most Common Shift Mistake {#the-most-common-shift-mistake-23}

```{=latex}
\Needspace{10\baselineskip}
```
The theorem applies directly to:

$$
u(t-a)f(t-a),
$$

not to $u(t-a)f(t)$.

```{=latex}
\Needspace{10\baselineskip}
```
If the expression is $u(t-a)f(t)$, set $v=t-a$, so $t=v+a$. The local
function becomes $f(v+a)$:

$$
\boxed{
\mathcal{L}\{u(t-a)f(t)\}
=e^{-as}\mathcal{L}\{f(t+a)\}
}.
$$

The $t$ inside the transform on the right is a fresh dummy time variable.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-24}

A factor $e^{-as}$ represents a delay only when the time-domain result is
both switched by $u(t-a)$ and shifted internally from $t$ to $t-a$.

```{=latex}
\Needspace{20\baselineskip}
```
## Convolution In The Time Domain {#block-4-convolution-in-the-time-domain}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-25}

The goal is to calculate convolution directly and understand how one function
is combined with shifted copies of another.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definition {#the-definition-26}

```{=latex}
\Needspace{10\baselineskip}
```
For functions $f$ and $g$ defined on $t\geq0$, their convolution is:

$$
\boxed{
(f*g)(t)
=\int_0^t f(\tau)g(t-\tau)\,d\tau
}.
$$

Here:

-   $t$ is the output time
-   $\tau$ is a dummy integration variable
-   $g(t-\tau)$ is a shifted and reversed copy of $g$
-   the star $*$ means convolution, not ordinary multiplication

The upper limit is $t$, so the amount of overlap changes with time.

```{=latex}
\Needspace{12\baselineskip}
```
### A First Polynomial Convolution {#a-first-polynomial-convolution-27}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
f(t)=1,
\qquad
g(t)=t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $f(\tau)=1$ and $g(t-\tau)=(t-\tau)^2$ into the definition:

$$
\begin{aligned}
(f*g)(t)
&=\int_0^t 1\cdot(t-\tau)^2\,d\tau.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the square:

$$
(t-\tau)^2=t^2-2t\tau+\tau^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate term by term with respect to $\tau$:

$$
\begin{aligned}
(f*g)(t)
&=\int_0^t(t^2-2t\tau+\tau^2)\,d\tau\\
&=\left[t^2\tau-t\tau^2+\frac{\tau^3}{3}\right]_0^t\\
&=t^3-t^3+\frac{t^3}{3}\\
&=\boxed{\frac{t^3}{3}}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why Convolution Is Commutative {#why-convolution-is-commutative-28}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
(f*g)(t)=\int_0^t f(\tau)g(t-\tau)\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $v=t-\tau$, so $d\tau=-dv$. The limits change as follows:

$$
\tau=0\Rightarrow v=t,
\qquad
\tau=t\Rightarrow v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute and reverse the limits:

$$
\begin{aligned}
(f*g)(t)
&=\int_t^0 f(t-v)g(v)(-dv)\\
&=\int_0^t g(v)f(t-v)\,dv\\
&=(g*f)(t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The change of variable proves the commutative property:

$$
\boxed{f*g=g*f}.
$$

Commutativity lets us choose whichever order makes the integral easier.

```{=latex}
\Needspace{12\baselineskip}
```
### Pulse Overlap Produces A Triangle {#pulse-overlap-produces-a-triangle-29}

![A pulse and the triangular convolution of two identical pulses](books/assets/chapter_23/chapter_23_figure-2.png)

Let $p(t)=1$ on $0\leq t<2$ and zero otherwise. In $(p*p)(t)$, the integrand
equals one wherever two width-$2$ intervals overlap.

```{=latex}
\Needspace{10\baselineskip}
```
For $0\leq t\leq2$, the overlap length grows from $0$ to $2$, so:

$$
(p*p)(t)=t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $2\leq t\leq4$, the overlap length shrinks from $2$ to $0$, so:

$$
(p*p)(t)=4-t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Outside $0\leq t\leq4$, there is no overlap. Thus:

$$
\boxed{
(p*p)(t)=
\begin{cases}
t, & 0\leq t\leq2,\\
4-t, & 2\leq t\leq4,\\
0, & t>4.
\end{cases}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> convolution measures accumulated overlap, which is why two rectangular
> pulses produce a triangular output.

```{=latex}
\Needspace{12\baselineskip}
```
### An Exponential Convolution {#an-exponential-convolution-30}

```{=latex}
\Needspace{10\baselineskip}
```
Let $f(t)=e^{-t}$ and $g(t)=e^{-3t}$. Substitute into the definition:

$$
\begin{aligned}
(f*g)(t)
&=\int_0^t e^{-\tau}e^{-3(t-\tau)}\,d\tau.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the exponential factors:

$$
\begin{aligned}
e^{-\tau}e^{-3(t-\tau)}
&=e^{-\tau}e^{-3t+3\tau}\\
&=e^{-3t}e^{2\tau}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the factor $e^{-3t}$ outside the $\tau$-integral:

$$
\begin{aligned}
(f*g)(t)
&=e^{-3t}\int_0^t e^{2\tau}\,d\tau\\
&=e^{-3t}\left[\frac12e^{2\tau}\right]_0^t\\
&=\frac12e^{-3t}(e^{2t}-1)\\
&=\boxed{\frac12(e^{-t}-e^{-3t})}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Linearity Of Convolution {#linearity-of-convolution-31}

```{=latex}
\Needspace{10\baselineskip}
```
Convolution distributes over sums:

$$
f*(g+h)=f*g+f*h.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Constants can move outside:

$$
(cf)*g=c(f*g)=f*(cg).
$$

These properties follow by applying ordinary integral linearity to the
convolution definition.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-32}

Convolution integrates $f(\tau)g(t-\tau)$ from $0$ to $t$. It is commutative
and linear, and it can be interpreted as accumulated overlap.

```{=latex}
\Needspace{20\baselineskip}
```
## The Convolution Theorem {#block-5-the-convolution-theorem}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-33}

The goal is to connect multiplication in the transform domain with
convolution in the time domain.

```{=latex}
\Needspace{12\baselineskip}
```
### The Theorem {#the-theorem-34}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
F(s)=\mathcal{L}\{f(t)\},
\qquad
G(s)=\mathcal{L}\{g(t)\},
$$

```{=latex}
\Needspace{10\baselineskip}
```
then, under the usual convergence assumptions:

$$
\boxed{
\mathcal{L}\{f*g\}=F(s)G(s)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading the theorem backward:

$$
\boxed{
\mathcal{L}^{-1}\{F(s)G(s)\}=(f*g)(t)
}.
$$

This is not the false rule
$\mathcal{L}^{-1}\{FG\}=\mathcal{L}^{-1}\{F\}\mathcal{L}^{-1}\{G\}$.
The time-domain operation is convolution, not ordinary multiplication.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Product Appears {#why-the-product-appears-35}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the transform of the convolution:

$$
\mathcal{L}\{f*g\}
=\int_0^\infty e^{-st}
\left[
\int_0^t f(\tau)g(t-\tau)\,d\tau
\right]dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $v=t-\tau$, so $t=\tau+v$. The triangular region
$0\leq\tau\leq t<\infty$ becomes the first quadrant
$\tau\geq0$, $v\geq0$. Under conditions that permit changing the order:

$$
\begin{aligned}
\mathcal{L}\{f*g\}
&=\int_0^\infty\int_0^\infty
e^{-s(\tau+v)}f(\tau)g(v)\,dv\,d\tau\\
&=\left(\int_0^\infty e^{-s\tau}f(\tau)\,d\tau\right)
\left(\int_0^\infty e^{-sv}g(v)\,dv\right)\\
&=F(s)G(s).
\end{aligned}
$$

The kernel separates because $e^{-s(\tau+v)}=e^{-s\tau}e^{-sv}$.

```{=latex}
\Needspace{12\baselineskip}
```
### An Inverse Product With A Constant Function {#an-inverse-product-with-a-constant-function-36}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}^{-1}\left\{\frac1{s(s+2)}\right\}
$$

using convolution.

```{=latex}
\Needspace{10\baselineskip}
```
Factor the transform as:

$$
\frac1{s(s+2)}=\frac1s\frac1{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Identify the inverse of each factor:

$$
\frac1s\longleftrightarrow1,
\qquad
\frac1{s+2}\longleftrightarrow e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the required inverse is $1*e^{-2t}$:

$$
\begin{aligned}
(1*e^{-2t})(t)
&=\int_0^t1\cdot e^{-2(t-\tau)}\,d\tau\\
&=e^{-2t}\int_0^t e^{2\tau}\,d\tau\\
&=e^{-2t}\left[\frac12e^{2\tau}\right]_0^t\\
&=\frac12(1-e^{-2t}).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The convolution calculation gives the inverse product:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac1{s(s+2)}\right\}
=\frac12(1-e^{-2t})
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Product Of Two Trigonometric Transforms {#a-product-of-two-trigonometric-transforms-37}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}^{-1}\left\{\frac1{(s^2+1)^2}\right\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the transform as a product:

$$
\frac1{(s^2+1)^2}
=\frac1{s^2+1}\frac1{s^2+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1/(s^2+1)\longleftrightarrow\sin t$, the inverse is:

$$
(\sin*\sin)(t)=\int_0^t\sin\tau\sin(t-\tau)\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the product-to-sum identity:

$$
\sin\tau\sin(t-\tau)
=\frac12\left[\cos(2\tau-t)-\cos t\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both terms:

$$
\begin{aligned}
(\sin*\sin)(t)
&=\frac12\int_0^t\left[\cos(2\tau-t)-\cos t\right]d\tau\\
&=\frac12\left[
\frac12\sin(2\tau-t)-\tau\cos t
\right]_0^t\\
&=\frac12\left[\sin t-t\cos t\right].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The completed trigonometric convolution gives:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac1{(s^2+1)^2}\right\}
=\frac12(\sin t-t\cos t)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Combine Convolution With Delay {#combine-convolution-with-delay-38}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}^{-1}\left\{
\frac{e^{-2s}}{s(s+3)}
\right\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First ignore the delay and invert $1/[s(s+3)]$ by convolution:

$$
\begin{aligned}
f(t)
&=(1*e^{-3t})(t)\\
&=\int_0^t e^{-3(t-\tau)}\,d\tau\\
&=\frac13(1-e^{-3t}).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply the factor $e^{-2s}$. Replace $t$ by $t-2$ inside $f$ and attach
$u(t-2)$:

$$
\boxed{
\mathcal{L}^{-1}\left\{
\frac{e^{-2s}}{s(s+3)}
\right\}
=\frac13u(t-2)
\left[1-e^{-3(t-2)}\right]
}.
$$

Convolution handles the product; the second-shifting theorem handles the
delay.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-39}

Products of transforms correspond to convolutions of inverse transforms.
Perform the undelayed inversion first, then apply any exponential delay factor.

```{=latex}
\Needspace{20\baselineskip}
```
## Convolution Integral Equations {#block-6-convolution-integral-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to convert an unknown function inside a convolution integral into
an algebraic equation for its transform.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Pattern {#the-general-pattern-41}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y(t)=r(t)+\lambda\int_0^t k(t-\tau)y(\tau)\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The integral is $(k*y)(t)$, so:

$$
y=r+\lambda(k*y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
Y(s)=\mathcal{L}\{y(t)\},
\quad
R(s)=\mathcal{L}\{r(t)\},
\quad
K(s)=\mathcal{L}\{k(t)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform both sides and apply the convolution theorem:

$$
Y=R+\lambda KY.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the term containing $Y$ to the left and factor:

$$
\begin{aligned}
Y-\lambda KY&=R,\\
Y(1-\lambda K)&=R.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving the factored equation for the unknown transform gives:

$$
\boxed{
Y(s)=\frac{R(s)}{1-\lambda K(s)}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### An Equation With A Linear Kernel {#an-equation-with-a-linear-kernel-42}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y(t)=t+\int_0^t(t-\tau)y(\tau)\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The integral is a convolution with $k(t)=t$. Transform the known functions:

$$
\mathcal{L}\{t\}=\frac1{s^2},
\qquad
K(s)=\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $Y(s)=\mathcal{L}\{y(t)\}$. Transform the equation:

$$
Y=\frac1{s^2}+\frac1{s^2}Y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $Y/s^2$ to the left:

$$
Y\left(1-\frac1{s^2}\right)=\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $Y$ one step at a time:

$$
\begin{aligned}
Y
&=\frac{1/s^2}{1-1/s^2}\\
&=\frac{1/s^2}{(s^2-1)/s^2}\\
&=\frac1{s^2-1}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $\mathcal{L}\{\sinh t\}=1/(s^2-1)$:

$$
\boxed{y(t)=\sinh t}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Integral Equation Directly {#verify-the-integral-equation-directly-43}

```{=latex}
\Needspace{10\baselineskip}
```
For $y(t)=\sinh t$, the convolution integral is:

$$
I(t)=\int_0^t(t-\tau)\sinh\tau\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Split the factor $t-\tau$:

$$
I(t)=t\int_0^t\sinh\tau\,d\tau
-\int_0^t\tau\sinh\tau\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the two integrals:

$$
\int_0^t\sinh\tau\,d\tau=\cosh t-1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and, by integration by parts:

$$
\int_0^t\tau\sinh\tau\,d\tau
=t\cosh t-\sinh t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute them into $I(t)$:

$$
\begin{aligned}
I(t)
&=t(\cosh t-1)-(t\cosh t-\sinh t)\\
&=\sinh t-t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side of the original equation becomes:

$$
t+I(t)=t+(\sinh t-t)=\sinh t=y(t).
$$

The solution satisfies the integral equation.

```{=latex}
\Needspace{12\baselineskip}
```
### An Equation With An Exponential Kernel {#an-equation-with-an-exponential-kernel-44}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y(t)=2+\int_0^t e^{-(t-\tau)}y(\tau)\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $r(t)=2$ and $k(t)=e^{-t}$, so:

$$
R(s)=\frac2s,
\qquad
K(s)=\frac1{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the equation:

$$
Y=\frac2s+\frac1{s+1}Y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the convolution term and factor $Y$:

$$
Y\left(1-\frac1{s+1}\right)=\frac2s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the factor:

$$
1-\frac1{s+1}=\frac{s}{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $Y$:

$$
\begin{aligned}
Y
&=\frac{2/s}{s/(s+1)}\\
&=\frac{2(s+1)}{s^2}\\
&=\frac2s+\frac2{s^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert term by term:

$$
\boxed{y(t)=2+2t}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-45}

Recognise the integral as a convolution, transform it into a product, solve
the resulting algebraic equation for $Y(s)$, and verify when practical.

```{=latex}
\Needspace{20\baselineskip}
```
## Choosing The Right Route {#block-7-choosing-the-right-route}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-46}

The goal is to decide whether a problem calls for interval checking,
translation, direct convolution, or the convolution theorem.

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Workflow {#a-reliable-workflow-47}

Use this decision sequence:

1.  If the function changes at known times, build or inspect unit steps.
2.  If $e^{-as}$ appears, invert the undelayed factor before translating.
3.  If a time expression contains $u(t-a)f(t)$, rewrite it using $t-a$.
4.  If a transform is a useful product $F(s)G(s)$, consider convolution.
5.  If an unknown occurs inside $\int_0^t k(t-\tau)y(\tau)d\tau$, transform the
    entire integral equation and solve for $Y(s)$.
6.  Verify step representations interval by interval and transform answers by
    applying the forward theorem.

```{=latex}
\Needspace{12\baselineskip}
```
### Shift And Convolution Must Not Be Confused {#shift-and-convolution-must-not-be-confused-48}

```{=latex}
\Needspace{10\baselineskip}
```
The factor $e^{-as}$ signals a time delay:

$$
e^{-as}F(s)
\longleftrightarrow
u(t-a)f(t-a).
$$

```{=latex}
\Needspace{10\baselineskip}
```
A product without that exponential signals convolution:

$$
F(s)G(s)
\longleftrightarrow
(f*g)(t).
$$

If both occur, convolve first to obtain the undelayed function, then delay the
result.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Errors {#common-errors-49}

Check for these frequent mistakes:

-   treating $u(t-a)$ as one before $t=a$
-   using final levels instead of jumps in a step representation
-   writing $e^{-as}F(s)$ for $u(t-a)f(t)$ without rewriting the local function
-   forgetting the argument $t-\tau$ in a convolution
-   multiplying inverse transforms instead of convolving them
-   leaving $Y$ on both sides of a transformed integral equation
-   applying the time delay to only part of the reconstructed function

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-50}

Steps control switching, exponential factors control delay, and transform
products control convolution. Identify the structure before calculating.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Steps And Translation {#problems-1-to-4-steps-and-translation-51}

#### Problem 1: Read A Step Combination

Write $h(t)=2-3u(t-1)+5u(t-4)$ as a piecewise function.

#### Problem 2: Build A Three-Level Signal

Write with unit steps a function that is $0$ for $0\leq t<2$, $4$ for
$2\leq t<5$, and $1$ for $t\geq5$.

#### Problem 3: Transform A Delayed Sine

Find $\mathcal{L}\{u(t-3)\sin(4(t-3))\}$.

#### Problem 4: Invert A Delayed Exponential

Find $\mathcal{L}^{-1}\{e^{-2s}/(s+5)\}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Convolution And Products {#problems-5-to-8-convolution-and-products-52}

#### Problem 5: Rewrite Before Transforming

Find $\mathcal{L}\{u(t-2)t\}$.

#### Problem 6: Convolve Two Powers

Find $(1*t)(t)$ directly from the definition.

#### Problem 7: Convolve Two Exponentials

Find $(e^{-t}*e^{-2t})(t)$.

#### Problem 8: Invert A Product

Use convolution to find $\mathcal{L}^{-1}\{1/[s(s^2+9)]\}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Combined Methods {#problems-9-to-12-combined-methods-53}

#### Problem 9: Convolve A Repeated Trigonometric Factor

Find $\mathcal{L}^{-1}\{1/(s^2+4)^2\}$ by convolution.

#### Problem 10: Delay An Inverse Product

Find $\mathcal{L}^{-1}\{e^{-s}/[s(s+2)]\}$.

#### Problem 11: Solve An Integral Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y(t)=1+2\int_0^t y(\tau)\,d\tau.
$$

#### Problem 12: Diagnose A Translation Error

A learner claims
$\mathcal{L}\{u(t-3)f(t)\}=e^{-3s}F(s)$. Explain the error and give the
correct general relation.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-54}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Before $t=1$, both steps are zero, so $h=2$. Between $1$ and $4$, only the
first step is one, so $h=2-3=-1$. After $t=4$, both are one, so
$h=2-3+5=4$. Therefore:

$$
\boxed{
h(t)=
\begin{cases}
2, & 0\leq t<1,\\
-1, & 1\leq t<4,\\
4, & t\geq4.
\end{cases}}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
The baseline is $0$. The jump at $2$ is $4-0=4$, and the jump at $5$ is
$1-4=-3$. Hence:

$$
\boxed{h(t)=4u(t-2)-3u(t-5)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Use $\mathcal{L}\{\sin(4t)\}=4/(s^2+16)$ and delay by $3$:

$$
\boxed{
\mathcal{L}\{u(t-3)\sin(4(t-3))\}
=e^{-3s}\frac4{s^2+16}}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The undelayed inverse is $\mathcal{L}^{-1}\{1/(s+5)\}=e^{-5t}$. Apply the
delay $a=2$ to the entire function:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac{e^{-2s}}{s+5}\right\}
=u(t-2)e^{-5(t-2)}}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-55}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite $t=(t-2)+2$:

$$
u(t-2)t=u(t-2)[(t-2)+2].
$$

```{=latex}
\Needspace{10\baselineskip}
```
The unshifted transform is $1/s^2+2/s$, so:

$$
\boxed{
\mathcal{L}\{u(t-2)t\}
=e^{-2s}\left(\frac1{s^2}+\frac2s\right)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Use $f(\tau)=1$ and $g(t-\tau)=t-\tau$:

$$
\begin{aligned}
(1*t)(t)
&=\int_0^t(t-\tau)\,d\tau\\
&=\left[t\tau-\frac{\tau^2}{2}\right]_0^t\\
&=\boxed{\frac{t^2}{2}}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the two exponentials into the convolution definition:

$$
\begin{aligned}
(e^{-t}*e^{-2t})(t)
&=\int_0^t e^{-\tau}e^{-2(t-\tau)}\,d\tau\\
&=e^{-2t}\int_0^t e^\tau\,d\tau\\
&=e^{-2t}(e^t-1)\\
&=\boxed{e^{-t}-e^{-2t}}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Use $1/s\longleftrightarrow1$ and
$1/(s^2+9)\longleftrightarrow(1/3)\sin(3t)$:

$$
\begin{aligned}
f(t)
&=\frac13\int_0^t\sin(3(t-\tau))\,d\tau\\
&=\frac13\left[\frac13\cos(3(t-\tau))\right]_0^t\\
&=\boxed{\frac{1-\cos(3t)}9}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-56}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Since $1/(s^2+4)\longleftrightarrow(1/2)\sin(2t)$:

$$
f(t)=\frac14\int_0^t\sin(2\tau)\sin(2(t-\tau))\,d\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using product-to-sum and integrating gives:

$$
\begin{aligned}
f(t)
&=\frac18\int_0^t[\cos(4\tau-2t)-\cos(2t)]\,d\tau\\
&=\frac18\left[\frac14\sin(4\tau-2t)-\tau\cos(2t)\right]_0^t\\
&=\boxed{\frac{\sin(2t)-2t\cos(2t)}{16}}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
First invert $1/[s(s+2)]$ by convolution:

$$
f(t)=\frac12(1-e^{-2t}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then apply the delay $a=1$:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac{e^{-s}}{s(s+2)}\right\}
=\frac12u(t-1)[1-e^{-2(t-1)}]}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Write the integral as $(1*y)(t)$. Transform the equation:

$$
Y=\frac1s+\frac2sY.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the $Y$ terms and solve:

$$
\begin{aligned}
Y\left(1-\frac2s\right)&=\frac1s,\\
Y\frac{s-2}{s}&=\frac1s,\\
Y&=\frac1{s-2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Inverting $Y(s)=1/(s-2)$ gives:

$$
\boxed{y(t)=e^{2t}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The second-shifting theorem requires $u(t-3)f(t-3)$, not
$u(t-3)f(t)$. Set $v=t-3$, so $t=v+3$:

$$
\begin{aligned}
\mathcal{L}\{u(t-3)f(t)\}
&=\int_3^\infty e^{-st}f(t)\,dt\\
&=e^{-3s}\int_0^\infty e^{-sv}f(v+3)\,dv.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the correct general relation is:

$$
\boxed{
\mathcal{L}\{u(t-3)f(t)\}
=e^{-3s}\mathcal{L}\{f(t+3)\}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 23 Final Summary {#chapter-23-final-summary-57}

```{=latex}
\Needspace{10\baselineskip}
```
The central transform pairs are:

$$
\begin{aligned}
u(t-a)f(t-a)
&\longleftrightarrow e^{-as}F(s),\\
(f*g)(t)
&\longleftrightarrow F(s)G(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For step functions, verify each interval. For translation, shift the internal
time argument as well as attaching the step. For convolution, use:

$$
(f*g)(t)=\int_0^t f(\tau)g(t-\tau)\,d\tau.
$$

```{=latex}
\Needspace{12\baselineskip}
```
For a convolution integral equation, transform the convolution into a product,
isolate $Y(s)$ completely, and then invert.

```{=latex}
\Needspace{8\baselineskip}
```
> switches describe when a formula is active, delays move a complete response
> in time, and convolution describes how two time-domain responses accumulate.
