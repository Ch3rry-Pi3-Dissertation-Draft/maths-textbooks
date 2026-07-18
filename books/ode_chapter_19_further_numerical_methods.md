# Further Numerical Methods

Chapter 18 introduced explicit Euler's method. Euler uses one slope at the
left endpoint of each step, so it is simple but often requires a small step
size for useful accuracy.

This chapter develops methods that use more slope information:

- modified Euler samples both ends of a proposed step
- classical Runge--Kutta samples four carefully chosen stage points
- Adams--Bashforth--Moulton uses several previous slopes
- Milne's method combines a history-based predictor with a Simpson-type
  corrector

We continue to study:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0,
$$

on an equally spaced grid:

$$
x_n=x_0+nh.
$$

The main questions are:

- what information does each method sample?
- why does a predictor need a corrected endpoint slope?
- what do the four RK4 stages represent?
- what does the order of a method tell us about global error?
- why do multistep methods need start-up values?
- how are old slopes indexed in ABM4 and Milne's method?
- what can a large predictor--corrector gap warn us about?
- how should accuracy, stability, storage, and computational cost be balanced?

The figures, examples, numerical data, and exercises are independently
constructed. The reference text is used only as a map of the standard methods.

---

## Block 1: From One Slope To Several Slopes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to establish notation and see how one-step and multistep methods
improve on Euler in different ways.

</details>

<details open>
<summary><strong>Recall Euler's Limitation</strong></summary>

Euler's update is:

$$
y_{n+1}=y_n+h f(x_n,y_n).
$$

Define the current slope:

$$
f_n=f(x_n,y_n).
$$

Then Euler becomes:

$$
y_{n+1}=y_n+h f_n.
$$

The method assumes that the left-endpoint slope $f_n$ represents the whole
interval $[x_n,x_{n+1}]$. If the slope changes noticeably across that
interval, the approximation bends too late.

</details>

<details open>
<summary><strong>Two Ways To Gather More Information</strong></summary>

A **one-step method** calculates $y_{n+1}$ using information generated from the
current point $(x_n,y_n)$. Modified Euler and RK4 are one-step methods.

A **multistep method** also uses saved information from earlier points such as:

$$
f_{n-1},\qquad f_{n-2},\qquad f_{n-3}.
$$

ABM4 and Milne's method are multistep methods.

The practical difference:

> one-step methods spend more work inside the current interval; multistep
> methods reuse work stored from previous intervals.

</details>

<details open>
<summary><strong>Approximate Values And True Values</strong></summary>

Throughout this chapter:

- $y_n$ denotes a numerical approximation at $x_n$
- $y(x_n)$ denotes the true solution value
- $f_n=f(x_n,y_n)$ is a slope calculated from the numerical point
- $h=x_{n+1}-x_n$ is the constant step size

Do not silently replace $y_n$ by the true value $y(x_n)$. A numerical method
normally advances using its own approximate history.

</details>

<details open>
<summary><strong>Predictors And Correctors</strong></summary>

A **predictor** gives a provisional endpoint value:

$$
y_{n+1}^{(p)}.
$$

Use that predicted height to calculate a predicted endpoint slope:

$$
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right).
$$

A **corrector** then uses the new slope information to calculate an improved
endpoint value $y_{n+1}$.

The superscript $(p)$ means predicted. It is not a power.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Numerical methods differ mainly in where they sample slopes and how they
combine them.

Euler uses one old slope. Modified Euler predicts an endpoint and averages two
slopes. RK4 creates four stages inside one interval. Multistep methods combine
stored slopes from several intervals.

</details>

---

## Block 2: Modified Euler As A Predictor--Corrector Method

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive modified Euler, distinguish the predicted and corrected
values, and carry out two complete steps.

</details>

<details open>
<summary><strong>Predict With Euler</strong></summary>

At $(x_n,y_n)$, calculate:

$$
f_n=f(x_n,y_n).
$$

Euler predicts:

$$
\boxed{
y_{n+1}^{(p)}=y_n+h f_n
}.
$$

The next input is:

$$
x_{n+1}=x_n+h.
$$

Now calculate the slope at the predicted endpoint:

$$
\boxed{
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right)
}.
$$

</details>

<details open>
<summary><strong>Correct With The Average Slope</strong></summary>

Approximate the average slope across the interval by:

$$
\frac{f_n+f_{n+1}^{(p)}}{2}.
$$

Multiply this average by the step length $h$ and add it to $y_n$:

$$
\boxed{
y_{n+1}
=
y_n
+
\frac{h}{2}
\left(
f_n+f_{n+1}^{(p)}
\right)
}.
$$

Written as a complete algorithm:

$$
\boxed{
\begin{aligned}
x_{n+1}
&=x_n+h,\\
f_n
&=f(x_n,y_n),\\
y_{n+1}^{(p)}
&=y_n+h f_n,\\
f_{n+1}^{(p)}
&=f\left(x_{n+1},y_{n+1}^{(p)}\right),\\
y_{n+1}
&=y_n+\frac h2\left(f_n+f_{n+1}^{(p)}\right).
\end{aligned}
}
$$

This single-correction form is also called Heun's method.

</details>

<details open>
<summary><strong>Why The Average Is Better Than The Left Slope Alone</strong></summary>

Euler uses a rectangular estimate for the accumulated change:

$$
\Delta y\approx h f_n.
$$

Modified Euler uses a trapezoidal estimate:

$$
\Delta y
\approx
h\left(\frac{f_n+f_{n+1}^{(p)}}{2}\right).
$$

The right-endpoint slope is not known in advance, so the predictor supplies a
provisional point at which to estimate it.

</details>

<details open>
<summary><strong>A Two-Step Modified Euler Example</strong></summary>

Approximate $y(0.4)$ for:

$$
y'=2x-y+1,
\qquad
y(0)=0,
$$

using:

$$
h=0.2.
$$

Here:

$$
f(x,y)=2x-y+1,
\qquad
(x_0,y_0)=(0,0).
$$

</details>

<details open>
<summary><strong>Modified Euler Step 0 To Step 1</strong></summary>

Calculate the left slope:

$$
\begin{aligned}
f_0
&=f(x_0,y_0)\\
&=f(0,0)\\
&=2(0)-0+1\\
&=1.
\end{aligned}
$$

Update the input:

$$
x_1=x_0+h=0+0.2=0.2.
$$

Predict the endpoint height:

$$
\begin{aligned}
y_1^{(p)}
&=y_0+h f_0\\
&=0+0.2(1)\\
&=0.2.
\end{aligned}
$$

Calculate the predicted endpoint slope at $(x_1,y_1^{(p)})=(0.2,0.2)$:

$$
\begin{aligned}
f_1^{(p)}
&=f\left(x_1,y_1^{(p)}\right)\\
&=f(0.2,0.2)\\
&=2(0.2)-0.2+1\\
&=1.2.
\end{aligned}
$$

Correct using the average of $f_0$ and $f_1^{(p)}$:

$$
\begin{aligned}
y_1
&=
y_0+\frac h2\left(f_0+f_1^{(p)}\right)\\
&=
0+\frac{0.2}{2}(1+1.2)\\
&=
0.1(2.2)\\
&=0.22.
\end{aligned}
$$

Thus:

$$
\boxed{(x_1,y_1)=(0.2,0.22)}.
$$

The corrected value $0.22$, not the predictor $0.2$, begins the next step.

</details>

<details open>
<summary><strong>Modified Euler Step 1 To Step 2</strong></summary>

Use the corrected point $(x_1,y_1)=(0.2,0.22)$.

Calculate its slope:

$$
\begin{aligned}
f_1
&=f(x_1,y_1)\\
&=f(0.2,0.22)\\
&=2(0.2)-0.22+1\\
&=1.18.
\end{aligned}
$$

Update the input:

$$
x_2=x_1+h=0.2+0.2=0.4.
$$

Predict:

$$
\begin{aligned}
y_2^{(p)}
&=y_1+h f_1\\
&=0.22+0.2(1.18)\\
&=0.456.
\end{aligned}
$$

Calculate the predicted endpoint slope at $(0.4,0.456)$:

$$
\begin{aligned}
f_2^{(p)}
&=f(0.4,0.456)\\
&=2(0.4)-0.456+1\\
&=1.344.
\end{aligned}
$$

Correct:

$$
\begin{aligned}
y_2
&=
y_1+\frac h2\left(f_1+f_2^{(p)}\right)\\
&=
0.22+0.1(1.18+1.344)\\
&=
0.22+0.1(2.524)\\
&=0.4724.
\end{aligned}
$$

The second modified Euler step gives the endpoint estimate:

$$
\boxed{y(0.4)\approx0.4724}.
$$

</details>

<details open>
<summary><strong>Compare With Euler And The Exact Value</strong></summary>

With the same $h=0.2$, two Euler steps give:

$$
y_2^{\text{Euler}}=0.44.
$$

The exact solution is:

$$
y(x)=2x-1+e^{-x}.
$$

At $x=0.4$:

$$
\begin{aligned}
y(0.4)
&=2(0.4)-1+e^{-0.4}\\
&\approx0.470320.
\end{aligned}
$$

The two absolute errors are:

$$
|0.44-0.470320|
\approx0.030320,
$$

and:

$$
|0.4724-0.470320|
\approx0.002080.
$$

For this step size and problem, the corrected average slope is substantially
more accurate than Euler's left slope.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Modified Euler performs:

$$
\text{left slope}
\to
\text{Euler predictor}
\to
\text{predicted right slope}
\to
\text{average-slope correction}.
$$

Never carry the predictor forward as though it were the corrected solution.

</details>

---

## Block 3: Classical Fourth-Order Runge--Kutta

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret the four RK4 stages and calculate one complete step
without mixing slope and increment conventions.

</details>

<details open>
<summary><strong>The Increment Convention</strong></summary>

This chapter defines each $k_j$ as a proposed change in $y$, so every stage
already includes the factor $h$:

$$
\boxed{
\begin{aligned}
k_1
&=h f(x_n,y_n),\\
k_2
&=h f\left(x_n+\frac h2,y_n+\frac{k_1}{2}\right),\\
k_3
&=h f\left(x_n+\frac h2,y_n+\frac{k_2}{2}\right),\\
k_4
&=h f(x_n+h,y_n+k_3).
\end{aligned}
}
$$

The update is:

$$
\boxed{
y_{n+1}
=
y_n
+
\frac{k_1+2k_2+2k_3+k_4}{6}
}.
$$

Also:

$$
x_{n+1}=x_n+h.
$$

Some books define $k_j$ as slopes without $h$. Either convention is valid, but
the two formulas must not be mixed.

</details>

<details open>
<summary><strong>Where The Four Stages Sample</strong></summary>

![Schematic of the four classical RK4 stage locations](books/assets/chapter_19/chapter_19_figure-1.png)

The stages represent:

- $k_1$: a start-point increment
- $k_2$: a midpoint increment predicted using $k_1$
- $k_3$: a second midpoint increment predicted using $k_2$
- $k_4$: an endpoint increment predicted using $k_3$

The two midpoint stages are not duplicates. Their estimated heights differ.

</details>

<details open>
<summary><strong>Why The Weights Are One, Two, Two, One</strong></summary>

The final weighted increment is:

$$
\frac{k_1+2k_2+2k_3+k_4}{6}.
$$

The weights sum to:

$$
1+2+2+1=6.
$$

Thus the formula behaves like a weighted average of four increments, with
greater weight on the midpoint information.

The coefficients are chosen so that the Taylor expansion agrees with the true
solution through terms of order $h^4$.

</details>

<details open>
<summary><strong>A Complete RK4 Step</strong></summary>

Take one RK4 step for:

$$
y'=y-x^2,
\qquad
y(0)=0.5,
\qquad
h=0.2.
$$

The slope rule is:

$$
f(x,y)=y-x^2.
$$

The starting point is:

$$
(x_0,y_0)=(0,0.5).
$$

</details>

<details open>
<summary><strong>Stage 1</strong></summary>

Use the starting point:

$$
\begin{aligned}
k_1
&=h f(x_0,y_0)\\
&=0.2f(0,0.5)\\
&=0.2\left(0.5-0^2\right)\\
&=0.1.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Stage 2</strong></summary>

The midpoint input is:

$$
x_0+\frac h2=0+\frac{0.2}{2}=0.1.
$$

The first midpoint height estimate is:

$$
y_0+\frac{k_1}{2}
=
0.5+\frac{0.1}{2}
=
0.55.
$$

