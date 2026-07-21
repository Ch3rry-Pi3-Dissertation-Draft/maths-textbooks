# Gamma Functions And Bessel Equations

Power-series solutions often contain products such as:

$$
(\nu+1)(\nu+2)\cdots(\nu+m).
$$

When $\nu$ is not an integer, ordinary factorial notation cannot describe this
product cleanly. The gamma function supplies the missing notation. It then
allows the Frobenius solution of Bessel's equation to be written as a single
named function: the Bessel function $J_\nu$.

This chapter will:

- define the gamma function and derive its recurrence
- connect gamma values with factorials and half-integer factorials
- make changes of index in infinite series explicit
- derive $J_\nu(x)$ from Bessel's differential equation by Frobenius' method
- construct the low-order functions $J_0$, $J_1$, and $J_2$
- explain when a second solution $Y_\nu$ is required
- derive the main derivative and neighbouring-order identities
- transform related differential equations into Bessel form
- interpret the behaviour and zeros of Bessel functions
- build a reliable workflow for solving Bessel-type equations

---

## Block 1: Why A New Function Appears

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise Bessel's equation and understand why its solutions
cannot usually be written using only elementary functions.

> a named special function is not a shortcut around the differential
> equation; it is a carefully normalized solution produced by the equation.

</details>

<details open>
<summary><strong>Bessel's Differential Equation</strong></summary>

For a fixed real number $\nu$, Bessel's equation of order $\nu$ is:

$$
\boxed{
x^2y''+xy'+(x^2-\nu^2)y=0
}.
$$

The symbols have different jobs:

- $x$ is the independent variable
- $y(x)$ is the unknown function
- $\nu$ is the order of the equation
- $\nu$ is fixed while the equation is being solved

Dividing by $x^2$, for $x\ne0$, gives normalized form:

$$
y''+\frac1x y'
+\left(1-\frac{\nu^2}{x^2}\right)y=0.
$$

The coefficients $1/x$ and $\nu^2/x^2$ are singular at $x=0$. This is why an
ordinary Taylor series is not the natural first choice there.

</details>

<details open>
<summary><strong>Classify The Origin</strong></summary>

Write the normalized equation as:

$$
y''+P(x)y'+Q(x)y=0,
$$

where:

$$
P(x)=\frac1x,
\qquad
Q(x)=1-\frac{\nu^2}{x^2}.
$$

To test $x=0$, calculate:

$$
xP(x)=1,
$$

and:

$$
x^2Q(x)=x^2-\nu^2.
$$

Both expressions are analytic at $0$. Therefore:

$$
\boxed{x=0\text{ is a regular singular point}.}
$$

The Frobenius method from Chapter 28 is therefore the appropriate tool.

</details>

<details open>
<summary><strong>Where The Equation Comes From</strong></summary>

Bessel's equation commonly appears when a problem has circular or cylindrical
geometry. After variables are separated, the radial part often has the form:

$$
r^2R''+rR'+(\lambda^2r^2-\nu^2)R=0.
$$

To convert this radial equation to standard Bessel form, set:

$$
x=\lambda r.
$$

The chain rule gives:

$$
\frac{dR}{dr}
=\lambda\frac{dR}{dx},
\qquad
\frac{d^2R}{dr^2}
=\lambda^2\frac{d^2R}{dx^2}.
$$

Since $r=x/\lambda$, substitution produces:

$$
x^2R_{xx}+xR_x+(x^2-\nu^2)R=0.
$$

Thus the same normalized equation describes many different radial models.

</details>

<details open>
<summary><strong>Why Gamma Will Be Needed</strong></summary>

The Frobenius recurrence for Bessel's equation will generate products of the
form:

$$
(\nu+1)(\nu+2)\cdots(\nu+m).
$$

If $\nu=3$, this product can be written using factorials:

$$
4\cdot5\cdots(3+m)=\frac{(m+3)!}{3!}.
$$

If $\nu=1/2$, expressions such as $(m+1/2)!$ are not ordinary factorials.
The gamma function extends factorial notation to such values.

The dependency is:

$$
\boxed{
\text{gamma function}
\longrightarrow
\text{compact Frobenius coefficients}
\longrightarrow
\text{Bessel function}
}.
$$

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Bessel's equation has a regular singular point at the origin. Frobenius' method
is therefore natural, and the resulting products require a factorial-like
function that also accepts noninteger inputs.

</details>

---

## Block 2: The Gamma Function

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to define $\Gamma(s)$, derive its recurrence without skipping the
integration-by-parts boundary term, and use it to evaluate integer,
half-integer, and negative noninteger arguments.

</details>

<details open>
<summary><strong>The Defining Integral</strong></summary>

For $s>0$, define:

$$
\boxed{
\Gamma(s)=\int_0^\infty t^{s-1}e^{-t}\,dt
}.
$$

The integration variable $t$ is a dummy variable. It has no connection with
the argument $s$.

Two competing factors make the integral finite:

- near $t=0$, the power $t^{s-1}$ is integrable when $s>0$
- as $t\to\infty$, the exponential $e^{-t}$ decays faster than any power grows

For example:

$$
\Gamma(1)=\int_0^\infty e^{-t}\,dt.
$$

Evaluate the improper integral:

$$
\begin{aligned}
\Gamma(1)
&=\lim_{b\to\infty}\int_0^b e^{-t}\,dt\\
&=\lim_{b\to\infty}\left[-e^{-t}\right]_0^b\\
&=\lim_{b\to\infty}\left(1-e^{-b}\right)\\
&=1.
\end{aligned}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Derive The Gamma Recurrence</strong></summary>

Start from the definition with argument $s+1$:

$$
\Gamma(s+1)=\int_0^\infty t^s e^{-t}\,dt.
$$

Use integration by parts. Choose:

$$
u=t^s,
\qquad
dv=e^{-t}\,dt.
$$

Then:

$$
du=st^{s-1}\,dt,
\qquad
v=-e^{-t}.
$$

Apply $\int u\,dv=uv-\int v\,du$ on $[0,b]$:

$$
\int_0^b t^se^{-t}\,dt
=\left[-t^se^{-t}\right]_0^b
+s\int_0^b t^{s-1}e^{-t}\,dt.
$$

Now take $b\to\infty$. For $s>0$, both endpoint contributions vanish:

$$
\lim_{b\to\infty}b^se^{-b}=0,
\qquad
\lim_{t\to0^+}t^se^{-t}=0.
$$

Therefore the boundary term is zero, leaving:

$$
\Gamma(s+1)
=s\int_0^\infty t^{s-1}e^{-t}\,dt.
$$

Recognize the remaining integral as $\Gamma(s)$:

$$
\boxed{
\Gamma(s+1)=s\Gamma(s)
}.
$$

The exponential wins over the power at infinity.[^gamma-boundary]

[^gamma-boundary]: Repeated use of l'Hopital's rule on
    $b^s/e^b$ when $s$ is an integer, or a standard exponential-growth
    estimate for general $s>0$, gives $b^se^{-b}\to0$.

</details>

<details open>
<summary><strong>Recover Ordinary Factorials</strong></summary>

Use the recurrence repeatedly:

$$
\begin{aligned}
\Gamma(n+1)
&=n\Gamma(n)\\
&=n(n-1)\Gamma(n-1)\\
&=n(n-1)(n-2)\Gamma(n-2)\\
&=\cdots\\
&=n(n-1)\cdots2\cdot1\,\Gamma(1).
\end{aligned}
$$

Since $\Gamma(1)=1$:

$$
\boxed{\Gamma(n+1)=n!}
\qquad
(n=0,1,2,\ldots).
$$

Notice the shift:

$$
\Gamma(n)=(n-1)!,
$$

not $n!$. For example:

$$
\Gamma(5)=4!=24.
$$

</details>

<details open>
<summary><strong>The Half-Integer Starting Value</strong></summary>

A fundamental value is:

$$
\boxed{\Gamma\left(\frac12\right)=\sqrt\pi}.
$$

It follows from the Gaussian integral.[^gaussian-link] Once this starting value
is known, the recurrence produces every positive half-integer value.

For example:

$$
\begin{aligned}
\Gamma\left(\frac32\right)
&=\frac12\Gamma\left(\frac12\right)\\
&=\frac{\sqrt\pi}{2},
\end{aligned}
$$

and:

$$
\begin{aligned}
\Gamma\left(\frac52\right)
&=\frac32\Gamma\left(\frac32\right)\\
&=\frac32\cdot\frac{\sqrt\pi}{2}\\
&=\frac{3\sqrt\pi}{4}.
\end{aligned}
$$

[^gaussian-link]: With $t=u^2$, the gamma integral becomes half of the
    standard Gaussian integral, giving $\Gamma(1/2)=\sqrt\pi$.

</details>

<details open>
<summary><strong>Move To Negative Nonintegers</strong></summary>

Rearrange the recurrence:

$$
\Gamma(s)=\frac{\Gamma(s+1)}{s},
\qquad s\ne0.
$$

This relation extends gamma to negative noninteger arguments. For example,
set $s=-1/2$:

$$
\Gamma\left(-\frac12\right)
=\frac{\Gamma(1/2)}{-1/2}.
$$

Dividing by $-1/2$ is multiplying by $-2$:

$$
\boxed{
\Gamma\left(-\frac12\right)=-2\sqrt\pi
}.
$$

At $s=0,-1,-2,\ldots$, repeated use of the recurrence would require division
by zero. Gamma has poles at these values; it is not finite there.

</details>

<details open>
<summary><strong>Worked Gamma Calculation</strong></summary>

Evaluate $\Gamma(7/2)$ exactly.

Move downward one step at a time:

$$
\Gamma\left(\frac72\right)
=\frac52\Gamma\left(\frac52\right).
$$

Use the recurrence again:

$$
\Gamma\left(\frac52\right)
=\frac32\Gamma\left(\frac32\right).
$$

And once more:

$$
\Gamma\left(\frac32\right)
=\frac12\Gamma\left(\frac12\right).
$$

Substitute all three steps:

$$
\begin{aligned}
\Gamma\left(\frac72\right)
&=\frac52\cdot\frac32\cdot\frac12
\Gamma\left(\frac12\right)\\
&=\frac{5\cdot3\cdot1}{2^3}\sqrt\pi\\
&=\boxed{\frac{15\sqrt\pi}{8}}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Convert A Product Into Gamma Notation</strong></summary>

For any $\nu$ for which the gamma values exist:

$$
\Gamma(\nu+m+1)
=(\nu+m)\Gamma(\nu+m).
$$

Continue the recurrence down to $\Gamma(\nu+1)$:

$$
\Gamma(\nu+m+1)
=(\nu+m)(\nu+m-1)\cdots(\nu+1)\Gamma(\nu+1).
$$

Divide by $\Gamma(\nu+1)$:

$$
\boxed{
(\nu+1)(\nu+2)\cdots(\nu+m)
=\frac{\Gamma(\nu+m+1)}{\Gamma(\nu+1)}
}.
$$

This is the exact product that will occur in the Bessel coefficients.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

The gamma function satisfies $\Gamma(s+1)=s\Gamma(s)$, agrees with shifted
factorials at integers, and makes noninteger factorial-like products precise.

</details>

---

## Block 3: Reindexing Infinite Series Safely

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to make every change of index explicit before applying Frobenius'
method to Bessel's equation.

> changing an index changes the label and usually the lower limit; it does not
> change the terms represented by the series.

</details>

<details open>
<summary><strong>A Dummy Index Can Be Renamed</strong></summary>

The letters $k$, $m$, and $j$ are labels inside a summation. Therefore:

$$
\sum_{k=0}^{\infty}a_kx^k
=\sum_{j=0}^{\infty}a_jx^j.
$$

Only the label changed. The lower limit, upper limit, coefficient subscript,
and exponent still describe the same sequence of terms.

This is different from replacing $k$ by $j-2$, which is a genuine change of
index and changes the limits.

</details>

<details open>
<summary><strong>Reindex A Shifted Power</strong></summary>

Consider:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}.
$$

We want the exponent to be $j$. Set:

$$
j=k+2.
$$

Solve for the old index:

$$
k=j-2.
$$

When $k=0$, the new index is $j=2$. Therefore:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{j=2}^{\infty}a_{j-2}x^j.
$$

Finally rename $j$ as $k$ if desired:

$$
\boxed{
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{k=2}^{\infty}a_{k-2}x^k
}.
$$

</details>

<details open>
<summary><strong>Expose The Missing Low-Index Terms</strong></summary>

Suppose we need to combine:

$$
\sum_{k=0}^{\infty}A_kx^k
+\sum_{k=2}^{\infty}B_kx^k.
$$

The second series has no $x^0$ or $x^1$ term. Separate those terms from the
first series:

$$
\sum_{k=0}^{\infty}A_kx^k
=A_0+A_1x+\sum_{k=2}^{\infty}A_kx^k.
$$

Now combine only the ranges that match:

$$
A_0+A_1x
+\sum_{k=2}^{\infty}(A_k+B_k)x^k.
$$

This separation is what produces an indicial equation, an $a_1$ equation, and
the later coefficient recurrence in the Bessel calculation.

</details>

<details open>
<summary><strong>Common Mistake: Changing The Exponent But Not The Coefficient</strong></summary>

The incorrect step:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
\ne
\sum_{k=2}^{\infty}a_kx^k
$$

loses the relationship between each coefficient and its original term.

The correct substitution $j=k+2$ changes both:

$$
x^{k+2}\to x^j,
\qquad
a_k\to a_{j-2}.
$$

Hence:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{j=2}^{\infty}a_{j-2}x^j.
$$

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

To reindex safely, define the new index, solve for the old index, transform the
coefficient subscript, and recalculate the lower limit before renaming the
dummy variable.

</details>

---

## Block 4: Deriving The Bessel Function Of The First Kind

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the complete series for $J_\nu(x)$ from Bessel's equation,
including the indicial equation, the odd-coefficient chain, the even
coefficients, and the normalization.

</details>

<details open>
<summary><strong>Begin With A Frobenius Series</strong></summary>

Start from Bessel's equation:

$$
x^2y''+xy'+(x^2-\nu^2)y=0.
$$

Use:

$$
y=\sum_{k=0}^{\infty}a_kx^{k+r},
\qquad a_0\ne0.
$$

Differentiate term by term:

$$
y'=\sum_{k=0}^{\infty}(k+r)a_kx^{k+r-1},
$$

The corresponding second derivative is:

$$
y''=\sum_{k=0}^{\infty}(k+r)(k+r-1)a_kx^{k+r-2}.
$$

The order $\nu$, Frobenius exponent $r$, and summation index $k$ are three
different quantities.

</details>

<details open>
<summary><strong>Substitute Every Term</strong></summary>

Multiply the derivatives by their coefficients:

$$
x^2y''
=\sum_{k=0}^{\infty}(k+r)(k+r-1)a_kx^{k+r},
$$

$$
xy'
=\sum_{k=0}^{\infty}(k+r)a_kx^{k+r},
$$

$$
-\nu^2y
=-\sum_{k=0}^{\infty}\nu^2a_kx^{k+r},
$$

