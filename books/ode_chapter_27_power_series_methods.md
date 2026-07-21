# Power Series Methods For Variable-Coefficient Equations

Constant-coefficient equations often reduce to algebra through a
characteristic polynomial, a Laplace transform, or a matrix exponential. When
coefficients depend on the independent variable, those routes may no longer
produce a usable closed form.

Power series offer a different strategy. Instead of guessing the complete
function, we build it coefficient by coefficient near a chosen centre.

This chapter will:

- review the series notation needed for derivatives and index shifts
- distinguish ordinary points from singular points
- derive recurrence formulas for homogeneous and forced equations
- separate the two arbitrary solution branches of a second-order equation
- construct series around points other than the origin
- apply initial conditions directly to series coefficients
- use repeated differentiation when only a few Taylor terms are needed

---

## Block 1: Turning An Unknown Function Into Unknown Coefficients

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what a power-series solution assumes and how
differentiation changes its coefficients.

> a power-series method replaces one unknown function by an ordered list of
> unknown numbers.

</details>

<details open>
<summary><strong>The Series Assumption</strong></summary>

To seek a solution near $x=0$, assume:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_nx^n
}.
$$

Written term by term, this is:

$$
y(x)=a_0+a_1x+a_2x^2+a_3x^3+\cdots.
$$

Here:

- $n$ is a nonnegative integer index
- $a_n$ is the coefficient of $x^n$
- the numbers $a_0,a_1,a_2,\ldots$ are initially unknown
- the series is centred at $x=0$

The method succeeds when the differential equation forces these coefficients
to satisfy a pattern called a recurrence relation.

</details>

<details open>
<summary><strong>Differentiate Without Skipping The First Terms</strong></summary>

Start from the expanded series:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+a_4x^4+\cdots.
$$

Differentiate term by term:

$$
y'=a_1+2a_2x+3a_3x^2+4a_4x^3+\cdots.
$$

Differentiate again:

$$
y''=2a_2+6a_3x+12a_4x^2+20a_5x^3+\cdots.
$$

In summation notation:

$$
y'=\sum_{n=1}^{\infty}na_nx^{n-1}
$$

and:

$$
y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}.
$$

These forms are correct, but their powers do not yet begin with $x^0$. That
makes them awkward to compare with the original series.

</details>

<details open>
<summary><strong>Reindex The Derivatives To Powers Of X To The N</strong></summary>

For $y'$, replace the old index by $n+1$. Then:

$$
\begin{aligned}
y'
&=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n.
\end{aligned}
$$

Check the first terms:

$$
\begin{aligned}
n=0&:\quad a_1,\\
n=1&:\quad 2a_2x,\\
n=2&:\quad 3a_3x^2.
\end{aligned}
$$

For $y''$, replace the old index by $n+2$:

$$
\boxed{
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
}.
$$

Again, check the first terms:

$$
\begin{aligned}
n=0&:\quad 2a_2,\\
n=1&:\quad 6a_3x,\\
n=2&:\quad 12a_4x^2.
\end{aligned}
$$

The reindexed formulas reproduce the expanded derivatives exactly.

</details>

<details open>
<summary><strong>Why Matching Coefficients Is Valid</strong></summary>

Suppose substitution produces:

$$
c_0+c_1x+c_2x^2+c_3x^3+\cdots=0
$$

throughout an interval around the centre. Then every coefficient must vanish:

$$
c_0=0,
\qquad
c_1=0,
\qquad
c_2=0,
\qquad\ldots
$$

Equivalently, if:

$$
\sum_{n=0}^{\infty}c_nx^n=0,
$$

then:

$$
\boxed{c_n=0\quad\text{for every }n\geq0}.
$$

This is what converts a differential equation into algebraic equations for
the coefficients $a_n$.[^coefficient-uniqueness]

[^coefficient-uniqueness]: A power series has unique coefficients. In
    particular, differentiating $n$ times and setting $x=0$ gives
    $c_n=f^{(n)}(0)/n!$, so the zero function can have only zero coefficients.

</details>

<details open>
<summary><strong>Initial Values Are The First Two Coefficients</strong></summary>

From:

$$
y(x)=a_0+a_1x+a_2x^2+\cdots,
$$

set $x=0$:

$$
y(0)=a_0.
$$

From:

$$
y'(x)=a_1+2a_2x+3a_3x^2+\cdots,
$$

set $x=0$:

$$
y'(0)=a_1.
$$

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

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

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

</details>

---

## Block 2: Ordinary Points And Where The Method Applies

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide whether an ordinary power series is justified at the
chosen centre before doing recurrence algebra.

</details>

<details open>
<summary><strong>Analytic Functions</strong></summary>

A function $f$ is analytic at $x_0$ if its Taylor series about $x_0$ converges
to the function throughout some interval around $x_0$:

$$
f(x)
=\sum_{n=0}^{\infty}
\frac{f^{(n)}(x_0)}{n!}(x-x_0)^n.
$$

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

</details>

<details open>
<summary><strong>Normalize The Differential Equation First</strong></summary>

Consider a second-order linear equation:

$$
b_2(x)y''+b_1(x)y'+b_0(x)y=g(x).
$$

At points where $b_2(x)\neq0$, divide every term by $b_2(x)$:

$$
y''+P(x)y'+Q(x)y=R(x),
$$

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

</details>

<details open>
<summary><strong>Ordinary And Singular Points</strong></summary>

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

The practical meaning:

> normalize first, inspect the coefficient functions at the intended centre,
> and only then assume an ordinary power series.

</details>

<details open>
<summary><strong>What An Ordinary Point Gives Us</strong></summary>

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
centre.[^series-radius]

