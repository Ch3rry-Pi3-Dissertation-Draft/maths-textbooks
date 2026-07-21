# Classical Differential Equations And Orthogonal Polynomials

The power-series and Frobenius methods do more than produce infinite series.
For certain differential equations and certain parameter values, a recurrence
relation forces the series to stop. The result is a polynomial solution.

Four important families arise this way:

- Legendre polynomials
- Chebyshev polynomials
- Hermite polynomials
- Laguerre polynomials

These families are useful because they combine three structures: each member
solves a differential equation, neighbouring members satisfy recurrence
relations, and different members are orthogonal under an appropriate weighted
integral.

This chapter will:

- explain how a parameter turns an infinite series into a polynomial
- derive the coefficient recurrence for each classical equation
- state the normalization used for every polynomial family
- connect differential equations, Rodrigues formulas, and generating functions
- derive weighted orthogonality from self-adjoint form
- calculate expansion coefficients using weighted inner products
- build a reliable workflow for recognising and checking classical polynomials

---

## Block 1: Why Polynomial Solutions Appear

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what makes a classical equation special and why its
parameter is restricted to a nonnegative integer.

> the equation does not begin by assuming a polynomial; its recurrence reveals
> when a polynomial is possible.

</details>


---


<details open>
<summary><strong>A Parameter-Dependent Equation</strong></summary>

Consider a family of equations written schematically as:

$$
A(x)y''+B(x)y'+\lambda y=0.
$$

Here:

- $x$ is the independent variable
- $y(x)$ is the unknown function
- $\lambda$ is a parameter
- $A(x)$ and $B(x)$ are fixed coefficient functions

Different values of $\lambda$ usually produce different solutions. At special
values, however, the power-series recurrence can contain a zero numerator.
Every later coefficient in one parity chain then becomes zero.

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

</details>

<details open>
<summary><strong>The Four Equations</strong></summary>

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

</details>

<details open>
<summary><strong>Normalization Is Part Of The Name</strong></summary>

A homogeneous equation does not distinguish $y$ from a nonzero multiple $Cy$.
If $y$ solves the equation, then $Cy$ also solves it. A normalization selects
one representative and gives the named polynomial a definite scale.

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

The practical meaning:

> solving the differential equation determines a polynomial only up to scale;
> the normalization determines its conventional name.

</details>

<details open>
<summary><strong>First Members Of The Four Families</strong></summary>

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

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Each classical family is a sequence of normalized polynomial solutions. The
integer $n$ chooses the equation and, after normalization, identifies the
degree-$n$ polynomial.

</details>

---

## Block 2: Legendre Polynomials From A Power Series

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the Legendre recurrence, see exactly why one coefficient
chain terminates, and construct $P_3(x)$ without guessing it.

</details>

<details open>
<summary><strong>Begin With The Legendre Equation</strong></summary>

For a fixed nonnegative integer $n$, consider:

$$
(1-x^2)y''-2xy'+n(n+1)y=0.
$$

The coefficient $1-x^2$ vanishes at $x=\pm1$. The origin is an ordinary point,
so seek a power series centred at $0$:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

Differentiate and reindex:

$$
\begin{aligned}
y'&=\sum_{k=0}^{\infty}(k+1)a_{k+1}x^k,\\
y''&=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k.
\end{aligned}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Substitute Every Term</strong></summary>

Start by expanding the equation:

$$
y''-x^2y''-2xy'+n(n+1)y=0.
$$

The first term is already indexed by $x^k$:

$$
y''=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k.
$$

For the product $x^2y''$, use the unreindexed derivative and multiply by
$x^2$:

$$
\begin{aligned}
x^2y''
&=x^2\sum_{k=2}^{\infty}k(k-1)a_kx^{k-2}\\
&=\sum_{k=2}^{\infty}k(k-1)a_kx^k.
\end{aligned}
$$

Similarly:

$$
\begin{aligned}
2xy'
&=2x\sum_{k=1}^{\infty}ka_kx^{k-1}\\
&=\sum_{k=1}^{\infty}2ka_kx^k.
\end{aligned}
$$

Finally:

$$
n(n+1)y
=\sum_{k=0}^{\infty}n(n+1)a_kx^k.
$$

The factors $k(k-1)$ and $k$ vanish automatically at the omitted starting
indices, so all four sums may be compared from $k=0$ onward.

</details>

<details open>
<summary><strong>Derive The Legendre Recurrence</strong></summary>

The coefficient of $x^k$ is:

$$
(k+2)(k+1)a_{k+2}
-k(k-1)a_k
-2ka_k
+n(n+1)a_k.
$$

Combine the three terms multiplying $a_k$:

$$
\begin{aligned}
&-k(k-1)-2k+n(n+1)\\
&=-k^2-k+n(n+1)\\
&=n(n+1)-k(k+1).
\end{aligned}
$$

Hence:

$$
(k+2)(k+1)a_{k+2}
+[n(n+1)-k(k+1)]a_k=0.
$$

Subtract the $a_k$ term and divide by $(k+2)(k+1)$:

$$
\boxed{
a_{k+2}
=\frac{k(k+1)-n(n+1)}{(k+2)(k+1)}a_k
}.
$$

Factor the numerator:

$$
\begin{aligned}
k(k+1)-n(n+1)
&=k^2+k-n^2-n\\
&=(k-n)(k+n+1).
\end{aligned}
$$

Therefore the equivalent factored recurrence is:

$$
\boxed{
a_{k+2}
=\frac{(k-n)(k+n+1)}{(k+2)(k+1)}a_k
}.
$$

</details>

<details open>
<summary><strong>Why The Series Terminates</strong></summary>

The recurrence advances by two indices:

$$
a_0\to a_2\to a_4\to\cdots,
\qquad
a_1\to a_3\to a_5\to\cdots.
$$

These are the even and odd coefficient chains. When $k=n$, the recurrence
numerator contains:

$$
k-n=n-n=0.
$$

Consequently:

$$
a_{n+2}=0.
$$

The same recurrence then gives $a_{n+4}=a_{n+6}=\cdots=0$. The chain having
the same parity as $n$ terminates at degree $n$.

The other parity chain generally continues forever. To obtain the Legendre
polynomial, set the starting coefficient of that nonterminating chain to zero.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Construction Of P Three</strong></summary>

Set $n=3$. The recurrence becomes:

$$
a_{k+2}
=\frac{(k-3)(k+4)}{(k+2)(k+1)}a_k.
$$

