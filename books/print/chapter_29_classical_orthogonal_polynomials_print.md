```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 29}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Classical Orthogonal Polynomials}
```
# Chapter 29 - Classical Orthogonal Polynomials

The power-series and Frobenius methods do more than produce infinite series.
For certain differential equations and certain parameter values, a recurrence
relation forces the series to stop. The result is a polynomial solution.

Four important families arise this way:

-   Legendre polynomials
-   Chebyshev polynomials
-   Hermite polynomials
-   Laguerre polynomials

These families are useful because they combine three structures: each member
solves a differential equation, neighbouring members satisfy recurrence
relations, and different members are orthogonal under an appropriate weighted
integral.

This chapter will:

-   explain how a parameter turns an infinite series into a polynomial
-   derive the coefficient recurrence for each classical equation
-   state the normalization used for every polynomial family
-   connect differential equations, Rodrigues formulas, and generating functions
-   derive weighted orthogonality from self-adjoint form
-   calculate expansion coefficients using weighted inner products
-   build a reliable workflow for recognising and checking classical polynomials

```{=latex}
\Needspace{20\baselineskip}
```
## Why Polynomial Solutions Appear {#block-1-why-polynomial-solutions-appear}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to understand what makes a classical equation special and why its
parameter is restricted to a nonnegative integer.

```{=latex}
\Needspace{8\baselineskip}
```
> the equation does not begin by assuming a polynomial; its recurrence reveals
> when a polynomial is possible.

```{=latex}
\Needspace{12\baselineskip}
```
### A Parameter-Dependent Equation {#a-parameter-dependent-equation-2}

```{=latex}
\Needspace{10\baselineskip}
```
Consider a family of equations written schematically as:

$$
A(x)y''+B(x)y'+\lambda y=0.
$$

Here:

-   $x$ is the independent variable
-   $y(x)$ is the unknown function
-   $\lambda$ is a parameter
-   $A(x)$ and $B(x)$ are fixed coefficient functions

Different values of $\lambda$ usually produce different solutions. At special
values, however, the power-series recurrence can contain a zero numerator.
Every later coefficient in one parity chain then becomes zero.

```{=latex}
\Needspace{10\baselineskip}
```
The key mechanism is:

$$
\boxed{
\text{special parameter}
\longrightarrow
\text{zero recurrence factor}
\longrightarrow
\text{series termination}
\longrightarrow
\text{polynomial}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Four Equations {#the-four-equations-3}

```{=latex}
\Needspace{10\baselineskip}
```
For $n=0,1,2,\ldots$, the four equations used in this chapter are:

$$
\begin{aligned}
\text{Legendre:}\quad
&(1-x^2)y''-2xy'+n(n+1)y=0,\\
\text{Chebyshev:}\quad
&(1-x^2)y''-xy'+n^2y=0,\\
\text{Hermite:}\quad
&y''-2xy'+2ny=0,\\
\text{Laguerre:}\quad
&xy''+(1-x)y'+ny=0.
\end{aligned}
$$

The symbol $n$ labels the polynomial degree. It is not a summation index in
these equations. When a power series is introduced, a different letter such as
$k$ will be used for the series index.

```{=latex}
\Needspace{12\baselineskip}
```
### Normalization Is Part Of The Name {#normalization-is-part-of-the-name-4}

A homogeneous equation does not distinguish $y$ from a nonzero multiple $Cy$.
If $y$ solves the equation, then $Cy$ also solves it. A normalization selects
one representative and gives the named polynomial a definite scale.

```{=latex}
\Needspace{10\baselineskip}
```
We will use:

$$
\begin{aligned}
P_n(1)&=1 &&\text{for Legendre polynomials},\\
T_n(1)&=1 &&\text{for Chebyshev polynomials},\\
H_n(x)&=2^nx^n+\text{lower powers}
&&\text{for physicists' Hermite polynomials},\\
L_n(0)&=1 &&\text{for Laguerre polynomials}.
\end{aligned}
$$

For example, $1-2x+x^2/2$ and $2-4x+x^2$ solve the same $n=2$ Laguerre
equation. The first is the standard normalized polynomial $L_2(x)$; the second
is $2L_2(x)$.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> solving the differential equation determines a polynomial only up to scale;
> the normalization determines its conventional name.

```{=latex}
\Needspace{12\baselineskip}
```
### First Members Of The Four Families {#first-members-of-the-four-families-5}

```{=latex}
\Needspace{10\baselineskip}
```
With the normalizations above:

$$
\begin{aligned}
P_0(x)&=1,&
P_1(x)&=x,&
P_2(x)&=\frac12(3x^2-1),&
P_3(x)&=\frac12(5x^3-3x),\\
T_0(x)&=1,&
T_1(x)&=x,&
T_2(x)&=2x^2-1,&
T_3(x)&=4x^3-3x,\\
H_0(x)&=1,&
H_1(x)&=2x,&
H_2(x)&=4x^2-2,&
H_3(x)&=8x^3-12x,\\
L_0(x)&=1,&
L_1(x)&=1-x,&
L_2(x)&=1-2x+\frac12x^2,&
L_3(x)&=1-3x+\frac32x^2-\frac16x^3.
\end{aligned}
$$

Do not try to memorise this whole display. The methods developed below rebuild
these polynomials from their equations and normalizations.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

Each classical family is a sequence of normalized polynomial solutions. The
integer $n$ chooses the equation and, after normalization, identifies the
degree-$n$ polynomial.

```{=latex}
\Needspace{20\baselineskip}
```
## Legendre Polynomials From A Power Series {#block-2-legendre-polynomials-from-a-power-series}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to derive the Legendre recurrence, see exactly why one coefficient
chain terminates, and construct $P_3(x)$ without guessing it.

```{=latex}
\Needspace{12\baselineskip}
```
### Begin With The Legendre Equation {#begin-with-the-legendre-equation-8}

```{=latex}
\Needspace{10\baselineskip}
```
For a fixed nonnegative integer $n$, consider:

$$
(1-x^2)y''-2xy'+n(n+1)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient $1-x^2$ vanishes at $x=\pm1$. The origin is an ordinary point,
so seek a power series centred at $0$:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate and reindex:

$$
\begin{aligned}
y'&=\sum_{k=0}^{\infty}(k+1)a_{k+1}x^k,\\
y''&=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k.
\end{aligned}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Substitute Every Term {#substitute-every-term-9}

```{=latex}
\Needspace{10\baselineskip}
```
Start by expanding the equation:

$$
y''-x^2y''-2xy'+n(n+1)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first term is already indexed by $x^k$:

$$
y''=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the product $x^2y''$, use the unreindexed derivative and multiply by
$x^2$:

$$
\begin{aligned}
x^2y''
&=x^2\sum_{k=2}^{\infty}k(k-1)a_kx^{k-2}\\
&=\sum_{k=2}^{\infty}k(k-1)a_kx^k.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Similarly:

$$
\begin{aligned}
2xy'
&=2x\sum_{k=1}^{\infty}ka_kx^{k-1}\\
&=\sum_{k=1}^{\infty}2ka_kx^k.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
n(n+1)y
=\sum_{k=0}^{\infty}n(n+1)a_kx^k.
$$

The factors $k(k-1)$ and $k$ vanish automatically at the omitted starting
indices, so all four sums may be compared from $k=0$ onward.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Legendre Recurrence {#derive-the-legendre-recurrence-10}

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $x^k$ is:

$$
(k+2)(k+1)a_{k+2}
-k(k-1)a_k
-2ka_k
+n(n+1)a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the three terms multiplying $a_k$:

$$
\begin{aligned}
&-k(k-1)-2k+n(n+1)\\
&=-k^2-k+n(n+1)\\
&=n(n+1)-k(k+1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
(k+2)(k+1)a_{k+2}
+[n(n+1)-k(k+1)]a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the $a_k$ term and divide by $(k+2)(k+1)$:

$$
\boxed{
a_{k+2}
=\frac{k(k+1)-n(n+1)}{(k+2)(k+1)}a_k
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the numerator:

$$
\begin{aligned}
k(k+1)-n(n+1)
&=k^2+k-n^2-n\\
&=(k-n)(k+n+1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the equivalent factored recurrence is:

$$
\boxed{
a_{k+2}
=\frac{(k-n)(k+n+1)}{(k+2)(k+1)}a_k
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Series Terminates {#why-the-series-terminates-11}

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence advances by two indices:

$$
a_0\to a_2\to a_4\to\cdots,
\qquad
a_1\to a_3\to a_5\to\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
These are the even and odd coefficient chains. When $k=n$, the recurrence
numerator contains:

$$
k-n=n-n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Consequently:

$$
a_{n+2}=0.
$$

The same recurrence then gives $a_{n+4}=a_{n+6}=\cdots=0$. The chain having
the same parity as $n$ terminates at degree $n$.

The other parity chain generally continues forever. To obtain the Legendre
polynomial, set the starting coefficient of that nonterminating chain to zero.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Construction Of P Three {#worked-construction-of-p-three-12}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$. The recurrence becomes:

$$
a_{k+2}
=\frac{(k-3)(k+4)}{(k+2)(k+1)}a_k.
$$

Because $n=3$ is odd, use the odd chain and set $a_0=0$. Begin with arbitrary
$a_1$.

```{=latex}
\Needspace{10\baselineskip}
```
For $k=1$:

$$
\begin{aligned}
a_3
&=\frac{(1-3)(1+4)}{(3)(2)}a_1\\
&=\frac{(-2)(5)}6a_1\\
&=-\frac53a_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=3$:

$$
\begin{aligned}
a_5
&=\frac{(3-3)(3+4)}{(5)(4)}a_3\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the terminating odd solution is:

$$
y(x)=a_1x-\frac53a_1x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $a_1$:

$$
y(x)=a_1\left(x-\frac53x^3\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply the normalization $P_3(1)=1$:

$$
\begin{aligned}
1
&=a_1\left(1-\frac53\right)\\
&=-\frac23a_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $1=-2a_1/3$, multiply both sides by $-3/2$:

$$
a_1=-\frac32.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this value into the polynomial:

$$
\boxed{
P_3(x)=\frac12(5x^3-3x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Constructed Polynomial {#verify-the-constructed-polynomial-13}

```{=latex}
\Needspace{10\baselineskip}
```
For $n=3$, the Legendre equation is:

$$
(1-x^2)y''-2xy'+12y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $P_3=(5x^3-3x)/2$:

$$
P_3'=\frac12(15x^2-3),
\qquad
P_3''=15x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these derivatives:

$$
\begin{aligned}
&(1-x^2)P_3''-2xP_3'+12P_3\\
&=(1-x^2)(15x)
-2x\left(\frac{15x^2-3}{2}\right)
+12\left(\frac{5x^3-3x}{2}\right)\\
&=(15x-15x^3)+(-15x^3+3x)+(30x^3-18x)\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The normalization is also immediate:

$$
P_3(1)=\frac12(5-3)=1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-14}

The Legendre recurrence links coefficients two places apart. At $k=n$, its
numerator vanishes, so the parity chain matching $n$ terminates. The condition
$P_n(1)=1$ then fixes the remaining scale.

```{=latex}
\Needspace{20\baselineskip}
```
## Chebyshev Polynomials And The Hidden Angle {#block-3-chebyshev-polynomials-and-the-hidden-angle}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-15}

The goal is to derive the Chebyshev recurrence and then explain why the
substitution $x=\cos\theta$ turns the equation into simple harmonic motion.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Series Recurrence {#derive-the-series-recurrence-16}

```{=latex}
\Needspace{10\baselineskip}
```
The Chebyshev equation of degree $n$ is:

$$
(1-x^2)y''-xy'+n^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
As in the Legendre calculation:

$$
\begin{aligned}
y''
&=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k,\\
x^2y''
&=\sum_{k=0}^{\infty}k(k-1)a_kx^k,\\
xy'
&=\sum_{k=0}^{\infty}ka_kx^k.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these expressions into:

$$
y''-x^2y''-xy'+n^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $x^k$ is:

$$
(k+2)(k+1)a_{k+2}
-k(k-1)a_k-ka_k+n^2a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the middle terms:

$$
-k(k-1)-k=-k^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After using $-k(k-1)-k=-k^2$, the coefficient equation is:

$$
(k+2)(k+1)a_{k+2}+(n^2-k^2)a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the later coefficient:

$$
\boxed{
a_{k+2}
=\frac{k^2-n^2}{(k+2)(k+1)}a_k
=\frac{(k-n)(k+n)}{(k+2)(k+1)}a_k
}.
$$

At $k=n$, the factor $k-n$ is zero. The coefficient chain with the same
parity as $n$ therefore terminates.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Construction Of T Four {#worked-construction-of-t-four-17}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=4$. Since the required polynomial has even degree, choose the even
chain and set $a_1=0$. The recurrence is:

$$
a_{k+2}
=\frac{(k-4)(k+4)}{(k+2)(k+1)}a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=0$:

$$
\begin{aligned}
a_2
&=\frac{(0-4)(0+4)}{(2)(1)}a_0\\
&=-8a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=2$:

$$
\begin{aligned}
a_4
&=\frac{(2-4)(2+4)}{(4)(3)}a_2\\
&=-a_2\\
&=8a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=4$:

$$
\begin{aligned}
a_6
&=\frac{(4-4)(4+4)}{(6)(5)}a_4\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y(x)=a_0(1-8x^2+8x^4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=1$, the bracket equals $1-8+8=1$. The normalization $T_4(1)=1$
therefore gives $a_0=1$:

$$
\boxed{T_4(x)=8x^4-8x^2+1}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Reveal The Hidden Constant-Coefficient Equation {#reveal-the-hidden-constant-coefficient-equation-18}

```{=latex}
\Needspace{10\baselineskip}
```
On $-1<x<1$, write:

$$
x=\cos\theta
$$

```{=latex}
\Needspace{10\baselineskip}
```
and define:

$$
Y(\theta)=y(\cos\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $Y$ with respect to $\theta$. By the chain rule:

$$
\begin{aligned}
Y'
&=y'(x)\frac{dx}{d\theta}\\
&=-y'(x)\sin\theta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more, using the product rule:

$$
\begin{aligned}
Y''
&=-\left[y''(x)\frac{dx}{d\theta}\sin\theta
+y'(x)\cos\theta\right]\\
&=-\left[-y''(x)\sin^2\theta+y'(x)\cos\theta\right]\\
&=y''(x)\sin^2\theta-y'(x)\cos\theta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $x=\cos\theta$ and $\sin^2\theta=1-x^2$:

$$
\boxed{
Y''=(1-x^2)y''-xy'
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Chebyshev equation consequently becomes:

$$
Y''+n^2Y=0.
$$

This is a constant-coefficient oscillation equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Obtain The Cosine Formula {#obtain-the-cosine-formula-19}

```{=latex}
\Needspace{10\baselineskip}
```
One solution of $Y''+n^2Y=0$ is:

$$
Y(\theta)=\cos(n\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $x=\cos\theta$, we may take $\theta=\arccos x$. Return to $x$:

$$
\boxed{
T_n(x)=\cos(n\arccos x),
\qquad -1\leq x\leq1
}.
$$

This formula automatically satisfies $T_n(1)=1$, because
$\arccos(1)=0$ and $\cos(0)=1$.

```{=latex}
\Needspace{10\baselineskip}
```
For $n=4$, the multiple-angle identity gives:

$$
\cos(4\theta)=8\cos^4\theta-8\cos^2\theta+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting $x=\cos\theta$ recovers:

$$
T_4(x)=8x^4-8x^2+1.
$$

The series calculation and the angle substitution have produced the same
normalized polynomial by two independent routes.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Three-Term Recurrence {#derive-the-three-term-recurrence-20}

```{=latex}
\Needspace{10\baselineskip}
```
The cosine addition identity is:

$$
\cos((n+1)\theta)+\cos((n-1)\theta)
=2\cos\theta\cos(n\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x=\cos\theta,
\qquad
T_j(x)=\cos(j\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The identity becomes:

$$
T_{n+1}(x)+T_{n-1}(x)=2xT_n(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $T_{n-1}$ from both sides:

$$
\boxed{
T_{n+1}(x)=2xT_n(x)-T_{n-1}(x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example, using $T_2=2x^2-1$ and $T_3=4x^3-3x$:

$$
\begin{aligned}
T_4
&=2xT_3-T_2\\
&=2x(4x^3-3x)-(2x^2-1)\\
&=8x^4-6x^2-2x^2+1\\
&=8x^4-8x^2+1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-21}

The Chebyshev recurrence terminates at $k=n$. The substitution
$x=\cos\theta$ also reveals that the polynomial is a disguised cosine:
$T_n(x)=\cos(n\arccos x)$.

```{=latex}
\Needspace{20\baselineskip}
```
## Hermite Polynomials And Gaussian Structure {#block-4-hermite-polynomials-and-gaussian-structure}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-22}

The goal is to derive the Hermite coefficient recurrence, construct a
normalized polynomial, and understand why derivatives of a Gaussian generate
the same family.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Hermite Recurrence {#derive-the-hermite-recurrence-23}

```{=latex}
\Needspace{10\baselineskip}
```
The physicists' Hermite equation is:

$$
y''-2xy'+2ny=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the series:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y''=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
-2xy'=-2\sum_{k=0}^{\infty}ka_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The final term is:

$$
2ny=2n\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^k$:

$$
(k+2)(k+1)a_{k+2}-2ka_k+2na_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the $a_k$ terms:

$$
(k+2)(k+1)a_{k+2}+2(n-k)a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
a_{k+2}=\frac{2(k-n)}{(k+2)(k+1)}a_k
}.
$$

At $k=n$, the numerator vanishes. The parity chain matching $n$ terminates.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Construction Of H Four {#worked-construction-of-h-four-24}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=4$ and use the even coefficient chain. The recurrence becomes:

$$
a_{k+2}=\frac{2(k-4)}{(k+2)(k+1)}a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=0$:

$$
\begin{aligned}
a_2
&=\frac{2(0-4)}{(2)(1)}a_0\\
&=-4a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=2$:

$$
\begin{aligned}
a_4
&=\frac{2(2-4)}{(4)(3)}a_2\\
&=-\frac13a_2\\
&=\frac43a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $a_2=-4a_0$ and $a_4=4a_0/3$, set $k=4$:

$$
a_6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the terminating solution is:

$$
y=a_0\left(1-4x^2+\frac43x^4\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The physicists' normalization requires the leading coefficient to be
$2^4=16$. Since the leading coefficient above is $4a_0/3$:

$$
\frac43a_0=16.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $3/4$:

$$
a_0=12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
H_4(x)=16x^4-48x^2+12
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### The Rodrigues Formula {#the-rodrigues-formula-25}

```{=latex}
\Needspace{10\baselineskip}
```
Hermite polynomials can also be generated by:

$$
\boxed{
H_n(x)=(-1)^ne^{x^2}
\frac{d^n}{dx^n}\left(e^{-x^2}\right)
}.
$$

The factor $e^{x^2}$ cancels the Gaussian remaining after repeated
differentiation, leaving a polynomial.

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, begin with:

$$
\frac{d}{dx}e^{-x^2}=-2xe^{-x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again using the product rule:

$$
\begin{aligned}
\frac{d^2}{dx^2}e^{-x^2}
&=-2e^{-x^2}+(-2x)(-2x)e^{-x^2}\\
&=(4x^2-2)e^{-x^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use $(-1)^2=1$ and multiply by $e^{x^2}$:

$$
\begin{aligned}
H_2(x)
&=e^{x^2}(4x^2-2)e^{-x^2}\\
&=4x^2-2.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Useful Hermite Recurrence {#a-useful-hermite-recurrence-26}

```{=latex}
\Needspace{10\baselineskip}
```
Neighbouring physicists' Hermite polynomials satisfy:

$$
\boxed{
H_{n+1}(x)=2xH_n(x)-2nH_{n-1}(x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $n=3$, together with:

$$
H_2=4x^2-2,
\qquad
H_3=8x^3-12x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
H_4
&=2xH_3-6H_2\\
&=2x(8x^3-12x)-6(4x^2-2)\\
&=16x^4-24x^2-24x^2+12\\
&=16x^4-48x^2+12.
\end{aligned}
$$

This agrees with the power-series construction.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-27}

The Hermite equation produces a terminating parity chain when $n$ is a
nonnegative integer. The standard physicists' normalization fixes the leading
coefficient at $2^n$, while the Rodrigues formula exposes the family's
connection to the Gaussian $e^{-x^2}$.

```{=latex}
\Needspace{20\baselineskip}
```
## Laguerre Polynomials On A Half-Line {#block-5-laguerre-polynomials-on-a-half-line}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-28}

The goal is to derive a one-step recurrence for the Laguerre coefficients and
see how its normalization differs from the parity-based families.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Laguerre Recurrence {#derive-the-laguerre-recurrence-29}

```{=latex}
\Needspace{10\baselineskip}
```
The Laguerre equation is:

$$
xy''+(1-x)y'+ny=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First reindex $xy''$. Starting from the unreindexed second derivative:

$$
y''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
start from $y''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-2}$ and multiply by $x$:

$$
xy''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $k=j-1$, so $j=k+1$:

$$
xy''=\sum_{k=1}^{\infty}(k+1)ka_{k+1}x^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The remaining derivative terms are:

$$
y'=\sum_{k=0}^{\infty}(k+1)a_{k+1}x^k
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
-xy'=-\sum_{k=1}^{\infty}ka_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
ny=n\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=0$, the $xy''$ and $-xy'$ contributions vanish. For every $k\geq0$,
the coefficient equation can therefore be written as:

$$
[(k+1)k+(k+1)]a_{k+1}+(n-k)a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the first bracket:

$$
(k+1)k+(k+1)=(k+1)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
(k+1)^2a_{k+1}+(n-k)a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $a_{k+1}$:

$$
\boxed{
a_{k+1}=\frac{k-n}{(k+1)^2}a_k
}.
$$

Unlike the two-step recurrences above, this recurrence connects every
successive coefficient. At $k=n$, it gives $a_{n+1}=0$, after which all later
coefficients vanish.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Construction Of L Three {#worked-construction-of-l-three-30}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$ and apply the normalization $L_3(0)=1$. Since $L_3(0)=a_0$, choose:

$$
a_0=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=0$:

$$
\begin{aligned}
a_1
&=\frac{0-3}{(1)^2}a_0\\
&=-3.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=1$:

$$
\begin{aligned}
a_2
&=\frac{1-3}{(2)^2}a_1\\
&=-\frac12(-3)\\
&=\frac32.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=2$:

$$
\begin{aligned}
a_3
&=\frac{2-3}{(3)^2}a_2\\
&=-\frac19\left(\frac32\right)\\
&=-\frac16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $k=3$:

$$
a_4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $a_0=1$, $a_1=-3$, $a_2=3/2$, and $a_3=-1/6$, the polynomial is:

$$
\boxed{
L_3(x)=1-3x+\frac32x^2-\frac16x^3
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Verify L Three Directly {#verify-l-three-directly-31}

```{=latex}
\Needspace{10\baselineskip}
```
For $n=3$, the Laguerre equation is:

$$
xy''+(1-x)y'+3y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the polynomial:

$$
\begin{aligned}
L_3'&=-3+3x-\frac12x^2,\\
L_3''&=3-x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute one term at a time:

```{=latex}
\Needspace{10\baselineskip}
```
$$
xL_3''=3x-x^2,
$$

$$
\begin{aligned}
(1-x)L_3'
&=(1-x)\left(-3+3x-\frac12x^2\right)\\
&=-3+6x-\frac72x^2+\frac12x^3,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
3L_3=3-9x+\frac92x^2-\frac12x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the three expressions:

$$
\begin{aligned}
xL_3''+(1-x)L_3'+3L_3
={}&(3x-x^2)\\
&+\left(-3+6x-\frac72x^2+\frac12x^3\right)\\
&+\left(3-9x+\frac92x^2-\frac12x^3\right)\\
={}&0.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Laguerre Rodrigues Formula {#the-laguerre-rodrigues-formula-32}

```{=latex}
\Needspace{10\baselineskip}
```
The normalized Laguerre polynomial is also given by:

$$
\boxed{
L_n(x)=\frac{e^x}{n!}
\frac{d^n}{dx^n}\left(e^{-x}x^n\right)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, let:

$$
f(x)=e^{-x}x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
\begin{aligned}
f'
&=(-e^{-x})x^2+e^{-x}(2x)\\
&=e^{-x}(2x-x^2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\begin{aligned}
f''
&=-e^{-x}(2x-x^2)+e^{-x}(2-2x)\\
&=e^{-x}(x^2-4x+2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert this into the Rodrigues formula:

$$
\begin{aligned}
L_2(x)
&=\frac{e^x}{2!}e^{-x}(x^2-4x+2)\\
&=\frac12(x^2-4x+2)\\
&=1-2x+\frac12x^2.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-33}

The Laguerre recurrence advances one coefficient at a time and terminates when
$k=n$. The condition $L_n(0)=1$ sets $a_0=1$, while the factor $1/n!$ in the
Rodrigues formula produces the same normalization.

```{=latex}
\Needspace{20\baselineskip}
```
## Three Ways To Generate A Polynomial Family {#block-6-three-ways-to-generate-a-polynomial-family}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-34}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to distinguish three related tools: differential equations,
Rodrigues formulas, and generating functions.

```{=latex}
\Needspace{8\baselineskip}
```
> these tools describe the same polynomial families, but they answer different
> computational questions.

```{=latex}
\Needspace{12\baselineskip}
```
### What Each Tool Is For {#what-each-tool-is-for-35}

The **differential equation** explains which functions belong to a family and
why special parameter values permit polynomial solutions.

A **Rodrigues formula** constructs one chosen polynomial by repeated
differentiation.

A **generating function** packages the whole family into one function of an
extra variable $t$. Expanding in powers of $t$ reveals every polynomial as a
coefficient.

These are complementary descriptions. A generating function does not replace
the independent variable $x$; it introduces a bookkeeping variable $t$.

```{=latex}
\Needspace{12\baselineskip}
```
### Rodrigues Formulas And Normalization {#rodrigues-formulas-and-normalization-36}

```{=latex}
\Needspace{10\baselineskip}
```
Three useful Rodrigues formulas are:

$$
\begin{aligned}
P_n(x)
&=\frac1{2^nn!}
\frac{d^n}{dx^n}(x^2-1)^n,\\
H_n(x)
&=(-1)^ne^{x^2}
\frac{d^n}{dx^n}e^{-x^2},\\
L_n(x)
&=\frac{e^x}{n!}
\frac{d^n}{dx^n}(e^{-x}x^n).
\end{aligned}
$$

The prefactors are not decoration. They enforce the normalization convention
for the named family.

```{=latex}
\Needspace{10\baselineskip}
```
For example, use the Legendre formula with $n=2$:

$$
P_2(x)=\frac1{2^2(2!)}
\frac{d^2}{dx^2}(x^2-1)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand before differentiating:

$$
(x^2-1)^2=x^4-2x^2+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
\frac{d}{dx}(x^4-2x^2+1)=4x^3-4x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\frac{d^2}{dx^2}(x^2-1)^2=12x^2-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $2^2(2!)=8$:

$$
\begin{aligned}
P_2(x)
&=\frac18(12x^2-4)\\
&=\frac12(3x^2-1).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Generating Functions {#generating-functions-37}

```{=latex}
\Needspace{10\baselineskip}
```
The following identities define generating functions near $t=0$:

$$
\begin{aligned}
\frac1{\sqrt{1-2xt+t^2}}
&=\sum_{n=0}^{\infty}P_n(x)t^n,\\
\frac{1-xt}{1-2xt+t^2}
&=\sum_{n=0}^{\infty}T_n(x)t^n,\\
e^{2xt-t^2}
&=\sum_{n=0}^{\infty}H_n(x)\frac{t^n}{n!},\\
\frac1{1-t}\exp\left(-\frac{xt}{1-t}\right)
&=\sum_{n=0}^{\infty}L_n(x)t^n.
\end{aligned}
$$

Read the right sides carefully. The Hermite coefficient of $t^n$ is
$H_n(x)/n!$, whereas the other three displays use the polynomial itself as the
coefficient.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Hermite Generating-Function Expansion {#worked-hermite-generating-function-expansion-38}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
e^{2xt-t^2}=e^{2xt}e^{-t^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand each factor through $t^3$:

$$
\begin{aligned}
e^{2xt}
&=1+2xt+\frac{(2xt)^2}{2!}
+\frac{(2xt)^3}{3!}+O(t^4)\\
&=1+2xt+2x^2t^2+\frac43x^3t^3+O(t^4),
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
e^{-t^2}=1-t^2+O(t^4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the truncated series:

$$
\begin{aligned}
e^{2xt-t^2}
={}&\left(1+2xt+2x^2t^2+\frac43x^3t^3+O(t^4)\right)
\left(1-t^2+O(t^4)\right)\\
={}&1+2xt+(2x^2-1)t^2
+\left(\frac43x^3-2x\right)t^3+O(t^4).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare this with:

$$
e^{2xt-t^2}
=H_0+H_1t+H_2\frac{t^2}{2!}+H_3\frac{t^3}{3!}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients one power at a time:

$$
H_0=1,
\qquad
H_1=2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $t^2$:

$$
\frac{H_2}{2!}=2x^2-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $2!=2$:

$$
H_2=4x^2-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $t^3$:

$$
\frac{H_3}{3!}=\frac43x^3-2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $3!=6$:

$$
H_3=8x^3-12x.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Neighbour Recurrences {#neighbour-recurrences-39}

```{=latex}
\Needspace{10\baselineskip}
```
Once two starting polynomials are known, three-term recurrences efficiently
generate later members:

$$
\begin{aligned}
(n+1)P_{n+1}
&=(2n+1)xP_n-nP_{n-1},\\
T_{n+1}
&=2xT_n-T_{n-1},\\
H_{n+1}
&=2xH_n-2nH_{n-1},\\
(n+1)L_{n+1}
&=(2n+1-x)L_n-nL_{n-1}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the Legendre family, use $n=3$ to generate $P_4$:

$$
4P_4=7xP_3-3P_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert:

$$
P_3=\frac12(5x^3-3x),
\qquad
P_2=\frac12(3x^2-1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
4P_4
&=7x\left(\frac{5x^3-3x}{2}\right)
-3\left(\frac{3x^2-1}{2}\right)\\
&=\frac12(35x^4-21x^2-9x^2+3)\\
&=\frac12(35x^4-30x^2+3).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $4$:

$$
\boxed{
P_4(x)=\frac18(35x^4-30x^2+3)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting The Hermite Factorial {#common-mistake-forgetting-the-hermite-factorial-40}

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
e^{2xt-t^2}=\sum_{n=0}^{\infty}H_n(x)\frac{t^n}{n!},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the coefficient of $t^3$ is $H_3/3!$, not $H_3$. If that coefficient is
$4x^3/3-2x$, the polynomial is:

$$
H_3=3!\left(\frac43x^3-2x\right)=8x^3-12x.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-41}

The differential equation identifies the family, a Rodrigues formula builds a
chosen member, a generating function packages all members, and a neighbour
recurrence advances efficiently from known lower degrees.

```{=latex}
\Needspace{20\baselineskip}
```
## Weighted Orthogonality From The Differential Equation {#block-7-weighted-orthogonality-from-the-differential-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-42}

The goal is to explain what weighted orthogonality means and derive it from the
self-adjoint form of the differential equation.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Weighted Inner Products {#weighted-inner-products-43}

```{=latex}
\Needspace{10\baselineskip}
```
On an interval $(a,b)$, define:

$$
\boxed{
\langle f,g\rangle_w
=\int_a^b f(x)g(x)w(x)\,dx
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The function $w(x)$ is the **weight**. Two nonzero functions are orthogonal
when:

$$
\langle f,g\rangle_w=0.
$$

This is the function-space analogue of perpendicular vectors having zero dot
product. The weight changes how strongly different parts of the interval
contribute to the comparison.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### The Self-Adjoint Pattern {#the-self-adjoint-pattern-44}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the parameter-dependent equation:

$$
\boxed{
(p(x)y')'+\lambda w(x)y=0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ solves the equation with parameter $\lambda$:

$$
(pu')'+\lambda wu=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and $v$ solves it with a different parameter $\mu$:

$$
(pv')'+\mu wv=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the first equation by $v$:

$$
v(pu')'+\lambda wuv=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $(pv')'+\mu wv=0$, multiply by $u$:

$$
u(pv')'+\mu wuv=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first multiplication gave $v(pu')'+\lambda wuv=0$. Subtract the
$u$-multiplied equation from that result:

$$
v(pu')'-u(pv')'+(\lambda-\mu)wuv=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first two terms form a product derivative:

$$
v(pu')'-u(pv')'
=\frac{d}{dx}\left[p(vu'-uv')\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\frac{d}{dx}\left[p(vu'-uv')\right]
+(\lambda-\mu)wuv=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Integrate The Identity {#integrate-the-identity-45}

```{=latex}
\Needspace{10\baselineskip}
```
Integrate from $a$ to $b$:

$$
\int_a^b
\frac{d}{dx}\left[p(vu'-uv')\right]dx
+(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the first integral using the Fundamental Theorem of Calculus:

$$
\left[p(vu'-uv')\right]_a^b
+(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the classical boundary conditions, the boundary term vanishes. Hence:

$$
(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $\lambda\neq\mu$, divide by $\lambda-\mu$:

$$
\boxed{
\int_a^b u(x)v(x)w(x)\,dx=0
}.
$$

Thus eigenfunctions belonging to distinct parameter values are orthogonal.

```{=latex}
\Needspace{12\baselineskip}
```
### The Four Weights And Intervals {#the-four-weights-and-intervals-46}

```{=latex}
\Needspace{10\baselineskip}
```
Each classical equation can be written in self-adjoint form:

$$
\begin{array}{c|c|c|c}
\text{family}&(a,b)&p(x)&w(x)\\ \hline
P_n&(-1,1)&1-x^2&1\\
T_n&(-1,1)&\sqrt{1-x^2}&(1-x^2)^{-1/2}\\
H_n&(-\infty,\infty)&e^{-x^2}&e^{-x^2}\\
L_n&(0,\infty)&xe^{-x}&e^{-x}
\end{array}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example, multiply the Hermite equation by $e^{-x^2}$:

$$
e^{-x^2}y''-2xe^{-x^2}y'+2ne^{-x^2}y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first two terms combine because:

$$
\begin{aligned}
\frac{d}{dx}(e^{-x^2}y')
&=e^{-x^2}y''+(e^{-x^2})'y'\\
&=e^{-x^2}y''-2xe^{-x^2}y'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the self-adjoint Hermite equation is:

$$
(e^{-x^2}y')'+2ne^{-x^2}y=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Legendre Orthogonality Check {#worked-legendre-orthogonality-check-47}

```{=latex}
\Needspace{10\baselineskip}
```
Verify that $P_1$ and $P_3$ are orthogonal on $[-1,1]$ with weight $1$.
Use:

$$
P_1(x)=x,
\qquad
P_3(x)=\frac12(5x^3-3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Form the weighted inner product:

$$
\begin{aligned}
\langle P_1,P_3\rangle
&=\int_{-1}^{1}x\left[\frac12(5x^3-3x)\right]dx\\
&=\frac12\int_{-1}^{1}(5x^4-3x^2)\,dx.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both powers are even, so:

$$
\begin{aligned}
\langle P_1,P_3\rangle
&=\int_0^1(5x^4-3x^2)\,dx\\
&=\left[x^5-x^3\right]_0^1\\
&=(1-1)-(0-0)\\
&=0.
\end{aligned}
$$

Therefore $P_1$ and $P_3$ are orthogonal.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Chebyshev Weight Looks Singular {#why-the-chebyshev-weight-looks-singular-48}

```{=latex}
\Needspace{10\baselineskip}
```
Chebyshev orthogonality uses:

$$
\int_{-1}^{1}
\frac{T_m(x)T_n(x)}{\sqrt{1-x^2}}\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Although the weight becomes unbounded at $x=\pm1$, the singularities are
integrable. Use $x=\cos\theta$:

$$
dx=-\sin\theta\,d\theta,
\qquad
\sqrt{1-x^2}=\sin\theta
$$

```{=latex}
\Needspace{10\baselineskip}
```
for $0<\theta<\pi$. The weight and differential cancel:

$$
\frac{dx}{\sqrt{1-x^2}}=-d\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After reversing the transformed limits:

$$
\int_{-1}^{1}
\frac{T_m(x)T_n(x)}{\sqrt{1-x^2}}\,dx
=\int_0^\pi\cos(m\theta)\cos(n\theta)\,d\theta.
$$

For $m\neq n$, the right side is zero by trigonometric orthogonality. The
unusual Chebyshev weight is precisely what converts the $x$-integral into a
standard cosine inner product.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-49}

Self-adjoint form turns two differential equations with different parameter
values into an integral orthogonality relation. Each polynomial family carries
the interval and weight naturally associated with its equation.

```{=latex}
\Needspace{20\baselineskip}
```
## Expanding Functions In An Orthogonal Basis {#block-8-expanding-functions-in-an-orthogonal-basis}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-50}

The goal is to use orthogonality to determine expansion coefficients and show
why these polynomials are more than isolated exact solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### The Projection Formula {#the-projection-formula-51}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose orthogonal functions $\phi_0,\phi_1,\ldots$ are used to represent:

$$
f(x)=\sum_{n=0}^{N}c_n\phi_n(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the weighted inner product with $\phi_m$:

$$
\langle f,\phi_m\rangle_w
=\sum_{n=0}^{N}c_n
\langle\phi_n,\phi_m\rangle_w.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Orthogonality makes every term with $n\neq m$ vanish:

$$
\langle f,\phi_m\rangle_w
=c_m\langle\phi_m,\phi_m\rangle_w.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by the nonzero squared norm:

$$
\boxed{
c_m
=\frac{\langle f,\phi_m\rangle_w}
{\langle\phi_m,\phi_m\rangle_w}
}.
$$

This is the continuous analogue of finding a vector component by projecting
onto an orthogonal direction.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Legendre Expansion Of X Cubed {#worked-legendre-expansion-of-x-cubed-52}

```{=latex}
\Needspace{10\baselineskip}
```
Represent $f(x)=x^3$ using the odd Legendre polynomials $P_1$ and $P_3$:

$$
x^3=c_1P_1(x)+c_3P_3(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
First calculate $c_1$. Since $P_1=x$:

$$
\begin{aligned}
\langle x^3,P_1\rangle
&=\int_{-1}^{1}x^3(x)\,dx\\
&=\int_{-1}^{1}x^4\,dx\\
&=\frac25.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The squared norm is:

$$
\begin{aligned}
\langle P_1,P_1\rangle
&=\int_{-1}^{1}x^2\,dx\\
&=\frac23.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
c_1
&=\frac{2/5}{2/3}\\
&=\frac35.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate $c_3$. Using $P_3=(5x^3-3x)/2$:

$$
\begin{aligned}
\langle x^3,P_3\rangle
&=\frac12\int_{-1}^{1}(5x^6-3x^4)\,dx\\
&=\frac12\left(5\cdot\frac27-3\cdot\frac25\right)\\
&=\frac12\left(\frac{10}{7}-\frac65\right)\\
&=\frac4{35}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the squared norm directly:

$$
\begin{aligned}
\langle P_3,P_3\rangle
&=\frac14\int_{-1}^{1}(25x^6-30x^4+9x^2)\,dx\\
&=\frac14\left(25\cdot\frac27-30\cdot\frac25+9\cdot\frac23\right)\\
&=\frac14\left(\frac{50}{7}-12+6\right)\\
&=\frac27.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\begin{aligned}
c_3
&=\frac{4/35}{2/7}\\
&=\frac25.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The expansion is therefore:

$$
\boxed{
x^3=\frac35P_1(x)+\frac25P_3(x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Expansion Algebraically {#check-the-expansion-algebraically-53}

```{=latex}
\Needspace{10\baselineskip}
```
Insert the explicit polynomials:

$$
\begin{aligned}
\frac35P_1+\frac25P_3
&=\frac35x+\frac25\left[\frac12(5x^3-3x)\right]\\
&=\frac35x+\frac15(5x^3-3x)\\
&=\frac35x+x^3-\frac35x\\
&=x^3.
\end{aligned}
$$

The projection calculation and direct algebra agree.

```{=latex}
\Needspace{12\baselineskip}
```
### Exact Expansion Versus Approximation {#exact-expansion-versus-approximation-54}

```{=latex}
\Needspace{10\baselineskip}
```
The previous expansion is exact because $x^3$ lies in the span of $P_1$ and
$P_3$. For a non-polynomial function, a finite sum generally gives an
approximation:

$$
f(x)\approx\sum_{n=0}^{N}c_nP_n(x).
$$

The projection coefficients choose the approximation whose weighted squared
error is smallest within the selected polynomial span. Increasing $N$ adds
more orthogonal directions and can capture more detail.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-55}

Orthogonality isolates one expansion coefficient at a time. The same
polynomials that solve classical differential equations therefore provide
natural bases for representing and approximating other functions.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Classical-Polynomial Workflow {#block-9-a-reliable-classical-polynomial-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-56}

The goal is to organise recognition, construction, normalization, and
verification into a dependable sequence.

```{=latex}
\Needspace{12\baselineskip}
```
### The Workflow {#the-workflow-57}

#### Step 1: Identify the family

Compare every coefficient with the standard differential equation. Do not
identify a family from one coefficient alone.

#### Step 2: Recover the degree parameter

Solve the parameter relation. For example, a Legendre coefficient of $20$
requires $n(n+1)=20$, whereas a Hermite coefficient of $10$ requires
$2n=10$.

#### Step 3: Use a separate series index

```{=latex}
\Needspace{10\baselineskip}
```
If $n$ labels the polynomial degree, use $k$ for the power-series index:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

#### Step 4: Derive the recurrence locally

Substitute $y$, $y'$, and $y''$, align the powers, and show which coefficient
equation comes from $x^k$.

#### Step 5: Locate the terminating factor

Find the exact index at which a numerator such as $k-n$ vanishes.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Select the terminating chain

For a two-step recurrence, retain the parity chain matching $n$ and set the
other starting coefficient to zero. For Laguerre's one-step recurrence, begin
from $a_0$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply the stated normalization

Use $P_n(1)=1$, $T_n(1)=1$, the leading coefficient $2^n$ for $H_n$, or
$L_n(0)=1$.

#### Step 8: Verify the result

Check the degree, normalization, and differential equation. If orthogonality
is claimed, include the correct interval and weight.

#### Step 9: Choose an efficient secondary tool

Use a neighbour recurrence for later members, a Rodrigues formula for one
explicit member, or a generating function when several low-order members are
needed together.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Confusing N And K {#common-mistake-confusing-n-and-k-58}

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
(1-x^2)y''-2xy'+n(n+1)y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
$n$ is fixed while one chosen Legendre equation is being solved. In:

$$
y=\sum_{k=0}^{\infty}a_kx^k,
$$

$k$ runs through all coefficient indices. Reusing $n$ for both jobs can make
the termination step impossible to read.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Stopping At One Zero Coefficient {#common-mistake-stopping-at-one-zero-coefficient-59}

```{=latex}
\Needspace{10\baselineskip}
```
Showing $a_{n+2}=0$ is not enough by itself. Use the recurrence once more:

$$
a_{n+4}=R(n+2)a_{n+2}=0,
$$

and similarly for every later coefficient in that chain. The recurrence, not
wishful truncation, proves that the series has terminated.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Mixing Normalizations {#common-mistake-mixing-normalizations-60}

```{=latex}
\Needspace{10\baselineskip}
```
The equation is homogeneous, so a nonzero multiple still solves it. However,
the name $L_2$ in this chapter means the normalization $L_2(0)=1$:

$$
L_2(x)=1-2x+\frac12x^2.
$$

The polynomial $2-4x+x^2$ is also a solution, but it is $2L_2$, not the
normalized $L_2$ itself.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Omitting The Weight {#common-mistake-omitting-the-weight-61}

```{=latex}
\Needspace{10\baselineskip}
```
Chebyshev orthogonality does not mean:

$$
\int_{-1}^{1}T_m(x)T_n(x)\,dx=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
for every $m\neq n$. The correct inner product contains:

$$
w(x)=\frac1{\sqrt{1-x^2}}.
$$

Orthogonality is always a statement about a family, an interval, and a weight
together.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reading A Generating Coefficient Too Quickly {#common-mistake-reading-a-generating-coefficient-too-quickly-62}

```{=latex}
\Needspace{10\baselineskip}
```
First inspect the right side of the generating identity. In:

$$
e^{2xt-t^2}=\sum_{n=0}^{\infty}H_n(x)\frac{t^n}{n!},
$$

the coefficient of $t^n$ must be multiplied by $n!$ to recover $H_n$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-63}

Recognise the full equation, separate the degree label from the series index,
prove termination through the recurrence, normalize explicitly, and attach the
correct weight and interval to every orthogonality claim.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Recognition And Basic Construction {#problems-1-to-4-recognition-and-basic-construction-64}

#### Problem 1: Identify Four Families

```{=latex}
\Needspace{10\baselineskip}
```
Identify the polynomial family and degree $n$ associated with each equation.

$$
\begin{aligned}
\text{(a)}\quad &(1-x^2)y''-xy'+49y=0,\\
\text{(b)}\quad &y''-2xy'+12y=0,\\
\text{(c)}\quad &xy''+(1-x)y'+4y=0,\\
\text{(d)}\quad &(1-x^2)y''-2xy'+30y=0.
\end{aligned}
$$

#### Problem 2: Rebuild The Chebyshev Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
(1-x^2)y''-xy'+n^2y=0,
$$

derive the recurrence relating $a_{k+2}$ to $a_k$.

#### Problem 3: Construct P Two

Use the Legendre coefficient recurrence and the normalization $P_2(1)=1$ to
construct $P_2(x)$.

#### Problem 4: Generate T Three

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
T_{n+1}=2xT_n-T_{n-1},
$$

together with $T_1=x$ and $T_2=2x^2-1$, to find $T_3$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Series, Rodrigues, And Verification {#problems-5-to-8-series-rodrigues-and-verification-65}

#### Problem 5: Construct H Three By Series

Use the Hermite recurrence and the physicists' leading-coefficient
normalization to construct $H_3(x)$.

#### Problem 6: Construct L Two By Series

Use the Laguerre recurrence and $L_2(0)=1$ to construct $L_2(x)$.

#### Problem 7: Use Rodrigues For P Three

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
P_n(x)=\frac1{2^nn!}\frac{d^n}{dx^n}(x^2-1)^n,
$$

calculate $P_3(x)$.

#### Problem 8: Verify A Laguerre Polynomial

```{=latex}
\Needspace{10\baselineskip}
```
Verify directly that:

$$
L_2(x)=1-2x+\frac12x^2
$$

solves the $n=2$ Laguerre equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Orthogonality, Projection, And Scale {#problems-9-to-12-orthogonality-projection-and-scale-66}

#### Problem 9: Check Legendre Orthogonality

Verify directly that $P_0(x)=1$ and $P_2(x)=(3x^2-1)/2$ are orthogonal on
$[-1,1]$ with weight $1$.

#### Problem 10: Transform A Chebyshev Inner Product

```{=latex}
\Needspace{10\baselineskip}
```
Use $x=\cos\theta$ to show that the weighted inner product of $T_1$ and $T_2$
on $[-1,1]$ becomes:

$$
\int_0^\pi\cos\theta\cos(2\theta)\,d\theta,
$$

and evaluate it.

#### Problem 11: Expand X Squared In Legendre Polynomials

```{=latex}
\Needspace{10\baselineskip}
```
Use weighted projections to find $c_0$ and $c_2$ in:

$$
x^2=c_0P_0(x)+c_2P_2(x).
$$

#### Problem 12: Separate A Solution From Its Normalization

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
q(x)=x^2-4x+2.
$$

Show that $q$ solves the $n=2$ Laguerre equation. Then determine its relation
to the normalized polynomial $L_2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-67}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

#### Equation (a)

```{=latex}
\Needspace{10\baselineskip}
```
Compare:

$$
(1-x^2)y''-xy'+49y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the Chebyshev equation:

$$
(1-x^2)y''-xy'+n^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
n^2=49.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the family uses $n\geq0$:

$$
\boxed{n=7\text{, so the polynomial is }T_7.}
$$

```{=latex}
\clearpage
```
#### Equation (b)

```{=latex}
\Needspace{10\baselineskip}
```
Compare:

$$
y''-2xy'+12y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the Hermite equation:

$$
y''-2xy'+2ny=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
2n=12,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\boxed{n=6\text{, giving }H_6.}
$$

#### Equation (c)

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
xy''+(1-x)y'+4y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has Laguerre form with $n=4$. Hence:

$$
\boxed{L_4.}
$$

```{=latex}
\clearpage
```
#### Equation (d)

```{=latex}
\Needspace{10\baselineskip}
```
Compare:

$$
(1-x^2)y''-2xy'+30y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the Legendre equation. The parameter satisfies:

$$
n(n+1)=30.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move all terms to one side:

$$
n^2+n-30=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(n-5)(n+6)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The nonnegative choice is $n=5$, so:

$$
\boxed{P_5.}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The required series forms are:

$$
\begin{aligned}
y''
&=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k,\\
x^2y''
&=\sum_{k=0}^{\infty}k(k-1)a_kx^k,\\
xy'
&=\sum_{k=0}^{\infty}ka_kx^k,\\
n^2y
&=\sum_{k=0}^{\infty}n^2a_kx^k.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the expanded equation:

$$
y''-x^2y''-xy'+n^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $x^k$ gives:

$$
(k+2)(k+1)a_{k+2}
+[n^2-k(k-1)-k]a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $k(k-1)+k=k^2$:

$$
(k+2)(k+1)a_{k+2}+(n^2-k^2)a_k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the term containing $a_k$ to the right side:

$$
\begin{aligned}
(k+2)(k+1)a_{k+2}
&=-(n^2-k^2)a_k\\
&=(k^2-n^2)a_k.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now divide both sides by $(k+2)(k+1)$:

$$
\boxed{
a_{k+2}
=\frac{k^2-n^2}{(k+2)(k+1)}a_k
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, the Legendre recurrence is:

$$
a_{k+2}
=\frac{(k-2)(k+3)}{(k+2)(k+1)}a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the even chain. At $k=0$:

$$
\begin{aligned}
a_2
&=\frac{(0-2)(0+3)}{(2)(1)}a_0\\
&=-3a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $a_2=-3a_0$, continue with $k=2$:

$$
a_4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y=a_0(1-3x^2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $P_2(1)=1$:

$$
1=a_0(1-3)=-2a_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $a_0=-1/2$, and:

$$
\boxed{
P_2(x)=\frac12(3x^2-1)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$ in the neighbour recurrence:

$$
T_3=2xT_2-T_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $T_2=2x^2-1$ and $T_1=x$:

$$
\begin{aligned}
T_3
&=2x(2x^2-1)-x\\
&=4x^3-2x-x\\
&=4x^3-3x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{T_3(x)=4x^3-3x}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-68}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
For $n=3$, the Hermite recurrence becomes:

$$
a_{k+2}=\frac{2(k-3)}{(k+2)(k+1)}a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the odd chain and set $a_0=0$. At $k=1$:

$$
\begin{aligned}
a_3
&=\frac{2(1-3)}{(3)(2)}a_1\\
&=-\frac23a_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $k=3$, the terminating factor appears:

$$
a_5=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The polynomial therefore has the form:

$$
y=a_1x-\frac23a_1x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The physicists' normalization requires the leading coefficient to be
$2^3=8$. Hence:

$$
-\frac23a_1=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $-3/2$:

$$
a_1=-12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this value:

$$
\boxed{H_3(x)=8x^3-12x}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, the Laguerre recurrence is:

$$
a_{k+1}=\frac{k-2}{(k+1)^2}a_k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The normalization $L_2(0)=1$ gives $a_0=1$. At $k=0$:

$$
a_1=\frac{-2}{1}a_0=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $k=1$:

$$
\begin{aligned}
a_2
&=\frac{1-2}{(2)^2}a_1\\
&=-\frac14(-2)\\
&=\frac12.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $k=2$:

$$
a_3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{L_2(x)=1-2x+\frac12x^2}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
For $n=3$, Rodrigues' formula gives:

$$
P_3(x)=\frac1{2^3(3!)}
\frac{d^3}{dx^3}(x^2-1)^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First expand the cube:

$$
(x^2-1)^3=x^6-3x^4+3x^2-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
6x^5-12x^3+6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate a second time:

$$
30x^4-36x^2+6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate a third time:

$$
120x^3-72x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The denominator is:

$$
2^3(3!)=8\cdot6=48.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
P_3(x)
&=\frac{120x^3-72x}{48}\\
&=\frac12(5x^3-3x).
\end{aligned}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, the Laguerre equation is:

$$
xy''+(1-x)y'+2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
y=1-2x+\frac12x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its derivatives are:

$$
y'=-2+x,
\qquad
y''=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate each equation term:

```{=latex}
\Needspace{10\baselineskip}
```
$$
xy''=x,
$$

$$
\begin{aligned}
(1-x)y'
&=(1-x)(x-2)\\
&=x-2-x^2+2x\\
&=-x^2+3x-2,
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
2y=2-4x+x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add them:

$$
\begin{aligned}
xy''+(1-x)y'+2y
&=x+(-x^2+3x-2)+(2-4x+x^2)\\
&=0.
\end{aligned}
$$

Thus the proposed $L_2$ satisfies the equation.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-69}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
P_0(x)=1,
\qquad
P_2(x)=\frac12(3x^2-1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their inner product with weight $1$ is:

$$
\begin{aligned}
\langle P_0,P_2\rangle
&=\int_{-1}^{1}1\cdot\frac12(3x^2-1)\,dx\\
&=\frac12\left(3\int_{-1}^{1}x^2\,dx
-\int_{-1}^{1}1\,dx\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the two integrals:

$$
\int_{-1}^{1}x^2\,dx=\frac23,
\qquad
\int_{-1}^{1}1\,dx=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
\begin{aligned}
\langle P_0,P_2\rangle
&=\frac12\left(3\cdot\frac23-2\right)\\
&=\frac12(2-2)\\
&=0.
\end{aligned}
$$

Therefore $P_0$ and $P_2$ are orthogonal on $[-1,1]$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The Chebyshev inner product is:

$$
\int_{-1}^{1}
\frac{T_1(x)T_2(x)}{\sqrt{1-x^2}}\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=\cos\theta$. Then:

$$
dx=-\sin\theta\,d\theta,
\qquad
\sqrt{1-x^2}=\sin\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also:

$$
T_1(\cos\theta)=\cos\theta,
\qquad
T_2(\cos\theta)=\cos(2\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
As $x$ increases from $-1$ to $1$, $\theta$ decreases from $\pi$ to $0$.
Therefore:

$$
\begin{aligned}
\int_{-1}^{1}
\frac{T_1T_2}{\sqrt{1-x^2}}\,dx
&=\int_{\pi}^{0}
\frac{\cos\theta\cos(2\theta)}{\sin\theta}
(-\sin\theta)\,d\theta\\
&=\int_0^\pi\cos\theta\cos(2\theta)\,d\theta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the product-to-sum identity:

$$
\cos\theta\cos(2\theta)
=\frac12[\cos\theta+\cos(3\theta)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\begin{aligned}
\int_0^\pi\cos\theta\cos(2\theta)\,d\theta
&=\frac12\int_0^\pi[\cos\theta+\cos(3\theta)]\,d\theta\\
&=\frac12\left[\sin\theta+\frac13\sin(3\theta)\right]_0^\pi\\
&=0.
\end{aligned}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Seek:

$$
x^2=c_0P_0+c_2P_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c_0$, use the projection formula:

$$
c_0=\frac{\langle x^2,P_0\rangle}
{\langle P_0,P_0\rangle}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the numerator and denominator:

```{=latex}
\Needspace{10\baselineskip}
```
$$
\langle x^2,P_0\rangle
=\int_{-1}^{1}x^2\,dx=\frac23,
$$

$$
\langle P_0,P_0\rangle
=\int_{-1}^{1}1\,dx=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_0=\frac{2/3}{2}=\frac13.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c_2$:

$$
c_2=\frac{\langle x^2,P_2\rangle}
{\langle P_2,P_2\rangle}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The numerator is:

$$
\begin{aligned}
\langle x^2,P_2\rangle
&=\frac12\int_{-1}^{1}(3x^4-x^2)\,dx\\
&=\frac12\left(3\cdot\frac25-\frac23\right)\\
&=\frac4{15}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The denominator is:

$$
\begin{aligned}
\langle P_2,P_2\rangle
&=\frac14\int_{-1}^{1}(9x^4-6x^2+1)\,dx\\
&=\frac14\left(9\cdot\frac25-6\cdot\frac23+2\right)\\
&=\frac25.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_2=\frac{4/15}{2/5}=\frac23.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The expansion is:

$$
\boxed{
x^2=\frac13P_0(x)+\frac23P_2(x)
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, the Laguerre equation is:

$$
xy''+(1-x)y'+2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
q=x^2-4x+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
q'=2x-4,
\qquad
q''=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
\begin{aligned}
xq''+(1-x)q'+2q
&=2x+(1-x)(2x-4)+2(x^2-4x+2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the product:

$$
\begin{aligned}
(1-x)(2x-4)
&=2x-4-2x^2+4x\\
&=-2x^2+6x-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now combine all terms:

$$
\begin{aligned}
xq''+(1-x)q'+2q
&=2x+(-2x^2+6x-4)+(2x^2-8x+4)\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $q$ is a solution. Compare it with:

$$
L_2(x)=1-2x+\frac12x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiplying $L_2$ by $2$ gives:

$$
2L_2(x)=2-4x+x^2=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{q=2L_2}.
$$

It solves the equation but is not the normalized $L_2$, because $q(0)=2$
rather than $1$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 29 Final Summary {#chapter-29-final-summary-70}

```{=latex}
\Needspace{10\baselineskip}
```
The four classical equations select polynomial solutions when the degree
parameter is a nonnegative integer:

$$
\begin{aligned}
(1-x^2)y''-2xy'+n(n+1)y&=0 &&\longrightarrow P_n,\\
(1-x^2)y''-xy'+n^2y&=0 &&\longrightarrow T_n,\\
y''-2xy'+2ny&=0 &&\longrightarrow H_n,\\
xy''+(1-x)y'+ny&=0 &&\longrightarrow L_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their common construction pattern is:

$$
\boxed{
\begin{aligned}
\text{identify the equation}
&\longrightarrow\text{derive the coefficient recurrence}\\
&\longrightarrow\text{locate its terminating factor}\\
&\longrightarrow\text{select the terminating chain}\\
&\longrightarrow\text{apply the family normalization}\\
&\longrightarrow\text{verify the equation and degree}.
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
Self-adjoint form supplies the appropriate weighted orthogonality. That
orthogonality then turns each family into a basis for exact expansions and
approximations.

```{=latex}
\Needspace{8\baselineskip}
```
> a classical polynomial is simultaneously a terminated series solution, a
> normalized member of a recurrence family, and an orthogonal basis function.

[^1]: In a finite-dimensional dot product, coordinates may be
    assigned different importance. A weight function performs the continuous
    version of that reweighting across an interval.