[^series-radius]: The guaranteed interval extends until analyticity can no
    longer be assured. Determining the exact radius may require examining
    singularities beyond the real line, which is not needed for the recurrence
    calculations in this chapter.

</details>

<details open>
<summary><strong>An Ordinary-Point Check</strong></summary>

Classify $x=0$ for:

$$
(1+x^2)y''+e^xy'+(x-1)y=0.
$$

The leading coefficient at the centre is:

$$
1+0^2=1\neq0,
$$

so normalization is allowed near $0$. Divide by $1+x^2$:

$$
y''+\frac{e^x}{1+x^2}y'
+\frac{x-1}{1+x^2}y=0.
$$

Thus:

$$
P(x)=\frac{e^x}{1+x^2},
\qquad
Q(x)=\frac{x-1}{1+x^2}.
$$

At $x=0$, the common denominator is $1$, not zero. Both ratios are analytic
near $0$. Therefore:

$$
\boxed{x=0\text{ is an ordinary point}.}
$$

</details>

<details open>
<summary><strong>A Singular-Point Check</strong></summary>

Classify $x=3$ for:

$$
(x-3)y''+(x+1)y'+2y=0.
$$

For $x\neq3$, divide by $x-3$:

$$
y''+\frac{x+1}{x-3}y'
+\frac{2}{x-3}y=0.
$$

The normalized coefficients are:

$$
P(x)=\frac{x+1}{x-3},
\qquad
Q(x)=\frac{2}{x-3}.
$$

Both denominators vanish at $x=3$. Therefore neither coefficient is analytic
there, and:

$$
\boxed{x=3\text{ is a singular point}.}
$$

An ordinary Taylor-series assumption about $x=3$ is not justified. A later
method will treat an important class of singular points.

</details>

<details open>
<summary><strong>Do Not Confuse A Zero Coefficient With A Singular Point</strong></summary>

In:

$$
y''+xy'+x^2y=0,
$$

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

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Normalize a second-order linear equation and inspect $P(x)$ and $Q(x)$. An
ordinary point supports the ordinary power-series method; a singular point
requires separate analysis.

</details>

---

## Block 3: Index Shifts And Coefficient Alignment

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to make index shifting mechanical and checkable before using it in
a complete differential equation.

</details>

<details open>
<summary><strong>Multiplication By X Shifts Powers Up</strong></summary>

Start from:

$$
y=\sum_{n=0}^{\infty}a_nx^n
=a_0+a_1x+a_2x^2+\cdots.
$$

Multiply by $x$:

$$
xy=a_0x+a_1x^2+a_2x^3+\cdots.
$$

The result has no constant term. To write its coefficient of $x^n$, observe:

$$
x^n\text{ receives }a_{n-1}\quad\text{for }n\geq1.
$$

Therefore:

$$
\boxed{
xy=\sum_{n=1}^{\infty}a_{n-1}x^n
}.
$$

The lower limit is $1$, not $0$, because $a_{-1}$ has not been defined.

</details>

<details open>
<summary><strong>Multiplication By X Applied To A Derivative</strong></summary>

Use:

$$
y'=a_1+2a_2x+3a_3x^2+\cdots.
$$

Multiply by $x$:

$$
xy'=a_1x+2a_2x^2+3a_3x^3+\cdots.
$$

For the coefficient of $x^n$, the pattern is $na_n$. Hence:

$$
\boxed{
xy'=\sum_{n=1}^{\infty}na_nx^n
}.
$$

There is again no constant term.

</details>

<details open>
<summary><strong>Multiplying Two Full Power Series</strong></summary>

An analytic coefficient may have its own series:

$$
P(x)=p_0+p_1x+p_2x^2+\cdots
=\sum_{n=0}^{\infty}p_nx^n.
$$

Multiply it by:

$$
y(x)=a_0+a_1x+a_2x^2+\cdots.
$$

Collect the first three powers explicitly:

$$
\begin{aligned}
P(x)y(x)
={}&p_0a_0\\
&+(p_0a_1+p_1a_0)x\\
&+(p_0a_2+p_1a_1+p_2a_0)x^2+\cdots.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Separate Low Powers When Lower Limits Differ</strong></summary>

Suppose an equation produces:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

The first sum contains an $x^0$ term, but the second does not. Extract the
constant term from the first sum:

$$
2a_2
+\sum_{n=1}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

Now combine the sums that share the lower limit $n=1$:

$$
2a_2
+\sum_{n=1}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_{n-1}\right]x^n=0.
$$

Match the constant term separately:

$$
2a_2=0.
$$

For every $n\geq1$, match the coefficient of $x^n$:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0.
$$

This separation prevents an undefined $a_{-1}$ from entering the recurrence.

</details>

<details open>
<summary><strong>A Quick Index Check</strong></summary>

For any reindexed sum, test the first two terms.

For example:

$$
\sum_{n=1}^{\infty}a_{n-1}x^n
$$

starts with:

$$
n=1:\ a_0x,
\qquad
n=2:\ a_1x^2.
$$

These are exactly the first two terms of $xy$. If the expanded terms do not
match, the index shift is wrong.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Do not combine sums until their powers and lower limits agree. Expand a few
terms, reindex, test the first terms, and separate exceptional low powers
before deriving a recurrence.

</details>

---

## Block 4: A Complete Homogeneous Series Solution

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive and use a recurrence formula for a variable-coefficient
homogeneous equation without skipping coefficient substitutions.

</details>

<details open>
<summary><strong>The Problem And Point Check</strong></summary>

