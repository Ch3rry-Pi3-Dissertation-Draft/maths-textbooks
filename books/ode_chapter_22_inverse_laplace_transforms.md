# Inverse Laplace Transforms

Chapter 21 converted time-domain functions into functions of the transform
variable $s$. This chapter reverses that direction: it starts with $F(s)$ and
reconstructs a time-domain function $f(t)$.

Write:

$$
\mathcal{L}^{-1}\{F(s)\}=f(t).
$$

We will learn to:

- recognise inverse transforms from a compact table
- use linearity to separate sums and constant multiples
- complete the square before matching shifted sine and cosine forms
- rewrite numerators around the same shift used in the denominator
- decompose rational functions using partial fractions
- verify a reconstructed function by transforming it forward again

Convolutions and unit-step translations begin in Chapter 23.

---

## Block 1: Reversing The Transform

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what an inverse Laplace transform claims and how a
forward transform can verify the answer.

</details>

<details open>
<summary><strong>The Direction Of The Operation</strong></summary>

The forward transform takes a function of $t$ and produces a function of $s$:

$$
f(t)
\xrightarrow{\ \mathcal{L}\ }
F(s).
$$

The inverse transform travels in the opposite direction:

$$
F(s)
\xrightarrow{\ \mathcal{L}^{-1}\ }
f(t).
$$

The forward and inverse statements describe the same transform pair:

$$
\boxed{
\mathcal{L}^{-1}\{F(s)\}=f(t)
\quad\Longleftrightarrow\quad
\mathcal{L}\{f(t)\}=F(s)
}.
$$

Here:

- $t$ is the time-domain variable
- $s$ is the transform-domain variable
- $F(s)$ is the expression we are given
- $f(t)$ is the function we want to recover

The superscript $-1$ means **inverse operation**. It does not mean the
reciprocal $1/\mathcal{L}$.

</details>

<details open>
<summary><strong>A First Recognition</strong></summary>

Chapter 21 established:

$$
\mathcal{L}\{e^{-4t}\}=\frac1{s+4}.
$$

Read the same transform pair in reverse:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac1{s+4}\right\}=e^{-4t}
}.
$$

Multiplying the transform by $3$ multiplies the time function by $3$:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac3{s+4}\right\}=3e^{-4t}
}.
$$

What this tells us:

> inverse transformation is not a new integration trick at every step; much
> of the work is recognising a known forward-transform pattern in reverse.

</details>

<details open>
<summary><strong>Verification By A Forward Transform</strong></summary>

Suppose we claim:

$$
\mathcal{L}^{-1}\left\{\frac3{s+4}\right\}=3e^{-4t}.
$$

To verify the claim
$\mathcal{L}^{-1}\{3/(s+4)\}=3e^{-4t}$, transform the proposed time function
forward:

$$
\begin{aligned}
\mathcal{L}\{3e^{-4t}\}
&=3\mathcal{L}\{e^{-4t}\}\\
&=3\left(\frac1{s+4}\right)\\
&=\frac3{s+4}.
\end{aligned}
$$

The forward transform reproduces the original $F(s)$, so the inverse is
correct.

This verification method will remain available even when the reconstruction
requires several algebraic steps.

</details>

<details open>
<summary><strong>What Denominator Structure Suggests</strong></summary>

![Time-domain signatures of three pole structures](books/assets/chapter_22/chapter_22_figure-1.png)

The graph compares three standard time-domain patterns:

- a simple real denominator factor produces an exponential
- a repeated real factor introduces a power of $t$
- a quadratic associated with a complex pair produces oscillation

The three curves show that denominator structure predicts the **type** of
function that should appear, although it does not determine every coefficient.

A useful interpretation:

> inspect the denominator first to identify the likely time-domain family;
> then use the numerator to determine the required mixture and scale.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

An inverse Laplace transform reverses a known forward transform. A proposed
answer can always be checked by applying $\mathcal{L}$ and confirming that the
original expression $F(s)$ returns. For the ordinary piecewise-continuous
functions used here, the inverse is unique apart from harmless differences at
isolated points.

</details>

---

## Block 2: Direct Recognition And Linearity

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to read a small inverse-transform table accurately and to separate
expressions into manageable terms before matching them.

</details>

<details open>
<summary><strong>A Core Inverse Table</strong></summary>

The following entries reverse the table developed in Chapter 21:

| Transform-domain expression $F(s)$ | Time-domain function $f(t)$ |
|---|---|
| $1/s$ | $1$ |
| $1/s^{n+1}$ | $t^n/n!$ |
| $1/(s-a)$ | $e^{at}$ |
| $b/(s^2+b^2)$ | $\sin(bt)$ |
| $s/(s^2+b^2)$ | $\cos(bt)$ |
| $b/(s^2-b^2)$ | $\sinh(bt)$ |
| $s/(s^2-b^2)$ | $\cosh(bt)$ |

As a direct table example:

$$
\mathcal{L}^{-1}\left\{\frac1{s^5}\right\}
=\frac{t^4}{4!}
=\frac{t^4}{24}.
$$

The denominator exponent $5$ corresponds to $n+1=5$, so $n=4$. The factorial
is $4!$, not $5!$.

</details>

<details open>
<summary><strong>Inverse Linearity</strong></summary>

If $c_1$ and $c_2$ are constants, then:

$$
\boxed{
\mathcal{L}^{-1}\{c_1F(s)+c_2G(s)\}
=c_1\mathcal{L}^{-1}\{F(s)\}
+c_2\mathcal{L}^{-1}\{G(s)\}
}.
$$

Linearity permits two useful actions:

1. split a sum or difference into separate inverse transforms
2. move constant factors outside the inverse-transform symbol

It does **not** permit products to be separated in the same way.

</details>

<details open>
<summary><strong>A Complete Direct Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac6{s^4}
-\frac{10}{s^2+25}
+\frac3{s+2}
\right\}.
$$

Split the expression by linearity:

$$
\begin{aligned}
f(t)
&=6\mathcal{L}^{-1}\left\{\frac1{s^4}\right\}
-10\mathcal{L}^{-1}\left\{\frac1{s^2+25}\right\}\\
&\quad+3\mathcal{L}^{-1}\left\{\frac1{s+2}\right\}.
\end{aligned}
$$

In the direct example, the first term is $6/s^4$. Match $s^4$ with
$s^{n+1}$. Since $n+1=4$, we have $n=3$:

$$
6\mathcal{L}^{-1}\left\{\frac1{s^4}\right\}
=6\left(\frac{t^3}{3!}\right)
=t^3.
$$

For the sine term, write $25=5^2$ and manufacture the required numerator $5$:

$$
\begin{aligned}
-\frac{10}{s^2+25}
&=-2\left(\frac5{s^2+5^2}\right),\\
-10\mathcal{L}^{-1}\left\{\frac1{s^2+25}\right\}
&=-2\sin(5t).
\end{aligned}
$$

For the final term, $s+2=s-(-2)$:

$$
3\mathcal{L}^{-1}\left\{\frac1{s+2}\right\}
=3e^{-2t}.
$$

Combine the three reconstructed components:

$$
\boxed{
f(t)=t^3-2\sin(5t)+3e^{-2t}
}.
$$

</details>

<details open>
<summary><strong>Why The Sine Numerator Matters</strong></summary>

The standard pair is:

$$
\mathcal{L}\{\sin(bt)\}=\frac{b}{s^2+b^2}.
$$

Solving the sine pair for the inverse of $1/(s^2+b^2)$ gives:

$$
\mathcal{L}^{-1}\left\{\frac1{s^2+b^2}\right\}
=\frac1b\sin(bt),
$$

not merely $\sin(bt)$.

The numerator is part of the pattern. Ignoring it changes the amplitude of
the reconstructed function.

</details>

<details open>
<summary><strong>Common Direct-Recognition Errors</strong></summary>

Watch for these mistakes:

- reading $1/(s+4)$ as $e^{4t}$ instead of $e^{-4t}$
- using $t^n$ instead of $t^n/n!$ for $1/s^{n+1}$
- confusing the sine numerator $b$ with the cosine numerator $s$
- trying to invert a product by multiplying two separate inverse transforms

The practical rule:

> match the complete fraction, including its numerator, denominator, shifts,
> and constant factors.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Use linearity first. Then match each term with a complete table entry and
adjust any missing numerator constants explicitly.

</details>

---

## Block 3: Completing The Square

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to rewrite a quadratic denominator in the shifted-square form
needed for exponentially weighted sine and cosine functions.

</details>

<details open>
<summary><strong>Why The Denominator Comes First</strong></summary>

The shifted trigonometric transform pairs are:

$$
\begin{aligned}
\mathcal{L}\{e^{at}\cos(bt)\}
&=\frac{s-a}{(s-a)^2+b^2},\\
\mathcal{L}\{e^{at}\sin(bt)\}
&=\frac{b}{(s-a)^2+b^2}.
\end{aligned}
$$

The denominator identifies both parameters:

- the shift $a$ controls the exponential factor $e^{at}$
- the positive square $b^2$ controls the frequency $b$

Until the denominator has the form $(s-a)^2+b^2$, the correct numerator
patterns are not yet visible.

</details>

<details open>
<summary><strong>The Completing-The-Square Pattern</strong></summary>

For a monic quadratic:

$$
s^2+ps+q,
$$

take half of $p$, square it, add it inside the square, and compensate in the
constant term:

$$
\begin{aligned}
s^2+ps+q
&=s^2+ps+\left(\frac p2\right)^2
+q-\left(\frac p2\right)^2\\
&=\left(s+\frac p2\right)^2
+q-\frac{p^2}{4}.
\end{aligned}
$$

The sign inside the completed square follows the sign of the linear term.
For instance, $s^2-6s$ begins with $(s-3)^2$, not $(s+3)^2$.

</details>

<details open>
<summary><strong>A Constant-Numerator Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac7{s^2-2s+10}
\right\}.
$$

Complete the square in the denominator. Half of $-2$ is $-1$:

$$
\begin{aligned}
s^2-2s+10
&=(s^2-2s+1)+(10-1)\\
&=(s-1)^2+9\\
&=(s-1)^2+3^2.
\end{aligned}
$$

The denominator now indicates $a=1$ and $b=3$. Rewrite the numerator $7$ as
$(7/3)\cdot3$ so that the sine numerator appears:

$$
\frac7{(s-1)^2+3^2}
=\frac73
\left(
\frac3{(s-1)^2+3^2}
\right).
$$

Apply the shifted-sine pair:

$$
\boxed{
\mathcal{L}^{-1}\left\{
\frac7{s^2-2s+10}
\right\}
=\frac73e^t\sin(3t)
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>A Numerator That Must Also Be Rewritten</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{2s+11}{s^2+6s+13}
\right\}.
$$

First complete the square in the denominator. Half of $6$ is $3$:

$$
\begin{aligned}
s^2+6s+13
&=(s^2+6s+9)+(13-9)\\
&=(s+3)^2+4\\
&=(s+3)^2+2^2.
\end{aligned}
$$

Because $s+3=s-(-3)$, the time-domain exponential will be $e^{-3t}$.

The cosine numerator must be $s+3$, so rewrite $2s+11$ around that same
shift:

$$
\begin{aligned}
2s+11
&=2(s+3)+5.
\end{aligned}
$$

Substitute the completed denominator and split the numerator:

$$
\begin{aligned}
\frac{2s+11}{s^2+6s+13}
&=\frac{2(s+3)+5}{(s+3)^2+2^2}\\
&=2\frac{s+3}{(s+3)^2+2^2}
+\frac52\frac2{(s+3)^2+2^2}.
\end{aligned}
$$

Invert the cosine-shaped and sine-shaped terms separately:

$$
\boxed{
f(t)
=2e^{-3t}\cos(2t)
+\frac52e^{-3t}\sin(2t)
}.
$$

