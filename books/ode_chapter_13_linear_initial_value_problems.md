# Solving Linear Initial-Value Problems

Chapters 9 through 12 developed methods for finding general solutions of
linear differential equations. A general solution contains arbitrary constants
because the differential equation alone describes an entire family of
functions.

An **initial-value problem**, or **IVP**, adds enough information at one point
to select one member of that family.

This chapter focuses on the stage that is often compressed into the phrase
"apply the initial conditions." That phrase hides several decisions:

- which solution must receive the conditions?
- how many derivatives must be calculated?
- how are the resulting constant equations formed?
- why must those equations usually be solved simultaneously?
- what changes when the initial point is not zero?
- why do zero initial data imply a zero solution in one problem but not in
  another?
- how can the Wronskian explain the uniqueness of the selected constants?
- how are higher-order initial-value problems handled?

The guiding rule is:

> solve the differential equation first, write the complete general solution,
> and only then use all initial conditions to determine its arbitrary
> constants.

All examples, equations, and exercises in this chapter are independently
constructed. The reference text is used only to identify the mathematical
topics.

---

## Block 1: What An Initial-Value Problem Adds

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to separate the two parts of an initial-value problem:

1. the differential equation determines a family of possible solutions
2. the initial conditions select one member of that family

Neither part should be silently substituted into the other before the general
solution has been found.

</details>

<details open>
<summary><strong>Equation, Conditions, And Selected Solution</strong></summary>

A second-order initial-value problem has the form:

$$
a(x)y''+b(x)y'+c(x)y=g(x),
$$

with two conditions at the same point $x_0$:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1.
$$

Here:

- $x_0$ is the initial point
- $Y_0$ is the prescribed value of the function
- $Y_1$ is the prescribed value of its first derivative

The differential equation is satisfied throughout an interval. The two
initial conditions are satisfied at the single point $x_0$.

The practical meaning is:

> the equation controls how a solution evolves, while the initial data specify
> where that evolution begins and in which direction it initially moves.

</details>

<details open>
<summary><strong>Why A Second-Order Problem Needs Two Conditions</strong></summary>

A second-order general solution normally contains two arbitrary constants:

$$
y(x)=c_1y_1(x)+c_2y_2(x)+y_p(x).
$$

To determine both $c_1$ and $c_2$, two independent scalar equations are
needed. The conditions:

$$
y(x_0)=Y_0
$$

and:

$$
y'(x_0)=Y_1
$$

provide those two equations.

More generally, an $n$th-order equation normally has $n$ arbitrary constants
and requires $n$ initial conditions:

$$
y(x_0),
\quad
y'(x_0),
\quad
\ldots,
\quad
y^{(n-1)}(x_0).
$$

The highest derivative prescribed in a standard $n$th-order IVP is order
$n-1$, not order $n$. The differential equation itself determines the next
derivative once the lower-order data are known.

</details>

<details open>
<summary><strong>The Four-Stage Workflow</strong></summary>

### Stage 1: Solve the differential equation

Find the complete general solution. For a nonhomogeneous linear equation, this
means:

$$
y=y_h+y_p.
$$

### Stage 2: Calculate the required derivatives

If the problem supplies $y'(x_0)$, differentiate the complete solution once.
For higher-order problems, continue only as far as the highest prescribed
derivative.

### Stage 3: Apply one condition at a time

Substitute $x=x_0$ into the appropriate formula and record the resulting
equation for the constants.

### Stage 4: Solve the constant system and verify

Solve all constant equations together. Substitute the constants back into the
complete solution, then check both the differential equation and every initial
condition.

</details>

<details open>
<summary><strong>A First Homogeneous Example</strong></summary>

Solve:

$$
y''-y'-6y=0,
$$

subject to:

$$
y(0)=5,
\qquad
y'(0)=0.
$$

### Step 1: Find the general solution

The characteristic equation is:

$$
r^2-r-6=0.
$$

Factor:

$$
(r-3)(r+2)=0.
$$

The roots are $r=3,-2$, so the general solution is:

$$
y=c_1e^{3x}+c_2e^{-2x}.
$$

Because the differential equation is homogeneous, this homogeneous family is
already the complete general solution.

### Step 2: Differentiate the complete solution

Differentiate each exponential term:

$$
y'=3c_1e^{3x}-2c_2e^{-2x}.
$$

### Step 3: Apply $y(0)=5$

Return to the general solution:

$$
y=c_1e^{3x}+c_2e^{-2x}.
$$

Substitute $x=0$ and $y(0)=5$:

$$
5=c_1e^0+c_2e^0.
$$

Since $e^0=1$:

$$
c_1+c_2=5.
$$

### Step 4: Apply $y'(0)=0$

Return to the derivative:

$$
y'=3c_1e^{3x}-2c_2e^{-2x}.
$$

Substitute $x=0$ and $y'(0)=0$:

$$
0=3c_1e^0-2c_2e^0.
$$

Thus:

$$
3c_1-2c_2=0.
$$

### Step 5: Solve the two equations together

The constant system is:

$$
\begin{aligned}
c_1+c_2&=5, \\
3c_1-2c_2&=0.
\end{aligned}
$$

Multiply the first equation by $2$:

$$
2c_1+2c_2=10.
$$

Add this equation to $3c_1-2c_2=0$. The $c_2$ terms cancel:

$$
5c_1=10.
$$

Divide by $5$:

$$
c_1=2.
$$

Substitute $c_1=2$ into $c_1+c_2=5$:

$$
2+c_2=5.
$$

Subtract $2$ from both sides:

$$
c_2=3.
$$

### Step 6: Write the selected solution

Substitute both constants into the general solution:

$$
\boxed{
y=2e^{3x}+3e^{-2x}
}.
$$

### Step 7: Check the initial data

At $x=0$:

$$
y(0)=2+3=5.
$$

The derivative is:

$$
y'=6e^{3x}-6e^{-2x}.
$$

Therefore:

$$
y'(0)=6-6=0.
$$

Both conditions are satisfied.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

An IVP is not a new solution method for the differential equation. It is a
selection problem performed after the general solution is known.

For a second-order problem:

1. find the complete two-constant solution
2. differentiate it once
3. form one constant equation from each initial condition
4. solve the two equations simultaneously
5. verify both conditions

</details>

---

## Block 2: Apply Conditions To The Complete Solution

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to prevent the central error in nonhomogeneous IVPs: applying the
initial conditions only to $y_h$ while omitting the contribution from $y_p$.

</details>

<details open>
<summary><strong>The Complete Solution Is $y_h+y_p$</strong></summary>

