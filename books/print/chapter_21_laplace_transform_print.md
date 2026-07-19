```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 21}}
\fancyhead[R]{\sffamily\small\color{BodyInk}The Laplace Transform}
```
# Chapter 21 - The Laplace Transform

The previous chapters studied differential equations directly in the original
independent variable. The Laplace transform introduces a different viewpoint:
it converts a function of time into a function of a new variable $s$.

```{=latex}
\Needspace{10\baselineskip}
```
For a suitable function $f(t)$, write:

$$
\mathcal{L}\{f(t)\}=F(s).
$$

This chapter develops the **forward** transform. We will:

-   define it as an improper integral
-   track the values of $s$ for which that integral converges
-   derive a small table of standard transforms
-   use linearity, shifting, differentiation, scaling, and division properties
-   transform finite piecewise and periodic functions

Inverse transforms begin in Chapter 22.

```{=latex}
\Needspace{20\baselineskip}
```
## From A Time Function To An S-Function {#block-1-from-a-time-function-to-an-s-function}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to understand every symbol in the Laplace-transform definition and
why convergence must be checked rather than assumed.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definition {#the-definition-2}

```{=latex}
\Needspace{10\baselineskip}
```
For a function $f(t)$ defined for $t\geq0$, its Laplace transform is:

$$
\boxed{
F(s)
=
\mathcal{L}\{f(t)\}
=
\int_0^\infty e^{-st}f(t)\,dt
}.
$$

Here:

-   $t$ is the integration variable, usually representing time
-   $s$ is a parameter and is treated as constant during the integration
-   $f(t)$ is the original function
-   $F(s)$ is the transformed function
-   $e^{-st}$ is the transform kernel

The braces in $\mathcal{L}\{f(t)\}$ identify the function being transformed.
They are not multiplication symbols.

```{=latex}
\Needspace{12\baselineskip}
```
### The Integral Is Improper {#the-integral-is-improper-3}

```{=latex}
\Needspace{10\baselineskip}
```
The upper limit $\infty$ means that the definition is shorthand for a limit:

$$
\boxed{
\mathcal{L}\{f(t)\}
=
\lim_{R\to\infty}
\int_0^R e^{-st}f(t)\,dt
}.
$$

The transform exists at a particular $s$ only when this limit is finite.

A formula for $F(s)$ without its convergence condition is incomplete. The
same function can converge for some $s$ and diverge for others.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Kernel Does {#what-the-kernel-does-4}

![Exponential kernels for three positive values of s](books/assets/chapter_21/chapter_21_figure-1.png)

For $s>0$, the kernel $e^{-st}$ decays as $t$ increases. A larger $s$ makes it
decay faster, so late-time values of $f(t)$ receive less weight.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> $F(s)$ is a weighted summary of the entire future half-line $t\geq0$, and
> changing $s$ changes how strongly later times contribute.

```{=latex}
\Needspace{12\baselineskip}
```
### A First Transform From The Definition {#a-first-transform-from-the-definition-5}

```{=latex}
\Needspace{10\baselineskip}
```
Find the transform of:

$$
f(t)=e^{-3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $f(t)$ into the definition:

$$
\begin{aligned}
\mathcal{L}\{e^{-3t}\}
&=\int_0^\infty e^{-st}e^{-3t}\,dt\\
&=\int_0^\infty e^{-(s+3)t}\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the improper integral by a limit:

$$
\mathcal{L}\{e^{-3t}\}
=
\lim_{R\to\infty}
\int_0^R e^{-(s+3)t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s+3\neq0$, integrate with respect to $t$:

$$
\begin{aligned}
\int_0^R e^{-(s+3)t}\,dt
&=
\left[
-\frac{e^{-(s+3)t}}{s+3}
\right]_0^R\\
&=-\frac{e^{-(s+3)R}}{s+3}+\frac{1}{s+3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential term tends to zero exactly when:

$$
s+3>0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
or equivalently:

$$
s>-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the remainder $e^{-(s+3)R}/(s+3)$ vanishes when $s>-3$, taking
$R\to\infty$ gives:

$$
\boxed{
\mathcal{L}\{e^{-3t}\}
=
\frac{1}{s+3},
\qquad
s>-3
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Other S-Values Fail {#why-the-other-s-values-fail-6}

```{=latex}
\Needspace{10\baselineskip}
```
If $s=-3$, then the integrand becomes $1$:

$$
\int_0^R1\,dt=R,
$$

which diverges as $R\to\infty$.

If $s<-3$, then $-(s+3)>0$, so $e^{-(s+3)t}$ grows rather than decays. The
integral again diverges.

Thus the condition $s>-3$ follows from the limiting process; it is not an
optional note attached after the calculation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Practical Existence Test {#a-practical-existence-test-7}

A common sufficient condition is:

-   $f$ is piecewise continuous on every finite interval $[0,R]$
-   there are constants $M>0$, $a$, and $T$ such that

$$
|f(t)|\leq M e^{at}
\qquad
\text{for }t\geq T
$$

Then $f$ is said to be of **exponential order $a$**, and its Laplace transform
converges for sufficiently large $s$, normally for $s>a$.

This condition is sufficient, not a claim that every transform has the same
largest possible convergence region.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-8}

```{=latex}
\Needspace{10\baselineskip}
```
The Laplace transform is an improper weighted integral:

$$
F(s)=\int_0^\infty e^{-st}f(t)\,dt.
$$

Treat $s$ as a parameter, integrate with respect to $t$, evaluate the limit,
and state the values of $s$ for which it exists.

```{=latex}
\Needspace{20\baselineskip}
```
## Building The Core Transform Table {#block-2-building-the-core-transform-table}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-9}

The goal is to derive the transforms of constants, powers, and exponentials
directly from the definition.

```{=latex}
\Needspace{12\baselineskip}
```
### The Transform Of One {#the-transform-of-one-10}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the definition:

$$
\mathcal{L}\{1\}
=
\lim_{R\to\infty}
\int_0^R e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s\neq0$:

$$
\begin{aligned}
\int_0^R e^{-st}\,dt
&=\left[-\frac1s e^{-st}\right]_0^R\\
&=-\frac{e^{-sR}}s+\frac1s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
When $s>0$, $e^{-sR}\to0$. Therefore:

$$
\boxed{
\mathcal{L}\{1\}
=\frac1s,
\qquad
s>0
}.
$$

At $s=0$, the integral is $\int_0^\infty1\,dt$, which diverges. For $s<0$,
the kernel grows.

```{=latex}
\Needspace{12\baselineskip}
```
### The Transform Of T {#the-transform-of-t-11}

```{=latex}
\Needspace{10\baselineskip}
```
Use integration by parts on the finite interval $[0,R]$:

$$
u=t,
\qquad
dv=e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating $u=t$ and integrating $dv=e^{-st}\,dt$ gives:

$$
du=dt,
\qquad
v=-\frac1s e^{-st}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $\int u\,dv=uv-\int v\,du$:

$$
\begin{aligned}
\int_0^R t e^{-st}\,dt
&=\left[-\frac{t}{s}e^{-st}\right]_0^R
+\frac1s\int_0^R e^{-st}\,dt\\
&=-\frac{R}{s}e^{-sR}
+\frac1s\left(-\frac{e^{-sR}}s+\frac1s\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, both $e^{-sR}$ and $Re^{-sR}$ tend to zero. Hence:

$$
\boxed{
\mathcal{L}\{t\}
=\frac1{s^2},
\qquad
s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Power Recurrence {#the-power-recurrence-12}

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
I_n(s)=\int_0^\infty t^n e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a positive integer $n$, integrate by parts with:

$$
u=t^n,
\qquad
dv=e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating $u=t^n$ and integrating $dv=e^{-st}\,dt$ gives:

$$
du=nt^{n-1}\,dt,
\qquad
v=-\frac1s e^{-st}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The boundary term vanishes for $s>0$, so:

$$
\begin{aligned}
I_n(s)
&=\left[-\frac{t^n}{s}e^{-st}\right]_0^\infty
+\frac ns\int_0^\infty t^{n-1}e^{-st}\,dt\\
&=\frac ns I_{n-1}(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $I_0(s)=1/s$, repeated use gives:

$$
\begin{aligned}
I_n(s)
&=\frac ns\frac{n-1}{s}\cdots\frac1s I_0(s)\\
&=\frac{n!}{s^{n+1}}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combining the recurrence with $I_0(s)=1/s$ gives the power-transform rule:

$$
\boxed{
\mathcal{L}\{t^n\}
=\frac{n!}{s^{n+1}},
\qquad
s>0
}.
$$

The symbol $n!$ means $n(n-1)\cdots2\cdot1$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Power Example {#a-power-example-13}

```{=latex}
\Needspace{10\baselineskip}
```
For $t^4$, set $n=4$ in the power formula:

$$
\begin{aligned}
\mathcal{L}\{t^4\}
&=\frac{4!}{s^{4+1}}\\
&=\frac{4\cdot3\cdot2\cdot1}{s^5}\\
&=\frac{24}{s^5},
\qquad s>0.
\end{aligned}
$$

Do not confuse the exponent $4$ with the factorial $4!$ or the denominator
power $5$.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Exponential Transform {#the-general-exponential-transform-14}

```{=latex}
\Needspace{10\baselineskip}
```
For $f(t)=e^{at}$:

$$
\begin{aligned}
\mathcal{L}\{e^{at}\}
&=\int_0^\infty e^{-st}e^{at}\,dt\\
&=\int_0^\infty e^{-(s-a)t}\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is the transform of $1$ with $s$ replaced by $s-a$. Therefore:

$$
\boxed{
\mathcal{L}\{e^{at}\}
=\frac1{s-a},
\qquad
s>a
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sign in the denominator is opposite the sign in the exponent because:

$$
e^{-st}e^{at}=e^{-(s-a)t}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Core Table {#a-small-core-table-15}

The results derived so far are:

  $f(t)$       $\mathcal{L}\{f(t)\}$   Condition
  ---------- ----------------------- -----------
  $1$                          $1/s$       $s>0$
  $t^n$                 $n!/s^{n+1}$       $s>0$
  $e^{at}$                 $1/(s-a)$       $s>a$

The condition column belongs to the transform pair. Keep it visible when the
formula is derived from an improper integral.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-16}

Integration by parts produces a recurrence for powers, while combining
exponents gives the exponential transform. The basic table is small because
later properties generate many new transforms from these entries.

```{=latex}
\Needspace{20\baselineskip}
```
## Sine, Cosine, And Hyperbolic Functions {#block-3-sine-cosine-and-hyperbolic-functions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-17}

The goal is to derive the sine and cosine transforms as a coupled pair and
then obtain hyperbolic transforms from exponentials.

```{=latex}
\Needspace{12\baselineskip}
```
### Define Two Linked Integrals {#define-two-linked-integrals-18}

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, define:

$$
C(s)=\int_0^\infty e^{-st}\cos(bt)\,dt
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
S(s)=\int_0^\infty e^{-st}\sin(bt)\,dt.
$$

The exponential kernel ensures convergence because sine and cosine remain
bounded.

```{=latex}
\Needspace{12\baselineskip}
```
### First Integration By Parts {#first-integration-by-parts-19}

```{=latex}
\Needspace{10\baselineskip}
```
For $C(s)$, choose:

$$
u=e^{-st},
\qquad
dv=\cos(bt)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating $u=e^{-st}$ and integrating $dv=\cos(bt)\,dt$ gives:

$$
du=-s e^{-st}\,dt,
\qquad
v=\frac1b\sin(bt).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The boundary term is zero for $s>0$, so:

$$
\begin{aligned}
C(s)
&=\left[\frac1b e^{-st}\sin(bt)\right]_0^\infty
+\frac sb\int_0^\infty e^{-st}\sin(bt)\,dt\\
&=\frac sb S(s).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Second Integration By Parts {#second-integration-by-parts-20}

```{=latex}
\Needspace{10\baselineskip}
```
For $S(s)$, choose:

$$
u=e^{-st},
\qquad
dv=\sin(bt)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating $u=e^{-st}$ and integrating $dv=\sin(bt)\,dt$ gives:

$$
du=-s e^{-st}\,dt,
\qquad
v=-\frac1b\cos(bt).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply integration by parts:

$$
\begin{aligned}
S(s)
&=\left[-\frac1b e^{-st}\cos(bt)\right]_0^\infty
-\frac sb\int_0^\infty e^{-st}\cos(bt)\,dt\\
&=\frac1b-\frac sb C(s).
\end{aligned}
$$

The boundary term equals $1/b$ because its value at infinity is $0$ and its
value at $t=0$ is $-1/b$.

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Two Equations {#solve-the-two-equations-21}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
C(s)=\frac sb S(s)
$$

```{=latex}
\Needspace{10\baselineskip}
```
inside:

$$
S(s)=\frac1b-\frac sb C(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute and simplify one step at a time:

$$
\begin{aligned}
S(s)
&=\frac1b-\frac sb\left(\frac sb S(s)\right)\\
&=\frac1b-\frac{s^2}{b^2}S(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $(s^2/b^2)S(s)$ to both sides:

$$
\left(1+\frac{s^2}{b^2}\right)S(s)=\frac1b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the factor with one denominator:

$$
\frac{s^2+b^2}{b^2}S(s)=\frac1b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $b^2/(s^2+b^2)$:

$$
S(s)=\frac{b}{s^2+b^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the solved value of $S(s)$ into $C(s)=(s/b)S(s)$:

$$
\begin{aligned}
C(s)
&=\frac sb\frac{b}{s^2+b^2}\\
&=\frac{s}{s^2+b^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solved functions $S(s)$ and $C(s)$ give the two transform formulas:

$$
\boxed{
\mathcal{L}\{\sin(bt)\}
=\frac{b}{s^2+b^2},
\qquad s>0
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\boxed{
\mathcal{L}\{\cos(bt)\}
=\frac{s}{s^2+b^2},
\qquad s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### How To Remember The Numerators {#how-to-remember-the-numerators-22}

```{=latex}
\Needspace{10\baselineskip}
```
The denominators match:

$$
s^2+b^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sine transform has $b$ in the numerator, while the cosine transform has
$s$:

$$
\sin(bt)\longrightarrow\frac{b}{s^2+b^2},
\qquad
\cos(bt)\longrightarrow\frac{s}{s^2+b^2}.
$$

Check dimensions or set $b=0$: $\cos(0t)=1$ should give $1/s$, which confirms
the cosine numerator.

```{=latex}
\Needspace{12\baselineskip}
```
### Hyperbolic Functions From Exponentials {#hyperbolic-functions-from-exponentials-23}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\cosh(bt)=\frac{e^{bt}+e^{-bt}}2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Applying the exponential transform and combining fractions gives:

$$
\begin{aligned}
\mathcal{L}\{\cosh(bt)\}
&=\frac12\left(\frac1{s-b}+\frac1{s+b}\right)\\
&=\frac12\left(\frac{(s+b)+(s-b)}{s^2-b^2}\right)\\
&=\frac{s}{s^2-b^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Similarly, because:

$$
\sinh(bt)=\frac{e^{bt}-e^{-bt}}2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
we obtain:

$$
\mathcal{L}\{\sinh(bt)\}
=\frac{b}{s^2-b^2}.
$$

For real $b$, both formulas converge for $s>|b|$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-24}

Sine and cosine form a linked integration-by-parts system. Hyperbolic sine and
cosine follow from their exponential definitions. The signs in
$s^2+b^2$ and $s^2-b^2$ distinguish circular and hyperbolic functions.

```{=latex}
\Needspace{20\baselineskip}
```
## Linearity And Direct Piecewise Transforms {#block-4-linearity-and-direct-piecewise-transforms}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-25}

The goal is to transform combinations term by term and handle a finite
piecewise function directly from the integral definition.

```{=latex}
\Needspace{12\baselineskip}
```
### Linearity {#linearity-26}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
\mathcal{L}\{f(t)\}=F(s),
\qquad
\mathcal{L}\{g(t)\}=G(s),
$$

```{=latex}
\Needspace{10\baselineskip}
```
then for constants $a$ and $b$:

$$
\boxed{
\mathcal{L}\{af(t)+bg(t)\}
=aF(s)+bG(s)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This follows from linearity of integration:

$$
\begin{aligned}
\int_0^\infty e^{-st}[af(t)+bg(t)]\,dt
&=a\int_0^\infty e^{-st}f(t)\,dt\\
&\quad+b\int_0^\infty e^{-st}g(t)\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Linearity Example {#a-complete-linearity-example-27}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}\{2t^3-5\sin(4t)+7e^{-2t}\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply linearity before substituting table entries:

$$
\begin{aligned}
\mathcal{L}\{2t^3-5\sin(4t)+7e^{-2t}\}
&=2\mathcal{L}\{t^3\}
-5\mathcal{L}\{\sin(4t)\}\\
&\quad+7\mathcal{L}\{e^{-2t}\}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using the power, sine, and exponential rows of the transform table gives:

```{=latex}
\Needspace{10\baselineskip}
```
$$
\mathcal{L}\{t^3\}=\frac{3!}{s^4}=\frac6{s^4},
$$

$$
\mathcal{L}\{\sin(4t)\}=\frac4{s^2+16},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\mathcal{L}\{e^{-2t}\}=\frac1{s+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these three results:

$$
\boxed{
\mathcal{L}\{2t^3-5\sin(4t)+7e^{-2t}\}
=\frac{12}{s^4}-\frac{20}{s^2+16}+\frac7{s+2}
}.
$$

All three terms converge together for $s>0$, the most restrictive of their
individual conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### A Finite Piecewise Function {#a-finite-piecewise-function-28}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
q(t)=
\begin{cases}
t, & 0\leq t<2,\\
0, & t\geq2.
\end{cases}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $q(t)=0$ after $t=2$, the transform reduces to a finite integral:

$$
\mathcal{L}\{q(t)\}
=\int_0^2 t e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this integrand, integration by parts gives the antiderivative:

$$
\int t e^{-st}\,dt
=-\frac{t}{s}e^{-st}-\frac1{s^2}e^{-st}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate at both bounds:

$$
\begin{aligned}
\mathcal{L}\{q(t)\}
&=\left[-\frac{t}{s}e^{-st}-\frac1{s^2}e^{-st}\right]_0^2\\
&=-\frac{2e^{-2s}}s-\frac{e^{-2s}}{s^2}+\frac1{s^2}\\
&=\frac{1-e^{-2s}(1+2s)}{s^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus, for $s\neq0$:

$$
\boxed{
\mathcal{L}\{q(t)\}
=\frac{1-e^{-2s}(1+2s)}{s^2}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $s=0$, return to the finite integral rather than substituting into the
fraction:

$$
\mathcal{L}\{q(t)\}\big|_{s=0}
=\int_0^2t\,dt
=2.
$$

The apparent singularity at $s=0$ is removable.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Linearity Mistakes {#common-linearity-mistakes-29}

```{=latex}
\Needspace{10\baselineskip}
```
Linearity permits sums and constant multiples. It does not generally permit:

$$
\mathcal{L}\{f(t)g(t)\}
=
\mathcal{L}\{f(t)\}\mathcal{L}\{g(t)\}.
$$

That equation is usually false.

Also keep the whole argument of a trigonometric or exponential function
visible. For example, the $4$ in $\sin(4t)$ becomes both the numerator $4$
and the squared denominator term $16$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-30}

Linearity turns sums into sums of transforms. A piecewise function can always
be handled by splitting the defining integral over the intervals on which its
formula changes.

```{=latex}
\Needspace{20\baselineskip}
```
## Properties That Generate New Transforms {#block-5-properties-that-generate-new-transforms}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-31}

The goal is to use one known transform $F(s)$ to generate transforms involving
exponential factors, powers of $t$, scaled inputs, and division by $t$.

```{=latex}
\Needspace{12\baselineskip}
```
### Exponential Shifting {#exponential-shifting-32}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
\mathcal{L}\{f(t)\}=F(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the original function by $e^{at}$ and return to the definition:

$$
\begin{aligned}
\mathcal{L}\{e^{at}f(t)\}
&=\int_0^\infty e^{-st}e^{at}f(t)\,dt\\
&=\int_0^\infty e^{-(s-a)t}f(t)\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The last integral is $F$ evaluated at $s-a$:

$$
\boxed{
\mathcal{L}\{e^{at}f(t)\}=F(s-a)
}.
$$

This is a shift in the transform variable, not a shift in time.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Shift Example {#a-complete-shift-example-33}

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}\{e^{2t}(t^2+3)\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First transform the unshifted function $f(t)=t^2+3$:

$$
\begin{aligned}
F(s)
&=\mathcal{L}\{t^2\}+3\mathcal{L}\{1\}\\
&=\frac{2!}{s^3}+\frac3s\\
&=\frac2{s^3}+\frac3s.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factor $e^{2t}$ means $a=2$, so replace every $s$ in $F(s)$ by $s-2$:

$$
\boxed{
\mathcal{L}\{e^{2t}(t^2+3)\}
=\frac2{(s-2)^3}+\frac3{s-2},
\qquad s>2
}.
$$

The convergence boundary also shifts from $s>0$ to $s-2>0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiplication By T {#multiplication-by-t-34}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the defining integral with respect to $s$ under suitable
regularity and convergence assumptions:

$$
\begin{aligned}
F'(s)
&=\frac{d}{ds}
\int_0^\infty e^{-st}f(t)\,dt\\
&=\int_0^\infty \frac{\partial}{\partial s}
\left(e^{-st}f(t)\right)\,dt\\
&=\int_0^\infty (-t)e^{-st}f(t)\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The differentiated integral states
$F'(s)=-\mathcal{L}\{tf(t)\}$. Solving this identity for the transform gives:

$$
\boxed{
\mathcal{L}\{tf(t)\}=-F'(s)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Repeating the operation gives:

$$
\boxed{
\mathcal{L}\{t^n f(t)\}
=(-1)^n F^{(n)}(s)
}.
$$

The exponent $n$ counts derivatives with respect to $s$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Two-Derivative Example {#a-two-derivative-example-35}

Find $\mathcal{L}\{t^2\sin(2t)\}$.

```{=latex}
\Needspace{10\baselineskip}
```
Begin with:

$$
F(s)=\mathcal{L}\{\sin(2t)\}=\frac2{s^2+4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $n=2$:

$$
\mathcal{L}\{t^2\sin(2t)\}=F''(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
\begin{aligned}
F'(s)
&=2(-1)(s^2+4)^{-2}(2s)\\
&=-\frac{4s}{(s^2+4)^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the product $-4s(s^2+4)^{-2}$:

$$
\begin{aligned}
F''(s)
&=-4(s^2+4)^{-2}
+(-4s)(-2)(s^2+4)^{-3}(2s)\\
&=-\frac4{(s^2+4)^2}
+\frac{16s^2}{(s^2+4)^3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the first fraction over the common denominator $(s^2+4)^3$:

$$
\begin{aligned}
F''(s)
&=\frac{-4(s^2+4)+16s^2}{(s^2+4)^3}\\
&=\frac{12s^2-16}{(s^2+4)^3}\\
&=\frac{4(3s^2-4)}{(s^2+4)^3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
\mathcal{L}\{t^2\sin(2t)\}
=\frac{4(3s^2-4)}{(s^2+4)^3},
\qquad s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Scaling The Independent Variable {#scaling-the-independent-variable-36}

```{=latex}
\Needspace{10\baselineskip}
```
Let $c>0$. Start from:

$$
\mathcal{L}\{f(ct)\}
=\int_0^\infty e^{-st}f(ct)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the substitution:

$$
u=ct,
\qquad
t=\frac uc,
\qquad
dt=\frac{du}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After the substitution $u=ct$, the transform integral becomes:

$$
\begin{aligned}
\mathcal{L}\{f(ct)\}
&=\frac1c\int_0^\infty e^{-(s/c)u}f(u)\,du\\
&=\frac1c F\left(\frac sc\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
This change of variable proves the scaling rule:

$$
\boxed{
\mathcal{L}\{f(ct)\}
=\frac1c F\left(\frac sc\right),
\qquad c>0
}.
$$

Both the outside factor $1/c$ and the replacement $s\mapsto s/c$ are needed.

```{=latex}
\Needspace{12\baselineskip}
```
### Division By T {#division-by-t-37}

```{=latex}
\Needspace{10\baselineskip}
```
If $F(s)=\mathcal{L}\{f(t)\}$ and the required integrals converge, then:

$$
\boxed{
\mathcal{L}\left\{\frac{f(t)}t\right\}
=\int_s^\infty F(u)\,du
}.
$$

The variable $u$ is a dummy transform variable. It prevents confusion with
the lower limit $s$.

```{=latex}
\Needspace{10\baselineskip}
```
As an example, use:

$$
\mathcal{L}\{\sin(5t)\}=\frac5{s^2+25}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $F(u)=5/(u^2+25)$ into the division-by-$t$ formula:

$$
\begin{aligned}
\mathcal{L}\left\{\frac{\sin(5t)}t\right\}
&=\int_s^\infty\frac5{u^2+25}\,du\\
&=\left[\arctan\left(\frac u5\right)\right]_s^\infty\\
&=\frac\pi2-\arctan\left(\frac s5\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, the complementary-angle identity gives:

$$
\boxed{
\mathcal{L}\left\{\frac{\sin(5t)}t\right\}
=\arctan\left(\frac5s\right)
}.
$$

Although the expression contains $1/t$, the original function has a finite
limit $5$ as $t\to0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-38}

```{=latex}
\Needspace{10\baselineskip}
```
The four property patterns are:

$$
\begin{aligned}
e^{at}f(t)&\longrightarrow F(s-a),\\
t^n f(t)&\longrightarrow(-1)^nF^{(n)}(s),\\
f(ct)&\longrightarrow\frac1cF(s/c),\\
\frac{f(t)}t&\longrightarrow\int_s^\infty F(u)\,du.
\end{aligned}
$$

Each property changes a known transform in a specific way. Do not combine the
rules by visual guesswork.

```{=latex}
\Needspace{20\baselineskip}
```
## Periodic Functions {#block-6-periodic-functions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-39}

The goal is to reduce an integral over infinitely many repeated periods to one
integral over a single period.

```{=latex}
\Needspace{12\baselineskip}
```
### The Periodic Transform Formula {#the-periodic-transform-formula-40}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $p(t)$ has period $T>0$:

$$
p(t+T)=p(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Split the transform into period-length intervals:

$$
\mathcal{L}\{p(t)\}
=\sum_{k=0}^\infty
\int_{kT}^{(k+1)T}e^{-st}p(t)\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In the $k$th interval, set $t=u+kT$. Periodicity gives
$p(u+kT)=p(u)$, so:

$$
\begin{aligned}
\int_{kT}^{(k+1)T}e^{-st}p(t)\,dt
&=\int_0^T e^{-s(u+kT)}p(u)\,du\\
&=e^{-skT}\int_0^T e^{-su}p(u)\,du.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out the one-period integral:

$$
\mathcal{L}\{p(t)\}
=\left(\int_0^T e^{-su}p(u)\,du\right)
\sum_{k=0}^\infty e^{-skT}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, the geometric series is:

$$
\sum_{k=0}^\infty e^{-skT}
=\frac1{1-e^{-sT}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the repeated periods contribute the geometric factor
$\sum_{k=0}^{\infty}e^{-skT}=1/(1-e^{-sT})$, multiplying by the one-period
integral gives:

$$
\boxed{
\mathcal{L}\{p(t)\}
=\frac{\displaystyle\int_0^T e^{-st}p(t)\,dt}
{1-e^{-sT}}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### An Original Periodic Ramp {#an-original-periodic-ramp-41}

![A period-three ramp-and-reset function](books/assets/chapter_21/chapter_21_figure-2.png)

```{=latex}
\Needspace{10\baselineskip}
```
Define one period by:

$$
p(t)=\frac t3,
\qquad
0\leq t<3,
$$

and repeat it with period $T=3$.

The jumps at $t=3,6,9,\ldots$ do not prevent the transform from existing.
The function is piecewise continuous and bounded.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Periodic Ramp {#transform-the-periodic-ramp-42}

```{=latex}
\Needspace{10\baselineskip}
```
Use the periodic formula with $T=3$:

$$
\mathcal{L}\{p(t)\}
=\frac{\displaystyle\int_0^3e^{-st}\frac t3\,dt}
{1-e^{-3s}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $1/3$:

$$
\int_0^3e^{-st}\frac t3\,dt
=\frac13\int_0^3t e^{-st}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\int t e^{-st}\,dt
=-\frac{t}{s}e^{-st}-\frac1{s^2}e^{-st}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate from $0$ to $3$:

$$
\begin{aligned}
\frac13\int_0^3t e^{-st}\,dt
&=\frac13
\left[-\frac{t}{s}e^{-st}-\frac1{s^2}e^{-st}\right]_0^3\\
&=\frac13\left(
-\frac{3e^{-3s}}s-\frac{e^{-3s}}{s^2}+\frac1{s^2}
\right)\\
&=\frac{1-e^{-3s}(1+3s)}{3s^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this one-period integral into the periodic formula:

$$
\boxed{
\mathcal{L}\{p(t)\}
=\frac{1-e^{-3s}(1+3s)}
{3s^2(1-e^{-3s})},
\qquad s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why One Period Is Enough {#why-one-period-is-enough-43}

```{=latex}
\Needspace{10\baselineskip}
```
Every later period has the same shape, but the kernel contributes an extra
factor:

$$
1,
\quad e^{-sT},
\quad e^{-2sT},
\quad e^{-3sT},
\quad\ldots
$$

The denominator $1-e^{-sT}$ is the sum of those repeated exponential weights.
It does not come from integrating the one-period formula itself.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Periodic-Function Mistakes {#common-periodic-function-mistakes-44}

Do not:

-   use the wrong period in $e^{-sT}$
-   integrate over several periods and still divide by $1-e^{-sT}$
-   forget a piece of the one-period definition
-   assume a jump discontinuity prevents a transform
-   replace $p(t)$ by its formula from the first period outside that period
    without declaring periodic extension

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-45}

For a period-$T$ function, transform one complete period and divide by the
geometric-series factor $1-e^{-sT}$. The numerator contains the shape; the
denominator accounts for repetition.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Transform Workflow {#block-7-a-reliable-transform-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-46}

The goal is to choose the simplest valid route and audit the result before it
is used in later differential-equation work.

```{=latex}
\Needspace{12\baselineskip}
```
### Choose The Route Before Calculating {#choose-the-route-before-calculating-47}

Ask these questions in order:

1.  Is the function already a basic table entry?
2.  Is it a sum or constant multiple suited to linearity?
3.  Does it contain $e^{at}$, $t^n$, $f(ct)$, or $f(t)/t$?
4.  Is it piecewise with finite support?
5.  Is it periodic?
6.  If none applies cleanly, should the definition be used directly?

This prevents a short property calculation from being replaced by several
pages of unnecessary integration.

```{=latex}
\Needspace{12\baselineskip}
```
### Core Table For This Chapter {#core-table-for-this-chapter-48}

  $f(t)$          $F(s)=\mathcal{L}\{f(t)\}$
  ------------- ----------------------------
  $1$                                  $1/s$
  $t^n$                         $n!/s^{n+1}$
  $e^{at}$                         $1/(s-a)$
  $\sin(bt)$                   $b/(s^2+b^2)$
  $\cos(bt)$                   $s/(s^2+b^2)$
  $\sinh(bt)$                  $b/(s^2-b^2)$
  $\cosh(bt)$                  $s/(s^2-b^2)$

The table is a starting point. Conditions of convergence still follow from
the original function and any shifts that have been applied.

```{=latex}
\Needspace{12\baselineskip}
```
### Fast Sanity Checks {#fast-sanity-checks-49}

Before accepting a transform, check:

-   **Linearity:** were all outside constants preserved?
-   **Power:** did $t^n$ produce $n!$ and denominator power $n+1$?
-   **Trigonometry:** does sine have $b$ and cosine have $s$ in the numerator?
-   **Shift:** did $e^{at}$ produce $s-a$, not $s+a$?
-   **Scaling:** are both $1/c$ and $s/c$ present?
-   **Periodicity:** is the denominator $1-e^{-sT}$ using the true period?
-   **Convergence:** is the stated $s$-range compatible with growth of $f(t)$?

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-50}

Identify structure before calculating, apply one property at a time, and keep
the original time function visible while checking signs, parameters, and the
convergence region.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Definition And Core Table {#problems-1-to-4-definition-and-core-table-51}

#### Problem 1: Transform A Constant From The Definition

Use the improper-integral definition to find $\mathcal{L}\{7\}$ and state its
convergence condition.

#### Problem 2: Find A Convergence Boundary

Use the definition to transform $e^{4t}$ and determine exactly which real
values of $s$ give convergence.

#### Problem 3: Transform A Power

Find $\mathcal{L}\{t^5\}$ and expand the factorial.

#### Problem 4: Use Linearity

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
\mathcal{L}\{3t^2-2\sin(5t)\}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Transform Properties {#problems-5-to-8-transform-properties-52}

#### Problem 5: Apply An Exponential Shift

Find $\mathcal{L}\{e^{-3t}(t+2)\}$ and state a convergence condition.

#### Problem 6: Multiply By T

Use differentiation in $s$ to find $\mathcal{L}\{t e^{-2t}\}$.

#### Problem 7: Differentiate Twice

Find $\mathcal{L}\{t^2\sin(2t)\}$ without integrating in $t$.

#### Problem 8: Scale The Input

Given $f(t)=\sin t$ and $F(s)=1/(s^2+1)$, use the scaling property to find
$\mathcal{L}\{f(3t)\}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Division, Pieces, And Periodicity {#problems-9-to-12-division-pieces-and-periodicity-53}

#### Problem 9: Divide By T

Use the division property to find $\mathcal{L}\{\sin(5t)/t\}$ for $s>0$.

#### Problem 10: Transform A Finite Pulse

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
r(t)=
\begin{cases}
1, & 0\leq t<2,\\
0, & t\geq2.
\end{cases}
$$

Find $\mathcal{L}\{r(t)\}$ directly from the definition.

#### Problem 11: Transform A Periodic Pulse

A period-$3$ function equals $2$ on $0\leq t<1$ and $0$ on $1\leq t<3$.
Find its Laplace transform.

#### Problem 12: Diagnose A Shift Error

```{=latex}
\Needspace{10\baselineskip}
```
A learner writes:

$$
\mathcal{L}\{e^{3t}f(t)\}=F(s+3).
$$

Explain the sign error, give the correct formula, and describe how a boundary
$s>\alpha$ for $F(s)$ changes.

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
Start from the definition:

$$
\begin{aligned}
\mathcal{L}\{7\}
&=\lim_{R\to\infty}\int_0^R7e^{-st}\,dt\\
&=7\lim_{R\to\infty}
\left[-\frac1s e^{-st}\right]_0^R\\
&=7\lim_{R\to\infty}
\left(-\frac{e^{-sR}}s+\frac1s\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, the exponential tends to zero. Therefore:

$$
\boxed{\mathcal{L}\{7\}=\frac7s,\qquad s>0}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Combine the exponentials:

$$
\begin{aligned}
\mathcal{L}\{e^{4t}\}
&=\int_0^\infty e^{-st}e^{4t}\,dt\\
&=\int_0^\infty e^{-(s-4)t}\,dt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The kernel decays when $s-4>0$. Hence:

$$
\boxed{\mathcal{L}\{e^{4t}\}=\frac1{s-4},\qquad s>4}.
$$

At $s=4$ the integrand is $1$; for $s<4$ it grows.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Use the power formula with $n=5$:

$$
\begin{aligned}
\mathcal{L}\{t^5\}
&=\frac{5!}{s^6}\\
&=\frac{5\cdot4\cdot3\cdot2\cdot1}{s^6}\\
&=\boxed{\frac{120}{s^6}},
\qquad s>0.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Apply linearity and then substitute the two table entries:

$$
\begin{aligned}
\mathcal{L}\{3t^2-2\sin(5t)\}
&=3\frac{2!}{s^3}-2\frac5{s^2+25}\\
&=\boxed{\frac6{s^3}-\frac{10}{s^2+25}},
\qquad s>0.
\end{aligned}
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

First transform $f(t)=t+2$, obtaining
$F(s)=1/s^2+2/s$.

```{=latex}
\Needspace{10\baselineskip}
```
The factor $e^{-3t}$ has $a=-3$, so replace $s$ by $s-(-3)=s+3$:

$$
\boxed{
\mathcal{L}\{e^{-3t}(t+2)\}
=\frac1{(s+3)^2}+\frac2{s+3},
\qquad s>-3
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

Start from $F(s)=\mathcal{L}\{e^{-2t}\}=1/(s+2)$.

```{=latex}
\Needspace{10\baselineskip}
```
Use $\mathcal{L}\{tf(t)\}=-F'(s)$:

$$
\begin{aligned}
\mathcal{L}\{t e^{-2t}\}
&=-\frac{d}{ds}(s+2)^{-1}\\
&=-\bigl(-(s+2)^{-2}\bigr)\\
&=\boxed{\frac1{(s+2)^2}},
\qquad s>-2.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
For $f(t)=\sin(2t)$, the base transform is
$F(s)=2/(s^2+4)$. Since multiplication by $t^2$ corresponds to $F''(s)$:

$$
\begin{aligned}
F'(s)&=-\frac{4s}{(s^2+4)^2},\\
F''(s)&=-\frac4{(s^2+4)^2}
+\frac{16s^2}{(s^2+4)^3}\\
&=\frac{4(3s^2-4)}{(s^2+4)^3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because the required transform is $F''(s)$, the calculation gives:

$$
\boxed{
\mathcal{L}\{t^2\sin(2t)\}
=\frac{4(3s^2-4)}{(s^2+4)^3}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Use the scaling property with $c=3$:

$$
\begin{aligned}
\mathcal{L}\{f(3t)\}
&=\frac13F\left(\frac s3\right)\\
&=\frac13\frac1{(s/3)^2+1}\\
&=\frac13\frac9{s^2+9}\\
&=\boxed{\frac3{s^2+9}}.
\end{aligned}
$$

Since $f(3t)=\sin(3t)$, this agrees with the sine table entry.

```{=latex}
\clearpage
```
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
Use $F(u)=5/(u^2+25)$ in the division property:

$$
\begin{aligned}
\mathcal{L}\left\{\frac{\sin(5t)}t\right\}
&=\int_s^\infty\frac5{u^2+25}\,du\\
&=\left[\arctan\left(\frac u5\right)\right]_s^\infty\\
&=\frac\pi2-\arctan\left(\frac s5\right)\\
&=\boxed{\arctan\left(\frac5s\right)},
\qquad s>0.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The function vanishes after $t=2$, so:

$$
\begin{aligned}
\mathcal{L}\{r(t)\}
&=\int_0^2e^{-st}\,dt\\
&=\left[-\frac1s e^{-st}\right]_0^2\\
&=\boxed{\frac{1-e^{-2s}}s}
\end{aligned}
$$

for $s\neq0$. At $s=0$, the finite integral equals $2$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The period is $T=3$. Transform one period:

$$
\begin{aligned}
\int_0^3e^{-st}p(t)\,dt
&=\int_0^1 2e^{-st}\,dt+\int_1^3 0\,dt\\
&=\frac{2(1-e^{-s})}{s}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For Answer 11, the one-period integral is $2(1-e^{-s})/s$. The
periodic-transform formula divides this result by $1-e^{-3s}$:

$$
\boxed{
\mathcal{L}\{p(t)\}
=\frac{2(1-e^{-s})}{s(1-e^{-3s})},
\qquad s>0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Combine the kernels before identifying the shift:

$$
e^{-st}e^{3t}=e^{-(s-3)t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the correct property is:

$$
\boxed{\mathcal{L}\{e^{3t}f(t)\}=F(s-3)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $F(s)$ originally converges for $s>\alpha$, the shifted argument must
satisfy:

$$
s-3>\alpha.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $3$ to both sides:

$$
\boxed{s>\alpha+3}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 21 Final Summary {#chapter-21-final-summary-57}

```{=latex}
\Needspace{10\baselineskip}
```
The defining formula and the periodic-function rule are:

$$
\boxed{
\mathcal{L}\{f(t)\}
=\int_0^\infty e^{-st}f(t)\,dt
},
\qquad
\boxed{
\mathcal{L}\{p(t)\}
=\frac{\displaystyle\int_0^T e^{-st}p(t)\,dt}
{1-e^{-sT}}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The core table entries and transform-building properties are:

$$
\begin{aligned}
1&\longrightarrow\frac1s,
&t^n&\longrightarrow\frac{n!}{s^{n+1}},
&e^{at}&\longrightarrow\frac1{s-a},\\
\sin(bt)&\longrightarrow\frac{b}{s^2+b^2},
&\cos(bt)&\longrightarrow\frac{s}{s^2+b^2},\\
e^{at}f(t)&\longrightarrow F(s-a),
&t^n f(t)&\longrightarrow(-1)^nF^{(n)}(s),
&f(ct)&\longrightarrow\frac1cF(s/c).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
Together, these results support one central working principle:

```{=latex}
\Needspace{8\baselineskip}
```
> identify the time-domain structure, apply one justified property at a time,
> and carry the convergence condition with the transform rather than treating
> it as an afterthought.