and:

$$
x^2y
=\sum_{k=0}^{\infty}a_kx^{k+r+2}.
$$

Substitute these four expressions into the equation:

$$
\begin{aligned}
&\sum_{k=0}^{\infty}
\left[(k+r)(k+r-1)+(k+r)-\nu^2\right]
a_kx^{k+r}\\
&\qquad
+\sum_{k=0}^{\infty}a_kx^{k+r+2}=0.
\end{aligned}
$$

In the substituted expression, simplify the first bracket:

$$
(k+r)(k+r-1)+(k+r)=(k+r)^2.
$$

Therefore:

$$
\sum_{k=0}^{\infty}
\left[(k+r)^2-\nu^2\right]a_kx^{k+r}
+\sum_{k=0}^{\infty}a_kx^{k+r+2}=0.
$$

</details>

<details open>
<summary><strong>Reindex The Shifted Series</strong></summary>

In the second sum, set:

$$
j=k+2.
$$

Then $k=j-2$, and the lower limit changes from $k=0$ to $j=2$:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{j=2}^{\infty}a_{j-2}x^{j+r}.
$$

Rename $j$ as $k$:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{k=2}^{\infty}a_{k-2}x^{k+r}.
$$

Now separate the $k=0$ and $k=1$ terms from the first sum:

$$
\begin{aligned}
&(r^2-\nu^2)a_0x^r\\
&+\left[(r+1)^2-\nu^2\right]a_1x^{r+1}\\
&+\sum_{k=2}^{\infty}
\left(\left[(k+r)^2-\nu^2\right]a_k+a_{k-2}\right)x^{k+r}=0.
\end{aligned}
$$

The three coefficient conditions are now visible.

</details>

<details open>
<summary><strong>Find The Indicial Roots</strong></summary>

The lowest power is $x^r$. Its coefficient must vanish:

$$
(r^2-\nu^2)a_0=0.
$$

Because $a_0\ne0$:

$$
r^2-\nu^2=0.
$$

Factor:

$$
(r-\nu)(r+\nu)=0.
$$

Therefore the indicial roots are:

$$
\boxed{r_1=\nu,\qquad r_2=-\nu.}
$$

We first use the larger root $r=\nu$, assuming $\nu\ge0$.

</details>

<details open>
<summary><strong>Show Why The Odd Chain Vanishes</strong></summary>

The coefficient of $x^{r+1}$ gives:

$$
\left[(r+1)^2-\nu^2\right]a_1=0.
$$

Set $r=\nu$:

$$
\left[(\nu+1)^2-\nu^2\right]a_1=0.
$$

Expand the bracket:

$$
(\nu^2+2\nu+1-\nu^2)a_1=0.
$$

Thus:

$$
(2\nu+1)a_1=0.
$$

For $\nu\ge0$, the factor $2\nu+1$ is nonzero. Divide by it:

$$
\boxed{a_1=0.}
$$

The later recurrence moves in steps of two, so $a_3,a_5,\ldots$ will also be
zero.

</details>

<details open>
<summary><strong>Derive The Later-Coefficient Recurrence</strong></summary>

For $k\ge2$:

$$
\left[(k+r)^2-\nu^2\right]a_k+a_{k-2}=0.
$$

Move $a_{k-2}$ to the right:

$$
\left[(k+r)^2-\nu^2\right]a_k=-a_{k-2}.
$$

Set $r=\nu$:

$$
\left[(k+\nu)^2-\nu^2\right]a_k=-a_{k-2}.
$$

Factor the difference of squares:

$$
(k+\nu)^2-\nu^2
=k(k+2\nu).
$$

Divide by $k(k+2\nu)$:

$$
\boxed{
a_k=-\frac{a_{k-2}}{k(k+2\nu)},
\qquad k\ge2
}.
$$

</details>

<details open>
<summary><strong>Build The Even Coefficients</strong></summary>

Set $k=2$ in the recurrence:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{2(2+2\nu)}\\
&=-\frac{a_0}{2^2(\nu+1)}.
\end{aligned}
$$

Set $k=4$:

$$
\begin{aligned}
a_4
&=-\frac{a_2}{4(4+2\nu)}\\
&=-\frac{a_2}{2^3(\nu+2)}\\
&=\frac{a_0}{2^2(\nu+1)\,2^3(\nu+2)}\\
&=\frac{a_0}{2^4(2!)(\nu+1)(\nu+2)}.
\end{aligned}
$$

The general even coefficient is:

$$
a_{2m}
=\frac{(-1)^m a_0}
{2^{2m}m!(\nu+1)(\nu+2)\cdots(\nu+m)}.
$$

Use the gamma product from Block 2:

$$
(\nu+1)\cdots(\nu+m)
=\frac{\Gamma(\nu+m+1)}{\Gamma(\nu+1)}.
$$

Therefore:

$$
a_{2m}
=\frac{(-1)^m a_0\Gamma(\nu+1)}
{2^{2m}m!\Gamma(\nu+m+1)}.
$$

</details>

<details open>
<summary><strong>Choose The Standard Normalization</strong></summary>

The Frobenius solution is:

$$
y=x^\nu\sum_{m=0}^{\infty}a_{2m}x^{2m}.
$$

Substitute the coefficient formula:

$$
y
=a_0\Gamma(\nu+1)x^\nu
\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m}}
{2^{2m}m!\Gamma(m+\nu+1)}.
$$

Choose:

$$
a_0=\frac{1}{2^\nu\Gamma(\nu+1)}.
$$

Then $a_0\Gamma(\nu+1)x^\nu=x^\nu/2^\nu=(x/2)^\nu$.
Combining this factor with $x^{2m}/2^{2m}$ gives the standard Bessel function:

$$
\boxed{
J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+\nu+1)}
\left(\frac{x}{2}\right)^{2m+\nu}
}.
$$

The normalization is chosen so that, near $x=0$:

$$
J_\nu(x)
\sim
\frac{1}{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu.
$$

</details>

<details open>
<summary><strong>Verify The Series Recurrence Locally</strong></summary>

Let the coefficient of $x^{2m+\nu}$ in $J_\nu$ be:

$$
c_m
=\frac{(-1)^m}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Compare $c_m$ with $c_{m-1}$:

$$
\frac{c_m}{c_{m-1}}
=-\frac{2^{2m-2+\nu}(m-1)!\Gamma(m+\nu)}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Use:

$$
m!=m(m-1)!,
\qquad
\Gamma(m+\nu+1)=(m+\nu)\Gamma(m+\nu).
$$

After cancellation:

$$
\frac{c_m}{c_{m-1}}
=-\frac{1}{4m(m+\nu)}.
$$

This is the even-index recurrence with $k=2m$:

$$
-\frac{1}{k(k+2\nu)}
=-\frac{1}{(2m)(2m+2\nu)}
=-\frac{1}{4m(m+\nu)}.
$$

Thus the compact gamma formula preserves the recurrence derived from the
differential equation.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Frobenius' method gives indicial roots $\pm\nu$. The root $r=\nu$ produces an
even coefficient chain whose gamma-normalized series is $J_\nu(x)$.

</details>

---

## Block 5: Low Orders And The Second Solution

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to construct familiar low-order Bessel functions and explain why
$J_\nu$ alone does not always provide the full two-dimensional solution space.

</details>

<details open>
<summary><strong>Construct J Zero</strong></summary>

Set $\nu=0$ in the defining series:

$$
J_0(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+1)}
\left(\frac{x}{2}\right)^{2m}.
$$

Since $\Gamma(m+1)=m!$:

$$
J_0(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{(m!)^2}
\left(\frac{x}{2}\right)^{2m}.
$$

Write the first four terms:

$$
\begin{aligned}
J_0(x)
&=1
-\frac{x^2}{2^2}
+\frac{x^4}{2^4(2!)^2}
-\frac{x^6}{2^6(3!)^2}
+\cdots\\
&=\boxed{
1-\frac{x^2}{4}+\frac{x^4}{64}-\frac{x^6}{2304}+\cdots
}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Construct J One</strong></summary>

Set $\nu=1$:

$$
J_1(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+2)}
\left(\frac{x}{2}\right)^{2m+1}.
$$

Because $\Gamma(m+2)=(m+1)!$:

$$
J_1(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!(m+1)!}
\left(\frac{x}{2}\right)^{2m+1}.
$$

Now calculate successive terms:

$$
\begin{aligned}
m=0:&\quad \frac{x}{2},\\
m=1:&\quad -\frac{1}{1!2!}\left(\frac{x}{2}\right)^3
=-\frac{x^3}{16},\\
m=2:&\quad \frac{1}{2!3!}\left(\frac{x}{2}\right)^5
=\frac{x^5}{384}.
\end{aligned}
$$

Therefore:

$$
\boxed{
J_1(x)=\frac{x}{2}-\frac{x^3}{16}+\frac{x^5}{384}-\cdots
}.
$$

</details>

<details open>
<summary><strong>Construct J Two</strong></summary>

Set $\nu=2$:

$$
J_2(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+3)}
\left(\frac{x}{2}\right)^{2m+2}.
$$

Use $\Gamma(m+3)=(m+2)!$:

$$
\begin{aligned}
J_2(x)
&=\frac1{2!}\left(\frac{x}{2}\right)^2
-\frac1{1!3!}\left(\frac{x}{2}\right)^4
+\frac1{2!4!}\left(\frac{x}{2}\right)^6
-\cdots\\
&=\boxed{
\frac{x^2}{8}-\frac{x^4}{96}+\frac{x^6}{3072}-\cdots
}.
\end{aligned}
$$

Near the origin, $J_2$ behaves like $x^2/8$. More generally, for $\nu>0$,
$J_\nu(x)$ tends to zero like $x^\nu$.

</details>

<details open>
<summary><strong>Check J Zero In Its Equation</strong></summary>

The order-zero equation is:

$$
x^2y''+xy'+x^2y=0.
$$

Use the truncated series:

$$
y=1-\frac{x^2}{4}+\frac{x^4}{64}+O(x^6).
$$

Differentiate:

$$
y'=-\frac{x}{2}+\frac{x^3}{16}+O(x^5),
$$

$$
y''=-\frac12+\frac{3x^2}{16}+O(x^4).
$$

<!-- print-page-break -->

Substitute each contribution into
$x^2y''+xy'+x^2y$:

$$
x^2y''=-\frac{x^2}{2}+\frac{3x^4}{16}+O(x^6),
$$

$$
xy'=-\frac{x^2}{2}+\frac{x^4}{16}+O(x^6),
$$

$$
x^2y=x^2-\frac{x^4}{4}+O(x^6).
$$

Add like powers:

$$
\begin{aligned}
x^2y''+xy'+x^2y
&=\left(-\frac12-\frac12+1\right)x^2\\
&\quad+\left(\frac3{16}+\frac1{16}-\frac14\right)x^4
+O(x^6)\\
&=O(x^6).
\end{aligned}
$$

The displayed coefficients cancel exactly. Continuing the full recurrence
cancels every higher power.

</details>

<details open>
<summary><strong>Use The Other Indicial Root</strong></summary>

The second indicial root is $r=-\nu$. Repeating the Frobenius construction
formally gives $J_{-\nu}(x)$:

$$
J_{-\nu}(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m-\nu+1)}
\left(\frac{x}{2}\right)^{2m-\nu}.
$$

If $\nu$ is not an integer, $J_\nu$ and $J_{-\nu}$ are generally linearly
independent. On an interval with $x>0$, the general solution may then be written:

$$
y=C_1J_\nu(x)+C_2J_{-\nu}(x).
$$

Their different leading powers, $x^\nu$ and $x^{-\nu}$, make the independence
visible near the origin when $\nu>0$.

</details>

<details open>
<summary><strong>Why Integer Orders Need Y</strong></summary>

For an integer $n$:

$$
J_{-n}(x)=(-1)^nJ_n(x).
$$

Thus $J_n$ and $J_{-n}$ point in the same solution direction. They cannot form
a basis for a second-order equation.

A second independent solution is called the Bessel function of the second
kind and is denoted $Y_\nu(x)$. For noninteger $\nu$, it can be defined by:

$$
Y_\nu(x)
=\frac{J_\nu(x)\cos(\pi\nu)-J_{-\nu}(x)}
{\sin(\pi\nu)}.
$$

Integer orders are obtained by taking a limit as $\nu\to n$. Therefore, on an
interval not containing $0$:

$$
\boxed{
y=C_1J_n(x)+C_2Y_n(x)
}.
$$

The function $J_n$ remains finite at the origin, while $Y_n$ is singular
there. A physical condition requiring boundedness at the centre commonly
forces $C_2=0$.

</details>

<details open>
<summary><strong>The Order-Zero Second Solution</strong></summary>

For $\nu=0$, the indicial root is repeated. Frobenius theory warns that the
second solution may contain a logarithm. That is exactly what happens:

$$
Y_0(x)
=\frac{2}{\pi}\left(\ln\frac{x}{2}+\gamma\right)J_0(x)
+\text{a regular power series},
$$

where $\gamma$ is the Euler--Mascheroni constant.

The important structural point is not the full coefficient formula. It is:

$$
Y_0(x)\sim\frac{2}{\pi}\ln x
\qquad(x\to0^+).
$$

Therefore $Y_0$ is unbounded at the origin, whereas $J_0(0)=1$.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

The first-kind solutions $J_0,J_1,J_2,\ldots$ come directly from the gamma
series. Noninteger orders can use $J_\nu$ and $J_{-\nu}$ as a basis, but integer
orders require the independent second-kind solution $Y_n$.

</details>

---

## Block 6: Derivative And Neighbouring-Order Identities

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive a small set of identities that replace repeated
differentiation of the full infinite series.

> the order behaves like an index in a polynomial family: differentiation
> connects neighbouring orders.

</details>

<details open>
<summary><strong>Differentiate A Scaled Bessel Function</strong></summary>

Start with the series for $J_\nu$:

$$
J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+\nu}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Multiply by $x^{-\nu}$:

$$
x^{-\nu}J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Differentiate term by term. The $m=0$ term has derivative zero, so begin at
$m=1$:

$$
\frac{d}{dx}\left(x^{-\nu}J_\nu(x)\right)
=\sum_{m=1}^{\infty}
\frac{(-1)^m(2m)x^{2m-1}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Use $m!=m(m-1)!$ and cancel $m$:

$$
=\sum_{m=1}^{\infty}
\frac{(-1)^m x^{2m-1}}
{2^{2m+\nu-1}(m-1)!\Gamma(m+\nu+1)}.
$$

Set $j=m-1$. Then $m=j+1$ and the lower limit becomes $j=0$:

$$
=-\sum_{j=0}^{\infty}
\frac{(-1)^j x^{2j+1}}
{2^{2j+\nu+1}j!\Gamma(j+\nu+2)}.
$$

The series on the right is $x^{-\nu}J_{\nu+1}(x)$. Therefore:

$$
\boxed{
\frac{d}{dx}\left(x^{-\nu}J_\nu(x)\right)
=-x^{-\nu}J_{\nu+1}(x)
}.
$$

</details>

<details open>
<summary><strong>Extract The First Derivative Formula</strong></summary>

Expand the derivative on the left using the product rule:

$$
\frac{d}{dx}\left(x^{-\nu}J_\nu\right)
=-\nu x^{-\nu-1}J_\nu+x^{-\nu}J_\nu'.
$$

Set this equal to the identity just derived:

$$
-\nu x^{-\nu-1}J_\nu+x^{-\nu}J_\nu'
=-x^{-\nu}J_{\nu+1}.
$$

Multiply every term by $x^\nu$:

$$
-\frac{\nu}{x}J_\nu+J_\nu'=-J_{\nu+1}.
$$

Move the first term to the right:

$$
\boxed{
J_\nu'(x)=\frac{\nu}{x}J_\nu(x)-J_{\nu+1}(x)
}.
$$

</details>

<details open>
<summary><strong>The Companion Product Identity</strong></summary>

To derive the companion identity, multiply the defining series by $x^\nu$:

$$
x^\nu J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+2\nu}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Differentiate term by term:

$$
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=\sum_{m=0}^{\infty}
\frac{(-1)^m(2m+2\nu)x^{2m+2\nu-1}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

Factor $2m+2\nu=2(m+\nu)$ and use:

$$
\Gamma(m+\nu+1)=(m+\nu)\Gamma(m+\nu).
$$

Cancel the common factor $m+\nu$:

$$
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+2\nu-1}}
{2^{2m+\nu-1}m!\Gamma(m+\nu)}.
$$

The right side is $x^\nu J_{\nu-1}(x)$. Therefore:

$$
\boxed{
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=x^\nu J_{\nu-1}(x)
}.
$$

Expand its left side:

$$
\nu x^{\nu-1}J_\nu+x^\nu J_\nu'
=x^\nu J_{\nu-1}.
$$

From
$\nu x^{\nu-1}J_\nu+x^\nu J_\nu'=x^\nu J_{\nu-1}$,
divide every term by $x^\nu$:

$$
\frac{\nu}{x}J_\nu+J_\nu'=J_{\nu-1}.
$$

Solve for the derivative:

$$
\boxed{
J_\nu'(x)=J_{\nu-1}(x)-\frac{\nu}{x}J_\nu(x)
}.
$$

The two derivative formulas are equivalent descriptions of the same function.

</details>

<details open>
<summary><strong>Derive The Neighbour Sum</strong></summary>

We now have:

$$
J_\nu'=\frac{\nu}{x}J_\nu-J_{\nu+1},
$$

The second derivative identity is:

$$
J_\nu'=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

Set the right sides equal:

$$
\frac{\nu}{x}J_\nu-J_{\nu+1}
=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

Add $J_{\nu+1}$ and $\nu J_\nu/x$ to both sides:

$$
\frac{2\nu}{x}J_\nu
=J_{\nu-1}+J_{\nu+1}.
$$

The rearrangement gives the neighbour sum:

$$
\boxed{
J_{\nu-1}(x)+J_{\nu+1}(x)
=\frac{2\nu}{x}J_\nu(x)
}.
$$

</details>

<details open>
<summary><strong>Derive The Neighbour Difference</strong></summary>

Use the same two derivative equations:

$$
J_\nu'=\frac{\nu}{x}J_\nu-J_{\nu+1},
$$

and:

$$
J_\nu'=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

Add the equations. On the right, the two $\nu J_\nu/x$ terms cancel:

$$
\begin{aligned}
2J_\nu'
&=\frac{\nu}{x}J_\nu-J_{\nu+1}
+J_{\nu-1}-\frac{\nu}{x}J_\nu\\
&=J_{\nu-1}-J_{\nu+1}.
\end{aligned}
$$

Divide by $2$:

$$
\boxed{
J_\nu'(x)
=\frac12\left[J_{\nu-1}(x)-J_{\nu+1}(x)\right]
}.
$$

</details>

<details open>
<summary><strong>Worked Identity Check At Order One</strong></summary>

Set $\nu=1$ in the neighbour sum:

$$
J_0(x)+J_2(x)=\frac{2}{x}J_1(x).
$$

Use the series through terms of degree four:

$$
J_0(x)=1-\frac{x^2}{4}+\frac{x^4}{64}+O(x^6),
$$

$$
J_2(x)=\frac{x^2}{8}-\frac{x^4}{96}+O(x^6).
$$

Add them:

$$
\begin{aligned}
J_0+J_2
&=1+\left(-\frac14+\frac18\right)x^2
+\left(\frac1{64}-\frac1{96}\right)x^4+O(x^6)\\
&=1-\frac{x^2}{8}+\frac{x^4}{192}+O(x^6).
\end{aligned}
$$

Now use:

$$
J_1(x)=\frac{x}{2}-\frac{x^3}{16}+\frac{x^5}{384}+O(x^7).
$$

Multiply by $2/x$:

$$
\begin{aligned}
\frac2xJ_1(x)
&=\frac2x\left(
\frac{x}{2}-\frac{x^3}{16}+\frac{x^5}{384}
\right)+O(x^6)\\
&=1-\frac{x^2}{8}+\frac{x^4}{192}+O(x^6).
\end{aligned}
$$

Both sides agree term by term.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

The product identities yield derivative and neighbouring-order recurrences.
These formulas let us move among $J_{\nu-1}$, $J_\nu$, $J_{\nu+1}$, and
$J_\nu'$ without rebuilding an infinite series.

</details>

---

## Block 7: Solving Equations By Transforming To Bessel Form

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to identify a scaled Bessel equation, carry the chain rule through
the substitution, and handle spherical Bessel equations using a dependent-
variable transformation.

</details>

<details open>
<summary><strong>A Scaled Bessel Equation</strong></summary>

Consider:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0,
\qquad \lambda>0.
$$

Define a new independent variable:

$$
z=\lambda x,
$$

For $z=\lambda x$, write the dependent variable as:

$$
y(x)=u(z).
$$

The first derivative is:

$$
\frac{dy}{dx}
=\frac{du}{dz}\frac{dz}{dx}
=\lambda u_z.
$$

Differentiate again:

$$
\frac{d^2y}{dx^2}
=\lambda\frac{d}{dx}(u_z)
=\lambda u_{zz}\frac{dz}{dx}
=\lambda^2u_{zz}.
$$

Also $x=z/\lambda$. These three substitutions must all be used together.

</details>

<details open>
<summary><strong>Worked Scaled Equation</strong></summary>

Solve on $x>0$:

$$
x^2y''+xy'+(4x^2-9)y=0.
$$

Compare with the scaled form:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0.
$$

Match coefficients:

$$
\lambda^2=4,
\qquad
\nu^2=9.
$$

Choose $\lambda=2$ and order $\nu=3$. Set:

$$
z=2x,
\qquad
y(x)=u(z).
$$

Using $z=2x$, the derivative and variable substitutions are:

$$
y'=2u_z,
\qquad
y''=4u_{zz},
\qquad
x=\frac z2.
$$

Substitute into the original equation:

$$
\left(\frac{z}{2}\right)^2(4u_{zz})
+\left(\frac z2\right)(2u_z)
+\left[4\left(\frac z2\right)^2-9\right]u=0.
$$

Simplify each coefficient:

$$
z^2u_{zz}+zu_z+(z^2-9)u=0.
$$

The simplified equation is:

$$
z^2u_{zz}+zu_z+(z^2-9)u=0.
$$

This is Bessel's equation of order $3$. Therefore:

$$
u(z)=C_1J_3(z)+C_2Y_3(z).
$$

Return to $z=2x$:

$$
\boxed{
y(x)=C_1J_3(2x)+C_2Y_3(2x)
}.
$$

</details>