For a nonhomogeneous equation:

$$
L[y]=g(x),
$$

the general solution is:

$$
\boxed{y=y_h+y_p}.
$$

Although the arbitrary constants appear in $y_h$, the initial conditions are
conditions on the actual solution $y$. Therefore:

$$
y(x_0)=y_h(x_0)+y_p(x_0)
$$

and:

$$
y'(x_0)=y_h'(x_0)+y_p'(x_0).
$$

The particular solution can change the right sides of the equations used to
determine the homogeneous constants.

</details>

<details open>
<summary><strong>A Complete Forced Example</strong></summary>

Solve:

$$
y''+3y'+2y=6x+7,
$$

subject to:

$$
y(0)=2,
\qquad
y'(0)=-1.
$$

### Step 1: Find the homogeneous solution

The associated homogeneous characteristic equation is:

$$
r^2+3r+2=0.
$$

Factor:

$$
(r+1)(r+2)=0.
$$

The roots are $-1,-2$, so:

$$
y_h=c_1e^{-x}+c_2e^{-2x}.
$$

### Step 2: Find one particular solution

The forcing $6x+7$ is linear, so use the complete linear trial:

$$
y_p=Ax+B.
$$

Differentiate:

$$
y_p'=A,
\qquad
y_p''=0.
$$

Substitute these expressions into the left side:

$$
\begin{aligned}
y_p''+3y_p'+2y_p
&=0+3A+2(Ax+B) \\
&=2Ax+(3A+2B).
\end{aligned}
$$

Match this with the required forcing:

$$
2Ax+(3A+2B)=6x+7.
$$

Matching the coefficients of $x$ gives:

$$
2A=6.
$$

Divide by $2$:

$$
A=3.
$$

Matching the constant terms gives:

$$
3A+2B=7.
$$

Substitute $A=3$:

$$
9+2B=7.
$$

Subtract $9$ from both sides:

$$
2B=-2.
$$

Divide by $2$:

$$
B=-1.
$$

Thus:

$$
y_p=3x-1.
$$

### Step 3: Write the complete general solution

Use $y=y_h+y_p$:

$$
\boxed{
y=c_1e^{-x}+c_2e^{-2x}+3x-1
}.
$$

This complete formula, not $y_h$ by itself, receives the initial conditions.

### Step 4: Differentiate the complete solution

Differentiate every term:

$$
y'=-c_1e^{-x}-2c_2e^{-2x}+3.
$$

The constant $3$ comes from differentiating the particular term $3x-1$. It
must remain in the derivative condition.

### Step 5: Apply $y(0)=2$

Return to the complete solution:

$$
y=c_1e^{-x}+c_2e^{-2x}+3x-1.
$$

Substitute $x=0$ and $y(0)=2$:

$$
2=c_1e^0+c_2e^0+3(0)-1.
$$

Simplify:

$$
2=c_1+c_2-1.
$$

Add $1$ to both sides:

$$
c_1+c_2=3.
$$

### Step 6: Apply $y'(0)=-1$

Return to:

$$
y'=-c_1e^{-x}-2c_2e^{-2x}+3.
$$

Substitute $x=0$ and $y'(0)=-1$:

$$
-1=-c_1e^0-2c_2e^0+3.
$$

Simplify:

$$
-1=-c_1-2c_2+3.
$$

Subtract $3$ from both sides:

$$
-4=-c_1-2c_2.
$$

Multiply both sides by $-1$:

$$
c_1+2c_2=4.
$$

### Step 7: Solve the constant system

The two equations are:

$$
\begin{aligned}
c_1+c_2&=3, \\
c_1+2c_2&=4.
\end{aligned}
$$

Subtract the first equation from the second:

$$
c_2=1.
$$

Substitute $c_2=1$ into $c_1+c_2=3$:

$$
c_1+1=3.
$$

Subtract $1$:

$$
c_1=2.
$$

### Step 8: Write and verify the selected solution

Substitute $c_1=2,c_2=1$ into the complete solution:

$$
\boxed{
y=2e^{-x}+e^{-2x}+3x-1
}.
$$

At $x=0$:

$$
y(0)=2+1+0-1=2.
$$

The derivative is:

$$
y'=-2e^{-x}-2e^{-2x}+3.
$$

Therefore:

$$
y'(0)=-2-2+3=-1.
$$

Both data are satisfied.

</details>

<details open>
<summary><strong>What Goes Wrong If $y_p$ Is Omitted?</strong></summary>

In the previous problem:

$$
y_h=c_1e^{-x}+c_2e^{-2x},
\qquad
y_p=3x-1.
$$

Applying $y(0)=2$ incorrectly to $y_h$ alone would give:

$$
c_1+c_2=2.
$$

The correct complete solution gives:

$$
c_1+c_2-1=2,
$$

so:

$$
c_1+c_2=3.
$$

The two constant equations differ because $y_p(0)=-1$.

Similarly, applying $y'(0)=-1$ only to $y_h'$ would omit:

$$
y_p'(0)=3.
$$

This changes the second constant equation as well. The constants live in
$y_h$, but the conditions belong to $y_h+y_p$.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For a nonhomogeneous problem, always write locally:

$$
y=y_h+y_p
$$

and:

$$
y'=y_h'+y_p'.
$$

Then apply the data. Omitting $y_p$ or one of its derivatives changes the
constant system and usually produces a function that fails the initial
conditions.

</details>

---

## Block 3: The Constant System And The Wronskian

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see the initial conditions as a linear system for the arbitrary
constants and to understand why the Wronskian guarantees that the system can be
solved.

</details>

<details open>
<summary><strong>Build The General Two-Constant System</strong></summary>

Suppose the complete solution is:

$$
y=c_1y_1+c_2y_2+y_p.
$$

Differentiate:

$$
y'=c_1y_1'+c_2y_2'+y_p'.
$$

Apply:

$$
y(x_0)=Y_0.
$$

Substitution gives:

$$
c_1y_1(x_0)+c_2y_2(x_0)+y_p(x_0)=Y_0.
$$

Subtract $y_p(x_0)$ from both sides:

$$
c_1y_1(x_0)+c_2y_2(x_0)=Y_0-y_p(x_0).
$$

Now apply:

$$
y'(x_0)=Y_1.
$$

Substitution gives:

$$
c_1y_1'(x_0)+c_2y_2'(x_0)+y_p'(x_0)=Y_1.
$$

Subtract $y_p'(x_0)$:

$$
c_1y_1'(x_0)+c_2y_2'(x_0)=Y_1-y_p'(x_0).
$$

The constant system is therefore:

$$
\boxed{
\begin{bmatrix}
y_1(x_0) & y_2(x_0) \\
y_1'(x_0) & y_2'(x_0)
\end{bmatrix}
\begin{bmatrix}
c_1 \\
c_2
\end{bmatrix}
=
\begin{bmatrix}
Y_0-y_p(x_0) \\
Y_1-y_p'(x_0)
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Why The Wronskian Appears Again</strong></summary>

The determinant of the constant-system matrix is:

$$
\begin{aligned}
&y_1(x_0)y_2'(x_0)-y_1'(x_0)y_2(x_0) \\
&=W(y_1,y_2)(x_0).
\end{aligned}
$$

If $y_1,y_2$ form a fundamental pair, then their Wronskian is nonzero on the
working interval. In particular:

$$
W(x_0)\ne 0.
$$

Therefore the two-by-two constant system has exactly one solution
$(c_1,c_2)$.

This is the algebraic reason a valid pair of initial conditions selects one
member of the general solution family.

</details>

<details open>
<summary><strong>An Initial Point Away From Zero</strong></summary>

Solve:

$$
y''+4y=4x,
$$

subject to:

$$
y\left(\frac{\pi}{4}\right)=1+\frac{\pi}{4},
\qquad
y'\left(\frac{\pi}{4}\right)=-3.
$$

### Step 1: Find the complete general solution

The homogeneous equation is:

$$
y''+4y=0.
$$

Its fundamental pair is:

$$
\cos(2x),
\qquad
\sin(2x).
$$

For the forcing $4x$, try:

$$
y_p=Ax+B.
$$

Then:

$$
y_p''=0.
$$

Substitute into $y_p''+4y_p=4x$:

$$
4(Ax+B)=4x.
$$

Match coefficients:

$$
4A=4,
\qquad
4B=0.
$$

Thus:

$$
A=1,
\qquad
B=0,
$$

and:

$$
y_p=x.
$$

The complete general solution is:

$$
y=c_1\cos(2x)+c_2\sin(2x)+x.
$$

### Step 2: Differentiate before substituting the initial point

Differentiate every term:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+1.
$$

### Step 3: Apply the position condition at $x=\pi/4$

At $x=\pi/4$:

$$
2x=\frac{\pi}{2}.
$$

Use:

$$
\cos\left(\frac{\pi}{2}\right)=0,
\qquad
\sin\left(\frac{\pi}{2}\right)=1.
$$

Substitute into the complete solution:

$$
1+\frac{\pi}{4}
=c_1(0)+c_2(1)+\frac{\pi}{4}.
$$

Subtract $\pi/4$ from both sides:

$$
c_2=1.
$$

### Step 4: Apply the derivative condition at $x=\pi/4$

Return to:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+1.
$$

Substitute $x=\pi/4$:

$$
-3=-2c_1(1)+2c_2(0)+1.
$$

Simplify:

$$
-3=-2c_1+1.
$$

Subtract $1$:

$$
-4=-2c_1.
$$

Divide by $-2$:

$$
c_1=2.
$$

### Step 5: Write the selected solution

Substitute $c_1=2,c_2=1$:

$$
\boxed{
y=2\cos(2x)+\sin(2x)+x
}.
$$

The exponentials or trigonometric values are not automatically $1$ unless the
initial point makes them so. This example required the actual values at
$x=\pi/4$.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Initial conditions create a linear system for the arbitrary constants. For a
second-order IVP, its coefficient determinant is the Wronskian evaluated at the
initial point.

Because a fundamental pair has $W(x_0)\ne 0$, the constant system has one
solution. At a nonzero initial point, evaluate every exponential,
trigonometric function, polynomial, and derivative at the actual value of
$x_0$.

</details>

---

## Block 4: Existence, Uniqueness, And Zero Initial Data

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect the constant calculations to the existence-and-
uniqueness theorem and to distinguish zero data for homogeneous and
nonhomogeneous equations.

</details>

<details open>
<summary><strong>The Linear Existence-And-Uniqueness Statement</strong></summary>

Consider the normalized equation:

$$
y''+P(x)y'+Q(x)y=R(x).
$$

If $P,Q,R$ are continuous on an interval $I$ containing $x_0$, then for any
numbers $Y_0,Y_1$, the IVP:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1
$$

has exactly one solution on $I$.

This statement contains two claims:

- **existence:** at least one solution satisfies the equation and the data
- **uniqueness:** no second, different solution satisfies the same equation and
  the same data on that interval

The continuity interval matters. If normalization divides by a function that
vanishes, the theorem cannot be applied across that singular point.

</details>

<details open>
<summary><strong>Homogeneous Equation With Zero Data</strong></summary>

Consider:

$$
y''+9y=0,
$$

with:

$$
y(0)=0,
\qquad
y'(0)=0.
$$

The general solution is:

$$
y=c_1\cos(3x)+c_2\sin(3x).
$$

Differentiate:

$$
y'=-3c_1\sin(3x)+3c_2\cos(3x).
$$

Apply $y(0)=0$:

$$
0=c_1\cos(0)+c_2\sin(0)=c_1.
$$

Thus:

$$
c_1=0.
$$

Apply $y'(0)=0$:

$$
0=-3c_1\sin(0)+3c_2\cos(0)=3c_2.
$$

Divide by $3$:

$$
c_2=0.
$$

Therefore:

$$
\boxed{y=0}.
$$

For a homogeneous linear IVP, zero initial data select the zero solution. By
uniqueness, no nonzero solution can have the same zero data at the same point.

</details>

<details open>
<summary><strong>Nonhomogeneous Equation With Zero Data</strong></summary>

Now consider:

$$
y''+y=1,
$$

with the same zero data:

$$
y(0)=0,
\qquad
y'(0)=0.
$$

The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

A constant particular solution $y_p=A$ gives:

$$
y_p''+y_p=0+A=A.
$$

To reproduce the forcing $1$, choose:

$$
A=1.
$$

Therefore the complete solution is:

$$
y=c_1\cos x+c_2\sin x+1.
$$

Differentiate:

$$
y'=-c_1\sin x+c_2\cos x.
$$

Apply $y(0)=0$:

$$
0=c_1+1.
$$

Subtract $1$:

$$
c_1=-1.
$$

Apply $y'(0)=0$:

$$
0=c_2.
$$

Thus:

$$
\boxed{y=1-\cos x}.
$$

Zero initial data do not force the zero function here because $y=0$ does not
satisfy the nonhomogeneous equation:

$$
0''+0=0\ne 1.
$$

The forcing drives the solution away from zero after the initial point.

</details>

<details open>
<summary><strong>The Interval Cannot Be Ignored</strong></summary>

Consider an equation that becomes, after normalization:

$$
y''+\frac{1}{x}y'=R(x).
$$

The coefficient $1/x$ is not continuous at $x=0$. An IVP based at $x_0=1$
may be studied on $(0,\infty)$, while an IVP based at $x_0=-1$ may be studied
on $(-\infty,0)$.

The existence-and-uniqueness theorem does not justify extending either solution
through $x=0$ without additional analysis.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Continuous normalized coefficients guarantee one solution for each valid pair
of initial values on the interval containing $x_0$.

For a homogeneous equation, zero initial data select $y=0$. For a
nonhomogeneous equation, the same data can select a nonzero forced response.
Always check whether the zero function satisfies the differential equation
before claiming that zero data imply a zero solution.

</details>

---

## Block 5: Initial Data After Variation Of Parameters

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect Chapter 12's definite-integral construction with the IVP
workflow. When the variation integrals begin at the initial point, the chosen
particular solution has zero initial value and zero initial derivative there.

</details>

<details open>
<summary><strong>Why Anchored Integrals Simplify The Constant Equations</strong></summary>

For:

$$
y''+Py'+Qy=R,
$$

let $y_1,y_2$ be a fundamental pair and let $W$ be their Wronskian. Define:

$$
u_1(x)
=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt
$$

and:

$$
u_2(x)
=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

Then:

$$
y_p=u_1y_1+u_2y_2.
$$

Because both integrals vanish at $x=x_0$:

$$
u_1(x_0)=u_2(x_0)=0.
$$

Therefore:

$$
y_p(x_0)=0.
$$

Under the variation-of-parameters auxiliary condition:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

Since both parameter functions vanish at $x_0$:

$$
y_p'(x_0)=0.
$$

The initial data then determine only the homogeneous combination:

$$
\begin{aligned}
c_1y_1(x_0)+c_2y_2(x_0)&=Y_0, \\
c_1y_1'(x_0)+c_2y_2'(x_0)&=Y_1.
\end{aligned}
$$

The complete solution still includes $y_p$. The anchored construction merely
makes its two initial contributions zero.

</details>

<details open>
<summary><strong>A Variation-Of-Parameters IVP</strong></summary>

Solve on $-\pi/2<x<\pi/2$:

$$
y''+y=2\tan x,
$$

subject to:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

### Step 1: Find the homogeneous pair and Wronskian

The associated homogeneous equation is:

$$
y''+y=0.
$$

Choose:

$$
y_1=\cos x,
\qquad
y_2=\sin x.
$$

The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

Differentiate the pair:

$$
y_1'=-\sin x,
\qquad
y_2'=\cos x.
$$

Compute:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=\cos^2x+\sin^2x \\
&=1.
\end{aligned}
$$

### Step 2: Construct $u_1$ from the initial point

The normalized forcing is:

$$
R(x)=2\tan x.
$$

Use:

$$
u_1(x)
=-\int_0^x\frac{y_2(t)R(t)}{W(t)}\,dt.
$$

Substitute $y_2(t)=\sin t$, $R(t)=2\tan t$, and $W=1$:

$$
u_1(x)=-2\int_0^x\sin t\tan t\,dt.
$$

Rewrite the integrand:

$$
\begin{aligned}
\sin t\tan t
&=\frac{\sin^2t}{\cos t} \\
&=\frac{1-\cos^2t}{\cos t} \\
&=\sec t-\cos t.
\end{aligned}
$$

Therefore:

$$
u_1(x)=-2\int_0^x(\sec t-\cos t)\,dt.
$$

On the chosen interval:

$$
\int\sec t\,dt=\ln(\sec t+\tan t),
\qquad
\int\cos t\,dt=\sin t.
$$

Apply the limits:

$$
\begin{aligned}
u_1(x)
&=-2[\ln(\sec t+\tan t)-\sin t]_0^x \\
&=-2\ln(\sec x+\tan x)+2\sin x.
\end{aligned}
$$

At $x=0$, both $\ln(1)$ and $\sin(0)$ are zero, as required.

### Step 3: Construct $u_2$ from the initial point

Use:

$$
u_2(x)
=\int_0^x\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

Substitute $y_1(t)=\cos t$, $R(t)=2\tan t$, and $W=1$:

$$
\begin{aligned}
u_2(x)
&=\int_0^x2\cos t\tan t\,dt \\
&=2\int_0^x\sin t\,dt.
\end{aligned}
$$

Integrate and apply the limits:

$$
\begin{aligned}
u_2(x)
&=[-2\cos t]_0^x \\
&=-2\cos x+2 \\
&=2(1-\cos x).
\end{aligned}
$$

### Step 4: Reconstruct and simplify $y_p$

Return to:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute the four functions:

$$
\begin{aligned}
y_p
&=[-2\ln(\sec x+\tan x)+2\sin x]\cos x \\
&\quad +2(1-\cos x)\sin x.
\end{aligned}
$$

Expand the second line:

$$
\begin{aligned}
y_p
&=-2\cos x\ln(\sec x+\tan x)
+2\sin x\cos x \\
&\quad +2\sin x-2\sin x\cos x.
\end{aligned}
$$

Cancel the opposite product terms:

$$
\boxed{
y_p=2\sin x-2\cos x\ln(\sec x+\tan x)
}.
$$

The anchored construction guarantees:

$$
y_p(0)=0,
\qquad
y_p'(0)=0.
$$

### Step 5: Apply the initial data to the complete solution

Write:

$$
y=c_1\cos x+c_2\sin x+y_p.
$$

Apply $y(0)=1$ using $y_p(0)=0$:

$$
\begin{aligned}
1
&=c_1\cos(0)+c_2\sin(0)+0 \\
&=c_1.
\end{aligned}
$$

Thus:

$$
c_1=1.
$$

Differentiate the complete solution in structural form:

$$
y'=-c_1\sin x+c_2\cos x+y_p'.
$$

Apply $y'(0)=0$ using $y_p'(0)=0$:

$$
\begin{aligned}
0
&=-c_1\sin(0)+c_2\cos(0)+0 \\
&=c_2.
\end{aligned}
$$

Therefore:

$$
c_2=0.
$$

### Step 6: Write and verify the selected solution

Substitute the constants and the particular solution:

$$
\boxed{
y=\cos x+2\sin x
-2\cos x\ln(\sec x+\tan x)
}.
$$

For a direct equation check, let:

$$
h(x)=\ln(\sec x+\tan x).
$$

Then:

$$
h'(x)=\sec x.
$$

The terms $\cos x$ and $2\sin x$ are homogeneous, so only
$z=-2\cos x\,h$ contributes to $y''+y$. Differentiate $z$:

$$
\begin{aligned}
z'
&=2\sin x\,h-2\cos x\,h' \\
&=2\sin x\,h-2.
\end{aligned}
$$

Differentiate again:

$$
z''=2\cos x\,h+2\sin x\sec x.
$$

Add $z=-2\cos x\,h$:

$$
\begin{aligned}
z''+z
&=2\sin x\sec x \\
&=2\tan x.
\end{aligned}
$$

The differential equation is satisfied.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Variation integrals based at the initial point produce a particular solution
with:

$$
y_p(x_0)=0,
\qquad
y_p'(x_0)=0.
$$

This often makes the constant equations look homogeneous, but the final
solution must still include the nonzero forced response $y_p(x)$.

</details>

---

## Block 6: Higher-Order Initial-Value Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to extend the same workflow to an $n$th-order equation: calculate
the complete $n$-constant family, differentiate through order $n-1$, and use
the $n$ initial conditions to determine all constants.

</details>

<details open>
<summary><strong>The General Higher-Order Pattern</strong></summary>

An $n$th-order linear IVP has a differential equation of the form:

$$
a_n(x)y^{(n)}+a_{n-1}(x)y^{(n-1)}+\cdots+a_0(x)y=g(x)
$$

and initial data:

$$
\begin{aligned}
y(x_0)&=Y_0, \\
y'(x_0)&=Y_1, \\
&\ \vdots \\
y^{(n-1)}(x_0)&=Y_{n-1}.
\end{aligned}
$$

The complete general solution contains $n$ arbitrary constants. Each condition
produces one equation for those constants.

The resulting coefficient matrix is the $n$-function Wronskian matrix evaluated
at $x_0$. A fundamental homogeneous set makes that determinant nonzero, so the
constant system has a unique solution.

</details>

<details open>
<summary><strong>A Third-Order Initial-Value Problem</strong></summary>

Solve:

$$
y'''=6x,
$$

subject to:

$$
y(1)=\frac94,
\qquad
y'(1)=5,
\qquad
y''(1)=9.
$$

### Step 1: Find the complete general solution

Integrate the differential equation once:

$$
y''=3x^2+C_1.
$$

Integrate again:

$$
y'=x^3+C_1x+C_2.
$$

Integrate a third time:

$$
y=\frac{x^4}{4}+\frac{C_1}{2}x^2+C_2x+C_3.
$$

Rename the arbitrary constants so the complete solution is written more
simply:

$$
\boxed{
y=c_1+c_2x+c_3x^2+\frac{x^4}{4}
}.
$$

### Step 2: Calculate the required derivatives

Differentiate the renamed formula:

$$
y'=c_2+2c_3x+x^3.
$$

Differentiate again:

$$
y''=2c_3+3x^2.
$$

### Step 3: Apply $y''(1)=9$ first

The highest-derivative condition contains only $c_3$, so it is the shortest
equation to use first.

Substitute $x=1$ into $y''=2c_3+3x^2$:

$$
9=2c_3+3.
$$

Subtract $3$:

$$
6=2c_3.
$$

Divide by $2$:

$$
c_3=3.
$$

### Step 4: Apply $y'(1)=5$

Return to:

$$
y'=c_2+2c_3x+x^3.
$$

Substitute $x=1$, $y'(1)=5$, and $c_3=3$:

$$
5=c_2+2(3)(1)+(1)^3.
$$

Simplify the numerical terms:

$$
5=c_2+6+1.
$$

Therefore:

$$
5=c_2+7.
$$

Subtract $7$:

$$
c_2=-2.
$$

### Step 5: Apply $y(1)=9/4$

Return to the complete solution:

$$
y=c_1+c_2x+c_3x^2+\frac{x^4}{4}.
$$

Substitute $x=1$, $c_2=-2$, and $c_3=3$:

$$
\frac94=c_1-2(1)+3(1)^2+\frac{(1)^4}{4}.
$$

Simplify:

$$
\frac94=c_1-2+3+\frac14.
$$

Combine the numerical terms on the right:

$$
\frac94=c_1+\frac54.
$$

Subtract $5/4$:

$$
c_1=1.
$$

### Step 6: Write and verify the selected solution

Substitute all three constants:

$$
\boxed{
y=1-2x+3x^2+\frac{x^4}{4}
}.
$$

Differentiate:

$$
y'=-2+6x+x^3,
\qquad
y''=6+3x^2,
\qquad
y'''=6x.
$$

At $x=1$:

$$
\begin{aligned}
y(1)&=1-2+3+\frac14=\frac94, \\
y'(1)&=-2+6+1=5, \\
y''(1)&=6+3=9.
\end{aligned}
$$

The equation and all three initial conditions are satisfied.

</details>

<details open>
<summary><strong>Using The Easiest Condition First</strong></summary>

Initial conditions may be processed in any order. In the third-order example,
$y''(1)=9$ isolated $c_3$ immediately, then $y'(1)=5$ isolated $c_2$, and the
remaining condition found $c_1$.

This triangular structure is common when a differential equation has been
solved by repeated integration. For exponential or trigonometric bases, the
constants may remain coupled and must be solved simultaneously instead.

Choosing an efficient order is helpful, but every condition must still be
applied to the correct derivative of the complete solution.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An $n$th-order IVP normally needs $n$ initial conditions through derivative
order $n-1$. Write all required derivatives before substitution and solve the
resulting $n$ equations for the $n$ constants.

When the system is triangular, use the condition that isolates a constant
first. When it is coupled, solve all constant equations together.

</details>

---

## Block 7: Verification, Boundaries, And Common Mistakes

<details open>
<summary><strong>The Complete IVP Workflow</strong></summary>

### Step 1: Identify the order and the data

Count the arbitrary constants expected and confirm that the problem supplies
the corresponding number of initial conditions.

### Step 2: Choose a valid interval

Normalize the equation if needed and identify singular points. The initial
point must lie inside the working interval.

### Step 3: Find the complete general solution

For a nonhomogeneous problem, include both parts:

$$
y=y_h+y_p.
$$

### Step 4: Differentiate the complete formula

Calculate every derivative appearing in the data. Carry all particular terms
through the differentiation.

### Step 5: Apply one condition at a time

Restate the relevant formula, substitute the actual initial point, and write
the resulting constant equation.

### Step 6: Solve the full constant system

Use substitution, elimination, or matrix methods. Do not assign a constant
from one equation while ignoring its coupling to the others.

### Step 7: Write the selected solution

Replace every arbitrary constant. The final answer should contain no undetermined
$c_i$.

### Step 8: Perform two kinds of verification

Check:

1. the differential equation on the interval
2. every initial condition at $x_0$

</details>

<details open>
<summary><strong>Initial Conditions Versus Boundary Conditions</strong></summary>

Initial conditions are imposed at one point:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1.
$$

Boundary conditions may be imposed at different points, for example:

$$
y(a)=A,
\qquad
y(b)=B.
$$

The linear IVP uniqueness theorem does not automatically give the same result
for a boundary-value problem. Depending on the equation and boundary data, a
boundary-value problem may have:

- exactly one solution
- no solution
- more than one solution

The algebra may still produce a constant system, but its determinant must be
examined separately.

</details>

<details open>
<summary><strong>Common Mistake: Applying Data To $y_h$ Alone</strong></summary>

For a forced problem:

$$
y=y_h+y_p.
$$

The conditions apply to $y$, not merely to the portion containing arbitrary
constants. Write $y_h+y_p$ locally before substituting the initial point.

</details>

<details open>
<summary><strong>Common Mistake: Forgetting A Particular Derivative</strong></summary>

If:

$$
y=c_1y_1+c_2y_2+y_p,
$$

then:

$$
y'=c_1y_1'+c_2y_2'+y_p'.
$$

The term $y_p'$ can be zero, constant, or a nontrivial function. Calculate it;
do not assume it vanishes.

</details>

<details open>
<summary><strong>Common Mistake: Treating Every Initial Point As Zero</strong></summary>

At $x_0=0$:

$$
e^{rx_0}=1.
$$

At a nonzero initial point:

$$
e^{rx_0}
$$

must be evaluated at its actual exponent. The same applies to sine, cosine,
polynomial terms, logarithms, and particular solutions.

</details>

<details open>
<summary><strong>Common Mistake: Solving Conditions In Isolation</strong></summary>

The equations produced by two initial conditions normally share both
$c_1$ and $c_2$. They form one simultaneous system.

For example:

$$
\begin{aligned}
c_1+c_2&=5, \\
2c_1-c_2&=1
\end{aligned}
$$

does not allow either constant to be read from one equation alone. Eliminate or
substitute using both equations.

</details>

<details open>
<summary><strong>Common Mistake: Verifying Only The Data</strong></summary>

A function can pass through the required initial values without satisfying the
differential equation. Conversely, a member of the general solution family can
satisfy the equation but fail the selected data.

A valid IVP solution must pass both tests:

$$
\text{differential equation}
\quad\text{and}\quad
\text{all initial conditions}.
$$

</details>

<details open>
<summary><strong>Common Mistake: Assuming Zero Data Always Give Zero</strong></summary>

Zero data select the zero solution for a homogeneous linear equation. For a
forced equation, first test whether $y=0$ satisfies the equation. If the forcing
is nonzero, it does not.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The safest order is:

1. solve the equation
2. write the complete family
3. differentiate completely
4. evaluate at the actual initial point
5. solve all constant equations together
6. verify the equation and the data separately

Initial-value and boundary-value problems may look similar, but their
uniqueness behavior is not interchangeable.

</details>

---

## Block 8: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Count The Required Initial Data

For a fourth-order linear differential equation:

1. how many arbitrary constants should the general solution contain?
2. what standard initial values would be prescribed at $x=x_0$?

### Problem 2: Form And Solve The Constant System

The complete general solution of an equation is:

$$
y=c_1e^x+c_2e^{-x}+x^2.
$$

Find $c_1,c_2$ if:

$$
y(0)=3,
\qquad
y'(0)=0.
$$

### Problem 3: Use A Nonzero Initial Point

The complete general solution is:

$$
y=c_1\cos x+c_2\sin x+2.
$$

Find $c_1,c_2$ if:

$$
y\left(\frac{\pi}{2}\right)=5,
\qquad
y'\left(\frac{\pi}{2}\right)=-2.
$$

### Problem 4: Diagnose Zero Initial Data

Explain why zero initial data do not imply $y=0$ for:

$$
y''-2y'+y=e^x,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

### Problem 5: Solve A Homogeneous IVP

Solve:

$$
y''+2y'-3y=0,
$$

subject to:

$$
y(0)=2,
\qquad
y'(0)=-2.
$$

### Problem 6: Solve A Repeated-Root IVP

Solve:

$$
y''-4y'+4y=0,
$$

subject to:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

### Problem 7: Include A Polynomial Particular Solution

Solve:

$$
y''+4y=8x,
$$

subject to:

$$
y(0)=2,
\qquad
y'(0)=1.
$$

### Problem 8: Include An Exponential Particular Solution

Solve:

$$
y''-3y'+2y=6e^{-x},
$$

subject to:

$$
y(0)=0,
\qquad
y'(0)=1.
$$

### Problem 9: Apply Trigonometric Data Away From Zero

Solve:

$$
y''+9y=0,
$$

subject to:

$$
y\left(\frac{\pi}{6}\right)=2,
\qquad
y'\left(\frac{\pi}{6}\right)=3.
$$

### Problem 10: Use An Anchored Particular Solution

For the equation:

$$
y''+y=3\tan x,
\qquad -\frac{\pi}{2}<x<\frac{\pi}{2},
$$

variation of parameters with lower limit $0$ produces:

$$
y_p=3\sin x-3\cos x\ln(\sec x+\tan x).
$$

Use this particular solution to solve the IVP:

$$
y(0)=-2,
\qquad
y'(0)=4.
$$

### Problem 11: Solve A Third-Order IVP

Solve:

$$
y'''=12x,
$$

subject to:

$$
y(0)=1,
\qquad
y'(0)=-1,
\qquad
y''(0)=2.
$$

### Problem 12: Test Candidate Solutions Completely

For the IVP:

$$
y''-y=0,
\qquad
y(0)=2,
\qquad
y'(0)=0,
$$

determine which candidates are valid. For each rejected candidate, state
whether it fails the differential equation or an initial condition.

**(a)**

$$
y=2\cosh x
$$

**(b)**

$$
y=2e^x
$$

**(c)**

$$
y=2
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

A fourth-order linear equation has a general solution containing four arbitrary
constants.

The standard initial data at $x=x_0$ are:

$$
\boxed{
y(x_0)=Y_0,
\quad
y'(x_0)=Y_1,
\quad
y''(x_0)=Y_2,
\quad
y'''(x_0)=Y_3
}.
$$

