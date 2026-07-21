```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 27}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Power Series Methods}
```
# Chapter 27 - Power Series Methods

Constant-coefficient equations often reduce to algebra through a
characteristic polynomial, a Laplace transform, or a matrix exponential. When
coefficients depend on the independent variable, those routes may no longer
produce a usable closed form.

Power series offer a different strategy. Instead of guessing the complete
function, we build it coefficient by coefficient near a chosen centre.

This chapter will:

-   review the series notation needed for derivatives and index shifts
-   distinguish ordinary points from singular points
-   derive recurrence formulas for homogeneous and forced equations
-   separate the two arbitrary solution branches of a second-order equation
-   construct series around points other than the origin
-   apply initial conditions directly to series coefficients
-   use repeated differentiation when only a few Taylor terms are needed

```{=latex}
\Needspace{20\baselineskip}
```
## Turning An Unknown Function Into Unknown Coefficients {#block-1-turning-an-unknown-function-into-unknown-coefficients}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to understand what a power-series solution assumes and how
differentiation changes its coefficients.

```{=latex}
\Needspace{8\baselineskip}
```
> a power-series method replaces one unknown function by an ordered list of
> unknown numbers.

```{=latex}
\Needspace{12\baselineskip}
```
### The Series Assumption {#the-series-assumption-2}

```{=latex}
\Needspace{10\baselineskip}
```
To seek a solution near $x=0$, assume:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_nx^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Written term by term, this is:

$$
y(x)=a_0+a_1x+a_2x^2+a_3x^3+\cdots.
$$

Here:

-   $n$ is a nonnegative integer index
-   $a_n$ is the coefficient of $x^n$
-   the numbers $a_0,a_1,a_2,\ldots$ are initially unknown
-   the series is centred at $x=0$

The method succeeds when the differential equation forces these coefficients
to satisfy a pattern called a recurrence relation.

```{=latex}
\Needspace{12\baselineskip}
```
### Differentiate Without Skipping The First Terms {#differentiate-without-skipping-the-first-terms-3}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the expanded series:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+a_4x^4+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate term by term:

$$
y'=a_1+2a_2x+3a_3x^2+4a_4x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
y''=2a_2+6a_3x+12a_4x^2+20a_5x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In summation notation:

$$
y'=\sum_{n=1}^{\infty}na_nx^{n-1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}.
$$

These forms are correct, but their powers do not yet begin with $x^0$. That
makes them awkward to compare with the original series.

```{=latex}
\Needspace{12\baselineskip}
```
### Reindex The Derivatives To Powers Of X To The N {#reindex-the-derivatives-to-powers-of-x-to-the-n-4}

```{=latex}
\Needspace{10\baselineskip}
```
For $y'$, replace the old index by $n+1$. Then:

$$
\begin{aligned}
y'
&=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the first terms:

$$
\begin{aligned}
n=0&:\quad a_1,\\
n=1&:\quad 2a_2x,\\
n=2&:\quad 3a_3x^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y''$, replace the old index by $n+2$:

$$
\boxed{
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Again, check the first terms:

$$
\begin{aligned}
n=0&:\quad 2a_2,\\
n=1&:\quad 6a_3x,\\
n=2&:\quad 12a_4x^2.
\end{aligned}
$$

The reindexed formulas reproduce the expanded derivatives exactly.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Matching Coefficients Is Valid {#why-matching-coefficients-is-valid-5}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose substitution produces:

$$
c_0+c_1x+c_2x^2+c_3x^3+\cdots=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
throughout an interval around the centre. Then every coefficient must vanish:

$$
c_0=0,
\qquad
c_1=0,
\qquad
c_2=0,
\qquad\ldots
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently, if:

$$
\sum_{n=0}^{\infty}c_nx^n=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
\boxed{c_n=0\quad\text{for every }n\geq0}.
$$

This is what converts a differential equation into algebraic equations for
the coefficients $a_n$.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### Initial Values Are The First Two Coefficients {#initial-values-are-the-first-two-coefficients-6}

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
y(x)=a_0+a_1x+a_2x^2+\cdots,
$$

```{=latex}
\Needspace{10\baselineskip}
```
set $x=0$:

$$
y(0)=a_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From:

$$
y'(x)=a_1+2a_2x+3a_3x^2+\cdots,
$$

```{=latex}
\Needspace{10\baselineskip}
```
set $x=0$:

$$
y'(0)=a_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
a_0=y(0),
\qquad
a_1=y'(0)
}.
$$

For a second-order equation, these are the two free starting coefficients.
The recurrence determines the remaining coefficients from them.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

```{=latex}
\Needspace{10\baselineskip}
```
Near the origin, use:

$$
\begin{aligned}
y&=\sum_{n=0}^{\infty}a_nx^n,\\
y'&=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n,\\
y''&=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n.
\end{aligned}
$$

After every term is expressed with the same power, equality of power series
allows coefficients to be matched.

```{=latex}
\Needspace{20\baselineskip}
```
## Ordinary Points And Where The Method Applies {#block-2-ordinary-points-and-where-the-method-applies}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to decide whether an ordinary power series is justified at the
chosen centre before doing recurrence algebra.

```{=latex}
\Needspace{12\baselineskip}
```
### Analytic Functions {#analytic-functions-9}

```{=latex}
\Needspace{10\baselineskip}
```
A function $f$ is analytic at $x_0$ if its Taylor series about $x_0$ converges
to the function throughout some interval around $x_0$:

$$
f(x)
=\sum_{n=0}^{\infty}
\frac{f^{(n)}(x_0)}{n!}(x-x_0)^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $f^{(n)}$ is the $n$th derivative of $f$, and:

$$
n!=n(n-1)(n-2)\cdots2\cdot1,
\qquad
0!=1.
$$

Polynomials, exponentials, sine, and cosine are analytic at every real point.
A rational function is analytic wherever its denominator is nonzero.

Being differentiable many times is related to analyticity but is not the
definition. Analyticity requires the Taylor series to converge back to the
function.

```{=latex}
\Needspace{12\baselineskip}
```
### Normalize The Differential Equation First {#normalize-the-differential-equation-first-10}

```{=latex}
\Needspace{10\baselineskip}
```
Consider a second-order linear equation:

$$
b_2(x)y''+b_1(x)y'+b_0(x)y=g(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At points where $b_2(x)\neq0$, divide every term by $b_2(x)$:

$$
y''+P(x)y'+Q(x)y=R(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
P(x)=\frac{b_1(x)}{b_2(x)},
\qquad
Q(x)=\frac{b_0(x)}{b_2(x)},
\qquad
R(x)=\frac{g(x)}{b_2(x)}.
$$

The normalized coefficients $P$ and $Q$, rather than the unnormalized
appearance of the equation, determine the point type.

```{=latex}
\Needspace{12\baselineskip}
```
### Ordinary And Singular Points {#ordinary-and-singular-points-11}

```{=latex}
\Needspace{10\baselineskip}
```
For the normalized homogeneous equation:

$$
y''+P(x)y'+Q(x)y=0,
$$

a point $x_0$ is an **ordinary point** when both $P$ and $Q$ are analytic at
$x_0$.

If either $P$ or $Q$ is not analytic at $x_0$, then $x_0$ is a **singular
point**.

For a forced equation, $R(x)$ should also be analytic at the centre if it is
to be represented by an ordinary Taylor series there.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> normalize first, inspect the coefficient functions at the intended centre,
> and only then assume an ordinary power series.

```{=latex}
\Needspace{12\baselineskip}
```
### What An Ordinary Point Gives Us {#what-an-ordinary-point-gives-us-12}

```{=latex}
\Needspace{10\baselineskip}
```
If $P$ and $Q$ are analytic near $x_0$, then each pair of starting values:

$$
y(x_0)=a_0,
\qquad
y'(x_0)=a_1
$$

determines a unique local solution that is itself analytic near $x_0$. For a
forced equation, require $R$ to be analytic there as well.

This matters because coefficient matching initially produces a formal list of
numbers. The ordinary-point result tells us that the resulting power series
converges to the actual local solution on some nonzero interval around the
centre.[^2]

```{=latex}
\Needspace{12\baselineskip}
```
### An Ordinary-Point Check {#an-ordinary-point-check-13}

```{=latex}
\Needspace{10\baselineskip}
```
Classify $x=0$ for:

$$
(1+x^2)y''+e^xy'+(x-1)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The leading coefficient at the centre is:

$$
1+0^2=1\neq0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so normalization is allowed near $0$. Divide by $1+x^2$:

$$
y''+\frac{e^x}{1+x^2}y'
+\frac{x-1}{1+x^2}y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
P(x)=\frac{e^x}{1+x^2},
\qquad
Q(x)=\frac{x-1}{1+x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$, the common denominator is $1$, not zero. Both ratios are analytic
near $0$. Therefore:

$$
\boxed{x=0\text{ is an ordinary point}.}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Singular-Point Check {#a-singular-point-check-14}

```{=latex}
\Needspace{10\baselineskip}
```
Classify $x=3$ for:

$$
(x-3)y''+(x+1)y'+2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x\neq3$, divide by $x-3$:

$$
y''+\frac{x+1}{x-3}y'
+\frac{2}{x-3}y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The normalized coefficients are:

$$
P(x)=\frac{x+1}{x-3},
\qquad
Q(x)=\frac{2}{x-3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both denominators vanish at $x=3$. Therefore neither coefficient is analytic
there, and:

$$
\boxed{x=3\text{ is a singular point}.}
$$

An ordinary Taylor-series assumption about $x=3$ is not justified. A later
method will treat an important class of singular points.

```{=latex}
\Needspace{12\baselineskip}
```
### Do Not Confuse A Zero Coefficient With A Singular Point {#do-not-confuse-a-zero-coefficient-with-a-singular-point-15}

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
y''+xy'+x^2y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the coefficients of $y'$ and $y$ happen to vanish at $x=0$. That causes no
problem. The equation is already normalized, with:

$$
P(x)=x,
\qquad
Q(x)=x^2.
$$

Both are polynomials, so $x=0$ is ordinary.

The dangerous zero is in the coefficient of the highest derivative before
normalization, because dividing by that coefficient may create a pole.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-16}

Normalize a second-order linear equation and inspect $P(x)$ and $Q(x)$. An
ordinary point supports the ordinary power-series method; a singular point
requires separate analysis.

```{=latex}
\Needspace{20\baselineskip}
```
## Index Shifts And Coefficient Alignment {#block-3-index-shifts-and-coefficient-alignment}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-17}

The goal is to make index shifting mechanical and checkable before using it in
a complete differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiplication By X Shifts Powers Up {#multiplication-by-x-shifts-powers-up-18}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y=\sum_{n=0}^{\infty}a_nx^n
=a_0+a_1x+a_2x^2+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $x$:

$$
xy=a_0x+a_1x^2+a_2x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The result has no constant term. To write its coefficient of $x^n$, observe:

$$
x^n\text{ receives }a_{n-1}\quad\text{for }n\geq1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
xy=\sum_{n=1}^{\infty}a_{n-1}x^n
}.
$$

The lower limit is $1$, not $0$, because $a_{-1}$ has not been defined.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiplication By X Applied To A Derivative {#multiplication-by-x-applied-to-a-derivative-19}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y'=a_1+2a_2x+3a_3x^2+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $x$:

$$
xy'=a_1x+2a_2x^2+3a_3x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the coefficient of $x^n$, the pattern is $na_n$. Hence:

$$
\boxed{
xy'=\sum_{n=1}^{\infty}na_nx^n
}.
$$

There is again no constant term.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiplying Two Full Power Series {#multiplying-two-full-power-series-20}

```{=latex}
\Needspace{10\baselineskip}
```
An analytic coefficient may have its own series:

$$
P(x)=p_0+p_1x+p_2x^2+\cdots
=\sum_{n=0}^{\infty}p_nx^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply it by:

$$
y(x)=a_0+a_1x+a_2x^2+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the first three powers explicitly:

$$
\begin{aligned}
P(x)y(x)
={}&p_0a_0\\
&+(p_0a_1+p_1a_0)x\\
&+(p_0a_2+p_1a_1+p_2a_0)x^2+\cdots.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the coefficient of $x^n$, pair every $p_kx^k$ with the term
$a_{n-k}x^{n-k}$. Their powers add to $n$. Therefore:

$$
\boxed{
P(x)y(x)
=\sum_{n=0}^{\infty}
\left(\sum_{k=0}^{n}p_ka_{n-k}\right)x^n
}.
$$

The inner finite sum is the coefficient convolution. When $P(x)=x$, only
$p_1=1$ is nonzero, and the formula reduces to the earlier shift
$a_{n-1}$ for $n\geq1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Separate Low Powers When Lower Limits Differ {#separate-low-powers-when-lower-limits-differ-21}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose an equation produces:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first sum contains an $x^0$ term, but the second does not. Extract the
constant term from the first sum:

$$
2a_2
+\sum_{n=1}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now combine the sums that share the lower limit $n=1$:

$$
2a_2
+\sum_{n=1}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_{n-1}\right]x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the constant term separately:

$$
2a_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For every $n\geq1$, match the coefficient of $x^n$:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0.
$$

This separation prevents an undefined $a_{-1}$ from entering the recurrence.

```{=latex}
\Needspace{12\baselineskip}
```
### A Quick Index Check {#a-quick-index-check-22}

For any reindexed sum, test the first two terms.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
\sum_{n=1}^{\infty}a_{n-1}x^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
starts with:

$$
n=1:\ a_0x,
\qquad
n=2:\ a_1x^2.
$$

These are exactly the first two terms of $xy$. If the expanded terms do not
match, the index shift is wrong.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-23}

Do not combine sums until their powers and lower limits agree. Expand a few
terms, reindex, test the first terms, and separate exceptional low powers
before deriving a recurrence.

```{=latex}
\Needspace{20\baselineskip}
```
## A Complete Homogeneous Series Solution {#block-4-a-complete-homogeneous-series-solution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-24}

The goal is to derive and use a recurrence formula for a variable-coefficient
homogeneous equation without skipping coefficient substitutions.

```{=latex}
\Needspace{12\baselineskip}
```
### The Problem And Point Check {#the-problem-and-point-check-25}

```{=latex}
\Needspace{10\baselineskip}
```
Find a power-series solution near $x=0$ for:

$$
y''+xy'+2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation is already normalized:

$$
P(x)=x,
\qquad
Q(x)=2.
$$

Both are analytic at $0$, so $x=0$ is an ordinary point.

```{=latex}
\Needspace{12\baselineskip}
```
### Substitute All Three Series {#substitute-all-three-series-26}

```{=latex}
\Needspace{10\baselineskip}
```
Use the three required series:

$$
\begin{aligned}
y&=\sum_{n=0}^{\infty}a_nx^n,\\
y''&=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n,\\
xy'&=\sum_{n=1}^{\infty}na_nx^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y''+xy'+2y=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}na_nx^n
+2\sum_{n=0}^{\infty}a_nx^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Although the $xy'$ sum begins at $n=1$, its missing $n=0$ term would be
$0a_0x^0=0$. We may therefore include that zero term and write:

$$
\sum_{n=0}^{\infty}
\left[
(n+2)(n+1)a_{n+2}+na_n+2a_n
\right]x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the two coefficients multiplying $a_n$:

$$
\sum_{n=0}^{\infty}
\left[
(n+2)(n+1)a_{n+2}+(n+2)a_n
\right]x^n=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Recurrence {#derive-the-recurrence-27}

```{=latex}
\Needspace{10\baselineskip}
```
Every coefficient of $x^n$ must equal zero:

$$
(n+2)(n+1)a_{n+2}+(n+2)a_n=0,
\qquad n\geq0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the $a_n$ term to the right:

$$
(n+2)(n+1)a_{n+2}=-(n+2)a_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $(n+2)(n+1)$:

$$
a_{n+2}
=-\frac{n+2}{(n+2)(n+1)}a_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel the nonzero factor $n+2$:

$$
\boxed{
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0
}.
$$

The domain $n\geq0$ is part of the recurrence formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Even Coefficients {#build-the-even-coefficients-28}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=0$ in the recurrence:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{0+1}\\
&=-a_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_2}{2+1}\\
&=-\frac{-a_0}{3}\\
&=\frac{a_0}{3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Continue the even chain by using
$a_{n+2}=-a_n/(n+1)$ with $n=4$:

$$
\begin{aligned}
a_6
&=-\frac{a_4}{4+1}\\
&=-\frac{a_0/3}{5}\\
&=-\frac{a_0}{15}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the even branch begins:

$$
a_0\left(1-x^2+\frac{x^4}{3}-\frac{x^6}{15}+\cdots\right).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Odd Coefficients {#build-the-odd-coefficients-29}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=1$:

$$
\begin{aligned}
a_3
&=-\frac{a_1}{1+1}\\
&=-\frac{a_1}{2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_3}{3+1}\\
&=-\frac{-a_1/2}{4}\\
&=\frac{a_1}{8}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=5$:

$$
\begin{aligned}
a_7
&=-\frac{a_5}{5+1}\\
&=-\frac{a_1/8}{6}\\
&=-\frac{a_1}{48}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the odd branch begins:

$$
a_1\left(x-\frac{x^3}{2}+\frac{x^5}{8}-\frac{x^7}{48}+\cdots\right).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Assemble The General Solution {#assemble-the-general-solution-30}

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the calculated even and odd coefficients:

$$
\boxed{
\begin{aligned}
y(x)
={}&a_0\left(1-x^2+\frac{x^4}{3}-\frac{x^6}{15}+\cdots\right)\\
&+a_1\left(x-\frac{x^3}{2}+\frac{x^5}{8}-\frac{x^7}{48}+\cdots\right).
\end{aligned}
}
$$

The constants $a_0$ and $a_1$ remain arbitrary. They are precisely $y(0)$
and $y'(0)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Two Series Appear {#why-two-series-appear-31}

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence advances by two indices:

$$
a_n\longrightarrow a_{n+2}.
$$

Therefore even coefficients depend only on $a_0$, while odd coefficients
depend only on $a_1$. The two chains never mix.

This is how a second-order equation preserves two independent arbitrary
constants inside the series method.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-32}

```{=latex}
\Needspace{10\baselineskip}
```
For $y''+xy'+2y=0$, coefficient matching gives:

$$
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0.
$$

Applying the recurrence separately to even and odd indices produces two
solution branches controlled by $a_0$ and $a_1$.

```{=latex}
\Needspace{20\baselineskip}
```
## Nonhomogeneous Equations And Exceptional Powers {#block-5-nonhomogeneous-equations-and-exceptional-powers}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-33}

The goal is to match a series on the left to a nonzero series on the right and
handle low powers that do not follow the later recurrence.

```{=latex}
\Needspace{12\baselineskip}
```
### The Forced Problem {#the-forced-problem-34}

```{=latex}
\Needspace{10\baselineskip}
```
Find the first several terms of the general power-series solution near $x=0$
for:

$$
y''+xy=1+x.
$$

The equation is normalized, with $P(x)=0$ and $Q(x)=x$. Both are analytic at
$0$. The forcing $1+x$ is also analytic there.

```{=latex}
\Needspace{12\baselineskip}
```
### Substitute And Align The Powers {#substitute-and-align-the-powers-35}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $xy$:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both series:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n
=1+x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Extract the constant term from the first sum:

$$
2a_2
+\sum_{n=1}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_{n-1}\right]x^n
=1+x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side has coefficients:

$$
1+x=1\cdot x^0+1\cdot x^1+0\cdot x^2+0\cdot x^3+\cdots.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Match The Constant And Linear Terms First {#match-the-constant-and-linear-terms-first-36}

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^0$:

$$
2a_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
\boxed{a_2=\frac12}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^1$. Set $n=1$ in the combined sum:

$$
(1+2)(1+1)a_{1+2}+a_{1-1}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the indices and factors:

$$
6a_3+a_0=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $a_0$ and divide by $6$:

$$
\boxed{a_3=\frac{1-a_0}{6}}.
$$

These equations are special because the forcing has nonzero constant and
linear coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Later Recurrence {#derive-the-later-recurrence-37}

```{=latex}
\Needspace{10\baselineskip}
```
For every $n\geq2$, the coefficient of $x^n$ on the right is zero. Therefore:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0,
\qquad n\geq2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $a_{n-1}$ to the right:

$$
(n+2)(n+1)a_{n+2}=-a_{n-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $(n+2)(n+1)$:

$$
\boxed{
a_{n+2}
=-\frac{a_{n-1}}{(n+2)(n+1)},
\qquad n\geq2
}.
$$

This recurrence is not valid for $n=0$ or $n=1$. Those two powers were
matched separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Calculate The Next Coefficients {#calculate-the-next-coefficients-38}

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_1}{(4)(3)}\\
&=-\frac{a_1}{12}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_2}{(5)(4)}\\
&=-\frac{1/2}{20}\\
&=-\frac1{40}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=4$:

$$
\begin{aligned}
a_6
&=-\frac{a_3}{(6)(5)}\\
&=-\frac{(1-a_0)/6}{30}\\
&=-\frac{1-a_0}{180}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Assemble And Interpret The Series {#assemble-and-interpret-the-series-39}

```{=latex}
\Needspace{10\baselineskip}
```
Insert the calculated coefficients into:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+a_4x^4+a_5x^5+a_6x^6+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\begin{aligned}
y(x)
={}&a_0+a_1x+\frac12x^2
+\frac{1-a_0}{6}x^3
-\frac{a_1}{12}x^4\\
&-\frac1{40}x^5
-\frac{1-a_0}{180}x^6+\cdots.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Group the terms multiplying $a_0$, the terms multiplying $a_1$, and the terms
independent of both:

$$
\boxed{
\begin{aligned}
y(x)
={}&a_0\left(1-\frac{x^3}{6}+\frac{x^6}{180}+\cdots\right)\\
&+a_1\left(x-\frac{x^4}{12}+\cdots\right)\\
&+\left(\frac{x^2}{2}+\frac{x^3}{6}-\frac{x^5}{40}
-\frac{x^6}{180}+\cdots\right).
\end{aligned}
}
$$

The first two lines form the general homogeneous response. The third line is
one particular response to $1+x$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-40}

For a nonhomogeneous equation, expand the right side as a series and match its
coefficients. If its first few coefficients differ from the later pattern,
solve those powers separately and state where the general recurrence begins.

```{=latex}
\Needspace{20\baselineskip}
```
## Series About A Nonzero Centre {#block-6-series-about-a-nonzero-centre}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-41}

The goal is to centre a series at $x=x_0$ and translate the algebra to the
origin without changing the derivatives incorrectly.

```{=latex}
\Needspace{12\baselineskip}
```
### The Shifted Series {#the-shifted-series-42}

```{=latex}
\Needspace{10\baselineskip}
```
A power series centred at $x_0$ has the form:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_n(x-x_0)^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its first two coefficients satisfy:

$$
a_0=y(x_0),
\qquad
a_1=y'(x_0).
$$

Working directly with repeated powers of $(x-x_0)$ is possible, but a change
of variable makes the notation cleaner.

```{=latex}
\Needspace{12\baselineskip}
```
### Translate The Centre To Zero {#translate-the-centre-to-zero-43}

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
t=x-x_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x=t+x_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $dt/dx=1$, the chain rule gives:

$$
\frac{dy}{dx}
=\frac{dy}{dt}\frac{dt}{dx}
=\frac{dy}{dt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more:

$$
\frac{d^2y}{dx^2}
=\frac{d}{dx}\left(\frac{dy}{dt}\right)
=\frac{d^2y}{dt^2}\frac{dt}{dx}
=\frac{d^2y}{dt^2}.
$$

Thus the derivative symbols keep the same numerical values under a pure
translation. The coefficient functions must still have $x=t+x_0$
substituted into them.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Shifted-Centre Example {#a-complete-shifted-centre-example-44}

```{=latex}
\Needspace{10\baselineskip}
```
Find a series solution near $x=2$ for:

$$
y''+(x-2)y'-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
t=x-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $x-2=t$, and the equation becomes:

$$
\frac{d^2y}{dt^2}
+t\frac{dy}{dt}
-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To keep the notation short, write derivatives with respect to $t$ as primes:

$$
y''+ty'-y=0.
$$

The transformed equation is to be solved near $t=0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Shifted Recurrence {#derive-the-shifted-recurrence-45}

```{=latex}
\Needspace{10\baselineskip}
```
Assume:

$$
y=\sum_{n=0}^{\infty}a_nt^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}t^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
ty'=\sum_{n=1}^{\infty}na_nt^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
As before, the missing $n=0$ term in $ty'$ is zero. Substitute all terms:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+na_n-a_n\right]t^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the last two terms:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+(n-1)a_n\right]t^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set each coefficient equal to zero:

$$
(n+2)(n+1)a_{n+2}+(n-1)a_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $a_{n+2}$:

$$
\boxed{
a_{n+2}
=\frac{1-n}{(n+2)(n+1)}a_n,
\qquad n\geq0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Generate And Return To X {#generate-and-return-to-x-46}

```{=latex}
\Needspace{10\baselineskip}
```
For the even chain, set $n=0$:

$$
a_2=\frac{1}{2}a_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=\frac{1-2}{(4)(3)}a_2\\
&=-\frac1{12}\left(\frac{a_0}{2}\right)\\
&=-\frac{a_0}{24}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the odd chain, use the same recurrence with $n=1$:

$$
a_3=\frac{1-1}{(3)(2)}a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Once $a_3=0$, the recurrence gives $a_5=a_7=\cdots=0$. Therefore:

$$
y(t)
=a_0\left(1+\frac{t^2}{2}-\frac{t^4}{24}+\cdots\right)
+a_1t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $t=x-2$:

$$
\boxed{
y(x)
=a_0\left[1+\frac{(x-2)^2}{2}-\frac{(x-2)^4}{24}+\cdots\right]
+a_1(x-2)
}.
$$

The powers must remain powers of $(x-2)$ because the series is centred at
$2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Apply Initial Conditions At The Centre {#apply-initial-conditions-at-the-centre-47}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the shifted-centre example also has:

$$
y(2)=3,
\qquad
y'(2)=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because:

$$
a_0=y(2),
\qquad
a_1=y'(2),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the conditions give immediately:

$$
a_0=3,
\qquad
a_1=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these values into the general series:

$$
\boxed{
y(x)
=3+\frac32(x-2)^2-\frac18(x-2)^4
-2(x-2)+\cdots
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Reordering by increasing power gives:

$$
y(x)
=3-2(x-2)+\frac32(x-2)^2-\frac18(x-2)^4+\cdots.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-48}

For a centre $x_0$, set $t=x-x_0$, substitute $x=t+x_0$ throughout the
equation, solve near $t=0$, and finally replace $t$ by $x-x_0$. Initial values
given at the centre become $a_0$ and $a_1$ directly.

```{=latex}
\Needspace{20\baselineskip}
```
## A Direct Taylor Method For Initial-Value Problems {#block-7-a-direct-taylor-method-for-initial-value-problems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-49}

The goal is to calculate a few terms of an IVP solution by finding successive
derivatives at the initial point.

```{=latex}
\Needspace{12\baselineskip}
```
### The Taylor Formula At The Initial Point {#the-taylor-formula-at-the-initial-point-50}

```{=latex}
\Needspace{10\baselineskip}
```
If the solution is analytic near $x_0$, then:

$$
\boxed{
y(x)
=y(x_0)
+y'(x_0)(x-x_0)
+\frac{y''(x_0)}{2!}(x-x_0)^2
+\frac{y'''(x_0)}{3!}(x-x_0)^3
+\cdots
}.
$$

The initial conditions supply $y(x_0)$ and $y'(x_0)$. The differential
equation supplies $y''(x_0)$, and differentiated versions of the equation
supply later derivatives.

```{=latex}
\Needspace{12\baselineskip}
```
### A Four-Term IVP Calculation {#a-four-term-ivp-calculation-51}

```{=latex}
\Needspace{10\baselineskip}
```
Find the Taylor polynomial through degree four for the solution of:

$$
y''=xy'-2y+x^2,
\qquad
y(1)=2,
\qquad
y'(1)=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The centre is $x_0=1$. We already know:

$$
y(1)=2,
\qquad
y'(1)=-1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Second Derivative {#find-the-second-derivative-52}

```{=latex}
\Needspace{10\baselineskip}
```
Use the differential equation itself:

$$
y''=xy'-2y+x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=1$, $y(1)=2$, and $y'(1)=-1$:

$$
\begin{aligned}
y''(1)
&=(1)(-1)-2(2)+1^2\\
&=-1-4+1\\
&=-4.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Third Derivative {#find-the-third-derivative-53}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate every term in:

$$
y''=xy'-2y+x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product rule gives $(xy')'=y'+xy''$. Therefore:

$$
\begin{aligned}
y'''
&=y'+xy''-2y'+2x\\
&=xy''-y'+2x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=1$, $y''(1)=-4$, and $y'(1)=-1$:

$$
\begin{aligned}
y'''(1)
&=(1)(-4)-(-1)+2(1)\\
&=-4+1+2\\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Fourth Derivative {#find-the-fourth-derivative-54}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the simplified third-derivative equation:

$$
y'''=xy''-y'+2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the product rule to $xy''$:

$$
(xy'')'=y''+xy'''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
y''''
&=y''+xy'''-y''+2\\
&=xy'''+2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=1$ and $y'''(1)=-1$:

$$
\begin{aligned}
y''''(1)
&=(1)(-1)+2\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Taylor Polynomial {#build-the-taylor-polynomial-55}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\begin{aligned}
y(1)&=2,\\
y'(1)&=-1,\\
y''(1)&=-4,\\
y'''(1)&=-1,\\
y''''(1)&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these values into the Taylor formula centred at $1$:

$$
\begin{aligned}
y(x)
={}&2
-(x-1)
+\frac{-4}{2!}(x-1)^2
+\frac{-1}{3!}(x-1)^3
+\frac{1}{4!}(x-1)^4
+\cdots\\
={}&2-(x-1)-2(x-1)^2
-\frac16(x-1)^3
+\frac1{24}(x-1)^4+\cdots.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the requested degree-four Taylor polynomial is:

$$
\boxed{
T_4(x)
=2-(x-1)-2(x-1)^2
-\frac16(x-1)^3
+\frac1{24}(x-1)^4
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Recurrence Method Or Direct Taylor Method? {#recurrence-method-or-direct-taylor-method-56}

Use coefficient matching when:

-   a general recurrence is needed
-   many terms are required
-   the two arbitrary solution branches matter
-   the structure of the entire series is the goal

Use repeated differentiation when:

-   initial values are already given
-   only the first few terms are required
-   evaluating derivatives at the centre stays manageable

The direct Taylor method is efficient locally, but it may not reveal a clean
formula for the general coefficient $a_n$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-57}

For an IVP, successive differentiation of the differential equation can
generate $y''(x_0),y'''(x_0),\ldots$. Insert those values into the Taylor
formula and keep the factorial denominators visible.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Workflow And Common Mistakes {#block-8-a-reliable-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-58}

The goal is to turn power-series work into a repeatable sequence and identify
the index errors that most often corrupt a recurrence.

```{=latex}
\Needspace{12\baselineskip}
```
### The Power-Series Workflow {#the-power-series-workflow-59}

#### Step 1: Choose and check the centre

Normalize the equation and confirm that the centre is ordinary. For a forced
equation, check the forcing as well.

#### Step 2: Translate a nonzero centre

If the centre is $x_0\neq0$, use $t=x-x_0$ and replace every occurrence of
$x$ by $t+x_0$.

#### Step 3: Write the series and derivatives

State $y$, $y'$, and $y''$ with their indices and lower limits.

#### Step 4: Substitute before combining

Keep one sum for each differential-equation term until every multiplication
by $x$, $x^2$, or another series has been handled.

#### Step 5: Align powers and lower limits

Reindex to a common power. Extract low-order terms when a sum starts later
than the others.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Match coefficients

For a homogeneous equation, match each coefficient to zero. For a forced
equation, match it to the corresponding coefficient on the right.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Solve for the highest-index coefficient

State both the recurrence and the values of $n$ for which it is valid.

#### Step 8: Generate enough coefficients

Show each substitution until the pattern is unmistakable. Keep even and odd
chains separate when the recurrence advances by two.

#### Step 9: Apply conditions and reconstruct

Insert the coefficients into the original series and return from any shifted
variable to $x$.

#### Step 10: Check the requested order

If terms through $x^m$ are requested, calculate every coefficient through
$a_m$, including coefficients that turn out to be zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Matching Different Powers {#common-mistake-matching-different-powers-60}

```{=latex}
\Needspace{10\baselineskip}
```
The sums:

$$
\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}
\quad\text{and}\quad
\sum_{n=0}^{\infty}a_nx^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
cannot be combined as written because one uses $x^{n-2}$ and the other uses
$x^n$. Reindex the first sum:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n.
$$

Only then do corresponding coefficients refer to the same power.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Ignoring The Lower Limit {#common-mistake-ignoring-the-lower-limit-61}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n,
$$

changing the lower limit to $0$ would introduce $a_{-1}$, which has not been
defined.

Either preserve the lower limit $1$ and separate the constant term, or
explicitly define a temporary zero coefficient. The first route is usually
clearer for learners.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Hiding The Recurrence Domain {#common-mistake-hiding-the-recurrence-domain-62}

A formula involving $a_{n-1}$ may be valid only for $n\geq1$ or $n\geq2$.
Applying it at $n=0$ can create an undefined coefficient or miss a nonzero
forcing term.

```{=latex}
\Needspace{10\baselineskip}
```
Write the range beside the recurrence:

$$
a_{n+2}=\cdots,
\qquad n\geq2.
$$

Then solve the exceptional powers separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing A Free Constant {#common-mistake-losing-a-free-constant-63}

A second-order homogeneous equation should normally retain two free
coefficients. If a recurrence advancing by two is calculated only from
$a_0$, the odd branch beginning with $a_1$ has been omitted.

```{=latex}
\Needspace{10\baselineskip}
```
Write both chains:

$$
a_0\to a_2\to a_4\to\cdots,
\qquad
a_1\to a_3\to a_5\to\cdots.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Returning To The Wrong Variable {#common-mistake-returning-to-the-wrong-variable-64}

```{=latex}
\Needspace{10\baselineskip}
```
If $t=x-x_0$, then a term $a_3t^3$ becomes:

$$
a_3(x-x_0)^3,
$$

not $a_3x^3$. Preserve the shifted power when returning to the original
variable.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-65}

Power-series algebra is reliable when powers, lower limits, recurrence ranges,
and free coefficients remain visible. Most errors come from combining sums
too early or using a recurrence outside its stated domain.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-9-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Foundations And A First Solution {#problems-1-to-4-foundations-and-a-first-solution-66}

#### Problem 1: Reindex Two Derivatives

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
y=\sum_{n=0}^{\infty}a_nx^n,
$$

derive formulas for $y'$ and $y''$ in powers of $x^n$. Check the first two
terms of each result.

#### Problem 2: Classify Two Points

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
(4-x)y''+(1+x)y'+e^xy=0,
$$

classify $x=0$ and $x=4$ as ordinary or singular points.

#### Problem 3: Derive And Use A Four-Step Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Find the recurrence and the first three nonzero terms in each solution branch
near $x=0$ for:

$$
y''+x^2y=0.
$$

#### Problem 4: Apply Initial Values To A Known Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Use the recurrence:

$$
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
to find the series through $x^5$ satisfying:

$$
y''+xy'+2y=0,
\qquad
y(0)=2,
\qquad
y'(0)=-1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Forcing And Shifted Centres {#problems-5-to-8-forcing-and-shifted-centres-67}

#### Problem 5: Separate A Missing Low-Power Term

```{=latex}
\Needspace{10\baselineskip}
```
Find a recurrence and write the general solution through $x^6$ for:

$$
y''-xy=0
$$

near $x=0$.

#### Problem 6: Match A Polynomial Forcing

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''+y=x^2,
$$

find $a_2,a_3,a_4,$ and $a_5$ in terms of the arbitrary coefficients $a_0$
and $a_1$.

#### Problem 7: Translate To A New Centre

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=x+1$ and find the series through degree six near $x=-1$ for:

$$
y''+(x+1)y=0.
$$

Leave the two arbitrary coefficients visible.

#### Problem 8: Use Conditions At A Shifted Centre

```{=latex}
\Needspace{10\baselineskip}
```
Find the series through degree four near $x=1$ for:

$$
y''+(x-1)y'-y=0,
\qquad
y(1)=2,
\qquad
y'(1)=3.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Taylor Data And Error Diagnosis {#problems-9-to-12-taylor-data-and-error-diagnosis-68}

#### Problem 9: Build A Taylor Polynomial Directly

```{=latex}
\Needspace{10\baselineskip}
```
Use repeated differentiation to find the degree-four Taylor polynomial about
$x=0$ for:

$$
y''=y'+xy,
\qquad
y(0)=1,
\qquad
y'(0)=2.
$$

#### Problem 10: Confirm The Same Polynomial By Recurrence

For the IVP in Problem 9, derive a coefficient recurrence and verify the
coefficients through $a_4$.

#### Problem 11: Diagnose Four Series Errors

Explain the error in each statement.

1.  Since $y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}$, its coefficient of
    $x^n$ is $n(n-1)a_n$.
2.  The identity $xy=\sum_{n=0}^{\infty}a_{n-1}x^n$ is valid without any
    additional definition.
3.  A recurrence containing $a_{n-1}$ can always be evaluated at $n=0$.
4.  A second-order homogeneous series containing only $a_0$ is automatically
    the general solution.

#### Problem 12: Evaluate A Truncated Series

Use the degree-five series from Problem 4 to approximate $y(0.2)$. Keep at
least six decimal places during the calculation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-69}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=\sum_{n=1}^{\infty}na_nx^{n-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the old index $n$ by $n+1$ so the power becomes $x^n$:

$$
\boxed{
y'=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its first two terms are:

$$
n=0:\ a_1,
\qquad
n=1:\ 2a_2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate a second time:

$$
y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the old index by $n+2$:

$$
\boxed{
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its first two terms are:

$$
n=0:\ 2a_2,
\qquad
n=1:\ 6a_3x.
$$

These agree with direct differentiation of
$a_0+a_1x+a_2x^2+a_3x^3+\cdots$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Divide by the leading coefficient $4-x$:

$$
y''+\frac{1+x}{4-x}y'
+\frac{e^x}{4-x}y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
P(x)=\frac{1+x}{4-x},
\qquad
Q(x)=\frac{e^x}{4-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$, the denominator is:

$$
4-0=4\neq0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both normalized coefficients are analytic near $0$, so:

$$
\boxed{x=0\text{ is an ordinary point}.}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=4$, the denominator is zero. Both normalized coefficients fail to be
analytic there, so:

$$
\boxed{x=4\text{ is a singular point}.}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
x^2y=\sum_{n=2}^{\infty}a_{n-2}x^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y''+x^2y=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=2}^{\infty}a_{n-2}x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second sum has no constant or linear term. Match those powers from the
first sum:

$$
2a_2=0,
\qquad
6a_3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
a_2=0,
\qquad
a_3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\geq2$:

$$
(n+2)(n+1)a_{n+2}+a_{n-2}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the highest-index coefficient:

$$
\boxed{
a_{n+2}
=-\frac{a_{n-2}}{(n+2)(n+1)},
\qquad n\geq2
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$ and then $n=6$ for the branch beginning with $a_0$:

$$
\begin{aligned}
a_4&=-\frac{a_0}{(4)(3)}=-\frac{a_0}{12},\\
a_8&=-\frac{a_4}{(8)(7)}=\frac{a_0}{672}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$ and then $n=7$ for the branch beginning with $a_1$:

$$
\begin{aligned}
a_5&=-\frac{a_1}{(5)(4)}=-\frac{a_1}{20},\\
a_9&=-\frac{a_5}{(9)(8)}=\frac{a_1}{1440}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
\begin{aligned}
y(x)
={}&a_0\left(1-\frac{x^4}{12}+\frac{x^8}{672}+\cdots\right)\\
&+a_1\left(x-\frac{x^5}{20}+\frac{x^9}{1440}+\cdots\right).
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
The initial conditions give:

$$
a_0=y(0)=2,
\qquad
a_1=y'(0)=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the recurrence with $n=0$:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{1}\\
&=-2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $n=1$:

$$
\begin{aligned}
a_3
&=-\frac{a_1}{2}\\
&=\frac12.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_2}{3}\\
&=\frac23.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_3}{4}\\
&=-\frac18.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the coefficients into the series:

$$
\boxed{
y(x)
=2-x-2x^2+\frac12x^3+\frac23x^4-\frac18x^5+\cdots
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
Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both series into $y''-xy=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
-\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant term comes only from $y''$:

$$
2a_2=0,
\qquad
a_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}-a_{n-1}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
a_{n+2}
=\frac{a_{n-1}}{(n+2)(n+1)},
\qquad n\geq1
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=1$:

$$
a_3=\frac{a_0}{(3)(2)}=\frac{a_0}{6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
a_4=\frac{a_1}{(4)(3)}=\frac{a_1}{12}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$:

$$
a_5=\frac{a_2}{(5)(4)}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Continue the recurrence
$a_{n+2}=a_{n-1}/[(n+2)(n+1)]$ with $n=4$:

$$
\begin{aligned}
a_6
&=\frac{a_3}{(6)(5)}\\
&=\frac{a_0/6}{30}\\
&=\frac{a_0}{180}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus, through degree six:

$$
\boxed{
y(x)
=a_0\left(1+\frac{x^3}{6}+\frac{x^6}{180}\right)
+a_1\left(x+\frac{x^4}{12}\right)+\cdots
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Write the forcing as a power series with coefficients:

$$
x^2=0+0x+1x^2+0x^3+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitution into $y''+y=x^2$ gives:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_n\right]x^n=x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the constant coefficient:

$$
2a_2+a_0=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\boxed{a_2=-\frac{a_0}{2}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^1$:

$$
6a_3+a_1=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\boxed{a_3=-\frac{a_1}{6}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^2$, which is $1$ on the right:

$$
12a_4+a_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $a_2=-a_0/2$:

$$
\begin{aligned}
12a_4-\frac{a_0}{2}&=1,\\
12a_4&=1+\frac{a_0}{2},\\
a_4&=\frac1{12}+\frac{a_0}{24}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $x^3$, which is zero on the right:

$$
20a_5+a_3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $a_3=-a_1/6$:

$$
\begin{aligned}
20a_5-\frac{a_1}{6}&=0,\\
a_5&=\frac{a_1}{120}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
a_2=-\frac{a_0}{2},
\quad
a_3=-\frac{a_1}{6},
\quad
a_4=\frac1{12}+\frac{a_0}{24},
\quad
a_5=\frac{a_1}{120}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
t=x+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $x+1=t$, and translations preserve the first and second derivatives.
The equation becomes:

$$
y''+ty=0
$$

near $t=0$.

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}t^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
ty=\sum_{n=1}^{\infty}a_{n-1}t^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant term gives:

$$
2a_2=0,
\qquad
a_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
a_{n+2}
=-\frac{a_{n-1}}{(n+2)(n+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the needed coefficients:

$$
\begin{aligned}
a_3&=-\frac{a_0}{6},\\
a_4&=-\frac{a_1}{12},\\
a_5&=-\frac{a_2}{20}=0,\\
a_6&=-\frac{a_3}{30}=\frac{a_0}{180}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y(t)
=a_0\left(1-\frac{t^3}{6}+\frac{t^6}{180}\right)
+a_1\left(t-\frac{t^4}{12}\right)+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $t=x+1$:

$$
\boxed{
\begin{aligned}
y(x)
={}&a_0\left[1-\frac{(x+1)^3}{6}+\frac{(x+1)^6}{180}\right]\\
&+a_1\left[(x+1)-\frac{(x+1)^4}{12}\right]+\cdots.
\end{aligned}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
t=x-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation becomes:

$$
y''+ty'-y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its recurrence is:

$$
a_{n+2}
=\frac{1-n}{(n+2)(n+1)}a_n,
\qquad n\geq0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial conditions at the centre give:

$$
a_0=y(1)=2,
\qquad
a_1=y'(1)=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=0$:

$$
\begin{aligned}
a_2
&=\frac{1}{(2)(1)}a_0\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=1$:

$$
a_3=\frac{0}{(3)(2)}a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=\frac{-1}{(4)(3)}a_2\\
&=-\frac1{12}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $a_0=2$, $a_1=3$, $a_2=1$, $a_3=0$, and $a_4=-1/12$, the
degree-four series in $t$ is:

$$
y(t)=2+3t+t^2-\frac1{12}t^4+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $t$ by $x-1$:

$$
\boxed{
y(x)
=2+3(x-1)+(x-1)^2-\frac1{12}(x-1)^4+\cdots
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
The initial values are:

$$
y(0)=1,
\qquad
y'(0)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the differential equation:

$$
y''=y'+xy.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=0$:

$$
\begin{aligned}
y''(0)
&=y'(0)+0\cdot y(0)\\
&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the differential equation:

$$
\begin{aligned}
y'''
&=y''+(xy)'\\
&=y''+y+xy'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=0$:

$$
\begin{aligned}
y'''(0)
&=y''(0)+y(0)+0\cdot y'(0)\\
&=2+1\\
&=3.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\begin{aligned}
y''''
&=y'''+y'+(xy')'\\
&=y'''+y'+y'+xy''\\
&=y'''+2y'+xy''.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=0$:

$$
\begin{aligned}
y''''(0)
&=y'''(0)+2y'(0)+0\cdot y''(0)\\
&=3+2(2)\\
&=7.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the derivatives into the Taylor formula:

$$
\begin{aligned}
T_4(x)
&=1+2x+\frac{2}{2!}x^2+\frac{3}{3!}x^3+\frac{7}{4!}x^4\\
&=1+2x+x^2+\frac12x^3+\frac7{24}x^4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
T_4(x)=1+2x+x^2+\frac12x^3+\frac7{24}x^4
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the equation as:

$$
y''-y'-xy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\begin{aligned}
y''&=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n,\\
y'&=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n,\\
xy&=\sum_{n=1}^{\infty}a_{n-1}x^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant term gives:

$$
2a_2-a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
a_2=\frac{a_1}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}-(n+1)a_{n+1}-a_{n-1}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $a_{n+2}$:

$$
\boxed{
a_{n+2}
=\frac{(n+1)a_{n+1}+a_{n-1}}{(n+2)(n+1)},
\qquad n\geq1
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial values give:

$$
a_0=1,
\qquad
a_1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
a_2=\frac{2}{2}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=1$:

$$
\begin{aligned}
a_3
&=\frac{2a_2+a_0}{(3)(2)}\\
&=\frac{2(1)+1}{6}\\
&=\frac12.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=\frac{3a_3+a_1}{(4)(3)}\\
&=\frac{3(1/2)+2}{12}\\
&=\frac{7/2}{12}\\
&=\frac7{24}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the recurrence gives:

$$
y(x)=1+2x+x^2+\frac12x^3+\frac7{24}x^4+\cdots,
$$

which agrees with the direct Taylor calculation.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

#### Statement 1

```{=latex}
\Needspace{10\baselineskip}
```
The expression $n(n-1)a_n$ multiplies $x^{n-2}$, not $x^n$. Reindexing gives
the coefficient of $x^n$ as:

$$
\boxed{(n+2)(n+1)a_{n+2}}.
$$

#### Statement 2

```{=latex}
\Needspace{10\baselineskip}
```
At $n=0$, the proposed sum contains $a_{-1}$, which has not been defined.
The standard form is:

$$
\boxed{
xy=\sum_{n=1}^{\infty}a_{n-1}x^n
}.
$$

#### Statement 3

Substituting $n=0$ into a recurrence containing $a_{n-1}$ produces $a_{-1}$.
The recurrence must begin at an index where every coefficient exists, and
lower powers must be matched separately.

#### Statement 4

A second-order homogeneous equation normally has two independent free
constants. A series built only from $a_0$ is one solution branch. The branch
beginning with $a_1$ must also be included unless the equation or supplied
conditions force it to vanish.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
From Answer 4, the degree-five approximation is:

$$
y(x)
\approx2-x-2x^2+\frac12x^3+\frac23x^4-\frac18x^5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $x=0.2$:

$$
\begin{aligned}
y(0.2)
\approx{}&2-0.2-2(0.2)^2
+\frac12(0.2)^3
+\frac23(0.2)^4
-\frac18(0.2)^5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the powers:

$$
(0.2)^2=0.04,
\quad
(0.2)^3=0.008,
\quad
(0.2)^4=0.0016,
\quad
(0.2)^5=0.00032.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute them:

$$
\begin{aligned}
y(0.2)
\approx{}&2-0.2-2(0.04)
+\frac12(0.008)
+\frac23(0.0016)
-\frac18(0.00032)\\
={}&2-0.2-0.08+0.004+0.0010666667-0.00004\\
={}&1.7250266667.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{y(0.2)\approx1.725027}.
$$

This is a truncated-series approximation, not an exact decimal value.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 27 Final Summary {#chapter-27-final-summary-72}

```{=latex}
\Needspace{10\baselineskip}
```
At an ordinary point, seek:

$$
y(x)=\sum_{n=0}^{\infty}a_n(x-x_0)^n.
$$

For a second-order equation, $a_0=y(x_0)$ and $a_1=y'(x_0)$ are the two
starting coefficients. Substitution, index alignment, and coefficient
matching determine the rest through a recurrence.

```{=latex}
\Needspace{10\baselineskip}
```
The dependable sequence is:

$$
\boxed{
\begin{aligned}
\text{check the centre}
&\;\longrightarrow\;\text{write the series}
\;\longrightarrow\;\text{align powers}\\
&\;\longrightarrow\;\text{separate low powers}
\;\longrightarrow\;\text{derive the recurrence}\\
&\;\longrightarrow\;\text{reconstruct the solution}.
\end{aligned}
}
$$

[^1]: A power series has unique coefficients. In
    particular, differentiating $n$ times and setting $x=0$ gives
    $c_n=f^{(n)}(0)/n!$, so the zero function can have only zero coefficients.

[^2]: The guaranteed interval extends until analyticity can no
    longer be assured. Determining the exact radius may require examining
    singularities beyond the real line, which is not needed for the recurrence
    calculations in this chapter.