Substitute that midpoint:

$$
\begin{aligned}
k_2
&=
0.2f(0.1,0.55)\\
&=
0.2\left(0.55-(0.1)^2\right)\\
&=
0.2(0.54)\\
&=0.108.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Stage 3</strong></summary>

The midpoint input remains $0.1$. The second midpoint height uses $k_2$:

$$
y_0+\frac{k_2}{2}
=
0.5+\frac{0.108}{2}
=
0.554.
$$

Substitute:

$$
\begin{aligned}
k_3
&=
0.2f(0.1,0.554)\\
&=
0.2\left(0.554-(0.1)^2\right)\\
&=
0.2(0.544)\\
&=0.1088.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Stage 4</strong></summary>

The endpoint input is:

$$
x_0+h=0+0.2=0.2.
$$

The endpoint height estimate uses $k_3$:

$$
y_0+k_3=0.5+0.1088=0.6088.
$$

Substitute:

$$
\begin{aligned}
k_4
&=
0.2f(0.2,0.6088)\\
&=
0.2\left(0.6088-(0.2)^2\right)\\
&=
0.2(0.5688)\\
&=0.11376.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Combine The Four Stages</strong></summary>

Use:

$$
y_1
=
y_0
+
\frac{k_1+2k_2+2k_3+k_4}{6}.
$$

Substitute all four increments:

$$
\begin{aligned}
y_1
&=
0.5
+
\frac{
0.1+2(0.108)+2(0.1088)+0.11376
}{6}\\
&=
0.5+\frac{0.64736}{6}\\
&\approx0.607893.
\end{aligned}
$$

Combining the four weighted increments gives the RK4 endpoint estimate:

$$
\boxed{y(0.2)\approx0.607893}.
$$

The exact solution is:

$$
y(x)=x^2+2x+2-1.5e^x.
$$

At $x=0.2$:

$$
y(0.2)\approx0.607896.
$$

The one-step RK4 approximation agrees to about five decimal places.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

RK4 uses four linked stages. Each later stage must use the height estimate
created by the specified earlier stage.

The update weights are:

$$
1,\quad2,\quad2,\quad1.
$$

Keep the chosen $k$ convention visible throughout the calculation.

</details>

---

## Block 4: Order, Error, And Computational Cost

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret method order as an error-scaling statement and
compare improved accuracy with additional slope evaluations.

</details>

<details open>
<summary><strong>What Order Means</strong></summary>

A method of global order $p$ typically has error:

$$
E(h)=O(h^p)
$$

over a fixed interval, provided the solution is sufficiently smooth and the
method is used in a stable regime.

The corresponding local truncation error is usually:

$$
O(h^{p+1}).
$$

The methods studied so far have global orders:

| Method | Global order |
|---|---:|
| Euler | $1$ |
| Modified Euler | $2$ |
| Classical RK4 | $4$ |

</details>

<details open>
<summary><strong>What Step Halving Predicts</strong></summary>

Assume the error is in the asymptotic regime and follows:

$$
E(h)\approx C h^p,
$$

then:

$$
E\left(\frac h2\right)
\approx
C\left(\frac h2\right)^p
=
\frac{E(h)}{2^p}.
$$

Therefore halving $h$ should reduce error by approximately:

- a factor of $2$ for Euler
- a factor of $4$ for modified Euler
- a factor of $16$ for RK4

This comparison is asymptotic. It becomes reliable only when $h$ is already
small enough and roundoff or instability is not dominating.

</details>

<details open>
<summary><strong>An Original Error Comparison</strong></summary>

For:

$$
y'=2x-y+1,
\qquad
y(0)=0,
$$

the exact value at $x=1$ is:

$$
y(1)=1+e^{-1}\approx1.367879441.
$$

The absolute errors are:

| $h$ | Euler | Modified Euler | RK4 |
|---:|---:|---:|---:|
| $0.500$ | $1.1788\times10^{-1}$ | $2.2746\times10^{-2}$ | $2.9140\times10^{-4}$ |
| $0.250$ | $5.1473\times10^{-2}$ | $4.6496\times10^{-3}$ | $1.4758\times10^{-5}$ |
| $0.125$ | $2.4271\times10^{-2}$ | $1.0538\times10^{-3}$ | $8.31\times10^{-7}$ |

![Log-scale comparison of Euler, modified Euler, and RK4 errors](books/assets/chapter_19/chapter_19_figure-2.png)

The steeper RK4 line indicates faster error reduction as $h$ decreases.

</details>

<details open>
<summary><strong>Accuracy Is Not Free</strong></summary>

Ignoring reusable work, one step needs approximately:

| Method | New evaluations of $f$ per step |
|---|---:|
| Euler | $1$ |
| Modified Euler | $2$ |
| RK4 | $4$ |

For a fixed $h$, RK4 costs more per step. However, its greater accuracy may
permit a much larger $h$ for the same error target.

The most efficient choice depends on the problem, desired tolerance, and cost
of evaluating $f(x,y)$.

</details>

<details open>
<summary><strong>Estimating An Observed Order</strong></summary>

Given errors $E_h$ and $E_{h/2}$, estimate:

$$
\boxed{
p_{\mathrm{obs}}
=
\log_2\left(
\frac{E_h}{E_{h/2}}
\right)
}.
$$

For example, if:

$$
E_h=0.008,
\qquad
E_{h/2}=0.002,
$$

then:

$$
\begin{aligned}
p_{\mathrm{obs}}
&=
\log_2\left(\frac{0.008}{0.002}\right)\\
&=\log_2(4)\\
&=2.
\end{aligned}
$$

The observed data are consistent with a second-order method.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Order predicts how the global error scales when $h$ is reduced. It does not
guarantee accuracy for a large step, a nonsmooth solution, or an unstable
calculation.

Compare methods using both error and work.

</details>


---

## Block 5: Why Multistep Methods Need A History

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what multistep formulas reuse, why the grid must be
uniform, and where the first four solution values come from.

</details>

<details open>
<summary><strong>Store The Previous Slopes</strong></summary>

Once $y_j$ has been calculated, store:

$$
f_j=f(x_j,y_j).
$$

A four-step method can combine:

$$
f_n,\qquad f_{n-1},\qquad f_{n-2},\qquad f_{n-3}.
$$

This reuses old evaluations instead of constructing several new midpoint
stages in every interval.

