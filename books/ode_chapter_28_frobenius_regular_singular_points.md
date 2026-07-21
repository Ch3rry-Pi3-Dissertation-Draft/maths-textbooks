# Frobenius Series Near Regular Singular Points

Chapter 27 built ordinary power-series solutions around ordinary points. At a
singular point, the same assumption can fail because the solution may begin
with a fractional or negative power rather than a constant term.

The method of Frobenius repairs the series by allowing an unknown leading
power:

$$
y(x)=x^r\sum_{n=0}^{\infty}a_nx^n.
$$

This chapter will:

- distinguish ordinary, regular singular, and irregular singular points
- explain why the extra exponent $r$ is needed
- derive the indicial equation from the lowest power
- construct two solutions when the indicial roots are suitably separated
- explain repeated roots, integer differences, logarithmic terms, and complex
  roots
- translate a regular singular point away from the origin
- build a reliable Frobenius workflow with locally checkable recurrences

---

## Block 1: Classifying A Singular Point

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide whether a singular point is mild enough for the
Frobenius method.

> a regular singular point permits controlled poles; an irregular singular
> point is more severe.

</details>

<details open>
<summary><strong>Start From Normalized Form</strong></summary>

Consider the homogeneous second-order equation:

$$
b_2(x)y''+b_1(x)y'+b_0(x)y=0.
$$

Where $b_2(x)\neq0$, divide by $b_2(x)$:

$$
\boxed{
y''+P(x)y'+Q(x)y=0
},
$$

with:

$$
P(x)=\frac{b_1(x)}{b_2(x)},
\qquad
Q(x)=\frac{b_0(x)}{b_2(x)}.
$$

Point classification must use $P$ and $Q$ after this normalization.

</details>

<details open>
<summary><strong>Three Possible Point Types</strong></summary>

At $x=x_0$:

1. The point is **ordinary** if $P$ and $Q$ are analytic at $x_0$.
2. It is **regular singular** if it is not ordinary, but both
   $(x-x_0)P(x)$ and $(x-x_0)^2Q(x)$ are analytic at $x_0$.
3. It is **irregular singular** if it is singular and at least one of those
   two corrected functions is still not analytic at $x_0$.

At the origin, the regular-singular test becomes:

$$
\boxed{
xP(x)\text{ and }x^2Q(x)\text{ must both be analytic at }0
}.
$$

This means $P$ may have at most a first-order pole and $Q$ may have at most a
second-order pole.

</details>

<details open>
<summary><strong>A Regular Singular Example</strong></summary>

Classify $x=0$ for:

$$
x^2y''+x(1+x)y'+(2+x)y=0.
$$

For $x\neq0$, divide by $x^2$:

$$
y''+\frac{1+x}{x}y'
+\frac{2+x}{x^2}y=0.
$$

Thus:

$$
P(x)=\frac{1+x}{x},
\qquad
Q(x)=\frac{2+x}{x^2}.
$$

<!-- print-page-break -->

Neither function is analytic at $0$, so the point is singular. Now apply the
regular-singular corrections:

$$
\begin{aligned}
xP(x)
&=x\left(\frac{1+x}{x}\right)\\
&=1+x,
\end{aligned}
$$

and:

$$
\begin{aligned}
x^2Q(x)
&=x^2\left(\frac{2+x}{x^2}\right)\\
&=2+x.
\end{aligned}
$$

Both corrected functions are polynomials, so:

$$
\boxed{x=0\text{ is a regular singular point}.}
$$

</details>

<details open>
<summary><strong>An Irregular Singular Example</strong></summary>

Classify $x=0$ for:

$$
x^3y''+(1+x)y'+y=0.
$$

For $x\neq0$, divide by $x^3$:

$$
y''+\frac{1+x}{x^3}y'
+\frac1{x^3}y=0.
$$

Thus:

$$
P(x)=\frac{1+x}{x^3},
\qquad
Q(x)=\frac1{x^3}.
$$

For this equation, $P(x)=(1+x)/x^3$. Multiply it by one power of $x$:

$$
xP(x)=\frac{1+x}{x^2}.
$$

This still has a pole at $0$, so it is not analytic there. The regular
singular test fails, and:

$$
\boxed{x=0\text{ is an irregular singular point}.}
$$

It is unnecessary to test $x^2Q(x)$ once one required condition has failed,
although here $x^2Q(x)=1/x$ also fails.

</details>

<details open>
<summary><strong>Ordinary Does Not Mean Regular Singular</strong></summary>

For:

$$
(1+x)y''+xy'+3y=0,
$$

the leading coefficient is $1$ at $x=0$. After normalization:

$$
P(x)=\frac{x}{1+x},
\qquad
Q(x)=\frac3{1+x}.
$$

Both are analytic at $0$, so the point is ordinary. We do not relabel an
ordinary point as regular singular merely because $xP$ and $x^2Q$ are also
analytic.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Normalize first. If the point is singular, test $(x-x_0)P(x)$ and
$(x-x_0)^2Q(x)$. Frobenius theory applies to the regular singular case.

</details>

---

## Block 2: The Frobenius Form And Its Derivatives

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see exactly how the Frobenius assumption differs from an
ordinary power series and to derive its derivative formulas.

</details>

<details open>
<summary><strong>Why An Ordinary Series May Be Too Restrictive</strong></summary>

The Euler equation:

$$
x^2y''-\frac12xy'-\frac32y=0
$$

has solutions $x^{3/2}$ and $x^{-1}$. Neither solution is an ordinary Taylor
series beginning with $x^0,x^1,x^2,\ldots$ at the origin.

The missing flexibility is the leading exponent. Frobenius introduces an
unknown $r$ so the series can begin at $x^r$.

</details>

<details open>
<summary><strong>The Frobenius Assumption</strong></summary>

Assume:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_nx^{n+r}
=x^r\sum_{n=0}^{\infty}a_nx^n
},
$$

where:

- $r$ is an exponent to be determined
- $a_0\neq0$ so that $x^r$ is genuinely the leading power
- $a_1,a_2,\ldots$ are coefficients to be determined

Written term by term:

$$
y=a_0x^r+a_1x^{r+1}+a_2x^{r+2}+\cdots.
$$

If $r=0$, this reduces to an ordinary power series.

</details>

<details open>
<summary><strong>Differentiate Term By Term</strong></summary>

Differentiate $a_nx^{n+r}$:

$$
\frac{d}{dx}\left(a_nx^{n+r}\right)
=(n+r)a_nx^{n+r-1}.
$$

Therefore:

$$
\boxed{
y'=\sum_{n=0}^{\infty}(n+r)a_nx^{n+r-1}
}.
$$

Differentiate one term of $y'$ again:

$$
\frac{d}{dx}
\left[(n+r)a_nx^{n+r-1}\right]
=(n+r)(n+r-1)a_nx^{n+r-2}.
$$

Hence:

$$
\boxed{
y''=\sum_{n=0}^{\infty}
(n+r)(n+r-1)a_nx^{n+r-2}
}.
$$

</details>

<details open>
<summary><strong>Check The Leading Terms</strong></summary>

From the expanded Frobenius series:

$$
y=a_0x^r+a_1x^{r+1}+a_2x^{r+2}+\cdots,
$$

the derivatives begin:

$$
\begin{aligned}
y'
&=ra_0x^{r-1}+(r+1)a_1x^r+(r+2)a_2x^{r+1}+\cdots,\\
y''
&=r(r-1)a_0x^{r-2}
+r(r+1)a_1x^{r-1}\\
&\quad +(r+1)(r+2)a_2x^r+\cdots.
\end{aligned}
$$

Setting $n=0,1,2$ in the summation formulas reproduces these terms.

</details>

<details open>
<summary><strong>The Natural Solution Interval</strong></summary>

If $r$ is fractional or complex, $x^r$ requires a branch choice. To keep the
real-valued discussion unambiguous, we usually work on:

$$
0<x<R.
$$

The singular centre itself need not belong to the solution interval. The
series describes behaviour as $x$ approaches the centre from within the
interval.[^frobenius-domain]

[^frobenius-domain]: Solutions on $x<0$ can also be studied, but fractional
    powers require additional sign or branch conventions. Restricting to
    $x>0$ lets us use $x^r=e^{r\ln x}$ consistently.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Frobenius replaces integer powers $x^n$ by shifted powers $x^{n+r}$. The
leading coefficient must satisfy $a_0\neq0$, while the equation determines
$r$ and the later coefficients.

</details>

---

## Block 3: The Indicial Equation And General Recurrence Shape

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to identify the special lowest-power equation that determines
$r$, and separate it from the recurrence for later coefficients.

</details>

<details open>
<summary><strong>Rewrite A Regular-Singular Equation</strong></summary>

At a regular singular point $x=0$, write the normalized equation as:

$$
y''+P(x)y'+Q(x)y=0.
$$

Define analytic functions:

$$
p(x)=xP(x),
\qquad
q(x)=x^2Q(x).
$$

Then multiply the differential equation by $x^2$:

$$
\boxed{
x^2y''+xp(x)y'+q(x)y=0
}.
$$

Because $p$ and $q$ are analytic at $0$, write:

$$
p(x)=\sum_{k=0}^{\infty}p_kx^k,
\qquad
q(x)=\sum_{k=0}^{\infty}q_kx^k.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Find The Lowest Power</strong></summary>

For the Frobenius series:

$$
y=\sum_{n=0}^{\infty}a_nx^{n+r},
$$

the three leading contributions are:

$$
\begin{aligned}
x^2y''&\supset r(r-1)a_0x^r,\\
xp(x)y'&\supset p_0ra_0x^r,\\
q(x)y&\supset q_0a_0x^r.
\end{aligned}
$$

Therefore the coefficient of the lowest power $x^r$ is:

$$
\left[r(r-1)+p_0r+q_0\right]a_0.
$$

Set it equal to zero:

$$
\left[r(r-1)+p_0r+q_0\right]a_0=0.
$$

Since $a_0\neq0$, divide by $a_0$:

$$
\boxed{
r(r-1)+p_0r+q_0=0
}.
$$

This quadratic equation is the **indicial equation**.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Why We Do Not Choose A Zero</strong></summary>

The lowest-power equation is a product:

$$
I(r)a_0=0,
$$

where:

$$
I(r)=r(r-1)+p_0r+q_0.
$$

Choosing $a_0=0$ would remove the assumed leading term and make a later
coefficient the true starting coefficient. Frobenius instead keeps
$a_0\neq0$ and requires:

$$
I(r)=0.
$$

The roots of $I(r)$ are the indicial roots.

</details>

<details open>
<summary><strong>The General Later-Coefficient Equation</strong></summary>

Let:

$$
I(s)=s(s-1)+p_0s+q_0.
$$

After the lowest power, the coefficient of $x^{n+r}$ for $n\geq1$ has the
form:

$$
\boxed{
I(n+r)a_n
+\sum_{k=1}^{n}
\left[p_k(n-k+r)+q_k\right]a_{n-k}=0
}.
$$

The first term contains the new coefficient $a_n$. The finite sum contains
earlier coefficients $a_0,\ldots,a_{n-1}$.

Before isolating $a_n$, keep the complete coefficient equation in view:

$$
I(n+r)a_n
+\sum_{k=1}^{n}
\left[p_k(n-k+r)+q_k\right]a_{n-k}=0.
$$

When $I(n+r)\neq0$, subtract the finite sum and divide by $I(n+r)$:

$$
a_n
 =-\frac{\sum_{k=1}^{n}[p_k(n-k+r)+q_k]a_{n-k}}
{I(n+r)}.
$$

This general formula is useful for structure, but in worked examples it is
usually clearer to substitute the specific series and simplify directly.

</details>

<details open>
<summary><strong>The Denominator Warning</strong></summary>

The recurrence requires division by $I(n+r)$. If:

$$
I(n+r)=0
$$

for some positive integer $n$, the recurrence may fail to determine $a_n$.
This is the obstruction that can occur when the two indicial roots differ by
an integer.

Do not cancel or divide by a recurrence factor until checking whether it can
be zero for the chosen root and allowed indices.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

The coefficient of the lowest power gives the indicial equation. Later powers
give a recurrence, whose denominator must be checked for zero before it is
used.

</details>

---

## Block 4: Two Distinct Roots With A Noninteger Difference

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to construct two Frobenius solutions when both indicial roots can
be used without an obstruction.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>The Problem And Point Check</strong></summary>

Solve near $x=0$ on $x>0$:

$$
x^2y''+\frac12xy'+\left(x-\frac32\right)y=0.
$$

After division by $x^2$:

$$
y''+\frac1{2x}y'
+\left(\frac1x-\frac{3}{2x^2}\right)y=0.
$$

Thus:

$$
P(x)=\frac1{2x},
\qquad
Q(x)=\frac1x-\frac{3}{2x^2}.
$$

Apply the regular-singular corrections:

$$
xP(x)=\frac12,
$$

and:

$$
x^2Q(x)=x-\frac32.
$$

Both are analytic at $0$, so the origin is regular singular.

</details>

<details open>
<summary><strong>Substitute The Frobenius Series</strong></summary>

Use:

$$
\begin{aligned}
y&=\sum_{n=0}^{\infty}a_nx^{n+r},\\
y'&=\sum_{n=0}^{\infty}(n+r)a_nx^{n+r-1},\\
y''&=\sum_{n=0}^{\infty}(n+r)(n+r-1)a_nx^{n+r-2}.
\end{aligned}
$$

Multiply the derivative series by their equation coefficients:

$$
x^2y''
=\sum_{n=0}^{\infty}(n+r)(n+r-1)a_nx^{n+r},
$$

$$
\frac12xy'
=\sum_{n=0}^{\infty}\frac12(n+r)a_nx^{n+r},
$$

and:

$$
-\frac32y
=\sum_{n=0}^{\infty}-\frac32a_nx^{n+r}.
$$

The remaining term is:

$$
xy=\sum_{n=0}^{\infty}a_nx^{n+r+1}.
$$

Reindex it by replacing the old index with $n-1$:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^{n+r}.
$$

</details>

<details open>
<summary><strong>Derive The Indicial Equation</strong></summary>

The term $xy$ has no contribution to the lowest power $x^r$. The coefficient
of $x^r$ from the other three terms is:

$$
\left[r(r-1)+\frac12r-\frac32\right]a_0.
$$

Keep $a_0\neq0$ and set the bracket equal to zero:

$$
r(r-1)+\frac12r-\frac32=0.
$$

Expand:

$$
r^2-\frac12r-\frac32=0.
$$

Factor:

$$
\left(r-\frac32\right)(r+1)=0.
$$

Therefore the indicial roots are:

$$
\boxed{
r_1=\frac32,
\qquad
r_2=-1
}.
$$

Their difference is:

$$
r_1-r_2=\frac32-(-1)=\frac52,
$$

which is not an integer. We expect two independent Frobenius series.

</details>

<details open>
<summary><strong>Derive The Recurrence</strong></summary>

For $n\geq1$, the coefficient of $x^{n+r}$ is:

$$
\left[(n+r)(n+r-1)+\frac12(n+r)-\frac32\right]a_n
+a_{n-1}=0.
$$

Define:

$$
I(s)=s^2-\frac12s-\frac32
=\left(s-\frac32\right)(s+1).
$$

Then the recurrence is:

$$
I(n+r)a_n+a_{n-1}=0.
$$

Solve for $a_n$:

$$
\boxed{
a_n=-\frac{a_{n-1}}{I(n+r)},
\qquad n\geq1
}.
$$

</details>

<details open>
<summary><strong>Use The Larger Root</strong></summary>

Set $r=3/2$. Then:

$$
\begin{aligned}
I\left(n+\frac32\right)
&=\left(n+\frac32-\frac32\right)
\left(n+\frac32+1\right)\\
&=n\left(n+\frac52\right).
\end{aligned}
$$

Therefore:

$$
a_n=-\frac{a_{n-1}}{n(n+5/2)}.
$$

Set $n=1$:

$$
\begin{aligned}
a_1
&=-\frac{a_0}{1(7/2)}\\
&=-\frac27a_0.
\end{aligned}
$$

For the next coefficient, return to
$a_n=-a_{n-1}/[n(n+5/2)]$ and set $n=2$:

$$
\begin{aligned}
a_2
&=-\frac{a_1}{2(9/2)}\\
&=-\frac{-2a_0/7}{9}\\
&=\frac2{63}a_0.
\end{aligned}
$$

The first solution is:

$$
\boxed{
y_1(x)
=x^{3/2}\left(1-\frac27x+\frac2{63}x^2+\cdots\right)
}.
$$

The scale $a_0$ has been absorbed into the arbitrary constant that will
multiply $y_1$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Use The Smaller Root</strong></summary>

Set $r=-1$. Then:

$$
\begin{aligned}
I(n-1)
&=\left(n-1-\frac32\right)(n-1+1)\\
&=n\left(n-\frac52\right).
\end{aligned}
$$

Therefore:

$$
a_n=-\frac{a_{n-1}}{n(n-5/2)}.
$$

Set $n=1$:

$$
\begin{aligned}
a_1
&=-\frac{a_0}{1(-3/2)}\\
&=\frac23a_0.
\end{aligned}
$$

Set $n=2$:

$$
\begin{aligned}
a_2
&=-\frac{a_1}{2(-1/2)}\\
&=a_1\\
&=\frac23a_0.
\end{aligned}
$$

Set $n=3$:

$$
\begin{aligned}
a_3
&=-\frac{a_2}{3(1/2)}\\
&=-\frac{2}{3}a_2\\
&=-\frac49a_0.
\end{aligned}
$$

The second solution is:

$$
\boxed{
y_2(x)
=x^{-1}\left(1+\frac23x+\frac23x^2-\frac49x^3+\cdots\right)
}.
$$

</details>

<details open>
<summary><strong>Assemble The General Solution</strong></summary>

The two indicial roots differ by a noninteger, so both Frobenius solutions are
available and linearly independent. Therefore:

$$
\boxed{
\begin{aligned}
y(x)
={}&c_1x^{3/2}
\left(1-\frac27x+\frac2{63}x^2+\cdots\right)\\
&+c_2x^{-1}
\left(1+\frac23x+\frac23x^2-\frac49x^3+\cdots\right),
\qquad x>0.
\end{aligned}
}
$$

The two leading behaviours, $x^{3/2}$ and $x^{-1}$, are already different
enough to show that neither solution is a constant multiple of the other.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

When distinct real indicial roots differ by a noninteger, substitute each root
into the recurrence. Each root produces one Frobenius series, and their linear
combination gives the general solution.

</details>

---

## Block 5: Repeated Roots And Logarithmic Partners

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand why one repeated indicial root may produce only one
ordinary Frobenius series and why a logarithm supplies the missing independent
solution.

</details>

<details open>
<summary><strong>A Repeated-Root Equation</strong></summary>

Solve on $x>0$:

$$
x^2y''-3xy'+4y=0.
$$

After normalization:

$$
y''-\frac3x y'+\frac4{x^2}y=0.
$$

Thus:

$$
xP(x)=-3,
\qquad
x^2Q(x)=4.
$$

Both corrected functions are analytic, so $x=0$ is regular singular.

</details>

<details open>
<summary><strong>Find The Indicial Equation</strong></summary>

Substitute:

$$
y=\sum_{n=0}^{\infty}a_nx^{n+r}.
$$

The three equation terms become:

$$
\begin{aligned}
x^2y''
&=\sum_{n=0}^{\infty}(n+r)(n+r-1)a_nx^{n+r},\\
-3xy'
&=\sum_{n=0}^{\infty}-3(n+r)a_nx^{n+r},\\
4y
&=\sum_{n=0}^{\infty}4a_nx^{n+r}.
\end{aligned}
$$

Combine the coefficients:

$$
\sum_{n=0}^{\infty}
\left[(n+r)(n+r-1)-3(n+r)+4\right]a_nx^{n+r}=0.
$$

For the lowest power, set $n=0$:

$$
\left[r(r-1)-3r+4\right]a_0=0.
$$

Since $a_0\neq0$:

$$
r(r-1)-3r+4=0.
$$

Simplify and factor:

$$
\begin{aligned}
r^2-4r+4&=0,\\
(r-2)^2&=0.
\end{aligned}
$$

The indicial root is repeated:

$$
\boxed{r_1=r_2=2}.
$$

</details>

<details open>
<summary><strong>Find The First Solution</strong></summary>

The coefficient bracket can be rewritten as:

$$
(n+r-2)^2.
$$

Set $r=2$. For every $n\geq1$:

$$
n^2a_n=0.
$$

Since $n^2\neq0$ for $n\geq1$:

$$
a_n=0,
\qquad n\geq1.
$$

Only the leading coefficient remains:

$$
y_1(x)=a_0x^2.
$$

Absorb $a_0$ into the eventual arbitrary constant and choose:

$$
\boxed{y_1(x)=x^2}.
$$

</details>

<details open>
<summary><strong>Where The Logarithm Comes From</strong></summary>

For $x>0$:

$$
x^r=e^{r\ln x}.
$$

Differentiate with respect to the exponent $r$ while treating $x$ as fixed:

$$
\frac{\partial}{\partial r}x^r
=x^r\ln x.
$$

When two indicial roots merge, the second power $x^{r_2}$ no longer gives a
new direction. Differentiation with respect to the root parameter produces a
logarithmic partner. In this example:

$$
\boxed{y_2(x)=x^2\ln x}.
$$

This parameter explanation is intuition for the logarithm; the next section
verifies the proposed function directly.

</details>

<details open>
<summary><strong>Verify The Logarithmic Solution</strong></summary>

Let:

$$
y_2=x^2\ln x.
$$

Use the product rule:

$$
\begin{aligned}
y_2'
&=2x\ln x+x^2\left(\frac1x\right)\\
&=2x\ln x+x.
\end{aligned}
$$

Differentiate again:

$$
\begin{aligned}
y_2''
&=2\ln x+2x\left(\frac1x\right)+1\\
&=2\ln x+3.
\end{aligned}
$$

Using $y_2'=2x\ln x+x$ and $y_2''=2\ln x+3$, substitute into the
differential equation:

$$
\begin{aligned}
x^2y_2''-3xy_2'+4y_2
&=x^2(2\ln x+3)
-3x(2x\ln x+x)
+4x^2\ln x\\
&=(2-6+4)x^2\ln x
+(3-3)x^2\\
&=0.
\end{aligned}
$$

Thus $x^2\ln x$ is a solution.

</details>

<details open>
<summary><strong>Check Linear Independence</strong></summary>

Use:

$$
y_1=x^2,
\qquad
y_2=x^2\ln x.
$$

Their derivatives are:

$$
y_1'=2x,
\qquad
y_2'=2x\ln x+x.
$$

Calculate the Wronskian:

$$
\begin{aligned}
W[y_1,y_2]
&=y_1y_2'-y_2y_1'\\
&=x^2(2x\ln x+x)-x^2\ln x(2x)\\
&=2x^3\ln x+x^3-2x^3\ln x\\
&=x^3.
\end{aligned}
$$

For $x>0$, $x^3\neq0$, so the solutions are linearly independent.

</details>

<details open>
<summary><strong>The General Solution</strong></summary>

The two independent solutions are $x^2$ and $x^2\ln x$. Therefore:

$$
\boxed{
y(x)=c_1x^2+c_2x^2\ln x,
\qquad x>0
}.
$$

The logarithm is not an arbitrary decoration. It replaces the second power
solution lost when the indicial roots coincide.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A repeated indicial root usually gives one direct Frobenius series. A second
solution has the general shape:

$$
y_2=y_1\ln x+x^r\sum_{n=0}^{\infty}b_nx^n,
$$

although the additional series may vanish in a simple Euler equation.

</details>

---

## Block 6: Integer Differences And Recurrence Obstructions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to distinguish two facts that are often incorrectly merged:

- an integer root difference creates the possibility of a logarithm
- it does not force a logarithm in every equation

</details>

<details open>
<summary><strong>An Integer Difference With No Obstruction</strong></summary>

Consider:

$$
x^2y''-xy'=0.
$$

Substituting a leading power $y=x^r$ gives:

$$
\begin{aligned}
x^2[r(r-1)x^{r-2}]
-x[rx^{r-1}]&=0,\\
[r(r-1)-r]x^r&=0.
\end{aligned}
$$

The indicial equation is:

$$
r(r-1)-r=0.
$$

Factor:

$$
r(r-2)=0.
$$

Thus:

$$
r_1=2,
\qquad
r_2=0.
$$

The roots differ by the integer $2$, yet both power solutions work:

$$
y_1=x^2,
\qquad
y_2=1.
$$

Therefore:

$$
\boxed{y=c_1x^2+c_2}.
$$

No logarithm is needed because the lower-root construction does not fail.

</details>

<details open>
<summary><strong>An Equation With An Obstructed Lower Root</strong></summary>

Consider:

$$
x^2y''+xy'+(9x^2-1)y=0.
$$

After normalization:

$$
P(x)=\frac1x,
\qquad
Q(x)=9-\frac1{x^2}.
$$

Since:

$$
xP(x)=1,
\qquad
x^2Q(x)=9x^2-1,
$$

the origin is regular singular.

</details>

<details open>
<summary><strong>Derive The Indicial Equation And Recurrence</strong></summary>

For the Frobenius series, the terms $x^2y''+xy'-y$ combine as:

$$
\sum_{n=0}^{\infty}
\left[(n+r)^2-1\right]a_nx^{n+r}.
$$

The remaining term is:

$$
9x^2y
=9\sum_{n=0}^{\infty}a_nx^{n+r+2}
=9\sum_{n=2}^{\infty}a_{n-2}x^{n+r}.
$$

The lowest-power equation is:

$$
(r^2-1)a_0=0.
$$

Since $a_0\neq0$, the indicial equation is:

$$
r^2-1=0.
$$

Thus:

$$
\boxed{r_1=1,
\qquad
r_2=-1}.
$$

The coefficient of $x^{r+1}$ gives:

$$
\left[(r+1)^2-1\right]a_1=0.
$$

For $n\geq2$:

$$
\boxed{
\left[(n+r)^2-1\right]a_n+9a_{n-2}=0
}.
$$

</details>

<details open>
<summary><strong>Construct The Larger-Root Solution</strong></summary>

Set $r=1$. The $n=1$ equation becomes:

$$
[(2)^2-1]a_1=0,
$$

so:

$$
3a_1=0,
\qquad
a_1=0.
$$

For $n\geq2$, substitute $r=1$:

$$
[(n+1)^2-1]a_n+9a_{n-2}=0.
$$

Factor the bracket:

$$
(n+1)^2-1=n(n+2).
$$

Therefore:

$$
a_n=-\frac9{n(n+2)}a_{n-2}.
$$

Set $n=2$:

$$
\begin{aligned}
a_2
&=-\frac9{(2)(4)}a_0\\
&=-\frac98a_0.
\end{aligned}
$$

Set $n=4$:

$$
\begin{aligned}
a_4
&=-\frac9{(4)(6)}a_2\\
&=-\frac38\left(-\frac98a_0\right)\\
&=\frac{27}{64}a_0.
\end{aligned}
$$

Thus one solution is:

$$
\boxed{
y_1(x)=x\left(1-\frac98x^2+\frac{27}{64}x^4+\cdots\right)
}.
$$

</details>

<details open>
<summary><strong>Watch The Smaller Root Fail Locally</strong></summary>

Now set $r=-1$. The $n=1$ equation is:

$$
[(0)^2-1]a_1=0,
$$

so:

$$
-a_1=0,
\qquad
a_1=0.
$$

Next use the $n=2$ equation:

$$
\left[(2-1)^2-1\right]a_2+9a_0=0.
$$

Simplify its coefficient of $a_2$:

$$
[(1)^2-1]a_2+9a_0=0,
$$

so:

$$
0\cdot a_2+9a_0=0.
$$

This would require $a_0=0$, contradicting the Frobenius assumption
$a_0\neq0$. The lower root therefore does not produce a second pure
Frobenius series.

The second solution instead has the structure:

$$
\boxed{
y_2(x)=C y_1(x)\ln x
+x^{-1}\sum_{n=0}^{\infty}b_nx^n
}.
$$

The constant $C$ and coefficients $b_n$ require an extended calculation. The
important diagnosis here is the exact line at which the pure recurrence
becomes inconsistent.

</details>

<details open>
<summary><strong>The Integer-Difference Decision</strong></summary>

If $r_1-r_2=N$ is a positive integer:

1. Use the larger root $r_1$ first; it produces a Frobenius solution.
2. Try the smaller root $r_2$ in the recurrence.
3. If every required division remains valid, the smaller root gives a second
   pure Frobenius solution.
4. If a denominator vanishes and leaves an inconsistent equation, the second
   solution contains a logarithmic term.

Do not decide whether a logarithm appears from the root difference alone.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An integer difference is a warning to inspect the smaller-root recurrence. A
zero denominator may be harmless, may leave a free coefficient, or may create
an obstruction. The actual coefficient equation determines the outcome.

</details>

---

## Block 7: Complex Roots And Shifted Singular Centres

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret complex indicial roots as real oscillations in
$\ln x$ and translate a regular singular point that is not at the origin.

</details>

<details open>
<summary><strong>A Complex-Root Euler Equation</strong></summary>

Consider:

$$
x^2y''+xy'+4y=0,
\qquad x>0.
$$

Try $y=x^r$. Then:

$$
\begin{aligned}
x^2y''+xy'+4y
&=[r(r-1)+r+4]x^r\\
&=(r^2+4)x^r.
\end{aligned}
$$

The indicial equation is:

$$
r^2+4=0,
$$

with roots:

$$
r=\pm2i.
$$

</details>

<details open>
<summary><strong>Convert Complex Powers To Real Functions</strong></summary>

For $x>0$:

$$
x^{2i}=e^{2i\ln x}.
$$

Euler's formula gives:

$$
e^{2i\ln x}
=\cos(2\ln x)+i\sin(2\ln x).
$$

The conjugate power $x^{-2i}$ supplies the same real and imaginary parts.
Therefore two real solutions are:

$$
\cos(2\ln x)
\qquad\text{and}\qquad
\sin(2\ln x).
$$

The general real solution is:

$$
\boxed{
y(x)=c_1\cos(2\ln x)+c_2\sin(2\ln x),
\qquad x>0
}.
$$

The oscillation occurs in logarithmic position rather than in $x$ itself.

</details>

<details open>
<summary><strong>Verify One Logarithmic Oscillation</strong></summary>

Let:

$$
y=\cos(2\ln x).
$$

Differentiate using the chain rule:

$$
y'=-\frac2x\sin(2\ln x).
$$

Differentiate again using the product rule:

$$
\begin{aligned}
y''
&=\frac2{x^2}\sin(2\ln x)
-\frac4{x^2}\cos(2\ln x).
\end{aligned}
$$

Substitute:

$$
\begin{aligned}
x^2y''+xy'+4y
&=[2\sin(2\ln x)-4\cos(2\ln x)]\\
&\quad -2\sin(2\ln x)+4\cos(2\ln x)\\
&=0.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Translate A Singular Centre</strong></summary>

Solve near $x=2$:

$$
(x-2)^2y''+2(x-2)y'-2y=0.
$$

Set:

$$
t=x-2.
$$

Because this is a translation, $dy/dx=dy/dt$ and
$d^2y/dx^2=d^2y/dt^2$. The equation becomes:

$$
t^2y''+2ty'-2y=0
$$

near $t=0$.

</details>

<details open>
<summary><strong>Solve And Return To X</strong></summary>

Try $y=t^r$. Then:

$$
\begin{aligned}
t^2y''+2ty'-2y
&=[r(r-1)+2r-2]t^r.
\end{aligned}
$$

The indicial equation is:

$$
r(r-1)+2r-2=0.
$$

Simplify and factor:

$$
\begin{aligned}
r^2+r-2&=0,\\
(r-1)(r+2)&=0.
\end{aligned}
$$

Solving $(r-1)(r+2)=0$ gives:

$$
r_1=1,
\qquad
r_2=-2.
$$

Both Euler powers work, so in the translated variable:

$$
y(t)=c_1t+c_2t^{-2}.
$$

Return to $t=x-2$:

$$
\boxed{
y(x)=c_1(x-2)+c_2(x-2)^{-2}
}.
$$

For a real solution using these powers without crossing the singular point,
choose an interval such as $x>2$ or $x<2$.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Complex roots $\alpha\pm i\beta$ lead to real factors
$x^\alpha\cos(\beta\ln x)$ and
$x^\alpha\sin(\beta\ln x)$. A nonzero singular centre is translated to the
origin with $t=x-x_0$ before applying the same analysis.

</details>

---

## Block 8: A Reliable Workflow And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to keep point classification, lowest-power matching, recurrence
construction, and root-case decisions in a dependable order.

</details>