<details open>
<summary><strong>Apply A Boundedness Condition</strong></summary>

Suppose the previous equation is used for $x\ge0$ and the solution must remain
bounded at $x=0$.

Near zero:

$$
J_3(2x)\sim\frac{1}{\Gamma(4)}x^3=\frac{x^3}{6},
$$

so $J_3(2x)$ remains finite and tends to zero. In contrast, $Y_3(2x)$ is
singular at zero.

Therefore boundedness forces:

$$
C_2=0.
$$

The admissible family becomes:

$$
\boxed{y(x)=C_1J_3(2x).}
$$

The condition did not solve for $C_1$ because every multiple of a bounded
solution is still bounded. A normalization or another boundary condition would
be needed to determine it.

</details>

<details open>
<summary><strong>The Spherical Bessel Equation</strong></summary>

The spherical Bessel equation is:

$$
x^2u''+2xu'+\left[x^2-\ell(\ell+1)\right]u=0.
$$

The coefficient of $xu'$ is $2$, not $1$, so this is not yet ordinary Bessel
form. Remove the mismatch by setting:

$$
u(x)=x^{-1/2}v(x).
$$

Differentiate using the product rule:

$$
u'
=-\frac12x^{-3/2}v+x^{-1/2}v',
$$

and differentiate once more:

$$
u''
=\frac34x^{-5/2}v-x^{-3/2}v'+x^{-1/2}v''.
$$

The middle coefficient $-1$ comes from adding two copies of
$-(1/2)x^{-3/2}v'$.

</details>

<details open>
<summary><strong>Complete The Spherical Transformation</strong></summary>

Substitute the derivatives into:

$$
x^2u''+2xu'+[x^2-\ell(\ell+1)]u=0.
$$

First calculate:

$$
x^2u''
=\frac34x^{-1/2}v-x^{1/2}v'+x^{3/2}v'',
$$

The contribution from $2xu'$ is:

$$
2xu'
=-x^{-1/2}v+2x^{1/2}v'.
$$

The final term is:

$$
[x^2-\ell(\ell+1)]u
=[x^2-\ell(\ell+1)]x^{-1/2}v.
$$

Add the three expressions and factor out $x^{-1/2}$:

$$
x^{-1/2}
\left\{
x^2v''+xv'
+\left[x^2-\ell(\ell+1)-\frac14\right]v
\right\}=0.
$$

For $x>0$, multiply by $x^{1/2}$:

$$
x^2v''+xv'
+\left[x^2-\ell(\ell+1)-\frac14\right]v=0.
$$

Complete the square in the order term:

$$
\ell(\ell+1)+\frac14
=\ell^2+\ell+\frac14
=\left(\ell+\frac12\right)^2.
$$

Therefore:

$$
x^2v''+xv'
+\left[x^2-\left(\ell+\frac12\right)^2\right]v=0.
$$

This is Bessel's equation of order $\ell+1/2$.

</details>

<details open>
<summary><strong>Half-Integer Orders Become Trigonometric</strong></summary>

The first half-integer functions are:

$$
J_{1/2}(x)=\sqrt{\frac{2}{\pi x}}\sin x,
$$

The second half-integer function is:

$$
J_{-1/2}(x)=\sqrt{\frac{2}{\pi x}}\cos x.
$$

For $\ell=0$, the spherical equation is:

$$
x^2u''+2xu'+x^2u=0.
$$

Since $u=x^{-1/2}v$ and $v$ has order $1/2$:

$$
u(x)
=x^{-1/2}\left[C_1J_{1/2}(x)+C_2J_{-1/2}(x)\right].
$$

Insert the trigonometric forms:

$$
u(x)
=\sqrt{\frac{2}{\pi}}\left[
C_1\frac{\sin x}{x}
+C_2\frac{\cos x}{x}
\right].
$$

Absorb the common nonzero factor $\sqrt{2/\pi}$ into the arbitrary constants:

$$
\boxed{
u(x)=A\frac{\sin x}{x}+B\frac{\cos x}{x}
}.
$$

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

A scaled independent variable handles $\lambda^2x^2$, while a power of $x$
can correct the first-derivative coefficient. Every derivative and return
substitution must be shown explicitly.

</details>

---

## Block 8: Behaviour, Zeros, And Boundary Conditions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect the formulas with the shape of Bessel solutions and
with the boundary conditions that select particular orders or zeros.

</details>

<details open>
<summary><strong>Behaviour Near The Origin</strong></summary>

The first term of the $J_\nu$ series is:

$$
J_\nu(x)
=\frac{1}{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu
+\text{higher powers}.
$$

Therefore, for $\nu\ge0$:

$$
J_0(0)=1,
$$

while:

$$
J_\nu(0)=0
\qquad(\nu>0).
$$

The second-kind solution behaves differently:

- $Y_0(x)$ has a logarithmic singularity
- $Y_\nu(x)$ behaves like a negative power for $\nu>0$

This local behaviour often decides which solution survives a condition at the
centre before any constants are calculated.

</details>

<details open>
<summary><strong>Oscillation For Large X</strong></summary>

For fixed $\nu$ and large positive $x$:

$$
J_\nu(x)
\sim
\sqrt{\frac{2}{\pi x}}
\cos\left(
x-\frac{\nu\pi}{2}-\frac{\pi}{4}
\right).
$$

This formula has two visible parts:

- the cosine shows oscillation
- the factor $x^{-1/2}$ shows a slowly decreasing amplitude

Unlike $\sin x$, a Bessel wave does not oscillate with constant amplitude.
The geometry encoded by the $xy'$ term spreads the oscillation as $x$ grows.

</details>

<details open>
<summary><strong>Zeros Select Admissible Modes</strong></summary>

Suppose a bounded radial solution on $0\le r\le R$ has the form:

$$
u(r)=AJ_n(\lambda r).
$$

Impose the outer boundary condition:

$$
u(R)=0.
$$

Substitute $r=R$:

$$
AJ_n(\lambda R)=0.
$$

For a nontrivial solution, $A\ne0$. Divide by $A$:

$$
J_n(\lambda R)=0.
$$

Let $j_{n,k}$ denote the $k$th positive zero of $J_n$. Then:

$$
\lambda R=j_{n,k}.
$$

Solve for $\lambda$:

$$
\boxed{
\lambda_k=\frac{j_{n,k}}{R}
}.
$$

The boundary does not allow every value of $\lambda$; it selects a discrete
set of modes.

</details>

<details open>
<summary><strong>Derivative Conditions Select Derivative Zeros</strong></summary>

If the outer condition is instead:

$$
u'(R)=0,
$$

differentiate $u(r)=AJ_n(\lambda r)$ using the chain rule:

$$
u'(r)=A\lambda J_n'(\lambda r).
$$

Set $r=R$:

$$
A\lambda J_n'(\lambda R)=0.
$$

For a nontrivial mode with $A\ne0$ and $\lambda\ne0$:

$$
J_n'(\lambda R)=0.
$$

Thus value conditions involve zeros of $J_n$, while derivative conditions
involve zeros of $J_n'$.

</details>

<details open>
<summary><strong>A Preview Of Orthogonality</strong></summary>

Write the scaled Bessel equation as:

$$
r^2u''+ru'+(\lambda^2r^2-n^2)u=0.
$$

Divide by $r$:

$$
ru''+u'+\left(\lambda^2r-\frac{n^2}{r}\right)u=0.
$$

Recognize the product derivative:

$$
(ru')'=ru''+u'.
$$

Hence:

$$
(ru')'
+\left(\lambda^2r-\frac{n^2}{r}\right)u=0.
$$

This is self-adjoint form with weight $w(r)=r$. Under suitable boundary
conditions, modes corresponding to different values of $\lambda$ are
orthogonal with respect to:

$$
\langle f,g\rangle
=\int_0^R f(r)g(r)\,r\,dr.
$$

The factor $r$ is geometric: a thin circular ring has area proportional to its
radius.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

First-kind solutions are regular at the centre, large-$x$ solutions oscillate
with decaying amplitude, and outer boundary conditions select zeros of either
$J_n$ or $J_n'$.

</details>

---

## Block 9: A Reliable Gamma And Bessel Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn the chapter into a repeatable decision process and identify
the errors most likely to break a derivation.

</details>

<details open>
<summary><strong>The Workflow</strong></summary>

**Step 1: Identify the task.** Decide whether the problem concerns a gamma
value, a Bessel series, an identity, or a differential equation.

**Step 2: For gamma, move toward a known argument.** Use:

$$
\Gamma(s+1)=s\Gamma(s),
$$

until the argument reaches $1$, a positive integer, or $1/2$.

**Step 3: For a differential equation, compare all three coefficients.** Look
for:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0.
$$

**Step 4: Show the variable change.** If $z=\lambda x$, calculate both
$y'$ and $y''$ before substituting.

**Step 5: Choose the correct basis.** Use $J_\nu,Y_\nu$ for integer order on an
interval away from zero, or $J_\nu,J_{-\nu}$ for noninteger order when useful.

**Step 6: Apply centre behaviour before outer conditions.** Boundedness at
$x=0$ usually removes the $Y_\nu$ term.

**Step 7: Use identities locally.** State the derivative or neighbour formula
immediately before substituting its order.

**Step 8: Return to the original variable.** A solution in $z$ is incomplete
until $z=\lambda x$ has been restored.

</details>

<details open>
<summary><strong>Common Mistake: Confusing Gamma With Factorial</strong></summary>

The relationship is:

$$
\Gamma(n+1)=n!.
$$

Therefore:

$$
\Gamma(6)=5!=120,
$$

not $6!=720$. Always reduce the gamma argument by one before replacing it with
a factorial.

</details>

<details open>
<summary><strong>Common Mistake: Losing The New Lower Limit</strong></summary>

Under $j=k+2$:

$$
k=0\quad\longrightarrow\quad j=2.
$$

Therefore:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{j=2}^{\infty}a_{j-2}x^{j+r}.
$$

Starting the new sum at $0$ invents nonexistent coefficients $a_{-2}$ and
$a_{-1}$ and hides the indicial and $a_1$ equations.

</details>

<details open>
<summary><strong>Common Mistake: Using J Plus And J Minus At Integer Order</strong></summary>

For integer $n$:

$$
J_{-n}=(-1)^nJ_n.
$$

Using $J_{-n}=(-1)^nJ_n$, the proposed combination becomes:

$$
C_1J_n+C_2J_{-n}
=\left[C_1+(-1)^nC_2\right]J_n,
$$

which contains only one independent direction. Use $J_n$ and $Y_n$ for the
general solution instead.

</details>

<details open>
<summary><strong>Common Mistake: Dropping A Chain-Rule Factor</strong></summary>

If $z=3x$ and $y(x)=u(z)$:

$$
y'=3u_z,
$$

but the second derivative is:

$$
y''=9u_{zz},
$$

not $3u_{zz}$. The factor appears once for each differentiation with respect
to $x$.

</details>

<details open>
<summary><strong>Common Mistake: Rejecting A Singular Solution Too Early</strong></summary>

$Y_\nu$ is singular at the origin, but that does not make it invalid on every
domain. On an annulus or any interval $a<x<b$ with $a>0$, the origin is outside
the domain and both $J_\nu$ and $Y_\nu$ may be needed.

Reject a solution because it violates the stated domain or condition, not
because it is singular somewhere the problem never includes.

</details>

<details open>
<summary><strong>Common Mistake: Treating An Asymptotic Formula As Equality</strong></summary>

The notation:

$$
J_\nu(x)\sim
\sqrt{\frac{2}{\pi x}}
\cos\left(x-\frac{\nu\pi}{2}-\frac\pi4\right)
$$

describes leading behaviour as $x\to\infty$. It is not an exact identity for
finite $x$. Use the defining series, recurrence identities, or numerical
evaluation when exact finite-$x$ information is required.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

Reliable work depends on preserving index limits, gamma shifts, chain-rule
factors, solution independence, domains, and the distinction between exact and
asymptotic formulas.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Gamma And Series Algebra</strong></summary>

**Problem 1: Evaluate Gamma At An Integer.** Find $\Gamma(8)$.

**Problem 2: Evaluate A Half-Integer.** Find $\Gamma(9/2)$ exactly.

**Problem 3: Move To A Negative Argument.** Find $\Gamma(-3/2)$ exactly.

**Problem 4: Reindex A Series.** Rewrite:

$$
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}
$$

as a series in powers $x^j$ beginning at the correct lower limit.

</details>

<details open>
<summary><strong>Problems 5 To 8: Bessel Series And Identities</strong></summary>

**Problem 5: Build A Series.** Write the first four nonzero terms of $J_3(x)$.

**Problem 6: Check The Leading Behaviour.** Use the defining series to show:

$$
J_{5/2}(x)
\sim
\frac{1}{\Gamma(7/2)}\left(\frac{x}{2}\right)^{5/2}
\qquad(x\to0^+).
$$

Then simplify the coefficient using $\Gamma(7/2)$.

**Problem 7: Use A Neighbour Recurrence.** Express $J_3(x)$ in terms of
$J_2(x)$ and $J_1(x)$.

**Problem 8: Differentiate Without The Full Series.** Express $J_2'(x)$ in
terms of $J_1(x)$ and $J_3(x)$.

</details>

<details open>
<summary><strong>Problems 9 To 12: Differential Equations And Conditions</strong></summary>

**Problem 9: Solve A Scaled Equation.** Solve on $x>0$:

$$
x^2y''+xy'+(25x^2-4)y=0.
$$

**Problem 10: Apply Boundedness.** From the general solution in Problem 9,
retain only the solutions bounded at $x=0$.

**Problem 11: Recognize A Half-Integer Order.** Transform:

$$
x^2u''+2xu'+(x^2-2)u=0
$$

using $u=x^{-1/2}v$. Identify the Bessel order.

**Problem 12: Extract A Boundary Condition.** Suppose:

$$
u(r)=AJ_2(\lambda r)
$$

is nontrivial on $0\le r\le3$ and satisfies $u(3)=0$. Write the allowed values
of $\lambda$ in terms of the positive zeros $j_{2,k}$ of $J_2$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

For a positive integer $n$:

$$
\Gamma(n)=(n-1)!.
$$

Set $n=8$:

$$
\begin{aligned}
\Gamma(8)
&=(8-1)!\\
&=7!\\
&=\boxed{5040}.
\end{aligned}
$$

### Answer 2

Use the recurrence until the argument reaches $1/2$:

$$
\begin{aligned}
\Gamma\left(\frac92\right)
&=\frac72\Gamma\left(\frac72\right)\\
&=\frac72\cdot\frac52\Gamma\left(\frac52\right)\\
&=\frac72\cdot\frac52\cdot\frac32
\Gamma\left(\frac32\right)\\
&=\frac72\cdot\frac52\cdot\frac32\cdot\frac12
\Gamma\left(\frac12\right).
\end{aligned}
$$

Insert $\Gamma(1/2)=\sqrt\pi$:

$$
\boxed{
\Gamma\left(\frac92\right)
=\frac{105\sqrt\pi}{16}
}.
$$

### Answer 3

Start with the recurrence at $s=-1/2$:

$$
\Gamma\left(\frac12\right)
=-\frac12\Gamma\left(-\frac12\right).
$$

Therefore:

$$
\Gamma\left(-\frac12\right)=-2\sqrt\pi.
$$

Now use the recurrence at $s=-3/2$:

$$
\Gamma\left(-\frac12\right)
=-\frac32\Gamma\left(-\frac32\right).
$$

Divide by $-3/2$:

$$
\begin{aligned}
\Gamma\left(-\frac32\right)
&=\frac{-2\sqrt\pi}{-3/2}\\
&=(-2\sqrt\pi)\left(-\frac23\right)\\
&=\boxed{\frac{4\sqrt\pi}{3}}.
\end{aligned}
$$

### Answer 4

Begin with:

$$
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}.
$$

Set:

$$
j=k+3.
$$

From $j=k+3$, solve for $k$ and $k+1$:

$$
k=j-3,
\qquad
k+1=j-2.
$$

When $k=0$, $j=3$. Therefore:

$$
\boxed{
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}
=\sum_{j=3}^{\infty}(j-2)a_{j-3}x^j
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

For $\nu=3$:

$$
J_3(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+4)}
\left(\frac{x}{2}\right)^{2m+3}.
$$