The indices describe time order. The largest index is the most recent value.

</details>

<details open>
<summary><strong>Why Equal Spacing Matters</strong></summary>

The standard coefficients in ABM4 and Milne's method assume:

$$
x_{j+1}-x_j=h
$$

for every stored interval.

If the grid spacing changes, the fixed coefficients no longer represent the
same interpolation or integration formula. Variable-step multistep methods
need different coefficients.

</details>

<details open>
<summary><strong>The Start-Up Problem</strong></summary>

A four-step formula cannot begin with only:

$$
(x_0,y_0).
$$

To calculate the first multistep prediction at $x_4$, it needs:

$$
y_0,\quad y_1,\quad y_2,\quad y_3
$$

and their slopes.

Use a one-step method such as RK4 to generate $y_1,y_2,y_3$. Then switch to
the multistep formula.

The key intuition:

> a method that uses history must first create that history.

</details>

<details open>
<summary><strong>A Shared Start-Up Table</strong></summary>

The next two blocks use:

$$
y'=3x-y,
\qquad
y(0)=1,
\qquad
h=0.1.
$$

Here:

$$
f(x,y)=3x-y.
$$

RK4 supplies the following starting values:

| $j$ | $x_j$ | $y_j$ | $f_j=3x_j-y_j$ |
|---:|---:|---:|---:|
| $0$ | $0.0$ | $1.000000000$ | $-1.000000000$ |
| $1$ | $0.1$ | $0.919350000$ | $-0.619350000$ |
| $2$ | $0.2$ | $0.874923606$ | $-0.274923606$ |
| $3$ | $0.3$ | $0.863273688$ | $0.036726312$ |

For example, the last slope is calculated locally as:

$$
\begin{aligned}
f_3
&=f(x_3,y_3)\\
&=3(0.3)-0.863273688\\
&=0.036726312.
\end{aligned}
$$

The first multistep target is:

$$
x_4=x_3+h=0.3+0.1=0.4.
$$

</details>

<details open>
<summary><strong>Do Not Mix Start-Up Accuracy Casually</strong></summary>

A fourth-order multistep method should be started with comparably accurate
values. Poor Euler start-up values can contaminate later results even if the
multistep formula itself is fourth order.

Using RK4 for start-up preserves the intended fourth-order accuracy under the
usual smoothness and stability assumptions.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

ABM4 and Milne's method require four equally spaced solution values. Generate
the missing start-up values with RK4, calculate and store their slopes, then
begin the multistep method at $n=3$ to obtain $y_4$.

</details>

---

## Block 6: Adams--Bashforth--Moulton Method

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to apply the four-step Adams--Bashforth predictor and the
Adams--Moulton corrector with every index and weighted term visible.

</details>

<details open>
<summary><strong>The AB4 Predictor</strong></summary>

The explicit four-step Adams--Bashforth predictor is:

$$
\boxed{
y_{n+1}^{(p)}
=
y_n
+
\frac{h}{24}
\left(
55f_n
-59f_{n-1}
+37f_{n-2}
-9f_{n-3}
\right)
}.
$$

Read the history from newest to oldest:

$$
f_n,\quad f_{n-1},\quad f_{n-2},\quad f_{n-3}.
$$

For the first prediction, set $n=3$:

$$
\boxed{
y_4^{(p)}
=
y_3
+
\frac{h}{24}
\left(
55f_3
-59f_2
+37f_1
-9f_0
\right)
}.
$$

</details>

<details open>
<summary><strong>The AM4 Corrector</strong></summary>

After predicting $y_{n+1}^{(p)}$, calculate:

$$
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right).
$$

The Adams--Moulton corrector is:

$$
\boxed{
y_{n+1}
=
y_n
+
\frac{h}{24}
\left(
9f_{n+1}^{(p)}
+19f_n
-5f_{n-1}
+f_{n-2}
\right)
}.
$$

For the first ABM4 correction, set $n=3$ and target $y_4$:

$$
\boxed{
y_4
=
y_3
+
\frac{h}{24}
\left(
9f_4^{(p)}
+19f_3
-5f_2
+f_1
\right)
}.
$$

Notice that the corrector does not use $f_0$. Its four slopes span the more
recent range from $f_1$ through the predicted $f_4$.

</details>

<details open>
<summary><strong>ABM Step 1: Form The Predictor Bracket</strong></summary>

Use the start-up slopes:

$$
\begin{aligned}
f_0&=-1.000000000,\\
f_1&=-0.619350000,\\
f_2&=-0.274923606,\\
f_3&=0.036726312.
\end{aligned}
$$

Substitute each weighted term:

$$
\begin{aligned}
55f_3
&=55(0.036726312)
=2.019947160,\\
-59f_2
&=-59(-0.274923606)
=16.220492732,\\
37f_1
&=37(-0.619350000)
=-22.915950000,\\
-9f_0
&=-9(-1.000000000)
=9.000000000.
\end{aligned}
$$

Add the four terms:

$$
\begin{aligned}
B_{\mathrm{AB}}
&=
55f_3-59f_2+37f_1-9f_0\\
&=
2.019947160
+16.220492732
-22.915950000
+9.000000000\\
&=4.324489892.
\end{aligned}
$$

</details>

<details open>
<summary><strong>ABM Step 2: Calculate The Predicted Value And Slope</strong></summary>

Use:

$$
y_4^{(p)}
=
y_3+\frac{h}{24}B_{\mathrm{AB}}.
$$

Substitute $y_3=0.863273688$, $h=0.1$, and
$B_{\mathrm{AB}}=4.324489892$:

$$
\begin{aligned}
y_4^{(p)}
&=
0.863273688
+
\frac{0.1}{24}(4.324489892)\\
&\approx0.881292397.
\end{aligned}
$$

The endpoint input is:

$$
x_4=0.4.
$$

Calculate the predicted endpoint slope from $f(x,y)=3x-y$:

$$
\begin{aligned}
f_4^{(p)}
&=
f\left(x_4,y_4^{(p)}\right)\\
&=
3(0.4)-0.881292397\\
&\approx0.318707603.
\end{aligned}
$$

The corrector requires this new slope, not the old $f_3$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>ABM Step 3: Apply The Corrector</strong></summary>

Form the corrector bracket:

$$
B_{\mathrm{AM}}
=
9f_4^{(p)}
+19f_3
-5f_2
+f_1.
$$

For the AM4 bracket
$B_{\mathrm{AM}}=9f_4^{(p)}+19f_3-5f_2+f_1$, calculate each weighted term:

$$
\begin{aligned}
9f_4^{(p)}
&\approx9(0.318707603)
=2.868368427,\\
19f_3
&=19(0.036726312)
=0.697799928,\\
-5f_2
&=-5(-0.274923606)
=1.374618030,\\
f_1
&=-0.619350000.
\end{aligned}
$$

Add:

$$
\begin{aligned}
B_{\mathrm{AM}}
&\approx
2.868368427
+0.697799928
+1.374618030
-0.619350000\\
&\approx4.321436385.
\end{aligned}
$$

Now correct:

$$
\begin{aligned}
y_4
&=
y_3+\frac{h}{24}B_{\mathrm{AM}}\\
&=
0.863273688
+
\frac{0.1}{24}(4.321436385)\\
&\approx0.881279673.
\end{aligned}
$$

The corrected ABM4 estimate at the target input $x=0.4$ is:

$$
\boxed{y(0.4)\approx0.881279673}.
$$

</details>

<details open>
<summary><strong>Compare Predictor, Corrector, And Exact Value</strong></summary>

The exact solution is:

$$
y(x)=3x-3+4e^{-x}.
$$

At $x=0.4$:

$$
y(0.4)\approx0.881280184.
$$

The values are:

$$
\begin{aligned}
y_4^{(p)}&\approx0.881292397,\\
y_4&\approx0.881279673,\\
y(0.4)&\approx0.881280184.
\end{aligned}
$$

The correction moves the prediction much closer to the exact value.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

ABM4 uses old slopes to predict, evaluates a new predicted slope at the
endpoint, then corrects with a different weighted combination.

The essential chain is:

$$
\{f_0,f_1,f_2,f_3\}
\to
y_4^{(p)}
\to
f_4^{(p)}
\to
y_4.
$$

</details>

---

## Block 7: Milne's Method, Diagnostics, And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to apply Milne's predictor and corrector to the same start-up data,
then use predictor--corrector agreement as a diagnostic rather than a proof.

</details>

<details open>
<summary><strong>Milne's Predictor</strong></summary>

Milne's four-step predictor is:

$$
\boxed{
y_{n+1}^{(p)}
=
y_{n-3}
+
\frac{4h}{3}
\left(
2f_n-f_{n-1}+2f_{n-2}
\right)
}.
$$

For the first Milne prediction, set $n=3$ and target $y_4^{(p)}$:

$$
\boxed{
y_4^{(p)}
=
y_0
+
\frac{4h}{3}
\left(
2f_3-f_2+2f_1
\right)
}.
$$

Unlike AB4, the base value is $y_{n-3}$, not $y_n$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Milne's Corrector</strong></summary>

First calculate:

$$
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right).
$$

Then use the Simpson-type corrector:

$$
\boxed{
y_{n+1}
=
y_{n-1}
+
\frac h3
\left(
f_{n-1}
+4f_n
+f_{n+1}^{(p)}
\right)
}.
$$

For the first Milne correction, set $n=3$ and target $y_4$:

$$
\boxed{
y_4
=
y_2
+
\frac h3
\left(
f_2+4f_3+f_4^{(p)}
\right)
}.
$$

The base value is now $y_2$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>A Complete Milne Prediction</strong></summary>

Use the same problem:

$$
y'=3x-y,
\qquad
h=0.1.
$$

Form the predictor bracket:

$$
\begin{aligned}
B_{\mathrm{M}}
&=2f_3-f_2+2f_1\\
&=
2(0.036726312)
-(-0.274923606)
+2(-0.619350000)\\
&=
0.073452624
+0.274923606
-1.238700000\\
&=-0.890323770.
\end{aligned}
$$

Use $y_0=1$:

$$
\begin{aligned}
y_4^{(p)}
&=
y_0+\frac{4h}{3}B_{\mathrm{M}}\\
&=
1+\frac{4(0.1)}{3}(-0.890323770)\\
&\approx0.881290164.
\end{aligned}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Calculate The Predicted Slope And Correct</strong></summary>

At $x_4=0.4$, calculate:

$$
\begin{aligned}
f_4^{(p)}
&=
3x_4-y_4^{(p)}\\
&=
3(0.4)-0.881290164\\
&\approx0.318709836.
\end{aligned}
$$

Form the corrector bracket:

$$
\begin{aligned}
B_{\mathrm{MC}}
&=
f_2+4f_3+f_4^{(p)}\\
&=
-0.274923606
+4(0.036726312)
+0.318709836\\
&=
-0.274923606
+0.146905248
+0.318709836\\
&\approx0.190691478.
\end{aligned}
$$

Use the base value $y_2=0.874923606$:

$$
\begin{aligned}
y_4
&=
y_2+\frac h3B_{\mathrm{MC}}\\
&=
0.874923606
+\frac{0.1}{3}(0.190691478)\\
&\approx0.881279988.
\end{aligned}
$$

The completed Milne correction gives:

$$
\boxed{y(0.4)\approx0.881279988}.
$$

The exact value is approximately $0.881280184$.

</details>

<details open>
<summary><strong>The Predictor--Corrector Gap</strong></summary>

For Milne's calculation:

$$
\begin{aligned}
\left|y_4-y_4^{(p)}\right|
&\approx
|0.881279988-0.881290164|\\
&\approx1.02\times10^{-5}.
\end{aligned}
$$

A small gap is reassuring. A large gap can indicate:

- a step size that is too large
- numerical instability
- inaccurate start-up values
- an indexing or arithmetic error
- rapid variation or a nearby singularity

The gap is a diagnostic, not a guaranteed bound on the true error.

</details>

<details open>
<summary><strong>Common Mistake: Skipping The Predicted Derivative</strong></summary>

The corrector needs:

$$
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right).
$$

Do not insert $y_{n+1}^{(p)}$ directly where a slope belongs, and do not reuse
$f_n$ as though it were the endpoint slope.

</details>

<details open>
<summary><strong>Common Mistake: Shifting The History</strong></summary>

For AB4 at $n=3$, the slope order is:

$$
f_3,\quad f_2,\quad f_1,\quad f_0.
$$

