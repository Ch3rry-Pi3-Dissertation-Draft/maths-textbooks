```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 9}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Second-Order Constant-Coefficient ODEs}
```
# Chapter 9 - Second-Order Constant-Coefficient Equations

```{=latex}
\Needspace{10\baselineskip}
```
Chapter 8 explained the structure of linear solution spaces. This chapter
turns that theory into a practical method for equations of the form:

$$
ay''+by'+cy=0,
\qquad a\neq0,
$$

where $a$, $b$, and $c$ are real constants.

The method replaces a differential equation with a quadratic equation. That
replacement is useful only when its origin is understood, so we will derive it
before using it.

The central questions are:

-   why is an exponential trial function natural?
-   how does a quadratic equation encode two independent solution directions?
-   why do distinct, repeated, and complex roots require different formulas?
-   how are arbitrary constants determined from initial conditions?
-   what can the roots tell us about growth, decay, and oscillation?

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's organising idea is:

```{=latex}
\Needspace{8\baselineskip}
```
> the characteristic roots describe the basic modes of the differential
> equation; the general solution combines those modes, and initial data choose
> the required combination.

All examples, data, explanations, and exercises are independently constructed.
The reference text is used only to identify the mathematical topics.

```{=latex}
\Needspace{20\baselineskip}
```
## Why A Differential Equation Becomes A Quadratic {#block-1-why-a-differential-equation-becomes-a-quadratic}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{10\baselineskip}
```
The goal is to derive the characteristic equation from:

$$
ay''+by'+cy=0
$$

```{=latex}
\Needspace{12\baselineskip}
```
and understand exactly why its roots produce solutions.

```{=latex}
\Needspace{8\baselineskip}
```
> we are not replacing derivatives with powers by a notation trick; we are
> testing a function whose derivatives reproduce the same exponential factor.

```{=latex}
\Needspace{12\baselineskip}
```
### The Equation Class {#the-equation-class-2}

```{=latex}
\Needspace{10\baselineskip}
```
The method in this chapter applies to a **second-order linear homogeneous
differential equation with constant coefficients**:

$$
\boxed{ay''+by'+cy=0},
\qquad a\neq0.
$$

Here:

-   $x$ is the independent variable
-   $y=y(x)$ is the unknown function
-   $y'$ and $y''$ are the first and second derivatives of $y$
-   $a$, $b$, and $c$ are real constants
-   $a\neq0$ ensures that the equation is genuinely second-order
-   the right side is zero, so the equation is homogeneous

Each part of the classification matters. The method is not automatically valid
if the equation is nonlinear, nonhomogeneous, or has variable coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Try An Exponential? {#why-try-an-exponential-3}

Differentiating most functions changes their shape. Differentiating an
exponential does not.

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
y=e^{rx},
$$

where $r$ is a constant that has not yet been determined.

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
y'=re^{rx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate a second time:

$$
y''=r^2e^{rx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The three expressions $y$, $y'$, and $y''$ all contain the same nonzero factor
$e^{rx}$. Only the multiplier changes:

$$
\begin{aligned}
y   &\longleftrightarrow 1, \\
y'  &\longleftrightarrow r, \\
y'' &\longleftrightarrow r^2.
\end{aligned}
$$

This shared shape is what allows the differential equation to collapse into
an algebraic equation for $r$.

```{=latex}
\Needspace{12\baselineskip}
```
### Deriving The Characteristic Equation {#deriving-the-characteristic-equation-4}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
ay''+by'+cy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the exponential trial function:

$$
y=e^{rx},
\qquad
y'=re^{rx},
\qquad
y''=r^2e^{rx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute all three expressions into the differential equation:

$$
a\left(r^2e^{rx}\right)
+b\left(re^{rx}\right)
+c\left(e^{rx}\right)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out the common exponential:

$$
e^{rx}\left(ar^2+br+c\right)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For every real $x$ and every complex $r$:

$$
e^{rx}\neq0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the product can equal zero only when the polynomial factor is zero:

$$
\boxed{ar^2+br+c=0}.
$$

This quadratic is the **characteristic equation**.

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us is:

```{=latex}
\Needspace{8\baselineskip}
```
> a number $r$ is a characteristic root precisely when the exponential
> $e^{rx}$ satisfies the differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Direct Verification Of The Root Principle {#a-direct-verification-of-the-root-principle-5}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
2y''-5y'-3y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its characteristic equation is:

$$
2r^2-5r-3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check whether $r=3$ is a root:

$$
\begin{aligned}
2(3)^2-5(3)-3
&=18-15-3 \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The root principle therefore predicts that:

$$
y=e^{3x}
$$

is a solution.

```{=latex}
\Needspace{10\baselineskip}
```
Verify it in the original differential equation. Its derivatives are:

$$
y'=3e^{3x},
\qquad
y''=9e^{3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these expressions into $2y''-5y'-3y$:

$$
\begin{aligned}
2y''-5y'-3y
&=2\left(9e^{3x}\right)
-5\left(3e^{3x}\right)
-3\left(e^{3x}\right) \\
&=(18-15-3)e^{3x} \\
&=0.
\end{aligned}
$$

The substitution confirms the prediction.

```{=latex}
\Needspace{12\baselineskip}
```
### When The Method Does Not Apply Directly {#when-the-method-does-not-apply-directly-6}

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic-polynomial method in this chapter relies on all four
features of:

$$
ay''+by'+cy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
xy''+y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has a variable coefficient $x$. Trying $y=e^{rx}$ gives:

$$
xr^2e^{rx}+e^{rx}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^{rx}$:

$$
e^{rx}(xr^2+1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The remaining expression still depends on $x$:

$$
xr^2+1=0.
$$

No single constant $r$ can satisfy this relation for every $x$. The equation
has not become a constant-coefficient polynomial problem.

```{=latex}
\Needspace{10\baselineskip}
```
Likewise, the homogeneous solution method alone does not solve:

$$
y''+4y=\cos x,
$$

because the nonzero right side requires a particular solution in addition to
the homogeneous family.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
ay''+by'+cy=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the trial function $y=e^{rx}$ gives:

$$
e^{rx}(ar^2+br+c)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{rx}$ is never zero, the characteristic equation is:

$$
\boxed{ar^2+br+c=0}.
$$

Its roots identify exponential modes of the differential equation.

```{=latex}
\Needspace{20\baselineskip}
```
## Reading The Three Root Cases {#block-2-reading-the-three-root-cases}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to classify the roots before writing a solution formula.

Every real quadratic has one of three root patterns:

1.  two distinct real roots
2.  one repeated real root
3.  a complex-conjugate pair

Each pattern produces two independent real solution directions in a different
way.

```{=latex}
\Needspace{12\baselineskip}
```
### The Quadratic Formula {#the-quadratic-formula-9}

```{=latex}
\Needspace{10\baselineskip}
```
For the characteristic equation:

$$
ar^2+br+c=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the roots are:

$$
\boxed{
r=\frac{-b\pm\sqrt{b^2-4ac}}{2a}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The expression under the square root is the **discriminant**:

$$
\Delta=b^2-4ac.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sign of $\Delta$ determines the root type:

$$
\begin{array}{c|c|c}
\text{Discriminant} & \text{Root type} & \text{Solution shape} \\
\hline
\Delta>0 & \text{two distinct real roots} & c_1e^{r_1x}+c_2e^{r_2x} \\
\Delta=0 & \text{one repeated real root} & (c_1+c_2x)e^{rx} \\
\Delta<0 & \text{complex-conjugate roots} & e^{\alpha x}(c_1\cos\beta x+c_2\sin\beta x)
\end{array}
$$

These formulas will be derived and used carefully in the next three blocks.

```{=latex}
\Needspace{12\baselineskip}
```
### A Classification Example {#a-classification-example-10}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the family:

$$
y''+6y'+ky=0,
$$

where $k$ is a real parameter.

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+6r+k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=1,
\qquad
b=6,
\qquad
c=k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The discriminant is:

$$
\begin{aligned}
\Delta
&=b^2-4ac \\
&=6^2-4(1)(k) \\
&=36-4k.
\end{aligned}
$$

Now classify by the sign of $36-4k$.

```{=latex}
\Needspace{10\baselineskip}
```
For two distinct real roots:

$$
\begin{aligned}
36-4k&>0 \\
-4k&>-36 \\
k&<9.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For one repeated real root:

$$
\begin{aligned}
36-4k&=0 \\
4k&=36 \\
k&=9.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For complex-conjugate roots:

$$
\begin{aligned}
36-4k&<0 \\
-4k&<-36 \\
k&>9.
\end{aligned}
$$

The parameter $k$ changes the qualitative form of the solution even though
the differential equation remains linear and homogeneous.

```{=latex}
\Needspace{12\baselineskip}
```
### Why We Need Two Solution Directions {#why-we-need-two-solution-directions-11}

Chapter 8 established that a regular second-order homogeneous linear equation
has a two-dimensional solution space.

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the general solution needs two linearly independent functions:

$$
y=c_1y_1+c_2y_2.
$$

The root calculation must supply both directions.

-   Distinct roots supply two different exponentials.
-   A repeated root supplies one exponential, so a second function must be
    constructed.
-   Complex roots supply two real directions through cosine and sine.

The two arbitrary constants are not decorative. They are the coordinates
needed to match two independent pieces of initial data, usually $y(x_0)$ and
$y'(x_0)$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Root-First Decision Rule {#a-root-first-decision-rule-12}

For every equation in this chapter:

1.  write the characteristic equation
2.  solve it completely
3.  classify the roots
4.  choose the formula belonging to that root type
5.  only then apply initial or boundary conditions

```{=latex}
\Needspace{12\baselineskip}
```
Do not choose a solution form merely because the original equation looks
similar to a previous example.

```{=latex}
\Needspace{8\baselineskip}
```
> the roots, not visual resemblance, determine the basis functions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-13}

```{=latex}
\Needspace{10\baselineskip}
```
For $ar^2+br+c=0$, calculate:

$$
\Delta=b^2-4ac.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
\Delta>0 &\Longrightarrow \text{distinct real roots}, \\
\Delta=0 &\Longrightarrow \text{repeated real root}, \\
\Delta<0 &\Longrightarrow \text{complex-conjugate roots}.
\end{aligned}
$$

The root type controls the form of the two-dimensional real solution family.

```{=latex}
\Needspace{20\baselineskip}
```
## Two Distinct Real Roots {#block-3-two-distinct-real-roots}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-14}

The goal is to solve the easiest root case completely and connect the two
roots to two independent exponential modes.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Formula {#the-general-formula-15}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the characteristic equation has two distinct real roots:

$$
r_1\neq r_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Each root produces a solution:

$$
y_1=e^{r_1x},
\qquad
y_2=e^{r_2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their Wronskian is:

$$
W[y_1,y_2]
=
\begin{vmatrix}
e^{r_1x} & e^{r_2x} \\
r_1e^{r_1x} & r_2e^{r_2x}
\end{vmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the determinant:

$$
\begin{aligned}
W[y_1,y_2]
&=r_2e^{(r_1+r_2)x}-r_1e^{(r_1+r_2)x} \\
&=(r_2-r_1)e^{(r_1+r_2)x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $r_2-r_1\neq0$ and the exponential is never zero:

$$
W[y_1,y_2]\neq0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the two modes are linearly independent, and the general solution is:

$$
\boxed{
y=c_1e^{r_1x}+c_2e^{r_2x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Distinct-Root Initial-Value Problem {#a-complete-distinct-root-initial-value-problem-16}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
3y''+2y'-8y=0,
\qquad
y(0)=5,
\qquad
y'(0)=-2.
$$

#### Step 1: Write the characteristic equation

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y''$, $y'$, and $y$ by the exponential multipliers $r^2$, $r$, and
$1$:

$$
3r^2+2r-8=0.
$$

#### Step 2: Factor the quadratic

```{=latex}
\Needspace{10\baselineskip}
```
We need two factors whose product is $3r^2+2r-8$:

$$
3r^2+2r-8=(3r-4)(r+2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
(3r-4)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set each factor equal to zero:

$$
3r-4=0
\qquad\text{or}\qquad
r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve the two equations:

$$
r_1=\frac43,
\qquad
r_2=-2.
$$

The roots are real and distinct.

#### Step 3: Build the general solution

```{=latex}
\Needspace{10\baselineskip}
```
For distinct real roots $r_1=4/3$ and $r_2=-2$, use:

$$
y=c_1e^{r_1x}+c_2e^{r_2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the roots:

$$
\boxed{
y=c_1e^{4x/3}+c_2e^{-2x}
}.
$$

#### Step 4: Differentiate the complete family

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate before applying the derivative condition:

$$
y'=\frac43c_1e^{4x/3}-2c_2e^{-2x}.
$$

#### Step 5: Apply $y(0)=5$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the function formula:

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

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply $y'(0)=-2$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the derivative formula:

$$
-2=\frac43c_1e^0-2c_2e^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $e^0=1$ gives:

$$
\frac43c_1-2c_2=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Solve the constant system visibly

```{=latex}
\Needspace{10\baselineskip}
```
The two equations are:

$$
\begin{aligned}
c_1+c_2&=5, \\
\frac43c_1-2c_2&=-2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $c_1+c_2=5$, isolate $c_2$:

$$
c_2=5-c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_2=5-c_1$ into the second equation:

$$
\frac43c_1-2(5-c_1)=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute $-2$:

$$
\frac43c_1-10+2c_1=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the $c_1$ terms:

$$
\frac{10}{3}c_1-10=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $10$ to both sides:

$$
\frac{10}{3}c_1=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $3/10$:

$$
c_1=\frac{12}{5}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=12/5$ into $c_2=5-c_1$:

$$
\begin{aligned}
c_2
&=5-\frac{12}{5} \\
&=\frac{25}{5}-\frac{12}{5} \\
&=\frac{13}{5}.
\end{aligned}
$$

#### Step 8: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Insert both constants into the general family:

$$
\boxed{
y(x)=\frac{12}{5}e^{4x/3}+\frac{13}{5}e^{-2x}
}.
$$

The calculation has used both initial conditions, so the arbitrary family has
been reduced to one specific solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Verifying The Selected Solution {#verifying-the-selected-solution-17}

```{=latex}
\Needspace{10\baselineskip}
```
For the selected solution:

$$
y=\frac{12}{5}e^{4x/3}+\frac{13}{5}e^{-2x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating
$y=(12/5)e^{4x/3}+(13/5)e^{-2x}$ once gives:

$$
y'=\frac{16}{5}e^{4x/3}-\frac{26}{5}e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
y''=\frac{64}{15}e^{4x/3}+\frac{52}{5}e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side $3y''+2y'-8y$:

$$
\begin{aligned}
3y''+2y'-8y
&=3\left(
\frac{64}{15}e^{4x/3}+\frac{52}{5}e^{-2x}
\right) \\
&\quad+2\left(
\frac{16}{5}e^{4x/3}-\frac{26}{5}e^{-2x}
\right) \\
&\quad-8\left(
\frac{12}{5}e^{4x/3}+\frac{13}{5}e^{-2x}
\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the coefficient of $e^{4x/3}$:

$$
\begin{aligned}
3\left(\frac{64}{15}\right)
+2\left(\frac{16}{5}\right)
-8\left(\frac{12}{5}\right)
&=\frac{64}{5}+\frac{32}{5}-\frac{96}{5} \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the coefficient of $e^{-2x}$:

$$
\begin{aligned}
3\left(\frac{52}{5}\right)
-2\left(\frac{26}{5}\right)
-8\left(\frac{13}{5}\right)
&=\frac{156}{5}-\frac{52}{5}-\frac{104}{5} \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both exponential coefficients are zero, so:

$$
3y''+2y'-8y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the initial values locally:

$$
\begin{aligned}
y(0)
&=\frac{12}{5}+\frac{13}{5}
=5, \\
y'(0)
&=\frac{16}{5}-\frac{26}{5}
=-2.
\end{aligned}
$$

The function satisfies both the equation and the initial conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### A Missing Middle Term {#a-missing-middle-term-18}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-16y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $y'$ is zero, so the characteristic equation is:

$$
r^2+0r-16=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Usually the zero term is omitted:

$$
r^2-16=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the difference of squares:

$$
(r-4)(r+4)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving $(r-4)(r+4)=0$ gives:

$$
r_1=4,
\qquad
r_2=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y=c_1e^{4x}+c_2e^{-4x}
}.
$$

Do not mistake a missing $y'$ term for a first-order equation. The $y''$ term
still makes the equation second-order.

```{=latex}
\Needspace{12\baselineskip}
```
### A Zero Characteristic Root {#a-zero-characteristic-root-19}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''+11y'=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $y$ is zero, so the characteristic equation is:

$$
r^2+11r=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $r$:

$$
r(r+11)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are:

$$
r_1=0,
\qquad
r_2=-11.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the distinct roots $r_1=0$ and $r_2=-11$, apply the distinct-root formula:

$$
y=c_1e^{0x}+c_2e^{-11x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{0x}=1$:

$$
\boxed{
y=c_1+c_2e^{-11x}
}.
$$

A zero root produces a constant solution direction. It must not be discarded.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-20}

```{=latex}
\Needspace{10\baselineskip}
```
If the characteristic equation has distinct real roots $r_1$ and $r_2$, then:

$$
\boxed{
y=c_1e^{r_1x}+c_2e^{r_2x}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two exponentials are independent because their Wronskian is:

$$
(r_2-r_1)e^{(r_1+r_2)x}\neq0.
$$

Apply initial conditions only after writing and differentiating the complete
two-constant family.

```{=latex}
\Needspace{20\baselineskip}
```
## One Repeated Real Root {#block-4-one-repeated-real-root}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-21}

```{=latex}
\Needspace{10\baselineskip}
```
The goal is to explain why a repeated root gives:

$$
y=(c_1+c_2x)e^{rx}
$$

```{=latex}
\Needspace{12\baselineskip}
```
rather than two copies of the same exponential.

```{=latex}
\Needspace{8\baselineskip}
```
> repeating a root does not make two copies of $e^{rx}$ independent; the
> missing direction is $xe^{rx}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Two Copies Do Not Work {#why-two-copies-do-not-work-22}

Suppose the characteristic equation has the repeated root $r=\rho$.

```{=latex}
\Needspace{10\baselineskip}
```
Writing:

$$
y=c_1e^{\rho x}+c_2e^{\rho x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
does not create a two-dimensional family. Combine the like terms:

$$
\begin{aligned}
y
&=(c_1+c_2)e^{\rho x} \\
&=Ce^{\rho x},
\end{aligned}
$$

where $C=c_1+c_2$ is just one arbitrary constant.

Both terms point in the same function direction. A second-order equation needs
a second independent solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Deriving The Missing Solution {#deriving-the-missing-solution-23}

```{=latex}
\Needspace{10\baselineskip}
```
A quadratic with repeated root $r=\rho$ can be written as:

$$
(r-\rho)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expanding gives:

$$
r^2-2\rho r+\rho^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding differential equation is:

$$
y''-2\rho y'+\rho^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
We already know that $e^{\rho x}$ is one solution. To search for another,
allow its multiplier to vary:

$$
y=v(x)e^{\rho x},
$$

where $v(x)$ is an unknown function.

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate using the product rule:

$$
\begin{aligned}
y'
&=v'e^{\rho x}+v\rho e^{\rho x} \\
&=e^{\rho x}(v'+\rho v).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again. Apply the product rule to
$e^{\rho x}(v'+\rho v)$:

$$
\begin{aligned}
y''
&=\rho e^{\rho x}(v'+\rho v)
+e^{\rho x}(v''+\rho v') \\
&=e^{\rho x}
\left(v''+2\rho v'+\rho^2v\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y$, $y'$, and $y''$ into
$y''-2\rho y'+\rho^2y=0$:

$$
\begin{aligned}
0
&=e^{\rho x}(v''+2\rho v'+\rho^2v) \\
&\quad-2\rho e^{\rho x}(v'+\rho v)
+\rho^2ve^{\rho x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^{\rho x}$:

$$
0=e^{\rho x}
\left[
v''+2\rho v'+\rho^2v
-2\rho v'-2\rho^2v
+\rho^2v
\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
The $v'$ terms and $v$ terms cancel:

$$
0=e^{\rho x}v''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{\rho x}\neq0$:

$$
v''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate once:

$$
v'=c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate again:

$$
v=c_1+c_2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this expression for $v$ into $y=ve^{\rho x}$:

$$
\boxed{
y=(c_1+c_2x)e^{\rho x}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two independent solution directions are therefore:

$$
e^{\rho x}
\qquad\text{and}\qquad
xe^{\rho x}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Checking Independence In The Repeated-Root Case {#checking-independence-in-the-repeated-root-case-24}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
y_1=e^{\rho x},
\qquad
y_2=xe^{\rho x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their derivatives are:

$$
y_1'=\rho e^{\rho x},
\qquad
y_2'=e^{\rho x}+\rho xe^{\rho x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Build the Wronskian:

$$
W[y_1,y_2]
=
\begin{vmatrix}
e^{\rho x} & xe^{\rho x} \\
\rho e^{\rho x} & e^{\rho x}+\rho xe^{\rho x}
\end{vmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the determinant:

$$
\begin{aligned}
W[y_1,y_2]
&=e^{\rho x}
\left(e^{\rho x}+\rho xe^{\rho x}\right)
-xe^{\rho x}\left(\rho e^{\rho x}\right) \\
&=e^{2\rho x}+\rho xe^{2\rho x}-\rho xe^{2\rho x} \\
&=e^{2\rho x}.
\end{aligned}
$$

Since $e^{2\rho x}\neq0$, the two functions are linearly independent.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Repeated-Root Initial-Value Problem {#a-complete-repeated-root-initial-value-problem-25}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+14y'+49y=0,
\qquad
y(0)=2,
\qquad
y'(0)=-1.
$$

#### Step 1: Write and factor the characteristic equation

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+14r+49=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the perfect square:

$$
(r+7)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the repeated root is:

$$
r=-7.
$$

#### Step 2: Write the repeated-root family

```{=latex}
\Needspace{10\baselineskip}
```
For a repeated root $r=-7$, use:

$$
y=(c_1+c_2x)e^{-7x}.
$$

#### Step 3: Differentiate using the product rule

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the product $(c_1+c_2x)e^{-7x}$:

$$
\begin{aligned}
y'
&=c_2e^{-7x}+(c_1+c_2x)(-7e^{-7x}) \\
&=e^{-7x}\left[c_2-7(c_1+c_2x)\right].
\end{aligned}
$$

#### Step 4: Apply $y(0)=2$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the function formula:

$$
2=(c_1+c_2(0))e^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=2.
$$

#### Step 5: Apply $y'(0)=-1$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the derivative formula:

$$
-1=e^0\left[c_2-7(c_1+c_2(0))\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $e^0=1$ and $c_1=2$:

$$
-1=c_2-7(2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-1=c_2-14.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $14$ to both sides:

$$
c_2=13.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=2$ and $c_2=13$ into the repeated-root family:

$$
\boxed{
y(x)=(2+13x)e^{-7x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verifying The Repeated-Root Solution {#verifying-the-repeated-root-solution-26}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y=(2+13x)e^{-7x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the first derivative is:

$$
\begin{aligned}
y'
&=13e^{-7x}-7(2+13x)e^{-7x} \\
&=(-1-91x)e^{-7x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $(-1-91x)e^{-7x}$ using the product rule:

$$
\begin{aligned}
y''
&=-91e^{-7x}-7(-1-91x)e^{-7x} \\
&=(-84+637x)e^{-7x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y''+14y'+49y$:

$$
\begin{aligned}
y''+14y'+49y
&=(-84+637x)e^{-7x} \\
&\quad+14(-1-91x)e^{-7x} \\
&\quad+49(2+13x)e^{-7x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^{-3x}$ and combine like terms:

$$
\begin{aligned}
y''+14y'+49y
&=e^{-7x}
\left[(-84+637x)+(-14-1274x)+(98+637x)\right] \\
&=e^{-7x}(0) \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial values are:

$$
y(0)=2,
\qquad
y'(0)=-1.
$$

Thus the selected function satisfies the full initial-value problem.

```{=latex}
\Needspace{12\baselineskip}
```
### The Special Case Of A Double Zero Root {#the-special-case-of-a-double-zero-root-27}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the scaled equation:

$$
7y''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its characteristic equation is:

$$
7r^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $7$:

$$
r^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated root is:

$$
r=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the repeated-root formula:

$$
y=(c_1+c_2x)e^{0x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{0x}=1$:

$$
\boxed{
y=c_1+c_2x
}.
$$

This agrees with first dividing $7y''=0$ by $7$ and then integrating twice.
The characteristic method has not created a different result; it has encoded
the same two constants in its root structure.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-28}

```{=latex}
\Needspace{10\baselineskip}
```
If the characteristic equation has a repeated real root $r=\rho$, then:

$$
\boxed{
y=(c_1+c_2x)e^{\rho x}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factor $x$ creates the second independent direction:

$$
e^{\rho x},
\qquad
xe^{\rho x}.
$$

It is required by the two-dimensional solution space, not added as a
memorisation device.

```{=latex}
\Needspace{20\baselineskip}
```
## Complex-Conjugate Roots And Real Solutions {#block-5-complex-conjugate-roots-and-real-solutions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-29}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to turn complex characteristic roots into a real two-function
basis involving sine and cosine.

```{=latex}
\Needspace{8\baselineskip}
```
> complex roots are an algebraic signal for oscillation; the final real
> solution does not require complex-valued constants or outputs.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Complex Roots Come In Pairs {#why-complex-roots-come-in-pairs-30}

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial:

$$
ar^2+br+c
$$

```{=latex}
\Needspace{10\baselineskip}
```
has real coefficients. If one root is:

$$
r_1=\alpha+i\beta,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then its complex conjugate is also a root:

$$
r_2=\alpha-i\beta.
$$

Here:

-   $\alpha$ is the real part
-   $\beta$ is the magnitude of the imaginary part
-   $i$ is the imaginary unit, with $i^2=-1$
-   $\beta\neq0$ in the genuinely complex case

```{=latex}
\Needspace{10\baselineskip}
```
The two formal exponential solutions are:

$$
e^{(\alpha+i\beta)x}
\qquad\text{and}\qquad
e^{(\alpha-i\beta)x}.
$$

We now convert these into real functions.

```{=latex}
\Needspace{12\baselineskip}
```
### Using Euler's Formula {#using-eulers-formula-31}

```{=latex}
\Needspace{10\baselineskip}
```
Euler's formula states:

$$
e^{i\theta}=\cos\theta+i\sin\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Start with the first complex exponential:

$$
e^{(\alpha+i\beta)x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the real and imaginary parts of the exponent:

$$
e^{(\alpha+i\beta)x}=e^{\alpha x+i\beta x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $e^{u+v}=e^ue^v$:

$$
e^{(\alpha+i\beta)x}=e^{\alpha x}e^{i\beta x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply Euler's formula with $\theta=\beta x$:

$$
e^{i\beta x}=\cos(\beta x)+i\sin(\beta x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting Euler's formula into $e^{\alpha x}e^{i\beta x}$ gives:

$$
e^{(\alpha+i\beta)x}
=e^{\alpha x}\cos(\beta x)
+i e^{\alpha x}\sin(\beta x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The real and imaginary parts are:

$$
y_1=e^{\alpha x}\cos(\beta x),
\qquad
y_2=e^{\alpha x}\sin(\beta x).
$$

For a real linear differential equation, both real functions are solutions.
They form the real basis we need.

```{=latex}
\Needspace{12\baselineskip}
```
### The Complex-Root Formula {#the-complex-root-formula-32}

```{=latex}
\Needspace{10\baselineskip}
```
If the characteristic roots are:

$$
r=\alpha\pm i\beta,
\qquad \beta>0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then the general real solution is:

$$
\boxed{
y=e^{\alpha x}
\left(c_1\cos(\beta x)+c_2\sin(\beta x)\right)
}.
$$

The formula has two distinct roles:

-   $e^{\alpha x}$ controls the amplitude envelope
-   $\cos(\beta x)$ and $\sin(\beta x)$ provide the oscillation

The constants $c_1$ and $c_2$ are real when a real-valued solution is wanted.

```{=latex}
\Needspace{12\baselineskip}
```
### Checking Independence Of The Real Basis {#checking-independence-of-the-real-basis-33}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
y_1=e^{\alpha x}\cos(\beta x),
\qquad
y_2=e^{\alpha x}\sin(\beta x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate both functions:

$$
\begin{aligned}
y_1'
&=e^{\alpha x}
\left(\alpha\cos(\beta x)-\beta\sin(\beta x)\right), \\
y_2'
&=e^{\alpha x}
\left(\alpha\sin(\beta x)+\beta\cos(\beta x)\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Build the Wronskian:

$$
W[y_1,y_2]=y_1y_2'-y_2y_1'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the four expressions:

$$
\begin{aligned}
W[y_1,y_2]
&=e^{2\alpha x}\cos(\beta x)
\left(\alpha\sin(\beta x)+\beta\cos(\beta x)\right) \\
&\quad-e^{2\alpha x}\sin(\beta x)
\left(\alpha\cos(\beta x)-\beta\sin(\beta x)\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^{2\alpha x}$ and expand:

$$
\begin{aligned}
W[y_1,y_2]
&=e^{2\alpha x}
\bigl[
\alpha\sin(\beta x)\cos(\beta x)
+\beta\cos^2(\beta x) \\
&\qquad
-\alpha\sin(\beta x)\cos(\beta x)
+\beta\sin^2(\beta x)
\bigr].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The terms containing $\alpha$ cancel. Use
$\sin^2(\beta x)+\cos^2(\beta x)=1$:

$$
\begin{aligned}
W[y_1,y_2]
&=\beta e^{2\alpha x}
\left(\cos^2(\beta x)+\sin^2(\beta x)\right) \\
&=\beta e^{2\alpha x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\beta>0$ and the exponential is never zero:

$$
W[y_1,y_2]\neq0.
$$

The real sine and cosine modes are linearly independent.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Complex-Root Initial-Value Problem {#a-complete-complex-root-initial-value-problem-34}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
2y''+4y'+10y=0,
\qquad
y(0)=3,
\qquad
y'(0)=-1.
$$

#### Step 1: Simplify the differential equation

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $2$:

$$
y''+2y'+5y=0.
$$

#### Step 2: Write the characteristic equation

```{=latex}
\Needspace{10\baselineskip}
```
The simplified equation gives:

$$
r^2+2r+5=0.
$$

#### Step 3: Calculate the roots

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula with $a=1$, $b=2$, and $c=5$:

$$
r=\frac{-2\pm\sqrt{2^2-4(1)(5)}}{2(1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the discriminant:

$$
\begin{aligned}
2^2-4(1)(5)
&=4-20 \\
&=-16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With discriminant $-16$, the quadratic formula becomes:

$$
r=\frac{-2\pm\sqrt{-16}}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $\sqrt{-16}=4i$:

$$
\begin{aligned}
r
&=\frac{-2\pm4i}{2} \\
&=-1\pm2i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\alpha=-1,
\qquad
\beta=2.
$$

#### Step 4: Write the real general solution

```{=latex}
\Needspace{10\baselineskip}
```
For roots $-1\pm2i$, use:

$$
\boxed{
y=e^{-x}\left(c_1\cos(2x)+c_2\sin(2x)\right)
}.
$$

#### Step 5: Differentiate the complete family

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
u(x)=c_1\cos(2x)+c_2\sin(2x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so that:

$$
y=e^{-x}u.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u$:

$$
u'=-2c_1\sin(2x)+2c_2\cos(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the product rule on $y=e^{-x}u$:

$$
\begin{aligned}
y'
&=-e^{-x}u+e^{-x}u' \\
&=e^{-x}(u'-u).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the expressions for $u$ and $u'$:

$$
\begin{aligned}
y'
&=e^{-x}
\bigl[
-2c_1\sin(2x)+2c_2\cos(2x) \\
&\qquad
-c_1\cos(2x)-c_2\sin(2x)
\bigr].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Group the cosine and sine terms:

$$
y'=e^{-x}
\left[
(-c_1+2c_2)\cos(2x)
+(-2c_1-c_2)\sin(2x)
\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply $y(0)=3$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the function formula:

$$
3=e^0\left(c_1\cos0+c_2\sin0\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $e^0=1$, $\cos0=1$, and $\sin0=0$:

$$
c_1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply $y'(0)=-1$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the grouped derivative formula:

$$
-1=e^0
\left[
(-c_1+2c_2)\cos0
+(-2c_1-c_2)\sin0
\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $e^0=1$, $\cos0=1$, $\sin0=0$, and $c_1=3$:

$$
-1=-3+2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $3$ to both sides:

$$
2=2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_2=1.
$$

#### Step 8: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Insert $c_1=3$ and $c_2=1$ into the general family:

$$
\boxed{
y(x)=e^{-x}\left(3\cos(2x)+\sin(2x)\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Short Verification Without Expanding Everything {#a-short-verification-without-expanding-everything-35}

```{=latex}
\Needspace{10\baselineskip}
```
For the selected solution, define:

$$
u=3\cos(2x)+\sin(2x),
\qquad
y=e^{-x}u.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivatives of $u$ are:

$$
\begin{aligned}
u'&=-6\sin(2x)+2\cos(2x), \\
u''&=-12\cos(2x)-4\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $y=e^{-x}u$:

$$
y'=e^{-x}(u'-u).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more:

$$
\begin{aligned}
y''
&=-e^{-x}(u'-u)+e^{-x}(u''-u') \\
&=e^{-x}(u''-2u'+u).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these forms into $y''+2y'+5y$:

$$
\begin{aligned}
y''+2y'+5y
&=e^{-x}(u''-2u'+u)
+2e^{-x}(u'-u)
+5e^{-x}u \\
&=e^{-x}(u''+4u).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate $u''+4u$:

$$
\begin{aligned}
u''+4u
&=(-12\cos(2x)-4\sin(2x)) \\
&\quad+4(3\cos(2x)+\sin(2x)) \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y''+2y'+5y=e^{-x}(0)=0.
$$

This grouped verification is shorter, but every substitution remains visible.

```{=latex}
\Needspace{12\baselineskip}
```
### Pure Oscillation As A Special Case {#pure-oscillation-as-a-special-case-36}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''+49y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+49=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $49$ to the other side:

$$
r^2=-49.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
r=\pm7i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
\alpha=0,
\qquad
\beta=7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complex-root formula gives:

$$
y=e^{0x}\left(c_1\cos(7x)+c_2\sin(7x)\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{0x}=1$:

$$
\boxed{
y=c_1\cos(7x)+c_2\sin(7x)
}.
$$

There is no exponential growth or decay envelope. The solutions oscillate
with constant amplitude.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-37}

```{=latex}
\Needspace{10\baselineskip}
```
If the characteristic roots are:

$$
r=\alpha\pm i\beta,
\qquad \beta>0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then the general real solution is:

$$
\boxed{
y=e^{\alpha x}
\left(c_1\cos(\beta x)+c_2\sin(\beta x)\right)
}.
$$

The real part $\alpha$ controls the amplitude envelope. The imaginary
magnitude $\beta$ controls the oscillation.

```{=latex}
\Needspace{20\baselineskip}
```
## Applying Conditions Without Losing The Method {#block-6-applying-conditions-without-losing-the-method}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-38}

The goal is to separate two tasks that learners often blend together:

1.  solve the differential equation to obtain a two-constant family
2.  use extra conditions to select one member of that family

The characteristic roots determine the family. The initial or boundary data
determine the constants.

```{=latex}
\Needspace{12\baselineskip}
```
### The Initial-Condition Workflow {#the-initial-condition-workflow-39}

```{=latex}
\Needspace{10\baselineskip}
```
For an initial-value problem:

$$
ay''+by'+cy=0,
\qquad
y(x_0)=Y_0,
\qquad
y'(x_0)=Y_1,
$$

use this order:

1.  solve the characteristic equation
2.  write the correct general solution for the root type
3.  differentiate the complete general solution
4.  substitute $x=x_0$ into the function formula
5.  substitute $x=x_0$ into the derivative formula
6.  solve the resulting two-equation system
7.  insert the constants into the family
8.  verify both the ODE and the initial values

Do not apply $y'(x_0)=Y_1$ to the original function formula. It belongs in the
derivative formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Conditions Away From Zero {#conditions-away-from-zero-40}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y=0,
\qquad
y(1)=3,
\qquad
y'(1)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation $r^2-4=0$ factors as:

$$
(r-2)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $r=2$ and $r=-2$, so:

$$
y=c_1e^{2x}+c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete family:

$$
y'=2c_1e^{2x}-2c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(1)=3$ to the function formula:

$$
c_1e^2+c_2e^{-2}=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(1)=2$ to the derivative formula:

$$
2c_1e^2-2c_2e^{-2}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide the second equation by $2$:

$$
c_1e^2-c_2e^{-2}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The local system is now:

$$
\begin{aligned}
c_1e^2+c_2e^{-2}&=3, \\
c_1e^2-c_2e^{-2}&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $c_1e^2+c_2e^{-2}=3$ and $c_1e^2-c_2e^{-2}=1$:

$$
2c_1e^2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2e^2$:

$$
c_1=2e^{-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the second equation from the first:

$$
2c_2e^{-2}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2e^{-2}$:

$$
c_2=e^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the constants into the family:

$$
y=2e^{-2}e^{2x}+e^2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine exponents using $e^ue^v=e^{u+v}$:

$$
\boxed{
y(x)=2e^{2(x-1)}+e^{-2(x-1)}
}.
$$

Writing the answer in terms of $x-1$ makes the initial location visible.

```{=latex}
\Needspace{12\baselineskip}
```
### Boundary Conditions Can Behave Differently {#boundary-conditions-can-behave-differently-41}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''+9y=0,
\qquad
y(0)=0,
\qquad
y\left(\frac{\pi}{3}\right)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+9=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so the roots are $r=\pm3i$ and the general solution is:

$$
y=c_1\cos(3x)+c_2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=0$:

$$
0=c_1\cos(0)+c_2\sin(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $\cos0=1$ and $\sin0=0$ gives:

$$
c_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The remaining family is:

$$
y=c_2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply $y(\pi/3)=0$:

$$
0=c_2\sin\left(3\cdot\frac{\pi}{3}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $3(\pi/3)=\pi$ and $\sin\pi=0$, this condition becomes:

$$
0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It places no restriction on $c_2$. Therefore every function:

$$
\boxed{
y=c_2\sin(3x)
}
$$

satisfies both boundary conditions.

This does not contradict initial-value uniqueness. The two conditions are
specified at different points, so this is a boundary-value problem and may
have no solution, one solution, or many solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### A Compact Condition Check {#a-compact-condition-check-42}

When a final solution has been found, verify it in two separate parts.

**Equation check**

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the derivatives and show:

$$
ay''+by'+cy=0.
$$

**Condition check**

Substitute the specified point or points and show the required values.

Passing only one check is not enough. A function may solve the differential
equation but fail the conditions, or satisfy the listed values while failing
the differential equation elsewhere.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-43}

The characteristic equation solves the differential equation. Conditions then
select constants from the resulting family.

For initial data, differentiate the complete family before substituting. For
boundary data, do not assume uniqueness merely because two conditions are
given.

```{=latex}
\Needspace{20\baselineskip}
```
## What The Roots Say About Behaviour {#block-7-what-the-roots-say-about-behaviour}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-44}

The goal is to read qualitative behaviour directly from the roots, without
solving for particular constants first.

```{=latex}
\Needspace{12\baselineskip}
```
### Real Roots: Growth And Decay Modes {#real-roots-growth-and-decay-modes-45}

```{=latex}
\Needspace{10\baselineskip}
```
For a real root $r$, the corresponding mode is:

$$
e^{rx}.
$$

As $x\to\infty$:

-   if $r<0$, then $e^{rx}\to0$
-   if $r=0$, then $e^{rx}=1$
-   if $r>0$, then $e^{rx}\to\infty$

```{=latex}
\Needspace{10\baselineskip}
```
For distinct real roots:

$$
y=c_1e^{r_1x}+c_2e^{r_2x},
$$

the long-term behaviour depends on which modes are present.

If both roots are negative, every solution tends to zero.

If one root is positive and the coefficient of its mode is nonzero, that
growing mode eventually dominates.

If a coefficient happens to be zero, its mode is absent. Root-based predictions
describe the available modes; the initial conditions determine which ones are
actually present.

```{=latex}
\Needspace{12\baselineskip}
```
### Repeated Roots: A Polynomial Factor Changes The Rate {#repeated-roots-a-polynomial-factor-changes-the-rate-46}

```{=latex}
\Needspace{10\baselineskip}
```
For repeated root $r=\rho$:

$$
y=(c_1+c_2x)e^{\rho x}.
$$

If $\rho<0$, both $e^{\rho x}$ and $xe^{\rho x}$ tend to zero as
$x\to\infty$. The factor $x$ slows the decay of the second mode relative to
the first, but exponential decay still wins in the long run.

If $\rho>0$, both modes grow, and $xe^{\rho x}$ grows faster than
$e^{\rho x}$.

```{=latex}
\Needspace{10\baselineskip}
```
If $\rho=0$, the family becomes:

$$
y=c_1+c_2x,
$$

so the solutions are straight lines rather than exponentials.

```{=latex}
\Needspace{12\baselineskip}
```
### Complex Roots: Envelope And Frequency {#complex-roots-envelope-and-frequency-47}

```{=latex}
\Needspace{10\baselineskip}
```
For roots:

$$
r=\alpha\pm i\beta,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the real solution is:

$$
y=e^{\alpha x}
\left(c_1\cos(\beta x)+c_2\sin(\beta x)\right).
$$

The real part $\alpha$ determines the envelope:

-   $\alpha<0$: oscillations decay
-   $\alpha=0$: oscillations keep constant amplitude
-   $\alpha>0$: oscillations grow

```{=latex}
\Needspace{10\baselineskip}
```
For roots $\alpha\pm i\beta$, the quantity $\beta$ is the angular frequency.
The period is:

$$
\boxed{
P=\frac{2\pi}{\beta}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example, roots $-2\pm5i$ produce decaying oscillations with period:

$$
P=\frac{2\pi}{5}.
$$

The number $-2$ controls decay; the number $5$ controls how rapidly the
oscillation repeats.

```{=latex}
\Needspace{12\baselineskip}
```
### Comparing Three Equations Before Solving Constants {#comparing-three-equations-before-solving-constants-48}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the three characteristic root sets:

$$
\begin{aligned}
\text{A:}&\quad -1,-4, \\
\text{B:}&\quad 2,-3, \\
\text{C:}&\quad -1\pm4i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For set A, both modes decay:

$$
y=c_1e^{-x}+c_2e^{-4x}.
$$

Every solution approaches zero as $x\to\infty$.

```{=latex}
\Needspace{10\baselineskip}
```
For set B, one mode grows and one decays:

$$
y=c_1e^{2x}+c_2e^{-3x}.
$$

Most solutions grow because the $e^{2x}$ mode dominates, but the special
solutions with $c_1=0$ decay.

```{=latex}
\Needspace{10\baselineskip}
```
For set C, the solutions oscillate inside a decaying envelope:

$$
y=e^{-x}\left(c_1\cos(4x)+c_2\sin(4x)\right).
$$

The three equations can therefore be distinguished qualitatively from their
roots before any initial values are supplied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-49}

Characteristic roots encode more than a formula:

-   the real part controls growth or decay
-   a nonzero imaginary part produces oscillation
-   the imaginary magnitude determines the period
-   repeated roots introduce an additional polynomial factor

Initial conditions decide which available modes appear in the selected
solution.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Workflow And Common Mistakes {#block-8-a-reliable-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Complete Workflow {#the-complete-workflow-50}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
ay''+by'+cy=0,
\qquad a\neq0,
$$

use the following sequence.

#### Step 1: Check the equation class

Confirm that the equation is second-order, linear, homogeneous, and has
constant coefficients.

#### Step 2: Write the characteristic equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
ar^2+br+c=0.
$$

Include zero coefficients mentally so missing derivative terms are handled
correctly.

#### Step 3: Solve and classify the roots

Factor when the factorisation is clear. Otherwise use the quadratic formula.
Decide whether the roots are distinct real, repeated real, or complex.

#### Step 4: Write the correct general family

Use the formula belonging to the root type, with two independent solution
directions and two arbitrary constants.

#### Step 5: Differentiate the full family

Do this before applying derivative conditions.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply one condition at a time

Keep the formula being used immediately above each substitution.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Solve the constant system visibly

Show the two equations and each elimination or substitution step.

#### Step 8: Verify the result

Check the differential equation and all extra conditions separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Writing The Wrong Polynomial {#common-mistake-writing-the-wrong-polynomial-51}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
4y''-3y'+7y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the equation $4y''-3y'+7y=0$, the characteristic equation is:

$$
4r^2-3r+7=0.
$$

The coefficients and signs must be carried across unchanged.

```{=latex}
\Needspace{10\baselineskip}
```
Do not write:

$$
r^2-3r+7=0,
$$

because that silently discards the coefficient $4$ multiplying $y''$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing A Zero Root {#common-mistake-losing-a-zero-root-52}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''+5y'=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the characteristic equation is:

$$
r^2+5r=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $r$:

$$
r(r+5)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
There are two roots:

$$
r=0
\qquad\text{and}\qquad
r=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the roots $r=0$ and $r=-5$, the zero root contributes $e^{0x}=1$, so:

$$
y=c_1+c_2e^{-5x}.
$$

Dividing the characteristic equation by $r$ would lose the valid root $r=0$
and one entire solution direction.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Duplicating A Repeated Mode {#common-mistake-duplicating-a-repeated-mode-53}

```{=latex}
\Needspace{10\baselineskip}
```
For a repeated root $r=\rho$, do not write:

$$
y=c_1e^{\rho x}+c_2e^{\rho x}.
$$

Those terms combine into one constant multiple of the same function.

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\boxed{
y=(c_1+c_2x)e^{\rho x}
}.
$$

The factor $x$ is what creates linear independence.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Mishandling Complex Roots {#common-mistake-mishandling-complex-roots-54}

```{=latex}
\Needspace{10\baselineskip}
```
If the roots are:

$$
r=-3\pm4i,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
\alpha=-3,
\qquad
\beta=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the roots $r=-3\pm4i$, the real solution is:

$$
y=e^{-3x}
\left(c_1\cos(4x)+c_2\sin(4x)\right).
$$

Do not place the real part inside the trigonometric functions, and do not use
the imaginary unit $i$ as the trigonometric frequency.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Applying The Method Outside Its Scope {#common-mistake-applying-the-method-outside-its-scope-55}

The characteristic equation in this chapter is not a universal ODE method.

```{=latex}
\Needspace{10\baselineskip}
```
It does not directly solve:

$$
y''+xy=0
$$

because the coefficient of $y$ depends on $x$.

```{=latex}
\Needspace{10\baselineskip}
```
It does not by itself give the complete solution of:

$$
y''+y=x
$$

because the equation is nonhomogeneous.

```{=latex}
\Needspace{10\baselineskip}
```
It also does not apply unchanged to:

$$
y''+(y')^2+y=0
$$

because the equation is nonlinear.

Classification is the first step of the method, not an optional label added
afterward.

```{=latex}
\Needspace{12\baselineskip}
```
### A Compact Formula Map {#a-compact-formula-map-56}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
ay''+by'+cy=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
solve:

$$
ar^2+br+c=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then use:

$$
\boxed{
\begin{array}{ll}
r_1\neq r_2\in\mathbb R:
&y=c_1e^{r_1x}+c_2e^{r_2x}, \\
\\
r_1=r_2=\rho:
&y=(c_1+c_2x)e^{\rho x}, \\
\\
r=\alpha\pm i\beta:
&y=e^{\alpha x}
(c_1\cos\beta x+c_2\sin\beta x).
\end{array}
}
$$

The formula map is useful for revision only after the reasoning behind all
three rows is understood.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-57}

```{=latex}
\Needspace{10\baselineskip}
```
The dependable sequence is:

$$
\boxed{
\text{classify}
\longrightarrow
\text{characteristic equation}
\longrightarrow
\text{roots}
\longrightarrow
\text{general family}
\longrightarrow
\text{conditions}
\longrightarrow
\text{verification}
}.
$$

Most errors come from skipping one of these decisions or using a root formula
before the root type has been established.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-9-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-58}

#### Problem 1: Build And Classify Characteristic Equations

```{=latex}
\Needspace{10\baselineskip}
```
For each equation, write the characteristic equation and classify its roots.
Do not solve for arbitrary constants.

$$
\begin{aligned}
\text{(a)}&\quad y''-3y'-10y=0, \\
\text{(b)}&\quad 4y''+12y'+9y=0, \\
\text{(c)}&\quad y''+6y'+13y=0.
\end{aligned}
$$

#### Problem 2: Solve A Distinct-Root Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
2y''+y'-3y=0.
$$

#### Problem 3: Handle A Missing Middle Term

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
y''-25y=0.
$$

#### Problem 4: Solve A Repeated-Root Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
4y''+12y'+9y=0.
$$

#### Problem 5: Solve A Pure Oscillation Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
y''+36y=0.
$$

State the period of every nonzero solution.

#### Problem 6: Solve A Damped Oscillation Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the general real solution of:

$$
y''+8y'+20y=0.
$$

Identify the exponential envelope and the oscillation period.

#### Problem 7: Distinct Roots With Initial Data

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'-8y=0,
\qquad
y(0)=1,
\qquad
y'(0)=6.
$$

#### Problem 8: Repeated Root With Initial Data

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y'+4y=0,
\qquad
y(0)=2,
\qquad
y'(0)=1.
$$

#### Problem 9: Complex Roots With Initial Data

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'+10y=0,
\qquad
y(0)=4,
\qquad
y'(0)=2.
$$

#### Problem 10: Reverse Engineer The Differential Equation

```{=latex}
\Needspace{10\baselineskip}
```
Construct a monic second-order homogeneous constant-coefficient equation whose
characteristic roots are:

$$
r=3
\qquad\text{and}\qquad
r=-5.
$$

Then write its general solution.

#### Problem 11: Verify The Repeated-Root Basis

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''+12y'+36y=0,
$$

verify that $e^{-6x}$ and $xe^{-6x}$ are solutions and calculate their
Wronskian.

#### Problem 12: Diagnose An Invalid Method

```{=latex}
\Needspace{10\baselineskip}
```
A student treats:

$$
xy''+y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
as if it had characteristic equation:

$$
xr^2+1=0.
$$

Explain why this is not a valid constant-coefficient characteristic equation.

#### Problem 13: Read Behaviour From Roots

```{=latex}
\Needspace{10\baselineskip}
```
Without solving for any constants, describe the possible long-term behaviour
for each root set as $x\to\infty$:

$$
\begin{aligned}
\text{(a)}&\quad -2,-7, \\
\text{(b)}&\quad 1,-4, \\
\text{(c)}&\quad -3\pm2i, \\
\text{(d)}&\quad 2\pm6i.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 7 {#worked-answers-problems-1-to-7-59}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
For part (a), start from:

$$
y''-3y'-10y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-3r-10=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the characteristic polynomial $r^2-3r-10$:

$$
(r-5)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
r=5
\qquad\text{or}\qquad
r=-2.
$$

These are two distinct real roots.

```{=latex}
\Needspace{10\baselineskip}
```
For part (b), start from:

$$
4y''+12y'+9y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
4r^2+12r+9=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the perfect square:

$$
(2r+3)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
r=-\frac32
$$

is a repeated real root.

```{=latex}
\Needspace{10\baselineskip}
```
For part (c), start from:

$$
y''+6y'+13y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y''+6y'+13y=0$, the characteristic equation is:

$$
r^2+6r+13=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the discriminant:

$$
\begin{aligned}
\Delta
&=6^2-4(1)(13) \\
&=36-52 \\
&=-16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta<0$, the roots are complex. Calculate them:

$$
\begin{aligned}
r
&=\frac{-6\pm\sqrt{-16}}{2} \\
&=\frac{-6\pm4i}{2} \\
&=-3\pm2i.
\end{aligned}
$$

Thus part (c) has a complex-conjugate pair.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
2y''+y'-3y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
2r^2+r-3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(2r+3)(r-1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $(2r+3)(r-1)=0$, set each factor equal to zero:

$$
2r+3=0
\qquad\text{or}\qquad
r-1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distinct real roots are:

$$
r_1=-\frac32,
\qquad
r_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the general solution is:

$$
\boxed{
y=c_1e^{-3x/2}+c_2e^x
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-25y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The missing $y'$ term has coefficient zero, so the characteristic equation is:

$$
r^2-25=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the difference of squares:

$$
(r-5)(r+5)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distinct real roots are:

$$
r_1=5,
\qquad
r_2=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the distinct roots $r_1=5$ and $r_2=-5$, the general solution is:

$$
\boxed{
y=c_1e^{5x}+c_2e^{-5x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
4y''+12y'+9y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
4r^2+12r+9=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(2r+3)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated root is:

$$
r=-\frac32.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a repeated root $r=\rho$, the solution is
$(c_1+c_2x)e^{\rho x}$. Substitute $\rho=-3/2$:

$$
\boxed{
y=(c_1+c_2x)e^{-3x/2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+36y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y''+36y=0$, the characteristic equation is:

$$
r^2+36=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
r^2=-36,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
r=\pm6i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $\alpha=0$ and $\beta=6$. The general real solution is:

$$
\boxed{
y=c_1\cos(6x)+c_2\sin(6x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $P=2\pi/\beta$ with $\beta=6$:

$$
\begin{aligned}
P
&=\frac{2\pi}{6} \\
&=\frac{\pi}{3}.
\end{aligned}
$$

Every nonzero solution has period $\pi/3$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+8y'+20y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y''+8y'+20y=0$, the characteristic equation is:

$$
r^2+8r+20=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula:

$$
r=\frac{-8\pm\sqrt{8^2-4(1)(20)}}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the discriminant:

$$
\begin{aligned}
8^2-4(1)(20)
&=64-80 \\
&=-16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
r
&=\frac{-8\pm4i}{2} \\
&=-4\pm2i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general real solution is:

$$
\boxed{
y=e^{-4x}\left(c_1\cos(2x)+c_2\sin(2x)\right)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential envelope is $e^{-4x}$, so the oscillation decays. The angular
frequency is $\beta=2$, so the period is:

$$
P=\frac{2\pi}{2}=\pi.
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
y''+2y'-8y=0,
\qquad
y(0)=1,
\qquad
y'(0)=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+2r-8=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)(r+4)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distinct real roots are:

$$
r_1=2,
\qquad
r_2=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
y=c_1e^{2x}+c_2e^{-4x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete family:

$$
y'=2c_1e^{2x}-4c_2e^{-4x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=1$:

$$
1=c_1+c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=6$:

$$
6=2c_1-4c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $c_1+c_2=1$, write:

$$
c_1=1-c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into $2c_1-4c_2=6$:

$$
2(1-c_2)-4c_2=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute and combine:

$$
2-6c_2=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2$:

$$
-6c_2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-6$:

$$
c_2=-\frac23.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_2=-2/3$ into $c_1=1-c_2$:

$$
\begin{aligned}
c_1
&=1-\left(-\frac23\right) \\
&=\frac53.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $c_1=5/3$ and $c_2=-2/3$, the selected solution is:

$$
\boxed{
y(x)=\frac53e^{2x}-\frac23e^{-4x}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the initial values:

$$
\begin{aligned}
y(0)&=\frac53-\frac23=1, \\
y'(0)&=2\left(\frac53\right)-4\left(-\frac23\right)=6.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 8 To 13 {#worked-answers-problems-8-to-13-60}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y'+4y=0,
\qquad
y(0)=2,
\qquad
y'(0)=1.
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
Factor the perfect square:

$$
(r-2)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated root is:

$$
r=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the repeated root $r=2$, the repeated-root family is:

$$
y=(c_1+c_2x)e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate using the product rule:

$$
\begin{aligned}
y'
&=c_2e^{2x}+2(c_1+c_2x)e^{2x} \\
&=e^{2x}\left[c_2+2(c_1+c_2x)\right].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=2$ to the function formula:

$$
2=(c_1+c_2(0))e^0.
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
Apply $y'(0)=1$ to the derivative formula:

$$
1=e^0\left[c_2+2(c_1+c_2(0))\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $c_1=2$:

$$
1=c_2+4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $4$:

$$
c_2=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $c_1=2$ and $c_2=-3$, the selected solution is:

$$
\boxed{
y(x)=(2-3x)e^{2x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'+10y=0,
\qquad
y(0)=4,
\qquad
y'(0)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+2r+10=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula:

$$
r=\frac{-2\pm\sqrt{2^2-4(1)(10)}}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the discriminant:

$$
\begin{aligned}
2^2-4(1)(10)
&=4-40 \\
&=-36.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
r
&=\frac{-2\pm6i}{2} \\
&=-1\pm3i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For roots $r=-1\pm3i$, the real general solution is:

$$
y=e^{-x}\left(c_1\cos(3x)+c_2\sin(3x)\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete family. Using the product rule gives:

$$
\begin{aligned}
y'
&=e^{-x}
\left[-3c_1\sin(3x)+3c_2\cos(3x)\right] \\
&\quad-e^{-x}
\left[c_1\cos(3x)+c_2\sin(3x)\right].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=4$:

$$
4=e^0(c_1\cos0+c_2\sin0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$, the derivative formula becomes:

$$
y'(0)=3c_2-c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=2$ and $c_1=4$:

$$
2=3c_2-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $4$:

$$
6=3c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide $6=3c_2$ by $3$:

$$
c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{
y(x)=e^{-x}\left(4\cos(3x)+2\sin(3x)\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The required roots are:

$$
r=3
\qquad\text{and}\qquad
r=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A polynomial with these roots is obtained from the factors:

$$
(r-3)(r+5)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
\begin{aligned}
(r-3)(r+5)
&=r^2+5r-3r-15 \\
&=r^2+2r-15.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The monic characteristic equation is:

$$
r^2+2r-15=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $r^2$, $r$, and $1$ by $y''$, $y'$, and $y$ respectively. The
corresponding differential equation is:

$$
\boxed{
y''+2y'-15y=0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the roots $3$ and $-5$ are distinct and real, the general solution is:

$$
\boxed{
y=c_1e^{3x}+c_2e^{-5x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''+12y'+36y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
let:

$$
y_1=e^{-6x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its derivatives are:

$$
y_1'=-6e^{-6x},
\qquad
y_1''=36e^{-6x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the differential operator:

$$
\begin{aligned}
y_1''+12y_1'+36y_1
&=36e^{-6x}+12(-6e^{-6x})+36e^{-6x} \\
&=(36-72+36)e^{-6x} \\
&=0.
\end{aligned}
$$

Thus $y_1=e^{-6x}$ is a solution.

```{=latex}
\Needspace{10\baselineskip}
```
Now let:

$$
y_2=xe^{-6x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_2=xe^{-6x}$, differentiate using the product rule:

$$
\begin{aligned}
y_2'
&=e^{-6x}-6xe^{-6x} \\
&=(1-6x)e^{-6x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\begin{aligned}
y_2''
&=-6e^{-6x}-6(1-6x)e^{-6x} \\
&=(36x-12)e^{-6x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_2$, $y_2'$, and $y_2''$ into the operator:

$$
\begin{aligned}
y_2''+12y_2'+36y_2
&=(36x-12)e^{-6x} \\
&\quad+12(1-6x)e^{-6x} \\
&\quad+36xe^{-6x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^{-6x}$ and combine:

$$
\begin{aligned}
y_2''+12y_2'+36y_2
&=e^{-6x}\left[(36x-12)+(12-72x)+36x\right] \\
&=0.
\end{aligned}
$$

Thus $y_2=xe^{-6x}$ is also a solution.

```{=latex}
\Needspace{10\baselineskip}
```
Build the Wronskian from the functions and first derivatives:

$$
W[y_1,y_2]
=
\begin{vmatrix}
e^{-6x} & xe^{-6x} \\
-6e^{-6x} & (1-6x)e^{-6x}
\end{vmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
\begin{aligned}
W[y_1,y_2]
&=e^{-6x}(1-6x)e^{-6x}
-xe^{-6x}(-6e^{-6x}) \\
&=(1-6x)e^{-12x}+6xe^{-12x} \\
&=e^{-12x}.
\end{aligned}
$$

Since $e^{-12x}\neq0$, the two solutions are linearly independent.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The equation is:

$$
xy''+y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its leading coefficient is $x$, which is not constant. Therefore the equation
is outside the constant-coefficient class:

$$
ay''+by'+cy=0
$$

with fixed numbers $a$, $b$, and $c$.

```{=latex}
\Needspace{10\baselineskip}
```
To see the failure directly, try $y=e^{rx}$. Then:

$$
y''=r^2e^{rx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $xy''+y=0$:

$$
x(r^2e^{rx})+e^{rx}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out the nonzero exponential:

$$
e^{rx}(xr^2+1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This leaves:

$$
xr^2+1=0.
$$

The expression still depends on $x$, so it is not a polynomial equation for
one constant $r$. Solving it as $r=\pm i/\sqrt{x}$ would make $r$ vary with
$x$, contradicting the original trial $y=e^{rx}$ with constant $r$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 13

```{=latex}
\Needspace{10\baselineskip}
```
For part (a), the roots are $-2$ and $-7$. The general shape is:

$$
y=c_1e^{-2x}+c_2e^{-7x}.
$$

Both modes decay, so every solution tends to zero as $x\to\infty$.

```{=latex}
\Needspace{10\baselineskip}
```
For part (b), the roots are $1$ and $-4$. The general shape is:

$$
y=c_1e^x+c_2e^{-4x}.
$$

If $c_1\neq0$, the growing mode $e^x$ dominates. If $c_1=0$, the selected
solution contains only the decaying mode and tends to zero.

```{=latex}
\Needspace{10\baselineskip}
```
For part (c), the roots are $-3\pm2i$. The general shape is:

$$
y=e^{-3x}\left(c_1\cos(2x)+c_2\sin(2x)\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solutions oscillate inside a decaying envelope. Their period is:

$$
P=\frac{2\pi}{2}=\pi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For part (d), the roots are $2\pm6i$. The general shape is:

$$
y=e^{2x}\left(c_1\cos(6x)+c_2\sin(6x)\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Nonzero solutions oscillate inside a growing envelope. Their period is:

$$
P=\frac{2\pi}{6}=\frac{\pi}{3}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 9 Final Summary {#chapter-9-final-summary-61}

```{=latex}
\Needspace{10\baselineskip}
```
For a second-order linear homogeneous equation with constant coefficients:

$$
ay''+by'+cy=0,
\qquad a\neq0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the exponential trial $y=e^{rx}$ produces the characteristic equation:

$$
ar^2+br+c=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The root type determines the real solution family:

$$
\begin{aligned}
r_1\neq r_2\in\mathbb R
&\quad\Longrightarrow\quad
y=c_1e^{r_1x}+c_2e^{r_2x}, \\
r_1=r_2=\rho
&\quad\Longrightarrow\quad
y=(c_1+c_2x)e^{\rho x}, \\
r=\alpha\pm i\beta
&\quad\Longrightarrow\quad
y=e^{\alpha x}
\left(c_1\cos(\beta x)+c_2\sin(\beta x)\right).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's final lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> derive the polynomial, let the roots choose the basis, keep both independent
> solution directions, and apply conditions only after the complete family has
> been written and differentiated.