The highest prescribed derivative is third order, one order below the
differential equation.

### Answer 2

The complete solution is:

$$
y=c_1e^x+c_2e^{-x}+x^2.
$$

Differentiate every term:

$$
y'=c_1e^x-c_2e^{-x}+2x.
$$

Apply $y(0)=3$:

$$
\begin{aligned}
3
&=c_1e^0+c_2e^0+(0)^2 \\
&=c_1+c_2.
\end{aligned}
$$

Thus:

$$
c_1+c_2=3.
$$

Apply $y'(0)=0$:

$$
\begin{aligned}
0
&=c_1e^0-c_2e^0+2(0) \\
&=c_1-c_2.
\end{aligned}
$$

Thus:

$$
c_1-c_2=0.
$$

The second equation gives:

$$
c_1=c_2.
$$

Substitute $c_2=c_1$ into $c_1+c_2=3$:

$$
2c_1=3.
$$

Divide by $2$:

$$
c_1=\frac32.
$$

Therefore:

$$
c_2=\frac32.
$$

The selected solution is:

$$
\boxed{
y=\frac32e^x+\frac32e^{-x}+x^2
}.
$$

### Answer 3

The complete solution is:

$$
y=c_1\cos x+c_2\sin x+2.
$$

Differentiate:

$$
y'=-c_1\sin x+c_2\cos x.
$$

