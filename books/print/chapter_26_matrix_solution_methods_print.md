```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 26}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Matrix Solution Methods}
```
# Chapter 26 - Matrix Solution Methods

Earlier chapters developed three parts of one larger method:

-   Chapter 16 explained how to calculate the matrix exponential $e^{At}$
-   Chapter 17 converted higher-order equations into first-order systems
-   Chapter 25 solved coupled systems in the Laplace domain

This chapter joins those parts together in the time domain. We will solve
constant-coefficient systems directly with the matrix exponential, derive the
forced solution formula step by step, handle initial times other than zero,
and recover scalar solutions from state vectors.

```{=latex}
\Needspace{10\baselineskip}
```
The central problem is:

$$
\mathbf{x}'(t)=A\mathbf{x}(t)+\mathbf{f}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{x}_0,
$$

where $A$ is a constant square matrix.

```{=latex}
\Needspace{20\baselineskip}
```
## The Matrix Initial-Value Problem {#block-1-the-matrix-initial-value-problem}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to identify the role of every object in a matrix differential
equation and separate the effect of the initial state from the effect of the
forcing.

```{=latex}
\Needspace{8\baselineskip}
```
> the matrix exponential moves a state through time; an integral adds the
> contributions made by forcing along the way.

```{=latex}
\Needspace{12\baselineskip}
```
### Notation Before We Start {#notation-before-we-start-2}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\mathbf{x}'(t)=A\mathbf{x}(t)+\mathbf{f}(t).
$$

Here:

-   $t$ is the independent variable
-   $\mathbf{x}(t)$ is an $n$-component state vector
-   $\mathbf{x}'(t)$ contains the derivative of every state component
-   $A$ is a constant $n\times n$ matrix
-   $\mathbf{f}(t)$ is an $n$-component forcing vector
-   $t_0$ is the time at which the initial state is specified
-   $\mathbf{x}_0=\mathbf{x}(t_0)$ is the initial state
-   $I$ is the $n\times n$ identity matrix

The matrix $A$ must have as many rows and columns as $\mathbf{x}$ has
components. Then $A\mathbf{x}$ is another $n$-component vector, so it can be
added to $\mathbf{f}(t)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Expand A Two-Component System {#expand-a-two-component-system-3}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
x\\y
\end{bmatrix},
\qquad
\mathbf{f}=
\begin{bmatrix}
f\\g
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\mathbf{x}'=
\begin{bmatrix}
x'\\y'
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\begin{aligned}
A\mathbf{x}+\mathbf{f}
&=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix}
\begin{bmatrix}
x\\y
\end{bmatrix}
+
\begin{bmatrix}
f\\g
\end{bmatrix}\\
&=
\begin{bmatrix}
ax+by\\
cx+dy
\end{bmatrix}
+
\begin{bmatrix}
f\\g
\end{bmatrix}\\
&=
\begin{bmatrix}
ax+by+f\\
cx+dy+g
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the matrix equation is exactly the scalar system:

$$
\begin{aligned}
x'&=ax+by+f(t),\\
y'&=cx+dy+g(t).
\end{aligned}
$$

The matrix notation compresses the system; it does not change it.

```{=latex}
\Needspace{12\baselineskip}
```
### Homogeneous And Forced Parts {#homogeneous-and-forced-parts-4}

```{=latex}
\Needspace{10\baselineskip}
```
If $\mathbf{f}(t)=\mathbf{0}$, the system is homogeneous:

$$
\mathbf{x}'=A\mathbf{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $\mathbf{f}(t)\neq\mathbf{0}$, the system is forced or nonhomogeneous:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete response naturally divides into:

$$
\boxed{
\text{complete response}
=
\text{response to the initial state}
+
\text{response to the forcing}
}.
$$

That division will become visible in the solution formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-5}

A constant matrix $A$ controls how the state components interact. The vector
$\mathbf{x}_0$ supplies the starting state, while $\mathbf{f}(t)$ supplies
external input after the starting time.

```{=latex}
\Needspace{20\baselineskip}
```
## Homogeneous Systems And State Propagation {#block-2-homogeneous-systems-and-state-propagation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-6}

The goal is to solve a homogeneous matrix initial-value problem and understand
why the time difference $t-t_0$ appears.

```{=latex}
\Needspace{12\baselineskip}
```
### The Homogeneous Formula {#the-homogeneous-formula-7}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}'(t)=A\mathbf{x}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{x}_0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{x}_0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponent contains elapsed time:

$$
t-t_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the initial time, no time has elapsed. Substituting $t=t_0$ gives:

$$
\begin{aligned}
\mathbf{x}(t_0)
&=e^{A(t_0-t_0)}\mathbf{x}_0\\
&=e^{A0}\mathbf{x}_0\\
&=I\mathbf{x}_0\\
&=\mathbf{x}_0.
\end{aligned}
$$