Find a power-series solution near $x=0$ for:

$$
y''+xy'+2y=0.
$$

The equation is already normalized:

$$
P(x)=x,
\qquad
Q(x)=2.
$$

Both are analytic at $0$, so $x=0$ is an ordinary point.

</details>

<details open>
<summary><strong>Substitute All Three Series</strong></summary>

Use the three required series:

$$
\begin{aligned}
y&=\sum_{n=0}^{\infty}a_nx^n,\\
y''&=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n,\\
xy'&=\sum_{n=1}^{\infty}na_nx^n.
\end{aligned}
$$

Substitute into $y''+xy'+2y=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}na_nx^n
+2\sum_{n=0}^{\infty}a_nx^n=0.
$$

Although the $xy'$ sum begins at $n=1$, its missing $n=0$ term would be
$0a_0x^0=0$. We may therefore include that zero term and write:

$$
\sum_{n=0}^{\infty}
\left[
(n+2)(n+1)a_{n+2}+na_n+2a_n
\right]x^n=0.
$$

Combine the two coefficients multiplying $a_n$:

$$
\sum_{n=0}^{\infty}
\left[
(n+2)(n+1)a_{n+2}+(n+2)a_n
\right]x^n=0.
$$

</details>

<details open>
<summary><strong>Derive The Recurrence</strong></summary>

Every coefficient of $x^n$ must equal zero:

$$
(n+2)(n+1)a_{n+2}+(n+2)a_n=0,
\qquad n\geq0.
$$

Move the $a_n$ term to the right:

$$
(n+2)(n+1)a_{n+2}=-(n+2)a_n.
$$

Divide by $(n+2)(n+1)$:

$$
a_{n+2}
=-\frac{n+2}{(n+2)(n+1)}a_n.
$$

Cancel the nonzero factor $n+2$:

$$
\boxed{
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0
}.
$$

The domain $n\geq0$ is part of the recurrence formula.

</details>

<details open>
<summary><strong>Build The Even Coefficients</strong></summary>

Set $n=0$ in the recurrence:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{0+1}\\
&=-a_0.
\end{aligned}
$$

Set $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_2}{2+1}\\
&=-\frac{-a_0}{3}\\
&=\frac{a_0}{3}.
\end{aligned}
$$

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

Thus the even branch begins:

$$
a_0\left(1-x^2+\frac{x^4}{3}-\frac{x^6}{15}+\cdots\right).
$$

</details>

<details open>
<summary><strong>Build The Odd Coefficients</strong></summary>

Set $n=1$:

$$
\begin{aligned}
a_3
&=-\frac{a_1}{1+1}\\
&=-\frac{a_1}{2}.
\end{aligned}
$$

Set $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_3}{3+1}\\
&=-\frac{-a_1/2}{4}\\
&=\frac{a_1}{8}.
\end{aligned}
$$

Set $n=5$:

$$
\begin{aligned}
a_7
&=-\frac{a_5}{5+1}\\
&=-\frac{a_1/8}{6}\\
&=-\frac{a_1}{48}.
\end{aligned}
$$

Thus the odd branch begins:

$$
a_1\left(x-\frac{x^3}{2}+\frac{x^5}{8}-\frac{x^7}{48}+\cdots\right).
$$

</details>

<details open>
<summary><strong>Assemble The General Solution</strong></summary>

Return to:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+\cdots.
$$

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

</details>

<details open>
<summary><strong>Why Two Series Appear</strong></summary>

The recurrence advances by two indices:

$$
a_n\longrightarrow a_{n+2}.
$$

Therefore even coefficients depend only on $a_0$, while odd coefficients
depend only on $a_1$. The two chains never mix.

This is how a second-order equation preserves two independent arbitrary
constants inside the series method.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

For $y''+xy'+2y=0$, coefficient matching gives:

$$
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0.
$$

Applying the recurrence separately to even and odd indices produces two
solution branches controlled by $a_0$ and $a_1$.

</details>

---

## Block 5: Nonhomogeneous Equations And Exceptional Powers

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to match a series on the left to a nonzero series on the right and
handle low powers that do not follow the later recurrence.

</details>

<details open>
<summary><strong>The Forced Problem</strong></summary>

Find the first several terms of the general power-series solution near $x=0$
for:

$$
y''+xy=1+x.
$$

The equation is normalized, with $P(x)=0$ and $Q(x)=x$. Both are analytic at
$0$. The forcing $1+x$ is also analytic there.

</details>

<details open>
<summary><strong>Substitute And Align The Powers</strong></summary>

Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n.
$$

For $xy$:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n.
$$

Substitute both series:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=1}^{\infty}a_{n-1}x^n
=1+x.
$$

Extract the constant term from the first sum:

$$
2a_2
+\sum_{n=1}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_{n-1}\right]x^n
=1+x.
$$

The right side has coefficients:

$$
1+x=1\cdot x^0+1\cdot x^1+0\cdot x^2+0\cdot x^3+\cdots.
$$

</details>

<details open>
<summary><strong>Match The Constant And Linear Terms First</strong></summary>

Match the coefficient of $x^0$:

$$
2a_2=1.
$$

Divide by $2$:

$$
\boxed{a_2=\frac12}.
$$

Match the coefficient of $x^1$. Set $n=1$ in the combined sum:

$$
(1+2)(1+1)a_{1+2}+a_{1-1}=1.
$$

Simplify the indices and factors:

$$
6a_3+a_0=1.
$$

Subtract $a_0$ and divide by $6$:

$$
\boxed{a_3=\frac{1-a_0}{6}}.
$$

These equations are special because the forcing has nonzero constant and
linear coefficients.

