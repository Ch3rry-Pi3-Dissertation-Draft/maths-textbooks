# Graphical And Numerical Methods

An exact formula is not always the most useful way to study a differential
equation. Sometimes a formula is difficult to obtain; sometimes only a few
approximate values are needed; and sometimes the important question concerns
the direction in which solutions move.

This chapter studies first-order initial-value problems of the form:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0.
$$

The main questions are:

- how does $f(x,y)$ encode a slope at every point?
- how is a direction field read without solving the equation?
- what does an isocline reveal?
- how can equilibrium solutions be identified from signs?
- how does Euler's method turn one tangent line into a numerical step?
- why must each new slope use the newly calculated point?
- how does the step size affect error and workload?
- how can a large step size create numerical behavior that the true solution
  does not have?

The three figures and all worked examples and exercises in this chapter are
independently constructed. The reference text is used only to identify the
mathematical topics.

---

## Block 1: Reading A Differential Equation As A Slope Rule

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret $y'=f(x,y)$ as local geometric information before
trying to calculate a solution formula.

</details>

<details open>
<summary><strong>What The Equation Says At One Point</strong></summary>

In:

$$
y'=f(x,y),
$$

the derivative $y'$ is the slope of a solution curve. At a particular point
$(a,b)$, substitute:

$$
x=a,
\qquad
y=b.
$$

The resulting number:

$$
f(a,b)
$$

is the slope that a solution curve must have when it passes through $(a,b)$.

For example, if:

$$
y'=2x-3y,
$$

then at $(1,0)$:

$$
\begin{aligned}
y'
&=f(1,0)\\
&=2(1)-3(0)\\
&=2.
\end{aligned}
$$

A solution curve through $(1,0)$ must therefore have slope $2$ at that point.

</details>

<details open>
<summary><strong>From A Slope To A Line Element</strong></summary>

A **line element** is a short segment centered at $(a,b)$ with slope
$f(a,b)$.

Its purpose is local. It does not claim that the solution remains straight.
It shows only the direction in which the solution initially leaves the point.

The segment can be aligned with the vector:

$$
\begin{bmatrix}
1\\
f(a,b)
\end{bmatrix},
$$

because its vertical change divided by its horizontal change is:

$$
\frac{f(a,b)}{1}=f(a,b).
$$

To keep steep segments from becoming much longer than shallow ones, plotting
software usually normalizes this vector. Normalization changes its length but
not its slope.

</details>

<details open>
<summary><strong>Positive, Zero, And Negative Slopes</strong></summary>

At a point $(a,b)$:

- if $f(a,b)>0$, the line element rises from left to right
- if $f(a,b)=0$, the line element is horizontal
- if $f(a,b)<0$, the line element falls from left to right

The size of $|f(a,b)|$ controls steepness. A slope of $4$ is steeper than a
slope of $1/2$, while a slope of $-4$ is steep in the downward direction.

</details>

<details open>
<summary><strong>A Small Slope Table</strong></summary>

For:

$$
y'=2x-3y,
$$

calculate several slopes directly.

At $(0,0)$:

$$
f(0,0)=2(0)-3(0)=0.
$$

At $(0,1)$:

$$
f(0,1)=2(0)-3(1)=-3.
$$

At $(1,0)$:

$$
f(1,0)=2(1)-3(0)=2.
$$

At $(1,\frac23)$:

$$
f\left(1,\frac23\right)
=
2(1)-3\left(\frac23\right)
=
0.
$$

At $(2,\frac43)$:

$$
f\left(2,\frac43\right)=2(2)-3\left(\frac43\right)=0.
$$

The horizontal segments do not occur only at one point. Their locations form
a curve, which will become the zero-slope isocline.

</details>

<details open>
<summary><strong>What A Direction Field Is</strong></summary>

A **direction field** is a grid of line elements. Each segment is calculated
from the same rule $f(x,y)$ at a different point.

A solution curve should:

1. pass through its prescribed initial point
2. remain tangent to nearby line elements
3. bend gradually as the indicated slopes change

The field shows a family of possible solution paths. An initial condition
selects one path from that family.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

The equation:

$$
y'=f(x,y)
$$

assigns the slope $f(a,b)$ to the point $(a,b)$. A direction field displays
many of those local slopes at once.

The key intuition:

> a direction field does not solve the equation point by point; it reveals the
> flow that every solution curve must follow.

</details>

---

## Block 2: Direction Fields And Solution Curves

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to read a complete direction field, relate it to several solution
curves, and understand what the picture can and cannot prove.

</details>

<details open>
<summary><strong>An Original Direction Field</strong></summary>

The figure below uses:

$$
y'=2x-3y.
$$

![Direction field and three solution curves for y prime equals two x minus three y](books/assets/chapter_18/chapter_18_figure-1.png)

Every teal segment uses the slope $2x-3y$ at its own location. The three solid
curves start at different heights but follow the same slope rule.

Notice:

- below the zero-slope line, many segments tilt upward
- above that line, many segments tilt downward
- the solution curves approach a common slanted trend as $x$ increases

</details>

<details open>
<summary><strong>Check The Curves Against The Equation</strong></summary>

The exact family for this particular equation is:

$$
y(x)=\frac{2x}{3}-\frac29+Ce^{-3x}.
$$

Differentiate:

$$
y'(x)=\frac23-3Ce^{-3x}.
$$

Now evaluate the right side of the differential equation:

$$
\begin{aligned}
2x-3y
&=
2x-3\left(
\frac{2x}{3}-\frac29+Ce^{-3x}
\right)\\
&=
2x-2x+\frac23-3Ce^{-3x}\\
&=
\frac23-3Ce^{-3x}.
\end{aligned}
$$

Thus:

$$
y'=2x-3y.
$$

The formula verifies the plotted curves, but the direction field itself could
have been constructed without knowing this exact family.

</details>

<details open>
<summary><strong>What The Field Reveals Qualitatively</strong></summary>

For $y'=2x-3y$, the sign depends on whether $2x-3y$ is positive or negative.

At any point below the line $y=2x/3$:

$$
y<\frac{2x}{3}
\quad\Longrightarrow\quad
2x-3y>0
\quad\Longrightarrow\quad
y'>0.
$$

Therefore solutions increase below the line.

At any point above the line $y=2x/3$:

$$
y>\frac{2x}{3}
\quad\Longrightarrow\quad
2x-3y<0
\quad\Longrightarrow\quad
y'<0.
$$

Therefore solutions decrease above the line.

On:

$$
y=\frac{2x}{3},
$$

the slope is zero.

A solution can cross this zero-slope line. At the crossing it has a horizontal
tangent; the line is not itself a solution because its own slope is $2/3$, not
zero.

</details>

<details open>
<summary><strong>What The Picture Does Not Guarantee</strong></summary>

A direction field is sampled at finitely many points. A hand-drawn solution
curve is therefore qualitative, not an exact numerical computation.

The picture can strongly suggest:

- where solutions increase or decrease
- possible turning points
- attraction toward or repulsion from equilibrium levels
- whether different initial conditions produce similar long-term behavior

It does not, by itself, provide exact values such as $y(0.73)$.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Direction fields and exact formulas answer different questions. The field
shows local geometry across many initial conditions; an exact solution gives
precise values for one solution family.

A curve drawn through a field must be tangent to the line elements, not merely
pass near them.

</details>

---

## Block 3: Isoclines, Equilibria, And Sign Reasoning

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to organize equal slopes with isoclines and use sign intervals to
read autonomous equations efficiently.

</details>

<details open>
<summary><strong>The Definition Of An Isocline</strong></summary>

For:

$$
y'=f(x,y),
$$

choose a constant slope $c$. The equation:

$$
\boxed{f(x,y)=c}
$$

defines an **isocline**.

Every point on that isocline has slope $c$. Different values of $c$ usually
produce different curves.

The name describes the purpose: an isocline is a curve of equal inclination.

</details>

<details open>
<summary><strong>Isoclines For The Running Field</strong></summary>

For:

$$
y'=2x-3y,
$$

set the slope equal to $c$:

$$
2x-3y=c.
$$

Solve for $y$ by subtracting $2x$:

$$
-3y=c-2x.
$$

Divide by $-3$:

$$
\boxed{
y=\frac{2x-c}{3}
}.
$$

Thus every isocline is a straight line.

For $c=0$:

$$
y=\frac{2x}{3}.
$$

For $c=1$:

$$
y=\frac{2x-1}{3}.
$$

For $c=-1$:

$$
y=\frac{2x+1}{3}.
$$

Segments on these three lines have slopes $0$, $1$, and $-1$, respectively.

</details>

<details open>
<summary><strong>An Isocline Is Usually Not A Solution Curve</strong></summary>

On the zero-slope isocline:

$$
y=\frac{2x}{3},
$$

the differential equation assigns slope $0$.

But the line $y=2x/3$ has geometric slope:

$$
\frac{dy}{dx}=\frac23.
$$

Since:

$$
\frac23\ne0,
$$

the isocline does not satisfy the differential equation. It marks where
solution curves have horizontal tangents; it is not one of those solutions.

This distinction prevents a common visual mistake.

</details>

<details open>
<summary><strong>Autonomous Equations</strong></summary>

An equation is **autonomous** when the right side depends only on $y$:

$$
y'=F(y).
$$

Every horizontal line $y=b$ has the same slope because changing $x$ does not
change $F(b)$.

An **equilibrium solution** occurs at a level $y=y_*$ where:

$$
F(y_*)=0.
$$

The constant function $y(x)=y_*$ then has derivative zero and satisfies the
equation.

</details>

<details open>
<summary><strong>A Complete Autonomous Sign Analysis</strong></summary>

Consider:

$$
y'=(y+1)(3-y).
$$

Equilibria occur when either factor is zero:

$$
y+1=0
\qquad\text{or}\qquad
3-y=0.
$$

Therefore:

$$
\boxed{y=-1,\qquad y=3}
$$

are equilibrium solutions.

Now test the sign in each interval.

For $y<-1$, choose $y=-2$:

$$
(-2+1)(3-(-2))=(-1)(5)<0.
$$

Solutions decrease below $-1$.

For $-1<y<3$, choose $y=0$:

$$
(0+1)(3-0)=(1)(3)>0.
$$

Solutions increase between the equilibria.

For $y>3$, choose $y=4$:

$$
(4+1)(3-4)=(5)(-1)<0.
$$

Solutions decrease above $3$.

</details>

<details open>
<summary><strong>Stable And Unstable Equilibrium Levels</strong></summary>

Near $y=3$:

- solutions just below $3$ increase
- solutions just above $3$ decrease

Both directions point toward $3$, so $y=3$ is a stable equilibrium.

Near $y=-1$:

- solutions just below $-1$ decrease
- solutions just above $-1$ increase

Both directions point away from $-1$, so $y=-1$ is unstable.

