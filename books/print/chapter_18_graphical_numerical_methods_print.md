```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 18}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Graphical And Numerical Methods}
```
# Chapter 18 - Graphical And Numerical Methods

An exact formula is not always the most useful way to study a differential
equation. Sometimes a formula is difficult to obtain; sometimes only a few
approximate values are needed; and sometimes the important question concerns
the direction in which solutions move.

```{=latex}
\Needspace{10\baselineskip}
```
This chapter studies first-order initial-value problems of the form:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0.
$$

The main questions are:

-   how does $f(x,y)$ encode a slope at every point?
-   how is a direction field read without solving the equation?
-   what does an isocline reveal?
-   how can equilibrium solutions be identified from signs?
-   how does Euler's method turn one tangent line into a numerical step?
-   why must each new slope use the newly calculated point?
-   how does the step size affect error and workload?
-   how can a large step size create numerical behavior that the true solution
    does not have?

```{=latex}
\Needspace{20\baselineskip}
```
## Reading A Differential Equation As A Slope Rule {#block-1-reading-a-differential-equation-as-a-slope-rule}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to interpret $y'=f(x,y)$ as local geometric information before
trying to calculate a solution formula.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Equation Says At One Point {#what-the-equation-says-at-one-point-2}

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
y'=f(x,y),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the derivative $y'$ is the slope of a solution curve. At a particular point
$(a,b)$, substitute:

$$
x=a,
\qquad
y=b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The resulting number:

$$
f(a,b)
$$

is the slope that a solution curve must have when it passes through $(a,b)$.

```{=latex}
\Needspace{10\baselineskip}
```
For example, if:

$$
y'=2x-3y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### From A Slope To A Line Element {#from-a-slope-to-a-line-element-3}

A **line element** is a short segment centered at $(a,b)$ with slope
$f(a,b)$.

Its purpose is local. It does not claim that the solution remains straight.
It shows only the direction in which the solution initially leaves the point.

```{=latex}
\Needspace{10\baselineskip}
```
The segment can be aligned with the vector:

$$
\begin{bmatrix}
1\\
f(a,b)
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
because its vertical change divided by its horizontal change is:

$$
\frac{f(a,b)}{1}=f(a,b).
$$

To keep steep segments from becoming much longer than shallow ones, plotting
software usually normalizes this vector. Normalization changes its length but
not its slope.

```{=latex}
\Needspace{12\baselineskip}
```
### Positive, Zero, And Negative Slopes {#positive-zero-and-negative-slopes-4}

At a point $(a,b)$:

-   if $f(a,b)>0$, the line element rises from left to right
-   if $f(a,b)=0$, the line element is horizontal
-   if $f(a,b)<0$, the line element falls from left to right

The size of $|f(a,b)|$ controls steepness. A slope of $4$ is steeper than a
slope of $1/2$, while a slope of $-4$ is steep in the downward direction.

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Slope Table {#a-small-slope-table-5}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2x-3y,
$$

calculate several slopes directly.

```{=latex}
\Needspace{10\baselineskip}
```
At $(0,0)$:

$$
f(0,0)=2(0)-3(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0,1)$:

$$
f(0,1)=2(0)-3(1)=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(1,0)$:

$$
f(1,0)=2(1)-3(0)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(1,\frac23)$:

$$
f\left(1,\frac23\right)
=
2(1)-3\left(\frac23\right)
=
0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(2,\frac43)$:

$$
f\left(2,\frac43\right)=2(2)-3\left(\frac43\right)=0.
$$

The horizontal segments do not occur only at one point. Their locations form
a curve, which will become the zero-slope isocline.

```{=latex}
\Needspace{12\baselineskip}
```
### What A Direction Field Is {#what-a-direction-field-is-6}

A **direction field** is a grid of line elements. Each segment is calculated
from the same rule $f(x,y)$ at a different point.

A solution curve should:

1.  pass through its prescribed initial point
2.  remain tangent to nearby line elements
3.  bend gradually as the indicated slopes change

The field shows a family of possible solution paths. An initial condition
selects one path from that family.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
y'=f(x,y)
$$

assigns the slope $f(a,b)$ to the point $(a,b)$. A direction field displays
many of those local slopes at once.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> a direction field does not solve the equation point by point; it reveals the
> flow that every solution curve must follow.

```{=latex}
\Needspace{20\baselineskip}
```
## Direction Fields And Solution Curves {#block-2-direction-fields-and-solution-curves}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to read a complete direction field, relate it to several solution
curves, and understand what the picture can and cannot prove.

```{=latex}
\Needspace{12\baselineskip}
```
### An Original Direction Field {#an-original-direction-field-9}

```{=latex}
\Needspace{10\baselineskip}
```
The figure below uses:

$$
y'=2x-3y.
$$

![Direction field and three solution curves for y prime equals two x minus three y](books/assets/chapter_18/chapter_18_figure-1.png)

Every teal segment uses the slope $2x-3y$ at its own location. The three solid
curves start at different heights but follow the same slope rule.

Notice:

-   below the zero-slope line, many segments tilt upward
-   above that line, many segments tilt downward
-   the solution curves approach a common slanted trend as $x$ increases

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Curves Against The Equation {#check-the-curves-against-the-equation-10}

```{=latex}
\Needspace{10\baselineskip}
```
The exact family for this particular equation is:

$$
y(x)=\frac{2x}{3}-\frac29+Ce^{-3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'(x)=\frac23-3Ce^{-3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y'=2x-3y.
$$

The formula verifies the plotted curves, but the direction field itself could
have been constructed without knowing this exact family.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Field Reveals Qualitatively {#what-the-field-reveals-qualitatively-11}

For $y'=2x-3y$, the sign depends on whether $2x-3y$ is positive or negative.

```{=latex}
\Needspace{10\baselineskip}
```
At any point below the line $y=2x/3$:

$$
y<\frac{2x}{3}
\quad\Longrightarrow\quad
2x-3y>0
\quad\Longrightarrow\quad
y'>0.
$$

Therefore solutions increase below the line.

```{=latex}
\Needspace{10\baselineskip}
```
At any point above the line $y=2x/3$:

$$
y>\frac{2x}{3}
\quad\Longrightarrow\quad
2x-3y<0
\quad\Longrightarrow\quad
y'<0.
$$

Therefore solutions decrease above the line.

```{=latex}
\Needspace{10\baselineskip}
```
On:

$$
y=\frac{2x}{3},
$$

the slope is zero.

A solution can cross this zero-slope line. At the crossing it has a horizontal
tangent; the line is not itself a solution because its own slope is $2/3$, not
zero.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Picture Does Not Guarantee {#what-the-picture-does-not-guarantee-12}

A direction field is sampled at finitely many points. A hand-drawn solution
curve is therefore qualitative, not an exact numerical computation.

The picture can strongly suggest:

-   where solutions increase or decrease
-   possible turning points
-   attraction toward or repulsion from equilibrium levels
-   whether different initial conditions produce similar long-term behavior

It does not, by itself, provide exact values such as $y(0.73)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-13}

Direction fields and exact formulas answer different questions. The field
shows local geometry across many initial conditions; an exact solution gives
precise values for one solution family.

A curve drawn through a field must be tangent to the line elements, not merely
pass near them.

```{=latex}
\Needspace{20\baselineskip}
```
## Isoclines, Equilibria, And Sign Reasoning {#block-3-isoclines-equilibria-and-sign-reasoning}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-14}

The goal is to organize equal slopes with isoclines and use sign intervals to
read autonomous equations efficiently.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definition Of An Isocline {#the-definition-of-an-isocline-15}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=f(x,y),
$$

```{=latex}
\Needspace{10\baselineskip}
```
choose a constant slope $c$. The equation:

$$
\boxed{f(x,y)=c}
$$

defines an **isocline**.

Every point on that isocline has slope $c$. Different values of $c$ usually
produce different curves.

The name describes the purpose: an isocline is a curve of equal inclination.

```{=latex}
\Needspace{12\baselineskip}
```
### Isoclines For The Running Field {#isoclines-for-the-running-field-16}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2x-3y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
set the slope equal to $c$:

$$
2x-3y=c.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $y$ by subtracting $2x$:

$$
-3y=c-2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-3$:

$$
\boxed{
y=\frac{2x-c}{3}
}.
$$

Thus every isocline is a straight line.

```{=latex}
\Needspace{10\baselineskip}
```
For $c=0$:

$$
y=\frac{2x}{3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=1$:

$$
y=\frac{2x-1}{3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=-1$:

$$
y=\frac{2x+1}{3}.
$$

Segments on these three lines have slopes $0$, $1$, and $-1$, respectively.

```{=latex}
\Needspace{12\baselineskip}
```
### An Isocline Is Usually Not A Solution Curve {#an-isocline-is-usually-not-a-solution-curve-17}

```{=latex}
\Needspace{10\baselineskip}
```
On the zero-slope isocline:

$$
y=\frac{2x}{3},
$$

the differential equation assigns slope $0$.

```{=latex}
\Needspace{10\baselineskip}
```
But the line $y=2x/3$ has geometric slope:

$$
\frac{dy}{dx}=\frac23.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\frac23\ne0,
$$

the isocline does not satisfy the differential equation. It marks where
solution curves have horizontal tangents; it is not one of those solutions.

This distinction prevents a common visual mistake.

```{=latex}
\Needspace{12\baselineskip}
```
### Autonomous Equations {#autonomous-equations-18}

```{=latex}
\Needspace{10\baselineskip}
```
An equation is **autonomous** when the right side depends only on $y$:

$$
y'=F(y).
$$

Every horizontal line $y=b$ has the same slope because changing $x$ does not
change $F(b)$.

```{=latex}
\Needspace{10\baselineskip}
```
An **equilibrium solution** occurs at a level $y=y_*$ where:

$$
F(y_*)=0.
$$

The constant function $y(x)=y_*$ then has derivative zero and satisfies the
equation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Autonomous Sign Analysis {#a-complete-autonomous-sign-analysis-19}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=(y+1)(3-y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equilibria occur when either factor is zero:

$$
y+1=0
\qquad\text{or}\qquad
3-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y=-1,\qquad y=3}
$$

are equilibrium solutions.

Now test the sign in each interval.

```{=latex}
\Needspace{10\baselineskip}
```
For $y<-1$, choose $y=-2$:

$$
(-2+1)(3-(-2))=(-1)(5)<0.
$$

Solutions decrease below $-1$.

```{=latex}
\Needspace{10\baselineskip}
```
For $-1<y<3$, choose $y=0$:

$$
(0+1)(3-0)=(1)(3)>0.
$$

Solutions increase between the equilibria.

```{=latex}
\Needspace{10\baselineskip}
```
For $y>3$, choose $y=4$:

$$
(4+1)(3-4)=(5)(-1)<0.
$$

Solutions decrease above $3$.

```{=latex}
\Needspace{12\baselineskip}
```
### Stable And Unstable Equilibrium Levels {#stable-and-unstable-equilibrium-levels-20}

Near $y=3$:

-   solutions just below $3$ increase
-   solutions just above $3$ decrease

Both directions point toward $3$, so $y=3$ is a stable equilibrium.

Near $y=-1$:

-   solutions just below $-1$ decrease
-   solutions just above $-1$ increase

Both directions point away from $-1$, so $y=-1$ is unstable.

This is **solution stability**. Later in the chapter, **numerical stability**
will describe whether a discrete approximation behaves sensibly. The two ideas
are related in spirit but are not identical.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-21}

```{=latex}
\Needspace{10\baselineskip}
```
Isoclines satisfy:

$$
f(x,y)=c
$$

```{=latex}
\Needspace{10\baselineskip}
```
and collect points with the same slope. For autonomous equations, equilibrium
levels satisfy:

$$
F(y_*)=0.
$$

A sign chart above and below each equilibrium reveals whether nearby solutions
move toward it or away from it.

```{=latex}
\Needspace{20\baselineskip}
```
## Euler's Method From The Tangent Line {#block-4-eulers-method-from-the-tangent-line}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-22}

The goal is to derive Euler's update from the tangent line and identify every
quantity used in one numerical step.

```{=latex}
\Needspace{12\baselineskip}
```
### The Initial-Value Problem {#the-initial-value-problem-23}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0.
$$

Assume $(x_n,y_n)$ is the current numerical point. Here:

-   $x_n$ is the current input
-   $y_n$ approximates the true value $y(x_n)$
-   $h$ is the chosen step size

```{=latex}
\Needspace{10\baselineskip}
```
The differential equation supplies the current slope:

$$
m_n=f(x_n,y_n).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Derive One Euler Step Geometrically {#derive-one-euler-step-geometrically-24}

```{=latex}
\Needspace{10\baselineskip}
```
The tangent line through $(x_n,y_n)$ with slope $m_n$ is:

$$
L(x)=y_n+m_n(x-x_n).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose the next input:

$$
x_{n+1}=x_n+h.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the tangent line there:

$$
\begin{aligned}
L(x_{n+1})
&=y_n+m_n(x_{n+1}-x_n)\\
&=y_n+m_n h.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler's method uses this tangent-line value as the next approximation:

$$
y_{n+1}=y_n+h m_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $m_n=f(x_n,y_n)$:

$$
\boxed{
\begin{aligned}
x_{n+1}&=x_n+h,\\
y_{n+1}&=y_n+h f(x_n,y_n).
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### What One Step Means {#what-one-step-means-25}

```{=latex}
\Needspace{10\baselineskip}
```
The update:

$$
y_{n+1}=y_n+h f(x_n,y_n)
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> Euler's method repeatedly turns local slope information into short straight
> steps.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Slope Must Be Recalculated {#why-the-slope-must-be-recalculated-26}

```{=latex}
\Needspace{10\baselineskip}
```
After one update, the current point changes from $(x_n,y_n)$ to:

$$
(x_{n+1},y_{n+1}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The next slope is therefore:

$$
m_{n+1}=f(x_{n+1},y_{n+1}),
$$

not $f(x_n,y_n)$ again.

Unless $f$ is constant, reusing the old slope follows the same straight line
instead of responding to the changing direction field.

```{=latex}
\Needspace{12\baselineskip}
```
### The Taylor-Series View {#the-taylor-series-view-27}

```{=latex}
\Needspace{10\baselineskip}
```
For a sufficiently smooth true solution:

$$
y(x_n+h)
=
y(x_n)
+h y'(x_n)
+\frac{h^2}{2}y''(\xi_n)
$$

for some $\xi_n$ between $x_n$ and $x_n+h$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-28}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## A Complete Euler Calculation {#block-5-a-complete-euler-calculation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-29}

The goal is to calculate several Euler steps without hiding how any slope or
table entry was obtained.

```{=latex}
\Needspace{12\baselineskip}
```
### The Problem And Step Count {#the-problem-and-step-count-30}

```{=latex}
\Needspace{10\baselineskip}
```
Approximate $y(0.8)$ for:

$$
y'=x-2y+1,
\qquad
y(0)=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
using:

$$
h=0.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The number of equal steps is:

$$
N=\frac{0.8-0}{0.2}=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The starting numerical point is:

$$
x_0=0,
\qquad
y_0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The slope rule is:

$$
f(x,y)=x-2y+1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 0 To Step 1 {#step-0-to-step-1-31}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Update the input:

$$
\begin{aligned}
x_1
&=x_0+h\\
&=0+0.2\\
&=0.2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update the approximate solution:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=0+0.2(1)\\
&=0.2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The new numerical point is:

$$
\boxed{(x_1,y_1)=(0.2,0.2)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 1 To Step 2 {#step-1-to-step-2-32}

Use the new point $(x_1,y_1)=(0.2,0.2)$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Update the input:

$$
\begin{aligned}
x_2
&=x_1+h\\
&=0.2+0.2\\
&=0.4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{(x_2,y_2)=(0.4,0.36)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 2 To Step 3 {#step-2-to-step-3-33}

Use $(x_2,y_2)=(0.4,0.36)$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Update the input:

$$
\begin{aligned}
x_3
&=x_2+h\\
&=0.4+0.2\\
&=0.6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{(x_3,y_3)=(0.6,0.496)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 3 To Step 4 {#step-3-to-step-4-34}

Use $(x_3,y_3)=(0.6,0.496)$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Update the input:

$$
\begin{aligned}
x_4
&=x_3+h\\
&=0.6+0.2\\
&=0.8.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y(0.8)\approx y_4=0.6176}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Collect The Steps In A Table {#collect-the-steps-in-a-table-35}

The completed calculation is:

    $n$   $x_n$      $y_n$   $m_n=f(x_n,y_n)$
  ----- ------- ---------- ------------------
    $0$   $0.0$   $0.0000$           $1.0000$
    $1$   $0.2$   $0.2000$           $0.8000$
    $2$   $0.4$   $0.3600$           $0.6800$
    $3$   $0.6$   $0.4960$           $0.6080$
    $4$   $0.8$   $0.6176$         not needed

The slope in row $n$ advances the method from row $n$ to row $n+1$. No slope
is needed after reaching the target.

```{=latex}
\Needspace{12\baselineskip}
```
### Compare The Euler Polygon With The Exact Curve {#compare-the-euler-polygon-with-the-exact-curve-36}

![Euler polygon and exact solution for y prime equals x minus two y plus one](books/assets/chapter_18/chapter_18_figure-2.png)

```{=latex}
\Needspace{10\baselineskip}
```
For comparison, the exact solution is:

$$
y(x)=\frac{x}{2}+\frac14-\frac14e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The Euler error at the target is approximately:

$$
\begin{aligned}
|y_4-y(0.8)|
&\approx|0.6176-0.5995|\\
&\approx0.0181.
\end{aligned}
$$

The Euler value is close, but it is not the exact value.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-37}

```{=latex}
\Needspace{10\baselineskip}
```
A reliable Euler table records:

$$
x_n,\qquad y_n,\qquad f(x_n,y_n)
$$

before calculating the next row. The method must use the approximate $y_n$
generated by the previous step.

```{=latex}
\Needspace{20\baselineskip}
```
## Step Size, Error, And Numerical Stability {#block-6-step-size-error-and-numerical-stability}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-38}

The goal is to separate accuracy from stability and understand why reducing
$h$ usually helps Euler's method.

```{=latex}
\Needspace{12\baselineskip}
```
### Local And Global Error {#local-and-global-error-39}

```{=latex}
\Needspace{10\baselineskip}
```
The **local truncation error** asks what one Euler step omits when it starts
from the exact point. Taylor's formula shows an omitted term proportional to:

$$
h^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a sufficiently smooth problem, the local truncation error is therefore:

$$
O(h^2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The **global error** is the accumulated difference after many steps over a
fixed interval. Euler's method has global error:

$$
O(h).
$$

This is why Euler's method is called a **first-order method**.

```{=latex}
\Needspace{12\baselineskip}
```
### A Step-Halving Check {#a-step-halving-check-40}

For the previous problem at $x=0.8$:

-   with $h=0.2$, Euler gives $0.6176$
-   with $h=0.1$, Euler gives $0.608057$
-   the exact value is approximately $0.599526$

```{=latex}
\Needspace{10\baselineskip}
```
Using the exact target value $0.599526$, the absolute errors are:

$$
\begin{aligned}
E_{0.2}
&\approx|0.6176-0.599526|\\
&\approx0.018074,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\begin{aligned}
E_{0.1}
&\approx|0.608057-0.599526|\\
&\approx0.008531.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The ratio is:

$$
\frac{E_{0.1}}{E_{0.2}}
\approx0.47.
$$

Halving $h$ has roughly halved the error, which is consistent with first-order
global accuracy. This is a diagnostic pattern, not a guarantee for every
problem and every step size.

```{=latex}
\Needspace{12\baselineskip}
```
### Work Versus Accuracy {#work-versus-accuracy-41}

```{=latex}
\Needspace{10\baselineskip}
```
Over an interval of length $L$, a constant step size $h$ requires about:

$$
N=\frac{L}{h}
$$

steps.

Halving $h$ approximately doubles the number of slope evaluations. A smaller
step usually improves accuracy, but it increases computational work.

A sensible numerical report should state the chosen step size rather than give
only the final approximation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Stability Test Equation {#a-stability-test-equation-42}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=\lambda y,
\qquad
\lambda<0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exact solution is:

$$
y(x)=y_0e^{\lambda(x-x_0)},
$$

which decays toward zero.

```{=latex}
\Needspace{10\baselineskip}
```
Apply Euler's method:

$$
\begin{aligned}
y_{n+1}
&=y_n+h(\lambda y_n)\\
&=(1+h\lambda)y_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factor:

$$
1+h\lambda
$$

is the numerical amplification factor.

```{=latex}
\Needspace{10\baselineskip}
```
For the Euler values to decay in magnitude, require:

$$
|1+h\lambda|<1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When $\lambda<0$, this becomes:

$$
\boxed{
0<h<\frac{2}{|\lambda|}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Stable And An Unstable Step Size {#a-stable-and-an-unstable-step-size-43}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=-8y,
\qquad
y(0)=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler's update is:

$$
y_{n+1}=(1-8h)y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $h=0.1$:

$$
1-8(0.1)=0.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_{n+1}=0.2y_n,
$$

so the numerical values decay.

```{=latex}
\Needspace{10\baselineskip}
```
With $h=0.3$:

$$
1-8(0.3)=-1.4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_{n+1}=-1.4y_n.
$$

The sign alternates and the magnitude grows by a factor of $1.4$. The exact
solution decays, so this growth is created entirely by the numerical method.

![Stable and unstable Euler step sizes for y prime equals minus eight y](books/assets/chapter_18/chapter_18_figure-3.png)

```{=latex}
\Needspace{12\baselineskip}
```
### Stable But Oscillatory {#stable-but-oscillatory-44}

```{=latex}
\Needspace{10\baselineskip}
```
For the same equation, choose $h=0.2$:

$$
1-8(0.2)=-0.6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because:

$$
|-0.6|<1,
$$

the Euler values decay in magnitude. However, the negative factor makes their
sign alternate.

The exact solution $e^{-8x}$ remains positive. Thus a method can be stable in
magnitude while still displaying an artificial oscillation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-45}

Accuracy asks how close the approximation is. Numerical stability asks whether
small errors and step-to-step values remain controlled.

```{=latex}
\Needspace{10\baselineskip}
```
For the decaying test equation $y'=\lambda y$ with $\lambda<0$, explicit
Euler is stable when:

$$
0<h<\frac{2}{|\lambda|}.
$$

A step size can be reasonable for one equation and unstable for another.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Workflow And Common Mistakes {#block-7-a-reliable-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-46}

The goal is to make qualitative sketches and Euler tables checkable rather
than dependent on intuition or hidden calculator work.

```{=latex}
\Needspace{12\baselineskip}
```
### A Direction-Field Workflow {#a-direction-field-workflow-47}

#### Step 1: Put The Equation In Slope Form

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
y'=f(x,y).
$$

#### Step 2: Identify Simple Sign Boundaries

Solve $f(x,y)=0$ to locate horizontal line elements.

#### Step 3: Calculate Representative Slopes

Substitute several grid points and show the arithmetic.

#### Step 4: Find Useful Isoclines

Set $f(x,y)=c$ for a few simple values of $c$.

#### Step 5: Sketch Consistent Segments

Give segments equal visual length and use slope only for orientation.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Draw Solution Curves Tangentially

Start at an initial point and follow the local direction continuously.

```{=latex}
\Needspace{12\baselineskip}
```
### An Euler-Method Workflow {#an-euler-method-workflow-48}

#### Step 1: Record The Data

Write $f(x,y)$, $x_0$, $y_0$, $h$, and the target input.

#### Step 2: Count The Steps

```{=latex}
\Needspace{10\baselineskip}
```
Check:

$$
N=\frac{x_{\mathrm{target}}-x_0}{h}.
$$

#### Step 3: Calculate The Current Slope

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
m_n=f(x_n,y_n).
$$

#### Step 4: Update Both Coordinates

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x_{n+1}=x_n+h,
\qquad
y_{n+1}=y_n+h m_n.
$$

#### Step 5: Recalculate At The New Point

The next slope uses $(x_{n+1},y_{n+1})$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Retain Guard Digits

Avoid aggressive rounding during intermediate steps.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Check With A Smaller Step

When practical, repeat with $h/2$ and compare the target values.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using The New Input In The Old Slope {#common-mistake-using-the-new-input-in-the-old-slope-49}

```{=latex}
\Needspace{10\baselineskip}
```
Explicit Euler calculates:

$$
m_n=f(x_n,y_n)
$$

before either coordinate is updated.

```{=latex}
\Needspace{10\baselineskip}
```
Explicit Euler does not use the mixed-time-level slope:

$$
f(x_{n+1},y_n).
$$

Mixing the new input with the old height creates a different numerical method.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reusing The Exact Initial Value {#common-mistake-reusing-the-exact-initial-value-50}

```{=latex}
\Needspace{10\baselineskip}
```
After the first step, use the calculated approximation $y_1$:

$$
m_1=f(x_1,y_1).
$$

Do not return to $y_0$, and do not insert an exact value $y(x_1)$ unless the
problem explicitly asks for an error comparison.

Euler's method advances using its own numerical history.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Confusing An Isocline With A Solution {#common-mistake-confusing-an-isocline-with-a-solution-51}

An isocline $f(x,y)=c$ contains points where solution slopes equal $c$.

To be a solution curve, the curve's own derivative must also equal $c$ at
those points. That extra condition is not automatic.

Equilibrium isoclines in autonomous equations are special because a horizontal
line with assigned slope zero also has geometric slope zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Assuming Smaller Always Means Stable {#common-mistake-assuming-smaller-always-means-stable-52}

```{=latex}
\Needspace{10\baselineskip}
```
Reducing $h$ often improves Euler's method, but stability depends on the
equation's rate scale. The relevant quantity for $y'=\lambda y$ is:

$$
h\lambda.
$$

A step that is small on the $x$-axis may still be too large when
$|\lambda|$ is large.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Rounding Every Row Too Early {#common-mistake-rounding-every-row-too-early-53}

If each $y_n$ is rounded heavily before the next slope is calculated, the
rounding error is fed into every later step.

Keep several extra digits during the calculation, then round the reported
answer once at the end.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-54}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### How To Use These Problems {#how-to-use-these-problems-55}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Slopes, Isoclines, And Equilibria {#problems-1-to-4-slopes-isoclines-and-equilibria-56}

#### Problem 1: Calculate Four Line-Element Slopes

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=4x-y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
find the slopes at:

$$
(0,1),\quad (1,0),\quad (1,2),\quad (-1,-2).
$$

#### Problem 2: Find A Family Of Isoclines

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=3x+y,
$$

find the isocline with slope $c$. Then give the isoclines for $c=0$, $c=2$,
and $c=-1$.

#### Problem 3: Analyze Autonomous Equilibria

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=(y-2)(y+2),
$$

find the equilibrium solutions, determine the sign of $y'$ in each interval,
and classify each equilibrium as stable or unstable.

#### Problem 4: Locate Horizontal Tangents

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2x+y-3,
$$

find the zero-slope isocline. Determine whether solutions increase or decrease
at points above and below it.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Euler Steps {#problems-5-to-8-euler-steps-57}

#### Problem 5: One Complete Euler Step

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=x+y^2,
\qquad
y(0)=1,
$$

use $h=0.1$ to find $(x_1,y_1)$.

#### Problem 6: Three Steps Toward An Equilibrium

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2-y,
\qquad
y(0)=0,
$$

use $h=0.25$ to approximate $y(0.75)$.

#### Problem 7: A Changing Sign In The Slope

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=x-3y,
\qquad
y(0)=1,
$$

use $h=0.2$ to approximate $y(0.6)$.

#### Problem 8: Step Backward

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=x+y,
\qquad
y(1)=2,
$$

use Euler's method with $h=-0.1$ to approximate $y(0.8)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Error, Stability, And Diagnosis {#problems-9-to-12-error-stability-and-diagnosis-58}

#### Problem 9: Compare One Step With An Exact Value

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=3y,
\qquad
y(0)=2,
$$

take one Euler step with $h=0.1$. Compare it with the exact value
$y(0.1)=2e^{0.3}$ and calculate the absolute error.

#### Problem 10: Compare Two Step Sizes

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=1-y,
\qquad
y(0)=0,
$$

approximate $y(0.4)$ using $h=0.2$ and $h=0.1$. Compare both results with the
exact value $1-e^{-0.4}$.

#### Problem 11: Test Three Step Sizes For Stability

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=-5y,
$$

derive the explicit Euler stability condition. Classify $h=0.1$, $h=0.3$, and
$h=0.5$. State whether a stable sequence alternates in sign.

#### Problem 12: Diagnose A Mixed-Time-Level Error

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-59}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The slope rule is:

$$
f(x,y)=4x-y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0,1)$:

$$
\begin{aligned}
f(0,1)
&=4(0)-1\\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(1,0)$:

$$
\begin{aligned}
f(1,0)
&=4(1)-0\\
&=4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(1,2)$:

$$
\begin{aligned}
f(1,2)
&=4(1)-2\\
&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(-1,-2)$:

$$
\begin{aligned}
f(-1,-2)
&=4(-1)-(-2)\\
&=-4+2\\
&=-2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the four slopes, in the stated order, are:

$$
\boxed{-1,\quad 4,\quad 2,\quad -2}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=3x+y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
set the slope equal to $c$:

$$
3x+y=c.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $3x$ from both sides:

$$
\boxed{y=c-3x}.
$$

This is the isocline family.

```{=latex}
\Needspace{10\baselineskip}
```
For $c=0$:

$$
y=-3x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=2$:

$$
y=2-3x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=-1$:

$$
y=-1-3x.
$$

Every segment on each line has the corresponding slope $c$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=(y-2)(y+2),
$$

```{=latex}
\Needspace{10\baselineskip}
```
equilibria occur when:

$$
(y-2)(y+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set each factor equal to zero:

$$
y-2=0
\qquad\text{or}\qquad
y+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y=2,\qquad y=-2}
$$

are equilibrium solutions.

```{=latex}
\Needspace{10\baselineskip}
```
For $y<-2$, test $y=-3$:

$$
(-3-2)(-3+2)=(-5)(-1)>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $-2<y<2$, test $y=0$:

$$
(0-2)(0+2)=(-2)(2)<0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y>2$, test $y=3$:

$$
(3-2)(3+2)=(1)(5)>0.
$$

Thus solutions move upward below $-2$, downward between $-2$ and $2$, and
upward above $2$.

Both neighboring directions point toward $y=-2$, so $y=-2$ is stable. Both
directions point away from $y=2$, so $y=2$ is unstable.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2x+y-3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
horizontal tangents satisfy:

$$
2x+y-3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $y$:

$$
\boxed{y=3-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At a point above this line:

$$
y>3-2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $2x-3$ to both sides:

$$
2x+y-3>0.
$$

Therefore solutions increase above the line.

```{=latex}
\Needspace{10\baselineskip}
```
At a point below the line:

$$
y<3-2x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
2x+y-3<0.
$$

Therefore solutions decrease below the line.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-60}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
The starting point and step size are:

$$
x_0=0,
\qquad
y_0=1,
\qquad
h=0.1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The slope rule is:

$$
f(x,y)=x+y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Update $x$:

$$
x_1=x_0+h=0+0.1=0.1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update $y$:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=1+0.1(1)\\
&=1.1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{(x_1,y_1)=(0.1,1.1)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=2-y,
\qquad
h=0.25,
$$

use $f(x,y)=2-y$.

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
(x_0,y_0)=(0,0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first slope is:

$$
m_0=2-y_0=2-0=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_1&=0+0.25=0.25,\\
y_1&=0+0.25(2)=0.5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(x_1,y_1)=(0.25,0.5)$, the second slope is:

$$
m_1=2-y_1=2-0.5=1.5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_2&=0.25+0.25=0.5,\\
y_2&=0.5+0.25(1.5)=0.875.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(x_2,y_2)=(0.5,0.875)$, the third slope is:

$$
m_2=2-y_2=2-0.875=1.125.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_3&=0.5+0.25=0.75,\\
y_3&=0.875+0.25(1.125)\\
&=0.875+0.28125\\
&=1.15625.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{y(0.75)\approx1.15625}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=x-3y,
\qquad
h=0.2,
$$

start with $(x_0,y_0)=(0,1)$.

```{=latex}
\Needspace{10\baselineskip}
```
At the starting point:

$$
m_0=x_0-3y_0=0-3(1)=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_1&=0+0.2=0.2,\\
y_1&=1+0.2(-3)=0.4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0.2,0.4)$:

$$
m_1=0.2-3(0.4)=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_2&=0.2+0.2=0.4,\\
y_2&=0.4+0.2(-1)=0.2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0.4,0.2)$:

$$
m_2=0.4-3(0.2)=-0.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_3&=0.4+0.2=0.6,\\
y_3&=0.2+0.2(-0.2)\\
&=0.16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y(0.6)\approx0.16}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
A backward step uses:

$$
h=-0.1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
(x_0,y_0)=(1,2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first slope is:

$$
m_0=x_0+y_0=1+2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_1&=1-0.1=0.9,\\
y_1&=2+(-0.1)(3)=1.7.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0.9,1.7)$:

$$
m_1=x_1+y_1=0.9+1.7=2.6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update:

$$
\begin{aligned}
x_2&=0.9-0.1=0.8,\\
y_2&=1.7+(-0.1)(2.6)\\
&=1.44.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{y(0.8)\approx1.44}.
$$

The negative step changes the direction of travel, not the Euler formula.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-61}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=3y,
\qquad
(x_0,y_0)=(0,2),
\qquad
h=0.1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the starting slope is:

$$
m_0=3y_0=3(2)=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler's update gives:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=2+0.1(6)\\
&=2.6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exact value is:

$$
\begin{aligned}
y(0.1)
&=2e^{0.3}\\
&\approx2.699718.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the absolute error is:

$$
\begin{aligned}
|y_1-y(0.1)|
&\approx|2.6-2.699718|\\
&\approx0.099718.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The slope rule is:

$$
f(x,y)=1-y.
$$

First use $h=0.2$.

```{=latex}
\Needspace{10\baselineskip}
```
Start from $(x_0,y_0)=(0,0)$:

$$
m_0=1-y_0=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first update is:

$$
x_1=0.2,
\qquad
y_1=0+0.2(1)=0.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $(0.2,0.2)$:

$$
m_1=1-0.2=0.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second update is:

$$
\begin{aligned}
x_2&=0.4,\\
y_2&=0.2+0.2(0.8)=0.36.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the $h=0.2$ approximation is:

$$
y(0.4)\approx0.36.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The exact target value is:

$$
1-e^{-0.4}\approx0.329680.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two errors are:

$$
|0.36-0.329680|\approx0.030320,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
|0.3439-0.329680|\approx0.014220.
$$

The smaller step produces the smaller error in this calculation.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=-5y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler gives:

$$
\begin{aligned}
y_{n+1}
&=y_n+h(-5y_n)\\
&=(1-5h)y_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Stability in magnitude requires:

$$
|1-5h|<1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the double inequality:

$$
-1<1-5h<1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $-1<1-5h<1$, subtract $1$ throughout:

$$
-2<-5h<0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-5$ and reverse the inequalities:

$$
\boxed{0<h<0.4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $h=0.1$:

$$
1-5(0.1)=0.5.
$$

The sequence is stable and does not alternate.

```{=latex}
\Needspace{10\baselineskip}
```
For $h=0.3$:

$$
1-5(0.3)=-0.5.
$$

The sequence is stable in magnitude but alternates in sign.

```{=latex}
\Needspace{10\baselineskip}
```
For $h=0.5$:

$$
1-5(0.5)=-1.5.
$$

Since $|-1.5|>1$, the sequence is unstable.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Explicit Euler must calculate the slope at the old point:

$$
m_0=f(x_0,y_0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this IVP, the initial point is:

$$
(x_0,y_0)=(0,1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
m_0
&=f(0,1)\\
&=0+1\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now update both coordinates:

$$
x_1=x_0+h=0+0.2=0.2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\begin{aligned}
y_1
&=y_0+h m_0\\
&=1+0.2(1)\\
&=1.2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus explicit Euler gives:

$$
\boxed{(x_1,y_1)=(0.2,1.2)}.
$$

The learner used $x_1$ together with $y_0$ when calculating the slope. Those
values belong to different time levels, so the calculation is not an explicit
Euler step.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 18 Final Summary {#chapter-18-final-summary-62}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation in slope form:

$$
y'=f(x,y)
$$

assigns the slope $f(a,b)$ to every point $(a,b)$. A direction field displays
many of these slopes as short line elements.

```{=latex}
\Needspace{10\baselineskip}
```
An isocline of slope $c$ satisfies:

$$
\boxed{f(x,y)=c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For an autonomous equation $y'=F(y)$, equilibrium levels satisfy:

$$
\boxed{F(y_*)=0}.
$$

Signs of $F(y)$ between equilibria show where solutions increase or decrease
and whether nearby solutions move toward or away from an equilibrium.

```{=latex}
\Needspace{10\baselineskip}
```
For the initial-value problem:

$$
y'=f(x,y),
\qquad
y(x_0)=y_0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the decaying test equation $y'=\lambda y$ with $\lambda<0$, Euler becomes:

$$
y_{n+1}=(1+h\lambda)y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its values decay in magnitude when:

$$
\boxed{|1+h\lambda|<1}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> read the slope locally, follow it for only one short step, recalculate at the
> new point, and check that the chosen step size preserves the behavior the
> differential equation is supposed to have.