At $x=\pi/2$:

$$
\cos\left(\frac{\pi}{2}\right)=0,
\qquad
\sin\left(\frac{\pi}{2}\right)=1.
$$

Apply $y(\pi/2)=5$:

$$
5=c_1(0)+c_2(1)+2.
$$

Subtract $2$:

$$
c_2=3.
$$

Apply $y'(\pi/2)=-2$:

$$
-2=-c_1(1)+c_2(0).
$$

Therefore:

$$
c_1=2.
$$

The selected solution is:

$$
\boxed{y=2\cos x+3\sin x+2}.
$$

### Answer 4

The IVP is:

$$
y''-2y'+y=e^x,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

Test the zero function in the differential equation. For $y=0$:

$$
y'=0,
\qquad
y''=0.
$$

Therefore the left side is:

$$
y''-2y'+y=0-0+0=0.
$$

The required right side is:

$$
e^x,
$$

which is not identically zero. Hence $y=0$ does not satisfy the differential
equation, even though it satisfies the two initial conditions.

The nonzero forcing creates a nonzero response after the initial point. Zero
initial data imply a zero solution only for a homogeneous linear equation.

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Solve:

$$
y''+2y'-3y=0,
$$

with:

$$
y(0)=2,
\qquad
y'(0)=-2.
$$