</details>

<details open>
<summary><strong>Derive The Later Recurrence</strong></summary>

For every $n\geq2$, the coefficient of $x^n$ on the right is zero. Therefore:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0,
\qquad n\geq2.
$$

Move $a_{n-1}$ to the right:

$$
(n+2)(n+1)a_{n+2}=-a_{n-1}.
$$

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

</details>

<details open>
<summary><strong>Calculate The Next Coefficients</strong></summary>

Set $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_1}{(4)(3)}\\
&=-\frac{a_1}{12}.
\end{aligned}
$$

Set $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_2}{(5)(4)}\\
&=-\frac{1/2}{20}\\
&=-\frac1{40}.
\end{aligned}
$$

Set $n=4$:

$$
\begin{aligned}
a_6
&=-\frac{a_3}{(6)(5)}\\
&=-\frac{(1-a_0)/6}{30}\\
&=-\frac{1-a_0}{180}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Assemble And Interpret The Series</strong></summary>

Insert the calculated coefficients into:

$$
y=a_0+a_1x+a_2x^2+a_3x^3+a_4x^4+a_5x^5+a_6x^6+\cdots.
$$

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

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

For a nonhomogeneous equation, expand the right side as a series and match its
coefficients. If its first few coefficients differ from the later pattern,
solve those powers separately and state where the general recurrence begins.

</details>

---

## Block 6: Series About A Nonzero Centre

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to centre a series at $x=x_0$ and translate the algebra to the
origin without changing the derivatives incorrectly.

</details>

<details open>
<summary><strong>The Shifted Series</strong></summary>

A power series centred at $x_0$ has the form:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_n(x-x_0)^n
}.
$$

Its first two coefficients satisfy:

$$
a_0=y(x_0),
\qquad
a_1=y'(x_0).
$$

Working directly with repeated powers of $(x-x_0)$ is possible, but a change
of variable makes the notation cleaner.

</details>

<details open>
<summary><strong>Translate The Centre To Zero</strong></summary>

Define:

$$
t=x-x_0.
$$

Then:

$$
x=t+x_0.
$$

Since $dt/dx=1$, the chain rule gives:

$$
\frac{dy}{dx}
=\frac{dy}{dt}\frac{dt}{dx}
=\frac{dy}{dt}.
$$

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

</details>

<details open>
<summary><strong>A Complete Shifted-Centre Example</strong></summary>

Find a series solution near $x=2$ for:

$$
y''+(x-2)y'-y=0.
$$

Set:

$$
t=x-2.
$$

Then $x-2=t$, and the equation becomes:

$$
\frac{d^2y}{dt^2}
+t\frac{dy}{dt}
-y=0.
$$

To keep the notation short, write derivatives with respect to $t$ as primes:

$$
y''+ty'-y=0.
$$

The transformed equation is to be solved near $t=0$.

</details>

<details open>
<summary><strong>Derive The Shifted Recurrence</strong></summary>

Assume:

$$
y=\sum_{n=0}^{\infty}a_nt^n.
$$

Then:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}t^n
$$

and:

$$
ty'=\sum_{n=1}^{\infty}na_nt^n.
$$

As before, the missing $n=0$ term in $ty'$ is zero. Substitute all terms:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+na_n-a_n\right]t^n=0.
$$

Combine the last two terms:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+(n-1)a_n\right]t^n=0.
$$

Set each coefficient equal to zero:

$$
(n+2)(n+1)a_{n+2}+(n-1)a_n=0.
$$

Solve for $a_{n+2}$:

$$
\boxed{
a_{n+2}
=\frac{1-n}{(n+2)(n+1)}a_n,
\qquad n\geq0
}.
$$

</details>

<details open>
<summary><strong>Generate And Return To X</strong></summary>

For the even chain, set $n=0$:

$$
a_2=\frac{1}{2}a_0.
$$

Set $n=2$:

$$
\begin{aligned}
a_4
&=\frac{1-2}{(4)(3)}a_2\\
&=-\frac1{12}\left(\frac{a_0}{2}\right)\\
&=-\frac{a_0}{24}.
\end{aligned}
$$

For the odd chain, use the same recurrence with $n=1$:

$$
a_3=\frac{1-1}{(3)(2)}a_1=0.
$$

Once $a_3=0$, the recurrence gives $a_5=a_7=\cdots=0$. Therefore:

$$
y(t)
=a_0\left(1+\frac{t^2}{2}-\frac{t^4}{24}+\cdots\right)
+a_1t.
$$

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

</details>

<details open>
<summary><strong>Apply Initial Conditions At The Centre</strong></summary>

Suppose the shifted-centre example also has:

$$
y(2)=3,
\qquad
y'(2)=-2.
$$

Because:

$$
a_0=y(2),
\qquad
a_1=y'(2),
$$

the conditions give immediately:

$$
a_0=3,
\qquad
a_1=-2.
$$

Substitute these values into the general series:

$$
\boxed{
y(x)
=3+\frac32(x-2)^2-\frac18(x-2)^4
-2(x-2)+\cdots
}.
$$

Reordering by increasing power gives:

$$
y(x)
=3-2(x-2)+\frac32(x-2)^2-\frac18(x-2)^4+\cdots.
$$

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

For a centre $x_0$, set $t=x-x_0$, substitute $x=t+x_0$ throughout the
equation, solve near $t=0$, and finally replace $t$ by $x-x_0$. Initial values
given at the centre become $a_0$ and $a_1$ directly.

</details>

---

## Block 7: A Direct Taylor Method For Initial-Value Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to calculate a few terms of an IVP solution by finding successive
derivatives at the initial point.