Because $n=3$ is odd, use the odd chain and set $a_0=0$. Begin with arbitrary
$a_1$.

For $k=1$:

$$
\begin{aligned}
a_3
&=\frac{(1-3)(1+4)}{(3)(2)}a_1\\
&=\frac{(-2)(5)}6a_1\\
&=-\frac53a_1.
\end{aligned}
$$

For $k=3$:

$$
\begin{aligned}
a_5
&=\frac{(3-3)(3+4)}{(5)(4)}a_3\\
&=0.
\end{aligned}
$$

Thus the terminating odd solution is:

$$
y(x)=a_1x-\frac53a_1x^3.
$$

Factor out $a_1$:

$$
y(x)=a_1\left(x-\frac53x^3\right).
$$

Now apply the normalization $P_3(1)=1$:

$$
\begin{aligned}
1
&=a_1\left(1-\frac53\right)\\
&=-\frac23a_1.
\end{aligned}
$$

From $1=-2a_1/3$, multiply both sides by $-3/2$:

$$
a_1=-\frac32.
$$

Substitute this value into the polynomial:

$$
\boxed{
P_3(x)=\frac12(5x^3-3x)
}.
$$

</details>

<details open>
<summary><strong>Verify The Constructed Polynomial</strong></summary>

For $n=3$, the Legendre equation is:

$$
(1-x^2)y''-2xy'+12y=0.
$$

Using $P_3=(5x^3-3x)/2$:

$$
P_3'=\frac12(15x^2-3),
\qquad
P_3''=15x.
$$

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

The normalization is also immediate:

$$
P_3(1)=\frac12(5-3)=1.
$$

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

The Legendre recurrence links coefficients two places apart. At $k=n$, its
numerator vanishes, so the parity chain matching $n$ terminates. The condition
$P_n(1)=1$ then fixes the remaining scale.

</details>
## Block 3: Chebyshev Polynomials And The Hidden Angle

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the Chebyshev recurrence and then explain why the
substitution $x=\cos\theta$ turns the equation into simple harmonic motion.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Derive The Series Recurrence</strong></summary>

The Chebyshev equation of degree $n$ is:

$$
(1-x^2)y''-xy'+n^2y=0.
$$

Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

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

Substitute these expressions into:

$$
y''-x^2y''-xy'+n^2y=0.
$$

The coefficient of $x^k$ is:

$$
(k+2)(k+1)a_{k+2}
-k(k-1)a_k-ka_k+n^2a_k.
$$

Combine the middle terms:

$$
-k(k-1)-k=-k^2.
$$

After using $-k(k-1)-k=-k^2$, the coefficient equation is:

$$
(k+2)(k+1)a_{k+2}+(n^2-k^2)a_k=0.
$$

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

</details>

<details open>
<summary><strong>Worked Construction Of T Four</strong></summary>

Set $n=4$. Since the required polynomial has even degree, choose the even
chain and set $a_1=0$. The recurrence is:

$$
a_{k+2}
=\frac{(k-4)(k+4)}{(k+2)(k+1)}a_k.
$$

For $k=0$:

$$
\begin{aligned}
a_2
&=\frac{(0-4)(0+4)}{(2)(1)}a_0\\
&=-8a_0.
\end{aligned}
$$

For $k=2$:

$$
\begin{aligned}
a_4
&=\frac{(2-4)(2+4)}{(4)(3)}a_2\\
&=-a_2\\
&=8a_0.
\end{aligned}
$$

For $k=4$:

$$
\begin{aligned}
a_6
&=\frac{(4-4)(4+4)}{(6)(5)}a_4\\
&=0.
\end{aligned}
$$

Thus:

$$
y(x)=a_0(1-8x^2+8x^4).
$$

At $x=1$, the bracket equals $1-8+8=1$. The normalization $T_4(1)=1$
therefore gives $a_0=1$:

$$
\boxed{T_4(x)=8x^4-8x^2+1}.
$$

</details>

<details open>
<summary><strong>Reveal The Hidden Constant-Coefficient Equation</strong></summary>

On $-1<x<1$, write:

$$
x=\cos\theta
$$

and define:

$$
Y(\theta)=y(\cos\theta).
$$

Differentiate $Y$ with respect to $\theta$. By the chain rule:

$$
\begin{aligned}
Y'
&=y'(x)\frac{dx}{d\theta}\\
&=-y'(x)\sin\theta.
\end{aligned}
$$

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

Since $x=\cos\theta$ and $\sin^2\theta=1-x^2$:

$$
\boxed{
Y''=(1-x^2)y''-xy'
}.
$$

The Chebyshev equation consequently becomes:

$$
Y''+n^2Y=0.
$$

This is a constant-coefficient oscillation equation.

</details>

<details open>
<summary><strong>Obtain The Cosine Formula</strong></summary>

One solution of $Y''+n^2Y=0$ is:

$$
Y(\theta)=\cos(n\theta).
$$

Because $x=\cos\theta$, we may take $\theta=\arccos x$. Return to $x$:

$$
\boxed{
T_n(x)=\cos(n\arccos x),
\qquad -1\leq x\leq1
}.
$$

This formula automatically satisfies $T_n(1)=1$, because
$\arccos(1)=0$ and $\cos(0)=1$.

For $n=4$, the multiple-angle identity gives:

$$
\cos(4\theta)=8\cos^4\theta-8\cos^2\theta+1.
$$

Substituting $x=\cos\theta$ recovers:

$$
T_4(x)=8x^4-8x^2+1.
$$

The series calculation and the angle substitution have produced the same
normalized polynomial by two independent routes.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Derive The Three-Term Recurrence</strong></summary>

The cosine addition identity is:

$$
\cos((n+1)\theta)+\cos((n-1)\theta)
=2\cos\theta\cos(n\theta).
$$

Use:

$$
x=\cos\theta,
\qquad
T_j(x)=\cos(j\theta).
$$

The identity becomes:

$$
T_{n+1}(x)+T_{n-1}(x)=2xT_n(x).
$$

Subtract $T_{n-1}$ from both sides:

$$
\boxed{
T_{n+1}(x)=2xT_n(x)-T_{n-1}(x)
}.
$$

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

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

The Chebyshev recurrence terminates at $k=n$. The substitution
$x=\cos\theta$ also reveals that the polynomial is a disguised cosine:
$T_n(x)=\cos(n\arccos x)$.