The characteristic equation is:

$$
r^2+2r-3=0.
$$

Factor:

$$
(r-1)(r+3)=0.
$$

The roots are $1,-3$, so:

$$
y=c_1e^x+c_2e^{-3x}.
$$

Differentiate:

$$
y'=c_1e^x-3c_2e^{-3x}.
$$

Apply $y(0)=2$:

$$
c_1+c_2=2.
$$

Apply $y'(0)=-2$:

$$
c_1-3c_2=-2.
$$

Subtract the first equation from the second:

$$
-4c_2=-4.
$$

Divide by $-4$:

$$
c_2=1.
$$

Substitute into $c_1+c_2=2$:

$$
c_1+1=2.
$$

Thus:

$$
c_1=1.
$$

Therefore:

$$
\boxed{y=e^x+e^{-3x}}.
$$

### Answer 6

Solve:

$$
y''-4y'+4y=0,
$$

with:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

The characteristic equation is:

$$
r^2-4r+4=0.
$$

Factor:

$$
(r-2)^2=0.
$$

The repeated root is $r=2$, so:

$$
y=(c_1+c_2x)e^{2x}.
$$

Differentiate with the product rule:

$$
\begin{aligned}
y'
&=c_2e^{2x}+2(c_1+c_2x)e^{2x} \\
&=(c_2+2c_1+2c_2x)e^{2x}.
\end{aligned}
$$