The shift is therefore required when the initial time is not zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Differential Equation {#verify-the-differential-equation-8}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the proposed solution:

$$
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{x}_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate it. Since $A$ and $\mathbf{x}_0$ are constant:

$$
\begin{aligned}
\mathbf{x}'(t)
&=\frac{d}{dt}\left(e^{A(t-t_0)}\right)\mathbf{x}_0\\
&=Ae^{A(t-t_0)}\mathbf{x}_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The expression after $A$ is $\mathbf{x}(t)$, so:

$$
\mathbf{x}'(t)=A\mathbf{x}(t).
$$

The formula satisfies both parts of the initial-value problem.

```{=latex}
\Needspace{12\baselineskip}
```
### The State-Transition Matrix {#the-state-transition-matrix-9}

```{=latex}
\Needspace{10\baselineskip}
```
It is useful to name the matrix that moves a state from $t_0$ to $t$:

$$
\boxed{
\Phi(t,t_0)=e^{A(t-t_0)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then the homogeneous solution becomes:

$$
\mathbf{x}(t)=\Phi(t,t_0)\mathbf{x}_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $t_0<t_1<t_2$, moving first from $t_0$ to $t_1$ and then from $t_1$ to
$t_2$ gives:

$$
\begin{aligned}
\Phi(t_2,t_1)\Phi(t_1,t_0)
&=e^{A(t_2-t_1)}e^{A(t_1-t_0)}\\
&=e^{A[(t_2-t_1)+(t_1-t_0)]}\\
&=e^{A(t_2-t_0)}\\
&=\Phi(t_2,t_0).
\end{aligned}
$$

The middle time cancels because the two elapsed intervals join into one.

```{=latex}
\Needspace{12\baselineskip}
```
### A Nonzero Initial-Time Example {#a-nonzero-initial-time-example-10}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
2&0\\
0&-1
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(3)=
\begin{bmatrix}
4\\-2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
A=
\begin{bmatrix}
2&0\\
0&-1
\end{bmatrix},
\qquad
t_0=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $A$ is diagonal:

$$
e^{A(t-3)}=
\begin{bmatrix}
e^{2(t-3)}&0\\
0&e^{-(t-3)}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the homogeneous formula:

$$
\begin{aligned}
\mathbf{x}(t)
&=e^{A(t-3)}\mathbf{x}(3)\\
&=
\begin{bmatrix}
e^{2(t-3)}&0\\
0&e^{-(t-3)}
\end{bmatrix}
\begin{bmatrix}
4\\-2
\end{bmatrix}\\
&=
\begin{bmatrix}
4e^{2(t-3)}\\
-2e^{-(t-3)}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
x_1(t)=4e^{2(t-3)},
\qquad
x_2(t)=-2e^{-(t-3)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=3$ to check the starting values:

$$
x_1(3)=4e^0=4,
\qquad
x_2(3)=-2e^0=-2.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Coupled Nilpotent Example {#a-coupled-nilpotent-example-11}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
-1&1\\
0&-1
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Split the matrix as:

$$
A=-I+N,
\qquad
N=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $N^2$:

$$
N^2=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}
=
\begin{bmatrix}
0&0\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $N^2=0$, its exponential stops after the linear term:

$$
e^{Nt}=I+tN
=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrices $-I$ and $N$ commute, so:

$$
\begin{aligned}
e^{At}
&=e^{(-I+N)t}\\
&=e^{-tI}e^{Nt}\\
&=e^{-t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using the calculated exponential, apply
$\mathbf{x}(t)=e^{At}\mathbf{x}(0)$:

$$
\begin{aligned}
\mathbf{x}(t)
&=e^{At}\mathbf{x}(0)\\
&=e^{-t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
\begin{bmatrix}
1\\2
\end{bmatrix}\\
&=e^{-t}
\begin{bmatrix}
1+2t\\2
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
x_1(t)=(1+2t)e^{-t},
\qquad
x_2(t)=2e^{-t}
}.
$$

The factor $t$ appears because the off-diagonal coupling transfers the second
component into the first.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-12}

For a homogeneous constant system, $e^{A(t-t_0)}$ carries the initial state
forward by the elapsed time. Calculate the exponential first, then multiply it
by the complete initial vector.

```{=latex}
\Needspace{20\baselineskip}
```
## Deriving The Forced Solution Formula {#block-3-deriving-the-forced-solution-formula}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-13}

The goal is to derive the forced solution rather than present its integral as
an unexplained rule.

```{=latex}
\Needspace{12\baselineskip}
```
### Why A Constant Vector Is No Longer Enough {#why-a-constant-vector-is-no-longer-enough-14}

```{=latex}
\Needspace{10\baselineskip}
```
For the homogeneous system, a solution has the form:

$$
\mathbf{x}(t)=e^{At}\mathbf{c},
$$

where $\mathbf{c}$ is constant.

```{=latex}
\Needspace{10\baselineskip}
```
For the forced system:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the forcing continually changes the response. We therefore replace the
constant vector by an unknown vector function:

$$
\boxed{
\mathbf{x}(t)=e^{At}\mathbf{u}(t)
}.
$$

This is the matrix version of variation of parameters.

```{=latex}
\Needspace{12\baselineskip}
```
### Differentiate The Substitution {#differentiate-the-substitution-15}

```{=latex}
\Needspace{10\baselineskip}
```
For $\mathbf{x}=e^{At}\mathbf{u}$, both factors depend on $t$. Use the
product rule:

$$
\begin{aligned}
\mathbf{x}'
&=(e^{At})'\mathbf{u}+e^{At}\mathbf{u}'\\
&=Ae^{At}\mathbf{u}+e^{At}\mathbf{u}'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The original differential equation is:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\mathbf{x}=e^{At}\mathbf{u}$ into its right side:

$$
A\mathbf{x}+\mathbf{f}(t)
=Ae^{At}\mathbf{u}+\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equate the two expressions for $\mathbf{x}'$:

$$
Ae^{At}\mathbf{u}+e^{At}\mathbf{u}'
=Ae^{At}\mathbf{u}+\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $Ae^{At}\mathbf{u}$ from both sides:

$$
e^{At}\mathbf{u}'=\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply on the left by $e^{-At}$:

$$
\begin{aligned}
e^{-At}e^{At}\mathbf{u}'
&=e^{-At}\mathbf{f}(t)\\
I\mathbf{u}'
&=e^{-At}\mathbf{f}(t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\mathbf{u}'(t)=e^{-At}\mathbf{f}(t)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Integrate And Apply The Initial State {#integrate-and-apply-the-initial-state-16}

```{=latex}
\Needspace{10\baselineskip}
```
Integrate $\mathbf{u}'(s)$ from $t_0$ to $t$:

$$
\mathbf{u}(t)-\mathbf{u}(t_0)
=
\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\mathbf{u}(t)
=
\mathbf{u}(t_0)
+
\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
We still need $\mathbf{u}(t_0)$. From
$\mathbf{x}(t)=e^{At}\mathbf{u}(t)$:

$$
\mathbf{x}_0=e^{At_0}\mathbf{u}(t_0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $e^{-At_0}$ on the left:

$$
\begin{aligned}
e^{-At_0}\mathbf{x}_0
&=e^{-At_0}e^{At_0}\mathbf{u}(t_0)\\
&=I\mathbf{u}(t_0)\\
&=\mathbf{u}(t_0).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\mathbf{u}(t)
=e^{-At_0}\mathbf{x}_0
+\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $\mathbf{x}(t)=e^{At}\mathbf{u}(t)$:

$$
\boxed{
\mathbf{x}(t)
=e^{At}
\left[
e^{-At_0}\mathbf{x}_0
+\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds
\right]
}.
$$

This is the factored form of the forced solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Convert To The Convolution Form {#convert-to-the-convolution-form-17}

```{=latex}
\Needspace{10\baselineskip}
```
Distribute $e^{At}$ across the two terms:

$$
\begin{aligned}
\mathbf{x}(t)
&=e^{At}e^{-At_0}\mathbf{x}_0
+e^{At}\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because all exponentials here contain the same matrix $A$:

$$
e^{At}e^{-At_0}=e^{A(t-t_0)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrix $e^{At}$ does not depend on the integration variable $s$, so move
it inside the integral:

$$
e^{At}\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds
=
\int_{t_0}^{t}e^{At}e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the matrix exponentials inside the integrand:

$$
e^{At}e^{-As}=e^{A(t-s)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The result is:

$$
\boxed{
\mathbf{x}(t)
=e^{A(t-t_0)}\mathbf{x}_0
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

This is the convolution form. The variable $s$ is a temporary integration
variable; after integration, the answer is a function of $t$.

```{=latex}
\Needspace{12\baselineskip}
```
### Interpret The Two Terms {#interpret-the-two-terms-18}

```{=latex}
\Needspace{10\baselineskip}
```
The first term is:

$$
e^{A(t-t_0)}\mathbf{x}_0.
$$

It is the response that would remain if the forcing were removed.

```{=latex}
\Needspace{10\baselineskip}
```
The second term is:

$$
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

At time $s$, the forcing contributes a small state change
$\mathbf{f}(s)\,ds$. The factor $e^{A(t-s)}$ then carries that contribution
from time $s$ to the observation time $t$.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
In everyday terms:

```{=latex}
\Needspace{8\baselineskip}
```
> the solution remembers both where the system started and everything that
> was added after it started.

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Initial Condition Locally {#check-the-initial-condition-locally-19}

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=t_0$ in the convolution form. The transition interval becomes zero
and the integral receives equal limits:

$$
\begin{aligned}
\mathbf{x}(t_0)
&=e^{A(t_0-t_0)}\mathbf{x}_0
+\int_{t_0}^{t_0}e^{A(t_0-s)}\mathbf{f}(s)\,ds\\
&=I\mathbf{x}_0+\mathbf{0}\\
&=\mathbf{x}_0.
\end{aligned}
$$

The integral vanishes because its upper and lower limits are equal.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-20}

```{=latex}
\Needspace{10\baselineskip}
```
Replacing the constant vector in $e^{At}\mathbf{c}$ by a vector function
produces the forced solution. The two useful forms are:

$$
\mathbf{x}(t)
=e^{At}
\left[
e^{-At_0}\mathbf{x}_0
+\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds
\right]
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\mathbf{x}(t)
=e^{A(t-t_0)}\mathbf{x}_0
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{20\baselineskip}
```
## Complete Forced-System Calculations {#block-4-complete-forced-system-calculations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-21}

The goal is to calculate the forcing integral without concealing the matrix
substitution or component integrals.

```{=latex}
\Needspace{12\baselineskip}
```
### A Diagonal Forced System {#a-diagonal-forced-system-22}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
-1&0\\
0&-2
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
1\\e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
-1&0\\
0&-2
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the transition matrix over an interval $t-s$ is:

$$
e^{A(t-s)}=
\begin{bmatrix}
e^{-(t-s)}&0\\
0&e^{-2(t-s)}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the convolution formula with $t_0=0$:

$$
\mathbf{x}(t)
=e^{At}\mathbf{x}(0)
+\int_0^t e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First calculate the initial-state response:

$$
\begin{aligned}
e^{At}\mathbf{x}(0)
&=
\begin{bmatrix}
e^{-t}&0\\
0&e^{-2t}
\end{bmatrix}
\begin{bmatrix}
0\\1
\end{bmatrix}\\
&=
\begin{bmatrix}
0\\e^{-2t}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Next multiply the transition matrix by the forcing at time $s$:

$$
\begin{aligned}
e^{A(t-s)}\mathbf{f}(s)
&=
\begin{bmatrix}
e^{-(t-s)}&0\\
0&e^{-2(t-s)}
\end{bmatrix}
\begin{bmatrix}
1\\e^{-s}
\end{bmatrix}\\
&=
\begin{bmatrix}
e^{-(t-s)}\\
e^{-2(t-s)}e^{-s}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the first component:

$$
\begin{aligned}
\int_0^t e^{-(t-s)}\,ds
&=e^{-t}\int_0^t e^s\,ds\\
&=e^{-t}\left[e^s\right]_0^t\\
&=e^{-t}(e^t-1)\\
&=1-e^{-t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the second component, first combine the exponents:

$$
\begin{aligned}
e^{-2(t-s)}e^{-s}
&=e^{-2t+2s-s}\\
&=e^{-2t+s}\\
&=e^{-2t}e^s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now integrate:

$$
\begin{aligned}
\int_0^t e^{-2(t-s)}e^{-s}\,ds
&=e^{-2t}\int_0^t e^s\,ds\\
&=e^{-2t}(e^t-1)\\
&=e^{-t}-e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the forcing response is:

$$
\int_0^t e^{A(t-s)}\mathbf{f}(s)\,ds
=
\begin{bmatrix}
1-e^{-t}\\
e^{-t}-e^{-2t}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the initial-state and forcing responses:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
0\\e^{-2t}
\end{bmatrix}
+
\begin{bmatrix}
1-e^{-t}\\
e^{-t}-e^{-2t}
\end{bmatrix}\\
&=
\begin{bmatrix}
1-e^{-t}\\e^{-t}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
x_1(t)=1-e^{-t},
\qquad
x_2(t)=e^{-t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify Both Rows Of The System {#verify-both-rows-of-the-system-23}

```{=latex}
\Needspace{10\baselineskip}
```
The proposed solution is:

$$
x_1=1-e^{-t},
\qquad
x_2=e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x_1'=e^{-t},
\qquad
x_2'=-e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first differential equation is $x_1'=-x_1+1$. Its right side is:

$$
\begin{aligned}
-x_1+1
&=-(1-e^{-t})+1\\
&=e^{-t}\\
&=x_1'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second equation is $x_2'=-2x_2+e^{-t}$. Its right side is:

$$
\begin{aligned}
-2x_2+e^{-t}
&=-2e^{-t}+e^{-t}\\
&=-e^{-t}\\
&=x_2'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
x_1(0)=0,
\qquad
x_2(0)=1.
$$

Both equations and both initial values are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### A Forced Triangular System {#a-forced-triangular-system-24}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\2
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $A^2=0$:

$$
e^{Ar}=I+rA
=
\begin{bmatrix}
1&r\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $r=t-s$ for the forcing term:

$$
e^{A(t-s)}=
\begin{bmatrix}
1&t-s\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial-state response is:

$$
\begin{aligned}
e^{At}\mathbf{x}(0)
&=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
\begin{bmatrix}
1\\-1
\end{bmatrix}\\
&=
\begin{bmatrix}
1-t\\-1
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate the forcing integrand:

$$
\begin{aligned}
e^{A(t-s)}\mathbf{f}(s)
&=
\begin{bmatrix}
1&t-s\\
0&1
\end{bmatrix}
\begin{bmatrix}
0\\2
\end{bmatrix}\\
&=
\begin{bmatrix}
2(t-s)\\2
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate each component:

$$
\begin{aligned}
\int_0^t2(t-s)\,ds
&=\left[2ts-s^2\right]_0^t\\
&=2t^2-t^2\\
&=t^2,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\int_0^t2\,ds=2t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\int_0^t e^{A(t-s)}\mathbf{f}(s)\,ds
=
\begin{bmatrix}
t^2\\2t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add both responses:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
1-t\\-1
\end{bmatrix}
+
\begin{bmatrix}
t^2\\2t
\end{bmatrix}\\
&=
\begin{bmatrix}
1-t+t^2\\-1+2t
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
x_1(t)=1-t+t^2,
\qquad
x_2(t)=-1+2t
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why The First Component Becomes Quadratic {#why-the-first-component-becomes-quadratic-25}

```{=latex}
\Needspace{10\baselineskip}
```
Expanding the system gives:

$$
x_1'=x_2,
\qquad
x_2'=2.
$$

The constant forcing makes $x_2$ linear. Because $x_1'=x_2$, integrating
that linear function makes $x_1$ quadratic.

The same mechanism appeared inside the matrix integral as the factor $t-s$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-26}

In a forced calculation, keep three stages visible:

1.  calculate the initial-state response
2.  multiply $e^{A(t-s)}$ by $\mathbf{f}(s)$ before integrating
3.  add the two response vectors component by component

This prevents the transition matrix, forcing vector, and integration variable
from becoming mixed together.

```{=latex}
\Needspace{20\baselineskip}
```
## Solving A Scalar Equation Through Its State Vector {#block-5-solving-a-scalar-equation-through-its-state-vector}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-27}

The goal is to complete the entire chain from a scalar differential equation
to a matrix solution and then back to the original unknown function.

```{=latex}
\Needspace{12\baselineskip}
```
### The Initial-Value Problem {#the-initial-value-problem-28}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+3y'+2y=0,
\qquad
y(0)=1,
\qquad
y'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the state components:

$$
x_1=y,
\qquad
x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the first state definition:

$$
x_1'=y'=x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Isolate $y''$ in the original equation:

$$
y''=-2y-3y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y$ by $x_1$ and $y'$ by $x_2$:

$$
x_2'=-2x_1-3x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Stack the two state equations:

$$
\begin{bmatrix}
x_1'\\x_2'
\end{bmatrix}
=
\begin{bmatrix}
0&1\\
-2&-3
\end{bmatrix}
\begin{bmatrix}
x_1\\x_2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
A=
\begin{bmatrix}
0&1\\
-2&-3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Convert the initial data in the declared state order:

$$
\mathbf{x}(0)
=
\begin{bmatrix}
x_1(0)\\x_2(0)
\end{bmatrix}
=
\begin{bmatrix}
y(0)\\y'(0)
\end{bmatrix}
=
\begin{bmatrix}
1\\0
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Calculate The Matrix Exponential {#calculate-the-matrix-exponential-29}

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial of $A$ is:

$$
\begin{aligned}
\det(\lambda I-A)
&=
\det
\begin{bmatrix}
\lambda&-1\\
2&\lambda+3
\end{bmatrix}\\
&=\lambda(\lambda+3)-(-1)(2)\\
&=\lambda^2+3\lambda+2\\
&=(\lambda+1)(\lambda+2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distinct eigenvalues are $-1$ and $-2$. By the two-eigenvalue
interpolation formula, write:

$$
e^{At}=\alpha(t)I+\beta(t)A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $\lambda=-1$ and $\lambda=-2$, the scalar polynomial
$\alpha+\beta\lambda$ must match $e^{\lambda t}$:

$$
\begin{aligned}
\alpha-\beta&=e^{-t},\\
\alpha-2\beta&=e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the second equation from the first:

$$
\beta=e^{-t}-e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into $\alpha-\beta=e^{-t}$:

$$
\begin{aligned}
\alpha-(e^{-t}-e^{-2t})&=e^{-t},\\
\alpha&=2e^{-t}-e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^{At}
=(2e^{-t}-e^{-2t})I
+(e^{-t}-e^{-2t})A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $I$ and $A$:

$$
\begin{aligned}
e^{At}
&=(2e^{-t}-e^{-2t})
\begin{bmatrix}
1&0\\0&1
\end{bmatrix}
+(e^{-t}-e^{-2t})
\begin{bmatrix}
0&1\\-2&-3
\end{bmatrix}\\
&=
\begin{bmatrix}
2e^{-t}-e^{-2t}&e^{-t}-e^{-2t}\\
-2e^{-t}+2e^{-2t}&-e^{-t}+2e^{-2t}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Apply The Initial State And Recover Y {#apply-the-initial-state-and-recover-y-30}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the calculated matrix and initial state:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
2e^{-t}-e^{-2t}&e^{-t}-e^{-2t}\\
-2e^{-t}+2e^{-2t}&-e^{-t}+2e^{-2t}
\end{bmatrix}
\begin{bmatrix}
1\\0
\end{bmatrix}\\
&=
\begin{bmatrix}
2e^{-t}-e^{-2t}\\
-2e^{-t}+2e^{-2t}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recall the state definitions:

$$
x_1=y,
\qquad
x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The original unknown is the first component, so:

$$
\boxed{
y(t)=2e^{-t}-e^{-2t}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second component confirms its derivative:

$$
\begin{aligned}
y'(t)
&=\frac{d}{dt}(2e^{-t}-e^{-2t})\\
&=-2e^{-t}+2e^{-2t}\\
&=x_2(t).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Scalar Problem {#verify-the-scalar-problem-31}

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
y=2e^{-t}-e^{-2t},
$$

```{=latex}
\Needspace{10\baselineskip}
```
differentiate twice:

$$
\begin{aligned}
y'&=-2e^{-t}+2e^{-2t},\\
y''&=2e^{-t}-4e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side of the scalar equation:

$$
\begin{aligned}
y''+3y'+2y
&=(2e^{-t}-4e^{-2t})
+3(-2e^{-t}+2e^{-2t})
+2(2e^{-t}-e^{-2t})\\
&=(2-6+4)e^{-t}
+(-4+6-2)e^{-2t}\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the initial values:

$$
y(0)=2-1=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'(0)=-2+2=0.
$$

The recovered first component solves the original initial-value problem.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Matrix Method Has Added {#what-the-matrix-method-has-added-32}

For this second-order equation, a characteristic-polynomial method would be
shorter. The matrix route becomes especially useful when:

-   several equations are coupled
-   the state vector has a physical interpretation
-   one matrix exponential will be reused for many initial states
-   forcing must be added to a system
-   a numerical or computational state-space method will follow

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> the matrix method solves every state component together and preserves the
> relationships between them.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-33}

To solve a scalar equation by matrix methods, declare the state order, build
the first-order system, convert the initial data in that same order, solve the
matrix problem, and explicitly recover the original unknown from its state
component.

```{=latex}
\Needspace{20\baselineskip}
```
## Solutions Without Prescribed Initial Conditions {#block-6-solutions-without-prescribed-initial-conditions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-34}

The goal is to write a general solution when no initial state has been given
and understand where the arbitrary constants belong.

```{=latex}
\Needspace{12\baselineskip}
```
### The Homogeneous General Solution {#the-homogeneous-general-solution-35}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}'=A\mathbf{x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
with no initial condition, write:

$$
\boxed{
\mathbf{x}(t)=e^{At}\mathbf{c}
},
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
\mathbf{c}=
\begin{bmatrix}
c_1\\c_2\\\vdots\\c_n
\end{bmatrix}
$$

is an arbitrary constant vector.

There are $n$ independent constants because an $n$-component first-order
system requires $n$ scalar initial values to select one solution.

```{=latex}
\Needspace{12\baselineskip}
```
### The Forced General Solution {#the-forced-general-solution-36}

```{=latex}
\Needspace{10\baselineskip}
```
The variation-of-parameters derivation gave:

$$
\mathbf{u}'(t)=e^{-At}\mathbf{f}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Without initial data, integrate indefinitely:

$$
\mathbf{u}(t)
=\mathbf{c}+\int e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into $\mathbf{x}=e^{At}\mathbf{u}$:

$$
\boxed{
\mathbf{x}(t)
=e^{At}
\left[
\mathbf{c}+\int e^{-As}\mathbf{f}(s)\,ds
\right]
}.
$$

The integral means any one vector antiderivative. Constants produced by that
antiderivative can be absorbed into the already arbitrary vector
$\mathbf{c}$.

```{=latex}
\Needspace{10\baselineskip}
```
For cleaner definite integrals, choose any fixed reference time $\tau$ and
write:

$$
\boxed{
\mathbf{x}(t)
=e^{A(t-\tau)}\mathbf{c}
+\int_{\tau}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

Here $\mathbf{c}$ represents the arbitrary state at $t=\tau$.

```{=latex}
\Needspace{12\baselineskip}
```
### A General Forced Example {#a-general-forced-example-37}

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
\mathbf{x}'=
\begin{bmatrix}
1&0\\
0&-1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
e^t\\1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
1&0\\
0&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
e^{At}=
\begin{bmatrix}
e^t&0\\
0&e^{-t}
\end{bmatrix},
\qquad
e^{-At}=
\begin{bmatrix}
e^{-t}&0\\
0&e^t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply $e^{-At}$ by the forcing:

$$
\begin{aligned}
e^{-At}\mathbf{f}(t)
&=
\begin{bmatrix}
e^{-t}&0\\
0&e^t
\end{bmatrix}
\begin{bmatrix}
e^t\\1
\end{bmatrix}\\
&=
\begin{bmatrix}
1\\e^t
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate component by component, choosing one antiderivative with no added
constants:

$$
\int e^{-At}\mathbf{f}(t)\,dt
=
\begin{bmatrix}
t\\e^t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the arbitrary vector:

$$
\mathbf{c}=
\begin{bmatrix}
c_1\\c_2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now multiply by $e^{At}$:

$$
\begin{aligned}
\mathbf{x}(t)
&=e^{At}
\left[
\mathbf{c}+
\begin{bmatrix}
t\\e^t
\end{bmatrix}
\right]\\
&=
\begin{bmatrix}
e^t&0\\
0&e^{-t}
\end{bmatrix}
\begin{bmatrix}
c_1+t\\c_2+e^t
\end{bmatrix}\\
&=
\begin{bmatrix}
e^t(c_1+t)\\c_2e^{-t}+1
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
x_1(t)=c_1e^t+te^t,
\qquad
x_2(t)=c_2e^{-t}+1
}.
$$

The term $te^t$ appears because the first forcing $e^t$ has the same
exponential form as the first homogeneous mode. This is the matrix version of
resonance in undetermined coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The General Forced Example {#verify-the-general-forced-example-38}

```{=latex}
\Needspace{10\baselineskip}
```
The scalar rows are:

$$
x_1'=x_1+e^t,
\qquad
x_2'=-x_2+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x_1=c_1e^t+te^t$, use the product rule:

$$
\begin{aligned}
x_1'
&=c_1e^t+(te^t)'\\
&=c_1e^t+(e^t+te^t)\\
&=(c_1e^t+te^t)+e^t\\
&=x_1+e^t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x_2=c_2e^{-t}+1$:

$$
\begin{aligned}
x_2'
&=-c_2e^{-t},\\
-x_2+1
&=-(c_2e^{-t}+1)+1\\
&=-c_2e^{-t}\\
&=x_2'.
\end{aligned}
$$

Both arbitrary constants remain free because no initial values were supplied.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-39}

Without initial conditions, retain an arbitrary constant vector. For a
homogeneous system use $e^{At}\mathbf{c}$; for a forced system add any one
particular response obtained from the matrix integral.

```{=latex}
\Needspace{20\baselineskip}
```
## Choosing A Formula And Avoiding Common Errors {#block-7-choosing-a-formula-and-avoiding-common-errors}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to choose an efficient form of the solution and keep the matrix
algebra logically checkable.

```{=latex}
\Needspace{12\baselineskip}
```
### The Three Main Forms {#the-three-main-forms-41}

```{=latex}
\Needspace{10\baselineskip}
```
For a homogeneous IVP:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{x}_0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a forced IVP, the convolution form is:

$$
\boxed{
\mathbf{x}(t)
=e^{A(t-t_0)}\mathbf{x}_0
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equivalent factored form is:

$$
\boxed{
\mathbf{x}(t)
=e^{At}
\left[
e^{-At_0}\mathbf{x}_0
+\int_{t_0}^{t}e^{-As}\mathbf{f}(s)\,ds
\right]
}.
$$

Use whichever form produces the cleaner multiplication and integration. The
two formulas describe the same solution.

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Matrix-Method Workflow {#a-reliable-matrix-method-workflow-42}

#### Step 1: Put the problem in standard state form

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t).
$$

If the problem began as a higher-order scalar equation, declare every state
component before constructing $A$.

#### Step 2: Record the complete initial state

```{=latex}
\Needspace{10\baselineskip}
```
Keep the state order visible:

$$
\mathbf{x}(t_0)=\mathbf{x}_0.
$$

#### Step 3: Calculate the required matrix exponential

Use diagonal structure, nilpotence, a scalar shift, diagonalization,
Cayley--Hamilton reduction, or another justified method.

#### Step 4: Choose the correct solution formula

Remove the integral only when $\mathbf{f}(t)=\mathbf{0}$.

#### Step 5: Show matrix-vector products before integration

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
e^{A(t-s)}\mathbf{f}(s)
$$

as a vector before integrating its components.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Add the two response vectors

Keep the initial-state response and forcing response separate until both are
known.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Recover the requested variables

If the state was built from $y,y',\ldots$, state which component equals $y$.

#### Step 8: Verify locally

Check every differential equation and every supplied initial condition.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Exponentiating Each Entry {#common-mistake-exponentiating-each-entry-43}

```{=latex}
\Needspace{10\baselineskip}
```
In general:

$$
e^{At}\neq
\begin{bmatrix}
e^{a_{11}t}&\cdots&e^{a_{1n}t}\\
\vdots&\ddots&\vdots\\
e^{a_{n1}t}&\cdots&e^{a_{nn}t}
\end{bmatrix}.
$$

The entrywise shortcut works for diagonal matrices only because all
off-diagonal entries remain zero and the powers stay diagonal.[^2]

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting The Initial-Time Shift {#common-mistake-forgetting-the-initial-time-shift-44}

```{=latex}
\Needspace{10\baselineskip}
```
If $\mathbf{x}(4)=\mathbf{x}_0$, the homogeneous response is:

$$
e^{A(t-4)}\mathbf{x}_0,
$$

not $e^{At}\mathbf{x}_0$.

The quick check is to substitute $t=4$. The correct transition matrix becomes
$e^{A0}=I$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using T Inside The Integral {#common-mistake-using-t-inside-the-integral-45}

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds,
$$

$t$ is the observation time and $s$ is the integration variable. The forcing
must be written as $\mathbf{f}(s)$ inside the integral.

Writing $\mathbf{f}(t)$ inside and treating it as constant with respect to $s$
usually changes the problem.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Multiplying In The Wrong Order {#common-mistake-multiplying-in-the-wrong-order-46}

```{=latex}
\Needspace{10\baselineskip}
```
The forcing contribution is:

$$
e^{A(t-s)}\mathbf{f}(s).
$$

The matrix is $n\times n$ and the vector is $n\times1$, so this product is
defined. The reversed product $\mathbf{f}(s)e^{A(t-s)}$ is not defined when
$\mathbf{f}$ is a column vector.

Matrix multiplication order is part of the formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Recovering The Wrong Component {#common-mistake-recovering-the-wrong-component-47}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
\mathbf{x}=
\begin{bmatrix}
y\\y'
\end{bmatrix},
$$

then the first component is $y$ and the second is $y'$. If a different state
order was declared, the interpretation changes.

Always repeat the state definitions immediately before extracting the final
scalar answer.

```{=latex}
\Needspace{12\baselineskip}
```
### The Laplace-Domain Connection {#the-laplace-domain-connection-48}

```{=latex}
\Needspace{10\baselineskip}
```
For $t_0=0$, transform:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
\qquad
\mathbf{x}(0)=\mathbf{x}_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed equation is:

$$
s\mathbf{X}(s)-\mathbf{x}_0
=A\mathbf{X}(s)+\mathbf{F}(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the transform terms to the left:

$$
(sI-A)\mathbf{X}(s)
=\mathbf{x}_0+\mathbf{F}(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $(sI-A)^{-1}$:

$$
\mathbf{X}(s)
=(sI-A)^{-1}\mathbf{x}_0
+(sI-A)^{-1}\mathbf{F}(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transform pair:

$$
\mathcal{L}\{e^{At}\}=(sI-A)^{-1}
$$

turns the first product into the initial-state response and the second product
into a convolution. Thus the Laplace and matrix-exponential methods lead to
the same time-domain formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-49}

Choose the formula from the presence or absence of forcing and initial data.
Preserve matrix order, distinguish $t$ from the integration variable, and
verify the final result in the original representation.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Homogeneous Foundations {#problems-1-to-4-homogeneous-foundations-50}

#### Problem 1: Expand A Matrix System

```{=latex}
\Needspace{10\baselineskip}
```
Write the matrix equation as two scalar differential equations:

$$
\mathbf{x}'=
\begin{bmatrix}
-2&3\\
1&-4
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
t\\e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
u\\v
\end{bmatrix}.
$$

#### Problem 2: Use A Nonzero Initial Time

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
-2&0\\
0&3
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(1)=
\begin{bmatrix}
5\\-1
\end{bmatrix}.
$$

#### Problem 3: Use A Nilpotent Exponential

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\3
\end{bmatrix}.
$$

#### Problem 4: Check State-Transition Composition

```{=latex}
\Needspace{10\baselineskip}
```
For constant $A$, verify directly that:

$$
\Phi(t_2,t_1)\Phi(t_1,t_0)=\Phi(t_2,t_0),
$$

where $\Phi(t,r)=e^{A(t-r)}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Forcing And General Solutions {#problems-5-to-8-forcing-and-general-solutions-51}

#### Problem 5: Separate Two Responses

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
-1&0\\
0&-1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
2\\0
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\4
\end{bmatrix}.
$$

#### Problem 6: Integrate A Coupled Forcing

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\t
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\0
\end{bmatrix}.
$$

#### Problem 7: Two Resonant Components

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
1&0\\
0&-2
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
e^t\\e^{-2t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\0
\end{bmatrix}.
$$

#### Problem 8: No Initial Conditions

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
\mathbf{x}'=
\begin{bmatrix}
0&0\\
0&-1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
2t\\1
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Scalar Recovery And Method Checks {#problems-9-to-12-scalar-recovery-and-method-checks-52}

#### Problem 9: Recover An Oscillating Scalar Solution

```{=latex}
\Needspace{10\baselineskip}
```
Convert and solve by matrix methods:

$$
y''+4y=0,
\qquad
y(0)=0,
\qquad
y'(0)=3.
$$

#### Problem 10: Recover A Forced Scalar Solution

```{=latex}
\Needspace{10\baselineskip}
```
Convert and solve by matrix methods:

$$
y''+y=1,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

#### Problem 11: Diagnose Three Formula Errors

Explain the error in each statement.

1.  If $\mathbf{x}'=A\mathbf{x}$ and $\mathbf{x}(5)=\mathbf{x}_0$, then
    $\mathbf{x}(t)=e^{At}\mathbf{x}_0$.
2.  The forced response is
    $\int_0^t\mathbf{f}(s)e^{A(t-s)}\,ds$ when $\mathbf{f}$ is a column vector.
3.  For every square matrix $A=[a_{ij}]$, the entries of $e^{At}$ are
    $e^{a_{ij}t}$.

#### Problem 12: Build The Resolvent Equation

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\mathbf{x}'=
\begin{bmatrix}
0&1\\
-2&-3
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\e^t
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\0
\end{bmatrix},
$$

write $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$ explicitly and calculate
$\det(sI-A)$. Do not invert the transforms.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-53}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mathbf{x}=
\begin{bmatrix}
u\\v
\end{bmatrix},
\qquad
\mathbf{x}'=
\begin{bmatrix}
u'\\v'
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the matrix by the state vector:

$$
\begin{aligned}
\begin{bmatrix}
-2&3\\
1&-4
\end{bmatrix}
\begin{bmatrix}
u\\v
\end{bmatrix}
&=
\begin{bmatrix}
-2u+3v\\
u-4v
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the forcing vector component by component:

$$
\begin{bmatrix}
u'\\v'
\end{bmatrix}
=
\begin{bmatrix}
-2u+3v+t\\
u-4v+e^{-t}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the scalar system is:

$$
\boxed{
\begin{aligned}
u'&=-2u+3v+t,\\
v'&=u-4v+e^{-t}.
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
t_0=1,
\qquad
A=
\begin{bmatrix}
-2&0\\
0&3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous formula is:

$$
\mathbf{x}(t)=e^{A(t-1)}\mathbf{x}(1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $A$ is diagonal:

$$
e^{A(t-1)}=
\begin{bmatrix}
e^{-2(t-1)}&0\\
0&e^{3(t-1)}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by the initial state:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
e^{-2(t-1)}&0\\
0&e^{3(t-1)}
\end{bmatrix}
\begin{bmatrix}
5\\-1
\end{bmatrix}\\
&=
\begin{bmatrix}
5e^{-2(t-1)}\\
-e^{3(t-1)}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
x_1(t)=5e^{-2(t-1)},
\qquad
x_2(t)=-e^{3(t-1)}
}.
$$

At $t=1$, both exponential factors equal $1$, recovering $(5,-1)^T$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the square:

$$
A^2=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential series therefore truncates:

$$
e^{At}=I+tA
=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the initial state:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
\begin{bmatrix}
1\\3
\end{bmatrix}\\
&=
\begin{bmatrix}
1+6t\\3
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
x_1(t)=1+6t,
\qquad
x_2(t)=3
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Start from the definition:

$$
\Phi(t,r)=e^{A(t-r)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute it into the left side:

$$
\Phi(t_2,t_1)\Phi(t_1,t_0)
=e^{A(t_2-t_1)}e^{A(t_1-t_0)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both exponentials are functions of the same matrix $A$, so they commute and
their exponents combine:

$$
\begin{aligned}
e^{A(t_2-t_1)}e^{A(t_1-t_0)}
&=e^{A[(t_2-t_1)+(t_1-t_0)]}\\
&=e^{A(t_2-t_0)}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the definition of $\Phi$:

$$
\boxed{
e^{A(t_2-t_0)}=\Phi(t_2,t_0)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-54}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Here $A=-I$, so:

$$
e^{A(t-s)}=e^{-(t-s)}I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mathbf{x}(t)
=e^{At}\mathbf{x}(0)
+\int_0^t e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial-state response is:

$$
\begin{aligned}
e^{At}\mathbf{x}(0)
&=e^{-t}I
\begin{bmatrix}
0\\4
\end{bmatrix}\\
&=
\begin{bmatrix}
0\\4e^{-t}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing integrand is:

$$
\begin{aligned}
e^{A(t-s)}\mathbf{f}(s)
&=e^{-(t-s)}I
\begin{bmatrix}
2\\0
\end{bmatrix}\\
&=
\begin{bmatrix}
2e^{-(t-s)}\\0
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate its first component:

$$
\begin{aligned}
\int_0^t2e^{-(t-s)}\,ds
&=2e^{-t}\int_0^t e^s\,ds\\
&=2e^{-t}(e^t-1)\\
&=2(1-e^{-t}).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
0\\4e^{-t}
\end{bmatrix}
+
\begin{bmatrix}
2(1-e^{-t})\\0
\end{bmatrix}\\
&=
\begin{bmatrix}
2(1-e^{-t})\\4e^{-t}
\end{bmatrix}.
\end{aligned}
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
A=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have $A^2=0$ and:

$$
e^{A(t-s)}=
\begin{bmatrix}
1&t-s\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial state is zero, so the homogeneous response is zero. Replace $t$
by the integration variable $s$ inside the forcing:

$$
\mathbf{f}(s)=
\begin{bmatrix}
0\\s
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply before integrating:

$$
\begin{aligned}
e^{A(t-s)}\mathbf{f}(s)
&=
\begin{bmatrix}
1&t-s\\
0&1
\end{bmatrix}
\begin{bmatrix}
0\\s
\end{bmatrix}\\
&=
\begin{bmatrix}
s(t-s)\\s
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the first component, expand and integrate:

$$
\begin{aligned}
\int_0^t s(t-s)\,ds
&=\int_0^t(ts-s^2)\,ds\\
&=\left[\frac{t s^2}{2}-\frac{s^3}{3}\right]_0^t\\
&=\frac{t^3}{2}-\frac{t^3}{3}\\
&=\frac{t^3}{6}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the second component:

$$
\int_0^t s\,ds=\frac{t^2}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
\mathbf{x}(t)=
\begin{bmatrix}
t^3/6\\t^2/2
\end{bmatrix}
}.
$$

The first row is $x_1'=x_2$; indeed,
$(t^3/6)'=t^2/2$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Use the factored formula with $t_0=0$ and $\mathbf{x}(0)=\mathbf{0}$:

$$
\mathbf{x}(t)
=e^{At}\int_0^t e^{-As}\mathbf{f}(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
1&0\\
0&-2
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have:

$$
e^{-As}=
\begin{bmatrix}
e^{-s}&0\\
0&e^{2s}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by the forcing at time $s$:

$$
\begin{aligned}
e^{-As}\mathbf{f}(s)
&=
\begin{bmatrix}
e^{-s}&0\\
0&e^{2s}
\end{bmatrix}
\begin{bmatrix}
e^s\\e^{-2s}
\end{bmatrix}\\
&=
\begin{bmatrix}
1\\1
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int_0^t
\begin{bmatrix}
1\\1
\end{bmatrix}ds
=
\begin{bmatrix}
t\\t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
e^t&0\\
0&e^{-2t}
\end{bmatrix}
\begin{bmatrix}
t\\t
\end{bmatrix}\\
&=
\begin{bmatrix}
te^t\\te^{-2t}
\end{bmatrix}.
\end{aligned}
$$

Both components acquire a factor $t$ because each forcing matches its
corresponding homogeneous mode.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
0&0\\
0&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
e^{At}=
\begin{bmatrix}
1&0\\
0&e^{-t}
\end{bmatrix},
\qquad
e^{-At}=
\begin{bmatrix}
1&0\\
0&e^t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by the forcing:

$$
\begin{aligned}
e^{-At}\mathbf{f}(t)
&=
\begin{bmatrix}
1&0\\
0&e^t
\end{bmatrix}
\begin{bmatrix}
2t\\1
\end{bmatrix}\\
&=
\begin{bmatrix}
2t\\e^t
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose the antiderivative:

$$
\int e^{-At}\mathbf{f}(t)\,dt
=
\begin{bmatrix}
t^2\\e^t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $\mathbf{c}=(c_1,c_2)^T$. The general formula gives:

$$
\begin{aligned}
\mathbf{x}(t)
&=e^{At}
\left[
\mathbf{c}+
\begin{bmatrix}
t^2\\e^t
\end{bmatrix}
\right]\\
&=
\begin{bmatrix}
1&0\\
0&e^{-t}
\end{bmatrix}
\begin{bmatrix}
c_1+t^2\\c_2+e^t
\end{bmatrix}\\
&=
\begin{bmatrix}
c_1+t^2\\c_2e^{-t}+1
\end{bmatrix}.
\end{aligned}
$$

Thus the two components are $x_1(t)=c_1+t^2$ and
$x_2(t)=c_2e^{-t}+1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-55}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
x_1=y,
\qquad
x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x_1'=x_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $y''+4y=0$:

$$
y''=-4y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
x_2'=-4x_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The state problem is:

$$
\mathbf{x}'=
\begin{bmatrix}
0&1\\
-4&0
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this matrix:

$$
e^{At}=
\begin{bmatrix}
\cos(2t)&\frac12\sin(2t)\\
-2\sin(2t)&\cos(2t)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the initial state:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
\cos(2t)&\frac12\sin(2t)\\
-2\sin(2t)&\cos(2t)
\end{bmatrix}
\begin{bmatrix}
0\\3
\end{bmatrix}\\
&=
\begin{bmatrix}
\frac32\sin(2t)\\3\cos(2t)
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $x_1=y$:

$$
\boxed{
y(t)=\frac32\sin(2t)
}.
$$

Its derivative is $3\cos(2t)$, which agrees with the second state component.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
x_1=y,
\qquad
x_2=y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $x_1'=x_2$. Isolate the second derivative:

$$
y''=1-y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\mathbf{x}'=
\begin{bmatrix}
0&1\\
-1&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\1
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
0\\0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
0&1\\
-1&0
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the transition matrix is:

$$
e^{A(t-s)}=
\begin{bmatrix}
\cos(t-s)&\sin(t-s)\\
-\sin(t-s)&\cos(t-s)
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial-state response is zero. Multiply the transition matrix by the
forcing:

$$
\begin{aligned}
e^{A(t-s)}
\begin{bmatrix}
0\\1
\end{bmatrix}
&=
\begin{bmatrix}
\sin(t-s)\\\cos(t-s)
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the first component. Let $r=t-s$, so $dr=-ds$:

$$
\begin{aligned}
\int_0^t\sin(t-s)\,ds
&=\int_t^0\sin r(-dr)\\
&=\int_0^t\sin r\,dr\\
&=\left[-\cos r\right]_0^t\\
&=1-\cos t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the second component similarly:

$$
\begin{aligned}
\int_0^t\cos(t-s)\,ds
&=\int_0^t\cos r\,dr\\
&=\sin t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\mathbf{x}(t)=
\begin{bmatrix}
1-\cos t\\\sin t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recover the original unknown from $x_1=y$:

$$
\boxed{
y(t)=1-\cos t
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

#### Statement 1

```{=latex}
\Needspace{10\baselineskip}
```
The formula omits the initial-time shift. Since the state is specified at
$t_0=5$, the correct homogeneous solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-5)}\mathbf{x}_0
}.
$$

At $t=5$, this gives $e^{A0}\mathbf{x}_0=\mathbf{x}_0$.

#### Statement 2

```{=latex}
\Needspace{10\baselineskip}
```
The multiplication order is reversed. A column vector cannot generally
multiply an $n\times n$ matrix from the left. The correct forcing response is:

$$
\boxed{
\int_0^t e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

#### Statement 3

```{=latex}
\Needspace{10\baselineskip}
```
The matrix exponential is defined by a power series involving matrix powers,
not by exponentiating entries independently:

$$
e^{At}=I+At+\frac{A^2t^2}{2!}+\cdots.
$$

Entrywise exponentiation is not valid for a general matrix. For example, the
diagonal matrix $A=\operatorname{diag}(a,b)$ has
$e^{At}=\operatorname{diag}(e^{at},e^{bt})$. Its off-diagonal entries remain
zero, whereas exponentiating the zero entries individually would incorrectly
produce $e^0=1$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
\mathbf{X}(s)=\mathcal{L}\{\mathbf{x}(t)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing transform is:

$$
\mathbf{F}(s)=
\begin{bmatrix}
0\\\frac1{s-1}
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $sI-A$:

$$
\begin{aligned}
sI-A
&=
\begin{bmatrix}
s&0\\0&s
\end{bmatrix}
-
\begin{bmatrix}
0&1\\-2&-3
\end{bmatrix}\\
&=
\begin{bmatrix}
s&-1\\2&s+3
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side is:

$$
\begin{aligned}
\mathbf{x}_0+\mathbf{F}(s)
&=
\begin{bmatrix}
1\\0
\end{bmatrix}
+
\begin{bmatrix}
0\\\frac1{s-1}
\end{bmatrix}\\
&=
\begin{bmatrix}
1\\\frac1{s-1}
\end{bmatrix}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the explicit resolvent equation is:

$$
\boxed{
\begin{bmatrix}
s&-1\\
2&s+3
\end{bmatrix}
\mathbf{X}(s)
=
\begin{bmatrix}
1\\\frac1{s-1}
\end{bmatrix}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the determinant:

$$
\begin{aligned}
\det(sI-A)
&=s(s+3)-(-1)(2)\\
&=s^2+3s+2\\
&=(s+1)(s+2).
\end{aligned}
$$

The factors agree with the two homogeneous modes $e^{-t}$ and $e^{-2t}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 26 Final Summary {#chapter-26-final-summary-56}

```{=latex}
\Needspace{10\baselineskip}
```
For the constant-coefficient matrix initial-value problem:

$$
\mathbf{x}'(t)=A\mathbf{x}(t)+\mathbf{f}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{x}_0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the solution is:

$$
\boxed{
\mathbf{x}(t)
=e^{A(t-t_0)}\mathbf{x}_0
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

The first term carries the initial state. The integral accumulates forcing
contributions and carries each one from its input time $s$ to the observation
time $t$.

```{=latex}
\Needspace{10\baselineskip}
```
Without initial conditions:

$$
\boxed{
\mathbf{x}(t)=e^{At}\mathbf{c}
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
for a homogeneous system, while a forced general solution is:

$$
\boxed{
\mathbf{x}(t)
=e^{At}
\left[
\mathbf{c}+\int e^{-As}\mathbf{f}(s)\,ds
\right]
}.
$$

[^1]: The integral is a continuous sum of contributions made at
    different times. Earlier contributions evolve for longer because their
    elapsed time $t-s$ is larger.

[^2]: The matrix exponential is defined by
    $e^{At}=I+At+(At)^2/2!+\cdots$. Matrix multiplication inside the powers is
    what creates coupling between entries.