The denominator selected the decay rate and frequency. The rewritten numerator
selected the mixture of cosine and sine.

</details>

<details open>
<summary><strong>Common Completing-Square Errors</strong></summary>

Check each of these points:

- half the coefficient of $s$ before squaring it
- compensate for the square that was added
- identify $a$ from $s-a$, not from the visible sign alone
- rewrite the numerator using exactly the same shifted expression

For example, $(s+3)^2=(s-(-3))^2$, so $a=-3$ and the exponential is
$e^{-3t}$.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Complete the denominator first. Then rewrite the numerator as a multiple of
$s-a$ plus a constant, and match the resulting cosine and sine terms.

</details>

---

## Block 4: Choosing A Partial-Fraction Form

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to choose the correct partial-fraction template from the factor
structure before solving for any constants.

</details>

<details open>
<summary><strong>When Partial Fractions Are Needed</strong></summary>

A rational transform has the form:

$$
F(s)=\frac{P(s)}{Q(s)},
$$

where $P$ and $Q$ are polynomials.

Partial fractions are useful when $Q(s)$ factors into simpler pieces but the
whole quotient does not match one table entry.

For $F(s)=P(s)/Q(s)$, this chapter focuses on **proper** rational functions:

$$
\deg P<\deg Q.
$$

If the numerator degree is at least the denominator degree, polynomial long
division comes first. Polynomial terms in $s$ can lead beyond ordinary
functions into impulse methods, so those cases are not treated here.

</details>

<details open>
<summary><strong>Distinct Linear Factors</strong></summary>

For distinct linear factors, assign one constant numerator to each factor:

$$
\frac{P(s)}{(s-a)(s-b)}
=\frac{A}{s-a}+\frac{B}{s-b}.
$$

Each linear denominator then corresponds to an exponential after inversion.

</details>

<details open>
<summary><strong>Repeated Linear Factors</strong></summary>

If $(s-a)$ occurs to power $m$, include every power from $1$ through $m$:

$$
\boxed{
\frac{P(s)}{(s-a)^m}
=\frac{A_1}{s-a}
+\frac{A_2}{(s-a)^2}
+\cdots+
\frac{A_m}{(s-a)^m}
}.
$$

For example, a factor $(s+1)^3$ requires:

$$
\frac{A}{s+1}
+\frac{B}{(s+1)^2}
+\frac{C}{(s+1)^3}.
$$

Skipping an intermediate power makes the decomposition incomplete.

</details>

<details open>
<summary><strong>Irreducible Quadratic Factors</strong></summary>

For a real quadratic that does not factor into real linear factors, use a
linear numerator:

$$
\boxed{
\frac{P(s)}{s^2+ps+q}
=\frac{Bs+C}{s^2+ps+q}
}.
$$

If the quadratic is repeated, include a linear numerator over every power:

$$
\frac{B_1s+C_1}{Q(s)}
+\frac{B_2s+C_2}{Q(s)^2}
+\cdots+
\frac{B_ms+C_m}{Q(s)^m}.
$$

A constant numerator is not general enough because both sine-shaped and
cosine-shaped components may be needed.

</details>

<details open>
<summary><strong>A Template-Selection Example</strong></summary>

Suppose the denominator is:

$$
(s+2)^2(s^2+9).
$$

The repeated linear factor contributes two fractions, while the irreducible
quadratic contributes one fraction with a linear numerator. Therefore the
correct template is:

$$
\boxed{
\frac{P(s)}{(s+2)^2(s^2+9)}
=\frac{A}{s+2}
+\frac{B}{(s+2)^2}
+\frac{Cs+D}{s^2+9}
}.
$$

At this stage, no constants have been calculated. Choosing the form correctly
is a separate step from solving for $A$, $B$, $C$, and $D$.

</details>

<details open>
<summary><strong>What Partial Fractions Accomplish</strong></summary>

![Two partial-fraction components and their reconstructed sum](books/assets/chapter_22/chapter_22_figure-2.png)

The graph shows the time-domain functions associated with:

$$
\frac1{s+1}
\quad\text{and}\quad
\frac3{s+4}.
$$

Their inverse transforms are $e^{-t}$ and $3e^{-4t}$. Linearity then rebuilds
the inverse of their sum as:

$$
e^{-t}+3e^{-4t}.
$$

Partial fractions do not change the rational function. They expose simpler
transform pairs that were hidden inside it.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Factor the denominator completely over the real numbers, then assign the
correct numerator form to every factor and every repeated power before solving
for constants.

</details>

---

## Block 5: Distinct Linear Factors

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to perform a complete partial-fraction decomposition while making
every substituted value and vanished term visible.

</details>

<details open>
<summary><strong>A Full Distinct-Factor Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{4s+7}{(s+1)(s+4)}
\right\}.
$$

The denominator contains two distinct linear factors, so write:

$$
\frac{4s+7}{(s+1)(s+4)}
=\frac{A}{s+1}+\frac{B}{s+4}.
$$

Multiply every term by $(s+1)(s+4)$ to clear the denominators:

$$
\boxed{
4s+7=A(s+4)+B(s+1)
}.
$$

This identity must hold for every allowed value of $s$.

</details>

<details open>
<summary><strong>Find A By Choosing S Equals Minus One</strong></summary>

Start from the cleared identity:

$$
4s+7=A(s+4)+B(s+1).
$$

Set $s=-1$. The factor $s+1$ becomes zero, so the term containing $B$
vanishes:

$$
\begin{aligned}
4(-1)+7
&=A(-1+4)+B(-1+1)\\
3&=3A+0.
\end{aligned}
$$

Divide by $3$:

$$
A=1.
$$

</details>

<details open>
<summary><strong>Find B By Choosing S Equals Minus Four</strong></summary>

Return to the same cleared identity:

$$
4s+7=A(s+4)+B(s+1).
$$

Set $s=-4$. The factor $s+4$ becomes zero, so the term containing $A$
vanishes:

$$
\begin{aligned}
4(-4)+7
&=A(-4+4)+B(-4+1)\\
-9&=0-3B.
\end{aligned}
$$