This is **solution stability**. Later in the chapter, **numerical stability**
will describe whether a discrete approximation behaves sensibly. The two ideas
are related in spirit but are not identical.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Isoclines satisfy:

$$
f(x,y)=c
$$

and collect points with the same slope. For autonomous equations, equilibrium
levels satisfy:

$$
F(y_*)=0.
$$

A sign chart above and below each equilibrium reveals whether nearby solutions
move toward it or away from it.

</details>

---

## Block 4: Euler's Method From The Tangent Line

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive Euler's update from the tangent line and identify every
quantity used in one numerical step.

</details>

<details open>
<summary><strong>The Initial-Value Problem</strong></summary>

Suppose:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0.
$$

Assume $(x_n,y_n)$ is the current numerical point. Here:

- $x_n$ is the current input
- $y_n$ approximates the true value $y(x_n)$
- $h$ is the chosen step size

The differential equation supplies the current slope:

$$
m_n=f(x_n,y_n).
$$

</details>

<details open>
<summary><strong>Derive One Euler Step Geometrically</strong></summary>

The tangent line through $(x_n,y_n)$ with slope $m_n$ is:

$$
L(x)=y_n+m_n(x-x_n).
$$

Choose the next input:

$$
x_{n+1}=x_n+h.
$$

Evaluate the tangent line there:

$$
\begin{aligned}
L(x_{n+1})
&=y_n+m_n(x_{n+1}-x_n)\\
&=y_n+m_n h.
\end{aligned}
$$

Euler's method uses this tangent-line value as the next approximation:

$$
y_{n+1}=y_n+h m_n.
$$

Substitute $m_n=f(x_n,y_n)$:

$$
\boxed{
\begin{aligned}
x_{n+1}&=x_n+h,\\
y_{n+1}&=y_n+h f(x_n,y_n).
\end{aligned}
}
$$

</details>

<details open>
<summary><strong>What One Step Means</strong></summary>

The update:

$$
y_{n+1}=y_n+h f(x_n,y_n)
$$

has the form:

$$
\text{new height}
=
\text{old height}
+
\text{horizontal step}\times\text{current slope}.
$$

The method follows the tangent for one short interval, then discards that
tangent and recalculates a new one at the new point.

The key intuition:

> Euler's method repeatedly turns local slope information into short straight
> steps.

</details>

<details open>
<summary><strong>Why The Slope Must Be Recalculated</strong></summary>

After one update, the current point changes from $(x_n,y_n)$ to:

$$
(x_{n+1},y_{n+1}).
$$

The next slope is therefore:

$$
m_{n+1}=f(x_{n+1},y_{n+1}),
$$

not $f(x_n,y_n)$ again.

Unless $f$ is constant, reusing the old slope follows the same straight line
instead of responding to the changing direction field.

</details>

<details open>
<summary><strong>The Taylor-Series View</strong></summary>

For a sufficiently smooth true solution:

$$
y(x_n+h)
=
y(x_n)
+h y'(x_n)
+\frac{h^2}{2}y''(\xi_n)
$$

for some $\xi_n$ between $x_n$ and $x_n+h$.

Use $y'(x_n)=f(x_n,y(x_n))$:

$$
y(x_n+h)
=
y(x_n)
+h f(x_n,y(x_n))
+\frac{h^2}{2}y''(\xi_n).
$$

Euler's method keeps the first two terms and omits the term involving $h^2$.
This explains both its tangent-line form and its first-order accuracy.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Euler's method is:

$$
\boxed{
x_{n+1}=x_n+h,
\qquad
y_{n+1}=y_n+h f(x_n,y_n)
}.
$$

Each step must use the current numerical point. The method is explicit because
the new value $y_{n+1}$ is calculated directly from already known quantities.

</details>


---

## Block 5: A Complete Euler Calculation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to calculate several Euler steps without hiding how any slope or
table entry was obtained.

</details>

<details open>
<summary><strong>The Problem And Step Count</strong></summary>

Approximate $y(0.8)$ for:

$$
y'=x-2y+1,
\qquad
y(0)=0,
$$

using:

$$
h=0.2.
$$

The number of equal steps is:

$$
N=\frac{0.8-0}{0.2}=4.
$$

The starting numerical point is:

$$
x_0=0,
\qquad
y_0=0.
$$

The slope rule is:

$$
f(x,y)=x-2y+1.
$$

</details>

<details open>
<summary><strong>Step 0 To Step 1</strong></summary>

Calculate the slope at the current point $(x_0,y_0)=(0,0)$:

$$
\begin{aligned}
m_0
&=f(x_0,y_0)\\
&=f(0,0)\\
&=0-2(0)+1\\
&=1.
\end{aligned}
$$

Update the input:

$$
\begin{aligned}
x_1
&=x_0+h\\
&=0+0.2\\
&=0.2.
\end{aligned}
$$

Update the approximate solution:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=0+0.2(1)\\
&=0.2.
\end{aligned}
$$

The new numerical point is:

$$
\boxed{(x_1,y_1)=(0.2,0.2)}.
$$

</details>

<details open>
<summary><strong>Step 1 To Step 2</strong></summary>

Use the new point $(x_1,y_1)=(0.2,0.2)$.

At $(x_1,y_1)=(0.2,0.2)$, calculate the new slope:

$$
\begin{aligned}
m_1
&=f(x_1,y_1)\\
&=f(0.2,0.2)\\
&=0.2-2(0.2)+1\\
&=0.8.
\end{aligned}
$$