Calculate one term at a time:

$$
\begin{aligned}
m=0:&\quad
\frac1{\Gamma(4)}\left(\frac{x}{2}\right)^3
=\frac{x^3}{48},\\
m=1:&\quad
-\frac1{\Gamma(5)}\left(\frac{x}{2}\right)^5
=-\frac{x^5}{768},\\
m=2:&\quad
\frac1{2!\Gamma(6)}\left(\frac{x}{2}\right)^7
=\frac{x^7}{30720},\\
m=3:&\quad
-\frac1{3!\Gamma(7)}\left(\frac{x}{2}\right)^9
=-\frac{x^9}{2211840}.
\end{aligned}
$$

Hence:

$$
\boxed{
J_3(x)
=\frac{x^3}{48}-\frac{x^5}{768}
+\frac{x^7}{30720}-\frac{x^9}{2211840}+\cdots
}.
$$

### Answer 6

The $m=0$ term of the defining series is:

$$
J_\nu(x)
\sim
\frac1{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu.
$$

Set $\nu=5/2$:

$$
J_{5/2}(x)
\sim
\frac1{\Gamma(7/2)}
\left(\frac{x}{2}\right)^{5/2}.
$$

From Block 2:

$$
\Gamma\left(\frac72\right)=\frac{15\sqrt\pi}{8}.
$$

Therefore:

$$
\frac1{\Gamma(7/2)}=\frac8{15\sqrt\pi}.
$$

The simplified leading behaviour is:

$$
\boxed{
J_{5/2}(x)
\sim
\frac8{15\sqrt\pi}
\left(\frac{x}{2}\right)^{5/2}
}.
$$

### Answer 7

The neighbour sum is:

$$
J_{\nu-1}+J_{\nu+1}
=\frac{2\nu}{x}J_\nu.
$$

To involve $J_1,J_2,J_3$, set $\nu=2$:

$$
J_1+J_3=\frac4xJ_2.
$$

From $J_1+J_3=(4/x)J_2$, subtract $J_1$ from both sides:

$$
\boxed{
J_3(x)=\frac4xJ_2(x)-J_1(x)
}.
$$

### Answer 8

Use the neighbour-difference derivative identity:

$$
J_\nu'
=\frac12(J_{\nu-1}-J_{\nu+1}).
$$

Set $\nu=2$:

$$
\boxed{
J_2'(x)=\frac12\left[J_1(x)-J_3(x)\right]
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

The equation is:

$$
x^2y''+xy'+(25x^2-4)y=0.
$$

Compare it with:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0.
$$

Match the parameters:

$$
\lambda^2=25,
\qquad
\nu^2=4.
$$

Choose $\lambda=5$ and $\nu=2$. Set:

$$
z=5x,
\qquad
y(x)=u(z).
$$

Then:

$$
y'=5u_z,
\qquad
y''=25u_{zz},
\qquad
x=\frac z5.
$$

Substitute:

$$
\left(\frac z5\right)^2(25u_{zz})
+\left(\frac z5\right)(5u_z)
+\left[25\left(\frac z5\right)^2-4\right]u=0.
$$

Simplify:

$$
z^2u_{zz}+zu_z+(z^2-4)u=0.
$$

This is Bessel's equation of order $2$, so:

$$
u=C_1J_2(z)+C_2Y_2(z).
$$

Return to $z=5x$:

$$
\boxed{
y(x)=C_1J_2(5x)+C_2Y_2(5x)
}.
$$

### Answer 10

From Answer 9:

$$
y(x)=C_1J_2(5x)+C_2Y_2(5x).
$$

Because $J_2(5x)$ is bounded and $Y_2(5x)$ is singular at zero,
boundedness requires:

$$
C_2=0.
$$

The bounded family is:

$$
\boxed{y(x)=C_1J_2(5x).}
$$

### Answer 11

The equation is:

$$
x^2u''+2xu'+(x^2-2)u=0.
$$

This is the spherical equation with:

$$
\ell(\ell+1)=2.
$$

The nonnegative integer solution is $\ell=1$, since:

$$
1(1+1)=2.
$$

Set $u=x^{-1/2}v$. The transformation derived in Block 7 gives:

$$
x^2v''+xv'
+\left[x^2-\left(\ell+\frac12\right)^2\right]v=0.
$$

Substitute $\ell=1$:

$$
x^2v''+xv'
+\left[x^2-\left(\frac32\right)^2\right]v=0.
$$

The transformed equation has $(3/2)^2$ as its order term. Therefore the
Bessel order is:

$$
\boxed{\nu=\frac32.}
$$

### Answer 12

The outer condition is:

$$
u(3)=0.
$$

Substitute $u(r)=AJ_2(\lambda r)$:

$$
AJ_2(3\lambda)=0.
$$

The solution is nontrivial, so $A\ne0$. Divide by $A$:

$$
J_2(3\lambda)=0.
$$

If $j_{2,k}$ is the $k$th positive zero of $J_2$, then:

$$
3\lambda=j_{2,k}.
$$

Divide by $3$:

$$
\boxed{
\lambda_k=\frac{j_{2,k}}{3},
\qquad k=1,2,3,\ldots
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 30 Final Summary</strong></summary>

The gamma function extends factorial structure:

$$
\Gamma(s)=\int_0^\infty t^{s-1}e^{-t}\,dt,
\qquad
\Gamma(s+1)=s\Gamma(s),
$$

with:

$$
\Gamma(n+1)=n!,
\qquad
\Gamma\left(\frac12\right)=\sqrt\pi.
$$

Bessel's equation of order $\nu$ is:

$$
x^2y''+xy'+(x^2-\nu^2)y=0.
$$

Its normalized first-kind Frobenius solution is:

$$
J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+\nu+1)}
\left(\frac{x}{2}\right)^{2m+\nu}.
$$

The central identities are:

$$
\begin{aligned}
J_{\nu-1}+J_{\nu+1}
&=\frac{2\nu}{x}J_\nu,\\
J_\nu'
&=\frac12(J_{\nu-1}-J_{\nu+1}).
\end{aligned}
$$

For integer order, a full basis away from the origin is $J_n,Y_n$.
Boundedness at the origin usually removes $Y_n$, while an outer boundary
condition selects zeros of $J_n$ or $J_n'$.

> gamma notation packages the coefficients, Frobenius' method constructs the
> solution, recurrence identities make it usable, and boundary conditions
> select the physically admissible modes.

</details>