Divide by $-3$:

$$
B=3.
$$

</details>

<details open>
<summary><strong>Invert The Decomposition</strong></summary>

Substitute $A=1$ and $B=3$ into the chosen partial-fraction form:

$$
\frac{4s+7}{(s+1)(s+4)}
=\frac1{s+1}+\frac3{s+4}.
$$

Apply inverse linearity and the exponential pair
$\mathcal{L}^{-1}\{1/(s-a)\}=e^{at}$:

$$
\begin{aligned}
f(t)
&=\mathcal{L}^{-1}\left\{\frac1{s+1}\right\}
+3\mathcal{L}^{-1}\left\{\frac1{s+4}\right\}\\
&=e^{-t}+3e^{-4t}.
\end{aligned}
$$

Substituting the solved decomposition into the inverse transform gives:

$$
\boxed{
\mathcal{L}^{-1}\left\{
\frac{4s+7}{(s+1)(s+4)}
\right\}
=e^{-t}+3e^{-4t}
}.
$$

</details>

<details open>
<summary><strong>Check The Constants By Recombining</strong></summary>

Recombine the two partial fractions over their common denominator:

$$
\begin{aligned}
\frac1{s+1}+\frac3{s+4}
&=\frac{s+4+3(s+1)}{(s+1)(s+4)}\\
&=\frac{s+4+3s+3}{(s+1)(s+4)}\\
&=\frac{4s+7}{(s+1)(s+4)}.
\end{aligned}
$$

The original transform returns exactly, so both constants are correct.

</details>

<details open>
<summary><strong>The Coefficient-Comparison Alternative</strong></summary>

The root-substitution method is efficient for distinct linear factors, but
coefficient comparison also works.

Expand the cleared identity:

$$
\begin{aligned}
4s+7
&=A(s+4)+B(s+1)\\
&=(A+B)s+(4A+B).
\end{aligned}
$$

Match the coefficient of $s$ and the constant term:

$$
\begin{aligned}
A+B&=4,\\
4A+B&=7.
\end{aligned}
$$

Subtract the first equation from the second:

$$
3A=3,
\qquad
A=1.
$$

Substitute $A=1$ into $A+B=4$:

$$
1+B=4,
\qquad
B=3.
$$

Both methods produce the same constants.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

For distinct linear factors, clear denominators and choose roots that make all
but one unknown term vanish. Keep the identity visible during each
substitution, then recombine the fractions as a check.

</details>

---

## Block 6: Repeated And Quadratic Factors

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to handle repeated linear factors and mixed linear-quadratic
denominators without omitting required terms.

</details>

<details open>
<summary><strong>A Repeated-Linear-Factor Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{5s^2+13s+6}{(s+1)^2(s+3)}
\right\}.
$$

The repeated factor $(s+1)^2$ requires both powers $1$ and $2$:

$$
\frac{5s^2+13s+6}{(s+1)^2(s+3)}
=\frac{A}{s+1}
+\frac{B}{(s+1)^2}
+\frac{C}{s+3}.
$$

Multiply by $(s+1)^2(s+3)$:

$$
\boxed{
5s^2+13s+6
=A(s+1)(s+3)+B(s+3)+C(s+1)^2
}.
$$

</details>

<details open>
<summary><strong>Find The Repeated-Factor Constants</strong></summary>

Set $s=-1$ in the cleared identity. Every term except the one containing $B$
vanishes:

$$
\begin{aligned}
5(-1)^2+13(-1)+6
&=A(0)(2)+B(2)+C(0)^2\\
-2&=2B.
\end{aligned}
$$

Since $-2=2B$, dividing both sides by $2$ gives:

$$
B=-1.
$$

Now set $s=-3$. Every term except the one containing $C$ vanishes:

$$
\begin{aligned}
5(-3)^2+13(-3)+6
&=A(-2)(0)+B(0)+C(-2)^2\\
12&=4C.
\end{aligned}
$$

Dividing $12=4C$ by $4$ gives:

$$
C=3.
$$

To find $A$, use any convenient remaining value. Set $s=0$ and substitute
$B=-1$ and $C=3$:

$$
\begin{aligned}
6
&=A(1)(3)+(-1)(3)+3(1)^2\\
&=3A-3+3\\
&=3A.
\end{aligned}
$$

Divide by $3$:

$$
A=2.
$$

</details>

<details open>
<summary><strong>Invert The Repeated-Factor Decomposition</strong></summary>

Insert $A=2$, $B=-1$, and $C=3$:

$$
\frac{5s^2+13s+6}{(s+1)^2(s+3)}
=\frac2{s+1}
-\frac1{(s+1)^2}
+\frac3{s+3}.
$$

For the decomposition
$2/(s+1)-1/(s+1)^2+3/(s+3)$, use the shifted power pairs:

$$
\mathcal{L}^{-1}\left\{\frac1{s+1}\right\}=e^{-t},
$$

For the repeated factor, the second required pair is:

$$
\mathcal{L}^{-1}\left\{\frac1{(s+1)^2}\right\}=te^{-t}.
$$

Apply inverse linearity term by term:

$$
\boxed{
f(t)=2e^{-t}-te^{-t}+3e^{-3t}
}.
$$

The repeated denominator factor produces the extra factor $t$ in the middle
term.

</details>

<details open>
<summary><strong>A Mixed Linear-Quadratic Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{14-s}{(s+2)(s^2+4)}
\right\}.
$$

The linear factor needs a constant numerator. The irreducible quadratic needs
a linear numerator:

$$
\frac{14-s}{(s+2)(s^2+4)}
=\frac{A}{s+2}+\frac{Bs+C}{s^2+4}.
$$

Multiplying the mixed decomposition by $(s+2)(s^2+4)$ gives the cleared
identity:

$$
\boxed{
14-s=A(s^2+4)+(Bs+C)(s+2)
}.
$$

</details>

<details open>
<summary><strong>Solve The Mixed Constants</strong></summary>