Update the input:

$$
\begin{aligned}
x_2
&=x_1+h\\
&=0.2+0.2\\
&=0.4.
\end{aligned}
$$

Update the approximate solution:

$$
\begin{aligned}
y_2
&=y_1+h m_1\\
&=0.2+0.2(0.8)\\
&=0.2+0.16\\
&=0.36.
\end{aligned}
$$

Thus:

$$
\boxed{(x_2,y_2)=(0.4,0.36)}.
$$

</details>

<details open>
<summary><strong>Step 2 To Step 3</strong></summary>

Use $(x_2,y_2)=(0.4,0.36)$.

At $(x_2,y_2)=(0.4,0.36)$, calculate the new slope:

$$
\begin{aligned}
m_2
&=f(x_2,y_2)\\
&=f(0.4,0.36)\\
&=0.4-2(0.36)+1\\
&=0.4-0.72+1\\
&=0.68.
\end{aligned}
$$

Update the input:

$$
\begin{aligned}
x_3
&=x_2+h\\
&=0.4+0.2\\
&=0.6.
\end{aligned}
$$

Update the approximate solution:

$$
\begin{aligned}
y_3
&=y_2+h m_2\\
&=0.36+0.2(0.68)\\
&=0.36+0.136\\
&=0.496.
\end{aligned}
$$

Thus:

$$
\boxed{(x_3,y_3)=(0.6,0.496)}.
$$

</details>

<details open>
<summary><strong>Step 3 To Step 4</strong></summary>

Use $(x_3,y_3)=(0.6,0.496)$.

At $(x_3,y_3)=(0.6,0.496)$, calculate the new slope:

$$
\begin{aligned}
m_3
&=f(x_3,y_3)\\
&=f(0.6,0.496)\\
&=0.6-2(0.496)+1\\
&=0.6-0.992+1\\
&=0.608.
\end{aligned}
$$

Update the input:

$$
\begin{aligned}
x_4
&=x_3+h\\
&=0.6+0.2\\
&=0.8.
\end{aligned}
$$

Update the approximate solution:

$$
\begin{aligned}
y_4
&=y_3+h m_3\\
&=0.496+0.2(0.608)\\
&=0.496+0.1216\\
&=0.6176.
\end{aligned}
$$

Therefore:

$$
\boxed{y(0.8)\approx y_4=0.6176}.
$$

</details>

<details open>
<summary><strong>Collect The Steps In A Table</strong></summary>

The completed calculation is:

| $n$ | $x_n$ | $y_n$ | $m_n=f(x_n,y_n)$ |
|---:|---:|---:|---:|
| $0$ | $0.0$ | $0.0000$ | $1.0000$ |
| $1$ | $0.2$ | $0.2000$ | $0.8000$ |
| $2$ | $0.4$ | $0.3600$ | $0.6800$ |
| $3$ | $0.6$ | $0.4960$ | $0.6080$ |
| $4$ | $0.8$ | $0.6176$ | not needed |

The slope in row $n$ advances the method from row $n$ to row $n+1$. No slope
is needed after reaching the target.

</details>

<details open>
<summary><strong>Compare The Euler Polygon With The Exact Curve</strong></summary>

![Euler polygon and exact solution for y prime equals x minus two y plus one](books/assets/chapter_18/chapter_18_figure-2.png)

For comparison, the exact solution is:

$$
y(x)=\frac{x}{2}+\frac14-\frac14e^{-2x}.
$$

At $x=0.8$:

$$
\begin{aligned}
y(0.8)
&=
\frac{0.8}{2}
+\frac14
-\frac14e^{-1.6}\\
&\approx0.5995.
\end{aligned}
$$

The Euler error at the target is approximately:

$$
\begin{aligned}
|y_4-y(0.8)|
&\approx|0.6176-0.5995|\\
&\approx0.0181.
\end{aligned}
$$

The Euler value is close, but it is not the exact value.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A reliable Euler table records:

$$
x_n,\qquad y_n,\qquad f(x_n,y_n)
$$

before calculating the next row. The method must use the approximate $y_n$
generated by the previous step.

</details>

---

## Block 6: Step Size, Error, And Numerical Stability

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to separate accuracy from stability and understand why reducing
$h$ usually helps Euler's method.

</details>

<details open>
<summary><strong>Local And Global Error</strong></summary>

The **local truncation error** asks what one Euler step omits when it starts
from the exact point. Taylor's formula shows an omitted term proportional to:

$$
h^2.
$$

For a sufficiently smooth problem, the local truncation error is therefore:

$$
O(h^2).
$$

The **global error** is the accumulated difference after many steps over a
fixed interval. Euler's method has global error:

$$
O(h).
$$

This is why Euler's method is called a **first-order method**.

</details>

<details open>
<summary><strong>A Step-Halving Check</strong></summary>

For the previous problem at $x=0.8$:

- with $h=0.2$, Euler gives $0.6176$
- with $h=0.1$, Euler gives $0.608057$
- the exact value is approximately $0.599526$

Using the exact target value $0.599526$, the absolute errors are:

$$
\begin{aligned}
E_{0.2}
&\approx|0.6176-0.599526|\\
&\approx0.018074,
\end{aligned}
$$

and:

$$
\begin{aligned}
E_{0.1}
&\approx|0.608057-0.599526|\\
&\approx0.008531.
\end{aligned}
$$

The ratio is:

$$
\frac{E_{0.1}}{E_{0.2}}
\approx0.47.
$$

