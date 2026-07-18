```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 13}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Linear Initial-Value Problems}
```
# Chapter 13 - Initial-Value Problems

Chapters 9 through 12 developed methods for finding general solutions of
linear differential equations. A general solution contains arbitrary constants
because the differential equation alone describes an entire family of
functions.

An **initial-value problem**, or **IVP**, adds enough information at one point
to select one member of that family.

This chapter focuses on the stage that is often compressed into the phrase
"apply the initial conditions." That phrase hides several decisions:

-   which solution must receive the conditions?
-   how many derivatives must be calculated?
-   how are the resulting constant equations formed?
-   why must those equations usually be solved simultaneously?
-   what changes when the initial point is not zero?
-   why do zero initial data imply a zero solution in one problem but not in
    another?
-   how can the Wronskian explain the uniqueness of the selected constants?
-   how are higher-order initial-value problems handled?

```{=latex}
\Needspace{12\baselineskip}
```
The guiding rule is:

```{=latex}
\Needspace{8\baselineskip}
```
> solve the differential equation first, write the complete general solution,
> and only then use all initial conditions to determine its arbitrary
> constants.

All examples, equations, and exercises in this chapter are independently
constructed. The reference text is used only to identify the mathematical
topics.

```{=latex}
\Needspace{20\baselineskip}
```
## What An Initial-Value Problem Adds {#block-1-what-an-initial-value-problem-adds}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to separate the two parts of an initial-value problem:

1.  the differential equation determines a family of possible solutions
2.  the initial conditions select one member of that family