Set $s=-2$ in the cleared identity. The term containing $Bs+C$ vanishes:

$$
\begin{aligned}
14-(-2)
&=A\bigl((-2)^2+4\bigr)
+\bigl(B(-2)+C\bigr)(0)\\
16&=8A.
\end{aligned}
$$

Dividing $16=8A$ by $8$ gives:

$$
A=2.
$$

Substitute $A=2$ and expand the right side:

$$
\begin{aligned}
14-s
&=2(s^2+4)+(Bs+C)(s+2)\\
&=2s^2+8+Bs^2+(2B+C)s+2C\\
&=(2+B)s^2+(2B+C)s+(8+2C).
\end{aligned}
$$

The left side has coefficient $0$ on $s^2$, coefficient $-1$ on $s$, and
constant term $14$. Match these coefficients:

$$
\begin{aligned}
2+B&=0,\\
2B+C&=-1,\\
8+2C&=14.
\end{aligned}
$$

The coefficient equations include $2+B=0$ and $2B+C=-1$. The first equation
gives:

$$
B=-2.
$$

Substitute $B=-2$ into the second equation:

$$
2(-2)+C=-1,
\qquad
C=3.
$$

The constant equation confirms the result because $8+2(3)=14$.

</details>

<details open>
<summary><strong>Invert The Mixed Decomposition</strong></summary>

Substitute $A=2$, $B=-2$, and $C=3$:

$$
\frac{14-s}{(s+2)(s^2+4)}
=\frac2{s+2}
-\frac{2s}{s^2+4}
+\frac3{s^2+4}.
$$

Rewrite the final numerator to expose the sine entry:

$$
\frac3{s^2+4}
=\frac32\frac2{s^2+2^2}.
$$

Invert all three terms:

$$
\boxed{
f(t)=2e^{-2t}-2\cos(2t)+\frac32\sin(2t)
}.
$$

</details>

<details open>
<summary><strong>Why Root Substitution Was Not Enough</strong></summary>

In the mixed example, the real root $s=-2$ isolated $A$. The quadratic
$s^2+4$ has no real roots, so real root substitution could not isolate $B$ and
$C$.

Coefficient comparison supplied the remaining equations. This is why the
most reliable general strategy is:

1. use convenient roots where they help
2. expand and compare coefficients for what remains

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Repeated linear factors require every denominator power. Irreducible
quadratics require linear numerators. Root substitution and coefficient
comparison can be combined in the same decomposition.

</details>

---

## Block 7: A Reliable End-To-End Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to combine factoring, partial fractions, completing the square,
numerator matching, inversion, and verification in one uninterrupted example.

</details>

<details open>
<summary><strong>The Workflow</strong></summary>

For a proper rational transform $F(s)=P(s)/Q(s)$:

1. factor $Q(s)$ over the real numbers
2. choose the complete partial-fraction template
3. clear denominators
4. solve the constants using roots and coefficient comparison
5. complete squares in any quadratic denominators
6. rewrite each numerator around the denominator's shift
7. apply inverse linearity and table entries
8. transform the answer forward to verify it

Do not complete every possible algebraic operation at once. Each stage has a
different purpose.

</details>

<details open>
<summary><strong>An End-To-End Example</strong></summary>

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{4s+18}{(s+2)(s^2+2s+10)}
\right\}.
$$

The quadratic discriminant is:

$$
\Delta=2^2-4(1)(10)=-36<0,
$$

Because $\Delta=-36<0$, the quadratic is irreducible over the real numbers.
Choose:

$$
\frac{4s+18}{(s+2)(s^2+2s+10)}
=\frac{A}{s+2}
+\frac{Bs+C}{s^2+2s+10}.
$$

Clear denominators:

$$
\boxed{
4s+18
=A(s^2+2s+10)+(Bs+C)(s+2)
}.
$$

</details>

<details open>
<summary><strong>Solve The Constants Locally</strong></summary>

Set $s=-2$ in the cleared identity:

$$
\begin{aligned}
4(-2)+18
&=A\bigl((-2)^2+2(-2)+10\bigr)
+\bigl(B(-2)+C\bigr)(0)\\
10&=10A.
\end{aligned}
$$

Dividing $10=10A$ by $10$ gives:

$$
A=1.
$$

For the end-to-end example, root substitution gave $A=1$. Substitute this
value and expand:

$$
\begin{aligned}
4s+18
&=s^2+2s+10+(Bs+C)(s+2)\\
&=s^2+2s+10+Bs^2+(2B+C)s+2C\\
&=(1+B)s^2+(2+2B+C)s+(10+2C).
\end{aligned}
$$

Match the $s^2$ coefficient:

$$
1+B=0,
\qquad
B=-1.
$$

In the expanded identity, the $s$-coefficient equation is
$2+2B+C=4$. Substitute $B=-1$:

$$
\begin{aligned}
2+2B+C&=4,\\
2+2(-1)+C&=4,\\
C&=4.
\end{aligned}
$$

The constant term verifies the result:

$$
10+2C=10+2(4)=18.
$$

</details>

<details open>
<summary><strong>Prepare The Quadratic Term</strong></summary>

Insert $A=1$, $B=-1$, and $C=4$:

$$
\frac{4s+18}{(s+2)(s^2+2s+10)}
=\frac1{s+2}
+\frac{-s+4}{s^2+2s+10}.
$$

For the remaining denominator $s^2+2s+10$, complete the square:

$$
\begin{aligned}
s^2+2s+10
&=(s^2+2s+1)+(10-1)\\
&=(s+1)^2+9\\
&=(s+1)^2+3^2.
\end{aligned}
$$

Rewrite the numerator around $s+1$:

$$
\begin{aligned}
-s+4
&=-(s+1)+5.
\end{aligned}
$$

Substitute and separate the cosine and sine patterns:

$$
\begin{aligned}
\frac{-s+4}{s^2+2s+10}
&=-\frac{s+1}{(s+1)^2+3^2}
+\frac5{(s+1)^2+3^2}\\
&=-\frac{s+1}{(s+1)^2+3^2}
+\frac53\frac3{(s+1)^2+3^2}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Reconstruct The Time Function</strong></summary>