</details>

---

## Block 4: Hermite Polynomials And Gaussian Structure

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the Hermite coefficient recurrence, construct a
normalized polynomial, and understand why derivatives of a Gaussian generate
the same family.

</details>

<details open>
<summary><strong>Derive The Hermite Recurrence</strong></summary>

The physicists' Hermite equation is:

$$
y''-2xy'+2ny=0.
$$

Use the series:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

Then:

$$
y''=\sum_{k=0}^{\infty}(k+2)(k+1)a_{k+2}x^k,
$$

and:

$$
-2xy'=-2\sum_{k=0}^{\infty}ka_kx^k.
$$

The final term is:

$$
2ny=2n\sum_{k=0}^{\infty}a_kx^k.
$$

Match the coefficient of $x^k$:

$$
(k+2)(k+1)a_{k+2}-2ka_k+2na_k=0.
$$

Combine the $a_k$ terms:

$$
(k+2)(k+1)a_{k+2}+2(n-k)a_k=0.
$$

Therefore:

$$
\boxed{
a_{k+2}=\frac{2(k-n)}{(k+2)(k+1)}a_k
}.
$$

At $k=n$, the numerator vanishes. The parity chain matching $n$ terminates.

</details>

<details open>
<summary><strong>Worked Construction Of H Four</strong></summary>

Set $n=4$ and use the even coefficient chain. The recurrence becomes:

$$
a_{k+2}=\frac{2(k-4)}{(k+2)(k+1)}a_k.
$$

For $k=0$:

$$
\begin{aligned}
a_2
&=\frac{2(0-4)}{(2)(1)}a_0\\
&=-4a_0.
\end{aligned}
$$

For $k=2$:

$$
\begin{aligned}
a_4
&=\frac{2(2-4)}{(4)(3)}a_2\\
&=-\frac13a_2\\
&=\frac43a_0.
\end{aligned}
$$

With $a_2=-4a_0$ and $a_4=4a_0/3$, set $k=4$:

$$
a_6=0.
$$

Thus the terminating solution is:

$$
y=a_0\left(1-4x^2+\frac43x^4\right).
$$

The physicists' normalization requires the leading coefficient to be
$2^4=16$. Since the leading coefficient above is $4a_0/3$:

$$
\frac43a_0=16.
$$

Multiply by $3/4$:

$$
a_0=12.
$$

Therefore:

$$
\boxed{
H_4(x)=16x^4-48x^2+12
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>The Rodrigues Formula</strong></summary>

Hermite polynomials can also be generated by:

$$
\boxed{
H_n(x)=(-1)^ne^{x^2}
\frac{d^n}{dx^n}\left(e^{-x^2}\right)
}.
$$

The factor $e^{x^2}$ cancels the Gaussian remaining after repeated
differentiation, leaving a polynomial.

For $n=2$, begin with:

$$
\frac{d}{dx}e^{-x^2}=-2xe^{-x^2}.
$$

Differentiate again using the product rule:

$$
\begin{aligned}
\frac{d^2}{dx^2}e^{-x^2}
&=-2e^{-x^2}+(-2x)(-2x)e^{-x^2}\\
&=(4x^2-2)e^{-x^2}.
\end{aligned}
$$

Now use $(-1)^2=1$ and multiply by $e^{x^2}$:

$$
\begin{aligned}
H_2(x)
&=e^{x^2}(4x^2-2)e^{-x^2}\\
&=4x^2-2.
\end{aligned}
$$

</details>

<details open>
<summary><strong>A Useful Hermite Recurrence</strong></summary>

Neighbouring physicists' Hermite polynomials satisfy:

$$
\boxed{
H_{n+1}(x)=2xH_n(x)-2nH_{n-1}(x)
}.
$$

Use $n=3$, together with:

$$
H_2=4x^2-2,
\qquad
H_3=8x^3-12x.
$$

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

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

The Hermite equation produces a terminating parity chain when $n$ is a
nonnegative integer. The standard physicists' normalization fixes the leading
coefficient at $2^n$, while the Rodrigues formula exposes the family's
connection to the Gaussian $e^{-x^2}$.

</details>

---

## Block 5: Laguerre Polynomials On A Half-Line

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive a one-step recurrence for the Laguerre coefficients and
see how its normalization differs from the parity-based families.

</details>

<details open>
<summary><strong>Derive The Laguerre Recurrence</strong></summary>

The Laguerre equation is:

$$
xy''+(1-x)y'+ny=0.
$$

Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

First reindex $xy''$. Starting from the unreindexed second derivative:

$$
y''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-2},
$$

start from $y''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-2}$ and multiply by $x$:

$$
xy''=\sum_{j=2}^{\infty}j(j-1)a_jx^{j-1}.
$$

Set $k=j-1$, so $j=k+1$:

$$
xy''=\sum_{k=1}^{\infty}(k+1)ka_{k+1}x^k.
$$

The remaining derivative terms are:

$$
y'=\sum_{k=0}^{\infty}(k+1)a_{k+1}x^k
$$

and:

$$
-xy'=-\sum_{k=1}^{\infty}ka_kx^k.
$$

Finally:

$$
ny=n\sum_{k=0}^{\infty}a_kx^k.
$$

For $k=0$, the $xy''$ and $-xy'$ contributions vanish. For every $k\geq0$,
the coefficient equation can therefore be written as:

$$
[(k+1)k+(k+1)]a_{k+1}+(n-k)a_k=0.
$$

Factor the first bracket:

$$
(k+1)k+(k+1)=(k+1)^2.
$$

Thus:

$$
(k+1)^2a_{k+1}+(n-k)a_k=0.
$$

Solve for $a_{k+1}$:

$$
\boxed{
a_{k+1}=\frac{k-n}{(k+1)^2}a_k
}.
$$

Unlike the two-step recurrences above, this recurrence connects every
successive coefficient. At $k=n$, it gives $a_{n+1}=0$, after which all later
coefficients vanish.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Construction Of L Three</strong></summary>

Set $n=3$ and apply the normalization $L_3(0)=1$. Since $L_3(0)=a_0$, choose:

$$
a_0=1.
$$

For $k=0$:

$$
\begin{aligned}
a_1
&=\frac{0-3}{(1)^2}a_0\\
&=-3.
\end{aligned}
$$

For $k=1$:

$$
\begin{aligned}
a_2
&=\frac{1-3}{(2)^2}a_1\\
&=-\frac12(-3)\\
&=\frac32.
\end{aligned}
$$