<details open>
<summary><strong>The Frobenius Workflow</strong></summary>

### Step 1: Normalize and classify the centre

Calculate $P$ and $Q$. If the point is singular, test $(x-x_0)P$ and
$(x-x_0)^2Q$.

### Step 2: Translate a nonzero centre

Use $t=x-x_0$ and rewrite every coefficient in terms of $t$.

### Step 3: Simplify the equation before substituting

Clearing rational denominators often reduces the number of series products.

### Step 4: Write all three Frobenius series

Use:

$$
\begin{aligned}
y&=\sum_{n=0}^{\infty}a_nx^{n+r},\\
y'&=\sum_{n=0}^{\infty}(n+r)a_nx^{n+r-1},\\
y''&=\sum_{n=0}^{\infty}(n+r)(n+r-1)a_nx^{n+r-2}.
\end{aligned}
$$

### Step 5: Align every term to powers of $x^{n+r}$

Show each index shift and preserve its lower limit.

### Step 6: Isolate the lowest power

Its coefficient times $a_0$ gives the indicial equation because
$a_0\neq0$.

### Step 7: Derive the later recurrence

State its valid range and inspect every denominator before dividing.

### Step 8: Order and compare the roots

Identify whether they are distinct with noninteger difference, repeated,
integer-separated, or complex conjugates.

### Step 9: Generate the available solution branches

For an integer difference, use the larger root first and test the smaller
root rather than assuming its outcome.

### Step 10: Reconstruct, state the domain, and verify

Restore the factor $x^r$, return from any translated variable, and keep the
solution interval away from the singular point.

</details>

<details open>
<summary><strong>Common Mistake: Setting R To Zero Automatically</strong></summary>

Using:

$$
y=\sum_{n=0}^{\infty}a_nx^n
$$

at a regular singular point assumes $r=0$ before the indicial equation has
been solved. This may discard fractional, negative, or complex leading
powers.

</details>

<details open>
<summary><strong>Common Mistake: Letting A Zero</strong></summary>

The Frobenius assumption requires $a_0\neq0$. If the lowest-power equation is:

$$
I(r)a_0=0,
$$

choose $I(r)=0$, not $a_0=0$. Otherwise the displayed leading term was not
actually the leading term.

</details>

<details open>
<summary><strong>Common Mistake: Mixing The Indicial Equation With The Recurrence</strong></summary>

The indicial equation comes from the single lowest power. The recurrence comes
from later powers. Combining them too early can hide exceptional equations
such as the separate $n=1$ condition in a two-step recurrence.

</details>

<details open>
<summary><strong>Common Mistake: Dividing Before Checking The Denominator</strong></summary>

Before using:

$$
a_n=-\frac{\text{earlier coefficients}}{I(n+r)},
$$

substitute the selected root and ask whether $I(n+r)=0$ for an allowed
positive integer $n$. A zero denominator is mathematical information, not an
algebraic inconvenience to cancel away.

</details>

<details open>
<summary><strong>Common Mistake: Assuming Every Integer Difference Creates A Log</strong></summary>

Integer-separated roots may produce two pure power or Frobenius solutions, as
in $x^2y''-xy'=0$. A logarithm is needed when the smaller-root construction is
obstructed, not merely because the difference is an integer.

</details>

<details open>
<summary><strong>Common Mistake: Dropping The Leading Power</strong></summary>

If the coefficient series is:

$$
a_0+a_1x+a_2x^2+\cdots,
$$

the Frobenius solution is:

$$
x^r(a_0+a_1x+a_2x^2+\cdots).
$$

The factor $x^r$ is part of every term and must remain in the final answer.

</details>

<details open>
<summary><strong>Common Mistake: Including The Singular Centre In The Interval</strong></summary>

A formula containing $x^{-1}$ or $\ln x$ is not defined at $x=0$. Write a
domain such as $0<x<R$ rather than claiming the solution is valid on an
interval containing the singular point.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Classify before expanding, derive the indicial equation before the recurrence,
inspect recurrence denominators before dividing, and let the relationship
between the roots determine how the second solution must be sought.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Classification And Indicial Equations</strong></summary>

### Problem 1: Classify Three Origins

Classify $x=0$ as ordinary, regular singular, or irregular singular for each
equation.

$$
\begin{aligned}
\text{(a)}\quad&x^2y''+x(2+x)y'+(1-x)y=0,\\
\text{(b)}\quad&x^4y''+xy'+y=0,\\
\text{(c)}\quad&(1+x^2)y''+xy'+e^xy=0.
\end{aligned}
$$

### Problem 2: Classify A Shifted Point

Determine whether $x=-1$ is a regular singular point of:

$$
(x+1)^2y''+(x+1)(2-x)y'+(3+x)y=0.
$$

### Problem 3: Differentiate A Frobenius Series

Starting from:

$$
y=\sum_{n=0}^{\infty}a_nx^{n+r},
$$

derive $y'$ and $y''$, then write the $n=0$ and $n=1$ terms of each
derivative.

### Problem 4: Use The General Indicial Formula

For a regular-singular equation with:

$$
p_0=3,
\qquad
q_0=-4,
$$

find the indicial equation and its roots.

</details>

<details open>
<summary><strong>Problems 5 To 8: Real Root Cases</strong></summary>

### Problem 5: Solve A Distinct-Root Euler Equation

Solve on $x>0$:

$$
x^2y''+2xy'-6y=0.
$$

### Problem 6: Generate A Larger-Root Series

For:

$$
x^2y''+2xy'+(x-2)y=0,
$$

find the indicial roots and use the larger root to calculate a Frobenius
solution through the term containing $x^4$.

### Problem 7: Solve A Repeated-Root Euler Equation

Solve on $x>0$:

$$
x^2y''+5xy'+4y=0.
$$

### Problem 8: Check An Integer Difference Without A Logarithm

Find the general solution of:

$$
x^2y''-3xy'+3y=0
$$

and explain why an integer difference between the roots causes no obstruction
here.

</details>

<details open>
<summary><strong>Problems 9 To 12: Obstructions, Complex Roots, And Shifts</strong></summary>

### Problem 9: Locate A Lower-Root Obstruction

For:

$$
x^2y''+xy'+(4x^2-4)y=0,
$$

derive the indicial roots and show exactly where the recurrence for the
smaller root becomes inconsistent.

### Problem 10: Convert Complex Roots To Real Solutions

Solve on $x>0$:

$$
x^2y''-xy'+5y=0.
$$

### Problem 11: Translate A Singular Centre

Solve near $x=-3$:

$$
(x+3)^2y''-2y=0.
$$

### Problem 12: Verify A Logarithmic Pair

For:

$$
x^2y''+3xy'+y=0,
$$

