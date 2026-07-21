```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 30}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Gamma And Bessel Functions}
```
# Chapter 30 - Gamma And Bessel Functions

```{=latex}
\Needspace{10\baselineskip}
```
Power-series solutions often contain products such as:

$$
(\nu+1)(\nu+2)\cdots(\nu+m).
$$

When $\nu$ is not an integer, ordinary factorial notation cannot describe this
product cleanly. The gamma function supplies the missing notation. It then
allows the Frobenius solution of Bessel's equation to be written as a single
named function: the Bessel function $J_\nu$.

This chapter will:

-   define the gamma function and derive its recurrence
-   connect gamma values with factorials and half-integer factorials
-   make changes of index in infinite series explicit
-   derive $J_\nu(x)$ from Bessel's differential equation by Frobenius' method
-   construct the low-order functions $J_0$, $J_1$, and $J_2$
-   explain when a second solution $Y_\nu$ is required
-   derive the main derivative and neighbouring-order identities
-   transform related differential equations into Bessel form
-   interpret the behaviour and zeros of Bessel functions
-   build a reliable workflow for solving Bessel-type equations

```{=latex}
\Needspace{20\baselineskip}
```
## Why A New Function Appears {#block-1-why-a-new-function-appears}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to recognise Bessel's equation and understand why its solutions
cannot usually be written using only elementary functions.

```{=latex}
\Needspace{8\baselineskip}
```
> a named special function is not a shortcut around the differential
> equation; it is a carefully normalized solution produced by the equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Bessel's Differential Equation {#bessels-differential-equation-2}

```{=latex}
\Needspace{10\baselineskip}
```
For a fixed real number $\nu$, Bessel's equation of order $\nu$ is:

$$
\boxed{
x^2y''+xy'+(x^2-\nu^2)y=0
}.
$$

The symbols have different jobs:

-   $x$ is the independent variable
-   $y(x)$ is the unknown function
-   $\nu$ is the order of the equation
-   $\nu$ is fixed while the equation is being solved

```{=latex}
\Needspace{10\baselineskip}
```
Dividing by $x^2$, for $x\ne0$, gives normalized form:

$$
y''+\frac1x y'
+\left(1-\frac{\nu^2}{x^2}\right)y=0.
$$

The coefficients $1/x$ and $\nu^2/x^2$ are singular at $x=0$. This is why an
ordinary Taylor series is not the natural first choice there.

```{=latex}
\Needspace{12\baselineskip}
```
### Classify The Origin {#classify-the-origin-3}

```{=latex}
\Needspace{10\baselineskip}
```
Write the normalized equation as:

$$
y''+P(x)y'+Q(x)y=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
P(x)=\frac1x,
\qquad
Q(x)=1-\frac{\nu^2}{x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To test $x=0$, calculate:

$$
xP(x)=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
x^2Q(x)=x^2-\nu^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both expressions are analytic at $0$. Therefore:

$$
\boxed{x=0\text{ is a regular singular point}.}
$$

The Frobenius method from Chapter 28 is therefore the appropriate tool.

```{=latex}
\Needspace{12\baselineskip}
```
### Where The Equation Comes From {#where-the-equation-comes-from-4}

```{=latex}
\Needspace{10\baselineskip}
```
Bessel's equation commonly appears when a problem has circular or cylindrical
geometry. After variables are separated, the radial part often has the form:

$$
r^2R''+rR'+(\lambda^2r^2-\nu^2)R=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To convert this radial equation to standard Bessel form, set:

$$
x=\lambda r.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The chain rule gives:

$$
\frac{dR}{dr}
=\lambda\frac{dR}{dx},
\qquad
\frac{d^2R}{dr^2}
=\lambda^2\frac{d^2R}{dx^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $r=x/\lambda$, substitution produces:

$$
x^2R_{xx}+xR_x+(x^2-\nu^2)R=0.
$$

Thus the same normalized equation describes many different radial models.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Gamma Will Be Needed {#why-gamma-will-be-needed-5}

```{=latex}
\Needspace{10\baselineskip}
```
The Frobenius recurrence for Bessel's equation will generate products of the
form:

$$
(\nu+1)(\nu+2)\cdots(\nu+m).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $\nu=3$, this product can be written using factorials:

$$
4\cdot5\cdots(3+m)=\frac{(m+3)!}{3!}.
$$

If $\nu=1/2$, expressions such as $(m+1/2)!$ are not ordinary factorials.
The gamma function extends factorial notation to such values.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

Bessel's equation has a regular singular point at the origin. Frobenius' method
is therefore natural, and the resulting products require a factorial-like
function that also accepts noninteger inputs.

```{=latex}
\Needspace{20\baselineskip}
```
## The Gamma Function {#block-2-the-gamma-function}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to define $\Gamma(s)$, derive its recurrence without skipping the
integration-by-parts boundary term, and use it to evaluate integer,
half-integer, and negative noninteger arguments.

```{=latex}
\Needspace{12\baselineskip}
```
### The Defining Integral {#the-defining-integral-8}

```{=latex}
\Needspace{10\baselineskip}
```
For $s>0$, define:

$$
\boxed{
\Gamma(s)=\int_0^\infty t^{s-1}e^{-t}\,dt
}.
$$

The integration variable $t$ is a dummy variable. It has no connection with
the argument $s$.

Two competing factors make the integral finite:

-   near $t=0$, the power $t^{s-1}$ is integrable when $s>0$
-   as $t\to\infty$, the exponential $e^{-t}$ decays faster than any power grows

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
\Gamma(1)=\int_0^\infty e^{-t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Gamma Recurrence {#derive-the-gamma-recurrence-9}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the definition with argument $s+1$:

$$
\Gamma(s+1)=\int_0^\infty t^s e^{-t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use integration by parts. Choose:

$$
u=t^s,
\qquad
dv=e^{-t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
du=st^{s-1}\,dt,
\qquad
v=-e^{-t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $\int u\,dv=uv-\int v\,du$ on $[0,b]$:

$$
\int_0^b t^se^{-t}\,dt
=\left[-t^se^{-t}\right]_0^b
+s\int_0^b t^{s-1}e^{-t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now take $b\to\infty$. For $s>0$, both endpoint contributions vanish:

$$
\lim_{b\to\infty}b^se^{-b}=0,
\qquad
\lim_{t\to0^+}t^se^{-t}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the boundary term is zero, leaving:

$$
\Gamma(s+1)
=s\int_0^\infty t^{s-1}e^{-t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recognize the remaining integral as $\Gamma(s)$:

$$
\boxed{
\Gamma(s+1)=s\Gamma(s)
}.
$$

The exponential wins over the power at infinity.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### Recover Ordinary Factorials {#recover-ordinary-factorials-10}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Gamma(1)=1$:

$$
\boxed{\Gamma(n+1)=n!}
\qquad
(n=0,1,2,\ldots).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Notice the shift:

$$
\Gamma(n)=(n-1)!,
$$

```{=latex}
\Needspace{10\baselineskip}
```
not $n!$. For example:

$$
\Gamma(5)=4!=24.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Half-Integer Starting Value {#the-half-integer-starting-value-11}

```{=latex}
\Needspace{10\baselineskip}
```
A fundamental value is:

$$
\boxed{\Gamma\left(\frac12\right)=\sqrt\pi}.
$$

It follows from the Gaussian integral.[^2] Once this starting value
is known, the recurrence produces every positive half-integer value.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
\begin{aligned}
\Gamma\left(\frac32\right)
&=\frac12\Gamma\left(\frac12\right)\\
&=\frac{\sqrt\pi}{2},
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\begin{aligned}
\Gamma\left(\frac52\right)
&=\frac32\Gamma\left(\frac32\right)\\
&=\frac32\cdot\frac{\sqrt\pi}{2}\\
&=\frac{3\sqrt\pi}{4}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Move To Negative Nonintegers {#move-to-negative-nonintegers-12}

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange the recurrence:

$$
\Gamma(s)=\frac{\Gamma(s+1)}{s},
\qquad s\ne0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This relation extends gamma to negative noninteger arguments. For example,
set $s=-1/2$:

$$
\Gamma\left(-\frac12\right)
=\frac{\Gamma(1/2)}{-1/2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Dividing by $-1/2$ is multiplying by $-2$:

$$
\boxed{
\Gamma\left(-\frac12\right)=-2\sqrt\pi
}.
$$

At $s=0,-1,-2,\ldots$, repeated use of the recurrence would require division
by zero. Gamma has poles at these values; it is not finite there.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Gamma Calculation {#worked-gamma-calculation-13}

Evaluate $\Gamma(7/2)$ exactly.

```{=latex}
\Needspace{10\baselineskip}
```
Move downward one step at a time:

$$
\Gamma\left(\frac72\right)
=\frac52\Gamma\left(\frac52\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the recurrence again:

$$
\Gamma\left(\frac52\right)
=\frac32\Gamma\left(\frac32\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
And once more:

$$
\Gamma\left(\frac32\right)
=\frac12\Gamma\left(\frac12\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Convert A Product Into Gamma Notation {#convert-a-product-into-gamma-notation-14}

```{=latex}
\Needspace{10\baselineskip}
```
For any $\nu$ for which the gamma values exist:

$$
\Gamma(\nu+m+1)
=(\nu+m)\Gamma(\nu+m).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Continue the recurrence down to $\Gamma(\nu+1)$:

$$
\Gamma(\nu+m+1)
=(\nu+m)(\nu+m-1)\cdots(\nu+1)\Gamma(\nu+1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $\Gamma(\nu+1)$:

$$
\boxed{
(\nu+1)(\nu+2)\cdots(\nu+m)
=\frac{\Gamma(\nu+m+1)}{\Gamma(\nu+1)}
}.
$$

This is the exact product that will occur in the Bessel coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

The gamma function satisfies $\Gamma(s+1)=s\Gamma(s)$, agrees with shifted
factorials at integers, and makes noninteger factorial-like products precise.

```{=latex}
\Needspace{20\baselineskip}
```
## Reindexing Infinite Series Safely {#block-3-reindexing-infinite-series-safely}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to make every change of index explicit before applying Frobenius'
method to Bessel's equation.

```{=latex}
\Needspace{8\baselineskip}
```
> changing an index changes the label and usually the lower limit; it does not
> change the terms represented by the series.

```{=latex}
\Needspace{12\baselineskip}
```
### A Dummy Index Can Be Renamed {#a-dummy-index-can-be-renamed-17}

```{=latex}
\Needspace{10\baselineskip}
```
The letters $k$, $m$, and $j$ are labels inside a summation. Therefore:

$$
\sum_{k=0}^{\infty}a_kx^k
=\sum_{j=0}^{\infty}a_jx^j.
$$

Only the label changed. The lower limit, upper limit, coefficient subscript,
and exponent still describe the same sequence of terms.

This is different from replacing $k$ by $j-2$, which is a genuine change of
index and changes the limits.

```{=latex}
\Needspace{12\baselineskip}
```
### Reindex A Shifted Power {#reindex-a-shifted-power-18}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
We want the exponent to be $j$. Set:

$$
j=k+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the old index:

$$
k=j-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When $k=0$, the new index is $j=2$. Therefore:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{j=2}^{\infty}a_{j-2}x^j.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally rename $j$ as $k$ if desired:

$$
\boxed{
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{k=2}^{\infty}a_{k-2}x^k
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Expose The Missing Low-Index Terms {#expose-the-missing-low-index-terms-19}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose we need to combine:

$$
\sum_{k=0}^{\infty}A_kx^k
+\sum_{k=2}^{\infty}B_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second series has no $x^0$ or $x^1$ term. Separate those terms from the
first series:

$$
\sum_{k=0}^{\infty}A_kx^k
=A_0+A_1x+\sum_{k=2}^{\infty}A_kx^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now combine only the ranges that match:

$$
A_0+A_1x
+\sum_{k=2}^{\infty}(A_k+B_k)x^k.
$$

This separation is what produces an indicial equation, an $a_1$ equation, and
the later coefficient recurrence in the Bessel calculation.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Changing The Exponent But Not The Coefficient {#common-mistake-changing-the-exponent-but-not-the-coefficient-20}

```{=latex}
\Needspace{10\baselineskip}
```
The incorrect step:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
\ne
\sum_{k=2}^{\infty}a_kx^k
$$

loses the relationship between each coefficient and its original term.

```{=latex}
\Needspace{10\baselineskip}
```
The correct substitution $j=k+2$ changes both:

$$
x^{k+2}\to x^j,
\qquad
a_k\to a_{j-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\sum_{k=0}^{\infty}a_kx^{k+2}
=\sum_{j=2}^{\infty}a_{j-2}x^j.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-21}

To reindex safely, define the new index, solve for the old index, transform the
coefficient subscript, and recalculate the lower limit before renaming the
dummy variable.

```{=latex}
\Needspace{20\baselineskip}
```
## Deriving The Bessel Function Of The First Kind {#block-4-deriving-the-bessel-function-of-the-first-kind}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-22}

The goal is to derive the complete series for $J_\nu(x)$ from Bessel's equation,
including the indicial equation, the odd-coefficient chain, the even
coefficients, and the normalization.

```{=latex}
\Needspace{12\baselineskip}
```
### Begin With A Frobenius Series {#begin-with-a-frobenius-series-23}

```{=latex}
\Needspace{10\baselineskip}
```
Start from Bessel's equation:

$$
x^2y''+xy'+(x^2-\nu^2)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y=\sum_{k=0}^{\infty}a_kx^{k+r},
\qquad a_0\ne0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate term by term:

$$
y'=\sum_{k=0}^{\infty}(k+r)a_kx^{k+r-1},
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding second derivative is:

$$
y''=\sum_{k=0}^{\infty}(k+r)(k+r-1)a_kx^{k+r-2}.
$$

The order $\nu$, Frobenius exponent $r$, and summation index $k$ are three
different quantities.

```{=latex}
\Needspace{12\baselineskip}
```
### Substitute Every Term {#substitute-every-term-24}

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the derivatives by their coefficients:

```{=latex}
\Needspace{10\baselineskip}
```
$$
x^2y''
=\sum_{k=0}^{\infty}(k+r)(k+r-1)a_kx^{k+r},
$$

```{=latex}
\Needspace{10\baselineskip}
```
$$
xy'
=\sum_{k=0}^{\infty}(k+r)a_kx^{k+r},
$$

$$
-\nu^2y
=-\sum_{k=0}^{\infty}\nu^2a_kx^{k+r},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
x^2y
=\sum_{k=0}^{\infty}a_kx^{k+r+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
In the substituted expression, simplify the first bracket:

$$
(k+r)(k+r-1)+(k+r)=(k+r)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\sum_{k=0}^{\infty}
\left[(k+r)^2-\nu^2\right]a_kx^{k+r}
+\sum_{k=0}^{\infty}a_kx^{k+r+2}=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Reindex The Shifted Series {#reindex-the-shifted-series-25}

```{=latex}
\Needspace{10\baselineskip}
```
In the second sum, set:

$$
j=k+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $k=j-2$, and the lower limit changes from $k=0$ to $j=2$:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{j=2}^{\infty}a_{j-2}x^{j+r}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rename $j$ as $k$:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{k=2}^{\infty}a_{k-2}x^{k+r}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Indicial Roots {#find-the-indicial-roots-26}

```{=latex}
\Needspace{10\baselineskip}
```
The lowest power is $x^r$. Its coefficient must vanish:

$$
(r^2-\nu^2)a_0=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $a_0\ne0$:

$$
r^2-\nu^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-\nu)(r+\nu)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the indicial roots are:

$$
\boxed{r_1=\nu,\qquad r_2=-\nu.}
$$

We first use the larger root $r=\nu$, assuming $\nu\ge0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Show Why The Odd Chain Vanishes {#show-why-the-odd-chain-vanishes-27}

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $x^{r+1}$ gives:

$$
\left[(r+1)^2-\nu^2\right]a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $r=\nu$:

$$
\left[(\nu+1)^2-\nu^2\right]a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the bracket:

$$
(\nu^2+2\nu+1-\nu^2)a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
(2\nu+1)a_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\nu\ge0$, the factor $2\nu+1$ is nonzero. Divide by it:

$$
\boxed{a_1=0.}
$$

The later recurrence moves in steps of two, so $a_3,a_5,\ldots$ will also be
zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Later-Coefficient Recurrence {#derive-the-later-coefficient-recurrence-28}

```{=latex}
\Needspace{10\baselineskip}
```
For $k\ge2$:

$$
\left[(k+r)^2-\nu^2\right]a_k+a_{k-2}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $a_{k-2}$ to the right:

$$
\left[(k+r)^2-\nu^2\right]a_k=-a_{k-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $r=\nu$:

$$
\left[(k+\nu)^2-\nu^2\right]a_k=-a_{k-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the difference of squares:

$$
(k+\nu)^2-\nu^2
=k(k+2\nu).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $k(k+2\nu)$:

$$
\boxed{
a_k=-\frac{a_{k-2}}{k(k+2\nu)},
\qquad k\ge2
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Even Coefficients {#build-the-even-coefficients-29}

```{=latex}
\Needspace{10\baselineskip}
```
Set $k=2$ in the recurrence:

$$
\begin{aligned}
a_2
&=-\frac{a_0}{2(2+2\nu)}\\
&=-\frac{a_0}{2^2(\nu+1)}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The general even coefficient is:

$$
a_{2m}
=\frac{(-1)^m a_0}
{2^{2m}m!(\nu+1)(\nu+2)\cdots(\nu+m)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the gamma product from Block 2:

$$
(\nu+1)\cdots(\nu+m)
=\frac{\Gamma(\nu+m+1)}{\Gamma(\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
a_{2m}
=\frac{(-1)^m a_0\Gamma(\nu+1)}
{2^{2m}m!\Gamma(\nu+m+1)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Choose The Standard Normalization {#choose-the-standard-normalization-30}

```{=latex}
\Needspace{10\baselineskip}
```
The Frobenius solution is:

$$
y=x^\nu\sum_{m=0}^{\infty}a_{2m}x^{2m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the coefficient formula:

$$
y
=a_0\Gamma(\nu+1)x^\nu
\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m}}
{2^{2m}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
a_0=\frac{1}{2^\nu\Gamma(\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The normalization is chosen so that, near $x=0$:

$$
J_\nu(x)
\sim
\frac{1}{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Series Recurrence Locally {#verify-the-series-recurrence-locally-31}

```{=latex}
\Needspace{10\baselineskip}
```
Let the coefficient of $x^{2m+\nu}$ in $J_\nu$ be:

$$
c_m
=\frac{(-1)^m}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare $c_m$ with $c_{m-1}$:

$$
\frac{c_m}{c_{m-1}}
=-\frac{2^{2m-2+\nu}(m-1)!\Gamma(m+\nu)}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
m!=m(m-1)!,
\qquad
\Gamma(m+\nu+1)=(m+\nu)\Gamma(m+\nu).
$$

```{=latex}
\Needspace{10\baselineskip}
```
After cancellation:

$$
\frac{c_m}{c_{m-1}}
=-\frac{1}{4m(m+\nu)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is the even-index recurrence with $k=2m$:

$$
-\frac{1}{k(k+2\nu)}
=-\frac{1}{(2m)(2m+2\nu)}
=-\frac{1}{4m(m+\nu)}.
$$

Thus the compact gamma formula preserves the recurrence derived from the
differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-32}

Frobenius' method gives indicial roots $\pm\nu$. The root $r=\nu$ produces an
even coefficient chain whose gamma-normalized series is $J_\nu(x)$.

```{=latex}
\Needspace{20\baselineskip}
```
## Low Orders And The Second Solution {#block-5-low-orders-and-the-second-solution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-33}

The goal is to construct familiar low-order Bessel functions and explain why
$J_\nu$ alone does not always provide the full two-dimensional solution space.

```{=latex}
\Needspace{12\baselineskip}
```
### Construct J Zero {#construct-j-zero-34}

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=0$ in the defining series:

$$
J_0(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+1)}
\left(\frac{x}{2}\right)^{2m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Gamma(m+1)=m!$:

$$
J_0(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{(m!)^2}
\left(\frac{x}{2}\right)^{2m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Construct J One {#construct-j-one-35}

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=1$:

$$
J_1(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+2)}
\left(\frac{x}{2}\right)^{2m+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $\Gamma(m+2)=(m+1)!$:

$$
J_1(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!(m+1)!}
\left(\frac{x}{2}\right)^{2m+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
J_1(x)=\frac{x}{2}-\frac{x^3}{16}+\frac{x^5}{384}-\cdots
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Construct J Two {#construct-j-two-36}

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=2$:

$$
J_2(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+3)}
\left(\frac{x}{2}\right)^{2m+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Check J Zero In Its Equation {#check-j-zero-in-its-equation-37}

```{=latex}
\Needspace{10\baselineskip}
```
The order-zero equation is:

$$
x^2y''+xy'+x^2y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the truncated series:

$$
y=1-\frac{x^2}{4}+\frac{x^4}{64}+O(x^6).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

```{=latex}
\Needspace{10\baselineskip}
```
$$
y'=-\frac{x}{2}+\frac{x^3}{16}+O(x^5),
$$

$$
y''=-\frac12+\frac{3x^2}{16}+O(x^4).
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{10\baselineskip}
```
Substitute each contribution into
$x^2y''+xy'+x^2y$:

```{=latex}
\Needspace{10\baselineskip}
```
$$
x^2y''=-\frac{x^2}{2}+\frac{3x^4}{16}+O(x^6),
$$

```{=latex}
\Needspace{10\baselineskip}
```
$$
xy'=-\frac{x^2}{2}+\frac{x^4}{16}+O(x^6),
$$

$$
x^2y=x^2-\frac{x^4}{4}+O(x^6).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Use The Other Indicial Root {#use-the-other-indicial-root-38}

```{=latex}
\Needspace{10\baselineskip}
```
The second indicial root is $r=-\nu$. Repeating the Frobenius construction
formally gives $J_{-\nu}(x)$:

$$
J_{-\nu}(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m-\nu+1)}
\left(\frac{x}{2}\right)^{2m-\nu}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $\nu$ is not an integer, $J_\nu$ and $J_{-\nu}$ are generally linearly
independent. On an interval with $x>0$, the general solution may then be written:

$$
y=C_1J_\nu(x)+C_2J_{-\nu}(x).
$$

Their different leading powers, $x^\nu$ and $x^{-\nu}$, make the independence
visible near the origin when $\nu>0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Integer Orders Need Y {#why-integer-orders-need-y-39}

```{=latex}
\Needspace{10\baselineskip}
```
For an integer $n$:

$$
J_{-n}(x)=(-1)^nJ_n(x).
$$

Thus $J_n$ and $J_{-n}$ point in the same solution direction. They cannot form
a basis for a second-order equation.

```{=latex}
\Needspace{10\baselineskip}
```
A second independent solution is called the Bessel function of the second
kind and is denoted $Y_\nu(x)$. For noninteger $\nu$, it can be defined by:

$$
Y_\nu(x)
=\frac{J_\nu(x)\cos(\pi\nu)-J_{-\nu}(x)}
{\sin(\pi\nu)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Order-Zero Second Solution {#the-order-zero-second-solution-40}

```{=latex}
\Needspace{10\baselineskip}
```
For $\nu=0$, the indicial root is repeated. Frobenius theory warns that the
second solution may contain a logarithm. That is exactly what happens:

$$
Y_0(x)
=\frac{2}{\pi}\left(\ln\frac{x}{2}+\gamma\right)J_0(x)
+\text{a regular power series},
$$

where $\gamma$ is the Euler--Mascheroni constant.

```{=latex}
\Needspace{10\baselineskip}
```
The important structural point is not the full coefficient formula. It is:

$$
Y_0(x)\sim\frac{2}{\pi}\ln x
\qquad(x\to0^+).
$$

Therefore $Y_0$ is unbounded at the origin, whereas $J_0(0)=1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-41}

The first-kind solutions $J_0,J_1,J_2,\ldots$ come directly from the gamma
series. Noninteger orders can use $J_\nu$ and $J_{-\nu}$ as a basis, but integer
orders require the independent second-kind solution $Y_n$.

```{=latex}
\Needspace{20\baselineskip}
```
## Derivative And Neighbouring-Order Identities {#block-6-derivative-and-neighbouring-order-identities}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-42}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to derive a small set of identities that replace repeated
differentiation of the full infinite series.

```{=latex}
\Needspace{8\baselineskip}
```
> the order behaves like an index in a polynomial family: differentiation
> connects neighbouring orders.

```{=latex}
\Needspace{12\baselineskip}
```
### Differentiate A Scaled Bessel Function {#differentiate-a-scaled-bessel-function-43}

```{=latex}
\Needspace{10\baselineskip}
```
Start with the series for $J_\nu$:

$$
J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+\nu}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $x^{-\nu}$:

$$
x^{-\nu}J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate term by term. The $m=0$ term has derivative zero, so begin at
$m=1$:

$$
\frac{d}{dx}\left(x^{-\nu}J_\nu(x)\right)
=\sum_{m=1}^{\infty}
\frac{(-1)^m(2m)x^{2m-1}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $m!=m(m-1)!$ and cancel $m$:

$$
=\sum_{m=1}^{\infty}
\frac{(-1)^m x^{2m-1}}
{2^{2m+\nu-1}(m-1)!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $j=m-1$. Then $m=j+1$ and the lower limit becomes $j=0$:

$$
=-\sum_{j=0}^{\infty}
\frac{(-1)^j x^{2j+1}}
{2^{2j+\nu+1}j!\Gamma(j+\nu+2)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The series on the right is $x^{-\nu}J_{\nu+1}(x)$. Therefore:

$$
\boxed{
\frac{d}{dx}\left(x^{-\nu}J_\nu(x)\right)
=-x^{-\nu}J_{\nu+1}(x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Extract The First Derivative Formula {#extract-the-first-derivative-formula-44}

```{=latex}
\Needspace{10\baselineskip}
```
Expand the derivative on the left using the product rule:

$$
\frac{d}{dx}\left(x^{-\nu}J_\nu\right)
=-\nu x^{-\nu-1}J_\nu+x^{-\nu}J_\nu'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set this equal to the identity just derived:

$$
-\nu x^{-\nu-1}J_\nu+x^{-\nu}J_\nu'
=-x^{-\nu}J_{\nu+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $x^\nu$:

$$
-\frac{\nu}{x}J_\nu+J_\nu'=-J_{\nu+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the first term to the right:

$$
\boxed{
J_\nu'(x)=\frac{\nu}{x}J_\nu(x)-J_{\nu+1}(x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Companion Product Identity {#the-companion-product-identity-45}

```{=latex}
\Needspace{10\baselineskip}
```
To derive the companion identity, multiply the defining series by $x^\nu$:

$$
x^\nu J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+2\nu}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate term by term:

$$
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=\sum_{m=0}^{\infty}
\frac{(-1)^m(2m+2\nu)x^{2m+2\nu-1}}
{2^{2m+\nu}m!\Gamma(m+\nu+1)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $2m+2\nu=2(m+\nu)$ and use:

$$
\Gamma(m+\nu+1)=(m+\nu)\Gamma(m+\nu).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel the common factor $m+\nu$:

$$
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=\sum_{m=0}^{\infty}
\frac{(-1)^m x^{2m+2\nu-1}}
{2^{2m+\nu-1}m!\Gamma(m+\nu)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side is $x^\nu J_{\nu-1}(x)$. Therefore:

$$
\boxed{
\frac{d}{dx}\left(x^\nu J_\nu(x)\right)
=x^\nu J_{\nu-1}(x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand its left side:

$$
\nu x^{\nu-1}J_\nu+x^\nu J_\nu'
=x^\nu J_{\nu-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From
$\nu x^{\nu-1}J_\nu+x^\nu J_\nu'=x^\nu J_{\nu-1}$,
divide every term by $x^\nu$:

$$
\frac{\nu}{x}J_\nu+J_\nu'=J_{\nu-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the derivative:

$$
\boxed{
J_\nu'(x)=J_{\nu-1}(x)-\frac{\nu}{x}J_\nu(x)
}.
$$

The two derivative formulas are equivalent descriptions of the same function.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Neighbour Sum {#derive-the-neighbour-sum-46}

```{=latex}
\Needspace{10\baselineskip}
```
We now have:

$$
J_\nu'=\frac{\nu}{x}J_\nu-J_{\nu+1},
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second derivative identity is:

$$
J_\nu'=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set the right sides equal:

$$
\frac{\nu}{x}J_\nu-J_{\nu+1}
=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $J_{\nu+1}$ and $\nu J_\nu/x$ to both sides:

$$
\frac{2\nu}{x}J_\nu
=J_{\nu-1}+J_{\nu+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The rearrangement gives the neighbour sum:

$$
\boxed{
J_{\nu-1}(x)+J_{\nu+1}(x)
=\frac{2\nu}{x}J_\nu(x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Neighbour Difference {#derive-the-neighbour-difference-47}

```{=latex}
\Needspace{10\baselineskip}
```
Use the same two derivative equations:

$$
J_\nu'=\frac{\nu}{x}J_\nu-J_{\nu+1},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
J_\nu'=J_{\nu-1}-\frac{\nu}{x}J_\nu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the equations. On the right, the two $\nu J_\nu/x$ terms cancel:

$$
\begin{aligned}
2J_\nu'
&=\frac{\nu}{x}J_\nu-J_{\nu+1}
+J_{\nu-1}-\frac{\nu}{x}J_\nu\\
&=J_{\nu-1}-J_{\nu+1}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
\boxed{
J_\nu'(x)
=\frac12\left[J_{\nu-1}(x)-J_{\nu+1}(x)\right]
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Identity Check At Order One {#worked-identity-check-at-order-one-48}

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=1$ in the neighbour sum:

$$
J_0(x)+J_2(x)=\frac{2}{x}J_1(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the series through terms of degree four:

```{=latex}
\Needspace{10\baselineskip}
```
$$
J_0(x)=1-\frac{x^2}{4}+\frac{x^4}{64}+O(x^6),
$$

$$
J_2(x)=\frac{x^2}{8}-\frac{x^4}{96}+O(x^6).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add them:

$$
\begin{aligned}
J_0+J_2
&=1+\left(-\frac14+\frac18\right)x^2
+\left(\frac1{64}-\frac1{96}\right)x^4+O(x^6)\\
&=1-\frac{x^2}{8}+\frac{x^4}{192}+O(x^6).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use:

$$
J_1(x)=\frac{x}{2}-\frac{x^3}{16}+\frac{x^5}{384}+O(x^7).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-49}

The product identities yield derivative and neighbouring-order recurrences.
These formulas let us move among $J_{\nu-1}$, $J_\nu$, $J_{\nu+1}$, and
$J_\nu'$ without rebuilding an infinite series.

```{=latex}
\Needspace{20\baselineskip}
```
## Solving Equations By Transforming To Bessel Form {#block-7-solving-equations-by-transforming-to-bessel-form}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-50}

The goal is to identify a scaled Bessel equation, carry the chain rule through
the substitution, and handle spherical Bessel equations using a dependent-
variable transformation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Scaled Bessel Equation {#a-scaled-bessel-equation-51}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0,
\qquad \lambda>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define a new independent variable:

$$
z=\lambda x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $z=\lambda x$, write the dependent variable as:

$$
y(x)=u(z).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first derivative is:

$$
\frac{dy}{dx}
=\frac{du}{dz}\frac{dz}{dx}
=\lambda u_z.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\frac{d^2y}{dx^2}
=\lambda\frac{d}{dx}(u_z)
=\lambda u_{zz}\frac{dz}{dx}
=\lambda^2u_{zz}.
$$

Also $x=z/\lambda$. These three substitutions must all be used together.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Scaled Equation {#worked-scaled-equation-52}

```{=latex}
\Needspace{10\baselineskip}
```
Solve on $x>0$:

$$
x^2y''+xy'+(4x^2-9)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare with the scaled form:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients:

$$
\lambda^2=4,
\qquad
\nu^2=9.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose $\lambda=2$ and order $\nu=3$. Set:

$$
z=2x,
\qquad
y(x)=u(z).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $z=2x$, the derivative and variable substitutions are:

$$
y'=2u_z,
\qquad
y''=4u_{zz},
\qquad
x=\frac z2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the original equation:

$$
\left(\frac{z}{2}\right)^2(4u_{zz})
+\left(\frac z2\right)(2u_z)
+\left[4\left(\frac z2\right)^2-9\right]u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify each coefficient:

$$
z^2u_{zz}+zu_z+(z^2-9)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The simplified equation is:

$$
z^2u_{zz}+zu_z+(z^2-9)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is Bessel's equation of order $3$. Therefore:

$$
u(z)=C_1J_3(z)+C_2Y_3(z).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $z=2x$:

$$
\boxed{
y(x)=C_1J_3(2x)+C_2Y_3(2x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Apply A Boundedness Condition {#apply-a-boundedness-condition-53}

Suppose the previous equation is used for $x\ge0$ and the solution must remain
bounded at $x=0$.

```{=latex}
\Needspace{10\baselineskip}
```
Near zero:

$$
J_3(2x)\sim\frac{1}{\Gamma(4)}x^3=\frac{x^3}{6},
$$

so $J_3(2x)$ remains finite and tends to zero. In contrast, $Y_3(2x)$ is
singular at zero.

```{=latex}
\Needspace{10\baselineskip}
```
Therefore boundedness forces:

$$
C_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The admissible family becomes:

$$
\boxed{y(x)=C_1J_3(2x).}
$$

The condition did not solve for $C_1$ because every multiple of a bounded
solution is still bounded. A normalization or another boundary condition would
be needed to determine it.

```{=latex}
\Needspace{12\baselineskip}
```
### The Spherical Bessel Equation {#the-spherical-bessel-equation-54}

```{=latex}
\Needspace{10\baselineskip}
```
The spherical Bessel equation is:

$$
x^2u''+2xu'+\left[x^2-\ell(\ell+1)\right]u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $xu'$ is $2$, not $1$, so this is not yet ordinary Bessel
form. Remove the mismatch by setting:

$$
u(x)=x^{-1/2}v(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate using the product rule:

$$
u'
=-\frac12x^{-3/2}v+x^{-1/2}v',
$$

```{=latex}
\Needspace{10\baselineskip}
```
and differentiate once more:

$$
u''
=\frac34x^{-5/2}v-x^{-3/2}v'+x^{-1/2}v''.
$$

The middle coefficient $-1$ comes from adding two copies of
$-(1/2)x^{-3/2}v'$.

```{=latex}
\Needspace{12\baselineskip}
```
### Complete The Spherical Transformation {#complete-the-spherical-transformation-55}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the derivatives into:

$$
x^2u''+2xu'+[x^2-\ell(\ell+1)]u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First calculate:

$$
x^2u''
=\frac34x^{-1/2}v-x^{1/2}v'+x^{3/2}v'',
$$

```{=latex}
\Needspace{10\baselineskip}
```
The contribution from $2xu'$ is:

$$
2xu'
=-x^{-1/2}v+2x^{1/2}v'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The final term is:

$$
[x^2-\ell(\ell+1)]u
=[x^2-\ell(\ell+1)]x^{-1/2}v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the three expressions and factor out $x^{-1/2}$:

$$
x^{-1/2}
\left\{
x^2v''+xv'
+\left[x^2-\ell(\ell+1)-\frac14\right]v
\right\}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x>0$, multiply by $x^{1/2}$:

$$
x^2v''+xv'
+\left[x^2-\ell(\ell+1)-\frac14\right]v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Complete the square in the order term:

$$
\ell(\ell+1)+\frac14
=\ell^2+\ell+\frac14
=\left(\ell+\frac12\right)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x^2v''+xv'
+\left[x^2-\left(\ell+\frac12\right)^2\right]v=0.
$$

This is Bessel's equation of order $\ell+1/2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Half-Integer Orders Become Trigonometric {#half-integer-orders-become-trigonometric-56}

```{=latex}
\Needspace{10\baselineskip}
```
The first half-integer functions are:

$$
J_{1/2}(x)=\sqrt{\frac{2}{\pi x}}\sin x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second half-integer function is:

$$
J_{-1/2}(x)=\sqrt{\frac{2}{\pi x}}\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\ell=0$, the spherical equation is:

$$
x^2u''+2xu'+x^2u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $u=x^{-1/2}v$ and $v$ has order $1/2$:

$$
u(x)
=x^{-1/2}\left[C_1J_{1/2}(x)+C_2J_{-1/2}(x)\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the trigonometric forms:

$$
u(x)
=\sqrt{\frac{2}{\pi}}\left[
C_1\frac{\sin x}{x}
+C_2\frac{\cos x}{x}
\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Absorb the common nonzero factor $\sqrt{2/\pi}$ into the arbitrary constants:

$$
\boxed{
u(x)=A\frac{\sin x}{x}+B\frac{\cos x}{x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-57}

A scaled independent variable handles $\lambda^2x^2$, while a power of $x$
can correct the first-derivative coefficient. Every derivative and return
substitution must be shown explicitly.

```{=latex}
\Needspace{20\baselineskip}
```
## Behaviour, Zeros, And Boundary Conditions {#block-8-behaviour-zeros-and-boundary-conditions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-58}

The goal is to connect the formulas with the shape of Bessel solutions and
with the boundary conditions that select particular orders or zeros.

```{=latex}
\Needspace{12\baselineskip}
```
### Behaviour Near The Origin {#behaviour-near-the-origin-59}

```{=latex}
\Needspace{10\baselineskip}
```
The first term of the $J_\nu$ series is:

$$
J_\nu(x)
=\frac{1}{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu
+\text{higher powers}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore, for $\nu\ge0$:

$$
J_0(0)=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
while:

$$
J_\nu(0)=0
\qquad(\nu>0).
$$

The second-kind solution behaves differently:

-   $Y_0(x)$ has a logarithmic singularity
-   $Y_\nu(x)$ behaves like a negative power for $\nu>0$

This local behaviour often decides which solution survives a condition at the
centre before any constants are calculated.

```{=latex}
\Needspace{12\baselineskip}
```
### Oscillation For Large X {#oscillation-for-large-x-60}

```{=latex}
\Needspace{10\baselineskip}
```
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

-   the cosine shows oscillation
-   the factor $x^{-1/2}$ shows a slowly decreasing amplitude

Unlike $\sin x$, a Bessel wave does not oscillate with constant amplitude.
The geometry encoded by the $xy'$ term spreads the oscillation as $x$ grows.

```{=latex}
\Needspace{12\baselineskip}
```
### Zeros Select Admissible Modes {#zeros-select-admissible-modes-61}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a bounded radial solution on $0\le r\le R$ has the form:

$$
u(r)=AJ_n(\lambda r).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Impose the outer boundary condition:

$$
u(R)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $r=R$:

$$
AJ_n(\lambda R)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nontrivial solution, $A\ne0$. Divide by $A$:

$$
J_n(\lambda R)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $j_{n,k}$ denote the $k$th positive zero of $J_n$. Then:

$$
\lambda R=j_{n,k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $\lambda$:

$$
\boxed{
\lambda_k=\frac{j_{n,k}}{R}
}.
$$

The boundary does not allow every value of $\lambda$; it selects a discrete
set of modes.

```{=latex}
\Needspace{12\baselineskip}
```
### Derivative Conditions Select Derivative Zeros {#derivative-conditions-select-derivative-zeros-62}

```{=latex}
\Needspace{10\baselineskip}
```
If the outer condition is instead:

$$
u'(R)=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
differentiate $u(r)=AJ_n(\lambda r)$ using the chain rule:

$$
u'(r)=A\lambda J_n'(\lambda r).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $r=R$:

$$
A\lambda J_n'(\lambda R)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nontrivial mode with $A\ne0$ and $\lambda\ne0$:

$$
J_n'(\lambda R)=0.
$$

Thus value conditions involve zeros of $J_n$, while derivative conditions
involve zeros of $J_n'$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Preview Of Orthogonality {#a-preview-of-orthogonality-63}

```{=latex}
\Needspace{10\baselineskip}
```
Write the scaled Bessel equation as:

$$
r^2u''+ru'+(\lambda^2r^2-n^2)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $r$:

$$
ru''+u'+\left(\lambda^2r-\frac{n^2}{r}\right)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recognize the product derivative:

$$
(ru')'=ru''+u'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
(ru')'
+\left(\lambda^2r-\frac{n^2}{r}\right)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is self-adjoint form with weight $w(r)=r$. Under suitable boundary
conditions, modes corresponding to different values of $\lambda$ are
orthogonal with respect to:

$$
\langle f,g\rangle
=\int_0^R f(r)g(r)\,r\,dr.
$$

The factor $r$ is geometric: a thin circular ring has area proportional to its
radius.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-64}

First-kind solutions are regular at the centre, large-$x$ solutions oscillate
with decaying amplitude, and outer boundary conditions select zeros of either
$J_n$ or $J_n'$.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Gamma And Bessel Workflow {#block-9-a-reliable-gamma-and-bessel-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-65}

The goal is to turn the chapter into a repeatable decision process and identify
the errors most likely to break a derivation.

```{=latex}
\Needspace{12\baselineskip}
```
### The Workflow {#the-workflow-66}

**Step 1: Identify the task.** Decide whether the problem concerns a gamma
value, a Bessel series, an identity, or a differential equation.

```{=latex}
\Needspace{10\baselineskip}
```
**Step 2: For gamma, move toward a known argument.** Use:

$$
\Gamma(s+1)=s\Gamma(s),
$$

until the argument reaches $1$, a positive integer, or $1/2$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Confusing Gamma With Factorial {#common-mistake-confusing-gamma-with-factorial-67}

```{=latex}
\Needspace{10\baselineskip}
```
The relationship is:

$$
\Gamma(n+1)=n!.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\Gamma(6)=5!=120,
$$

not $6!=720$. Always reduce the gamma argument by one before replacing it with
a factorial.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing The New Lower Limit {#common-mistake-losing-the-new-lower-limit-68}

```{=latex}
\Needspace{10\baselineskip}
```
Under $j=k+2$:

$$
k=0\quad\longrightarrow\quad j=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\sum_{k=0}^{\infty}a_kx^{k+r+2}
=\sum_{j=2}^{\infty}a_{j-2}x^{j+r}.
$$

Starting the new sum at $0$ invents nonexistent coefficients $a_{-2}$ and
$a_{-1}$ and hides the indicial and $a_1$ equations.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using J Plus And J Minus At Integer Order {#common-mistake-using-j-plus-and-j-minus-at-integer-order-69}

```{=latex}
\Needspace{10\baselineskip}
```
For integer $n$:

$$
J_{-n}=(-1)^nJ_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $J_{-n}=(-1)^nJ_n$, the proposed combination becomes:

$$
C_1J_n+C_2J_{-n}
=\left[C_1+(-1)^nC_2\right]J_n,
$$

which contains only one independent direction. Use $J_n$ and $Y_n$ for the
general solution instead.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Dropping A Chain-Rule Factor {#common-mistake-dropping-a-chain-rule-factor-70}

```{=latex}
\Needspace{10\baselineskip}
```
If $z=3x$ and $y(x)=u(z)$:

$$
y'=3u_z,
$$

```{=latex}
\Needspace{10\baselineskip}
```
but the second derivative is:

$$
y''=9u_{zz},
$$

not $3u_{zz}$. The factor appears once for each differentiation with respect
to $x$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Rejecting A Singular Solution Too Early {#common-mistake-rejecting-a-singular-solution-too-early-71}

$Y_\nu$ is singular at the origin, but that does not make it invalid on every
domain. On an annulus or any interval $a<x<b$ with $a>0$, the origin is outside
the domain and both $J_\nu$ and $Y_\nu$ may be needed.

Reject a solution because it violates the stated domain or condition, not
because it is singular somewhere the problem never includes.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating An Asymptotic Formula As Equality {#common-mistake-treating-an-asymptotic-formula-as-equality-72}

```{=latex}
\Needspace{10\baselineskip}
```
The notation:

$$
J_\nu(x)\sim
\sqrt{\frac{2}{\pi x}}
\cos\left(x-\frac{\nu\pi}{2}-\frac\pi4\right)
$$

describes leading behaviour as $x\to\infty$. It is not an exact identity for
finite $x$. Use the defining series, recurrence identities, or numerical
evaluation when exact finite-$x$ information is required.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-73}

Reliable work depends on preserving index limits, gamma shifts, chain-rule
factors, solution independence, domains, and the distinction between exact and
asymptotic formulas.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Gamma And Series Algebra {#problems-1-to-4-gamma-and-series-algebra-74}

**Problem 1: Evaluate Gamma At An Integer.** Find $\Gamma(8)$.

**Problem 2: Evaluate A Half-Integer.** Find $\Gamma(9/2)$ exactly.

**Problem 3: Move To A Negative Argument.** Find $\Gamma(-3/2)$ exactly.

```{=latex}
\Needspace{10\baselineskip}
```
**Problem 4: Reindex A Series.** Rewrite:

$$
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}
$$

as a series in powers $x^j$ beginning at the correct lower limit.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Bessel Series And Identities {#problems-5-to-8-bessel-series-and-identities-75}

**Problem 5: Build A Series.** Write the first four nonzero terms of $J_3(x)$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Differential Equations And Conditions {#problems-9-to-12-differential-equations-and-conditions-76}

```{=latex}
\Needspace{10\baselineskip}
```
**Problem 9: Solve A Scaled Equation.** Solve on $x>0$:

$$
x^2y''+xy'+(25x^2-4)y=0.
$$

**Problem 10: Apply Boundedness.** From the general solution in Problem 9,
retain only the solutions bounded at $x=0$.

```{=latex}
\Needspace{10\baselineskip}
```
**Problem 11: Recognize A Half-Integer Order.** Transform:

$$
x^2u''+2xu'+(x^2-2)u=0
$$

using $u=x^{-1/2}v$. Identify the Bessel order.

```{=latex}
\Needspace{10\baselineskip}
```
**Problem 12: Extract A Boundary Condition.** Suppose:

$$
u(r)=AJ_2(\lambda r)
$$

is nontrivial on $0\le r\le3$ and satisfies $u(3)=0$. Write the allowed values
of $\lambda$ in terms of the positive zeros $j_{2,k}$ of $J_2$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-77}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
For a positive integer $n$:

$$
\Gamma(n)=(n-1)!.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=8$:

$$
\begin{aligned}
\Gamma(8)
&=(8-1)!\\
&=7!\\
&=\boxed{5040}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Insert $\Gamma(1/2)=\sqrt\pi$:

$$
\boxed{
\Gamma\left(\frac92\right)
=\frac{105\sqrt\pi}{16}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Start with the recurrence at $s=-1/2$:

$$
\Gamma\left(\frac12\right)
=-\frac12\Gamma\left(-\frac12\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\Gamma\left(-\frac12\right)=-2\sqrt\pi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use the recurrence at $s=-3/2$:

$$
\Gamma\left(-\frac12\right)
=-\frac32\Gamma\left(-\frac32\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-3/2$:

$$
\begin{aligned}
\Gamma\left(-\frac32\right)
&=\frac{-2\sqrt\pi}{-3/2}\\
&=(-2\sqrt\pi)\left(-\frac23\right)\\
&=\boxed{\frac{4\sqrt\pi}{3}}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Begin with:

$$
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
j=k+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $j=k+3$, solve for $k$ and $k+1$:

$$
k=j-3,
\qquad
k+1=j-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When $k=0$, $j=3$. Therefore:

$$
\boxed{
\sum_{k=0}^{\infty}(k+1)a_kx^{k+3}
=\sum_{j=3}^{\infty}(j-2)a_{j-3}x^j
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-78}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
For $\nu=3$:

$$
J_3(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+4)}
\left(\frac{x}{2}\right)^{2m+3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
J_3(x)
=\frac{x^3}{48}-\frac{x^5}{768}
+\frac{x^7}{30720}-\frac{x^9}{2211840}+\cdots
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The $m=0$ term of the defining series is:

$$
J_\nu(x)
\sim
\frac1{\Gamma(\nu+1)}
\left(\frac{x}{2}\right)^\nu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=5/2$:

$$
J_{5/2}(x)
\sim
\frac1{\Gamma(7/2)}
\left(\frac{x}{2}\right)^{5/2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From Block 2:

$$
\Gamma\left(\frac72\right)=\frac{15\sqrt\pi}{8}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\frac1{\Gamma(7/2)}=\frac8{15\sqrt\pi}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The simplified leading behaviour is:

$$
\boxed{
J_{5/2}(x)
\sim
\frac8{15\sqrt\pi}
\left(\frac{x}{2}\right)^{5/2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
The neighbour sum is:

$$
J_{\nu-1}+J_{\nu+1}
=\frac{2\nu}{x}J_\nu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To involve $J_1,J_2,J_3$, set $\nu=2$:

$$
J_1+J_3=\frac4xJ_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $J_1+J_3=(4/x)J_2$, subtract $J_1$ from both sides:

$$
\boxed{
J_3(x)=\frac4xJ_2(x)-J_1(x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Use the neighbour-difference derivative identity:

$$
J_\nu'
=\frac12(J_{\nu-1}-J_{\nu+1}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $\nu=2$:

$$
\boxed{
J_2'(x)=\frac12\left[J_1(x)-J_3(x)\right]
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-79}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The equation is:

$$
x^2y''+xy'+(25x^2-4)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare it with:

$$
x^2y''+xy'+(\lambda^2x^2-\nu^2)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the parameters:

$$
\lambda^2=25,
\qquad
\nu^2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose $\lambda=5$ and $\nu=2$. Set:

$$
z=5x,
\qquad
y(x)=u(z).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y'=5u_z,
\qquad
y''=25u_{zz},
\qquad
x=\frac z5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
\left(\frac z5\right)^2(25u_{zz})
+\left(\frac z5\right)(5u_z)
+\left[25\left(\frac z5\right)^2-4\right]u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
z^2u_{zz}+zu_z+(z^2-4)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is Bessel's equation of order $2$, so:

$$
u=C_1J_2(z)+C_2Y_2(z).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $z=5x$:

$$
\boxed{
y(x)=C_1J_2(5x)+C_2Y_2(5x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
From Answer 9:

$$
y(x)=C_1J_2(5x)+C_2Y_2(5x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $J_2(5x)$ is bounded and $Y_2(5x)$ is singular at zero,
boundedness requires:

$$
C_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The bounded family is:

$$
\boxed{y(x)=C_1J_2(5x).}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The equation is:

$$
x^2u''+2xu'+(x^2-2)u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is the spherical equation with:

$$
\ell(\ell+1)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The nonnegative integer solution is $\ell=1$, since:

$$
1(1+1)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $u=x^{-1/2}v$. The transformation derived in Block 7 gives:

$$
x^2v''+xv'
+\left[x^2-\left(\ell+\frac12\right)^2\right]v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\ell=1$:

$$
x^2v''+xv'
+\left[x^2-\left(\frac32\right)^2\right]v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed equation has $(3/2)^2$ as its order term. Therefore the
Bessel order is:

$$
\boxed{\nu=\frac32.}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The outer condition is:

$$
u(3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $u(r)=AJ_2(\lambda r)$:

$$
AJ_2(3\lambda)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is nontrivial, so $A\ne0$. Divide by $A$:

$$
J_2(3\lambda)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $j_{2,k}$ is the $k$th positive zero of $J_2$, then:

$$
3\lambda=j_{2,k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3$:

$$
\boxed{
\lambda_k=\frac{j_{2,k}}{3},
\qquad k=1,2,3,\ldots
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 30 Final Summary {#chapter-30-final-summary-80}

```{=latex}
\Needspace{10\baselineskip}
```
The gamma function extends factorial structure:

$$
\Gamma(s)=\int_0^\infty t^{s-1}e^{-t}\,dt,
\qquad
\Gamma(s+1)=s\Gamma(s),
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
\Gamma(n+1)=n!,
\qquad
\Gamma\left(\frac12\right)=\sqrt\pi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Bessel's equation of order $\nu$ is:

$$
x^2y''+xy'+(x^2-\nu^2)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its normalized first-kind Frobenius solution is:

$$
J_\nu(x)
=\sum_{m=0}^{\infty}
\frac{(-1)^m}{m!\Gamma(m+\nu+1)}
\left(\frac{x}{2}\right)^{2m+\nu}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The central identities are:

$$
\begin{aligned}
J_{\nu-1}+J_{\nu+1}
&=\frac{2\nu}{x}J_\nu,\\
J_\nu'
&=\frac12(J_{\nu-1}-J_{\nu+1}).
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
For integer order, a full basis away from the origin is $J_n,Y_n$.
Boundedness at the origin usually removes $Y_n$, while an outer boundary
condition selects zeros of $J_n$ or $J_n'$.

```{=latex}
\Needspace{8\baselineskip}
```
> gamma notation packages the coefficients, Frobenius' method constructs the
> solution, recurrence identities make it usable, and boundary conditions
> select the physically admissible modes.

[^1]: Repeated use of l'Hopital's rule on
    $b^s/e^b$ when $s$ is an integer, or a standard exponential-growth
    estimate for general $s>0$, gives $b^se^{-b}\to0$.

[^2]: With $t=u^2$, the gamma integral becomes half of the
    standard Gaussian integral, giving $\Gamma(1/2)=\sqrt\pi$.