The coefficient $55$ multiplies the newest slope $f_3$; the coefficient $-9$
multiplies the oldest slope $f_0$.

Write a small indexed table before substitution.

</details>

<details open>
<summary><strong>Common Mistake: Using The Wrong Base Value</strong></summary>

The formulas start from different values:

- AB4 predictor and AM4 corrector start from $y_n$
- Milne predictor starts from $y_{n-3}$
- Milne corrector starts from $y_{n-1}$

At $n=3$, these are $y_3$, $y_0$, and $y_2$, respectively.

</details>

<details open>
<summary><strong>Common Mistake: Using Unequal Grid Spacing</strong></summary>

The displayed ABM4 and Milne coefficients assume one constant $h$. Before
using stored values, verify:

$$
x_1-x_0
=
x_2-x_1
=
x_3-x_2
=
h.
$$

If the spacings differ, use a variable-step formula or restart with an
appropriate one-step method.

</details>

<details open>
<summary><strong>Common Mistake: Rounding The Stored History Too Early</strong></summary>

Each rounded $y_j$ changes $f_j$, and each changed slope is multiplied by a
large positive or negative coefficient.

Retain guard digits in start-up values, slopes, predictions, and corrections.
Round the final reported value after the step is complete.

</details>

<details open>
<summary><strong>A Reliable Method Checklist</strong></summary>

### For Modified Euler

1. calculate $f_n$
2. predict $y_{n+1}^{(p)}$
3. calculate $f_{n+1}^{(p)}$
4. average the two slopes
5. carry the corrected $y_{n+1}$ forward

### For RK4

1. state whether each $k_j$ is a slope or an increment
2. show each stage point
3. use $k_1$ for stage $2$, $k_2$ for stage $3$, and $k_3$ for stage $4$
4. apply the weights $1,2,2,1$

### For A Four-Step Predictor--Corrector

1. verify equal spacing
2. create $y_1,y_2,y_3$ with RK4
3. tabulate $f_0,f_1,f_2,f_3$
4. predict $y_4^{(p)}$
5. calculate $f_4^{(p)}$
6. correct to obtain $y_4$
7. compare the predictor and corrector

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Milne and ABM4 are fourth-order predictor--corrector methods with different
history weights and base values.

Their formulas are compact, but a safe calculation expands every indexed term
before adding it.

</details>


---

## Block 8: Original Practice Set

<details open>
<summary><strong>How To Use These Problems</strong></summary>

For every method, write the formula before inserting numbers. Keep predicted
values marked with $(p)$ and keep RK4 stage inputs visible.

For multistep problems, copy the history into an indexed table before applying
weights.

</details>

<details open>
<summary><strong>Problems 1 To 4: Modified Euler And RK4</strong></summary>

### Problem 1: One Modified Euler Step

For:

$$
y'=x+y^2,
\qquad
y(0)=0.5,
$$

use modified Euler with $h=0.1$ to find $y_1$.

### Problem 2: Two Modified Euler Steps

For:

$$
y'=1-y,
\qquad
y(0)=0,
$$

use modified Euler with $h=0.2$ to approximate $y(0.4)$.

### Problem 3: Diagnose A Predictor Error

A learner predicts $y_{n+1}^{(p)}$ correctly but calculates the endpoint slope
as:

$$
f\left(x_n,y_{n+1}^{(p)}\right).
$$

Explain the error and state the correct endpoint slope.

### Problem 4: One Complete RK4 Step

For:

$$
y'=3x-2y,
\qquad
y(0)=1,
$$

take one classical RK4 step with $h=0.2$ using the increment convention.

</details>

<details open>
<summary><strong>Problems 5 To 8: Stages, Work, Order, And ABM4</strong></summary>

### Problem 5: Identify Four RK4 Stage Points

At $(x_n,y_n)=(1,2)$ with $h=0.2$, suppose:

$$
k_1=0.6,\qquad k_2=0.65,\qquad k_3=0.67.
$$

State the $(x,y)$ point at which each of $k_1,k_2,k_3,k_4$ evaluates $f$.

### Problem 6: Count Function Evaluations

A calculation uses $20$ equal steps. Ignoring reusable endpoint slopes, how
many evaluations of $f$ are required by Euler, modified Euler, and RK4?

### Problem 7: Estimate An Observed Order

A method has target errors:

$$
E_h=0.008,
\qquad
E_{h/2}=0.002.
$$

Estimate its observed order.

### Problem 8: Carry Out One ABM4 Step

For $y'=x+y$ with $h=0.1$, RK4 has supplied:

| $j$ | $x_j$ | $y_j$ | $f_j=x_j+y_j$ |
|---:|---:|---:|---:|
| $0$ | $0.0$ | $1.000000000$ | $1.000000000$ |
| $1$ | $0.1$ | $1.110341667$ | $1.210341667$ |
| $2$ | $0.2$ | $1.242805142$ | $1.442805142$ |
| $3$ | $0.3$ | $1.399716994$ | $1.699716994$ |

Use AB4 and AM4 once to approximate $y(0.4)$.

</details>

<details open>
<summary><strong>Problems 9 To 12: Milne And Diagnostics</strong></summary>

### Problem 9: Carry Out One Milne Step

Use the same $y'=x+y$ history from Problem 8 to calculate one Milne prediction
and correction at $x_4=0.4$.

### Problem 10: Explain The Start-Up Requirement

Why can neither ABM4 nor Milne's method begin directly from only
$y(x_0)=y_0$? State a suitable start-up procedure.

### Problem 11: Respond To A Large Correction

A predictor gives $y_{n+1}^{(p)}=1.25$, while the corrector gives
$y_{n+1}=1.80$. What should be checked before accepting the step?

### Problem 12: Detect An Invalid Grid

Can the standard ABM4 formula be applied directly to values at:

$$
x_0=0,\quad x_1=0.1,\quad x_2=0.25,\quad x_3=0.35?
$$

Explain the decision.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

The data are:

$$
f(x,y)=x+y^2,
\qquad
(x_0,y_0)=(0,0.5),
\qquad
h=0.1.
$$

Calculate the left slope:

$$
\begin{aligned}
f_0
&=f(0,0.5)\\
&=0+(0.5)^2\\
&=0.25.
\end{aligned}
$$

Update the input:

$$
x_1=x_0+h=0.1.
$$

Predict:

$$
\begin{aligned}
y_1^{(p)}
&=y_0+h f_0\\
&=0.5+0.1(0.25)\\
&=0.525.
\end{aligned}
$$

Calculate the predicted endpoint slope:

$$
\begin{aligned}
f_1^{(p)}
&=f(0.1,0.525)\\
&=0.1+(0.525)^2\\
&=0.1+0.275625\\
&=0.375625.
\end{aligned}
$$

Use the left and predicted endpoint slopes to correct the first step:

$$
\begin{aligned}
y_1
&=
y_0+\frac h2\left(f_0+f_1^{(p)}\right)\\
&=
0.5+0.05(0.25+0.375625)\\
&=
0.5+0.03128125\\
&=0.53128125.
\end{aligned}
$$

Therefore:

$$
\boxed{y(0.1)\approx0.53128125}.
$$

### Answer 2

Use:

$$
f(x,y)=1-y,
\qquad
(x_0,y_0)=(0,0),
\qquad
h=0.2.
$$

For the first step, calculate:

$$
f_0=1-y_0=1.
$$

Predict:

$$
y_1^{(p)}=0+0.2(1)=0.2.
$$

At $x_1=0.2$, calculate:

$$
f_1^{(p)}=1-0.2=0.8.
$$

Use the first-step slopes to calculate the corrected value:

$$
\begin{aligned}
y_1
&=0+\frac{0.2}{2}(1+0.8)\\
&=0.18.
\end{aligned}
$$

<!-- print-page-break -->

### Second Modified Euler Step

Begin the second step with the corrected $y_1=0.18$:

$$
f_1=1-0.18=0.82.
$$

Predict:

$$
\begin{aligned}
y_2^{(p)}
&=y_1+h f_1\\
&=0.18+0.2(0.82)\\
&=0.344.
\end{aligned}
$$

At $x_2=0.4$, the predicted endpoint slope is:

$$
f_2^{(p)}=1-0.344=0.656.
$$

Use the second-step slopes to calculate the corrected value:

$$
\begin{aligned}
y_2
&=
0.18+\frac{0.2}{2}(0.82+0.656)\\
&=
0.18+0.1(1.476)\\
&=0.3276.
\end{aligned}
$$

After two corrected steps, the modified Euler estimate is:

$$
\boxed{y(0.4)\approx0.3276}.
$$

### Answer 3

The predicted height belongs to the new input:

$$
x_{n+1}=x_n+h.
$$

Therefore the predicted endpoint slope must be:

$$
\boxed{
f_{n+1}^{(p)}
=
f\left(x_{n+1},y_{n+1}^{(p)}\right)
}.
$$

Using $x_n$ with $y_{n+1}^{(p)}$ mixes the old input and predicted new height.

### Answer 4

Use:

$$
f(x,y)=3x-2y,
\qquad
(x_0,y_0)=(0,1),
\qquad
h=0.2.
$$

Stage 1:

$$
\begin{aligned}
k_1
&=0.2f(0,1)\\
&=0.2\bigl(3(0)-2(1)\bigr)\\
&=-0.4.
\end{aligned}
$$

Stage 2 uses $(0.1,1+k_1/2)=(0.1,0.8)$:

$$
\begin{aligned}
k_2
&=0.2f(0.1,0.8)\\
&=0.2\bigl(3(0.1)-2(0.8)\bigr)\\
&=0.2(-1.3)\\
&=-0.26.
\end{aligned}
$$

Stage 3 uses $(0.1,1+k_2/2)=(0.1,0.87)$:

$$
\begin{aligned}
k_3
&=0.2f(0.1,0.87)\\
&=0.2\bigl(3(0.1)-2(0.87)\bigr)\\
&=0.2(-1.44)\\
&=-0.288.
\end{aligned}
$$

Stage 4 uses $(0.2,1+k_3)=(0.2,0.712)$:

$$
\begin{aligned}
k_4
&=0.2f(0.2,0.712)\\
&=0.2\bigl(3(0.2)-2(0.712)\bigr)\\
&=0.2(-0.824)\\
&=-0.1648.
\end{aligned}
$$

Combine:

$$
\begin{aligned}
y_1
&=
1+\frac{-0.4+2(-0.26)+2(-0.288)-0.1648}{6}\\
&=
1-\frac{1.6608}{6}\\
&=0.7232.
\end{aligned}
$$

Therefore the one-step RK4 estimate is:

$$
\boxed{y(0.2)\approx0.7232}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

With the increment convention, RK4 samples:

$$
k_1=h f(x_n,y_n),
$$

so the $k_1$ point is:

$$
\boxed{(1,2)}.
$$

For $k_2$, use:

$$
\left(
x_n+\frac h2,
y_n+\frac{k_1}{2}
\right).
$$

Substitute $h=0.2$ and $k_1=0.6$:

$$
\boxed{
\left(1.1,2.3\right)
}.
$$

For $k_3$, use $k_2$ in the midpoint height:

$$
\left(
1.1,
2+\frac{0.65}{2}
\right)
=
\boxed{(1.1,2.325)}.
$$

For $k_4$, use the full endpoint and $k_3$:

$$
\left(
1.2,
2+0.67
\right)
=
\boxed{(1.2,2.67)}.
$$

### Answer 6

For $20$ steps:

- Euler uses $1$ evaluation per step
- modified Euler uses $2$ evaluations per step
- RK4 uses $4$ evaluations per step

The corrected Milne estimate at the target input $x=0.4$ is:

$$
\begin{aligned}
N_{\mathrm{Euler}}
&=20(1)=20,\\
N_{\mathrm{ME}}
&=20(2)=40,\\
N_{\mathrm{RK4}}
&=20(4)=80.
\end{aligned}
$$

### Answer 7

Use:

$$
p_{\mathrm{obs}}
=
\log_2\left(
\frac{E_h}{E_{h/2}}
\right).
$$

Substitute:

$$
\begin{aligned}
p_{\mathrm{obs}}
&=
\log_2\left(
\frac{0.008}{0.002}
\right)\\
&=
\log_2(4)\\
&=2.
\end{aligned}
$$

The observed errors are consistent with a second-order method.

### Answer 8

For the first ABM4 step, $n=3$ and $x_4=0.4$.

Use the predictor:

$$
y_4^{(p)}
=
y_3+\frac{0.1}{24}
\left(
55f_3-59f_2+37f_1-9f_0
\right).
$$