verify that $y_1=x^{-1}$ and $y_2=x^{-1}\ln x$ are solutions on $x>0$, and
calculate their Wronskian.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

#### Equation (a)

For $x\neq0$, divide by $x^2$:

$$
y''+\frac{2+x}{x}y'
+\frac{1-x}{x^2}y=0.
$$

Thus:

$$
P(x)=\frac{2+x}{x},
\qquad
Q(x)=\frac{1-x}{x^2}.
$$

The point is singular. Apply the corrected tests:

$$
xP(x)=2+x,
\qquad
x^2Q(x)=1-x.
$$

Both are analytic at $0$, so:

$$
\boxed{x=0\text{ is regular singular}.}
$$

<!-- print-page-break -->

#### Equation (b)

Divide by $x^4$:

$$
y''+\frac1{x^3}y'
+\frac1{x^4}y=0.
$$

Thus:

$$
xP(x)=\frac1{x^2},
\qquad
x^2Q(x)=\frac1{x^2}.
$$

Neither corrected coefficient is analytic at $0$, so:

$$
\boxed{x=0\text{ is irregular singular}.}
$$

#### Equation (c)

The leading coefficient at $0$ is:

$$
1+0^2=1\neq0.
$$

After normalization:

$$
P(x)=\frac{x}{1+x^2},
\qquad
Q(x)=\frac{e^x}{1+x^2}.
$$

Both are analytic at $0$, so:

$$
\boxed{x=0\text{ is ordinary}.}
$$

<!-- print-page-break -->

### Answer 2

Set:

$$
t=x+1.
$$

Then $x=t-1$ and $2-x=3-t$. The equation becomes:

$$
t^2y''+t(3-t)y'+(t+2)y=0.
$$

For $t\neq0$, normalize:

$$
y''+\frac{3-t}{t}y'
+\frac{t+2}{t^2}y=0.
$$

The corrected coefficients are:

$$
tP(t)=3-t,
\qquad
t^2Q(t)=t+2.
$$

Both are analytic at $t=0$. Therefore:

$$
\boxed{x=-1\text{ is a regular singular point}.}
$$

<!-- print-page-break -->

### Answer 3

Differentiate one term:

$$
\frac{d}{dx}(a_nx^{n+r})
=(n+r)a_nx^{n+r-1}.
$$

Therefore:

$$
\boxed{
y'=\sum_{n=0}^{\infty}(n+r)a_nx^{n+r-1}
}.
$$

Its first two terms are:

$$
ra_0x^{r-1}
+(r+1)a_1x^r.
$$

Differentiate again:

$$
\boxed{
y''=\sum_{n=0}^{\infty}
(n+r)(n+r-1)a_nx^{n+r-2}
}.
$$

Its first two terms are:

$$
r(r-1)a_0x^{r-2}
+r(r+1)a_1x^{r-1}.
$$

<!-- print-page-break -->

### Answer 4

The general indicial equation is:

$$
r(r-1)+p_0r+q_0=0.
$$

Substitute $p_0=3$ and $q_0=-4$:

$$
r(r-1)+3r-4=0.
$$

Expand:

$$
r^2+2r-4=0.
$$

Use the quadratic formula:

$$
\begin{aligned}
r
&=\frac{-2\pm\sqrt{2^2-4(1)(-4)}}{2}\\
&=\frac{-2\pm\sqrt{20}}{2}\\
&=-1\pm\sqrt5.
\end{aligned}
$$

Thus:

$$
\boxed{r_1=-1+\sqrt5,
\qquad
r_2=-1-\sqrt5}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Try $y=x^r$. Then:

$$
y'=rx^{r-1},
\qquad
y''=r(r-1)x^{r-2}.
$$

Substitute:

$$
\begin{aligned}
x^2y''+2xy'-6y
&=[r(r-1)+2r-6]x^r.
\end{aligned}
$$

The indicial equation is:

$$
r(r-1)+2r-6=0.
$$

Simplify and factor:

$$
\begin{aligned}
r^2+r-6&=0,\\
(r-2)(r+3)&=0.
\end{aligned}
$$

Thus:

$$
r_1=2,
\qquad
r_2=-3.
$$

Both Euler powers solve the equation, so:

$$
\boxed{
y(x)=c_1x^2+c_2x^{-3},
\qquad x>0
}.
$$

<!-- print-page-break -->

### Answer 6

Use:

$$
y=\sum_{n=0}^{\infty}a_nx^{n+r}.
$$

The terms $x^2y''+2xy'-2y$ contribute:

$$
\sum_{n=0}^{\infty}
\left[(n+r)(n+r-1)+2(n+r)-2\right]a_nx^{n+r}.
$$

The remaining term is:

$$
xy=\sum_{n=1}^{\infty}a_{n-1}x^{n+r}.
$$

The lowest-power equation gives:

$$
[r(r-1)+2r-2]a_0=0.
$$

Since $a_0\neq0$:

$$
r^2+r-2=0.
$$

Factor:

$$
(r-1)(r+2)=0.
$$

Thus:

$$
r_1=1,
\qquad
r_2=-2.
$$

Matching the coefficient of $x^{n+r}$ gives, for $n\geq1$:

$$
[(n+r-1)(n+r+2)]a_n+a_{n-1}=0.
$$

Use the larger root $r=1$:

$$
n(n+3)a_n+a_{n-1}=0.
$$

Therefore:

$$
a_n=-\frac{a_{n-1}}{n(n+3)}.
$$

Choose $a_0=1$. For $n=1$:

$$
a_1=-\frac1{(1)(4)}=-\frac14.
$$

For $n=2$:

$$
\begin{aligned}
a_2
&=-\frac{a_1}{(2)(5)}\\
&=\frac1{40}.
\end{aligned}
$$

For $n=3$:

$$
\begin{aligned}
a_3
&=-\frac{a_2}{(3)(6)}\\
&=-\frac1{720}.
\end{aligned}
$$

Since the leading factor is $x^r=x$, the requested solution through $x^4$
is:

$$
\boxed{
y_1(x)=x-\frac14x^2+\frac1{40}x^3-\frac1{720}x^4+\cdots
}.
$$

### Answer 7

Try $y=x^r$. The indicial equation is:

$$
r(r-1)+5r+4=0.
$$

Simplify:

$$
r^2+4r+4=0.
$$

Factor:

$$
(r+2)^2=0.
$$

The repeated root is $r=-2$. One solution is:

$$
y_1=x^{-2}.
$$

For a repeated Euler root, a logarithmic partner is:

$$
y_2=x^{-2}\ln x.
$$

Therefore:

$$
\boxed{
y(x)=c_1x^{-2}+c_2x^{-2}\ln x,
\qquad x>0
}.
$$

<!-- print-page-break -->

### Answer 8