</details>

<details open>
<summary><strong>The Taylor Formula At The Initial Point</strong></summary>

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

</details>

<details open>
<summary><strong>A Four-Term IVP Calculation</strong></summary>

Find the Taylor polynomial through degree four for the solution of:

$$
y''=xy'-2y+x^2,
\qquad
y(1)=2,
\qquad
y'(1)=-1.
$$

The centre is $x_0=1$. We already know:

$$
y(1)=2,
\qquad
y'(1)=-1.
$$

</details>

<details open>
<summary><strong>Find The Second Derivative</strong></summary>

Use the differential equation itself:

$$
y''=xy'-2y+x^2.
$$

Set $x=1$, $y(1)=2$, and $y'(1)=-1$:

$$
\begin{aligned}
y''(1)
&=(1)(-1)-2(2)+1^2\\
&=-1-4+1\\
&=-4.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Find The Third Derivative</strong></summary>

Differentiate every term in:

$$
y''=xy'-2y+x^2.
$$

The product rule gives $(xy')'=y'+xy''$. Therefore:

$$
\begin{aligned}
y'''
&=y'+xy''-2y'+2x\\
&=xy''-y'+2x.
\end{aligned}
$$

Set $x=1$, $y''(1)=-4$, and $y'(1)=-1$:

$$
\begin{aligned}
y'''(1)
&=(1)(-4)-(-1)+2(1)\\
&=-4+1+2\\
&=-1.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Find The Fourth Derivative</strong></summary>

Differentiate the simplified third-derivative equation:

$$
y'''=xy''-y'+2x.
$$

Apply the product rule to $xy''$:

$$
(xy'')'=y''+xy'''.
$$

Therefore:

$$
\begin{aligned}
y''''
&=y''+xy'''-y''+2\\
&=xy'''+2.
\end{aligned}
$$

Set $x=1$ and $y'''(1)=-1$:

$$
\begin{aligned}
y''''(1)
&=(1)(-1)+2\\
&=1.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Build The Taylor Polynomial</strong></summary>

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

Thus the requested degree-four Taylor polynomial is:

$$
\boxed{
T_4(x)
=2-(x-1)-2(x-1)^2
-\frac16(x-1)^3
+\frac1{24}(x-1)^4
}.
$$

</details>

<details open>
<summary><strong>Recurrence Method Or Direct Taylor Method?</strong></summary>

Use coefficient matching when:

- a general recurrence is needed
- many terms are required
- the two arbitrary solution branches matter
- the structure of the entire series is the goal

Use repeated differentiation when:

- initial values are already given
- only the first few terms are required
- evaluating derivatives at the centre stays manageable

The direct Taylor method is efficient locally, but it may not reveal a clean
formula for the general coefficient $a_n$.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

For an IVP, successive differentiation of the differential equation can
generate $y''(x_0),y'''(x_0),\ldots$. Insert those values into the Taylor
formula and keep the factorial denominators visible.

</details>

---

## Block 8: A Reliable Workflow And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn power-series work into a repeatable sequence and identify
the index errors that most often corrupt a recurrence.

</details>

<details open>
<summary><strong>The Power-Series Workflow</strong></summary>

### Step 1: Choose and check the centre

Normalize the equation and confirm that the centre is ordinary. For a forced
equation, check the forcing as well.

### Step 2: Translate a nonzero centre

If the centre is $x_0\neq0$, use $t=x-x_0$ and replace every occurrence of
$x$ by $t+x_0$.

### Step 3: Write the series and derivatives

State $y$, $y'$, and $y''$ with their indices and lower limits.

### Step 4: Substitute before combining

Keep one sum for each differential-equation term until every multiplication
by $x$, $x^2$, or another series has been handled.

### Step 5: Align powers and lower limits

Reindex to a common power. Extract low-order terms when a sum starts later
than the others.

### Step 6: Match coefficients

For a homogeneous equation, match each coefficient to zero. For a forced
equation, match it to the corresponding coefficient on the right.

### Step 7: Solve for the highest-index coefficient

State both the recurrence and the values of $n$ for which it is valid.

### Step 8: Generate enough coefficients

Show each substitution until the pattern is unmistakable. Keep even and odd
chains separate when the recurrence advances by two.

### Step 9: Apply conditions and reconstruct

Insert the coefficients into the original series and return from any shifted
variable to $x$.

### Step 10: Check the requested order

If terms through $x^m$ are requested, calculate every coefficient through
$a_m$, including coefficients that turn out to be zero.

</details>

<details open>
<summary><strong>Common Mistake: Matching Different Powers</strong></summary>

The sums:

$$
\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}
\quad\text{and}\quad
\sum_{n=0}^{\infty}a_nx^n
$$

cannot be combined as written because one uses $x^{n-2}$ and the other uses
$x^n$. Reindex the first sum:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n.
$$

Only then do corresponding coefficients refer to the same power.

</details>

<details open>
<summary><strong>Common Mistake: Ignoring The Lower Limit</strong></summary>

For:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n,
$$

changing the lower limit to $0$ would introduce $a_{-1}$, which has not been
defined.

Either preserve the lower limit $1$ and separate the constant term, or
explicitly define a temporary zero coefficient. The first route is usually
clearer for learners.

</details>

<details open>
<summary><strong>Common Mistake: Hiding The Recurrence Domain</strong></summary>

A formula involving $a_{n-1}$ may be valid only for $n\geq1$ or $n\geq2$.
Applying it at $n=0$ can create an undefined coefficient or miss a nonzero
forcing term.

Write the range beside the recurrence:

$$
a_{n+2}=\cdots,
\qquad n\geq2.
$$

Then solve the exceptional powers separately.

</details>

<details open>
<summary><strong>Common Mistake: Losing A Free Constant</strong></summary>

A second-order homogeneous equation should normally retain two free
coefficients. If a recurrence advancing by two is calculated only from
$a_0$, the odd branch beginning with $a_1$ has been omitted.

Write both chains:

$$
a_0\to a_2\to a_4\to\cdots,
\qquad
a_1\to a_3\to a_5\to\cdots.
$$

</details>

<details open>
<summary><strong>Common Mistake: Returning To The Wrong Variable</strong></summary>

If $t=x-x_0$, then a term $a_3t^3$ becomes:

$$
a_3(x-x_0)^3,
$$

not $a_3x^3$. Preserve the shifted power when returning to the original
variable.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Power-series algebra is reliable when powers, lower limits, recurrence ranges,
and free coefficients remain visible. Most errors come from combining sums
too early or using a recurrence outside its stated domain.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Foundations And A First Solution</strong></summary>

### Problem 1: Reindex Two Derivatives

Starting from:

$$
y=\sum_{n=0}^{\infty}a_nx^n,
$$

derive formulas for $y'$ and $y''$ in powers of $x^n$. Check the first two
terms of each result.

### Problem 2: Classify Two Points

For:

$$
(4-x)y''+(1+x)y'+e^xy=0,
$$

classify $x=0$ and $x=4$ as ordinary or singular points.

### Problem 3: Derive And Use A Four-Step Recurrence

Find the recurrence and the first three nonzero terms in each solution branch
near $x=0$ for:

$$
y''+x^2y=0.
$$

### Problem 4: Apply Initial Values To A Known Recurrence

Use the recurrence:

$$
a_{n+2}=-\frac{a_n}{n+1},
\qquad n\geq0,
$$

to find the series through $x^5$ satisfying:

$$
y''+xy'+2y=0,
\qquad
y(0)=2,
\qquad
y'(0)=-1.
$$

</details>

<details open>
<summary><strong>Problems 5 To 8: Forcing And Shifted Centres</strong></summary>

### Problem 5: Separate A Missing Low-Power Term

Find a recurrence and write the general solution through $x^6$ for:

$$
y''-xy=0
$$

near $x=0$.

### Problem 6: Match A Polynomial Forcing

For:

$$
y''+y=x^2,
$$

find $a_2,a_3,a_4,$ and $a_5$ in terms of the arbitrary coefficients $a_0$
and $a_1$.

### Problem 7: Translate To A New Centre

Set $t=x+1$ and find the series through degree six near $x=-1$ for:

$$
y''+(x+1)y=0.
$$

Leave the two arbitrary coefficients visible.

### Problem 8: Use Conditions At A Shifted Centre

Find the series through degree four near $x=1$ for:

$$
y''+(x-1)y'-y=0,
\qquad
y(1)=2,
\qquad
y'(1)=3.
$$

</details>

<details open>
<summary><strong>Problems 9 To 12: Taylor Data And Error Diagnosis</strong></summary>

### Problem 9: Build A Taylor Polynomial Directly

Use repeated differentiation to find the degree-four Taylor polynomial about
$x=0$ for:

$$
y''=y'+xy,
\qquad
y(0)=1,
\qquad
y'(0)=2.
$$

### Problem 10: Confirm The Same Polynomial By Recurrence

For the IVP in Problem 9, derive a coefficient recurrence and verify the
coefficients through $a_4$.

### Problem 11: Diagnose Four Series Errors

Explain the error in each statement.

1. Since $y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}$, its coefficient of
   $x^n$ is $n(n-1)a_n$.
2. The identity $xy=\sum_{n=0}^{\infty}a_{n-1}x^n$ is valid without any
   additional definition.
3. A recurrence containing $a_{n-1}$ can always be evaluated at $n=0$.
4. A second-order homogeneous series containing only $a_0$ is automatically
   the general solution.

### Problem 12: Evaluate A Truncated Series

Use the degree-five series from Problem 4 to approximate $y(0.2)$. Keep at
least six decimal places during the calculation.

</details>

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Differentiate:

$$
y'=\sum_{n=1}^{\infty}na_nx^{n-1}.
$$

Replace the old index $n$ by $n+1$ so the power becomes $x^n$:

$$
\boxed{
y'=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n
}.
$$

Its first two terms are:

$$
n=0:\ a_1,
\qquad
n=1:\ 2a_2x.
$$

Differentiate a second time:

$$
y''=\sum_{n=2}^{\infty}n(n-1)a_nx^{n-2}.
$$

Replace the old index by $n+2$:

$$
\boxed{
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
}.
$$

Its first two terms are:

$$
n=0:\ 2a_2,
\qquad
n=1:\ 6a_3x.
$$

These agree with direct differentiation of
$a_0+a_1x+a_2x^2+a_3x^3+\cdots$.

### Answer 2

Divide by the leading coefficient $4-x$:

$$
y''+\frac{1+x}{4-x}y'
+\frac{e^x}{4-x}y=0.
$$

Thus:

$$
P(x)=\frac{1+x}{4-x},
\qquad
Q(x)=\frac{e^x}{4-x}.
$$

At $x=0$, the denominator is:

$$
4-0=4\neq0.
$$

Both normalized coefficients are analytic near $0$, so:

$$
\boxed{x=0\text{ is an ordinary point}.}
$$

At $x=4$, the denominator is zero. Both normalized coefficients fail to be
analytic there, so:

$$
\boxed{x=4\text{ is a singular point}.}
$$