Apply $y(0)=1$:

$$
1=(c_1+c_2(0))e^0=c_1.
$$

Thus:

$$
c_1=1.
$$

Apply $y'(0)=0$:

$$
0=(c_2+2c_1+2c_2(0))e^0.
$$

Substitute $c_1=1$:

$$
0=c_2+2.
$$

Therefore:

$$
c_2=-2.
$$

The selected solution is:

$$
\boxed{y=(1-2x)e^{2x}}.
$$

### Answer 7

Solve:

$$
y''+4y=8x,
$$

with:

$$
y(0)=2,
\qquad
y'(0)=1.
$$

The homogeneous solution is:

$$
y_h=c_1\cos(2x)+c_2\sin(2x).
$$

For the polynomial forcing, try:

$$
y_p=Ax+B.
$$

Then:

$$
y_p''=0.
$$

Substitute into $y_p''+4y_p=8x$:

$$
4(Ax+B)=8x.
$$

Match coefficients:

$$
A=2,
\qquad
B=0.
$$

Thus:

$$
y_p=2x.
$$

The complete solution is:

$$
y=c_1\cos(2x)+c_2\sin(2x)+2x.
$$

Differentiate:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+2.
$$

Apply $y(0)=2$:

$$
2=c_1.
$$

Apply $y'(0)=1$:

$$
1=2c_2+2.
$$

Subtract $2$:

$$
-1=2c_2.
$$

Divide by $2$:

$$
c_2=-\frac12.
$$

Therefore:

$$
\boxed{y=2\cos(2x)-\frac12\sin(2x)+2x}.
$$

### Answer 8

Solve:

$$
y''-3y'+2y=6e^{-x},
$$

with:

$$
y(0)=0,
\qquad
y'(0)=1.
$$

The associated characteristic equation is:

$$
r^2-3r+2=0.
$$

Factor:

$$
(r-1)(r-2)=0.
$$

Therefore:

$$
y_h=c_1e^x+c_2e^{2x}.
$$

For the forcing $6e^{-x}$, try:

$$
y_p=Ae^{-x}.
$$

Differentiate:

$$
y_p'=-Ae^{-x},
\qquad
y_p''=Ae^{-x}.
$$

Substitute into the left side:

$$
\begin{aligned}
y_p''-3y_p'+2y_p
&=Ae^{-x}-3(-Ae^{-x})+2Ae^{-x} \\
&=6Ae^{-x}.
\end{aligned}
$$

Match with $6e^{-x}$:

$$
6A=6.
$$

Thus:

$$
A=1,
\qquad
y_p=e^{-x}.
$$

The complete solution is:

$$
y=c_1e^x+c_2e^{2x}+e^{-x}.
$$