Invert the three prepared terms:

$$
\begin{aligned}
\mathcal{L}^{-1}\left\{\frac1{s+2}\right\}
&=e^{-2t},\\
\mathcal{L}^{-1}\left\{
-\frac{s+1}{(s+1)^2+3^2}
\right\}
&=-e^{-t}\cos(3t),\\
\mathcal{L}^{-1}\left\{
\frac53\frac3{(s+1)^2+3^2}
\right\}
&=\frac53e^{-t}\sin(3t).
\end{aligned}
$$

Combine the components:

$$
\boxed{
f(t)
=e^{-2t}
-e^{-t}\cos(3t)
+\frac53e^{-t}\sin(3t)
}.
$$

</details>

<details open>
<summary><strong>Verify The End-To-End Answer</strong></summary>

Transform the proposed answer term by term:

$$
\begin{aligned}
\mathcal{L}\{e^{-2t}\}
&=\frac1{s+2},\\
\mathcal{L}\{-e^{-t}\cos(3t)\}
&=-\frac{s+1}{(s+1)^2+9},\\
\mathcal{L}\left\{\frac53e^{-t}\sin(3t)\right\}
&=\frac5{(s+1)^2+9}.
\end{aligned}
$$

Combine the two terms with the quadratic denominator:

$$
-\frac{s+1}{(s+1)^2+9}
+\frac5{(s+1)^2+9}
=\frac{-s+4}{s^2+2s+10}.
$$

To finish the verification, recombine the two prepared fractions:

$$
\frac1{s+2}
+\frac{-s+4}{s^2+2s+10}
=\frac{4s+18}{(s+2)(s^2+2s+10)}.
$$

The forward transform reproduces the original expression, completing the
verification.

</details>

<details open>
<summary><strong>Fast Diagnostic Checks</strong></summary>

Before accepting an inverse transform, ask:

- **Properness:** is the numerator degree below the denominator degree?
- **Factors:** has the denominator been factored completely over the reals?
- **Template:** is every repeated power present?
- **Quadratics:** does each irreducible quadratic have a linear numerator?
- **Shift:** does $(s-a)$ produce $e^{at}$ with the correct sign?
- **Frequency:** was $b$ taken from $b^2$ rather than from the square directly?
- **Amplitude:** was the required sine numerator manufactured explicitly?
- **Verification:** does the forward transform reconstruct the original $F(s)$?

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The reliable order is denominator structure, decomposition, constant solving,
quadratic preparation, numerator matching, inversion, and forward
verification. Keeping those stages separate prevents most sign and amplitude
errors.

</details>

---

## Block 8: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Direct Recognition</strong></summary>

### Problem 1: Reverse A Power Transform

Find:

$$
\mathcal{L}^{-1}\left\{\frac8{s^5}\right\}.
$$

Show how the denominator exponent determines the power of $t$.

### Problem 2: Match A Sine Transform

Find:

$$
\mathcal{L}^{-1}\left\{\frac4{s^2+16}\right\}.
$$

### Problem 3: Match A Cosine Transform

Find:

$$
\mathcal{L}^{-1}\left\{\frac{3s}{s^2+9}\right\}.
$$

### Problem 4: Use Inverse Linearity

Find:

$$
\mathcal{L}^{-1}\left\{
\frac2s-\frac{12}{s^3}+\frac6{s^2+9}
\right\}.
$$

</details>

<details open>
<summary><strong>Problems 5 To 8: Squares And Distinct Factors</strong></summary>

### Problem 5: Complete A Square

Find:

$$
\mathcal{L}^{-1}\left\{
\frac6{s^2-4s+13}
\right\}.
$$

### Problem 6: Rewrite A Shifted Numerator

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{s+7}{s^2+4s+20}
\right\}.
$$

### Problem 7: Decompose Distinct Decay Factors

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{3(s+6)}{(s+2)(s+5)}
\right\}.
$$

### Problem 8: Decompose A Growing And A Decaying Mode

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{2s+1}{(s-1)(s+2)}
\right\}.
$$

</details>

<details open>
<summary><strong>Problems 9 To 12: Repeated And Mixed Factors</strong></summary>

### Problem 9: Use A Repeated Linear Factor

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{s^2+2s+10}{(s+1)^2(s+4)}
\right\}.
$$

### Problem 10: Combine A Linear And A Quadratic Factor

Find:

$$
\mathcal{L}^{-1}\left\{
\frac{15-s}{(s+3)(s^2+9)}
\right\}.
$$

### Problem 11: Diagnose An Incomplete Template

A learner proposes:

$$
\frac{P(s)}{(s+2)^2(s+5)}
=\frac{A}{(s+2)^2}+\frac{B}{s+5}.
$$

Explain what is missing and write the complete partial-fraction template.

### Problem 12: Complete The Full Workflow

Find and verify:

$$
\mathcal{L}^{-1}\left\{
\frac{11s+27}{(s+1)(s^2+6s+13)}
\right\}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Match $s^5$ with $s^{n+1}$. Solve for $n$:

$$
n+1=5,
\qquad
n=4.
$$

Use $\mathcal{L}^{-1}\{1/s^{n+1}\}=t^n/n!$:

$$
\begin{aligned}
\mathcal{L}^{-1}\left\{\frac8{s^5}\right\}
&=8\frac{t^4}{4!}\\
&=8\frac{t^4}{24}\\
&=\boxed{\frac{t^4}{3}}.
\end{aligned}
$$

### Answer 2

Write $16=4^2$. The numerator already equals the required frequency $4$:

$$
\frac4{s^2+16}
=\frac4{s^2+4^2}.
$$

Apply the sine pair:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac4{s^2+16}\right\}
=\sin(4t)
}.
$$

### Answer 3

Write $9=3^2$ and move the constant $3$ outside:

$$
\frac{3s}{s^2+9}
=3\frac{s}{s^2+3^2}.
$$