### Answer 3

Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
$$

and:

$$
x^2y=\sum_{n=2}^{\infty}a_{n-2}x^n.
$$

Substitute into $y''+x^2y=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
+\sum_{n=2}^{\infty}a_{n-2}x^n=0.
$$

The second sum has no constant or linear term. Match those powers from the
first sum:

$$
2a_2=0,
\qquad
6a_3=0.
$$

Therefore:

$$
a_2=0,
\qquad
a_3=0.
$$

For $n\geq2$:

$$
(n+2)(n+1)a_{n+2}+a_{n-2}=0.
$$

Solve for the highest-index coefficient:

$$
\boxed{
a_{n+2}
=-\frac{a_{n-2}}{(n+2)(n+1)},
\qquad n\geq2
}.
$$

Set $n=2$ and then $n=6$ for the branch beginning with $a_0$:

$$
\begin{aligned}
a_4&=-\frac{a_0}{(4)(3)}=-\frac{a_0}{12},\\
a_8&=-\frac{a_4}{(8)(7)}=\frac{a_0}{672}.
\end{aligned}
$$

Set $n=3$ and then $n=7$ for the branch beginning with $a_1$:

$$
\begin{aligned}
a_5&=-\frac{a_1}{(5)(4)}=-\frac{a_1}{20},\\
a_9&=-\frac{a_5}{(9)(8)}=\frac{a_1}{1440}.
\end{aligned}
$$

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

### Answer 4

The initial conditions give:

$$
a_0=y(0)=2,
\qquad
a_1=y'(0)=-1.
$$

Use the recurrence with $n=0$:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{1}\\
&=-2.
\end{aligned}
$$

With $n=1$:

$$
\begin{aligned}
a_3
&=-\frac{a_1}{2}\\
&=\frac12.
\end{aligned}
$$

With $n=2$:

$$
\begin{aligned}
a_4
&=-\frac{a_2}{3}\\
&=\frac23.
\end{aligned}
$$

With $n=3$:

$$
\begin{aligned}
a_5
&=-\frac{a_3}{4}\\
&=-\frac18.
\end{aligned}
$$

Insert the coefficients into the series:

$$
\boxed{
y(x)
=2-x-2x^2+\frac12x^3+\frac23x^4-\frac18x^5+\cdots
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Use:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
$$

and:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^n
$$

Substitute both series into $y''-xy=0$:

$$
\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n
-\sum_{n=1}^{\infty}a_{n-1}x^n=0.
$$

The constant term comes only from $y''$:

$$
2a_2=0,
\qquad
a_2=0.
$$

For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}-a_{n-1}=0.
$$

Therefore:

$$
\boxed{
a_{n+2}
=\frac{a_{n-1}}{(n+2)(n+1)},
\qquad n\geq1
}.
$$

Set $n=1$:

$$
a_3=\frac{a_0}{(3)(2)}=\frac{a_0}{6}.
$$

Set $n=2$:

$$
a_4=\frac{a_1}{(4)(3)}=\frac{a_1}{12}.
$$

Set $n=3$:

$$
a_5=\frac{a_2}{(5)(4)}=0.
$$

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

Thus, through degree six:

$$
\boxed{
y(x)
=a_0\left(1+\frac{x^3}{6}+\frac{x^6}{180}\right)
+a_1\left(x+\frac{x^4}{12}\right)+\cdots
}.
$$

### Answer 6

Write the forcing as a power series with coefficients:

$$
x^2=0+0x+1x^2+0x^3+\cdots.
$$

Substitution into $y''+y=x^2$ gives:

$$
\sum_{n=0}^{\infty}
\left[(n+2)(n+1)a_{n+2}+a_n\right]x^n=x^2.
$$

Match the constant coefficient:

$$
2a_2+a_0=0,
$$

so:

$$
\boxed{a_2=-\frac{a_0}{2}}.
$$

Match the coefficient of $x^1$:

$$
6a_3+a_1=0,
$$

so:

$$
\boxed{a_3=-\frac{a_1}{6}}.
$$

Match the coefficient of $x^2$, which is $1$ on the right:

$$
12a_4+a_2=1.
$$

Substitute $a_2=-a_0/2$:

$$
\begin{aligned}
12a_4-\frac{a_0}{2}&=1,\\
12a_4&=1+\frac{a_0}{2},\\
a_4&=\frac1{12}+\frac{a_0}{24}.
\end{aligned}
$$

Match the coefficient of $x^3$, which is zero on the right:

$$
20a_5+a_3=0.
$$

Substitute $a_3=-a_1/6$:

$$
\begin{aligned}
20a_5-\frac{a_1}{6}&=0,\\
a_5&=\frac{a_1}{120}.
\end{aligned}
$$

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

### Answer 7

Set:

$$
t=x+1.
$$

Then $x+1=t$, and translations preserve the first and second derivatives.
The equation becomes:

$$
y''+ty=0
$$

near $t=0$.

Substitute:

$$
y''=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}t^n
$$

and:

$$
ty=\sum_{n=1}^{\infty}a_{n-1}t^n.
$$

The constant term gives:

$$
2a_2=0,
\qquad
a_2=0.
$$

For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}+a_{n-1}=0,
$$

so:

$$
a_{n+2}
=-\frac{a_{n-1}}{(n+2)(n+1)}.
$$

Calculate the needed coefficients:

$$
\begin{aligned}
a_3&=-\frac{a_0}{6},\\
a_4&=-\frac{a_1}{12},\\
a_5&=-\frac{a_2}{20}=0,\\
a_6&=-\frac{a_3}{30}=\frac{a_0}{180}.
\end{aligned}
$$