For $k=2$:

$$
\begin{aligned}
a_3
&=\frac{2-3}{(3)^2}a_2\\
&=-\frac19\left(\frac32\right)\\
&=-\frac16.
\end{aligned}
$$

For $k=3$:

$$
a_4=0.
$$

Using $a_0=1$, $a_1=-3$, $a_2=3/2$, and $a_3=-1/6$, the polynomial is:

$$
\boxed{
L_3(x)=1-3x+\frac32x^2-\frac16x^3
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Verify L Three Directly</strong></summary>

For $n=3$, the Laguerre equation is:

$$
xy''+(1-x)y'+3y=0.
$$

Differentiate the polynomial:

$$
\begin{aligned}
L_3'&=-3+3x-\frac12x^2,\\
L_3''&=3-x.
\end{aligned}
$$

Substitute one term at a time:

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

and:

$$
3L_3=3-9x+\frac92x^2-\frac12x^3.
$$

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

</details>

<details open>
<summary><strong>The Laguerre Rodrigues Formula</strong></summary>

The normalized Laguerre polynomial is also given by:

$$
\boxed{
L_n(x)=\frac{e^x}{n!}
\frac{d^n}{dx^n}\left(e^{-x}x^n\right)
}.
$$

For $n=2$, let:

$$
f(x)=e^{-x}x^2.
$$

Differentiate once:

$$
\begin{aligned}
f'
&=(-e^{-x})x^2+e^{-x}(2x)\\
&=e^{-x}(2x-x^2).
\end{aligned}
$$

Differentiate again:

$$
\begin{aligned}
f''
&=-e^{-x}(2x-x^2)+e^{-x}(2-2x)\\
&=e^{-x}(x^2-4x+2).
\end{aligned}
$$

Insert this into the Rodrigues formula:

$$
\begin{aligned}
L_2(x)
&=\frac{e^x}{2!}e^{-x}(x^2-4x+2)\\
&=\frac12(x^2-4x+2)\\
&=1-2x+\frac12x^2.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

The Laguerre recurrence advances one coefficient at a time and terminates when
$k=n$. The condition $L_n(0)=1$ sets $a_0=1$, while the factor $1/n!$ in the
Rodrigues formula produces the same normalization.

</details>

---

## Block 6: Three Ways To Generate A Polynomial Family

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to distinguish three related tools: differential equations,
Rodrigues formulas, and generating functions.

> these tools describe the same polynomial families, but they answer different
> computational questions.

</details>

<details open>
<summary><strong>What Each Tool Is For</strong></summary>

The **differential equation** explains which functions belong to a family and
why special parameter values permit polynomial solutions.

A **Rodrigues formula** constructs one chosen polynomial by repeated
differentiation.

A **generating function** packages the whole family into one function of an
extra variable $t$. Expanding in powers of $t$ reveals every polynomial as a
coefficient.

These are complementary descriptions. A generating function does not replace
the independent variable $x$; it introduces a bookkeeping variable $t$.

</details>

<details open>
<summary><strong>Rodrigues Formulas And Normalization</strong></summary>

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

For example, use the Legendre formula with $n=2$:

$$
P_2(x)=\frac1{2^2(2!)}
\frac{d^2}{dx^2}(x^2-1)^2.
$$

Expand before differentiating:

$$
(x^2-1)^2=x^4-2x^2+1.
$$

Differentiate once:

$$
\frac{d}{dx}(x^4-2x^2+1)=4x^3-4x.
$$

Differentiate again:

$$
\frac{d^2}{dx^2}(x^2-1)^2=12x^2-4.
$$

Since $2^2(2!)=8$:

$$
\begin{aligned}
P_2(x)
&=\frac18(12x^2-4)\\
&=\frac12(3x^2-1).
\end{aligned}
$$

</details>

<details open>
<summary><strong>Generating Functions</strong></summary>

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

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Hermite Generating-Function Expansion</strong></summary>

Use:

$$
e^{2xt-t^2}=e^{2xt}e^{-t^2}.
$$

Expand each factor through $t^3$:

$$
\begin{aligned}
e^{2xt}
&=1+2xt+\frac{(2xt)^2}{2!}
+\frac{(2xt)^3}{3!}+O(t^4)\\
&=1+2xt+2x^2t^2+\frac43x^3t^3+O(t^4),
\end{aligned}
$$

and:

$$
e^{-t^2}=1-t^2+O(t^4).
$$

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

Compare this with:

$$
e^{2xt-t^2}
=H_0+H_1t+H_2\frac{t^2}{2!}+H_3\frac{t^3}{3!}+\cdots.
$$

Match coefficients one power at a time:

$$
H_0=1,
\qquad
H_1=2x.
$$

For $t^2$:

$$
\frac{H_2}{2!}=2x^2-1.
$$

Multiply by $2!=2$:

$$
H_2=4x^2-2.
$$

For $t^3$:

$$
\frac{H_3}{3!}=\frac43x^3-2x.
$$

Multiply by $3!=6$:

$$
H_3=8x^3-12x.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Neighbour Recurrences</strong></summary>

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

For the Legendre family, use $n=3$ to generate $P_4$:

$$
4P_4=7xP_3-3P_2.
$$

Insert:

$$
P_3=\frac12(5x^3-3x),
\qquad
P_2=\frac12(3x^2-1).
$$

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

Divide by $4$:

$$
\boxed{
P_4(x)=\frac18(35x^4-30x^2+3)
}.
$$

</details>

<details open>
<summary><strong>Common Mistake: Forgetting The Hermite Factorial</strong></summary>

From:

$$
e^{2xt-t^2}=\sum_{n=0}^{\infty}H_n(x)\frac{t^n}{n!},
$$

the coefficient of $t^3$ is $H_3/3!$, not $H_3$. If that coefficient is
$4x^3/3-2x$, the polynomial is:

$$
H_3=3!\left(\frac43x^3-2x\right)=8x^3-12x.
$$

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

The differential equation identifies the family, a Rodrigues formula builds a
chosen member, a generating function packages all members, and a neighbour
recurrence advances efficiently from known lower degrees.

</details>

---

## Block 7: Weighted Orthogonality From The Differential Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to explain what weighted orthogonality means and derive it from the
self-adjoint form of the differential equation.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Weighted Inner Products</strong></summary>

On an interval $(a,b)$, define:

$$
\boxed{
\langle f,g\rangle_w
=\int_a^b f(x)g(x)w(x)\,dx
}.
$$

The function $w(x)$ is the **weight**. Two nonzero functions are orthogonal
when:

$$
\langle f,g\rangle_w=0.
$$

This is the function-space analogue of perpendicular vectors having zero dot
product. The weight changes how strongly different parts of the interval
contribute to the comparison.[^weighted-geometry]

[^weighted-geometry]: In a finite-dimensional dot product, coordinates may be
    assigned different importance. A weight function performs the continuous
    version of that reweighting across an interval.

</details>

<details open>
<summary><strong>The Self-Adjoint Pattern</strong></summary>

Consider the parameter-dependent equation:

$$
\boxed{
(p(x)y')'+\lambda w(x)y=0
}.
$$

Suppose $u$ solves the equation with parameter $\lambda$:

$$
(pu')'+\lambda wu=0,
$$

and $v$ solves it with a different parameter $\mu$:

$$
(pv')'+\mu wv=0.
$$

Multiply the first equation by $v$:

$$
v(pu')'+\lambda wuv=0.
$$

For $(pv')'+\mu wv=0$, multiply by $u$:

$$
u(pv')'+\mu wuv=0.
$$

The first multiplication gave $v(pu')'+\lambda wuv=0$. Subtract the
$u$-multiplied equation from that result:

$$
v(pu')'-u(pv')'+(\lambda-\mu)wuv=0.
$$

The first two terms form a product derivative:

$$
v(pu')'-u(pv')'
=\frac{d}{dx}\left[p(vu'-uv')\right].
$$

Therefore:

$$
\frac{d}{dx}\left[p(vu'-uv')\right]
+(\lambda-\mu)wuv=0.
$$

</details>

<details open>
<summary><strong>Integrate The Identity</strong></summary>

Integrate from $a$ to $b$:

$$
\int_a^b
\frac{d}{dx}\left[p(vu'-uv')\right]dx
+(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

Evaluate the first integral using the Fundamental Theorem of Calculus:

$$
\left[p(vu'-uv')\right]_a^b
+(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

For the classical boundary conditions, the boundary term vanishes. Hence:

$$
(\lambda-\mu)\int_a^b wuv\,dx=0.
$$

If $\lambda\neq\mu$, divide by $\lambda-\mu$:

$$
\boxed{
\int_a^b u(x)v(x)w(x)\,dx=0
}.
$$

Thus eigenfunctions belonging to distinct parameter values are orthogonal.

</details>

<details open>
<summary><strong>The Four Weights And Intervals</strong></summary>

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

For example, multiply the Hermite equation by $e^{-x^2}$:

$$
e^{-x^2}y''-2xe^{-x^2}y'+2ne^{-x^2}y=0.
$$

The first two terms combine because:

$$
\begin{aligned}
\frac{d}{dx}(e^{-x^2}y')
&=e^{-x^2}y''+(e^{-x^2})'y'\\
&=e^{-x^2}y''-2xe^{-x^2}y'.
\end{aligned}
$$

Therefore the self-adjoint Hermite equation is:

$$
(e^{-x^2}y')'+2ne^{-x^2}y=0.
$$

</details>

<details open>
<summary><strong>Worked Legendre Orthogonality Check</strong></summary>

Verify that $P_1$ and $P_3$ are orthogonal on $[-1,1]$ with weight $1$.
Use:

$$
P_1(x)=x,
\qquad
P_3(x)=\frac12(5x^3-3x).
$$

Form the weighted inner product:

$$
\begin{aligned}
\langle P_1,P_3\rangle
&=\int_{-1}^{1}x\left[\frac12(5x^3-3x)\right]dx\\
&=\frac12\int_{-1}^{1}(5x^4-3x^2)\,dx.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Why The Chebyshev Weight Looks Singular</strong></summary>

Chebyshev orthogonality uses:

$$
\int_{-1}^{1}
\frac{T_m(x)T_n(x)}{\sqrt{1-x^2}}\,dx.
$$

Although the weight becomes unbounded at $x=\pm1$, the singularities are
integrable. Use $x=\cos\theta$:

$$
dx=-\sin\theta\,d\theta,
\qquad
\sqrt{1-x^2}=\sin\theta
$$

for $0<\theta<\pi$. The weight and differential cancel:

$$
\frac{dx}{\sqrt{1-x^2}}=-d\theta.
$$

After reversing the transformed limits:

$$
\int_{-1}^{1}
\frac{T_m(x)T_n(x)}{\sqrt{1-x^2}}\,dx
=\int_0^\pi\cos(m\theta)\cos(n\theta)\,d\theta.
$$

For $m\neq n$, the right side is zero by trigonometric orthogonality. The
unusual Chebyshev weight is precisely what converts the $x$-integral into a
standard cosine inner product.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Self-adjoint form turns two differential equations with different parameter
values into an integral orthogonality relation. Each polynomial family carries
the interval and weight naturally associated with its equation.

</details>

---

## Block 8: Expanding Functions In An Orthogonal Basis

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to use orthogonality to determine expansion coefficients and show
why these polynomials are more than isolated exact solutions.

</details>

<details open>
<summary><strong>The Projection Formula</strong></summary>

Suppose orthogonal functions $\phi_0,\phi_1,\ldots$ are used to represent:

$$
f(x)=\sum_{n=0}^{N}c_n\phi_n(x).
$$

Take the weighted inner product with $\phi_m$:

$$
\langle f,\phi_m\rangle_w
=\sum_{n=0}^{N}c_n
\langle\phi_n,\phi_m\rangle_w.
$$

Orthogonality makes every term with $n\neq m$ vanish:

$$
\langle f,\phi_m\rangle_w
=c_m\langle\phi_m,\phi_m\rangle_w.
$$

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

</details>

<details open>
<summary><strong>Worked Legendre Expansion Of X Cubed</strong></summary>

Represent $f(x)=x^3$ using the odd Legendre polynomials $P_1$ and $P_3$:

$$
x^3=c_1P_1(x)+c_3P_3(x).
$$

First calculate $c_1$. Since $P_1=x$:

$$
\begin{aligned}
\langle x^3,P_1\rangle
&=\int_{-1}^{1}x^3(x)\,dx\\
&=\int_{-1}^{1}x^4\,dx\\
&=\frac25.
\end{aligned}
$$

The squared norm is:

$$
\begin{aligned}
\langle P_1,P_1\rangle
&=\int_{-1}^{1}x^2\,dx\\
&=\frac23.
\end{aligned}
$$

Therefore:

$$
\begin{aligned}
c_1
&=\frac{2/5}{2/3}\\
&=\frac35.
\end{aligned}
$$

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

Hence:

$$
\begin{aligned}
c_3
&=\frac{4/35}{2/7}\\
&=\frac25.
\end{aligned}
$$

The expansion is therefore:

$$
\boxed{
x^3=\frac35P_1(x)+\frac25P_3(x)
}.
$$

</details>

<details open>
<summary><strong>Check The Expansion Algebraically</strong></summary>

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

</details>

<details open>
<summary><strong>Exact Expansion Versus Approximation</strong></summary>

The previous expansion is exact because $x^3$ lies in the span of $P_1$ and
$P_3$. For a non-polynomial function, a finite sum generally gives an
approximation:

$$
f(x)\approx\sum_{n=0}^{N}c_nP_n(x).
$$

The projection coefficients choose the approximation whose weighted squared
error is smallest within the selected polynomial span. Increasing $N$ adds
more orthogonal directions and can capture more detail.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Orthogonality isolates one expansion coefficient at a time. The same
polynomials that solve classical differential equations therefore provide
natural bases for representing and approximating other functions.

</details>

---

## Block 9: A Reliable Classical-Polynomial Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to organise recognition, construction, normalization, and
verification into a dependable sequence.

</details>

<details open>
<summary><strong>The Workflow</strong></summary>

### Step 1: Identify the family

Compare every coefficient with the standard differential equation. Do not
identify a family from one coefficient alone.

### Step 2: Recover the degree parameter

Solve the parameter relation. For example, a Legendre coefficient of $20$
requires $n(n+1)=20$, whereas a Hermite coefficient of $10$ requires
$2n=10$.

### Step 3: Use a separate series index

If $n$ labels the polynomial degree, use $k$ for the power-series index:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

### Step 4: Derive the recurrence locally

Substitute $y$, $y'$, and $y''$, align the powers, and show which coefficient
equation comes from $x^k$.

### Step 5: Locate the terminating factor

Find the exact index at which a numerator such as $k-n$ vanishes.

### Step 6: Select the terminating chain

For a two-step recurrence, retain the parity chain matching $n$ and set the
other starting coefficient to zero. For Laguerre's one-step recurrence, begin
from $a_0$.

### Step 7: Apply the stated normalization

Use $P_n(1)=1$, $T_n(1)=1$, the leading coefficient $2^n$ for $H_n$, or
$L_n(0)=1$.

### Step 8: Verify the result

Check the degree, normalization, and differential equation. If orthogonality
is claimed, include the correct interval and weight.

### Step 9: Choose an efficient secondary tool

Use a neighbour recurrence for later members, a Rodrigues formula for one
explicit member, or a generating function when several low-order members are
needed together.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Common Mistake: Confusing N And K</strong></summary>

In:

$$
(1-x^2)y''-2xy'+n(n+1)y=0,
$$

$n$ is fixed while one chosen Legendre equation is being solved. In:

$$
y=\sum_{k=0}^{\infty}a_kx^k,
$$

$k$ runs through all coefficient indices. Reusing $n$ for both jobs can make
the termination step impossible to read.

</details>

<details open>
<summary><strong>Common Mistake: Stopping At One Zero Coefficient</strong></summary>

Showing $a_{n+2}=0$ is not enough by itself. Use the recurrence once more:

$$
a_{n+4}=R(n+2)a_{n+2}=0,
$$

and similarly for every later coefficient in that chain. The recurrence, not
wishful truncation, proves that the series has terminated.

</details>

<details open>
<summary><strong>Common Mistake: Mixing Normalizations</strong></summary>

The equation is homogeneous, so a nonzero multiple still solves it. However,
the name $L_2$ in this chapter means the normalization $L_2(0)=1$:

$$
L_2(x)=1-2x+\frac12x^2.
$$

The polynomial $2-4x+x^2$ is also a solution, but it is $2L_2$, not the
normalized $L_2$ itself.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Common Mistake: Omitting The Weight</strong></summary>

Chebyshev orthogonality does not mean:

$$
\int_{-1}^{1}T_m(x)T_n(x)\,dx=0
$$

for every $m\neq n$. The correct inner product contains:

$$
w(x)=\frac1{\sqrt{1-x^2}}.
$$

Orthogonality is always a statement about a family, an interval, and a weight
together.

</details>

<details open>
<summary><strong>Common Mistake: Reading A Generating Coefficient Too Quickly</strong></summary>

First inspect the right side of the generating identity. In:

$$
e^{2xt-t^2}=\sum_{n=0}^{\infty}H_n(x)\frac{t^n}{n!},
$$

the coefficient of $t^n$ must be multiplied by $n!$ to recover $H_n$.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

Recognise the full equation, separate the degree label from the series index,
prove termination through the recurrence, normalize explicitly, and attach the
correct weight and interval to every orthogonality claim.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Recognition And Basic Construction</strong></summary>

### Problem 1: Identify Four Families

Identify the polynomial family and degree $n$ associated with each equation.

$$
\begin{aligned}
\text{(a)}\quad &(1-x^2)y''-xy'+49y=0,\\
\text{(b)}\quad &y''-2xy'+12y=0,\\
\text{(c)}\quad &xy''+(1-x)y'+4y=0,\\
\text{(d)}\quad &(1-x^2)y''-2xy'+30y=0.
\end{aligned}
$$

### Problem 2: Rebuild The Chebyshev Recurrence

Starting from:

$$
(1-x^2)y''-xy'+n^2y=0,
$$

derive the recurrence relating $a_{k+2}$ to $a_k$.

### Problem 3: Construct P Two

Use the Legendre coefficient recurrence and the normalization $P_2(1)=1$ to
construct $P_2(x)$.

### Problem 4: Generate T Three

Use:

$$
T_{n+1}=2xT_n-T_{n-1},
$$

together with $T_1=x$ and $T_2=2x^2-1$, to find $T_3$.

</details>

<details open>
<summary><strong>Problems 5 To 8: Series, Rodrigues, And Verification</strong></summary>

### Problem 5: Construct H Three By Series

Use the Hermite recurrence and the physicists' leading-coefficient
normalization to construct $H_3(x)$.

### Problem 6: Construct L Two By Series

Use the Laguerre recurrence and $L_2(0)=1$ to construct $L_2(x)$.

### Problem 7: Use Rodrigues For P Three

Starting from:

$$
P_n(x)=\frac1{2^nn!}\frac{d^n}{dx^n}(x^2-1)^n,
$$

calculate $P_3(x)$.

### Problem 8: Verify A Laguerre Polynomial

Verify directly that:

$$
L_2(x)=1-2x+\frac12x^2
$$

solves the $n=2$ Laguerre equation.

</details>

<details open>
<summary><strong>Problems 9 To 12: Orthogonality, Projection, And Scale</strong></summary>

### Problem 9: Check Legendre Orthogonality

Verify directly that $P_0(x)=1$ and $P_2(x)=(3x^2-1)/2$ are orthogonal on
$[-1,1]$ with weight $1$.

### Problem 10: Transform A Chebyshev Inner Product

Use $x=\cos\theta$ to show that the weighted inner product of $T_1$ and $T_2$
on $[-1,1]$ becomes:

$$
\int_0^\pi\cos\theta\cos(2\theta)\,d\theta,
$$

and evaluate it.

### Problem 11: Expand X Squared In Legendre Polynomials

Use weighted projections to find $c_0$ and $c_2$ in:

$$
x^2=c_0P_0(x)+c_2P_2(x).
$$

### Problem 12: Separate A Solution From Its Normalization

Let:

$$
q(x)=x^2-4x+2.
$$

Show that $q$ solves the $n=2$ Laguerre equation. Then determine its relation
to the normalized polynomial $L_2$.

</details>

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

#### Equation (a)

Compare:

$$
(1-x^2)y''-xy'+49y=0
$$

with the Chebyshev equation:

$$
(1-x^2)y''-xy'+n^2y=0.
$$

Thus:

$$
n^2=49.
$$

Since the family uses $n\geq0$:

$$
\boxed{n=7\text{, so the polynomial is }T_7.}
$$

<!-- print-page-break -->

#### Equation (b)

Compare:

$$
y''-2xy'+12y=0
$$

with the Hermite equation:

$$
y''-2xy'+2ny=0.
$$

Therefore:

$$
2n=12,
$$

so:

$$
\boxed{n=6\text{, giving }H_6.}
$$

#### Equation (c)

The equation:

$$
xy''+(1-x)y'+4y=0
$$

has Laguerre form with $n=4$. Hence:

$$
\boxed{L_4.}
$$

<!-- print-page-break -->

#### Equation (d)

Compare:

$$
(1-x^2)y''-2xy'+30y=0
$$

with the Legendre equation. The parameter satisfies:

$$
n(n+1)=30.
$$

Move all terms to one side:

$$
n^2+n-30=0.
$$

Factor:

$$
(n-5)(n+6)=0.
$$

The nonnegative choice is $n=5$, so:

$$
\boxed{P_5.}
$$

<!-- print-page-break -->

### Answer 2

Use:

$$
y=\sum_{k=0}^{\infty}a_kx^k.
$$

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

Substitute into the expanded equation:

$$
y''-x^2y''-xy'+n^2y=0.
$$

The coefficient of $x^k$ gives:

$$
(k+2)(k+1)a_{k+2}
+[n^2-k(k-1)-k]a_k=0.
$$

Since $k(k-1)+k=k^2$:

$$
(k+2)(k+1)a_{k+2}+(n^2-k^2)a_k=0.
$$

Move the term containing $a_k$ to the right side:

$$
\begin{aligned}
(k+2)(k+1)a_{k+2}
&=-(n^2-k^2)a_k\\
&=(k^2-n^2)a_k.
\end{aligned}
$$

Now divide both sides by $(k+2)(k+1)$:

$$
\boxed{
a_{k+2}
=\frac{k^2-n^2}{(k+2)(k+1)}a_k
}.
$$

### Answer 3

For $n=2$, the Legendre recurrence is:

$$
a_{k+2}
=\frac{(k-2)(k+3)}{(k+2)(k+1)}a_k.
$$

Use the even chain. At $k=0$:

$$
\begin{aligned}
a_2
&=\frac{(0-2)(0+3)}{(2)(1)}a_0\\
&=-3a_0.
\end{aligned}
$$

Using $a_2=-3a_0$, continue with $k=2$:

$$
a_4=0.
$$

Thus:

$$
y=a_0(1-3x^2).
$$

Apply $P_2(1)=1$:

$$
1=a_0(1-3)=-2a_0.
$$

Therefore $a_0=-1/2$, and:

$$
\boxed{
P_2(x)=\frac12(3x^2-1)
}.
$$

### Answer 4

Set $n=2$ in the neighbour recurrence:

$$
T_3=2xT_2-T_1.
$$

Substitute $T_2=2x^2-1$ and $T_1=x$:

$$
\begin{aligned}
T_3
&=2x(2x^2-1)-x\\
&=4x^3-2x-x\\
&=4x^3-3x.
\end{aligned}
$$

Hence:

$$
\boxed{T_3(x)=4x^3-3x}.
$$

</details>
<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

For $n=3$, the Hermite recurrence becomes:

$$
a_{k+2}=\frac{2(k-3)}{(k+2)(k+1)}a_k.
$$

Use the odd chain and set $a_0=0$. At $k=1$:

$$
\begin{aligned}
a_3
&=\frac{2(1-3)}{(3)(2)}a_1\\
&=-\frac23a_1.
\end{aligned}
$$

At $k=3$, the terminating factor appears:

$$
a_5=0.
$$

The polynomial therefore has the form:

$$
y=a_1x-\frac23a_1x^3.
$$

The physicists' normalization requires the leading coefficient to be
$2^3=8$. Hence:

$$
-\frac23a_1=8.
$$

Multiply by $-3/2$:

$$
a_1=-12.
$$

Substitute this value:

$$
\boxed{H_3(x)=8x^3-12x}.
$$

### Answer 6

For $n=2$, the Laguerre recurrence is:

$$
a_{k+1}=\frac{k-2}{(k+1)^2}a_k.
$$

The normalization $L_2(0)=1$ gives $a_0=1$. At $k=0$:

$$
a_1=\frac{-2}{1}a_0=-2.
$$

At $k=1$:

$$
\begin{aligned}
a_2
&=\frac{1-2}{(2)^2}a_1\\
&=-\frac14(-2)\\
&=\frac12.
\end{aligned}
$$

At $k=2$:

$$
a_3=0.
$$

Thus:

$$
\boxed{L_2(x)=1-2x+\frac12x^2}.
$$

<!-- print-page-break -->

### Answer 7

For $n=3$, Rodrigues' formula gives:

$$
P_3(x)=\frac1{2^3(3!)}
\frac{d^3}{dx^3}(x^2-1)^3.
$$

First expand the cube:

$$
(x^2-1)^3=x^6-3x^4+3x^2-1.
$$

Differentiate once:

$$
6x^5-12x^3+6x.
$$

Differentiate a second time:

$$
30x^4-36x^2+6.
$$

Differentiate a third time:

$$
120x^3-72x.
$$

The denominator is:

$$
2^3(3!)=8\cdot6=48.
$$

Therefore:

$$
\begin{aligned}
P_3(x)
&=\frac{120x^3-72x}{48}\\
&=\frac12(5x^3-3x).
\end{aligned}
$$

<!-- print-page-break -->

### Answer 8

For $n=2$, the Laguerre equation is:

$$
xy''+(1-x)y'+2y=0.
$$

Let:

$$
y=1-2x+\frac12x^2.
$$

Its derivatives are:

$$
y'=-2+x,
\qquad
y''=1.
$$

Evaluate each equation term:

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

and:

$$
2y=2-4x+x^2.
$$

Add them:

$$
\begin{aligned}
xy''+(1-x)y'+2y
&=x+(-x^2+3x-2)+(2-4x+x^2)\\
&=0.
\end{aligned}
$$

Thus the proposed $L_2$ satisfies the equation.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Use:

$$
P_0(x)=1,
\qquad
P_2(x)=\frac12(3x^2-1).
$$

Their inner product with weight $1$ is:

$$
\begin{aligned}
\langle P_0,P_2\rangle
&=\int_{-1}^{1}1\cdot\frac12(3x^2-1)\,dx\\
&=\frac12\left(3\int_{-1}^{1}x^2\,dx
-\int_{-1}^{1}1\,dx\right).
\end{aligned}
$$

Evaluate the two integrals:

$$
\int_{-1}^{1}x^2\,dx=\frac23,
\qquad
\int_{-1}^{1}1\,dx=2.
$$

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

<!-- print-page-break -->

### Answer 10

The Chebyshev inner product is:

$$
\int_{-1}^{1}
\frac{T_1(x)T_2(x)}{\sqrt{1-x^2}}\,dx.
$$

Set $x=\cos\theta$. Then:

$$
dx=-\sin\theta\,d\theta,
\qquad
\sqrt{1-x^2}=\sin\theta.
$$

Also:

$$
T_1(\cos\theta)=\cos\theta,
\qquad
T_2(\cos\theta)=\cos(2\theta).
$$

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

Use the product-to-sum identity:

$$
\cos\theta\cos(2\theta)
=\frac12[\cos\theta+\cos(3\theta)].
$$

Hence:

$$
\begin{aligned}
\int_0^\pi\cos\theta\cos(2\theta)\,d\theta
&=\frac12\int_0^\pi[\cos\theta+\cos(3\theta)]\,d\theta\\
&=\frac12\left[\sin\theta+\frac13\sin(3\theta)\right]_0^\pi\\
&=0.
\end{aligned}
$$

<!-- print-page-break -->

### Answer 11

Seek:

$$
x^2=c_0P_0+c_2P_2.
$$

For $c_0$, use the projection formula:

$$
c_0=\frac{\langle x^2,P_0\rangle}
{\langle P_0,P_0\rangle}.
$$

Calculate the numerator and denominator:

$$
\langle x^2,P_0\rangle
=\int_{-1}^{1}x^2\,dx=\frac23,
$$

$$
\langle P_0,P_0\rangle
=\int_{-1}^{1}1\,dx=2.
$$

Therefore:

$$
c_0=\frac{2/3}{2}=\frac13.
$$

For $c_2$:

$$
c_2=\frac{\langle x^2,P_2\rangle}
{\langle P_2,P_2\rangle}.
$$

The numerator is:

$$
\begin{aligned}
\langle x^2,P_2\rangle
&=\frac12\int_{-1}^{1}(3x^4-x^2)\,dx\\
&=\frac12\left(3\cdot\frac25-\frac23\right)\\
&=\frac4{15}.
\end{aligned}
$$

The denominator is:

$$
\begin{aligned}
\langle P_2,P_2\rangle
&=\frac14\int_{-1}^{1}(9x^4-6x^2+1)\,dx\\
&=\frac14\left(9\cdot\frac25-6\cdot\frac23+2\right)\\
&=\frac25.
\end{aligned}
$$

Thus:

$$
c_2=\frac{4/15}{2/5}=\frac23.
$$

The expansion is:

$$
\boxed{
x^2=\frac13P_0(x)+\frac23P_2(x)
}.
$$

<!-- print-page-break -->

### Answer 12

For $n=2$, the Laguerre equation is:

$$
xy''+(1-x)y'+2y=0.
$$

Let:

$$
q=x^2-4x+2.
$$

Differentiate:

$$
q'=2x-4,
\qquad
q''=2.
$$

Substitute:

$$
\begin{aligned}
xq''+(1-x)q'+2q
&=2x+(1-x)(2x-4)+2(x^2-4x+2).
\end{aligned}
$$

Expand the product:

$$
\begin{aligned}
(1-x)(2x-4)
&=2x-4-2x^2+4x\\
&=-2x^2+6x-4.
\end{aligned}
$$

Now combine all terms:

$$
\begin{aligned}
xq''+(1-x)q'+2q
&=2x+(-2x^2+6x-4)+(2x^2-8x+4)\\
&=0.
\end{aligned}
$$

Thus $q$ is a solution. Compare it with:

$$
L_2(x)=1-2x+\frac12x^2.
$$

Multiplying $L_2$ by $2$ gives:

$$
2L_2(x)=2-4x+x^2=q(x).
$$

Therefore:

$$
\boxed{q=2L_2}.
$$

It solves the equation but is not the normalized $L_2$, because $q(0)=2$
rather than $1$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 29 Final Summary</strong></summary>

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

Self-adjoint form supplies the appropriate weighted orthogonality. That
orthogonality then turns each family into a basis for exact expansions and
approximations.

> a classical polynomial is simultaneously a terminated series solution, a
> normalized member of a recurrence family, and an orthogonal basis function.

</details>