For Answer 3, the prepared term is $3s/(s^2+3^2)$. Applying the cosine pair
gives:

$$
\boxed{
\mathcal{L}^{-1}\left\{\frac{3s}{s^2+9}\right\}
=3\cos(3t)
}.
$$

### Answer 4

Apply inverse linearity:

$$
\begin{aligned}
f(t)
&=2\mathcal{L}^{-1}\left\{\frac1s\right\}
-12\mathcal{L}^{-1}\left\{\frac1{s^3}\right\}
+6\mathcal{L}^{-1}\left\{\frac1{s^2+9}\right\}.
\end{aligned}
$$

Evaluate each term using the core table:

$$
\begin{aligned}
2\mathcal{L}^{-1}\left\{\frac1s\right\}&=2,\\
-12\mathcal{L}^{-1}\left\{\frac1{s^3}\right\}
&=-12\frac{t^2}{2!}=-6t^2,\\
6\mathcal{L}^{-1}\left\{\frac1{s^2+9}\right\}
&=2\mathcal{L}^{-1}\left\{\frac3{s^2+3^2}\right\}
=2\sin(3t).
\end{aligned}
$$

Combining the three independently inverted terms gives:

$$
\boxed{
f(t)=2-6t^2+2\sin(3t)
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Complete the square:

$$
\begin{aligned}
s^2-4s+13
&=(s^2-4s+4)+(13-4)\\
&=(s-2)^2+9\\
&=(s-2)^2+3^2.
\end{aligned}
$$

Rewrite $6=2\cdot3$ to produce the sine numerator:

$$
\frac6{(s-2)^2+3^2}
=2\frac3{(s-2)^2+3^2}.
$$

Use the shifted-sine pair:

$$
\boxed{
\mathcal{L}^{-1}\left\{
\frac6{s^2-4s+13}
\right\}
=2e^{2t}\sin(3t)
}.
$$

### Answer 6

Complete the denominator square:

$$
\begin{aligned}
s^2+4s+20
&=(s^2+4s+4)+(20-4)\\
&=(s+2)^2+16\\
&=(s+2)^2+4^2.
\end{aligned}
$$

Rewrite the numerator using the same shift:

$$
s+7=(s+2)+5.
$$

Split the fraction and manufacture the sine numerator $4$:

$$
\begin{aligned}
\frac{s+7}{s^2+4s+20}
&=\frac{s+2}{(s+2)^2+4^2}
+\frac5{(s+2)^2+4^2}\\
&=\frac{s+2}{(s+2)^2+4^2}
+\frac54\frac4{(s+2)^2+4^2}.
\end{aligned}
$$

For Answer 6, the prepared terms are:

$$
\frac{s+2}{(s+2)^2+4^2}
+\frac54\frac4{(s+2)^2+4^2}.
$$

Invert these two terms:

$$
\boxed{
f(t)=e^{-2t}\cos(4t)
+\frac54e^{-2t}\sin(4t)
}.
$$

### Answer 7

Choose the distinct-linear-factor form:

$$
\frac{3(s+6)}{(s+2)(s+5)}
=\frac{A}{s+2}+\frac{B}{s+5}.
$$

Clear denominators:

$$
3(s+6)=A(s+5)+B(s+2).
$$

Set $s=-2$. The term containing $B$ vanishes:

$$
3(-2+6)=A(-2+5),
\qquad
12=3A,
\qquad
A=4.
$$

Set $s=-5$. The term containing $A$ vanishes:

$$
3(-5+6)=B(-5+2),
\qquad
3=-3B,
\qquad
B=-1.
$$

Substitute the constants and invert:

$$
\begin{aligned}
\frac{3(s+6)}{(s+2)(s+5)}
&=\frac4{s+2}-\frac1{s+5},\\
f(t)&=\boxed{4e^{-2t}-e^{-5t}}.
\end{aligned}
$$

### Answer 8

Use:

$$
\frac{2s+1}{(s-1)(s+2)}
=\frac{A}{s-1}+\frac{B}{s+2}.
$$

Clear denominators:

$$
2s+1=A(s+2)+B(s-1).
$$

Set $s=1$ to isolate $A$:

$$
2(1)+1=A(1+2),
\qquad
3=3A,
\qquad
A=1.
$$

Set $s=-2$ to isolate $B$:

$$
2(-2)+1=B(-2-1),
\qquad
-3=-3B,
\qquad
B=1.
$$

The decomposition and inverse are:

$$
\begin{aligned}
\frac{2s+1}{(s-1)(s+2)}
&=\frac1{s-1}+\frac1{s+2},\\
f(t)&=\boxed{e^t+e^{-2t}}.
\end{aligned}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

The repeated factor requires both $(s+1)^{-1}$ and $(s+1)^{-2}$:

$$
\frac{s^2+2s+10}{(s+1)^2(s+4)}
=\frac{A}{s+1}
+\frac{B}{(s+1)^2}
+\frac{C}{s+4}.
$$

Clear denominators:

$$
s^2+2s+10
=A(s+1)(s+4)+B(s+4)+C(s+1)^2.
$$

Set $s=-1$ to isolate $B$:

$$
\begin{aligned}
(-1)^2+2(-1)+10
&=B(-1+4),\\
9&=3B,\\
B&=3.
\end{aligned}
$$

Set $s=-4$ to isolate $C$:

$$
\begin{aligned}
(-4)^2+2(-4)+10
&=C(-4+1)^2,\\
18&=9C,\\
C&=2.
\end{aligned}
$$

Set $s=0$ and substitute $B=3$ and $C=2$:

$$
\begin{aligned}
10
&=A(1)(4)+3(4)+2(1)^2\\
&=4A+14.
\end{aligned}
$$

Subtract $14$ and divide by $4$:

$$
A=-1.
$$

For Answer 9, $A=-1$, $B=3$, and $C=2$. Substitute these constants into the
partial-fraction form:

$$
\frac{s^2+2s+10}{(s+1)^2(s+4)}
=-\frac1{s+1}+\frac3{(s+1)^2}+\frac2{s+4}.
$$

Invert the three terms:

$$
\boxed{
f(t)=-e^{-t}+3te^{-t}+2e^{-4t}
}.
$$

### Answer 10

Choose:

$$
\frac{15-s}{(s+3)(s^2+9)}
=\frac{A}{s+3}+\frac{Bs+C}{s^2+9}.
$$

Clear denominators:

$$
15-s=A(s^2+9)+(Bs+C)(s+3).
$$

Set $s=-3$ to isolate $A$:

$$
15-(-3)=A\bigl((-3)^2+9\bigr),
\qquad
18=18A,
\qquad
A=1.
$$

Substitute $A=1$ and expand:

$$
\begin{aligned}
15-s
&=s^2+9+(Bs+C)(s+3)\\
&=(1+B)s^2+(3B+C)s+(9+3C).
\end{aligned}
$$

For Answer 10, the expanded identity has $s^2$ coefficient $1+B$. Match it
with the zero $s^2$ coefficient on the left:

$$
1+B=0,
\qquad
B=-1.
$$

Match the $s$ coefficient:

$$
3(-1)+C=-1,
\qquad
C=2.
$$

For Answer 10, the solved constants are $A=1$, $B=-1$, and $C=2$. The
constant check is $9+3(2)=15$. Substituting the constants gives:

$$
\begin{aligned}
\frac{15-s}{(s+3)(s^2+9)}
&=\frac1{s+3}-\frac{s}{s^2+9}+\frac2{s^2+9},\\
f(t)&=\boxed{e^{-3t}-\cos(3t)+\frac23\sin(3t)}.
\end{aligned}
$$

### Answer 11

The factor $(s+2)^2$ is repeated. A complete decomposition must include both
the first and second powers of $s+2$.

The missing term is a constant over $s+2$. The correct template is:

$$
\boxed{
\frac{P(s)}{(s+2)^2(s+5)}
=\frac{A}{s+2}
+\frac{B}{(s+2)^2}
+\frac{C}{s+5}
}.
$$

Using different constant names is harmless; including every required power is
essential.

### Answer 12

Choose the linear-quadratic template:

$$
\frac{11s+27}{(s+1)(s^2+6s+13)}
=\frac{A}{s+1}
+\frac{Bs+C}{s^2+6s+13}.
$$

For Answer 12, multiply the chosen decomposition by
$(s+1)(s^2+6s+13)$ to clear the denominators:

$$
\boxed{
11s+27
=A(s^2+6s+13)+(Bs+C)(s+1)
}.
$$

Set $s=-1$ to isolate $A$:

$$
\begin{aligned}
11(-1)+27
&=A\bigl((-1)^2+6(-1)+13\bigr)\\
16&=8A,\\
A&=2.
\end{aligned}
$$

For Answer 12, root substitution in the cleared identity gives $A=2$.
Substitute this value and expand:

$$
\begin{aligned}
11s+27
&=2(s^2+6s+13)+(Bs+C)(s+1)\\
&=(2+B)s^2+(12+B+C)s+(26+C).
\end{aligned}
$$

Match the $s^2$ coefficient:

$$
2+B=0,
\qquad
B=-2.
$$

Match the $s$ coefficient and substitute $B=-2$:

$$
12-2+C=11,
\qquad
C=1.
$$

The constant check is $26+1=27$. Substituting $A=2$, $B=-2$, and $C=1$
into the partial-fraction form gives:

$$
\frac{11s+27}{(s+1)(s^2+6s+13)}
=\frac2{s+1}
+\frac{-2s+1}{s^2+6s+13}.
$$

For Answer 12's remaining denominator $s^2+6s+13$, complete the square:

$$
\begin{aligned}
s^2+6s+13
&=(s+3)^2+4\\
&=(s+3)^2+2^2.
\end{aligned}
$$

Rewrite the quadratic numerator around $s+3$:

$$
-2s+1=-2(s+3)+7.
$$

Separate the table patterns:

$$
\begin{aligned}
\frac{-2s+1}{s^2+6s+13}
&=-2\frac{s+3}{(s+3)^2+2^2}
+\frac72\frac2{(s+3)^2+2^2}.
\end{aligned}
$$

Invert these three terms:

$$
\boxed{
f(t)=2e^{-t}
-2e^{-3t}\cos(2t)
+\frac72e^{-3t}\sin(2t)
}.
$$

Verify by transforming the boxed function forward:

$$
\begin{aligned}
\mathcal{L}\{f(t)\}
&=\frac2{s+1}
-2\frac{s+3}{(s+3)^2+4}
+\frac7{(s+3)^2+4}\\
&=\frac2{s+1}
+\frac{-2s+1}{s^2+6s+13}\\
&=\frac{11s+27}{(s+1)(s^2+6s+13)}.
\end{aligned}
$$

The forward transform returns the given expression.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 22 Final Summary</strong></summary>

The inverse transform reverses a known forward transform:

$$
\boxed{
\mathcal{L}^{-1}\{F(s)\}=f(t)
\quad\Longleftrightarrow\quad
\mathcal{L}\{f(t)\}=F(s)
}.
$$

For rational transforms, use this order:

1. confirm that the rational function is proper
2. factor the denominator over the real numbers
3. choose a complete partial-fraction template
4. clear denominators and solve the constants locally
5. complete any quadratic squares
6. rewrite numerators around the same shifts
7. invert term by term using linearity
8. verify by transforming the result forward

The factor templates to remember are:

$$
\begin{aligned}
(s-a)^m
&\longrightarrow
\frac{A_1}{s-a}+\cdots+\frac{A_m}{(s-a)^m},\\
Q(s)^m
&\longrightarrow
\frac{B_1s+C_1}{Q(s)}+\cdots+
\frac{B_ms+C_m}{Q(s)^m}.
\end{aligned}
$$

The central working principle is:

> expose one recognisable transform pair at a time, and make every algebraic
> change visible before applying the inverse-transform table.

</details>