Halving $h$ has roughly halved the error, which is consistent with first-order
global accuracy. This is a diagnostic pattern, not a guarantee for every
problem and every step size.

</details>

<details open>
<summary><strong>Work Versus Accuracy</strong></summary>

Over an interval of length $L$, a constant step size $h$ requires about:

$$
N=\frac{L}{h}
$$

steps.

Halving $h$ approximately doubles the number of slope evaluations. A smaller
step usually improves accuracy, but it increases computational work.

A sensible numerical report should state the chosen step size rather than give
only the final approximation.

</details>

<details open>
<summary><strong>A Stability Test Equation</strong></summary>

Consider:

$$
y'=\lambda y,
\qquad
\lambda<0.
$$

The exact solution is:

$$
y(x)=y_0e^{\lambda(x-x_0)},
$$

which decays toward zero.

Apply Euler's method:

$$
\begin{aligned}
y_{n+1}
&=y_n+h(\lambda y_n)\\
&=(1+h\lambda)y_n.
\end{aligned}
$$

The factor:

$$
1+h\lambda
$$

is the numerical amplification factor.

For the Euler values to decay in magnitude, require:

$$
|1+h\lambda|<1.
$$

When $\lambda<0$, this becomes:

$$
\boxed{
0<h<\frac{2}{|\lambda|}
}.
$$

</details>

<details open>
<summary><strong>A Stable And An Unstable Step Size</strong></summary>

For:

$$
y'=-8y,
\qquad
y(0)=1,
$$

Euler's update is:

$$
y_{n+1}=(1-8h)y_n.
$$

With $h=0.1$:

$$
1-8(0.1)=0.2.
$$

Thus:

$$
y_{n+1}=0.2y_n,
$$

so the numerical values decay.

With $h=0.3$:

$$
1-8(0.3)=-1.4.
$$

Thus:

$$
y_{n+1}=-1.4y_n.
$$

The sign alternates and the magnitude grows by a factor of $1.4$. The exact
solution decays, so this growth is created entirely by the numerical method.

![Stable and unstable Euler step sizes for y prime equals minus eight y](books/assets/chapter_18/chapter_18_figure-3.png)

</details>

<details open>
<summary><strong>Stable But Oscillatory</strong></summary>

For the same equation, choose $h=0.2$:

$$
1-8(0.2)=-0.6.
$$

Because:

$$
|-0.6|<1,
$$

the Euler values decay in magnitude. However, the negative factor makes their
sign alternate.

The exact solution $e^{-8x}$ remains positive. Thus a method can be stable in
magnitude while still displaying an artificial oscillation.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Accuracy asks how close the approximation is. Numerical stability asks whether
small errors and step-to-step values remain controlled.

For the decaying test equation $y'=\lambda y$ with $\lambda<0$, explicit
Euler is stable when:

$$
0<h<\frac{2}{|\lambda|}.
$$

A step size can be reasonable for one equation and unstable for another.

</details>

---

## Block 7: A Reliable Workflow And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to make qualitative sketches and Euler tables checkable rather
than dependent on intuition or hidden calculator work.

</details>

<details open>
<summary><strong>A Direction-Field Workflow</strong></summary>

### Step 1: Put The Equation In Slope Form

Write:

$$
y'=f(x,y).
$$

### Step 2: Identify Simple Sign Boundaries

Solve $f(x,y)=0$ to locate horizontal line elements.

### Step 3: Calculate Representative Slopes

Substitute several grid points and show the arithmetic.

### Step 4: Find Useful Isoclines

Set $f(x,y)=c$ for a few simple values of $c$.

### Step 5: Sketch Consistent Segments

Give segments equal visual length and use slope only for orientation.

### Step 6: Draw Solution Curves Tangentially

Start at an initial point and follow the local direction continuously.

</details>

<details open>
<summary><strong>An Euler-Method Workflow</strong></summary>

### Step 1: Record The Data

Write $f(x,y)$, $x_0$, $y_0$, $h$, and the target input.

### Step 2: Count The Steps

Check:

$$
N=\frac{x_{\mathrm{target}}-x_0}{h}.
$$

### Step 3: Calculate The Current Slope

Use:

$$
m_n=f(x_n,y_n).
$$

### Step 4: Update Both Coordinates

Use:

$$
x_{n+1}=x_n+h,
\qquad
y_{n+1}=y_n+h m_n.
$$

### Step 5: Recalculate At The New Point

The next slope uses $(x_{n+1},y_{n+1})$.

### Step 6: Retain Guard Digits

Avoid aggressive rounding during intermediate steps.

### Step 7: Check With A Smaller Step

When practical, repeat with $h/2$ and compare the target values.

</details>

<details open>
<summary><strong>Common Mistake: Using The New Input In The Old Slope</strong></summary>

Explicit Euler calculates:

$$
m_n=f(x_n,y_n)
$$

before either coordinate is updated.

Explicit Euler does not use the mixed-time-level slope:

$$
f(x_{n+1},y_n).
$$

Mixing the new input with the old height creates a different numerical method.

</details>

<details open>
<summary><strong>Common Mistake: Reusing The Exact Initial Value</strong></summary>

After the first step, use the calculated approximation $y_1$:

$$
m_1=f(x_1,y_1).
$$

Do not return to $y_0$, and do not insert an exact value $y(x_1)$ unless the
problem explicitly asks for an error comparison.

Euler's method advances using its own numerical history.

</details>

<details open>
<summary><strong>Common Mistake: Confusing An Isocline With A Solution</strong></summary>