Try $y=x^r$. The indicial equation is:

$$
r(r-1)-3r+3=0.
$$

Simplify and factor:

$$
\begin{aligned}
r^2-4r+3&=0,\\
(r-3)(r-1)&=0.
\end{aligned}
$$

Thus:

$$
r_1=3,
\qquad
r_2=1.
$$

Both power functions can be checked directly:

$$
y_1=x^3,
\qquad
y_2=x.
$$

They are not constant multiples, so:

$$
\boxed{y=c_1x^3+c_2x}.
$$

The roots differ by $2$, but no recurrence obstruction occurs because this
Euler equation accepts both pure powers directly.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

For:

$$
x^2y''+xy'-4y+4x^2y=0,
$$

the Frobenius substitution gives the lowest-power equation:

$$
(r^2-4)a_0=0.
$$

Since $a_0\neq0$:

$$
r^2-4=0.
$$

Thus:

$$
r_1=2,
\qquad
r_2=-2.
$$

For $n=1$:

$$
[(r+1)^2-4]a_1=0.
$$

For $n\geq2$:

$$
\boxed{
[(n+r)^2-4]a_n+4a_{n-2}=0
}.
$$

<!-- print-page-break -->

Now choose the smaller root $r=-2$. At $n=1$:

$$
[(-1)^2-4]a_1=0,
$$

so:

$$
-3a_1=0,
\qquad
a_1=0.
$$

<!-- print-page-break -->

The first step gave $a_1=0$. Continue with the recurrence at $n=2$:

$$
[(0)^2-4]a_2+4a_0=0.
$$

Therefore:

$$
-4a_2+4a_0=0,
\qquad
a_2=a_0.
$$

At $n=3$:

$$
[(1)^2-4]a_3+4a_1=0.
$$

Since $a_1=0$:

$$
-3a_3=0,
\qquad
a_3=0.
$$

At $n=4$:

$$
[(2)^2-4]a_4+4a_2=0.
$$

The coefficient of $a_4$ vanishes:

$$
0\cdot a_4+4a_2=0.
$$

But $a_2=a_0\neq0$, so this equation is impossible. The lower-root pure
Frobenius series is obstructed at:

$$
\boxed{n=4}.
$$

<!-- print-page-break -->

### Answer 10

Try $y=x^r$. Substitution gives:

$$
[r(r-1)-r+5]x^r=0.
$$

The indicial equation is:

$$
r^2-2r+5=0.
$$

Use the quadratic formula:

$$
\begin{aligned}
r
&=\frac{2\pm\sqrt{(-2)^2-4(1)(5)}}{2}\\
&=\frac{2\pm\sqrt{-16}}{2}\\
&=1\pm2i.
\end{aligned}
$$

For $r=1\pm2i$:

$$
x^r=x^{1\pm2i}=x e^{\pm2i\ln x}.
$$

Taking real and imaginary parts gives:

$$
x\cos(2\ln x)
\qquad\text{and}\qquad
x\sin(2\ln x).
$$

Therefore:

$$
\boxed{
y(x)=c_1x\cos(2\ln x)+c_2x\sin(2\ln x),
\qquad x>0
}.
$$

<!-- print-page-break -->

### Answer 11

Set:

$$
t=x+3.
$$

The equation becomes:

$$
t^2y''-2y=0.
$$

Try $y=t^r$. The indicial equation is:

$$
r(r-1)-2=0.
$$

Factor:

$$
(r-2)(r+1)=0.
$$

Thus:

$$
r_1=2,
\qquad
r_2=-1.
$$

In the translated variable:

$$
y(t)=c_1t^2+c_2t^{-1}.
$$

Return to $t=x+3$:

$$
\boxed{
y(x)=c_1(x+3)^2+c_2(x+3)^{-1}
}.
$$

The singular point $x=-3$ must be excluded from the solution interval.

<!-- print-page-break -->

### Answer 12

For $y_1=x^{-1}$:

$$
y_1'=-x^{-2},
\qquad
y_1''=2x^{-3}.
$$

Substitute:

$$
\begin{aligned}
x^2y_1''+3xy_1'+y_1
&=x^2(2x^{-3})+3x(-x^{-2})+x^{-1}\\
&=(2-3+1)x^{-1}\\
&=0.
\end{aligned}
$$

For $y_2=x^{-1}\ln x$, use the product rule:

$$
\begin{aligned}
y_2'
&=-x^{-2}\ln x+x^{-1}\left(\frac1x\right)\\
&=x^{-2}(1-\ln x).
\end{aligned}
$$

Differentiate again:

$$
\begin{aligned}
y_2''
&=-2x^{-3}(1-\ln x)-x^{-3}\\
&=x^{-3}(2\ln x-3).
\end{aligned}
$$

Substitute:

$$
\begin{aligned}
x^2y_2''+3xy_2'+y_2
&=x^{-1}(2\ln x-3)
+3x^{-1}(1-\ln x)
+x^{-1}\ln x\\
&=x^{-1}[(2-3+1)\ln x+(-3+3)]\\
&=0.
\end{aligned}
$$

Now calculate the Wronskian:

$$
\begin{aligned}
W[y_1,y_2]
&=y_1y_2'-y_2y_1'\\
&=x^{-1}\left[x^{-2}(1-\ln x)\right]
-(x^{-1}\ln x)(-x^{-2})\\
&=x^{-3}(1-\ln x)+x^{-3}\ln x\\
&=x^{-3}.
\end{aligned}
$$

Since $x^{-3}\neq0$ for $x>0$, the two solutions are linearly independent.

</details>

<details open>
<summary><strong>Chapter 28 Final Summary</strong></summary>

At a regular singular point $x=0$, seek:

$$
\boxed{
y(x)=\sum_{n=0}^{\infty}a_nx^{n+r},
\qquad a_0\neq0
}.
$$

The lowest power gives the indicial equation. Later powers give the
coefficient recurrence. The relationship between the indicial roots then
controls the second solution:

- a noninteger difference gives two Frobenius series
- a repeated root introduces a logarithmic partner
- an integer difference requires testing the smaller-root recurrence
- complex roots produce oscillations in $\ln x$

The dependable chain is:

$$
\boxed{
\begin{aligned}
\text{classify the point}
&\;\longrightarrow\;\text{write the Frobenius series}\\
&\;\longrightarrow\;\text{isolate the lowest power}\\
&\;\longrightarrow\;\text{solve the indicial equation}\\
&\;\longrightarrow\;\text{derive and test the recurrence}\\
&\;\longrightarrow\;\text{choose the correct root case}.
\end{aligned}
}
$$

> the indicial roots suggest the possible solution shapes, but the recurrence
> reveals whether those shapes can actually be completed.

</details>