Neither part should be silently substituted into the other before the general
solution has been found.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation, Conditions, And Selected Solution {#equation-conditions-and-selected-solution-2}

```{=latex}
\Needspace{10\baselineskip}
```
A second-order initial-value problem has the form:

$$
a(x)y''+b(x)y'+c(x)y=g(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
with two conditions at the same point $x_0$:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1.
$$

Here:

-   $x_0$ is the initial point
-   $Y_0$ is the prescribed value of the function
-   $Y_1$ is the prescribed value of its first derivative

The differential equation is satisfied throughout an interval. The two
initial conditions are satisfied at the single point $x_0$.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning is:

```{=latex}
\Needspace{8\baselineskip}
```
> the equation controls how a solution evolves, while the initial data specify
> where that evolution begins and in which direction it initially moves.

```{=latex}
\Needspace{12\baselineskip}
```
### Why A Second-Order Problem Needs Two Conditions {#why-a-second-order-problem-needs-two-conditions-3}

```{=latex}
\Needspace{10\baselineskip}
```
A second-order general solution normally contains two arbitrary constants:

$$
y(x)=c_1y_1(x)+c_2y_2(x)+y_p(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
To determine both $c_1$ and $c_2$, two independent scalar equations are
needed. The conditions:

$$
y(x_0)=Y_0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'(x_0)=Y_1
$$

provide those two equations.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Four-Stage Workflow {#the-four-stage-workflow-4}

#### Stage 1: Solve the differential equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the complete general solution. For a nonhomogeneous linear equation, this
means:

$$
y=y_h+y_p.
$$

#### Stage 2: Calculate the required derivatives

If the problem supplies $y'(x_0)$, differentiate the complete solution once.
For higher-order problems, continue only as far as the highest prescribed
derivative.

#### Stage 3: Apply one condition at a time

Substitute $x=x_0$ into the appropriate formula and record the resulting
equation for the constants.

#### Stage 4: Solve the constant system and verify

Solve all constant equations together. Substitute the constants back into the
complete solution, then check both the differential equation and every initial
condition.

```{=latex}
\Needspace{12\baselineskip}
```
### A First Homogeneous Example {#a-first-homogeneous-example-5}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-y'-6y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=5,
\qquad
y'(0)=0.
$$

#### Step 1: Find the general solution

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-r-6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-3)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $r=3,-2$, so the general solution is:

$$
y=c_1e^{3x}+c_2e^{-2x}.
$$

Because the differential equation is homogeneous, this homogeneous family is
already the complete general solution.

#### Step 2: Differentiate the complete solution

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate each exponential term:

$$
y'=3c_1e^{3x}-2c_2e^{-2x}.
$$

#### Step 3: Apply $y(0)=5$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the general solution:

$$
y=c_1e^{3x}+c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ and $y(0)=5$:

$$
5=c_1e^0+c_2e^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^0=1$:

$$
c_1+c_2=5.
$$

#### Step 4: Apply $y'(0)=0$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the derivative:

$$
y'=3c_1e^{3x}-2c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ and $y'(0)=0$:

$$
0=3c_1e^0-2c_2e^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
3c_1-2c_2=0.
$$

#### Step 5: Solve the two equations together

```{=latex}
\Needspace{10\baselineskip}
```
The constant system is:

$$
\begin{aligned}
c_1+c_2&=5, \\
3c_1-2c_2&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the first equation by $2$:

$$
2c_1+2c_2=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add this equation to $3c_1-2c_2=0$. The $c_2$ terms cancel:

$$
5c_1=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5$:

$$
c_1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=2$ into $c_1+c_2=5$:

$$
2+c_2=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2$ from both sides:

$$
c_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both constants into the general solution:

$$
\boxed{
y=2e^{3x}+3e^{-2x}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Check the initial data

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$:

$$
y(0)=2+3=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivative is:

$$
y'=6e^{3x}-6e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y'(0)=6-6=0.
$$

Both conditions are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

An IVP is not a new solution method for the differential equation. It is a
selection problem performed after the general solution is known.

For a second-order problem:

1.  find the complete two-constant solution
2.  differentiate it once
3.  form one constant equation from each initial condition
4.  solve the two equations simultaneously
5.  verify both conditions

```{=latex}
\Needspace{20\baselineskip}
```
## Apply Conditions To The Complete Solution {#block-2-apply-conditions-to-the-complete-solution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to prevent the central error in nonhomogeneous IVPs: applying the
initial conditions only to $y_h$ while omitting the contribution from $y_p$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Complete Solution Is $y_h+y_p$ {#the-complete-solution-is-yhyp-8}

```{=latex}
\Needspace{10\baselineskip}
```
For a nonhomogeneous equation:

$$
L[y]=g(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the general solution is:

$$
\boxed{y=y_h+y_p}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Although the arbitrary constants appear in $y_h$, the initial conditions are
conditions on the actual solution $y$. Therefore:

$$
y(x_0)=y_h(x_0)+y_p(x_0)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'(x_0)=y_h'(x_0)+y_p'(x_0).
$$

The particular solution can change the right sides of the equations used to
determine the homogeneous constants.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Forced Example {#a-complete-forced-example-9}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+3y'+2y=6x+7,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=2,
\qquad
y'(0)=-1.
$$

#### Step 1: Find the homogeneous solution

```{=latex}
\Needspace{10\baselineskip}
```
The associated homogeneous characteristic equation is:

$$
r^2+3r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r+1)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $-1,-2$, so:

$$
y_h=c_1e^{-x}+c_2e^{-2x}.
$$

#### Step 2: Find one particular solution

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $6x+7$ is linear, so use the complete linear trial:

$$
y_p=Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y_p'=A,
\qquad
y_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these expressions into the left side:

$$
\begin{aligned}
y_p''+3y_p'+2y_p
&=0+3A+2(Ax+B) \\
&=2Ax+(3A+2B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with the required forcing:

$$
2Ax+(3A+2B)=6x+7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Matching the coefficients of $x$ gives:

$$
2A=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
A=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Matching the constant terms gives:

$$
3A+2B=7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=3$:

$$
9+2B=7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $9$ from both sides:

$$
2B=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
B=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_p=3x-1.
$$

#### Step 3: Write the complete general solution

```{=latex}
\Needspace{10\baselineskip}
```
Use $y=y_h+y_p$:

$$
\boxed{
y=c_1e^{-x}+c_2e^{-2x}+3x-1
}.
$$

This complete formula, not $y_h$ by itself, receives the initial conditions.

#### Step 4: Differentiate the complete solution

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate every term:

$$
y'=-c_1e^{-x}-2c_2e^{-2x}+3.
$$

The constant $3$ comes from differentiating the particular term $3x-1$. It
must remain in the derivative condition.

#### Step 5: Apply $y(0)=2$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the complete solution:

$$
y=c_1e^{-x}+c_2e^{-2x}+3x-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ and $y(0)=2$:

$$
2=c_1e^0+c_2e^0+3(0)-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
2=c_1+c_2-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $1$ to both sides:

$$
c_1+c_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply $y'(0)=-1$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y'=-c_1e^{-x}-2c_2e^{-2x}+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ and $y'(0)=-1$:

$$
-1=-c_1e^0-2c_2e^0+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-1=-c_1-2c_2+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $3$ from both sides:

$$
-4=-c_1-2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply both sides by $-1$:

$$
c_1+2c_2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Solve the constant system

```{=latex}
\Needspace{10\baselineskip}
```
The two equations are:

$$
\begin{aligned}
c_1+c_2&=3, \\
c_1+2c_2&=4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the first equation from the second:

$$
c_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_2=1$ into $c_1+c_2=3$:

$$
c_1+1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
c_1=2.
$$

#### Step 8: Write and verify the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=2,c_2=1$ into the complete solution:

$$
\boxed{
y=2e^{-x}+e^{-2x}+3x-1
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$:

$$
y(0)=2+1+0-1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivative is:

$$
y'=-2e^{-x}-2e^{-2x}+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y'(0)=-2-2+3=-1.
$$

Both data are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### What Goes Wrong If $y_p$ Is Omitted? {#what-goes-wrong-if-yp-is-omitted-10}

```{=latex}
\Needspace{10\baselineskip}
```
In the previous problem:

$$
y_h=c_1e^{-x}+c_2e^{-2x},
\qquad
y_p=3x-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Applying $y(0)=2$ incorrectly to $y_h$ alone would give:

$$
c_1+c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The correct complete solution gives:

$$
c_1+c_2-1=2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
c_1+c_2=3.
$$

The two constant equations differ because $y_p(0)=-1$.

```{=latex}
\Needspace{10\baselineskip}
```
Similarly, applying $y'(0)=-1$ only to $y_h'$ would omit:

$$
y_p'(0)=3.
$$

This changes the second constant equation as well. The constants live in
$y_h$, but the conditions belong to $y_h+y_p$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-11}

```{=latex}
\Needspace{10\baselineskip}
```
For a nonhomogeneous problem, always write locally:

$$
y=y_h+y_p
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'=y_h'+y_p'.
$$

Then apply the data. Omitting $y_p$ or one of its derivatives changes the
constant system and usually produces a function that fails the initial
conditions.

```{=latex}
\Needspace{20\baselineskip}
```
## The Constant System And The Wronskian {#block-3-the-constant-system-and-the-wronskian}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-12}

The goal is to see the initial conditions as a linear system for the arbitrary
constants and to understand why the Wronskian guarantees that the system can be
solved.

```{=latex}
\Needspace{12\baselineskip}
```
### Build The General Two-Constant System {#build-the-general-two-constant-system-13}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the complete solution is:

$$
y=c_1y_1+c_2y_2+y_p.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=c_1y_1'+c_2y_2'+y_p'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply:

$$
y(x_0)=Y_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitution gives:

$$
c_1y_1(x_0)+c_2y_2(x_0)+y_p(x_0)=Y_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $y_p(x_0)$ from both sides:

$$
c_1y_1(x_0)+c_2y_2(x_0)=Y_0-y_p(x_0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply:

$$
y'(x_0)=Y_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitution gives:

$$
c_1y_1'(x_0)+c_2y_2'(x_0)+y_p'(x_0)=Y_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $y_p'(x_0)$:

$$
c_1y_1'(x_0)+c_2y_2'(x_0)=Y_1-y_p'(x_0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Wronskian Appears Again {#why-the-wronskian-appears-again-14}

```{=latex}
\Needspace{10\baselineskip}
```
The determinant of the constant-system matrix is:

$$
\begin{aligned}
&y_1(x_0)y_2'(x_0)-y_1'(x_0)y_2(x_0) \\
&=W(y_1,y_2)(x_0).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $y_1,y_2$ form a fundamental pair, then their Wronskian is nonzero on the
working interval. In particular:

$$
W(x_0)\ne 0.
$$

Therefore the two-by-two constant system has exactly one solution
$(c_1,c_2)$.

This is the algebraic reason a valid pair of initial conditions selects one
member of the general solution family.

```{=latex}
\Needspace{12\baselineskip}
```
### An Initial Point Away From Zero {#an-initial-point-away-from-zero-15}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=4x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y\left(\frac{\pi}{4}\right)=1+\frac{\pi}{4},
\qquad
y'\left(\frac{\pi}{4}\right)=-3.
$$

#### Step 1: Find the complete general solution

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous equation is:

$$
y''+4y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its fundamental pair is:

$$
\cos(2x),
\qquad
\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the forcing $4x$, try:

$$
y_p=Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y_p''+4y_p=4x$:

$$
4(Ax+B)=4x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients:

$$
4A=4,
\qquad
4B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A=1,
\qquad
B=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y_p=x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete general solution is:

$$
y=c_1\cos(2x)+c_2\sin(2x)+x.
$$

#### Step 2: Differentiate before substituting the initial point

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate every term:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+1.
$$

#### Step 3: Apply the position condition at $x=\pi/4$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=\pi/4$:

$$
2x=\frac{\pi}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\cos\left(\frac{\pi}{2}\right)=0,
\qquad
\sin\left(\frac{\pi}{2}\right)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the complete solution:

$$
1+\frac{\pi}{4}
=c_1(0)+c_2(1)+\frac{\pi}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $\pi/4$ from both sides:

$$
c_2=1.
$$

#### Step 4: Apply the derivative condition at $x=\pi/4$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=\pi/4$:

$$
-3=-2c_1(1)+2c_2(0)+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-3=-2c_1+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
-4=-2c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-2$:

$$
c_1=2.
$$

#### Step 5: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=2,c_2=1$:

$$
\boxed{
y=2\cos(2x)+\sin(2x)+x
}.
$$

The exponentials or trigonometric values are not automatically $1$ unless the
initial point makes them so. This example required the actual values at
$x=\pi/4$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-16}

Initial conditions create a linear system for the arbitrary constants. For a
second-order IVP, its coefficient determinant is the Wronskian evaluated at the
initial point.

Because a fundamental pair has $W(x_0)\ne 0$, the constant system has one
solution. At a nonzero initial point, evaluate every exponential,
trigonometric function, polynomial, and derivative at the actual value of
$x_0$.

```{=latex}
\Needspace{20\baselineskip}
```
## Existence, Uniqueness, And Zero Initial Data {#block-4-existence-uniqueness-and-zero-initial-data}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-17}

The goal is to connect the constant calculations to the existence-and-
uniqueness theorem and to distinguish zero data for homogeneous and
nonhomogeneous equations.

```{=latex}
\Needspace{12\baselineskip}
```
### The Linear Existence-And-Uniqueness Statement {#the-linear-existence-and-uniqueness-statement-18}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the normalized equation:

$$
y''+P(x)y'+Q(x)y=R(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $P,Q,R$ are continuous on an interval $I$ containing $x_0$, then for any
numbers $Y_0,Y_1$, the IVP:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1
$$

has exactly one solution on $I$.

This statement contains two claims:

-   **existence:** at least one solution satisfies the equation and the data
-   **uniqueness:** no second, different solution satisfies the same equation and
    the same data on that interval

The continuity interval matters. If normalization divides by a function that
vanishes, the theorem cannot be applied across that singular point.

```{=latex}
\Needspace{12\baselineskip}
```
### Homogeneous Equation With Zero Data {#homogeneous-equation-with-zero-data-19}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''+9y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=0,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
y=c_1\cos(3x)+c_2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-3c_1\sin(3x)+3c_2\cos(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=0$:

$$
0=c_1\cos(0)+c_2\sin(0)=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=0$:

$$
0=-3c_1\sin(0)+3c_2\cos(0)=3c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3$:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y=0}.
$$

For a homogeneous linear IVP, zero initial data select the zero solution. By
uniqueness, no nonzero solution can have the same zero data at the same point.

```{=latex}
\Needspace{12\baselineskip}
```
### Nonhomogeneous Equation With Zero Data {#nonhomogeneous-equation-with-zero-data-20}

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
y''+y=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the same zero data:

$$
y(0)=0,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A constant particular solution $y_p=A$ gives:

$$
y_p''+y_p=0+A=A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To reproduce the forcing $1$, choose:

$$
A=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the complete solution is:

$$
y=c_1\cos x+c_2\sin x+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-c_1\sin x+c_2\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=0$:

$$
0=c_1+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
c_1=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=0$:

$$
0=c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{y=1-\cos x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Zero initial data do not force the zero function here because $y=0$ does not
satisfy the nonhomogeneous equation:

$$
0''+0=0\ne 1.
$$

The forcing drives the solution away from zero after the initial point.

```{=latex}
\Needspace{12\baselineskip}
```
### The Interval Cannot Be Ignored {#the-interval-cannot-be-ignored-21}

```{=latex}
\Needspace{10\baselineskip}
```
Consider an equation that becomes, after normalization:

$$
y''+\frac{1}{x}y'=R(x).
$$

The coefficient $1/x$ is not continuous at $x=0$. An IVP based at $x_0=1$
may be studied on $(0,\infty)$, while an IVP based at $x_0=-1$ may be studied
on $(-\infty,0)$.

The existence-and-uniqueness theorem does not justify extending either solution
through $x=0$ without additional analysis.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-22}

Continuous normalized coefficients guarantee one solution for each valid pair
of initial values on the interval containing $x_0$.

For a homogeneous equation, zero initial data select $y=0$. For a
nonhomogeneous equation, the same data can select a nonzero forced response.
Always check whether the zero function satisfies the differential equation
before claiming that zero data imply a zero solution.

```{=latex}
\Needspace{20\baselineskip}
```
## Initial Data After Variation Of Parameters {#block-5-initial-data-after-variation-of-parameters}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-23}

The goal is to connect Chapter 12's definite-integral construction with the IVP
workflow. When the variation integrals begin at the initial point, the chosen
particular solution has zero initial value and zero initial derivative there.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Anchored Integrals Simplify The Constant Equations {#why-anchored-integrals-simplify-the-constant-equations-24}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''+Py'+Qy=R,
$$

```{=latex}
\Needspace{10\baselineskip}
```
let $y_1,y_2$ be a fundamental pair and let $W$ be their Wronskian. Define:

$$
u_1(x)
=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_2(x)
=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y_p=u_1y_1+u_2y_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because both integrals vanish at $x=x_0$:

$$
u_1(x_0)=u_2(x_0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_p(x_0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Under the variation-of-parameters auxiliary condition:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since both parameter functions vanish at $x_0$:

$$
y_p'(x_0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial data then determine only the homogeneous combination:

$$
\begin{aligned}
c_1y_1(x_0)+c_2y_2(x_0)&=Y_0, \\
c_1y_1'(x_0)+c_2y_2'(x_0)&=Y_1.
\end{aligned}
$$

The complete solution still includes $y_p$. The anchored construction merely
makes its two initial contributions zero.

```{=latex}
\Needspace{12\baselineskip}
```
### A Variation-Of-Parameters IVP {#a-variation-of-parameters-ivp-25}

```{=latex}
\Needspace{10\baselineskip}
```
Solve on $-\pi/2<x<\pi/2$:

$$
y''+y=2\tan x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

#### Step 1: Find the homogeneous pair and Wronskian

```{=latex}
\Needspace{10\baselineskip}
```
The associated homogeneous equation is:

$$
y''+y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
y_1=\cos x,
\qquad
y_2=\sin x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the pair:

$$
y_1'=-\sin x,
\qquad
y_2'=\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compute:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=\cos^2x+\sin^2x \\
&=1.
\end{aligned}
$$

#### Step 2: Construct $u_1$ from the initial point

```{=latex}
\Needspace{10\baselineskip}
```
The normalized forcing is:

$$
R(x)=2\tan x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
u_1(x)
=-\int_0^x\frac{y_2(t)R(t)}{W(t)}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_2(t)=\sin t$, $R(t)=2\tan t$, and $W=1$:

$$
u_1(x)=-2\int_0^x\sin t\tan t\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the integrand:

$$
\begin{aligned}
\sin t\tan t
&=\frac{\sin^2t}{\cos t} \\
&=\frac{1-\cos^2t}{\cos t} \\
&=\sec t-\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
u_1(x)=-2\int_0^x(\sec t-\cos t)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the chosen interval:

$$
\int\sec t\,dt=\ln(\sec t+\tan t),
\qquad
\int\cos t\,dt=\sin t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the limits:

$$
\begin{aligned}
u_1(x)
&=-2[\ln(\sec t+\tan t)-\sin t]_0^x \\
&=-2\ln(\sec x+\tan x)+2\sin x.
\end{aligned}
$$

At $x=0$, both $\ln(1)$ and $\sin(0)$ are zero, as required.

#### Step 3: Construct $u_2$ from the initial point

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
u_2(x)
=\int_0^x\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_1(t)=\cos t$, $R(t)=2\tan t$, and $W=1$:

$$
\begin{aligned}
u_2(x)
&=\int_0^x2\cos t\tan t\,dt \\
&=2\int_0^x\sin t\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate and apply the limits:

$$
\begin{aligned}
u_2(x)
&=[-2\cos t]_0^x \\
&=-2\cos x+2 \\
&=2(1-\cos x).
\end{aligned}
$$

#### Step 4: Reconstruct and simplify $y_p$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y_p=u_1y_1+u_2y_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the four functions:

$$
\begin{aligned}
y_p
&=[-2\ln(\sec x+\tan x)+2\sin x]\cos x \\
&\quad +2(1-\cos x)\sin x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the second line:

$$
\begin{aligned}
y_p
&=-2\cos x\ln(\sec x+\tan x)
+2\sin x\cos x \\
&\quad +2\sin x-2\sin x\cos x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel the opposite product terms:

$$
\boxed{
y_p=2\sin x-2\cos x\ln(\sec x+\tan x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The anchored construction guarantees:

$$
y_p(0)=0,
\qquad
y_p'(0)=0.
$$

#### Step 5: Apply the initial data to the complete solution

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
y=c_1\cos x+c_2\sin x+y_p.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=1$ using $y_p(0)=0$:

$$
\begin{aligned}
1
&=c_1\cos(0)+c_2\sin(0)+0 \\
&=c_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete solution in structural form:

$$
y'=-c_1\sin x+c_2\cos x+y_p'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=0$ using $y_p'(0)=0$:

$$
\begin{aligned}
0
&=-c_1\sin(0)+c_2\cos(0)+0 \\
&=c_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Write and verify the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the constants and the particular solution:

$$
\boxed{
y=\cos x+2\sin x
-2\cos x\ln(\sec x+\tan x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a direct equation check, let:

$$
h(x)=\ln(\sec x+\tan x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
h'(x)=\sec x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The terms $\cos x$ and $2\sin x$ are homogeneous, so only
$z=-2\cos x\,h$ contributes to $y''+y$. Differentiate $z$:

$$
\begin{aligned}
z'
&=2\sin x\,h-2\cos x\,h' \\
&=2\sin x\,h-2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
z''=2\cos x\,h+2\sin x\sec x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $z=-2\cos x\,h$:

$$
\begin{aligned}
z''+z
&=2\sin x\sec x \\
&=2\tan x.
\end{aligned}
$$

The differential equation is satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-26}

```{=latex}
\Needspace{10\baselineskip}
```
Variation integrals based at the initial point produce a particular solution
with:

$$
y_p(x_0)=0,
\qquad
y_p'(x_0)=0.
$$

This often makes the constant equations look homogeneous, but the final
solution must still include the nonzero forced response $y_p(x)$.

```{=latex}
\Needspace{20\baselineskip}
```
## Higher-Order Initial-Value Problems {#block-6-higher-order-initial-value-problems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-27}

The goal is to extend the same workflow to an $n$th-order equation: calculate
the complete $n$-constant family, differentiate through order $n-1$, and use
the $n$ initial conditions to determine all constants.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Higher-Order Pattern {#the-general-higher-order-pattern-28}

```{=latex}
\Needspace{10\baselineskip}
```
An $n$th-order linear IVP has a differential equation of the form:

$$
a_n(x)y^{(n)}+a_{n-1}(x)y^{(n-1)}+\cdots+a_0(x)y=g(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Third-Order Initial-Value Problem {#a-third-order-initial-value-problem-29}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'''=6x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(1)=\frac94,
\qquad
y'(1)=5,
\qquad
y''(1)=9.
$$

#### Step 1: Find the complete general solution

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the differential equation once:

$$
y''=3x^2+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate again:

$$
y'=x^3+C_1x+C_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate a third time:

$$
y=\frac{x^4}{4}+\frac{C_1}{2}x^2+C_2x+C_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rename the arbitrary constants so the complete solution is written more
simply:

$$
\boxed{
y=c_1+c_2x+c_3x^2+\frac{x^4}{4}
}.
$$

#### Step 2: Calculate the required derivatives

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the renamed formula:

$$
y'=c_2+2c_3x+x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
y''=2c_3+3x^2.
$$

#### Step 3: Apply $y''(1)=9$ first

The highest-derivative condition contains only $c_3$, so it is the shortest
equation to use first.

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=1$ into $y''=2c_3+3x^2$:

$$
9=2c_3+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $3$:

$$
6=2c_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_3=3.
$$

#### Step 4: Apply $y'(1)=5$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y'=c_2+2c_3x+x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=1$, $y'(1)=5$, and $c_3=3$:

$$
5=c_2+2(3)(1)+(1)^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the numerical terms:

$$
5=c_2+6+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
5=c_2+7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $7$:

$$
c_2=-2.
$$

#### Step 5: Apply $y(1)=9/4$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the complete solution:

$$
y=c_1+c_2x+c_3x^2+\frac{x^4}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=1$, $c_2=-2$, and $c_3=3$:

$$
\frac94=c_1-2(1)+3(1)^2+\frac{(1)^4}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
\frac94=c_1-2+3+\frac14.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the numerical terms on the right:

$$
\frac94=c_1+\frac54.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $5/4$:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Write and verify the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute all three constants:

$$
\boxed{
y=1-2x+3x^2+\frac{x^4}{4}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-2+6x+x^3,
\qquad
y''=6+3x^2,
\qquad
y'''=6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=1$:

$$
\begin{aligned}
y(1)&=1-2+3+\frac14=\frac94, \\
y'(1)&=-2+6+1=5, \\
y''(1)&=6+3=9.
\end{aligned}
$$

The equation and all three initial conditions are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### Using The Easiest Condition First {#using-the-easiest-condition-first-30}

Initial conditions may be processed in any order. In the third-order example,
$y''(1)=9$ isolated $c_3$ immediately, then $y'(1)=5$ isolated $c_2$, and the
remaining condition found $c_1$.

This triangular structure is common when a differential equation has been
solved by repeated integration. For exponential or trigonometric bases, the
constants may remain coupled and must be solved simultaneously instead.

Choosing an efficient order is helpful, but every condition must still be
applied to the correct derivative of the complete solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-31}

An $n$th-order IVP normally needs $n$ initial conditions through derivative
order $n-1$. Write all required derivatives before substitution and solve the
resulting $n$ equations for the $n$ constants.

When the system is triangular, use the condition that isolates a constant
first. When it is coupled, solve all constant equations together.

```{=latex}
\Needspace{20\baselineskip}
```
## Verification, Boundaries, And Common Mistakes {#block-7-verification-boundaries-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Complete IVP Workflow {#the-complete-ivp-workflow-32}

#### Step 1: Identify the order and the data

Count the arbitrary constants expected and confirm that the problem supplies
the corresponding number of initial conditions.

#### Step 2: Choose a valid interval

Normalize the equation if needed and identify singular points. The initial
point must lie inside the working interval.

#### Step 3: Find the complete general solution

```{=latex}
\Needspace{10\baselineskip}
```
For a nonhomogeneous problem, include both parts:

$$
y=y_h+y_p.
$$

#### Step 4: Differentiate the complete formula

Calculate every derivative appearing in the data. Carry all particular terms
through the differentiation.

#### Step 5: Apply one condition at a time

Restate the relevant formula, substitute the actual initial point, and write
the resulting constant equation.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Solve the full constant system

Use substitution, elimination, or matrix methods. Do not assign a constant
from one equation while ignoring its coupling to the others.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Write the selected solution

Replace every arbitrary constant. The final answer should contain no undetermined
$c_i$.

#### Step 8: Perform two kinds of verification

Check:

1.  the differential equation on the interval
2.  every initial condition at $x_0$

```{=latex}
\Needspace{12\baselineskip}
```
### Initial Conditions Versus Boundary Conditions {#initial-conditions-versus-boundary-conditions-33}

```{=latex}
\Needspace{10\baselineskip}
```
Initial conditions are imposed at one point:

$$
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Boundary conditions may be imposed at different points, for example:

$$
y(a)=A,
\qquad
y(b)=B.
$$

The linear IVP uniqueness theorem does not automatically give the same result
for a boundary-value problem. Depending on the equation and boundary data, a
boundary-value problem may have:

-   exactly one solution
-   no solution
-   more than one solution

The algebra may still produce a constant system, but its determinant must be
examined separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Applying Data To $y_h$ Alone {#common-mistake-applying-data-to-yh-alone-34}

```{=latex}
\Needspace{10\baselineskip}
```
For a forced problem:

$$
y=y_h+y_p.
$$

The conditions apply to $y$, not merely to the portion containing arbitrary
constants. Write $y_h+y_p$ locally before substituting the initial point.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting A Particular Derivative {#common-mistake-forgetting-a-particular-derivative-35}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
y=c_1y_1+c_2y_2+y_p,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
y'=c_1y_1'+c_2y_2'+y_p'.
$$

The term $y_p'$ can be zero, constant, or a nontrivial function. Calculate it;
do not assume it vanishes.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating Every Initial Point As Zero {#common-mistake-treating-every-initial-point-as-zero-36}

```{=latex}
\Needspace{10\baselineskip}
```
At $x_0=0$:

$$
e^{rx_0}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At a nonzero initial point:

$$
e^{rx_0}
$$

must be evaluated at its actual exponent. The same applies to sine, cosine,
polynomial terms, logarithms, and particular solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Solving Conditions In Isolation {#common-mistake-solving-conditions-in-isolation-37}

The equations produced by two initial conditions normally share both
$c_1$ and $c_2$. They form one simultaneous system.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
\begin{aligned}
c_1+c_2&=5, \\
2c_1-c_2&=1
\end{aligned}
$$

does not allow either constant to be read from one equation alone. Eliminate or
substitute using both equations.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Verifying Only The Data {#common-mistake-verifying-only-the-data-38}

A function can pass through the required initial values without satisfying the
differential equation. Conversely, a member of the general solution family can
satisfy the equation but fail the selected data.

```{=latex}
\Needspace{10\baselineskip}
```
A valid IVP solution must pass both tests:

$$
\text{differential equation}
\quad\text{and}\quad
\text{all initial conditions}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Assuming Zero Data Always Give Zero {#common-mistake-assuming-zero-data-always-give-zero-39}

Zero data select the zero solution for a homogeneous linear equation. For a
forced equation, first test whether $y=0$ satisfies the equation. If the forcing
is nonzero, it does not.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-40}

The safest order is:

1.  solve the equation
2.  write the complete family
3.  differentiate completely
4.  evaluate at the actual initial point
5.  solve all constant equations together
6.  verify the equation and the data separately

Initial-value and boundary-value problems may look similar, but their
uniqueness behavior is not interchangeable.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-41}

#### Problem 1: Count The Required Initial Data

For a fourth-order linear differential equation:

1.  how many arbitrary constants should the general solution contain?
2.  what standard initial values would be prescribed at $x=x_0$?

#### Problem 2: Form And Solve The Constant System

```{=latex}
\Needspace{10\baselineskip}
```
The complete general solution of an equation is:

$$
y=c_1e^x+c_2e^{-x}+x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Find $c_1,c_2$ if:

$$
y(0)=3,
\qquad
y'(0)=0.
$$

#### Problem 3: Use A Nonzero Initial Point

```{=latex}
\Needspace{10\baselineskip}
```
The complete general solution is:

$$
y=c_1\cos x+c_2\sin x+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Find $c_1,c_2$ if:

$$
y\left(\frac{\pi}{2}\right)=5,
\qquad
y'\left(\frac{\pi}{2}\right)=-2.
$$

#### Problem 4: Diagnose Zero Initial Data

```{=latex}
\Needspace{10\baselineskip}
```
Explain why zero initial data do not imply $y=0$ for:

$$
y''-2y'+y=e^x,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

#### Problem 5: Solve A Homogeneous IVP

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'-3y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=2,
\qquad
y'(0)=-2.
$$

#### Problem 6: Solve A Repeated-Root IVP

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y'+4y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

#### Problem 7: Include A Polynomial Particular Solution

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=8x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=2,
\qquad
y'(0)=1.
$$

#### Problem 8: Include An Exponential Particular Solution

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-3y'+2y=6e^{-x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=0,
\qquad
y'(0)=1.
$$

#### Problem 9: Apply Trigonometric Data Away From Zero

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+9y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y\left(\frac{\pi}{6}\right)=2,
\qquad
y'\left(\frac{\pi}{6}\right)=3.
$$

#### Problem 10: Use An Anchored Particular Solution

```{=latex}
\Needspace{10\baselineskip}
```
For the equation:

$$
y''+y=3\tan x,
\qquad -\frac{\pi}{2}<x<\frac{\pi}{2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
variation of parameters with lower limit $0$ produces:

$$
y_p=3\sin x-3\cos x\ln(\sec x+\tan x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use this particular solution to solve the IVP:

$$
y(0)=-2,
\qquad
y'(0)=4.
$$

#### Problem 11: Solve A Third-Order IVP

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'''=12x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=1,
\qquad
y'(0)=-1,
\qquad
y''(0)=2.
$$

#### Problem 12: Test Candidate Solutions Completely

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
**(a)**

$$
y=2\cosh x
$$

```{=latex}
\Needspace{10\baselineskip}
```
**(b)**

$$
y=2e^x
$$

```{=latex}
\Needspace{10\baselineskip}
```
**(c)**

$$
y=2
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-42}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

A fourth-order linear equation has a general solution containing four arbitrary
constants.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
y=c_1e^x+c_2e^{-x}+x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate every term:

$$
y'=c_1e^x-c_2e^{-x}+2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=3$:

$$
\begin{aligned}
3
&=c_1e^0+c_2e^0+(0)^2 \\
&=c_1+c_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1+c_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=0$:

$$
\begin{aligned}
0
&=c_1e^0-c_2e^0+2(0) \\
&=c_1-c_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1-c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second equation gives:

$$
c_1=c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_2=c_1$ into $c_1+c_2=3$:

$$
2c_1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_1=\frac32.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=\frac32.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{
y=\frac32e^x+\frac32e^{-x}+x^2
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
y=c_1\cos x+c_2\sin x+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-c_1\sin x+c_2\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=\pi/2$:

$$
\cos\left(\frac{\pi}{2}\right)=0,
\qquad
\sin\left(\frac{\pi}{2}\right)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(\pi/2)=5$:

$$
5=c_1(0)+c_2(1)+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2$:

$$
c_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(\pi/2)=-2$:

$$
-2=-c_1(1)+c_2(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{y=2\cos x+3\sin x+2}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The IVP is:

$$
y''-2y'+y=e^x,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Test the zero function in the differential equation. For $y=0$:

$$
y'=0,
\qquad
y''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the left side is:

$$
y''-2y'+y=0-0+0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The required right side is:

$$
e^x,
$$

which is not identically zero. Hence $y=0$ does not satisfy the differential
equation, even though it satisfies the two initial conditions.

The nonzero forcing creates a nonzero response after the initial point. Zero
initial data imply a zero solution only for a homogeneous linear equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-43}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'-3y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=2,
\qquad
y'(0)=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+2r-3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-1)(r+3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $1,-3$, so:

$$
y=c_1e^x+c_2e^{-3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=c_1e^x-3c_2e^{-3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=2$:

$$
c_1+c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=-2$:

$$
c_1-3c_2=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the first equation from the second:

$$
-4c_2=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-4$:

$$
c_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $c_1+c_2=2$:

$$
c_1+1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y=e^x+e^{-3x}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y'+4y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-4r+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated root is $r=2$, so:

$$
y=(c_1+c_2x)e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with the product rule:

$$
\begin{aligned}
y'
&=c_2e^{2x}+2(c_1+c_2x)e^{2x} \\
&=(c_2+2c_1+2c_2x)e^{2x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=1$:

$$
1=(c_1+c_2(0))e^0=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=0$:

$$
0=(c_2+2c_1+2c_2(0))e^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=1$:

$$
0=c_2+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{y=(1-2x)e^{2x}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=8x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=2,
\qquad
y'(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous solution is:

$$
y_h=c_1\cos(2x)+c_2\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the polynomial forcing, try:

$$
y_p=Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y_p''+4y_p=8x$:

$$
4(Ax+B)=8x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients:

$$
A=2,
\qquad
B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_p=2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
y=c_1\cos(2x)+c_2\sin(2x)+2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=2$:

$$
2=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=1$:

$$
1=2c_2+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2$:

$$
-1=2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_2=-\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y=2\cos(2x)-\frac12\sin(2x)+2x}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-3y'+2y=6e^{-x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=0,
\qquad
y'(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2-3r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-1)(r-2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_h=c_1e^x+c_2e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the forcing $6e^{-x}$, try:

$$
y_p=Ae^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y_p'=-Ae^{-x},
\qquad
y_p''=Ae^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side:

$$
\begin{aligned}
y_p''-3y_p'+2y_p
&=Ae^{-x}-3(-Ae^{-x})+2Ae^{-x} \\
&=6Ae^{-x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $6e^{-x}$:

$$
6A=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A=1,
\qquad
y_p=e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
y=c_1e^x+c_2e^{2x}+e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=c_1e^x+2c_2e^{2x}-e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=0$:

$$
0=c_1+c_2+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
c_1+c_2=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=1$:

$$
1=c_1+2c_2-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $1$:

$$
c_1+2c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the first constant equation from the second:

$$
c_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $c_1+c_2=-1$:

$$
c_1+3=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{y=-4e^x+3e^{2x}+e^{-x}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-44}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+9y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y\left(\frac{\pi}{6}\right)=2,
\qquad
y'\left(\frac{\pi}{6}\right)=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic roots are $\pm3i$, so:

$$
y=c_1\cos(3x)+c_2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-3c_1\sin(3x)+3c_2\cos(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=\pi/6$:

$$
3x=\frac{\pi}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\cos(3x)=0,
\qquad
\sin(3x)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the first condition:

$$
2=c_1(0)+c_2(1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the derivative condition:

$$
3=-3c_1(1)+3c_2(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-3$:

$$
c_1=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{y=-\cos(3x)+2\sin(3x)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The equation and anchored particular solution are:

$$
y''+y=3\tan x
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y_p=3\sin x-3\cos x\ln(\sec x+\tan x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the complete solution is:

$$
y=c_1\cos x+c_2\sin x+y_p.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because the variation integrals were based at $0$:

$$
y_p(0)=0,
\qquad
y_p'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=-2$:

$$
\begin{aligned}
-2
&=c_1\cos(0)+c_2\sin(0)+y_p(0) \\
&=c_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete solution structurally:

$$
y'=-c_1\sin x+c_2\cos x+y_p'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=4$:

$$
\begin{aligned}
4
&=-c_1\sin(0)+c_2\cos(0)+y_p'(0) \\
&=c_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the constants and $y_p$:

$$
\boxed{
y=-2\cos x+4\sin x
+3\sin x-3\cos x\ln(\sec x+\tan x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the two sine terms:

$$
\boxed{
y=-2\cos x+7\sin x
-3\cos x\ln(\sec x+\tan x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'''=12x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=1,
\qquad
y'(0)=-1,
\qquad
y''(0)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the differential equation once:

$$
y''=6x^2+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate again:

$$
y'=2x^3+C_1x+C_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate a third time:

$$
y=\frac{x^4}{2}+\frac{C_1x^2}{2}+C_2x+C_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rename the constants:

$$
y=c_1+c_2x+c_3x^2+\frac{x^4}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y'=c_2+2c_3x+2x^3
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y''=2c_3+6x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=1$:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=-1$:

$$
c_2=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y''(0)=2$:

$$
2c_3=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_3=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y=1-x+x^2+\frac{x^4}{2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The IVP is:

$$
y''-y=0,
\qquad
y(0)=2,
\qquad
y'(0)=0.
$$

#### Candidate (a): $y=2\cosh x$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=2\sinh x,
\qquad
y''=2\cosh x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the differential equation:

$$
y''-y=2\cosh x-2\cosh x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the data:

$$
y(0)=2\cosh(0)=2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'(0)=2\sinh(0)=0.
$$

Candidate (a) is valid.

#### Candidate (b): $y=2e^x$

```{=latex}
\Needspace{10\baselineskip}
```
Since $y''=2e^x$, the differential equation is satisfied:

$$
y''-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also:

$$
y(0)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
However:

$$
y'=2e^x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
y'(0)=2\ne 0.
$$

Candidate (b) is rejected because it fails the derivative condition.

#### Candidate (c): $y=2$

```{=latex}
\Needspace{10\baselineskip}
```
The initial values are:

$$
y(0)=2,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
However:

$$
y''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y''-y=0-2=-2\ne 0.
$$

Candidate (c) is rejected because it fails the differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 13 Final Summary {#chapter-13-final-summary-45}

```{=latex}
\Needspace{10\baselineskip}
```
For a second-order nonhomogeneous equation, begin with the complete solution:

$$
\boxed{y=c_1y_1+c_2y_2+y_p}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete formula:

$$
\boxed{y'=c_1y_1'+c_2y_2'+y_p'}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For an $n$th-order equation, use $n$ initial conditions through derivative
order $n-1$. After selecting the constants, verify two separate requirements:

$$
\boxed{
\text{the differential equation}
\quad\text{and}\quad
\text{every initial condition}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's final lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> initial data select from the complete solution family, not from the
> homogeneous part alone; differentiate every term, evaluate at the actual
> initial point, solve the full constant system, and verify both the equation
> and the data.
