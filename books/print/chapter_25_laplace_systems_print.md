```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 25}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Laplace System Methods}
```
# Chapter 25 - Laplace System Methods

Chapter 24 used Laplace transforms to turn one differential-equation
initial-value problem into an algebraic equation for one unknown transform.
The same idea extends to coupled systems: one transform is introduced for
each unknown function, producing simultaneous algebraic equations.

This chapter develops that extension carefully. We will:

-   transform two- and three-variable systems term by term
-   solve the transformed equations by elimination and Cramer's rule
-   handle homogeneous, forced, oscillatory, and delayed systems
-   treat triangular, fully coupled, mixed-order, and algebraic-differential
    systems
-   connect the scalar calculations with the matrix expression
    $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$

```{=latex}
\Needspace{20\baselineskip}
```
## From A Differential System To An Algebraic System {#block-1-from-a-differential-system-to-an-algebraic-system}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to see exactly how a coupled system in time becomes a simultaneous
system in the transform variable $s$.

```{=latex}
\Needspace{8\baselineskip}
```
> one unknown function produces one unknown transform; coupling remains as
> coupling, but differentiation disappears.

```{=latex}
\Needspace{12\baselineskip}
```
### Notation For Two Unknown Functions {#notation-for-two-unknown-functions-2}

```{=latex}
\Needspace{10\baselineskip}
```
Let $u(t)$ and $v(t)$ be unknown functions. Define:

$$
U(s)=\mathcal{L}\{u(t)\},
\qquad
V(s)=\mathcal{L}\{v(t)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their first derivatives transform as:

$$
\begin{aligned}
\mathcal{L}\{u'(t)\}
&=sU(s)-u(0),\\
\mathcal{L}\{v'(t)\}
&=sV(s)-v(0).
\end{aligned}
$$

The capital letters $U$ and $V$ are functions of $s$. They are not constants
and must be solved for simultaneously.

```{=latex}
\Needspace{12\baselineskip}
```
### A General Two-Variable System {#a-general-two-variable-system-3}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\begin{aligned}
u'&=a_{11}u+a_{12}v+f(t),\\
v'&=a_{21}u+a_{22}v+g(t),
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(0)=u_0,
\qquad
v(0)=v_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
F(s)=\mathcal{L}\{f(t)\},
\qquad
G(s)=\mathcal{L}\{g(t)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first differential equation:

$$
sU-u_0=a_{11}U+a_{12}V+F.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the unknown-transform terms to the left:

$$
(s-a_{11})U-a_{12}V=u_0+F.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second differential equation:

$$
sV-v_0=a_{21}U+a_{22}V+G.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move its unknown-transform terms to the left:

$$
-a_{21}U+(s-a_{22})V=v_0+G.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed system is therefore:

$$
\boxed{
\begin{aligned}
(s-a_{11})U-a_{12}V&=u_0+F,\\
-a_{21}U+(s-a_{22})V&=v_0+G.
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### What Has Changed And What Has Not {#what-has-changed-and-what-has-not-4}

Before transformation, $u$ and $v$ are linked by derivatives. After
transformation, $U$ and $V$ are linked by simultaneous algebraic equations.

The coupling coefficients remain visible. For example, the term $a_{12}v$
becomes $a_{12}V$; it does not disappear.

```{=latex}
\Needspace{10\baselineskip}
```
The key change is:

$$
u'\quad\longrightarrow\quad sU-u(0),
\qquad
v'\quad\longrightarrow\quad sV-v(0).
$$

Initial values become part of the algebraic right sides.

```{=latex}
\Needspace{12\baselineskip}
```
### The Seven-Step Workflow {#the-seven-step-workflow-5}

For a coupled initial-value problem:

1.  Define one transform for each unknown function.
2.  Transform every differential equation independently.
3.  Insert each initial value into the derivative where it belongs.
4.  Move all unknown transforms to the left side.
5.  Solve the simultaneous algebraic system.
6.  Prepare each transform for inversion.
7.  Invert and verify every component.

Preserve the same unknown order in every equation. If the order is $U,V$ in
the first row, keep $U,V$ in every row and in every determinant.

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Setup Check {#a-small-setup-check-6}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
u'-2u+3v=t,
\qquad
u(0)=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the derivative and the forcing:

$$
[sU-u(0)]-2U+3V=\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $u(0)=-1$ with parentheses:

$$
sU-(-1)-2U+3V=\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Remove the double negative and collect $U$:

$$
\boxed{(s-2)U+3V=\frac1{s^2}-1}.
$$

The value $v(0)$ does not appear here because this equation contains $v$, not
$v'$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

Transform each row separately, insert only the initial values associated with
derivatives in that row, and arrange every equation in one consistent unknown
order. The result is a simultaneous algebra problem for the transforms.

```{=latex}
\Needspace{20\baselineskip}
```
## Solving A Two-Variable System By Elimination {#block-2-solving-a-two-variable-system-by-elimination}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to solve a complete coupled initial-value problem while showing
every elimination and partial-fraction step.

```{=latex}
\Needspace{12\baselineskip}
```
### The Initial-Value Problem {#the-initial-value-problem-9}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
u'&=2u+v,\\
v'&=u+2v,
\end{aligned}
\qquad
u(0)=3,
\qquad
v(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
U(s)=\mathcal{L}\{u(t)\},
\qquad
V(s)=\mathcal{L}\{v(t)\}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Transform Both Equations {#transform-both-equations-10}

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation $u'=2u+v$:

$$
sU-u(0)=2U+V.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $u(0)=3$ and move the transform terms to the left:

$$
\boxed{(s-2)U-V=3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation $v'=u+2v$:

$$
sV-v(0)=U+2V.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $v(0)=1$ and arrange the unknowns in the order $U,V$:

$$
\boxed{-U+(s-2)V=1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete transformed system is:

$$
\begin{aligned}
(s-2)U-V&=3,\\
-U+(s-2)V&=1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Eliminate V To Find U {#eliminate-v-to-find-u-11}

```{=latex}
\Needspace{10\baselineskip}
```
Solve the first transformed equation for $V$:

$$
\begin{aligned}
(s-2)U-V&=3,\\
-V&=3-(s-2)U,\\
V&=(s-2)U-3.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this expression into the second transformed equation:

$$
-U+(s-2)[(s-2)U-3]=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the product:

$$
-U+(s-2)^2U-3(s-2)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $U$ on the left and move $-3(s-2)$ to the right:

$$
[(s-2)^2-1]U=1+3(s-2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the right side:

$$
1+3(s-2)=1+3s-6=3s-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the coefficient of $U$ as a difference of squares:

$$
\begin{aligned}
(s-2)^2-1
&=[(s-2)-1][(s-2)+1]\\
&=(s-3)(s-1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide to isolate $U$:

$$
U=\frac{3s-5}{(s-3)(s-1)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Decompose And Invert U {#decompose-and-invert-u-12}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\frac{3s-5}{(s-3)(s-1)}
=\frac A{s-3}+\frac B{s-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $(s-3)(s-1)$:

$$
3s-5=A(s-1)+B(s-3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=3$. The term containing $B$ vanishes:

$$
9-5=A(2),
\qquad
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=1$. The term containing $A$ vanishes:

$$
3-5=B(-2),
\qquad
B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting $A=2$ and $B=1$ into the decomposition gives:

$$
U=\frac2{s-3}+\frac1{s-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert both terms:

$$
\boxed{u(t)=2e^{3t}+e^t}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Recover V Without Skipping Algebra {#recover-v-without-skipping-algebra-13}

```{=latex}
\Needspace{10\baselineskip}
```
Return to the local relation:

$$
V=(s-2)U-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the unreduced rational form for $U$:

$$
V
=(s-2)\frac{3s-5}{(s-3)(s-1)}-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Put both terms over the common denominator $(s-3)(s-1)$:

$$
V
=\frac{(s-2)(3s-5)-3(s-3)(s-1)}{(s-3)(s-1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the first product:

$$
(s-2)(3s-5)=3s^2-11s+10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the second product:

$$
3(s-3)(s-1)=3(s^2-4s+3)=3s^2-12s+9.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the two numerators:

$$
(3s^2-11s+10)-(3s^2-12s+9)=s+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The numerator subtraction reduces the recovered transform to:

$$
V=\frac{s+1}{(s-3)(s-1)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Decompose And Invert V {#decompose-and-invert-v-14}

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
\frac{s+1}{(s-3)(s-1)}
=\frac C{s-3}+\frac D{s-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by the denominator:

$$
s+1=C(s-1)+D(s-3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=3$:

$$
4=2C,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=1$:

$$
2=-2D,
\qquad
D=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inverse transform is:

$$
\boxed{v(t)=2e^{3t}-e^t}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Coupled Solution {#verify-the-coupled-solution-15}

```{=latex}
\Needspace{10\baselineskip}
```
Check the initial values:

$$
\begin{aligned}
u(0)&=2+1=3,\\
v(0)&=2-1=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate both components:

$$
\begin{aligned}
u'(t)&=6e^{3t}+e^t,\\
v'(t)&=6e^{3t}-e^t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the first equation:

$$
\begin{aligned}
2u+v
&=2(2e^{3t}+e^t)+(2e^{3t}-e^t)\\
&=6e^{3t}+e^t\\
&=u'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the second equation:

$$
\begin{aligned}
u+2v
&=(2e^{3t}+e^t)+2(2e^{3t}-e^t)\\
&=6e^{3t}-e^t\\
&=v'.
\end{aligned}
$$

Both functions must be checked because the original problem contains two
differential equations.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-16}

Elimination works exactly as it does for ordinary simultaneous equations,
except that the coefficients are functions of $s$. After one transform is
found, recover the other with a locally restated equation and simplify it
before attempting inversion.

```{=latex}
\Needspace{20\baselineskip}
```
## Determinants And An Oscillatory System {#block-3-determinants-and-an-oscillatory-system}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-17}

The goal is to solve transformed systems systematically with determinants and
to connect the resulting quadratic denominator with oscillation.

```{=latex}
\Needspace{12\baselineskip}
```
### Cramer's Rule For Two Unknown Transforms {#cramers-rule-for-two-unknown-transforms-18}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\begin{aligned}
aU+bV&=p,\\
cU+dV&=q,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
the coefficient determinant is:

$$
\Delta=\begin{vmatrix}a&b\\c&d\end{vmatrix}=ad-bc.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $\Delta\neq0$, replace the $U$ column by the right side to obtain:

$$
\boxed{
U=\frac{\begin{vmatrix}p&b\\q&d\end{vmatrix}}{\Delta}
=\frac{pd-bq}{\Delta}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the $V$ column by the right side to obtain:

$$
\boxed{
V=\frac{\begin{vmatrix}a&p\\c&q\end{vmatrix}}{\Delta}
=\frac{aq-cp}{\Delta}
}.
$$

The column order is not negotiable. The first column always belongs to $U$,
and the second always belongs to $V$.

```{=latex}
\Needspace{12\baselineskip}
```
### An Oscillatory Initial-Value Problem {#an-oscillatory-initial-value-problem-19}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=-4x,
\end{aligned}
\qquad
x(0)=2,
\qquad
y(0)=1.
$$

Define $X(s)=\mathcal{L}\{x(t)\}$ and
$Y(s)=\mathcal{L}\{y(t)\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform $x'=y$:

$$
sX-2=Y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
which becomes:

$$
sX-Y=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $y'=-4x$:

$$
sY-1=-4X,
$$

```{=latex}
\Needspace{10\baselineskip}
```
which becomes:

$$
4X+sY=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient system is:

$$
\begin{bmatrix}
s&-1\\
4&s
\end{bmatrix}
\begin{bmatrix}X\\Y\end{bmatrix}
=
\begin{bmatrix}2\\1\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Calculate X With Cramer's Rule {#calculate-x-with-cramers-rule-20}

```{=latex}
\Needspace{10\baselineskip}
```
First calculate the coefficient determinant:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s&-1\\4&s\end{vmatrix}\\
&=s(s)-(-1)(4)\\
&=s^2+4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the first column by the right side:

$$
\begin{aligned}
\Delta_X
&=\begin{vmatrix}2&-1\\1&s\end{vmatrix}\\
&=2s-(-1)(1)\\
&=2s+1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $\Delta$:

$$
X=\frac{2s+1}{s^2+4}
=2\frac{s}{s^2+4}+\frac1{s^2+4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the cosine and sine transform pairs:

$$
\boxed{x(t)=2\cos(2t)+\frac12\sin(2t)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Calculate Y With Cramer's Rule {#calculate-y-with-cramers-rule-21}

```{=latex}
\Needspace{10\baselineskip}
```
Replace the second column by the right side:

$$
\begin{aligned}
\Delta_Y
&=\begin{vmatrix}s&2\\4&1\end{vmatrix}\\
&=s(1)-2(4)\\
&=s-8.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by the same coefficient determinant:

$$
Y=\frac{s-8}{s^2+4}
=\frac{s}{s^2+4}-4\frac2{s^2+4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{y(t)=\cos(2t)-4\sin(2t)}.
$$

The same denominator $s^2+4$ appears in both transforms because both state
components belong to the same coupled motion.

```{=latex}
\Needspace{12\baselineskip}
```
### Use The First Equation As A Fast Check {#use-the-first-equation-as-a-fast-check-22}

```{=latex}
\Needspace{10\baselineskip}
```
The first differential equation says $x'=y$. Differentiate the calculated
$x(t)$:

$$
\begin{aligned}
x'(t)
&=\frac{d}{dt}\left[2\cos(2t)+\frac12\sin(2t)\right]\\
&=-4\sin(2t)+\cos(2t)\\
&=y(t).
\end{aligned}
$$

The relation between the components provides a shorter verification than
substituting both into every equation from scratch.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-23}

Cramer's rule gives each transform from the same coefficient determinant.
Linear factors in that determinant create exponential modes; irreducible
quadratic factors create sine and cosine modes.

```{=latex}
\Needspace{20\baselineskip}
```
## Forced And Delayed Systems {#block-4-forced-and-delayed-systems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-24}

The goal is to track ordinary and delayed forcing through a coupled transform
calculation without losing which equation receives the input.

```{=latex}
\Needspace{12\baselineskip}
```
### A Constant-Forced System {#a-constant-forced-system-25}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
u'&=-u+v+2,\\
v'&=u-v,
\end{aligned}
\qquad
u(0)=0,
\qquad
v(0)=1.
$$

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation:

$$
sU-0=-U+V+\frac2s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $U$ and $V$ to the left:

$$
(s+1)U-V=\frac2s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation:

$$
sV-1=U-V.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the transform terms to the left:

$$
-U+(s+1)V=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed system is:

$$
\begin{aligned}
(s+1)U-V&=\frac2s,\\
-U+(s+1)V&=1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Find U From The Forced System {#find-u-from-the-forced-system-26}

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s+1&-1\\-1&s+1\end{vmatrix}\\
&=(s+1)^2-1\\
&=s^2+2s\\
&=s(s+2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the first column by the right side:

$$
\begin{aligned}
\Delta_U
&=\begin{vmatrix}\frac2s&-1\\1&s+1\end{vmatrix}\\
&=\frac{2(s+1)}s+1\\
&=\frac{2s+2+s}{s}\\
&=\frac{3s+2}{s}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $\Delta=s(s+2)$:

$$
U=\frac{3s+2}{s^2(s+2)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Decompose And Invert U {#decompose-and-invert-u-27}

```{=latex}
\Needspace{10\baselineskip}
```
Use the repeated-factor form:

$$
\frac{3s+2}{s^2(s+2)}
=\frac As+\frac B{s^2}+\frac C{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $s^2(s+2)$:

$$
3s+2=As(s+2)+B(s+2)+Cs^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand and group powers of $s$:

$$
3s+2=(A+C)s^2+(2A+B)s+2B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients with $0s^2+3s+2$:

$$
A+C=0,
\qquad
2A+B=3,
\qquad
2B=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve from the last equation upward:

$$
B=1,
\qquad
A=1,
\qquad
C=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting $A=1$, $B=1$, and $C=-1$ gives:

$$
U=\frac1s+\frac1{s^2}-\frac1{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{u(t)=1+t-e^{-2t}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Find And Invert V {#find-and-invert-v-28}

```{=latex}
\Needspace{10\baselineskip}
```
Replace the second column of the coefficient matrix by the right side:

$$
\begin{aligned}
\Delta_V
&=\begin{vmatrix}s+1&\frac2s\\-1&1\end{vmatrix}\\
&=(s+1)+\frac2s\\
&=\frac{s^2+s+2}{s}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $\Delta=s(s+2)$:

$$
V=\frac{s^2+s+2}{s^2(s+2)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\frac{s^2+s+2}{s^2(s+2)}
=\frac As+\frac B{s^2}+\frac C{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After multiplying by $s^2(s+2)$ and grouping powers, we obtain:

$$
s^2+s+2=(A+C)s^2+(2A+B)s+2B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients:

$$
A+C=1,
\qquad
2A+B=1,
\qquad
2B=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The last equation gives $B=1$. Then $2A+1=1$, so $A=0$, and finally
$C=1$. Therefore:

$$
V=\frac1{s^2}+\frac1{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{v(t)=t+e^{-2t}}.
$$

The linear terms arise because the transformed determinant contains a factor
$s^2$. The system has a nondecaying mode that accumulates the constant input.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Forced Components Together {#verify-the-forced-components-together-29}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
u'(t)=1+2e^{-2t},
\qquad
v'(t)=1-2e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the first right side:

$$
\begin{aligned}
-u+v+2
&=-(1+t-e^{-2t})+(t+e^{-2t})+2\\
&=1+2e^{-2t}\\
&=u'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the second right side:

$$
\begin{aligned}
u-v
&=(1+t-e^{-2t})-(t+e^{-2t})\\
&=1-2e^{-2t}\\
&=v'.
\end{aligned}
$$

At $t=0$, $u(0)=0$ and $v(0)=1$ as required.

```{=latex}
\Needspace{12\baselineskip}
```
### A Delayed Input To A Coupled Oscillator {#a-delayed-input-to-a-coupled-oscillator-30}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=-x+u(t-2),
\end{aligned}
\qquad
x(0)=0,
\qquad
y(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation:

$$
sX-Y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation using
$\mathcal{L}\{u(t-2)\}=e^{-2s}/s$:

$$
sY=-X+\frac{e^{-2s}}s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $-X$ to the left:

$$
X+sY=\frac{e^{-2s}}s.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Eliminate And Apply The Delay {#eliminate-and-apply-the-delay-31}

```{=latex}
\Needspace{10\baselineskip}
```
The first transformed equation gives:

$$
Y=sX.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into the second equation:

$$
X+s(sX)=\frac{e^{-2s}}s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $X$:

$$
(s^2+1)X=\frac{e^{-2s}}s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $s^2+1$:

$$
X=e^{-2s}\frac1{s(s^2+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Decompose the undelayed factor:

$$
\frac1{s(s^2+1)}=\frac1s-\frac{s}{s^2+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its inverse is:

$$
f(t)=1-\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the delay $a=2$ to the complete function:

$$
\boxed{x(t)=u(t-2)[1-\cos(t-2)]}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use $Y=sX$:

$$
Y=e^{-2s}\frac1{s^2+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the same delay to $\sin t$:

$$
\boxed{y(t)=u(t-2)\sin(t-2)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Interpret The Delayed Response {#interpret-the-delayed-response-32}

![Delayed input and two coupled state responses](books/assets/chapter_25/chapter_25_figure-1.png)

Both state components remain zero before $t=2$. The forcing enters only the
second differential equation, but coupling carries its effect into $x$ as
well.

```{=latex}
\Needspace{10\baselineskip}
```
For $t>2$:

$$
x'(t)=\sin(t-2)=y(t),
$$

so the first system equation remains visible in the two plotted responses.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> a delayed input to one equation can activate every coupled component, but
> no zero-state response should begin before the switch time.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-33}

Forcing changes the right side of the transformed algebraic system. Constant
inputs may create repeated factors at $s=0$, while delayed inputs attach a
common exponential factor to every state response reached through coupling.

```{=latex}
\Needspace{20\baselineskip}
```
## Three-Variable Systems {#block-5-three-variable-systems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-34}

The goal is to scale the method to three unknown functions without hiding the
extra simultaneous algebra.

```{=latex}
\Needspace{12\baselineskip}
```
### A Triangular System {#a-triangular-system-35}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
p'&=-p,\\
q'&=p-q,\\
r'&=q-r,
\end{aligned}
\qquad
p(0)=2,
\quad
q(0)=0,
\quad
r(0)=1.
$$

This system is **triangular**: the first equation determines $p$, the second
then determines $q$, and the third finally determines $r$.

Define transforms $P,Q,R$ for $p,q,r$ respectively.

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Triangular Transforms In Order {#solve-the-triangular-transforms-in-order-36}

```{=latex}
\Needspace{10\baselineskip}
```
Transform $p'=-p$:

$$
sP-2=-P.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $P$:

$$
(s+1)P=2,
\qquad
P=\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $q'=p-q$:

$$
sQ-0=P-Q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $Q$ and substitute the known $P$:

$$
\begin{aligned}
(s+1)Q&=P,\\
Q&=\frac{P}{s+1}\\
&=\frac2{(s+1)^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $r'=q-r$:

$$
sR-1=Q-R.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $R$ and substitute $Q$:

$$
\begin{aligned}
(s+1)R&=Q+1,\\
R&=\frac{Q}{s+1}+\frac1{s+1}\\
&=\frac2{(s+1)^3}+\frac1{s+1}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Invert The Triangular Solution {#invert-the-triangular-solution-37}

```{=latex}
\Needspace{10\baselineskip}
```
Use the shifted-power pair:

$$
\mathcal{L}^{-1}\left\{\frac1{(s+a)^{n+1}}\right\}
=\frac{t^n}{n!}e^{-at}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $P$:

$$
\boxed{p(t)=2e^{-t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $Q=2/(s+1)^2$:

$$
\boxed{q(t)=2te^{-t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $R=2/(s+1)^3+1/(s+1)$:

$$
\begin{aligned}
r(t)
&=2\left(\frac{t^2}{2}e^{-t}\right)+e^{-t}\\
&=\boxed{(1+t^2)e^{-t}}.
\end{aligned}
$$

The repeated factor $(s+1)^3$ appears because information passes through
three successive equations with the same decay rate.

```{=latex}
\Needspace{12\baselineskip}
```
### A Fully Coupled Three-Variable System {#a-fully-coupled-three-variable-system-38}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=z,\\
z'&=-x-y-z,
\end{aligned}
\qquad
x(0)=1,
\quad
y(0)=0,
\quad
z(0)=0.
$$

Define $X,Y,Z$ as the transforms of $x,y,z$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform all three equations:

$$
\begin{aligned}
sX-1&=Y,\\
sY&=Z,\\
sZ&=-X-Y-Z.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the first two as substitution formulas:

$$
Y=sX-1,
\qquad
Z=sY=s(sX-1)=s^2X-s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move every transform in the third equation to the left:

$$
X+Y+(s+1)Z=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Eliminate Y And Z {#eliminate-y-and-z-39}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $Y=sX-1$ and $Z=s^2X-s$ into the third transformed equation:

$$
X+(sX-1)+(s+1)(s^2X-s)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the final product while keeping its $X$ and non-$X$ parts visible:

$$
X+sX-1+s^2(s+1)X-s(s+1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $X$:

$$
[1+s+s^2(s+1)]X=1+s(s+1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand both polynomials:

$$
(s^3+s^2+s+1)X=s^2+s+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the coefficient on the left:

$$
s^3+s^2+s+1
=(s+1)(s^2+1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide:

$$
X=\frac{s^2+s+1}{(s+1)(s^2+1)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Prepare And Invert X {#prepare-and-invert-x-40}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\frac{s^2+s+1}{(s+1)(s^2+1)}
=\frac A{s+1}+\frac{Bs+C}{s^2+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $(s+1)(s^2+1)$:

$$
s^2+s+1=A(s^2+1)+(Bs+C)(s+1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=-1$:

$$
1=2A,
\qquad
A=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the right side:

$$
s^2+s+1=(A+B)s^2+(B+C)s+(A+C).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $s^2$:

$$
A+B=1,
\qquad
B=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $s$:

$$
B+C=1,
\qquad
C=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting the three constants into the decomposition gives:

$$
X
=\frac1{2(s+1)}
+\frac12\frac{s}{s^2+1}
+\frac12\frac1{s^2+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{
x(t)=\frac12e^{-t}+\frac12\cos t+\frac12\sin t
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Recover The Remaining Components From The Chain {#recover-the-remaining-components-from-the-chain-41}

```{=latex}
\Needspace{10\baselineskip}
```
The original system gives $y=x'$ and $z=y'=x''$. Differentiate $x$ once:

$$
\begin{aligned}
y(t)=x'(t)
&=-\frac12e^{-t}-\frac12\sin t+\frac12\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\begin{aligned}
z(t)=x''(t)
&=\frac12e^{-t}-\frac12\cos t-\frac12\sin t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collecting the three component formulas gives:

$$
\boxed{
\begin{aligned}
x(t)&=\frac12(e^{-t}+\cos t+\sin t),\\
y(t)&=\frac12(-e^{-t}-\sin t+\cos t),\\
z(t)&=\frac12(e^{-t}-\cos t-\sin t).
\end{aligned}
}
$$

The chain relations make differentiation a legitimate recovery method here;
in a general three-variable system, each transform may need to be solved
separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Third Equation {#verify-the-third-equation-42}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $z$:

$$
z'(t)=\frac12[-e^{-t}+\sin t-\cos t].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the three state components:

$$
\begin{aligned}
x+y+z
&=\frac12[e^{-t}+\cos t-\sin t].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Negate this sum:

$$
-(x+y+z)
=\frac12[-e^{-t}-\cos t+\sin t]
=z'(t).
$$

The final coupled equation is satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-43}

Triangular systems should be solved in dependency order. Fully coupled
three-variable systems require systematic elimination or determinants, but
chain relations can sometimes recover later components by differentiation.

```{=latex}
\Needspace{20\baselineskip}
```
## Mixed-Order And Algebraic-Differential Systems {#block-6-mixed-order-and-algebraic-differential-systems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-44}

The goal is to apply the transform method when the equations do not all have
the same derivative order.

```{=latex}
\Needspace{12\baselineskip}
```
### A Second-Order And First-Order Pair {#a-second-order-and-first-order-pair-45}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\begin{aligned}
u''+u-v&=0,\\
v'+v&=u,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(0)=1,
\qquad
u'(0)=0,
\qquad
v(0)=0.
$$

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation:

$$
[s^2U-su(0)-u'(0)]+U-V=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $u(0)=1$ and $u'(0)=0$:

$$
(s^2+1)U-V=s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation and insert $v(0)=0$:

$$
sV+V=U,
$$

```{=latex}
\Needspace{10\baselineskip}
```
or:

$$
-U+(s+1)V=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Mixed-Order Transform System {#solve-the-mixed-order-transform-system-46}

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s^2+1&-1\\-1&s+1\end{vmatrix}\\
&=(s^2+1)(s+1)-1\\
&=s^3+s^2+s\\
&=s(s^2+s+1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $U$, replace the first column by the right side:

$$
\begin{aligned}
\Delta_U
&=\begin{vmatrix}s&-1\\0&s+1\end{vmatrix}\\
&=s(s+1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide and cancel the common factor $s$:

$$
U
=\frac{s(s+1)}{s(s^2+s+1)}
=\frac{s+1}{s^2+s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $V$, replace the second column by the right side:

$$
\begin{aligned}
\Delta_V
&=\begin{vmatrix}s^2+1&s\\-1&0\end{vmatrix}\\
&=s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide and cancel $s$:

$$
V=\frac1{s^2+s+1}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Complete The Square And Invert Both Components {#complete-the-square-and-invert-both-components-47}

```{=latex}
\Needspace{10\baselineskip}
```
Complete the common denominator:

$$
\begin{aligned}
s^2+s+1
&=\left(s+\frac12\right)^2+\frac34\\
&=\left(s+\frac12\right)^2+\left(\frac{\sqrt3}{2}\right)^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the numerator of $U$:

$$
s+1=\left(s+\frac12\right)+\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $b=\sqrt3/2$. Then:

$$
U
=\frac{s+\frac12}{(s+\frac12)^2+b^2}
+\frac1{\sqrt3}\frac{b}{(s+\frac12)^2+b^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert $U$:

$$
\boxed{
u(t)=e^{-t/2}\cos\left(\frac{\sqrt3}{2}t\right)
+\frac1{\sqrt3}e^{-t/2}\sin\left(\frac{\sqrt3}{2}t\right)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $V$, write $1=(2/\sqrt3)b$:

$$
V
=\frac2{\sqrt3}\frac{b}{(s+\frac12)^2+b^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{
v(t)=\frac2{\sqrt3}e^{-t/2}
\sin\left(\frac{\sqrt3}{2}t\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### An Equation Without A Derivative {#an-equation-without-a-derivative-48}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the algebraic-differential system:

$$
\begin{aligned}
u'+v&=0,\\
u-v&=2,
\end{aligned}
\qquad
u(0)=0.
$$

The second equation contains no derivative. It is an algebraic constraint
that must hold at every time.

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation:

$$
sU-u(0)+V=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $u(0)=0$:

$$
sU+V=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the algebraic equation:

$$
U-V=\frac2s.
$$

No value $v(0)$ appears because $v$ is never differentiated.

```{=latex}
\Needspace{12\baselineskip}
```
### Solve And Check The Constraint System {#solve-and-check-the-constraint-system-49}

```{=latex}
\Needspace{10\baselineskip}
```
From the first transformed equation:

$$
V=-sU.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into $U-V=2/s$:

$$
U-(-sU)=\frac2s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Remove the double negative and collect $U$:

$$
(s+1)U=\frac2s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide and decompose:

$$
U=\frac2{s(s+1)}
=\frac2s-\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{u(t)=2-2e^{-t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recover $V=-sU$ from the unreduced transform:

$$
V=-s\frac2{s(s+1)}=-\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{v(t)=-2e^{-t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the algebraic constraint:

$$
u-v=(2-2e^{-t})-(-2e^{-t})=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the differential equation:

$$
u'+v=2e^{-t}-2e^{-t}=0.
$$

At $t=0$, the constraint determines $v(0)=-2$ automatically.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-50}

Transform each derivative according to its own order. A variable contributes
initial data only when its derivative is transformed. Equations without
derivatives remain algebraic constraints in the transform domain.

```{=latex}
\Needspace{20\baselineskip}
```
## The Matrix-Resolvent View {#block-7-the-matrix-resolvent-view}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-51}

The goal is to compress the component calculations into one matrix equation
without concealing what each matrix entry means.

```{=latex}
\Needspace{12\baselineskip}
```
### Start From A Matrix Initial-Value Problem {#start-from-a-matrix-initial-value-problem-52}

```{=latex}
\Needspace{10\baselineskip}
```
Write a first-order linear system as:

$$
\mathbf{x}'(t)=A\mathbf{x}(t)+\mathbf{f}(t),
\qquad
\mathbf{x}(0)=\mathbf{x}_0.
$$

Here:

-   $\mathbf{x}(t)$ is the column vector of unknown functions
-   $A$ is a constant coefficient matrix
-   $\mathbf{f}(t)$ is the forcing vector
-   $\mathbf{x}_0$ is the initial state

```{=latex}
\Needspace{10\baselineskip}
```
Define the componentwise transforms:

$$
\mathbf{X}(s)=\mathcal{L}\{\mathbf{x}(t)\},
\qquad
\mathbf{F}(s)=\mathcal{L}\{\mathbf{f}(t)\}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Vector Equation {#transform-the-vector-equation-53}

```{=latex}
\Needspace{10\baselineskip}
```
Apply the first-derivative formula to every component:

$$
\mathcal{L}\{\mathbf{x}'(t)\}
=s\mathbf{X}(s)-\mathbf{x}_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $A$ is constant:

$$
\mathcal{L}\{A\mathbf{x}(t)\}=A\mathbf{X}(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the complete system:

$$
s\mathbf{X}-\mathbf{x}_0=A\mathbf{X}+\mathbf{F}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $A\mathbf{X}$ to the left:

$$
s\mathbf{X}-A\mathbf{X}=\mathbf{x}_0+\mathbf{F}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $\mathbf{X}$ using the identity matrix $I$:

$$
\boxed{
(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the inverse matrix exists, multiply by $(sI-A)^{-1}$:

$$
\boxed{
\mathbf{X}(s)
=(sI-A)^{-1}[\mathbf{x}_0+\mathbf{F}(s)]
}.
$$

The matrix $(sI-A)^{-1}$ is called the **resolvent** of $A$.

```{=latex}
\Needspace{12\baselineskip}
```
### Expand The Two-By-Two Resolvent {#expand-the-two-by-two-resolvent-54}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtracting $A$ from $sI$ entry by entry gives:

$$
sI-A
=
\begin{bmatrix}
s-a&-b\\
-c&s-d
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its determinant is:

$$
\boxed{
D(s)=(s-a)(s-d)-bc
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using the inverse formula for a two-by-two matrix:

$$
\boxed{
(sI-A)^{-1}
=\frac1{D(s)}
\begin{bmatrix}
s-d&b\\
c&s-a
\end{bmatrix}
}.
$$

Multiplying this inverse by $\mathbf{x}_0+\mathbf{F}$ reproduces the same
formulas obtained by Cramer's rule.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Determinant Matters {#why-the-determinant-matters-55}

```{=latex}
\Needspace{10\baselineskip}
```
The denominator:

$$
D(s)=\det(sI-A)
$$

is the characteristic polynomial of the system matrix, written in the
transform variable $s$.

Its factors determine the shared modes:

-   a factor $s-r$ produces a mode $e^{rt}$
-   a repeated factor $(s-r)^k$ can produce $t^je^{rt}$ terms
-   a quadratic $(s+a)^2+b^2$ produces decaying or growing oscillations

Different components usually have different numerators, but they share the
same characteristic denominator after cancellation is accounted for.

```{=latex}
\Needspace{12\baselineskip}
```
### A Concrete Resolvent Setup {#a-concrete-resolvent-setup-56}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&-3
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
2\\
-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Form $sI-A$ entry by entry:

$$
sI-A
=
\begin{bmatrix}
s&-1\\
4&s+3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the forcing vector:

$$
\mathbf{F}(s)
=
\begin{bmatrix}
0\\
\frac1{s+1}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the initial vector:

$$
\mathbf{x}_0+\mathbf{F}(s)
=
\begin{bmatrix}
2\\
-1+\frac1{s+1}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete transformed system is:

$$
\boxed{
\begin{bmatrix}
s&-1\\
4&s+3
\end{bmatrix}
\begin{bmatrix}X\\Y\end{bmatrix}
=
\begin{bmatrix}
2\\
-1+\frac1{s+1}
\end{bmatrix}
}.
$$

This matrix equation contains exactly the same information as two separately
transformed scalar equations.

```{=latex}
\Needspace{12\baselineskip}
```
### The Bridge To Matrix Solution Methods {#the-bridge-to-matrix-solution-methods-57}

This chapter solves for $\mathbf{X}(s)$ and then inverts its components.
Chapter 26 will instead work directly with the matrix exponential and related
time-domain formulas.

```{=latex}
\Needspace{10\baselineskip}
```
The two viewpoints are connected by the transform pair:

$$
\mathcal{L}\{e^{At}\}=(sI-A)^{-1},
$$

under the usual convergence conditions.

```{=latex}
\Needspace{12\baselineskip}
```
In simple terms:

```{=latex}
\Needspace{8\baselineskip}
```
> the resolvent is the Laplace-domain version of the matrix exponential.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-58}

The compact transformed system is $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$.
Its determinant controls the common modes, while its inverse or Cramer's rule
provides the individual component transforms.

```{=latex}
\Needspace{20\baselineskip}
```
## Choosing A Reliable Route {#block-8-choosing-a-reliable-route}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-59}

The goal is to choose an efficient algebraic method while preserving enough
detail for every component to remain checkable.

```{=latex}
\Needspace{12\baselineskip}
```
### Choose The Algebra From The System Shape {#choose-the-algebra-from-the-system-shape-60}

After transformation:

-   use direct substitution when one equation already isolates a transform
-   use elimination when a short multiple cancels one unknown cleanly
-   use Cramer's rule for a general two-by-two system
-   use dependency order for a triangular system
-   use systematic elimination or a matrix inverse for a larger fully coupled
    system

No method changes the mathematics. The goal is to reduce unnecessary algebra
without skipping the algebra that explains where a transform came from.

```{=latex}
\Needspace{12\baselineskip}
```
### Keep A Transform Ledger {#keep-a-transform-ledger-61}

```{=latex}
\Needspace{10\baselineskip}
```
For each original unknown, record:

$$
u\leftrightarrow U,
\qquad
v\leftrightarrow V,
\qquad
w\leftrightarrow W.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Beside it, record the derivative data:

$$
\begin{aligned}
u'&\longleftrightarrow sU-u(0),\\
v''&\longleftrightarrow s^2V-sv(0)-v'(0).
\end{aligned}
$$

This small ledger prevents an initial value belonging to one function from
being inserted into another function's derivative transform.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify Relations Between Components First {#verify-relations-between-components-first-62}

```{=latex}
\Needspace{10\baselineskip}
```
If the system contains a simple relation such as:

$$
x'=y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
check it before the more complicated rows. A proposed pair must satisfy:

$$
\frac{d}{dt}x(t)=y(t).
$$

For a derivative chain $x'=y$, $y'=z$, checking $x'=y$ and $y'=z$ confirms
two rows immediately. Only the final dynamic equation then needs a full
substitution.

```{=latex}
\Needspace{12\baselineskip}
```
### Check Every Initial Component {#check-every-initial-component-63}

A system solution is a vector of functions. Checking only one initial value
is not sufficient.

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}(0)=
\begin{bmatrix}
2\\-1\\3
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
verify all three statements:

$$
x_1(0)=2,
\qquad
x_2(0)=-1,
\qquad
x_3(0)=3.
$$

If a variable is constrained algebraically rather than assigned independently,
verify the constraint at $t=0$ instead.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Errors {#common-errors-64}

Watch for:

-   using one capital transform letter for two different functions
-   inserting $v(0)$ into an equation that contains $v$ but not $v'$
-   changing the unknown order between transformed rows
-   replacing the wrong determinant column in Cramer's rule
-   using a different coefficient determinant for each component
-   cancelling a factor in one transform and assuming it cancels in all others
-   recovering a second transform from an old equation without restating it
-   delaying only one component when coupling should transmit the delayed input
-   checking one differential equation but not the rest of the system

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-65}

Use the shape of the transformed system to choose substitution, elimination,
determinants, or triangular back-substitution. Preserve transform order,
initial-value ownership, and local recovery formulas, then verify the solution
as a complete vector.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-9-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Two-Variable Foundations {#problems-1-to-4-two-variable-foundations-66}

#### Problem 1: Build The Transformed System

```{=latex}
\Needspace{10\baselineskip}
```
Transform, but do not solve:

$$
\begin{aligned}
a'&=-2a+3b+t,\\
b'&=a-b,
\end{aligned}
\qquad
a(0)=1,
\qquad
b(0)=-2.
$$

#### Problem 2: Solve A Decoupled System

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
u'=-u,
\qquad
v'=2v,
\qquad
u(0)=3,
\qquad
v(0)=-1.
$$

#### Problem 3: Solve A Symmetric Coupled System

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
p'&=p+2q,\\
q'&=2p+q,
\end{aligned}
\qquad
p(0)=1,
\qquad
q(0)=0.
$$

#### Problem 4: Solve A Scaled Oscillator

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=2y,\\
y'&=-2x,
\end{aligned}
\qquad
x(0)=1,
\qquad
y(0)=-1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Forcing And Three Components {#problems-5-to-8-forcing-and-three-components-67}

#### Problem 5: Solve A Forced Triangular Pair

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
u'&=-u+1,\\
v'&=u-v,
\end{aligned}
\qquad
u(0)=0,
\qquad
v(0)=0.
$$

#### Problem 6: Delay A Triangular Response

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=-x+y,\\
y'&=-y+u(t-1),
\end{aligned}
\qquad
x(0)=0,
\qquad
y(0)=0.
$$

#### Problem 7: Solve A Three-Stage Decay Chain

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
p'&=-2p,\\
q'&=p-2q,\\
r'&=q-2r,
\end{aligned}
\qquad
p(0)=1,
\quad
q(0)=0,
\quad
r(0)=0.
$$

#### Problem 8: Use A Derivative Chain

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=y,\\
y'&=z,\\
z'&=-z,
\end{aligned}
\qquad
x(0)=0,
\quad
y(0)=1,
\quad
z(0)=-1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Mixed Structures And Verification {#problems-9-to-12-mixed-structures-and-verification-68}

#### Problem 9: Combine Second And First Derivatives

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
u''-v&=0,\\
v'+v&=0,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(0)=0,
\qquad
u'(0)=1,
\qquad
v(0)=2.
$$

#### Problem 10: Use An Algebraic Constraint

```{=latex}
\Needspace{10\baselineskip}
```
Use Laplace transforms to solve:

$$
\begin{aligned}
u'+v&=1,\\
u+v&=0,
\end{aligned}
\qquad
u(0)=2.
$$

#### Problem 11: Verify A Proposed Pair

```{=latex}
\Needspace{10\baselineskip}
```
Verify that:

$$
u(t)=e^{-t}\cos t,
\qquad
v(t)=-e^{-t}\sin t
$$

```{=latex}
\Needspace{10\baselineskip}
```
solves:

$$
u'=-u+v,
\qquad
v'=-u-v,
\qquad
u(0)=1,
\qquad
v(0)=0.
$$

#### Problem 12: Write A Matrix Resolvent Setup

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-5&-2
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\0
\end{bmatrix},
$$

write $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$ explicitly and calculate
$\det(sI-A)$. Do not invert the component transforms.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-69}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

Define $A(s)=\mathcal{L}\{a(t)\}$ and
$B(s)=\mathcal{L}\{b(t)\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation:

$$
[sA-a(0)]=-2A+3B+\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $a(0)=1$ and arrange the transforms in the order $A,B$:

$$
(s+2)A-3B=1+\frac1{s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation:

$$
sB-b(0)=A-B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $b(0)=-2$:

$$
sB-(-2)=A-B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Remove the double negative and arrange the transforms:

$$
-A+(s+1)B=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The requested transformed system is:

$$
\boxed{
\begin{aligned}
(s+2)A-3B&=1+\frac1{s^2},\\
-A+(s+1)B&=-2.
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Transform $u'=-u$ and insert $u(0)=3$:

$$
sU-3=-U.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect and solve for $U$:

$$
U=\frac3{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $v'=2v$ and insert $v(0)=-1$:

$$
sV-(-1)=2V.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Remove the double negative and solve:

$$
(s-2)V=-1,
\qquad
V=-\frac1{s-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert both transforms:

$$
\boxed{
u(t)=3e^{-t},
\qquad
v(t)=-e^{2t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Define $P=\mathcal{L}\{p\}$ and $Q=\mathcal{L}\{q\}$. Transform both
equations and insert the data:

$$
\begin{aligned}
(s-1)P-2Q&=1,\\
-2P+(s-1)Q&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=(s-1)^2-4\\
&=(s-3)(s+1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $P$, replace the first column by the right side:

$$
P=\frac{\begin{vmatrix}1&-2\\0&s-1\end{vmatrix}}{\Delta}
=\frac{s-1}{(s-3)(s+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write $P=A/(s-3)+B/(s+1)$ and multiply by the denominator:

$$
s-1=A(s+1)+B(s-3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=3$ to obtain $2=4A$, so $A=1/2$. Set $s=-1$ to obtain
$-2=-4B$, so $B=1/2$. Hence:

$$
P=\frac{1/2}{s-3}+\frac{1/2}{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $Q$, replace the second column:

$$
Q=\frac{\begin{vmatrix}s-1&1\\-2&0\end{vmatrix}}{\Delta}
=\frac2{(s-3)(s+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write $Q=C/(s-3)+D/(s+1)$ and multiply by the denominator:

$$
2=C(s+1)+D(s-3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=3$ to obtain $2=4C$, so $C=1/2$. Set $s=-1$ to obtain
$2=-4D$, so $D=-1/2$. Hence:

$$
Q=\frac{1/2}{s-3}-\frac{1/2}{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{
\begin{aligned}
p(t)&=\frac12(e^{3t}+e^{-t}),\\
q(t)&=\frac12(e^{3t}-e^{-t}).
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Transform the two equations using $x(0)=1$ and $y(0)=-1$:

$$
\begin{aligned}
sX-2Y&=1,\\
2X+sY&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient determinant is:

$$
\Delta=s^2+4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cramer's rule gives:

$$
\begin{aligned}
X
&=\frac{\begin{vmatrix}1&-2\\-1&s\end{vmatrix}}{s^2+4}
=\frac{s-2}{s^2+4},\\
Y
&=\frac{\begin{vmatrix}s&1\\2&-1\end{vmatrix}}{s^2+4}
=\frac{-s-2}{s^2+4}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the sine and cosine numerators:

$$
X=\frac{s}{s^2+4}-\frac2{s^2+4},
\qquad
Y=-\frac{s}{s^2+4}-\frac2{s^2+4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{
x(t)=\cos(2t)-\sin(2t),
\qquad
y(t)=-\cos(2t)-\sin(2t)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-70}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Transform the first equation and insert $u(0)=0$:

$$
(s+1)U=\frac1s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Dividing by $s+1$ and decomposing gives:

$$
U=\frac1{s(s+1)}=\frac1s-\frac1{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
u(t)=1-e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the second equation and insert $v(0)=0$:

$$
(s+1)V=U.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the transform just found:

$$
V=\frac1{s(s+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the self-contained decomposition:

$$
\frac1{s(s+1)^2}
=\frac1s-\frac1{s+1}-\frac1{(s+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert:

$$
\boxed{
u(t)=1-e^{-t},
\qquad
v(t)=1-(1+t)e^{-t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Transform both equations with zero initial values:

$$
\begin{aligned}
(s+1)X-Y&=0,\\
(s+1)Y&=\frac{e^{-s}}s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve the second equation first:

$$
Y=e^{-s}\frac1{s(s+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The undelayed inverse of $1/[s(s+1)]$ is $1-e^{-t}$. Apply the delay:

$$
y(t)=u(t-1)[1-e^{-(t-1)}].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $(s+1)X=Y$:

$$
X=e^{-s}\frac1{s(s+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The undelayed inverse is:

$$
1-(1+t)e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the same delay to the complete function:

$$
\boxed{
\begin{aligned}
x(t)&=u(t-1)\{1-[1+(t-1)]e^{-(t-1)}\},\\
y(t)&=u(t-1)[1-e^{-(t-1)}].
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Define transforms $P,Q,R$. Transform in dependency order:

$$
\begin{aligned}
(s+2)P&=1,\\
(s+2)Q&=P,\\
(s+2)R&=Q.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve successively:

$$
P=\frac1{s+2},
\qquad
Q=\frac1{(s+2)^2},
\qquad
R=\frac1{(s+2)^3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the shifted-power transform pair to invert:

$$
\boxed{
p(t)=e^{-2t},
\qquad
q(t)=te^{-2t},
\qquad
r(t)=\frac{t^2}{2}e^{-2t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Transform the final equation first:

$$
sZ-z(0)=-Z.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $z(0)=-1$:

$$
sZ-(-1)=-Z.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Remove the double negative and solve:

$$
(s+1)Z=-1,
\qquad
Z=-\frac1{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $y'=z$ and insert $y(0)=1$:

$$
sY-1=Z.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $Z=-1/(s+1)$:

$$
\begin{aligned}
Y
&=\frac{1+Z}{s}\\
&=\frac{1-\frac1{s+1}}s\\
&=\frac1{s+1}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $x'=y$ and insert $x(0)=0$:

$$
sX=Y,
\qquad
X=\frac1{s(s+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert all three transforms:

$$
\boxed{
x(t)=1-e^{-t},
\qquad
y(t)=e^{-t},
\qquad
z(t)=-e^{-t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-71}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Transform $v'+v=0$ and insert $v(0)=2$:

$$
(s+1)V=2,
\qquad
V=\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform $u''-v=0$ using $u(0)=0$ and $u'(0)=1$:

$$
[s^2U-1]-V=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $-V$ to the right and substitute $V$:

$$
s^2U=1+\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine and divide:

$$
U=\frac{s+3}{s^2(s+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\frac{s+3}{s^2(s+1)}
=-\frac2s+\frac3{s^2}+\frac2{s+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert both components:

$$
\boxed{
u(t)=-2+3t+2e^{-t},
\qquad
v(t)=2e^{-t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$. Transform the
differential equation:

$$
sU-2+V=\frac1s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the algebraic constraint:

$$
U+V=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constraint gives $V=-U$. Substitute it into the first equation:

$$
sU-2-U=\frac1s.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect $U$ and move $-2$ to the right:

$$
(s-1)U=2+\frac1s=\frac{2s+1}{s}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide and decompose:

$$
U=\frac{2s+1}{s(s-1)}
=-\frac1s+\frac3{s-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Invert $U$ and use $V=-U$:

$$
\boxed{
u(t)=-1+3e^t,
\qquad
v(t)=1-3e^t
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the proposed $u$:

$$
\begin{aligned}
u'(t)
&=\frac{d}{dt}[e^{-t}\cos t]\\
&=-e^{-t}\cos t-e^{-t}\sin t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $-u+v$ from the proposed pair:

$$
\begin{aligned}
-u+v
&=-e^{-t}\cos t-e^{-t}\sin t\\
&=u'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the proposed $v$:

$$
\begin{aligned}
v'(t)
&=\frac{d}{dt}[-e^{-t}\sin t]\\
&=e^{-t}\sin t-e^{-t}\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $-u-v$:

$$
\begin{aligned}
-u-v
&=-e^{-t}\cos t+e^{-t}\sin t\\
&=v'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
u(0)=1,
\qquad
v(0)=0.
$$

Both equations and both initial values are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient matrix is:

$$
A=
\begin{bmatrix}
0&1\\
-5&-2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Form $sI-A$:

$$
sI-A
=
\begin{bmatrix}
s&-1\\
5&s+2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Transform the forcing and add the initial vector:

$$
\mathbf{x}_0+\mathbf{F}(s)
=
\begin{bmatrix}1\\0\end{bmatrix}
+
\begin{bmatrix}0\\\frac1{s+1}\end{bmatrix}
=
\begin{bmatrix}1\\\frac1{s+1}\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The explicit transformed system is:

$$
\boxed{
\begin{bmatrix}
s&-1\\
5&s+2
\end{bmatrix}
\begin{bmatrix}X_1\\X_2\end{bmatrix}
=
\begin{bmatrix}1\\\frac1{s+1}\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the determinant:

$$
\begin{aligned}
\det(sI-A)
&=s(s+2)-(-1)(5)\\
&=s^2+2s+5\\
&=(s+1)^2+4.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 25 Final Summary {#chapter-25-final-summary-72}

```{=latex}
\Needspace{10\baselineskip}
```
For one transform per unknown function, a constant-coefficient system becomes
a simultaneous algebraic system. In matrix form:

$$
\boxed{
(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}(s)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
Solve transformed systems by substitution, elimination, Cramer's rule,
triangular dependency order, or a matrix inverse. The determinant
$\det(sI-A)$ reveals the shared modes, while component numerators determine
how strongly each mode appears in each unknown.

```{=latex}
\Needspace{8\baselineskip}
```
> transform each row carefully, solve all transforms consistently, and verify
> the result as one coupled vector rather than as unrelated scalar functions.
