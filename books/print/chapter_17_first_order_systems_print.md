```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 17}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Reduction To First-Order Systems}
```
# Chapter 17 - Reduction To First-Order Systems

Earlier chapters treated higher-order differential equations and systems as
related subjects. This chapter makes their connection explicit: every linear
differential equation of order $n$ can be rewritten as a system of $n$
first-order equations.

The conversion does not approximate the original problem. It repackages the
same unknown function and its derivatives into a vector called the **state**.

The main questions are:

-   why does an $n$th-order equation need $n$ state variables?
-   how should those variables be chosen?
-   how is the highest derivative isolated without changing signs incorrectly?
-   where do the coefficient matrix and forcing vector come from?
-   how are initial conditions transferred into an initial state vector?
-   how are coupled equations handled when their orders differ?
-   how can the matrix system be checked against the original equations?
-   when can Chapter 16's matrix exponential solve the converted system?

```{=latex}
\Needspace{20\baselineskip}
```
## From Derivative Memory To A State Vector {#block-1-from-derivative-memory-to-a-state-vector}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to understand why a higher-order equation can be represented by
several first-order equations without losing information.

```{=latex}
\Needspace{12\baselineskip}
```
### What A Higher-Order Equation Must Remember {#what-a-higher-order-equation-must-remember-2}

Consider a second-order equation for an unknown function $y(t)$. To predict
how the solution changes, it is generally not enough to know only $y(t)$. We
also need its current rate $y'(t)$.

```{=latex}
\Needspace{10\baselineskip}
```
For a third-order equation, the required current information is:

$$
y(t),\qquad y'(t),\qquad y''(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For an $n$th-order equation, the corresponding list is:

$$
y(t),\quad y'(t),\quad y''(t),\quad\ldots,\quad y^{(n-1)}(t).
$$

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> an $n$th-order scalar equation stores its present state in $n$ quantities:
> the function and its first $n-1$ derivatives.

```{=latex}
\Needspace{12\baselineskip}
```
### Building The State Vector {#building-the-state-vector-3}

```{=latex}
\Needspace{10\baselineskip}
```
For a third-order equation, define:

$$
x_1(t)=y(t),\qquad
x_2(t)=y'(t),\qquad
x_3(t)=y''(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the three derivative levels into one column vector:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
x_1(t)\\
x_2(t)\\
x_3(t)
\end{bmatrix}
=
\begin{bmatrix}
y(t)\\
y'(t)\\
y''(t)
\end{bmatrix}.
$$

This vector is the **state vector**. Bold $\mathbf{x}$ denotes the whole
vector; $x_1,x_2,x_3$ denote its scalar components.

```{=latex}
\Needspace{12\baselineskip}
```
### The Derivative Chain {#the-derivative-chain-4}

Differentiate each state definition.

```{=latex}
\Needspace{10\baselineskip}
```
From $x_1=y$:

$$
x_1'=y'=x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $x_2=y'$:

$$
x_2'=y''=x_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $x_3=y''$:

$$
x_3'=y'''.
$$

The first two equations merely pass information along the derivative chain.
The original differential equation is used only when replacing the final
quantity $y'''$.

```{=latex}
\Needspace{12\baselineskip}
```
A useful interpretation:

```{=latex}
\Needspace{8\baselineskip}
```
> most rows of the matrix system record definitions; the final row contains
> the actual dynamics supplied by the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Conversion Is Equivalent {#why-the-conversion-is-equivalent-5}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $y(t)$ solves the original third-order equation. Defining:

$$
x_1=y,\qquad x_2=y',\qquad x_3=y''
$$

automatically makes $x_1'=x_2$ and $x_2'=x_3$. The original equation then
determines $x_3'=y'''$. Therefore $y$ produces a solution of the first-order
system.

```{=latex}
\Needspace{10\baselineskip}
```
Conversely, suppose a system solution satisfies:

$$
x_1'=x_2,\qquad x_2'=x_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $y=x_1$. The first relation gives $y'=x_2$. Differentiate that relation:

$$
y''=x_2'=x_3.
$$

The final system equation then becomes the original equation for $y'''$.
Thus the two descriptions contain the same solution information.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

```{=latex}
\Needspace{10\baselineskip}
```
For an $n$th-order equation, use $n$ state variables:

$$
x_1=y,\quad x_2=y',\quad\ldots,\quad x_n=y^{(n-1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this $n$-component state, the first $n-1$ derivatives form the chain:

$$
x_1'=x_2,\quad x_2'=x_3,\quad\ldots,\quad x_{n-1}'=x_n.
$$

The original equation supplies the final equation for $x_n'=y^{(n)}$.

```{=latex}
\Needspace{20\baselineskip}
```
## A Complete Second-Order Conversion {#block-2-a-complete-second-order-conversion}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to convert one second-order initial-value problem slowly enough
that every matrix entry can be traced back to a visible scalar equation.

```{=latex}
\Needspace{12\baselineskip}
```
### The Problem {#the-problem-8}

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
2y''-3y'+8y=4\cos t,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=1,\qquad y'(0)=-2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
into:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
\qquad
\mathbf{x}(0)=\mathbf{c}.
$$

Here $A$ is the coefficient matrix, $\mathbf{f}(t)$ is the forcing vector, and
$\mathbf{c}$ is the initial state.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 1: Isolate The Highest Derivative {#step-1-isolate-the-highest-derivative-9}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
2y''-3y'+8y=4\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the $y'$ and $y$ terms to the right side:

$$
2y''=3y'-8y+4\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $2$:

$$
\boxed{
y''=-4y+\frac32y'+2\cos t
}.
$$

Writing $-4y$ before $\frac32y'$ anticipates the state order $y,y'$.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 2: Define The State Variables {#step-2-define-the-state-variables-10}

```{=latex}
\Needspace{10\baselineskip}
```
The equation is second order, so define:

$$
x_1=y,\qquad x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The state vector is:

$$
\mathbf{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
=
\begin{bmatrix}
y\\
y'
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 3: Differentiate The State Definitions {#step-3-differentiate-the-state-definitions-11}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_1=y$:

$$
x_1'=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $x_2=y'$:

$$
\boxed{x_1'=x_2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_2=y'$:

$$
x_2'=y''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the isolated formula:

$$
y''=-4y+\frac32y'+2\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y$ by $x_1$ and $y'$ by $x_2$:

$$
\boxed{
x_2'=-4x_1+\frac32x_2+2\cos t
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 4: Stack The Scalar Equations {#step-4-stack-the-scalar-equations-12}

```{=latex}
\Needspace{10\baselineskip}
```
The two first-order equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-4x_1+\frac32x_2+2\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate state-dependent terms from the forcing:

$$
\begin{bmatrix}
x_1'\\
x_2'
\end{bmatrix}
=
\begin{bmatrix}
0x_1+1x_2\\
-4x_1+\frac32x_2
\end{bmatrix}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $x_1$ forms column $1$, and the coefficient of $x_2$ forms
column $2$. Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&\frac32
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 5: Convert The Initial Conditions {#step-5-convert-the-initial-conditions-13}

```{=latex}
\Needspace{10\baselineskip}
```
The state ordering is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
y(t)\\
y'(t)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate at $t=0$:

$$
\mathbf{x}(0)
=
\begin{bmatrix}
y(0)\\
y'(0)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y(0)=1$ and $y'(0)=-2$:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
1\\
-2
\end{bmatrix}
}.
$$

The initial values are not coefficients in $A$; they form a separate vector.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Conversion Row By Row {#verify-the-conversion-row-by-row-14}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the proposed matrix system:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&\frac32
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $\mathbf{x}$ by $[x_1,x_2]^{\mathsf T}$ and multiply row by row:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0=x_2,\\
x_2'&=-4x_1+\frac32x_2+2\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Restore $x_1=y$, $x_2=y'$, and $x_2'=y''$ in the second row:

$$
y''=-4y+\frac32y'+2\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $2$:

$$
2y''=-8y+3y'+4\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the $y$ and $y'$ terms to the left:

$$
2y''-3y'+8y=4\cos t.
$$

This is the original differential equation, so the conversion is correct.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

For a second-order equation:

1.  isolate $y''$
2.  define $x_1=y$ and $x_2=y'$
3.  use $x_1'=x_2$
4.  replace $y$ and $y'$ in the isolated formula to obtain $x_2'$
5.  read the matrix coefficients from the two scalar equations
6.  place $y(t_0)$ and $y'(t_0)$ into the initial vector in state order

The matrix is assembled from coefficients, not guessed from the original
equation.

```{=latex}
\Needspace{20\baselineskip}
```
## The General Nth-Order Companion Form {#block-3-the-general-nth-order-companion-form}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to extend the second-order construction to a linear equation of
any order and understand the pattern in its coefficient matrix.

```{=latex}
\Needspace{12\baselineskip}
```
### Normalize The Differential Equation First {#normalize-the-differential-equation-first-17}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
b_n(t)y^{(n)}+b_{n-1}(t)y^{(n-1)}+\cdots+b_1(t)y'+b_0(t)y=g(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
on an interval where:

$$
b_n(t)\ne0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $b_n(t)$. Define:

$$
p_j(t)=\frac{b_j(t)}{b_n(t)},
\qquad
q(t)=\frac{g(t)}{b_n(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The normalized equation is:

$$
y^{(n)}+p_{n-1}(t)y^{(n-1)}+\cdots+p_1(t)y'+p_0(t)y=q(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate the highest derivative:

$$
\boxed{
y^{(n)}
=
-p_0(t)y-p_1(t)y'-\cdots-p_{n-1}(t)y^{(n-1)}+q(t)
}.
$$

Every coefficient moved from the left side changes sign.

```{=latex}
\Needspace{12\baselineskip}
```
### Define The Derivative-Chain State {#define-the-derivative-chain-state-18}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x_1=y,\quad
x_2=y',\quad
x_3=y'',\quad\ldots,\quad
x_n=y^{(n-1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating the first $n-1$ definitions gives:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
&\ \vdots\\
x_{n-1}'&=x_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the final component:

$$
x_n'=y^{(n)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the isolated highest derivative and replace each derivative by its
state component:

$$
\boxed{
x_n'
=
-p_0(t)x_1-p_1(t)x_2-\cdots-p_{n-1}(t)x_n+q(t)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Companion Matrix {#the-companion-matrix-19}

```{=latex}
\Needspace{10\baselineskip}
```
Collect the state components into:

$$
\mathbf{x}
=
\begin{bmatrix}
x_1\\x_2\\x_3\\\vdots\\x_n
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The system is:

$$
\boxed{\mathbf{x}'=A(t)\mathbf{x}+\mathbf{f}(t)},
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
A(t)
=
\begin{bmatrix}
0&1&0&\cdots&0\\
0&0&1&\cdots&0\\
\vdots&\vdots&\vdots&\ddots&\vdots\\
0&0&0&\cdots&1\\
-p_0(t)&-p_1(t)&-p_2(t)&\cdots&-p_{n-1}(t)
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\mathbf{f}(t)
=
\begin{bmatrix}
0\\0\\\vdots\\0\\q(t)
\end{bmatrix}.
$$

This arrangement is called a **companion form**. The $1$s above the main
diagonal create the derivative chain. The final row comes from the isolated
formula for $y^{(n)}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Forcing Appears Only In The Last Row {#why-the-forcing-appears-only-in-the-last-row-20}

```{=latex}
\Needspace{10\baselineskip}
```
The equations:

$$
x_1'=x_2,\quad x_2'=x_3,\quad\ldots,\quad x_{n-1}'=x_n
$$

are definitions. They do not use the forcing $q(t)$.

```{=latex}
\Needspace{10\baselineskip}
```
In this derivative-chain construction, only the final equation:

$$
x_n'=y^{(n)}
$$

uses the original differential equation. Since $q(t)$ appears in the formula
for $y^{(n)}$, it enters only the final component of $\mathbf{f}(t)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Initial Data In State Order {#initial-data-in-state-order-21}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the scalar problem provides:

$$
y(t_0)=c_0,\quad
y'(t_0)=c_1,\quad\ldots,\quad
y^{(n-1)}(t_0)=c_{n-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The state definition gives:

$$
\mathbf{x}(t_0)
=
\begin{bmatrix}
y(t_0)\\
y'(t_0)\\
\vdots\\
y^{(n-1)}(t_0)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the prescribed values:

$$
\boxed{
\mathbf{x}(t_0)
=
\begin{bmatrix}
c_0\\c_1\\\vdots\\c_{n-1}
\end{bmatrix}
}.
$$

The order of the entries must match the order chosen in $\mathbf{x}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-22}

After normalizing the scalar equation, the companion matrix has:

-   $1$s immediately above the main diagonal
-   zeros elsewhere in the first $n-1$ rows
-   negated normalized coefficients in the final row
-   the normalized forcing in the final entry of $\mathbf{f}(t)$

The construction is a compressed record of the scalar derivative chain.

```{=latex}
\Needspace{20\baselineskip}
```
## Variable Coefficients And A Third-Order Example {#block-4-variable-coefficients-and-a-third-order-example}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-23}

The goal is to show that the conversion works when coefficients depend on
$t$, and to make every entry of a $3\times3$ system traceable.

```{=latex}
\Needspace{12\baselineskip}
```
### The Initial-Value Problem {#the-initial-value-problem-24}

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
u'''+2t\,u''-(t+1)u'+5u=e^{-t},
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(1)=2,\qquad u'(1)=0,\qquad u''(1)=-1.
$$

The leading coefficient is already $1$, so no division is required.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 1: Isolate The Third Derivative {#step-1-isolate-the-third-derivative-25}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
u'''+2t\,u''-(t+1)u'+5u=e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move every term except $u'''$ to the right. Each moved term changes sign:

$$
\boxed{
u'''=-5u+(t+1)u'-2t\,u''+e^{-t}
}.
$$

The coefficient of $u'$ becomes positive because its original coefficient was
$-(t+1)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 2: Build The Three State Equations {#step-2-build-the-three-state-equations-26}

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
x_1=u,\qquad x_2=u',\qquad x_3=u''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_1=u$ and use $x_2=u'$:

$$
x_1'=u'=x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_2=u'$ and use $x_3=u''$:

$$
x_2'=u''=x_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_3=u''$:

$$
x_3'=u'''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the isolated formula for $u'''$:

$$
x_3'=-5u+(t+1)u'-2t\,u''+e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $u,u',u''$ by $x_1,x_2,x_3$:

$$
\boxed{
x_3'=-5x_1+(t+1)x_2-2t\,x_3+e^{-t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 3: Assemble The Matrix System {#step-3-assemble-the-matrix-system-27}

```{=latex}
\Needspace{10\baselineskip}
```
Write the scalar equations with all state coefficients visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3,\\
x_2'&=0x_1+0x_2+1x_3,\\
x_3'&=-5x_1+(t+1)x_2-2t\,x_3+e^{-t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading the coefficient of $x_1,x_2,x_3$ across each row gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&0&1\\
-5&t+1&-2t
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
0\\
e^{-t}
\end{bmatrix}
}.
$$

Because two entries depend on $t$, this is a variable-coefficient matrix
system.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 4: Assemble The Initial State {#step-4-assemble-the-initial-state-28}

```{=latex}
\Needspace{10\baselineskip}
```
The state vector is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
u(t)\\u'(t)\\u''(t)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate at the prescribed initial time $t_0=1$:

$$
\mathbf{x}(1)
=
\begin{bmatrix}
u(1)\\u'(1)\\u''(1)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the three initial values:

$$
\boxed{
\mathbf{x}(1)
=
\begin{bmatrix}
2\\0\\-1
\end{bmatrix}
}.
$$

The initial time remains $1$; converting to a system does not shift it to
zero.

```{=latex}
\Needspace{12\baselineskip}
```
### A Leading Coefficient That Can Vanish {#a-leading-coefficient-that-can-vanish-29}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
t^2y''+3ty'-2y=\ln t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To isolate $y''$, divide by $t^2$:

$$
y''
=
-\frac{3}{t}y'
+\frac{2}{t^2}y
+\frac{\ln t}{t^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This normalization requires $t\ne0$. The forcing $\ln t$ additionally requires
$t>0$ for real-valued solutions. Therefore the converted system is considered
on an interval contained in:

$$
\boxed{t>0}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> dividing by the leading coefficient can reveal interval restrictions that
> must accompany the matrix system.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-30}

Variable coefficients become entries of $A(t)$. A nonzero forcing becomes an
entry of $\mathbf{f}(t)$. Neither feature changes the derivative-chain rows.

Before dividing by a leading coefficient, identify where it is nonzero and
retain that interval information in the converted problem.

```{=latex}
\Needspace{20\baselineskip}
```
## Coupled Equations Of Different Orders {#block-5-coupled-equations-of-different-orders}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-31}

The goal is to create one state variable for every required derivative across
several unknown functions and preserve all cross-coupling terms.

```{=latex}
\Needspace{12\baselineskip}
```
### How Many State Variables Are Needed? {#how-many-state-variables-are-needed-32}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose one equation is second order in $u(t)$ and another is first order in
$v(t)$. The state must remember:

$$
u,\qquad u',\qquad v.
$$

Therefore three state variables are needed.

```{=latex}
\Needspace{10\baselineskip}
```
More generally, add the orders of the unknown functions. A third-order equation
in $u$ coupled to a second-order equation in $v$ normally needs:

$$
3+2=5
$$

state variables.

```{=latex}
\Needspace{12\baselineskip}
```
### A Mixed-Order Coupled Problem {#a-mixed-order-coupled-problem-33}

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
\begin{aligned}
u''+2u'-v&=\sin t,\\
v'+3v-4u&=t,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(0)=1,\qquad u'(0)=0,\qquad v(0)=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the state ordering:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 1: Isolate The Needed Derivatives {#step-1-isolate-the-needed-derivatives-34}

```{=latex}
\Needspace{10\baselineskip}
```
From the first equation:

$$
u''+2u'-v=\sin t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $2u'$ and $-v$ to the right:

$$
\boxed{u''=-2u'+v+\sin t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From the second equation:

$$
v'+3v-4u=t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In $v'+3v-4u=t$, move $3v$ and $-4u$ to the right:

$$
\boxed{v'=4u-3v+t}.
$$

Both isolated formulas are needed because they supply derivatives of state
components.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 2: Translate Each Derivative Into State Variables {#step-2-translate-each-derivative-into-state-variables-35}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_1=u$:

$$
x_1'=u'=x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_2=u'$ and use the isolated formula for $u''$:

$$
\begin{aligned}
x_2'
&=u''\\
&=-2u'+v+\sin t\\
&=-2x_2+x_3+\sin t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $x_3=v$ and use the isolated formula for $v'$:

$$
\begin{aligned}
x_3'
&=v'\\
&=4u-3v+t\\
&=4x_1-3x_3+t.
\end{aligned}
$$

Every original unknown has now been replaced by a state component.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 3: Read Off The Matrix And Forcing {#step-3-read-off-the-matrix-and-forcing-36}

```{=latex}
\Needspace{10\baselineskip}
```
Make all zero coefficients visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3+0,\\
x_2'&=0x_1-2x_2+1x_3+\sin t,\\
x_3'&=4x_1+0x_2-3x_3+t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading across the rows gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&-2&1\\
4&0&-3
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
\sin t\\
t
\end{bmatrix}
}.
$$

The cross-coupling term $v$ creates the entry $1$ in row $2$, column $3$.
The cross-coupling term $4u$ creates the entry $4$ in row $3$, column $1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 4: Convert The Initial Data {#step-4-convert-the-initial-data-37}

```{=latex}
\Needspace{10\baselineskip}
```
The selected state ordering is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
u(t)\\u'(t)\\v(t)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
\mathbf{x}(0)
=
\begin{bmatrix}
u(0)\\u'(0)\\v(0)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the prescribed values:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
1\\0\\-2
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Two Second-Order Unknowns {#two-second-order-unknowns-38}

```{=latex}
\Needspace{10\baselineskip}
```
For two second-order unknowns, a useful ordering is:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v,\qquad x_4=v'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x_1'=x_2,\qquad x_3'=x_4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two original equations must be rearranged to provide formulas for:

$$
x_2'=u'',\qquad x_4'=v''.
$$

The state order need not place all unprimed functions first. What matters is
that every matrix row and every initial value follows the declared order
consistently.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-39}

For a coupled system:

1.  count the derivative levels required for each unknown
2.  declare a state ordering explicitly
3.  isolate every highest derivative needed by that state
4.  translate each equation into state components
5.  preserve cross-coupling coefficients in the correct columns
6.  place all non-state terms into the forcing vector

```{=latex}
\Needspace{20\baselineskip}
```
## Equivalence, Reverse Conversion, And The Solution Bridge {#block-6-equivalence-reverse-conversion-and-the-solution-bridge}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to read a companion system back as a scalar equation and connect
the converted system with the matrix exponential from Chapter 16.

```{=latex}
\Needspace{12\baselineskip}
```
### Recover A Scalar Equation From A System {#recover-a-scalar-equation-from-a-system-41}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-6&-5
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\e^t
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
\mathbf{x}
=
\begin{bmatrix}
y\\y'
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the first row:

$$
y'=0y+1y'.
$$

This row confirms the state definition.

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the second row. Since the second component derivative is $y''$:

$$
y''=-6y-5y'+e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $y''=-6y-5y'+e^t$, move the $y$ and $y'$ terms to the left:

$$
\boxed{y''+5y'+6y=e^t}.
$$

The final row of a companion system contains the scalar equation in isolated
highest-derivative form.

```{=latex}
\Needspace{12\baselineskip}
```
### Not Every Matrix System Is In Companion Form {#not-every-matrix-system-is-in-companion-form-42}

```{=latex}
\Needspace{10\baselineskip}
```
The system:

$$
\mathbf{z}'
=
\begin{bmatrix}
2&1\\
-3&4
\end{bmatrix}
\mathbf{z}
$$

```{=latex}
\Needspace{10\baselineskip}
```
is a valid first-order system, but its first row is:

$$
z_1'=2z_1+z_2,
$$

not $z_1'=z_2$. Therefore $z_2$ has not been declared to be $z_1'$.

It may still be possible to eliminate $z_2$ and obtain a second-order
equation, but the direct companion reading rule does not apply until the state
relationship is established.

```{=latex}
\Needspace{12\baselineskip}
```
### The Homogeneous Constant-Coefficient Bridge {#the-homogeneous-constant-coefficient-bridge-43}

```{=latex}
\Needspace{10\baselineskip}
```
If conversion produces:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(t_0)=\mathbf{c},
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this constant homogeneous system, Chapter 16 gives:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

The first component of $\mathbf{x}(t)$ is the original unknown $y(t)$ when
$x_1=y$.

The conversion and the matrix exponential perform different jobs:

-   conversion constructs the first-order system
-   the matrix exponential solves a constant homogeneous system

```{=latex}
\Needspace{12\baselineskip}
```
### The Forced Constant-Coefficient Bridge {#the-forced-constant-coefficient-bridge-44}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{c},
$$

```{=latex}
\Needspace{10\baselineskip}
```
with constant $A$, the solution can be written as:

$$
\boxed{
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
+
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

The first term carries the initial state. The integral accumulates the effect
of the forcing from $t_0$ to $t$.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Forced Formula {#verify-the-forced-formula-45}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
+
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=t_0$, the integral has equal limits and is zero:

$$
\begin{aligned}
\mathbf{x}(t_0)
&=e^{A0}\mathbf{c}+0\\
&=I\mathbf{c}\\
&=\mathbf{c}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now differentiate. The first term gives:

$$
\frac{d}{dt}
\left(e^{A(t-t_0)}\mathbf{c}\right)
=
Ae^{A(t-t_0)}\mathbf{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the integral, the upper-limit term is:

$$
e^{A(t-t)}\mathbf{f}(t)
=
I\mathbf{f}(t)
=
\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating the integrand with respect to $t$ gives:

$$
\frac{\partial}{\partial t}
\left(e^{A(t-s)}\mathbf{f}(s)\right)
=
Ae^{A(t-s)}\mathbf{f}(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\mathbf{x}'(t)
&=
Ae^{A(t-t_0)}\mathbf{c}
+\mathbf{f}(t)
+\int_{t_0}^{t}Ae^{A(t-s)}\mathbf{f}(s)\,ds\\
&=
A\left[
e^{A(t-t_0)}\mathbf{c}
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
\right]
+\mathbf{f}(t)\\
&=A\mathbf{x}(t)+\mathbf{f}(t).
\end{aligned}
$$

Both the differential equation and initial condition are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-46}

A companion system can be read backward because its derivative-chain rows
identify each state component with a derivative of the first component.

For constant $A$, Chapter 16 supplies the solution operator. Conversion is
therefore the bridge from a higher-order scalar equation to matrix methods.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Workflow And Common Mistakes {#block-7-a-reliable-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-47}

The goal is to turn the conversion into a repeatable checklist and diagnose
the errors that most often make a plausible-looking matrix incorrect.

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Conversion Workflow {#a-reliable-conversion-workflow-48}

#### Step 1: Count The Required State Components

An $n$th-order scalar equation needs $n$ components. For coupled equations,
add the derivative levels needed for every unknown.

#### Step 2: Declare The State Order

```{=latex}
\Needspace{10\baselineskip}
```
Write the full definition before constructing a matrix:

$$
\mathbf{x}=[x_1,x_2,\ldots,x_N]^{\mathsf T}.
$$

#### Step 3: Normalize Each Highest Derivative

Divide by its leading coefficient where that coefficient is nonzero. Record
any interval restriction.

#### Step 4: Isolate Every Required Highest Derivative

Move all remaining terms carefully and show their sign changes.

#### Step 5: Write Scalar First-Order Equations

Do not jump directly to the matrix. First write one equation for each
component derivative.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Replace Original Variables By State Components

No $y'',u'$, or other undeclared derivative should remain on the right side.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Read Coefficients Row By Row

Use the same component order in every row. Write zeros explicitly when they
help expose the structure.

#### Step 8: Separate The Forcing

Terms depending only on $t$, constants, or prescribed inputs belong in
$\mathbf{f}(t)$, not in $A(t)$.

#### Step 9: Translate Initial Data In State Order

Keep the original initial time and place each value in its matching component.

#### Step 10: Expand The Matrix Product To Verify

Recover the scalar equations row by row and compare them with the isolated
derivative formulas.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reading Coefficients Before Isolating {#common-mistake-reading-coefficients-before-isolating-49}

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
y''+4y'-7y=h(t),
$$

the final state equation is not obtained by copying $4$ and $-7$ directly.

```{=latex}
\Needspace{10\baselineskip}
```
First isolate $y''$:

$$
y''=-4y'+7y+h(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $x_1=y$ and $x_2=y'$, write in state order:

$$
x_2'=7x_1-4x_2+h(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $x_2'=7x_1-4x_2+h(t)$, the final matrix row is:

$$
\boxed{[\,7\quad -4\,]}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating Forcing As A Matrix Coefficient {#common-mistake-treating-forcing-as-a-matrix-coefficient-50}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
x_2'=3x_1-x_2+t^2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the term $t^2$ multiplies no state variable. It therefore belongs in the
forcing vector:

$$
\begin{bmatrix}
x_1'\\x_2'
\end{bmatrix}
=
\begin{bmatrix}
0&1\\3&-1
\end{bmatrix}
\begin{bmatrix}
x_1\\x_2
\end{bmatrix}
+
\begin{bmatrix}
0\\t^2
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing The State Order {#common-mistake-losing-the-state-order-51}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
\mathbf{x}=
\begin{bmatrix}
u\\u'\\v
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial vector must use that same order:

$$
\mathbf{x}(t_0)
=
\begin{bmatrix}
u(t_0)\\u'(t_0)\\v(t_0)
\end{bmatrix}.
$$

Writing $[u(t_0),v(t_0),u'(t_0)]^{\mathsf T}$ silently assigns values to the
wrong components.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Changing The Initial Time {#common-mistake-changing-the-initial-time-52}

```{=latex}
\Needspace{10\baselineskip}
```
If the scalar problem gives data at $t_0=3$, the system condition is:

$$
\mathbf{x}(3)=\mathbf{c},
$$

not $\mathbf{x}(0)=\mathbf{c}$.

```{=latex}
\Needspace{10\baselineskip}
```
For a constant homogeneous system, the matching solution formula is:

$$
\mathbf{x}(t)=e^{A(t-3)}\mathbf{c}.
$$

The shift $t-3$ is forced by the original initial time.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using The Wrong Number Of Components {#common-mistake-using-the-wrong-number-of-components-53}

A fourth-order scalar equation needs four first-order state equations. Using
only $y,y',y''$ leaves no component whose derivative is $y^{(4)}$.

```{=latex}
\Needspace{10\baselineskip}
```
The correct chain is:

$$
x_1=y,\quad x_2=y',\quad x_3=y'',\quad x_4=y'''.
$$

Then $x_4'=y^{(4)}$ can be supplied by the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-54}

```{=latex}
\Needspace{12\baselineskip}
```
The most reliable habit is:

```{=latex}
\Needspace{8\baselineskip}
```
> write and verify the scalar first-order equations before compressing them
> into a matrix.

Most matrix errors are really earlier errors in normalization, signs, state
ordering, or forcing separation.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### How To Use These Problems {#how-to-use-these-problems-55}

For each conversion:

1.  declare the state variables
2.  isolate the required highest derivative
3.  write all scalar first-order equations
4.  assemble $A(t)$ and $\mathbf{f}(t)$
5.  translate initial data when provided
6.  expand at least one matrix row as a check

The twelve problems below use equations and data created specifically for this
chapter.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Single Scalar Equations {#problems-1-to-4-single-scalar-equations-56}

#### Problem 1: A Forced Second-Order IVP

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
y''+7y'-2y=t^2,
\qquad
y(0)=3,\quad y'(0)=-1.
$$

#### Problem 2: Normalize Before Reading Variable Coefficients

```{=latex}
\Needspace{10\baselineskip}
```
On an interval containing $t=1$, convert:

$$
3y''-6t\,y'+9y=\cos t,
\qquad
y(1)=0,\quad y'(1)=2.
$$

#### Problem 3: A Third-Order Equation

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
z'''-4z''+z'+6z=e^t.
$$

#### Problem 4: A Fourth-Order Equation With Missing Derivatives

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
w^{(4)}+2w''-w=t.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Domains, Reversal, And Diagnosis {#problems-5-to-8-domains-reversal-and-diagnosis-57}

#### Problem 5: Record The Domain Restriction

```{=latex}
\Needspace{10\baselineskip}
```
Convert on an appropriate real interval:

$$
t\,y''+(1-t)y'+4y=\sqrt{t}.
$$

#### Problem 6: Recover The Scalar Equation

```{=latex}
\Needspace{10\baselineskip}
```
Given:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
8&-6
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\3\sin t
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
y\\y'
\end{bmatrix},
$$

recover the scalar differential equation.

#### Problem 7: Diagnose A Sign Error

```{=latex}
\Needspace{10\baselineskip}
```
A learner converts:

$$
y''-5y'+2y=0
$$

using $x_1=y,x_2=y'$ and proposes the final row $[-2,-5]$. Identify the error
and give the correct matrix.

#### Problem 8: Put An Existing First-Order System In Matrix Form

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
\begin{aligned}
u'&=2u-3v+e^{-t},\\
v'&=5u+v-4
\end{aligned}
$$

as $\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t)$ using
$\mathbf{x}=[u,v]^{\mathsf T}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Coupling And The Solution Bridge {#problems-9-to-12-coupling-and-the-solution-bridge-58}

#### Problem 9: One Second-Order And One First-Order Unknown

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
\begin{aligned}
p''-p'+2q&=t,\\
q'+q-3p&=e^t,
\end{aligned}
$$

using $\mathbf{x}=[p,p',q]^{\mathsf T}$.

#### Problem 10: Two Second-Order Unknowns

```{=latex}
\Needspace{10\baselineskip}
```
Convert:

$$
\begin{aligned}
u''+2u-v'&=0,\\
v''-u'+3v&=\cos t,
\end{aligned}
$$

using $\mathbf{x}=[u,u',v,v']^{\mathsf T}$.

#### Problem 11: Translate Mixed Initial Data

```{=latex}
\Needspace{10\baselineskip}
```
For the state order:

$$
\mathbf{x}=[r,r',r'',s,s']^{\mathsf T},
$$

```{=latex}
\Needspace{10\baselineskip}
```
write the initial vector when:

$$
r(2)=-1,\quad r'(2)=4,\quad r''(2)=0,\quad
s(2)=3,\quad s'(2)=-2.
$$

#### Problem 12: Use The Matrix-Exponential Bridge

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
y''-y=0,
\qquad
y(2)=3,\quad y'(2)=1
$$

is converted using $\mathbf{x}=[y,y']^{\mathsf T}$. Write the matrix IVP and
its solution in matrix-exponential form. It is not necessary to calculate the
entries of the exponential.

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
Start from:

$$
y''+7y'-2y=t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate $y''$:

$$
y''=-7y'+2y+t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x_1=y,\qquad x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the state definitions and substitute the isolated derivative:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=2x_1-7x_2+t^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
2&-7
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\t^2
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The state order is $[y,y']^{\mathsf T}$, so:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
y(0)\\y'(0)
\end{bmatrix}
=
\begin{bmatrix}
3\\-1
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
3y''-6t\,y'+9y=\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the lower-derivative terms to the right:

$$
3y''=6t\,y'-9y+\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $3$:

$$
y''=-3y+2t\,y'+\frac13\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-3x_1+2t\,x_2+\frac13\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-3&2t
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\\frac13\cos t
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the original initial time:

$$
\boxed{
\mathbf{x}(1)
=
\begin{bmatrix}
y(1)\\y'(1)
\end{bmatrix}
=
\begin{bmatrix}
0\\2
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Isolate the third derivative in:

$$
z'''-4z''+z'+6z=e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Moving the remaining terms gives:

$$
z'''=-6z-z'+4z''+e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
x_1=z,\qquad x_2=z',\qquad x_3=z''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The scalar state equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
x_3'&=-6x_1-x_2+4x_3+e^t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading the coefficients in the order $x_1,x_2,x_3$ gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&0&1\\
-6&-1&4
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\e^t
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
w^{(4)}+2w''-w=t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $w^{(4)}+2w''-w=t$, isolate the fourth derivative:

$$
w^{(4)}=w-2w''+t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define four components:

$$
x_1=w,\quad x_2=w',\quad x_3=w'',\quad x_4=w'''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate each definition and use the isolated equation in the final row:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
x_3'&=x_4,\\
x_4'&=x_1-2x_3+t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Make the missing coefficients visible:

$$
x_4'=1x_1+0x_2-2x_3+0x_4+t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0&0\\
0&0&1&0\\
0&0&0&1\\
1&0&-2&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\0\\t
\end{bmatrix}
}.
$$

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
The equation is:

$$
t\,y''+(1-t)y'+4y=\sqrt{t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For real $\sqrt t$, require $t\geq0$. Isolating $y''$ also requires $t\ne0$.
Together these restrictions give:

$$
t>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the lower-derivative terms:

$$
t\,y''=-(1-t)y'-4y+\sqrt t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $t$:

$$
y''
=
-\frac4t y
-\frac{1-t}{t}y'
+\frac{\sqrt t}{t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-\frac4t x_1-\frac{1-t}{t}x_2+\frac{\sqrt t}{t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-\frac4t&-\frac{1-t}{t}
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\\frac{\sqrt t}{t}
\end{bmatrix},
\qquad t>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Use the declared state:

$$
\mathbf{x}=
\begin{bmatrix}
y\\y'
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second row of the matrix system is:

$$
y''=8y-6y'+3\sin t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the state-dependent terms to the left:

$$
\boxed{y''+6y'-8y=3\sin t}.
$$

The first row gives $y'=y'$, confirming the derivative-chain ordering.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y''-5y'+2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate $y''$. The lower-order terms move right and change signs:

$$
y''=5y'-2y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the terms in state order $y,y'$:

$$
y''=-2y+5y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the final row is $[-2,5]$, not $[-2,-5]$. The correct matrix is:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-2&5
\end{bmatrix}
\mathbf{x}
}.
$$

The proposed conversion failed to change the sign of $-5y'$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mathbf{x}
=
\begin{bmatrix}
u\\v
\end{bmatrix},
\qquad
\mathbf{x}'
=
\begin{bmatrix}
u'\\v'
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Keep state terms and forcing terms separate:

$$
\begin{aligned}
u'&=2u-3v+e^{-t},\\
v'&=5u+1v-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
2&-3\\
5&1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
e^{-t}\\-4
\end{bmatrix}
}.
$$

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
Use the prescribed state order:

$$
x_1=p,\qquad x_2=p',\qquad x_3=q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate the required derivatives. From:

$$
p''-p'+2q=t
$$

```{=latex}
\Needspace{10\baselineskip}
```
obtain:

$$
p''=p'-2q+t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
q'+q-3p=e^t
$$

```{=latex}
\Needspace{10\baselineskip}
```
obtain:

$$
q'=3p-q+e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Translate the isolated formulas:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_2-2x_3+t,\\
x_3'&=3x_1-x_3+e^t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Make every state coefficient visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3,\\
x_2'&=0x_1+1x_2-2x_3+t,\\
x_3'&=3x_1+0x_2-1x_3+e^t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&1&-2\\
3&0&-1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\t\\e^t
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v,\qquad x_4=v'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $u''+2u-v'=0$, isolate:

$$
u''=-2u+v'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $v''-u'+3v=\cos t$, isolate:

$$
v''=u'-3v+\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Translate all four component derivatives:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-2x_1+x_4,\\
x_3'&=x_4,\\
x_4'&=x_2-3x_3+\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reading coefficients in the order $x_1,x_2,x_3,x_4$ gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0&0\\
-2&0&0&1\\
0&0&0&1\\
0&1&-3&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\0\\\cos t
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example, row $2$ expands to:

$$
x_2'=-2x_1+x_4,
$$

which restores to $u''=-2u+v'$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The declared state order is:

$$
\mathbf{x}=[r,r',r'',s,s']^{\mathsf T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the same ordering at $t=2$:

$$
\mathbf{x}(2)
=
\begin{bmatrix}
r(2)\\r'(2)\\r''(2)\\s(2)\\s'(2)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute each given value in its matching position:

$$
\boxed{
\mathbf{x}(2)
=
\begin{bmatrix}
-1\\4\\0\\3\\-2
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y''-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate the second derivative:

$$
y''=y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the matrix IVP is:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(2)
=
\begin{bmatrix}
3\\1
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix},
\qquad
\mathbf{c}=
\begin{bmatrix}
3\\1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a constant homogeneous system with $t_0=2$, Chapter 16 gives:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-2)}\mathbf{c}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A$ and $\mathbf{c}$:

$$
\boxed{
\mathbf{x}(t)
=
\exp\!\left(
\begin{bmatrix}
0&1\\1&0
\end{bmatrix}
(t-2)
\right)
\begin{bmatrix}
3\\1
\end{bmatrix}
}.
$$

The first component of $\mathbf{x}(t)$ is the original function $y(t)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 17 Final Summary {#chapter-17-final-summary-62}

```{=latex}
\Needspace{10\baselineskip}
```
An $n$th-order scalar equation becomes an $n$-component first-order system by
using:

$$
\boxed{
x_1=y,\quad x_2=y',\quad\ldots,\quad x_n=y^{(n-1)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the normalized equation:

$$
y^{(n)}+p_{n-1}(t)y^{(n-1)}+\cdots+p_1(t)y'+p_0(t)y=q(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the scalar first-order equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
&\ \vdots\\
x_{n-1}'&=x_n,\\
x_n'&=-p_0x_1-p_1x_2-\cdots-p_{n-1}x_n+q.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The companion matrix is:

$$
A(t)
=
\begin{bmatrix}
0&1&0&\cdots&0\\
0&0&1&\cdots&0\\
\vdots&\vdots&\vdots&\ddots&\vdots\\
0&0&0&\cdots&1\\
-p_0&-p_1&-p_2&\cdots&-p_{n-1}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Initial values are collected in state order:

$$
\boxed{
\mathbf{x}(t_0)
=
\begin{bmatrix}
y(t_0)\\y'(t_0)\\\vdots\\y^{(n-1)}(t_0)
\end{bmatrix}
}.
$$

For coupled equations, create enough components to represent every unknown and
every derivative level required by its order. Cross-coupling terms become
off-diagonal matrix entries.

```{=latex}
\Needspace{10\baselineskip}
```
For constant $A$, the converted homogeneous system connects directly to:

$$
\mathbf{x}'=A\mathbf{x},\quad \mathbf{x}(t_0)=\mathbf{c}
\quad\Longrightarrow\quad
\boxed{\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> declare the state order, isolate each highest derivative, write the scalar
> first-order equations, and only then read off the matrix row by row.