An isocline $f(x,y)=c$ contains points where solution slopes equal $c$.

To be a solution curve, the curve's own derivative must also equal $c$ at
those points. That extra condition is not automatic.

Equilibrium isoclines in autonomous equations are special because a horizontal
line with assigned slope zero also has geometric slope zero.

</details>

<details open>
<summary><strong>Common Mistake: Assuming Smaller Always Means Stable</strong></summary>

Reducing $h$ often improves Euler's method, but stability depends on the
equation's rate scale. The relevant quantity for $y'=\lambda y$ is:

$$
h\lambda.
$$

A step that is small on the $x$-axis may still be too large when
$|\lambda|$ is large.

</details>

<details open>
<summary><strong>Common Mistake: Rounding Every Row Too Early</strong></summary>

If each $y_n$ is rounded heavily before the next slope is calculated, the
rounding error is fed into every later step.

Keep several extra digits during the calculation, then round the reported
answer once at the end.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

For graphical work, substitute points and track signs. For Euler's method,
make each row locally checkable:

$$
(x_n,y_n)
\longrightarrow
m_n
\longrightarrow
(x_{n+1},y_{n+1}).
$$

The current point must be visible before the slope that advances it.

</details>


---

## Block 8: Original Practice Set

<details open>
<summary><strong>How To Use These Problems</strong></summary>

For direction-field questions, calculate slopes and signs before sketching. For
Euler questions, keep the chain:

$$
(x_n,y_n)
\to
f(x_n,y_n)
\to
x_{n+1}
\to
y_{n+1}
$$

visible for every requested step.

The twelve problems below use functions, data, and comparisons created for
this chapter.

</details>

<details open>
<summary><strong>Problems 1 To 4: Slopes, Isoclines, And Equilibria</strong></summary>

### Problem 1: Calculate Four Line-Element Slopes

For:

$$
y'=4x-y,
$$

find the slopes at:

$$
(0,1),\quad (1,0),\quad (1,2),\quad (-1,-2).
$$

### Problem 2: Find A Family Of Isoclines

For:

$$
y'=3x+y,
$$

find the isocline with slope $c$. Then give the isoclines for $c=0$, $c=2$,
and $c=-1$.

### Problem 3: Analyze Autonomous Equilibria

For:

$$
y'=(y-2)(y+2),
$$

find the equilibrium solutions, determine the sign of $y'$ in each interval,
and classify each equilibrium as stable or unstable.

### Problem 4: Locate Horizontal Tangents

For:

$$
y'=2x+y-3,
$$

find the zero-slope isocline. Determine whether solutions increase or decrease
at points above and below it.

</details>

<details open>
<summary><strong>Problems 5 To 8: Euler Steps</strong></summary>

### Problem 5: One Complete Euler Step

For:

$$
y'=x+y^2,
\qquad
y(0)=1,
$$

use $h=0.1$ to find $(x_1,y_1)$.

### Problem 6: Three Steps Toward An Equilibrium

For:

$$
y'=2-y,
\qquad
y(0)=0,
$$

use $h=0.25$ to approximate $y(0.75)$.

### Problem 7: A Changing Sign In The Slope

For:

$$
y'=x-3y,
\qquad
y(0)=1,
$$

use $h=0.2$ to approximate $y(0.6)$.

### Problem 8: Step Backward

For:

$$
y'=x+y,
\qquad
y(1)=2,
$$

use Euler's method with $h=-0.1$ to approximate $y(0.8)$.

</details>

<details open>
<summary><strong>Problems 9 To 12: Error, Stability, And Diagnosis</strong></summary>

### Problem 9: Compare One Step With An Exact Value

For:

$$
y'=3y,
\qquad
y(0)=2,
$$

take one Euler step with $h=0.1$. Compare it with the exact value
$y(0.1)=2e^{0.3}$ and calculate the absolute error.

### Problem 10: Compare Two Step Sizes

For:

$$
y'=1-y,
\qquad
y(0)=0,
$$

approximate $y(0.4)$ using $h=0.2$ and $h=0.1$. Compare both results with the
exact value $1-e^{-0.4}$.

### Problem 11: Test Three Step Sizes For Stability

For:

$$
y'=-5y,
$$

derive the explicit Euler stability condition. Classify $h=0.1$, $h=0.3$, and
$h=0.5$. State whether a stable sequence alternates in sign.

### Problem 12: Diagnose A Mixed-Time-Level Error

For:

$$
y'=x+y,
\qquad
y(0)=1,
\qquad
h=0.2,
$$

a learner first calculates $x_1=0.2$, then uses
$f(x_1,y_0)=f(0.2,1)=1.2$ and reports $y_1=1.24$. Explain the error and give
the explicit Euler value.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

The slope rule is:

$$
f(x,y)=4x-y.
$$

At $(0,1)$:

$$
\begin{aligned}
f(0,1)
&=4(0)-1\\
&=-1.
\end{aligned}
$$

At $(1,0)$:

$$
\begin{aligned}
f(1,0)
&=4(1)-0\\
&=4.
\end{aligned}
$$

At $(1,2)$:

$$
\begin{aligned}
f(1,2)
&=4(1)-2\\
&=2.
\end{aligned}
$$

At $(-1,-2)$:

$$
\begin{aligned}
f(-1,-2)
&=4(-1)-(-2)\\
&=-4+2\\
&=-2.
\end{aligned}
$$

Thus the four slopes, in the stated order, are:

$$
\boxed{-1,\quad 4,\quad 2,\quad -2}.
$$