Differentiate:

$$
y'=c_1e^x+2c_2e^{2x}-e^{-x}.
$$

Apply $y(0)=0$:

$$
0=c_1+c_2+1.
$$

Subtract $1$:

$$
c_1+c_2=-1.
$$

Apply $y'(0)=1$:

$$
1=c_1+2c_2-1.
$$

Add $1$:

$$
c_1+2c_2=2.
$$

Subtract the first constant equation from the second:

$$
c_2=3.
$$

Substitute into $c_1+c_2=-1$:

$$
c_1+3=-1.
$$

Therefore:

$$
c_1=-4.
$$

The selected solution is:

$$
\boxed{y=-4e^x+3e^{2x}+e^{-x}}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Solve:

$$
y''+9y=0,
$$

with:

$$
y\left(\frac{\pi}{6}\right)=2,
\qquad
y'\left(\frac{\pi}{6}\right)=3.
$$

The characteristic roots are $\pm3i$, so:

$$
y=c_1\cos(3x)+c_2\sin(3x).
$$

Differentiate:

$$
y'=-3c_1\sin(3x)+3c_2\cos(3x).
$$

At $x=\pi/6$:

$$
3x=\frac{\pi}{2}.
$$

Therefore:

$$
\cos(3x)=0,
\qquad
\sin(3x)=1.
$$

Apply the first condition:

$$
2=c_1(0)+c_2(1).
$$

Thus:

$$
c_2=2.
$$

Apply the derivative condition:

$$
3=-3c_1(1)+3c_2(0).
$$

Divide by $-3$:

$$
c_1=-1.
$$

Hence:

$$
\boxed{y=-\cos(3x)+2\sin(3x)}.
$$

### Answer 10

The equation and anchored particular solution are:

$$
y''+y=3\tan x
$$

and:

$$
y_p=3\sin x-3\cos x\ln(\sec x+\tan x).
$$

The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

Thus the complete solution is:

$$
y=c_1\cos x+c_2\sin x+y_p.
$$

Because the variation integrals were based at $0$:

$$
y_p(0)=0,
\qquad
y_p'(0)=0.
$$

Apply $y(0)=-2$:

$$
\begin{aligned}
-2
&=c_1\cos(0)+c_2\sin(0)+y_p(0) \\
&=c_1.
\end{aligned}
$$

Therefore:

$$
c_1=-2.
$$

Differentiate the complete solution structurally:

$$
y'=-c_1\sin x+c_2\cos x+y_p'.
$$

Apply $y'(0)=4$:

$$
\begin{aligned}
4
&=-c_1\sin(0)+c_2\cos(0)+y_p'(0) \\
&=c_2.
\end{aligned}
$$

Thus:

$$
c_2=4.
$$

Substitute the constants and $y_p$:

$$
\boxed{
y=-2\cos x+4\sin x
+3\sin x-3\cos x\ln(\sec x+\tan x)
}.
$$

Combine the two sine terms:

$$
\boxed{
y=-2\cos x+7\sin x
-3\cos x\ln(\sec x+\tan x)
}.
$$

### Answer 11

Solve:

$$
y'''=12x,
$$

with:

$$
y(0)=1,
\qquad
y'(0)=-1,
\qquad
y''(0)=2.
$$

Integrate the differential equation once:

$$
y''=6x^2+C_1.
$$

Integrate again:

$$
y'=2x^3+C_1x+C_2.
$$

Integrate a third time:

$$
y=\frac{x^4}{2}+\frac{C_1x^2}{2}+C_2x+C_3.
$$

Rename the constants:

$$
y=c_1+c_2x+c_3x^2+\frac{x^4}{2}.
$$

Then:

$$
y'=c_2+2c_3x+2x^3
$$

and:

$$
y''=2c_3+6x^2.
$$

Apply $y(0)=1$:

$$
c_1=1.
$$

Apply $y'(0)=-1$:

$$
c_2=-1.
$$

Apply $y''(0)=2$:

$$
2c_3=2.
$$

Divide by $2$:

$$
c_3=1.
$$

Therefore:

$$
\boxed{
y=1-x+x^2+\frac{x^4}{2}
}.
$$

### Answer 12

The IVP is:

$$
y''-y=0,
\qquad
y(0)=2,
\qquad
y'(0)=0.
$$

#### Candidate (a): $y=2\cosh x$

Differentiate:

$$
y'=2\sinh x,
\qquad
y''=2\cosh x.
$$

Check the differential equation:

$$
y''-y=2\cosh x-2\cosh x=0.
$$

Check the data:

$$
y(0)=2\cosh(0)=2,
$$

and:

$$
y'(0)=2\sinh(0)=0.
$$

Candidate (a) is valid.

#### Candidate (b): $y=2e^x$

Since $y''=2e^x$, the differential equation is satisfied:

$$
y''-y=0.
$$

Also:

$$
y(0)=2.
$$

However:

$$
y'=2e^x,
$$

so:

$$
y'(0)=2\ne 0.
$$

Candidate (b) is rejected because it fails the derivative condition.

#### Candidate (c): $y=2$

The initial values are:

$$
y(0)=2,
\qquad
y'(0)=0.
$$

However:

$$
y''=0.
$$

Therefore:

$$
y''-y=0-2=-2\ne 0.
$$

Candidate (c) is rejected because it fails the differential equation.

</details>

<details open>
<summary><strong>Chapter 13 Final Summary</strong></summary>

For a second-order nonhomogeneous equation, begin with the complete solution:

$$
\boxed{y=c_1y_1+c_2y_2+y_p}.
$$

Differentiate the complete formula:

$$
\boxed{y'=c_1y_1'+c_2y_2'+y_p'}.
$$

At the initial point $x_0$, the data produce:

$$
\begin{aligned}
c_1y_1(x_0)+c_2y_2(x_0)
&=Y_0-y_p(x_0), \\
c_1y_1'(x_0)+c_2y_2'(x_0)
&=Y_1-y_p'(x_0).
\end{aligned}
$$

The coefficient determinant is the Wronskian $W(x_0)$. A fundamental pair has
$W(x_0)\ne 0$, so the constants are uniquely determined.

For an $n$th-order equation, use $n$ initial conditions through derivative
order $n-1$. After selecting the constants, verify two separate requirements:

$$
\boxed{
\text{the differential equation}
\quad\text{and}\quad
\text{every initial condition}
}.
$$

The chapter's final lesson is:

> initial data select from the complete solution family, not from the
> homogeneous part alone; differentiate every term, evaluate at the actual
> initial point, solve the full constant system, and verify both the equation
> and the data.

</details>