Substitute the table values:

$$
\begin{aligned}
y_4^{(p)}
&=
1.399716994
+\frac{0.1}{24}
\big[
55(1.699716994)
-59(1.442805142)\\
&\qquad
+37(1.210341667)
-9(1.000000000)
\big]\\
&\approx1.583640215.
\end{aligned}
$$

For $f(x,y)=x+y$, the predicted endpoint slope is:

$$
\begin{aligned}
f_4^{(p)}
&=f\left(0.4,1.583640215\right)\\
&=0.4+1.583640215\\
&=1.983640215.
\end{aligned}
$$

Apply the corrector:

$$
y_4
=
y_3+\frac{0.1}{24}
\left(
9f_4^{(p)}+19f_3-5f_2+f_1
\right).
$$

Substitute:

$$
\begin{aligned}
y_4
&=
1.399716994
+\frac{0.1}{24}
\big[
9(1.983640215)
+19(1.699716994)\\
&\qquad
-5(1.442805142)
+1.210341667
\big]\\
&\approx1.583649081.
\end{aligned}
$$

Thus:

$$
\boxed{y(0.4)\approx1.583649081}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Use Milne's predictor at $n=3$:

$$
y_4^{(p)}
=
y_0
+
\frac{4(0.1)}{3}
\left(
2f_3-f_2+2f_1
\right).
$$

Substitute the history:

$$
\begin{aligned}
y_4^{(p)}
&=
1
+
\frac{0.4}{3}
\big[
2(1.699716994)
-1.442805142\\
&\qquad
+2(1.210341667)
\big]\\
&\approx1.583641624.
\end{aligned}
$$

Calculate the predicted endpoint slope:

$$
\begin{aligned}
f_4^{(p)}
&=f(0.4,1.583641624)\\
&=0.4+1.583641624\\
&=1.983641624.
\end{aligned}
$$

Use Milne's corrector:

$$
y_4
=
y_2
+
\frac{0.1}{3}
\left(
f_2+4f_3+f_4^{(p)}
\right).
$$

Substitute:

$$
\begin{aligned}
y_4
&=
1.242805142
+\frac{0.1}{3}
\big[
1.442805142
+4(1.699716994)\\
&\qquad
+1.983641624
\big]\\
&\approx1.583648966.
\end{aligned}
$$

The corrected Milne estimate at the target input $x=0.4$ is:

$$
\boxed{y(0.4)\approx1.583648966}.
$$

### Answer 10

ABM4 and Milne's method use several earlier values and slopes. At the first
multistep calculation they require:

$$
y_0,\quad y_1,\quad y_2,\quad y_3
$$

and:

$$
f_0,\quad f_1,\quad f_2,\quad f_3.
$$

The initial condition supplies only $y_0$. A suitable procedure is:

1. use RK4 with the intended step size to calculate $y_1,y_2,y_3$
2. evaluate $f_j=f(x_j,y_j)$ at each start-up point
3. begin the four-step method with $n=3$

### Answer 11

The predictor--corrector gap is:

$$
|1.80-1.25|=0.55,
$$

which is large relative to the values themselves.

Before accepting the step:

1. check coefficient signs and history indices
2. verify the predicted endpoint derivative
3. inspect start-up accuracy and rounding
4. repeat with a smaller step size
5. consider rapid variation, stiffness, or a nearby singularity

A corrector is intended to refine the prediction. A large change requires
investigation.

### Answer 12

Calculate the spacings:

$$
\begin{aligned}
x_1-x_0&=0.1,\\
x_2-x_1&=0.15,\\
x_3-x_2&=0.10.
\end{aligned}
$$

They are not equal. Therefore no single constant $h$ describes this history.

The standard fixed-step ABM4 coefficients cannot be applied directly:

$$
\boxed{\text{the grid is invalid for the displayed fixed-step formula}.}
$$

Use a variable-step method, construct an equally spaced history, or restart
with a suitable one-step method.

</details>

<details open>
<summary><strong>Chapter 19 Final Summary</strong></summary>

Modified Euler predicts with Euler and corrects with the average of the left
and predicted right slopes:

$$
\boxed{
\begin{aligned}
y_{n+1}^{(p)}
&=y_n+h f_n,\\
f_{n+1}^{(p)}
&=f\left(x_{n+1},y_{n+1}^{(p)}\right),\\
y_{n+1}
&=
y_n+\frac h2\left(f_n+f_{n+1}^{(p)}\right).
\end{aligned}
}
$$

Classical RK4 uses four increments:

$$
\boxed{
\begin{aligned}
k_1&=h f(x_n,y_n),\\
k_2&=h f\left(x_n+\frac h2,y_n+\frac{k_1}{2}\right),\\
k_3&=h f\left(x_n+\frac h2,y_n+\frac{k_2}{2}\right),\\
k_4&=h f(x_n+h,y_n+k_3),
\end{aligned}
}
$$

RK4 combines these four increments using:

$$
\boxed{
y_{n+1}
=
y_n+\frac{k_1+2k_2+2k_3+k_4}{6}
}.
$$

Euler, modified Euler, and RK4 have global orders $1$, $2$, and $4$,
respectively.

Four-step multistep methods require RK4 start-up values. ABM4 uses:

$$
\boxed{
y_{n+1}^{(p)}
=
y_n+\frac h{24}
\left(
55f_n-59f_{n-1}+37f_{n-2}-9f_{n-3}
\right)
}
$$

followed by:

$$
\boxed{
y_{n+1}
=
y_n+\frac h{24}
\left(
9f_{n+1}^{(p)}+19f_n-5f_{n-1}+f_{n-2}
\right)
}.
$$

Milne's method uses:

$$
\boxed{
y_{n+1}^{(p)}
=
y_{n-3}
+\frac{4h}{3}
\left(
2f_n-f_{n-1}+2f_{n-2}
\right)
}
$$

and:

$$
\boxed{
y_{n+1}
=
y_{n-1}
+\frac h3
\left(
f_{n-1}+4f_n+f_{n+1}^{(p)}
\right)
}.
$$

The chapter's central lesson is:

> identify exactly where every slope is sampled, preserve the time indices,
> generate trustworthy start-up values, and treat predictor--corrector
> disagreement as a warning that deserves investigation.

</details>