### Answer 2

For:

$$
y'=3x+y,
$$

set the slope equal to $c$:

$$
3x+y=c.
$$

Subtract $3x$ from both sides:

$$
\boxed{y=c-3x}.
$$

This is the isocline family.

For $c=0$:

$$
y=-3x.
$$

For $c=2$:

$$
y=2-3x.
$$

For $c=-1$:

$$
y=-1-3x.
$$

Every segment on each line has the corresponding slope $c$.

### Answer 3

For:

$$
y'=(y-2)(y+2),
$$

equilibria occur when:

$$
(y-2)(y+2)=0.
$$

Set each factor equal to zero:

$$
y-2=0
\qquad\text{or}\qquad
y+2=0.
$$

Therefore:

$$
\boxed{y=2,\qquad y=-2}
$$

are equilibrium solutions.

For $y<-2$, test $y=-3$:

$$
(-3-2)(-3+2)=(-5)(-1)>0.
$$

For $-2<y<2$, test $y=0$:

$$
(0-2)(0+2)=(-2)(2)<0.
$$

For $y>2$, test $y=3$:

$$
(3-2)(3+2)=(1)(5)>0.
$$

Thus solutions move upward below $-2$, downward between $-2$ and $2$, and
upward above $2$.

Both neighboring directions point toward $y=-2$, so $y=-2$ is stable. Both
directions point away from $y=2$, so $y=2$ is unstable.

### Answer 4

For:

$$
y'=2x+y-3,
$$

horizontal tangents satisfy:

$$
2x+y-3=0.
$$

Solve for $y$:

$$
\boxed{y=3-2x}.
$$

At a point above this line:

$$
y>3-2x.
$$

Add $2x-3$ to both sides:

$$
2x+y-3>0.
$$

Therefore solutions increase above the line.

At a point below the line:

$$
y<3-2x,
$$

so:

$$
2x+y-3<0.
$$

Therefore solutions decrease below the line.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

The starting point and step size are:

$$
x_0=0,
\qquad
y_0=1,
\qquad
h=0.1.
$$

The slope rule is:

$$
f(x,y)=x+y^2.
$$

Calculate the current slope:

$$
\begin{aligned}
m_0
&=f(x_0,y_0)\\
&=f(0,1)\\
&=0+1^2\\
&=1.
\end{aligned}
$$

Update $x$:

$$
x_1=x_0+h=0+0.1=0.1.
$$

Update $y$:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=1+0.1(1)\\
&=1.1.
\end{aligned}
$$

Therefore:

$$
\boxed{(x_1,y_1)=(0.1,1.1)}.
$$

### Answer 6

For:

$$
y'=2-y,
\qquad
h=0.25,
$$

use $f(x,y)=2-y$.

Start with:

$$
(x_0,y_0)=(0,0).
$$

The first slope is:

$$
m_0=2-y_0=2-0=2.
$$

Update:

$$
\begin{aligned}
x_1&=0+0.25=0.25,\\
y_1&=0+0.25(2)=0.5.
\end{aligned}
$$

At $(x_1,y_1)=(0.25,0.5)$, the second slope is:

$$
m_1=2-y_1=2-0.5=1.5.
$$

Update:

$$
\begin{aligned}
x_2&=0.25+0.25=0.5,\\
y_2&=0.5+0.25(1.5)=0.875.
\end{aligned}
$$

At $(x_2,y_2)=(0.5,0.875)$, the third slope is:

$$
m_2=2-y_2=2-0.875=1.125.
$$

Update:

$$
\begin{aligned}
x_3&=0.5+0.25=0.75,\\
y_3&=0.875+0.25(1.125)\\
&=0.875+0.28125\\
&=1.15625.
\end{aligned}
$$

Thus:

$$
\boxed{y(0.75)\approx1.15625}.
$$

### Answer 7

For:

$$
y'=x-3y,
\qquad
h=0.2,
$$

start with $(x_0,y_0)=(0,1)$.

At the starting point:

$$
m_0=x_0-3y_0=0-3(1)=-3.
$$

Update:

$$
\begin{aligned}
x_1&=0+0.2=0.2,\\
y_1&=1+0.2(-3)=0.4.
\end{aligned}
$$

At $(0.2,0.4)$:

$$
m_1=0.2-3(0.4)=-1.
$$

Update:

$$
\begin{aligned}
x_2&=0.2+0.2=0.4,\\
y_2&=0.4+0.2(-1)=0.2.
\end{aligned}
$$

At $(0.4,0.2)$:

$$
m_2=0.4-3(0.2)=-0.2.
$$

Update:

$$
\begin{aligned}
x_3&=0.4+0.2=0.6,\\
y_3&=0.2+0.2(-0.2)\\
&=0.16.
\end{aligned}
$$

Therefore:

$$
\boxed{y(0.6)\approx0.16}.
$$

### Answer 8

A backward step uses:

$$
h=-0.1.
$$

Start from:

$$
(x_0,y_0)=(1,2).
$$

The first slope is:

$$
m_0=x_0+y_0=1+2=3.
$$

Update:

$$
\begin{aligned}
x_1&=1-0.1=0.9,\\
y_1&=2+(-0.1)(3)=1.7.
\end{aligned}
$$

At $(0.9,1.7)$:

$$
m_1=x_1+y_1=0.9+1.7=2.6.
$$

Update:

$$
\begin{aligned}
x_2&=0.9-0.1=0.8,\\
y_2&=1.7+(-0.1)(2.6)\\
&=1.44.
\end{aligned}
$$