Thus:

$$
y(t)
=a_0\left(1-\frac{t^3}{6}+\frac{t^6}{180}\right)
+a_1\left(t-\frac{t^4}{12}\right)+\cdots.
$$

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

### Answer 8

Set:

$$
t=x-1.
$$

The equation becomes:

$$
y''+ty'-y=0.
$$

Its recurrence is:

$$
a_{n+2}
=\frac{1-n}{(n+2)(n+1)}a_n,
\qquad n\geq0.
$$

The initial conditions at the centre give:

$$
a_0=y(1)=2,
\qquad
a_1=y'(1)=3.
$$

Set $n=0$:

$$
\begin{aligned}
a_2
&=\frac{1}{(2)(1)}a_0\\
&=1.
\end{aligned}
$$

Set $n=1$:

$$
a_3=\frac{0}{(3)(2)}a_1=0.
$$

Set $n=2$:

$$
\begin{aligned}
a_4
&=\frac{-1}{(4)(3)}a_2\\
&=-\frac1{12}.
\end{aligned}
$$

With $a_0=2$, $a_1=3$, $a_2=1$, $a_3=0$, and $a_4=-1/12$, the
degree-four series in $t$ is:

$$
y(t)=2+3t+t^2-\frac1{12}t^4+\cdots.
$$

Replace $t$ by $x-1$:

$$
\boxed{
y(x)
=2+3(x-1)+(x-1)^2-\frac1{12}(x-1)^4+\cdots
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

The initial values are:

$$
y(0)=1,
\qquad
y'(0)=2.
$$

Use the differential equation:

$$
y''=y'+xy.
$$

Set $x=0$:

$$
\begin{aligned}
y''(0)
&=y'(0)+0\cdot y(0)\\
&=2.
\end{aligned}
$$

Differentiate the differential equation:

$$
\begin{aligned}
y'''
&=y''+(xy)'\\
&=y''+y+xy'.
\end{aligned}
$$

Set $x=0$:

$$
\begin{aligned}
y'''(0)
&=y''(0)+y(0)+0\cdot y'(0)\\
&=2+1\\
&=3.
\end{aligned}
$$

Differentiate again:

$$
\begin{aligned}
y''''
&=y'''+y'+(xy')'\\
&=y'''+y'+y'+xy''\\
&=y'''+2y'+xy''.
\end{aligned}
$$

Set $x=0$:

$$
\begin{aligned}
y''''(0)
&=y'''(0)+2y'(0)+0\cdot y''(0)\\
&=3+2(2)\\
&=7.
\end{aligned}
$$

Insert the derivatives into the Taylor formula:

$$
\begin{aligned}
T_4(x)
&=1+2x+\frac{2}{2!}x^2+\frac{3}{3!}x^3+\frac{7}{4!}x^4\\
&=1+2x+x^2+\frac12x^3+\frac7{24}x^4.
\end{aligned}
$$

Thus:

$$
\boxed{
T_4(x)=1+2x+x^2+\frac12x^3+\frac7{24}x^4
}.
$$

### Answer 10

Rewrite the equation as:

$$
y''-y'-xy=0.
$$

Use:

$$
\begin{aligned}
y''&=\sum_{n=0}^{\infty}(n+2)(n+1)a_{n+2}x^n,\\
y'&=\sum_{n=0}^{\infty}(n+1)a_{n+1}x^n,\\
xy&=\sum_{n=1}^{\infty}a_{n-1}x^n.
\end{aligned}
$$

The constant term gives:

$$
2a_2-a_1=0.
$$

Therefore:

$$
a_2=\frac{a_1}{2}.
$$

For $n\geq1$:

$$
(n+2)(n+1)a_{n+2}-(n+1)a_{n+1}-a_{n-1}=0.
$$

Solve for $a_{n+2}$:

$$
\boxed{
a_{n+2}
=\frac{(n+1)a_{n+1}+a_{n-1}}{(n+2)(n+1)},
\qquad n\geq1
}.
$$

The initial values give:

$$
a_0=1,
\qquad
a_1=2.
$$

Then:

$$
a_2=\frac{2}{2}=1.
$$

Set $n=1$:

$$
\begin{aligned}
a_3
&=\frac{2a_2+a_0}{(3)(2)}\\
&=\frac{2(1)+1}{6}\\
&=\frac12.
\end{aligned}
$$

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

Thus the recurrence gives:

$$
y(x)=1+2x+x^2+\frac12x^3+\frac7{24}x^4+\cdots,
$$

which agrees with the direct Taylor calculation.

### Answer 11

#### Statement 1

The expression $n(n-1)a_n$ multiplies $x^{n-2}$, not $x^n$. Reindexing gives
the coefficient of $x^n$ as:

$$
\boxed{(n+2)(n+1)a_{n+2}}.
$$

#### Statement 2

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

### Answer 12

From Answer 4, the degree-five approximation is:

$$
y(x)
\approx2-x-2x^2+\frac12x^3+\frac23x^4-\frac18x^5.
$$

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

Therefore:

$$
\boxed{y(0.2)\approx1.725027}.
$$

This is a truncated-series approximation, not an exact decimal value.

</details>

<details open>
<summary><strong>Chapter 27 Final Summary</strong></summary>

At an ordinary point, seek:

$$
y(x)=\sum_{n=0}^{\infty}a_n(x-x_0)^n.
$$

For a second-order equation, $a_0=y(x_0)$ and $a_1=y'(x_0)$ are the two
starting coefficients. Substitution, index alignment, and coefficient
matching determine the rest through a recurrence.

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

</details>