Thus:

$$
\boxed{y(0.8)\approx1.44}.
$$

The negative step changes the direction of travel, not the Euler formula.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

For:

$$
y'=3y,
\qquad
(x_0,y_0)=(0,2),
\qquad
h=0.1,
$$

the starting slope is:

$$
m_0=3y_0=3(2)=6.
$$

Euler's update gives:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=2+0.1(6)\\
&=2.6.
\end{aligned}
$$

The exact value is:

$$
\begin{aligned}
y(0.1)
&=2e^{0.3}\\
&\approx2.699718.
\end{aligned}
$$

Therefore the absolute error is:

$$
\begin{aligned}
|y_1-y(0.1)|
&\approx|2.6-2.699718|\\
&\approx0.099718.
\end{aligned}
$$

### Answer 10

The slope rule is:

$$
f(x,y)=1-y.
$$

First use $h=0.2$.

Start from $(x_0,y_0)=(0,0)$:

$$
m_0=1-y_0=1.
$$

The first update is:

$$
x_1=0.2,
\qquad
y_1=0+0.2(1)=0.2.
$$

At $(0.2,0.2)$:

$$
m_1=1-0.2=0.8.
$$

The second update is:

$$
\begin{aligned}
x_2&=0.4,\\
y_2&=0.2+0.2(0.8)=0.36.
\end{aligned}
$$

Thus the $h=0.2$ approximation is:

$$
y(0.4)\approx0.36.
$$

Now use $h=0.1$. The four successive heights are obtained from
$y_{n+1}=y_n+0.1(1-y_n)$:

$$
\begin{aligned}
y_1&=0+0.1(1)=0.1,\\
y_2&=0.1+0.1(0.9)=0.19,\\
y_3&=0.19+0.1(0.81)=0.271,\\
y_4&=0.271+0.1(0.729)=0.3439.
\end{aligned}
$$

The exact target value is:

$$
1-e^{-0.4}\approx0.329680.
$$

The two errors are:

$$
|0.36-0.329680|\approx0.030320,
$$

and:

$$
|0.3439-0.329680|\approx0.014220.
$$

The smaller step produces the smaller error in this calculation.

### Answer 11

For:

$$
y'=-5y,
$$

Euler gives:

$$
\begin{aligned}
y_{n+1}
&=y_n+h(-5y_n)\\
&=(1-5h)y_n.
\end{aligned}
$$

Stability in magnitude requires:

$$
|1-5h|<1.
$$

Write the double inequality:

$$
-1<1-5h<1.
$$

From $-1<1-5h<1$, subtract $1$ throughout:

$$
-2<-5h<0.
$$

Divide by $-5$ and reverse the inequalities:

$$
\boxed{0<h<0.4}.
$$

For $h=0.1$:

$$
1-5(0.1)=0.5.
$$

The sequence is stable and does not alternate.

For $h=0.3$:

$$
1-5(0.3)=-0.5.
$$

The sequence is stable in magnitude but alternates in sign.

For $h=0.5$:

$$
1-5(0.5)=-1.5.
$$

Since $|-1.5|>1$, the sequence is unstable.

### Answer 12

Explicit Euler must calculate the slope at the old point:

$$
m_0=f(x_0,y_0).
$$

For this IVP, the initial point is:

$$
(x_0,y_0)=(0,1).
$$

Therefore:

$$
\begin{aligned}
m_0
&=f(0,1)\\
&=0+1\\
&=1.
\end{aligned}
$$

Now update both coordinates:

$$
x_1=x_0+h=0+0.2=0.2,
$$

and:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=1+0.2(1)\\
&=1.2.
\end{aligned}
$$

Thus explicit Euler gives:

$$
\boxed{(x_1,y_1)=(0.2,1.2)}.
$$

The learner used $x_1$ together with $y_0$ when calculating the slope. Those
values belong to different time levels, so the calculation is not an explicit
Euler step.

</details>

<details open>
<summary><strong>Chapter 18 Final Summary</strong></summary>

A first-order equation in slope form:

$$
y'=f(x,y)
$$

assigns the slope $f(a,b)$ to every point $(a,b)$. A direction field displays
many of these slopes as short line elements.

An isocline of slope $c$ satisfies:

$$
\boxed{f(x,y)=c}.
$$

For an autonomous equation $y'=F(y)$, equilibrium levels satisfy:

$$
\boxed{F(y_*)=0}.
$$

Signs of $F(y)$ between equilibria show where solutions increase or decrease
and whether nearby solutions move toward or away from an equilibrium.

For the initial-value problem:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0,
$$

explicit Euler uses:

$$
\boxed{
x_{n+1}=x_n+h,
\qquad
y_{n+1}=y_n+h f(x_n,y_n)
}.
$$

The slope must be evaluated at the current numerical point $(x_n,y_n)$.

For sufficiently smooth problems, Euler has local truncation error $O(h^2)$
and global error $O(h)$. Halving $h$ often roughly halves the global error over
a fixed interval.

For the decaying test equation $y'=\lambda y$ with $\lambda<0$, Euler becomes:

$$
y_{n+1}=(1+h\lambda)y_n.
$$

Its values decay in magnitude when:

$$
\boxed{|1+h\lambda|<1}.
$$

The chapter's central lesson is:

> read the slope locally, follow it for only one short step, recalculate at the
> new point, and check that the chosen step size preserves the behavior the
> differential equation is supposed to have.

</details>
