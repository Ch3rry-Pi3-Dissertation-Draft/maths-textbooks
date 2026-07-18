# Solving Differential Equations With Laplace Transforms

Chapters 21 through 23 developed forward transforms, inverse transforms,
translation, and convolution. We can now use those tools to solve linear
ordinary differential equations with constant coefficients.

The central idea is that a derivative in time becomes an algebraic expression
in the transform variable $s$. Initial values appear inside that expression,
so an entire initial-value problem can be transformed at once.

This chapter will:

- derive the transform formulas for derivatives
- build a reliable transform-solve-invert workflow
- solve first-order, second-order, and higher-order initial-value problems
- handle ordinary, resonant, unknown, and delayed forcing
- explain what changes when initial information is missing or given away from
  $t=0$

Every worked example and exercise is independently constructed. The reference
chapter is used only to identify the mathematical topics that belong here.

---

## Block 1: Transforming Derivatives

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand where the initial-value terms in a derivative
transform come from, rather than treating the formulas as unexplained rules.

> differentiation becomes multiplication by $s$, but values at $t=0$ must be
> subtracted because the Laplace integral begins at zero.

</details>

<details open>
<summary><strong>Notation Before We Start</strong></summary>

Let $y(t)$ be a function defined for $t\geq0$, and write:

$$
Y(s)=\mathcal{L}\{y(t)\}
=\int_0^\infty e^{-st}y(t)\,dt.
$$

Here:

- $t$ is the time variable
- $s$ is the transform variable
- $y'(t)$ is the first derivative of $y$
- $y^{(n)}(t)$ is the $n$th derivative, not the $n$th power of $y$
- $y(0)$, $y'(0)$, and so on are initial values

We assume that $y$ and the derivatives being transformed behave well enough
for the required Laplace transforms and boundary limits to exist.

</details>

<details open>
<summary><strong>Derive The First-Derivative Formula</strong></summary>

Start from the definition:

$$
\mathcal{L}\{y'(t)\}
=\int_0^\infty e^{-st}y'(t)\,dt.
$$

Use integration by parts with:

$$
u=e^{-st},
\qquad
dv=y'(t)\,dt.
$$

Differentiating and integrating the selected parts gives:

$$
du=-se^{-st}\,dt,
\qquad
v=y(t).
$$

Apply $\int u\,dv=uv-\int v\,du$:

$$
\begin{aligned}
\mathcal{L}\{y'\}
&=\left[e^{-st}y(t)\right]_0^\infty
-\int_0^\infty y(t)(-se^{-st})\,dt\\
&=\left[e^{-st}y(t)\right]_0^\infty
+s\int_0^\infty e^{-st}y(t)\,dt.
\end{aligned}
$$

Under the transform assumptions, $e^{-st}y(t)\to0$ as $t\to\infty$.
At the lower limit, $e^{-s(0)}y(0)=y(0)$. Therefore:

$$
\left[e^{-st}y(t)\right]_0^\infty
=0-y(0)
=-y(0).
$$

The remaining integral is $Y(s)$, so:

$$
\boxed{
\mathcal{L}\{y'(t)\}=sY(s)-y(0)
}.
$$

The term $-y(0)$ is the lower boundary contribution from integration by
parts. It is not an optional correction.

</details>

<details open>
<summary><strong>Build The Second-Derivative Formula</strong></summary>

Apply the first-derivative formula to the function $y'(t)$:

$$
\mathcal{L}\{y''(t)\}
=s\mathcal{L}\{y'(t)\}-y'(0).
$$

Now substitute the formula just derived:

$$
\mathcal{L}\{y'(t)\}=sY(s)-y(0).
$$

This gives:

$$
\begin{aligned}
\mathcal{L}\{y''(t)\}
&=s[sY(s)-y(0)]-y'(0)\\
&=s^2Y(s)-sy(0)-y'(0).
\end{aligned}
$$

The substitution produces the second-derivative formula:

$$
\boxed{
\mathcal{L}\{y''(t)\}
=s^2Y(s)-sy(0)-y'(0)
}.
$$

Notice the pattern: a second derivative requires two initial values.

</details>

<details open>
<summary><strong>The General Derivative Formula</strong></summary>

Repeating the same step gives:

$$
\boxed{
\mathcal{L}\{y^{(n)}(t)\}
=s^nY(s)
-s^{n-1}y(0)
-s^{n-2}y'(0)
-\cdots
-y^{(n-1)}(0)
}.
$$

For the third derivative, write every term explicitly:

$$
\boxed{
\mathcal{L}\{y'''(t)\}
=s^3Y(s)-s^2y(0)-sy'(0)-y''(0)
}.
$$

A useful reading pattern is:

- begin with $s^nY(s)$
- lower the power of $s$ by one each time
- move through the initial values from $y(0)$ up to $y^{(n-1)}(0)$
- subtract every initial-value term

</details>

<details open>
<summary><strong>A Small Substitution Check</strong></summary>

Suppose:

$$
y(0)=2,
\qquad
y'(0)=-3.
$$

Use the second-derivative formula:

$$
\mathcal{L}\{y''\}=s^2Y-sy(0)-y'(0).
$$

Substitute both values, including the negative sign in $y'(0)=-3$:

$$
\begin{aligned}
\mathcal{L}\{y''\}
&=s^2Y-s(2)-(-3)\\
&=s^2Y-2s+3.
\end{aligned}
$$

The last term is positive because the formula subtracts a negative initial
slope.

</details>

<details open>
<summary><strong>Common Formula Errors</strong></summary>

Check for these mistakes:

- writing $\mathcal{L}\{y'\}=sY$ and losing $y(0)$
- writing $-y'(0)$ before the term $-sy(0)$ in the second-derivative formula
  and then forgetting the factor $s$
- treating $y''(0)$ as part of $\mathcal{L}\{y''\}$; it first appears when a
  third derivative is transformed
- dropping a double negative when an initial value is negative

What to remember:

> write the full derivative-transform formula before inserting any numbers.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

The transform of a derivative contains $Y(s)$ and the initial values below
that derivative order. Those initial terms arise from integration by parts and
carry the initial-value problem into the transform domain.

</details>

---

## Block 2: The Transform-Domain Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn a differential-equation initial-value problem into a
repeatable sequence of local operations.

</details>

<details open>
<summary><strong>The Class Of Problems</strong></summary>

We consider a linear equation with constant coefficients:

$$
a_ny^{(n)}+a_{n-1}y^{(n-1)}+\cdots+a_1y'+a_0y=r(t),
$$

together with enough initial values at $t=0$.

Here:

- $a_0,\ldots,a_n$ are constants
- $r(t)$ is the forcing or input
- $y(t)$ is the unknown response

The method works because every derivative transform is algebraic in $s$ and
$Y(s)$.

</details>

<details open>
<summary><strong>The Six-Step Workflow</strong></summary>

Use this sequence:

1. Define $Y(s)=\mathcal{L}\{y(t)\}$.
2. Transform every term in the differential equation.
3. Substitute the initial values immediately and carefully.
4. Collect every term containing $Y(s)$.
5. Solve algebraically for $Y(s)$.
6. Rewrite $Y(s)$ into invertible pieces and take the inverse transform.

Afterward, check the initial values and, when practical, substitute the result
back into the original equation.

The practical meaning:

> the differential equation becomes an algebra problem, but the inverse
> transform is still part of the solution and must be prepared carefully.

</details>

<details open>
<summary><strong>A Symbolic Second-Order Setup</strong></summary>

Consider:

$$
y''+ay'+by=r(t),
\qquad
y(0)=c_0,
\qquad
y'(0)=c_1.
$$

Let $R(s)=\mathcal{L}\{r(t)\}$. Transform each term separately:

$$
\begin{aligned}
\mathcal{L}\{y''\}&=s^2Y-sc_0-c_1,\\
\mathcal{L}\{ay'\}&=a(sY-c_0),\\
\mathcal{L}\{by\}&=bY,\\
\mathcal{L}\{r(t)\}&=R(s).
\end{aligned}
$$

Insert those four expressions into the equation:

$$
[s^2Y-sc_0-c_1]+a[sY-c_0]+bY=R(s).
$$

Expand only after the substitution is visible:

$$
s^2Y-sc_0-c_1+asY-ac_0+bY=R(s).
$$

Collect the terms containing $Y$ on the left and move the initial-value terms
to the right:

$$
(s^2+as+b)Y
=R(s)+sc_0+c_1+ac_0.
$$

Divide by the coefficient of $Y$:

$$
\boxed{
Y(s)=
\frac{R(s)+sc_0+c_1+ac_0}{s^2+as+b}
}.
$$

This is not yet the time-domain solution. The final task is to invert this
specific rational expression.

</details>

<details open>
<summary><strong>Why Initial Conditions Are Applied Early</strong></summary>

In earlier solution methods, we often found a general family first and then
used initial values to determine constants. In the Laplace method, values such
as $y(0)$ and $y'(0)$ enter while derivatives are transformed.

For example:

$$
\mathcal{L}\{y''\}=s^2Y-sy(0)-y'(0).
$$

Once $y(0)$ and $y'(0)$ are inserted, the transform equation already encodes
both the differential equation and its initial conditions.

This is why the method solves the full initial-value problem in one transform
calculation.

</details>

<details open>
<summary><strong>Do Not Invert Too Early</strong></summary>

Suppose a transformed equation contains several copies of $Y$:

$$
s^2Y-2s+1+3sY-6+2Y=\frac4s.
$$

Do not attempt to invert individual terms at this stage. First collect $Y$:

$$
(s^2+3s+2)Y-2s-5=\frac4s.
$$

Move the non-$Y$ terms to the right:

$$
(s^2+3s+2)Y=\frac4s+2s+5.
$$

Only after isolating $Y$ should partial fractions, completing the square, or a
shift theorem be chosen.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Transform the equation, insert data, isolate $Y(s)$ completely, prepare it for
inversion, and then verify the time-domain result. Keeping those stages
separate prevents most algebraic errors.

</details>

---

## Block 3: First-Order Initial-Value Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to practise the full workflow on first-order equations before
adding the extra initial term required by a second derivative.

</details>

<details open>
<summary><strong>A Homogeneous Example</strong></summary>

Solve:

$$
y'+3y=0,
\qquad
y(0)=4.
$$

Define:

$$
Y(s)=\mathcal{L}\{y(t)\}.
$$

Transform the equation term by term:

$$
\mathcal{L}\{y'\}+3\mathcal{L}\{y\}=\mathcal{L}\{0\}.
$$

Use $\mathcal{L}\{y'\}=sY-y(0)$ and $\mathcal{L}\{0\}=0$:

$$
[sY-y(0)]+3Y=0.
$$

Substitute $y(0)=4$:

$$
sY-4+3Y=0.
$$

Collect $Y$ and move $-4$ to the right:

$$
(s+3)Y=4.
$$

Divide by $s+3$:

$$
Y(s)=\frac4{s+3}.
$$

Use $1/(s+a)\longleftrightarrow e^{-at}$:

$$
\boxed{y(t)=4e^{-3t}}.
$$

</details>

<details open>
<summary><strong>Verify The Homogeneous Solution</strong></summary>

Differentiate the proposed solution:

$$
y'(t)=-12e^{-3t}.
$$

Substitute $y$ and $y'$ into the differential equation:

$$
\begin{aligned}
y'+3y
&=-12e^{-3t}+3(4e^{-3t})\\
&=-12e^{-3t}+12e^{-3t}\\
&=0.
\end{aligned}
$$

Check the initial value:

$$
y(0)=4e^0=4.
$$

Both requirements are satisfied.

</details>

<details open>
<summary><strong>A Constant-Forcing Example</strong></summary>

Solve:

$$
y'+2y=6,
\qquad
y(0)=-1.
$$

Transform both sides:

$$
[sY-y(0)]+2Y=\frac6s.
$$

Insert $y(0)=-1$. Because the formula subtracts $y(0)$, this becomes:

$$
sY-(-1)+2Y=\frac6s.
$$

Remove the double negative and collect $Y$:

$$
(s+2)Y+1=\frac6s.
$$

Subtract $1$ from both sides:

$$
(s+2)Y=\frac6s-1.
$$

Write $1=s/s$ so the right side has one denominator:

$$
(s+2)Y=\frac{6-s}{s}.
$$

Divide by $s+2$:

$$
Y=\frac{6-s}{s(s+2)}.
$$

</details>

<details open>
<summary><strong>Prepare And Invert The Forced Transform</strong></summary>

Use:

$$
\frac{6-s}{s(s+2)}=\frac As+\frac B{s+2}.
$$

Multiply by $s(s+2)$:

$$
6-s=A(s+2)+Bs.
$$

Set $s=0$:

$$
6=2A,
\qquad
A=3.
$$

Set $s=-2$:

$$
6-(-2)=B(-2),
$$

so:

$$
8=-2B,
\qquad
B=-4.
$$

Substituting the two partial-fraction constants gives:

$$
Y=\frac3s-\frac4{s+2}.
$$

Invert each term:

$$
\boxed{y(t)=3-4e^{-2t}}.
$$

The constant level $3$ is the equilibrium selected by $2y=6$. The
exponential term adjusts the initial value from $-1$ toward that equilibrium.

</details>

<details open>
<summary><strong>A Delayed Input</strong></summary>

Solve:

$$
y'+y=u(t-2),
\qquad
y(0)=0.
$$

Transform the derivative, the unknown, and the delayed step:

$$
[sY-y(0)]+Y=\frac{e^{-2s}}s.
$$

Insert $y(0)=0$ and collect $Y$:

$$
(s+1)Y=\frac{e^{-2s}}s.
$$

Divide by $s+1$:

$$
Y=e^{-2s}\frac1{s(s+1)}.
$$

First invert the undelayed factor. Decompose it as:

$$
\frac1{s(s+1)}=\frac1s-\frac1{s+1}.
$$

Hence its inverse is:

$$
f(t)=1-e^{-t}.
$$

Now apply the delay $a=2$: attach $u(t-2)$ and replace $t$ by $t-2$ inside
$f$:

$$
\boxed{
y(t)=u(t-2)\left[1-e^{-(t-2)}\right]
}.
$$

![Delayed unit input and its first-order response](books/assets/chapter_24/chapter_24_figure-1.png)

The response remains zero before the input switches on. After $t=2$, it rises
toward the equilibrium value $1$.

</details>

<details open>
<summary><strong>Verify The Delayed Equation By Intervals</strong></summary>

For $0\leq t<2$, the step is zero and $y(t)=0$. Therefore:

$$
y'+y=0+0=0=u(t-2).
$$

For $t>2$, remove the step and write:

$$
y(t)=1-e^{-(t-2)}.
$$

Differentiate on this interval:

$$
y'(t)=e^{-(t-2)}.
$$

Add $y'$ and $y$:

$$
\begin{aligned}
y'+y
&=e^{-(t-2)}+[1-e^{-(t-2)}]\\
&=1\\
&=u(t-2),
\qquad t>2.
\end{aligned}
$$

The formula also gives $y(0)=0$. The switch point itself does not affect the
Laplace calculation.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

For a first-order equation, transform $y'$ as $sY-y(0)$, isolate $Y$, and
then choose direct inversion, partial fractions, or time translation. Delayed
forcing must produce a delayed response, not a response that begins early.

</details>

---

## Block 4: Second-Order Homogeneous Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to solve a second-order initial-value problem while keeping both
initial-value contributions attached to the correct derivative transforms.

</details>

<details open>
<summary><strong>The Two Formulas We Need</strong></summary>

For a second-order equation, keep these formulas together:

$$
\begin{aligned}
\mathcal{L}\{y'\}
&=sY-y(0),\\
\mathcal{L}\{y''\}
&=s^2Y-sy(0)-y'(0).
\end{aligned}
$$

The value $y(0)$ appears in both formulas. The value $y'(0)$ appears only in
the transform of $y''$.

</details>

<details open>
<summary><strong>An Oscillatory Decay Example</strong></summary>

Solve:

$$
y''+4y'+13y=0,
\qquad
y(0)=1,
\qquad
y'(0)=1.
$$

Define $Y(s)=\mathcal{L}\{y(t)\}$. Transform the entire equation:

$$
\mathcal{L}\{y''\}
+4\mathcal{L}\{y'\}
+13\mathcal{L}\{y\}
=0.
$$

Write the derivative formulas before substituting the values:

$$
[s^2Y-sy(0)-y'(0)]
+4[sY-y(0)]
+13Y
=0.
$$

Insert $y(0)=1$ and $y'(0)=1$:

$$
[s^2Y-s-1]+4[sY-1]+13Y=0.
$$

Expand the factor $4$:

$$
s^2Y-s-1+4sY-4+13Y=0.
$$

Collect the $Y$ terms and the remaining terms separately:

$$
(s^2+4s+13)Y-s-5=0.
$$

Add $s+5$ to both sides:

$$
(s^2+4s+13)Y=s+5.
$$

Divide by the quadratic coefficient of $Y$:

$$
Y=\frac{s+5}{s^2+4s+13}.
$$

</details>

<details open>
<summary><strong>Complete The Square And Invert</strong></summary>

Complete the square in the denominator:

$$
\begin{aligned}
s^2+4s+13
&=(s^2+4s+4)+9\\
&=(s+2)^2+3^2.
\end{aligned}
$$

Rewrite the numerator in terms of $s+2$:

$$
s+5=(s+2)+3.
$$

Substitute both rewrites into $Y$:

$$
Y
=\frac{s+2}{(s+2)^2+3^2}
+\frac3{(s+2)^2+3^2}.
$$

Use the shifted cosine and sine pairs:

$$
\begin{aligned}
\frac{s+a}{(s+a)^2+b^2}
&\longleftrightarrow e^{-at}\cos(bt),\\
\frac{b}{(s+a)^2+b^2}
&\longleftrightarrow e^{-at}\sin(bt).
\end{aligned}
$$

Here $a=2$ and $b=3$, so:

$$
\boxed{
y(t)=e^{-2t}\cos(3t)+e^{-2t}\sin(3t)
}.
$$

The factor $e^{-2t}$ controls decay, while the sine and cosine factors create
oscillation with angular frequency $3$.

</details>

<details open>
<summary><strong>Check Both Initial Values</strong></summary>

At $t=0$:

$$
\begin{aligned}
y(0)
&=e^0\cos0+e^0\sin0\\
&=1+0\\
&=1.
\end{aligned}
$$

Differentiate the two products separately:

$$
\begin{aligned}
\frac{d}{dt}[e^{-2t}\cos(3t)]
&=-2e^{-2t}\cos(3t)-3e^{-2t}\sin(3t),\\
\frac{d}{dt}[e^{-2t}\sin(3t)]
&=-2e^{-2t}\sin(3t)+3e^{-2t}\cos(3t).
\end{aligned}
$$

Add them to obtain $y'(t)$, then set $t=0$:

$$
\begin{aligned}
y'(0)
&=-2(1)(1)-3(1)(0)-2(1)(0)+3(1)(1)\\
&=-2+3\\
&=1.
\end{aligned}
$$

The transformed solution preserves both prescribed values.

</details>

<details open>
<summary><strong>A Frequent Second-Order Error</strong></summary>

For the same data, this line is incomplete:

$$
\mathcal{L}\{y''\}=s^2Y-y'(0).
$$

It has lost the term $-sy(0)$. The correct substitution is:

$$
\begin{aligned}
\mathcal{L}\{y''\}
&=s^2Y-sy(0)-y'(0)\\
&=s^2Y-s(1)-1\\
&=s^2Y-s-1.
\end{aligned}
$$

Writing the general formula first makes the missing term much easier to spot.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

A second-order transform contains both $y(0)$ and $y'(0)$. Once $Y(s)$ is
isolated, the denominator structure determines whether to factor, complete a
square, or use another inversion method.

</details>

---

## Block 5: Nonhomogeneous Second-Order Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see how forcing changes the numerator of $Y(s)$ and how the
form of that numerator controls the inversion work.

</details>

<details open>
<summary><strong>A Constant-Forcing Example</strong></summary>

Solve:

$$
y''+3y'+2y=4,
\qquad
y(0)=0,
\qquad
y'(0)=1.
$$

Transform the equation:

$$
\mathcal{L}\{y''\}
+3\mathcal{L}\{y'\}
+2\mathcal{L}\{y\}
=\mathcal{L}\{4\}.
$$

Insert the transform formulas and $\mathcal{L}\{4\}=4/s$:

$$
[s^2Y-sy(0)-y'(0)]
+3[sY-y(0)]
+2Y
=\frac4s.
$$

Now substitute $y(0)=0$ and $y'(0)=1$:

$$
[s^2Y-1]+3[sY]+2Y=\frac4s.
$$

Collect $Y$:

$$
(s^2+3s+2)Y-1=\frac4s.
$$

Add $1$ to both sides:

$$
(s^2+3s+2)Y=\frac4s+1.
$$

Write $1=s/s$ and combine:

$$
(s^2+3s+2)Y=\frac{s+4}{s}.
$$

Factor the quadratic and divide:

$$
Y=\frac{s+4}{s(s+1)(s+2)}.
$$

</details>

<details open>
<summary><strong>Find The Partial-Fraction Constants</strong></summary>

Use the decomposition:

$$
\frac{s+4}{s(s+1)(s+2)}
=\frac As+\frac B{s+1}+\frac C{s+2}.
$$

Multiply every term by $s(s+1)(s+2)$:

$$
s+4=A(s+1)(s+2)+Bs(s+2)+Cs(s+1).
$$

Set $s=0$. The terms containing $B$ and $C$ vanish:

$$
4=A(1)(2),
\qquad
A=2.
$$

Set $s=-1$. The terms containing $A$ and $C$ vanish:

$$
-1+4=B(-1)(1),
$$

so:

$$
3=-B,
\qquad
B=-3.
$$

Set $s=-2$. The terms containing $A$ and $B$ vanish:

$$
-2+4=C(-2)(-1),
$$

so:

$$
2=2C,
\qquad
C=1.
$$

The prepared transform is:

$$
Y=\frac2s-\frac3{s+1}+\frac1{s+2}.
$$

Invert term by term:

$$
\boxed{
y(t)=2-3e^{-t}+e^{-2t}
}.
$$

</details>

<details open>
<summary><strong>Interpret And Check The Constant-Forced Solution</strong></summary>

As $t\to\infty$, both exponentials approach zero, so:

$$
y(t)\to2.
$$

This agrees with the constant equilibrium obtained by setting the derivatives
to zero in the original equation:

$$
2y=4,
\qquad
y=2.
$$

Check the initial position:

$$
y(0)=2-3+1=0.
$$

Differentiate:

$$
y'(t)=3e^{-t}-2e^{-2t}.
$$

Evaluating the derivative at $t=0$ gives:

$$
y'(0)=3-2=1.
$$

The long-term behaviour and both initial values agree with the problem.

</details>

<details open>
<summary><strong>A Resonant Forcing Example</strong></summary>

Solve:

$$
y''+9y=\sin(3t),
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

Transform the equation:

$$
[s^2Y-sy(0)-y'(0)]+9Y=\frac3{s^2+9}.
$$

Insert the zero initial values:

$$
(s^2+9)Y=\frac3{s^2+9}.
$$

Divide by $s^2+9$:

$$
Y=\frac3{(s^2+9)^2}.
$$

The repeated quadratic is the transform-domain signature of resonance here.

</details>

<details open>
<summary><strong>Invert The Repeated Trigonometric Factor</strong></summary>

Write the squared denominator as a product:

$$
\frac1{(s^2+9)^2}
=\frac1{s^2+9}\frac1{s^2+9}.
$$

Since:

$$
\frac1{s^2+9}\longleftrightarrow\frac13\sin(3t),
$$

the inverse product is a convolution:

$$
\mathcal{L}^{-1}\left\{\frac1{(s^2+9)^2}\right\}
=\frac19\int_0^t\sin(3\tau)\sin(3(t-\tau))\,d\tau.
$$

Use the product-to-sum identity:

$$
\sin A\sin B
=\frac12[\cos(A-B)-\cos(A+B)].
$$

Here $A=3\tau$ and $B=3t-3\tau$, so:

$$
A-B=6\tau-3t,
\qquad
A+B=3t.
$$

Substitute these expressions:

$$
\begin{aligned}
\mathcal{L}^{-1}\left\{\frac1{(s^2+9)^2}\right\}
&=\frac1{18}\int_0^t
[\cos(6\tau-3t)-\cos(3t)]\,d\tau\\
&=\frac1{18}
\left[
\frac16\sin(6\tau-3t)-\tau\cos(3t)
\right]_0^t.
\end{aligned}
$$

Evaluate the upper and lower limits:

$$
\begin{aligned}
\left[
\frac16\sin(6\tau-3t)-\tau\cos(3t)
\right]_0^t
&=\left[\frac16\sin(3t)-t\cos(3t)\right]
-\left[\frac16\sin(-3t)-0\right]\\
&=\frac13\sin(3t)-t\cos(3t).
\end{aligned}
$$

Multiplying the evaluated convolution by $1/18$ gives:

$$
\mathcal{L}^{-1}\left\{\frac1{(s^2+9)^2}\right\}
=\frac{\sin(3t)-3t\cos(3t)}{54}.
$$

The required transform has an additional factor $3$:

$$
\boxed{
y(t)=\frac{\sin(3t)-3t\cos(3t)}{18}
}.
$$

The factor $t\cos(3t)$ allows the oscillation envelope to grow. That growth
is the time-domain sign of resonant forcing.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Forcing appears through its transform on the right side. After $Y$ is
isolated, ordinary factors may lead to partial fractions, while repeated
trigonometric factors can reveal resonance and may be inverted by convolution.

</details>

---

## Block 6: Unknown Forcing And Convolution

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to solve an equation structurally even when the forcing function
has not been specified.

</details>

<details open>
<summary><strong>Separate Initial Response From Forced Response</strong></summary>

Consider:

$$
y''+4y=f(t),
\qquad
y(0)=c_0,
\qquad
y'(0)=c_1.
$$

Let:

$$
F(s)=\mathcal{L}\{f(t)\}.
$$

Transform the equation:

$$
[s^2Y-sc_0-c_1]+4Y=F(s).
$$

Collect $Y$ and move the initial terms to the right:

$$
(s^2+4)Y=F(s)+sc_0+c_1.
$$

Divide by $s^2+4$ and split the numerator:

$$
Y
=\frac{sc_0+c_1}{s^2+4}
+\frac{F(s)}{s^2+4}.
$$

Separate the first numerator further:

$$
Y
=c_0\frac{s}{s^2+4}
+\frac{c_1}{2}\frac2{s^2+4}
+F(s)\frac1{s^2+4}.
$$

The first two terms encode the initial state. The final product encodes the
effect of the forcing.

</details>

<details open>
<summary><strong>Invert The Unknown-Forcing Formula</strong></summary>

Use the transform pairs:

$$
\frac{s}{s^2+4}\longleftrightarrow\cos(2t),
\qquad
\frac2{s^2+4}\longleftrightarrow\sin(2t).
$$

Also:

$$
\frac1{s^2+4}\longleftrightarrow\frac12\sin(2t).
$$

The product $F(s)/(s^2+4)$ becomes a convolution. Therefore:

$$
\boxed{
y(t)
=c_0\cos(2t)
+\frac{c_1}{2}\sin(2t)
+\frac12\int_0^t\sin(2(t-\tau))f(\tau)\,d\tau
}.
$$

The formula has two conceptually different parts:

$$
y(t)=\text{response to initial data}+\text{response to forcing}.
$$

</details>

<details open>
<summary><strong>The Impulse-Response View</strong></summary>

With zero initial values, the formula simplifies to:

$$
y(t)=\frac12\int_0^t\sin(2(t-\tau))f(\tau)\,d\tau.
$$

Define:

$$
h(t)=\frac12\sin(2t).
$$

With this definition, the convolution formula becomes:

$$
\boxed{y=h*f}.
$$

The function $h$ is called the **impulse response** of this zero-initial-state
system. It describes how the differential operator responds, while
convolution combines that response with the complete input history.

Another way to see it:

> the denominator $s^2+4$ belongs to the differential operator; its inverse
> transform becomes the kernel that processes the forcing.

</details>

<details open>
<summary><strong>A Concrete Forcing Check</strong></summary>

Take zero initial values and let $f(t)=e^{-t}$. The convolution formula gives:

$$
y(t)=\frac12\int_0^t\sin(2(t-\tau))e^{-\tau}\,d\tau.
$$

An equivalent transform-domain calculation begins from:

$$
Y=\frac1{(s+1)(s^2+4)}.
$$

Use:

$$
\frac1{(s+1)(s^2+4)}
=\frac A{s+1}+\frac{Bs+C}{s^2+4}.
$$

Multiply by $(s+1)(s^2+4)$:

$$
1=A(s^2+4)+(Bs+C)(s+1).
$$

Expand and group powers of $s$:

$$
1=(A+B)s^2+(B+C)s+(4A+C).
$$

Match coefficients with $0s^2+0s+1$:

$$
A+B=0,
\qquad
B+C=0,
\qquad
4A+C=1.
$$

From $B=-A$ and $C=-B=A$, the final equation becomes:

$$
4A+A=1,
\qquad
A=\frac15.
$$

Substituting $A=1/5$ into $B=-A$ and $C=A$ gives:

$$
B=-\frac15,
\qquad
C=\frac15.
$$

Substitute the constants and invert:

$$
\boxed{
y(t)=\frac15e^{-t}-\frac15\cos(2t)+\frac1{10}\sin(2t)
}.
$$

This explicit result is exactly the convolution above, written after the
integral has been evaluated.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An unspecified forcing can remain as $F(s)$. Products involving $F(s)$ become
convolutions, which naturally separate the system's own response from the
input that drives it.

</details>

---

## Block 7: Higher Order And Nonstandard Data

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to extend the method beyond standard first- and second-order
initial-value problems at $t=0$.

</details>

<details open>
<summary><strong>A Third-Order Example</strong></summary>

Solve:

$$
y'''+y'=0,
\qquad
y(0)=2,
\qquad
y'(0)=-1,
\qquad
y''(0)=0.
$$

The required derivative transforms are:

$$
\begin{aligned}
\mathcal{L}\{y'''\}
&=s^3Y-s^2y(0)-sy'(0)-y''(0),\\
\mathcal{L}\{y'\}
&=sY-y(0).
\end{aligned}
$$

Substitute the three initial values into the first formula:

$$
\begin{aligned}
\mathcal{L}\{y'''\}
&=s^3Y-s^2(2)-s(-1)-0\\
&=s^3Y-2s^2+s.
\end{aligned}
$$

Substitute $y(0)=2$ into the second formula:

$$
\mathcal{L}\{y'\}=sY-2.
$$

Insert both transformed derivatives into $y'''+y'=0$:

$$
[s^3Y-2s^2+s]+[sY-2]=0.
$$

Collect the $Y$ terms:

$$
(s^3+s)Y-2s^2+s-2=0.
$$

Move the remaining polynomial to the right:

$$
(s^3+s)Y=2s^2-s+2.
$$

Factor $s^3+s=s(s^2+1)$ and divide:

$$
Y=\frac{2s^2-s+2}{s(s^2+1)}.
$$

</details>

<details open>
<summary><strong>Invert The Third-Order Transform</strong></summary>

The numerator can be separated without a full partial-fraction calculation:

$$
2s^2-s+2=2(s^2+1)-s.
$$

Substitute this form into $Y$:

$$
\begin{aligned}
Y
&=\frac{2(s^2+1)-s}{s(s^2+1)}\\
&=\frac{2(s^2+1)}{s(s^2+1)}
-\frac{s}{s(s^2+1)}\\
&=\frac2s-\frac1{s^2+1}.
\end{aligned}
$$

Invert each term:

$$
\boxed{y(t)=2-\sin t}.
$$

Check the three initial values locally:

$$
\begin{aligned}
y(0)&=2-\sin0=2,\\
y'(t)&=-\cos t,
&y'(0)&=-1,\\
y''(t)&=\sin t,
&y''(0)&=0.
\end{aligned}
$$

</details>

<details open>
<summary><strong>When No Initial Values Are Given</strong></summary>

Laplace transforms can still recover a general solution, but the values at
$t=0$ must remain unknown.

Consider:

$$
y''-5y'+6y=0.
$$

Define:

$$
c_0=y(0),
\qquad
c_1=y'(0).
$$

These are not known numbers. Transform the equation while keeping them:

$$
[s^2Y-sc_0-c_1]-5[sY-c_0]+6Y=0.
$$

Expand:

$$
s^2Y-sc_0-c_1-5sY+5c_0+6Y=0.
$$

Collect $Y$ and move the initial terms to the right:

$$
(s^2-5s+6)Y=(s-5)c_0+c_1.
$$

Factor the quadratic:

$$
Y=\frac{(s-5)c_0+c_1}{(s-2)(s-3)}.
$$

</details>

<details open>
<summary><strong>Recover The General Family</strong></summary>

Write:

$$
Y=\frac A{s-2}+\frac B{s-3}.
$$

Combining the right side gives:

$$
Y
=\frac{A(s-3)+B(s-2)}{(s-2)(s-3)}.
$$

Expand the numerator:

$$
A(s-3)+B(s-2)
=(A+B)s-(3A+2B).
$$

Match this with the numerator already obtained:

$$
(s-5)c_0+c_1=c_0s+(c_1-5c_0).
$$

Equating the coefficient of $s$ and the constant term gives:

$$
A+B=c_0,
\qquad
3A+2B=5c_0-c_1.
$$

Use $B=c_0-A$ in the second equation:

$$
\begin{aligned}
3A+2(c_0-A)&=5c_0-c_1,\\
A+2c_0&=5c_0-c_1,\\
A&=3c_0-c_1.
\end{aligned}
$$

Substituting the value of $A$ into $B=c_0-A$ gives:

$$
\begin{aligned}
B
&=c_0-A\\
&=c_0-(3c_0-c_1)\\
&=c_1-2c_0.
\end{aligned}
$$

Invert $Y$:

$$
y(t)=(3c_0-c_1)e^{2t}+(c_1-2c_0)e^{3t}.
$$

Because $c_0$ and $c_1$ are arbitrary, the two coefficients above are also
arbitrary. Renaming them $C_1$ and $C_2$ gives the familiar general family:

$$
\boxed{y(t)=C_1e^{2t}+C_2e^{3t}}.
$$

No initial information means that the transform method cannot select one
member of the family.

</details>

<details open>
<summary><strong>Conditions Given Away From Zero</strong></summary>

The standard derivative formulas naturally use values at $t=0$. When all
conditions are prescribed at another time, a change of clock can move that
time to zero.

Solve:

$$
y''+4y=0,
\qquad
y(2)=3,
\qquad
y'(2)=-2.
$$

Introduce a new time variable:

$$
x=t-2.
$$

Define a recentered function:

$$
z(x)=y(x+2).
$$

When $t=2$, we have $x=0$. Therefore the given data become:

$$
z(0)=3,
\qquad
z'(0)=-2.
$$

Because the equation has constant coefficients, replacing $t$ by $x$ leaves
its form unchanged:

$$
z''+4z=0.
$$

</details>

<details open>
<summary><strong>Solve In The Recentered Variable</strong></summary>

Let $Z(s)=\mathcal{L}\{z(x)\}$. Transform the recentered equation:

$$
[s^2Z-sz(0)-z'(0)]+4Z=0.
$$

Insert $z(0)=3$ and $z'(0)=-2$:

$$
[s^2Z-3s-(-2)]+4Z=0.
$$

Remove the double negative and collect $Z$:

$$
(s^2+4)Z-3s+2=0.
$$

Move the remaining terms to the right:

$$
(s^2+4)Z=3s-2.
$$

Divide and separate:

$$
Z=3\frac{s}{s^2+4}-\frac2{s^2+4}.
$$

Invert in the variable $x$:

$$
z(x)=3\cos(2x)-\sin(2x).
$$

Finally, return to $x=t-2$:

$$
\boxed{
y(t)=3\cos(2(t-2))-\sin(2(t-2))
}.
$$

The replacement $x=t-2$ is not the second-shifting theorem. It is a change of
independent variable that relocates the initial time.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Higher derivatives require more initial-value terms. Missing data must remain
arbitrary, while data prescribed at a common nonzero time can often be handled
cleanly by recentering the independent variable.

</details>

---

## Block 8: A Reliable End-To-End Method

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to choose each transform tool deliberately and to catch an
incorrect result before moving on.

</details>

<details open>
<summary><strong>The Full Checklist</strong></summary>

For a constant-coefficient initial-value problem:

1. Write $Y(s)=\mathcal{L}\{y(t)\}$.
2. Write the complete transform formula for every derivative.
3. Insert all data at $t=0$, preserving signs and powers of $s$.
4. Transform the forcing independently.
5. Collect every term containing $Y$ before dividing.
6. Isolate $Y$ completely.
7. Inspect the denominator and any exponential factors.
8. Choose partial fractions, completing the square, convolution, or time
   translation as needed.
9. Invert every term.
10. Check the initial values and the original equation.

Do not combine Steps 2 through 5 mentally when learning the method. Those are
the steps where missing initial terms and sign errors are most likely.

</details>

<details open>
<summary><strong>Let The Transform Structure Choose The Tool</strong></summary>

After $Y$ has been isolated, look for these signals:

- distinct linear factors suggest partial fractions
- a quadratic such as $(s+a)^2+b^2$ suggests shifted sine and cosine pairs
- a product $F(s)G(s)$ may be inverted by convolution
- a factor $e^{-as}$ indicates a delayed time-domain response
- a repeated factor may create a polynomial multiplier such as $t$

The transform expression is not algebraic clutter. Its structure is a map of
the remaining solution method.

</details>

<details open>
<summary><strong>Check Initial Values Before Differentiating Everything</strong></summary>

Initial-value checks are usually the fastest diagnostic.

If a proposed solution is:

$$
y(t)=A+Be^{-2t}+C\sin(3t),
$$

then:

$$
y(0)=A+B.
$$

Differentiate once:

$$
y'(t)=-2Be^{-2t}+3C\cos(3t),
$$

so:

$$
y'(0)=-2B+3C.
$$

If either value disagrees with the problem, there is no need to perform a
long substitution into the differential equation. The answer is already
incorrect.

</details>

<details open>
<summary><strong>Check Long-Term Behaviour</strong></summary>

For a stable equation driven by a constant input, the long-term value can
often be predicted without solving.

For example, in:

$$
y''+3y'+2y=4,
$$

For $y''+3y'+2y=4$, a constant equilibrium has $y'=y''=0$.
Substituting those zero derivatives leaves:

$$
2y=4,
\qquad
y=2.
$$

A derived solution that grows without bound or approaches a different
constant should be rechecked.

This check is qualitative; it does not replace the derivation.

</details>

<details open>
<summary><strong>Check Delays For Causality</strong></summary>

If the initial state is zero and the forcing begins at $t=a$, the response
should not begin before $t=a$.

A correct delayed result has the form:

$$
u(t-a)f(t-a).
$$

This expression is zero for $t<a$. A formula containing $f(t-a)$ without the
step may incorrectly predict a response before the input exists.

</details>

<details open>
<summary><strong>Common End-To-End Errors</strong></summary>

Watch for:

- omitting one initial-value term from a derivative transform
- inserting a negative initial value without parentheses
- moving a term across the equals sign without changing its sign
- dividing only part of an equation by the coefficient of $Y$
- using partial fractions before $Y$ has been isolated
- treating $e^{-as}$ as an ordinary scalar rather than a delay
- failing to shift the internal time argument when applying a delay
- applying conditions at $t=a$ directly to formulas built around $t=0$
- presenting an inverse transform without checking the original data

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

The Laplace method is reliable when each representation change is explicit:
derivatives become algebraic expressions, the transformed equation is solved
for $Y$, and transform structure determines the inversion method. Initial,
long-term, and causality checks provide fast independent evidence.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Derivatives And First Order</strong></summary>

### Problem 1: Transform A Third Derivative

Given:

$$
y(0)=2,
\qquad
y'(0)=-1,
\qquad
y''(0)=4,
$$

write $\mathcal{L}\{y'''(t)\}$ in terms of $Y(s)$.

### Problem 2: Diagnose A Missing Initial Term

A learner writes:

$$
\mathcal{L}\{y''\}=s^2Y-y'(0).
$$

Identify the missing term and give the correct formula.

### Problem 3: Solve A First-Order Decay Problem

Use Laplace transforms to solve:

$$
y'+4y=0,
\qquad
y(0)=-2.
$$

### Problem 4: Solve A First-Order Forced Problem

Use Laplace transforms to solve:

$$
y'+3y=9,
\qquad
y(0)=1.
$$

</details>

<details open>
<summary><strong>Problems 5 To 8: Second Order And Forcing</strong></summary>

### Problem 5: Solve A Homogeneous Second-Order Problem

Use Laplace transforms to solve:

$$
y''+5y'+6y=0,
\qquad
y(0)=2,
\qquad
y'(0)=-1.
$$

### Problem 6: Solve A Constant-Forced Oscillator

Use Laplace transforms to solve:

$$
y''+4y=8,
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

### Problem 7: Handle A Delayed Input

Use Laplace transforms to solve:

$$
y'+2y=u(t-1),
\qquad
y(0)=0.
$$

### Problem 8: Solve A Resonant Cosine Problem

Use Laplace transforms to solve:

$$
y''+16y=\cos(4t),
\qquad
y(0)=0,
\qquad
y'(0)=0.
$$

</details>

<details open>
<summary><strong>Problems 9 To 12: Structural And Higher-Order Cases</strong></summary>

### Problem 9: Leave The Forcing Unspecified

For:

$$
y''+9y=f(t),
\qquad
y(0)=0,
\qquad
y'(0)=0,
$$

express the solution as a convolution involving $f$.

### Problem 10: Solve A Third-Order Problem

Use Laplace transforms to solve:

$$
y'''+y'=0,
\qquad
y(0)=1,
\qquad
y'(0)=0,
\qquad
y''(0)=-2.
$$

### Problem 11: Recenter Nonzero-Time Data

Use a recentered time variable and Laplace transforms to solve:

$$
y'+2y=0,
\qquad
y(3)=5.
$$

### Problem 12: Recover A Family Without Initial Data

Use Laplace transforms, keeping $c_0=y(0)$ and $c_1=y'(0)$ arbitrary, to
solve:

$$
y''-y=0.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Start from the third-derivative formula:

$$
\mathcal{L}\{y'''\}
=s^3Y-s^2y(0)-sy'(0)-y''(0).
$$

Substitute $y(0)=2$, $y'(0)=-1$, and $y''(0)=4$:

$$
\begin{aligned}
\mathcal{L}\{y'''\}
&=s^3Y-s^2(2)-s(-1)-4\\
&=\boxed{s^3Y-2s^2+s-4}.
\end{aligned}
$$

### Answer 2

The missing term is $-sy(0)$. A second derivative needs both $y(0)$ and
$y'(0)$:

$$
\boxed{
\mathcal{L}\{y''\}
=s^2Y-sy(0)-y'(0)
}.
$$

### Answer 3

Transform $y'+4y=0$ using $\mathcal{L}\{y'\}=sY-y(0)$:

$$
[sY-y(0)]+4Y=0.
$$

Insert $y(0)=-2$:

$$
sY-(-2)+4Y=0.
$$

Remove the double negative, collect $Y$, and solve:

$$
\begin{aligned}
(s+4)Y+2&=0,\\
(s+4)Y&=-2,\\
Y&=-\frac2{s+4}.
\end{aligned}
$$

Invert:

$$
\boxed{y(t)=-2e^{-4t}}.
$$

### Answer 4

Transform $y'+3y=9$:

$$
[sY-y(0)]+3Y=\frac9s.
$$

Insert $y(0)=1$ and collect $Y$:

$$
(s+3)Y-1=\frac9s.
$$

Add $1$ to both sides and combine the right side:

$$
\begin{aligned}
(s+3)Y
&=\frac9s+1\\
&=\frac{s+9}{s}.
\end{aligned}
$$

Divide by $s+3$:

$$
Y=\frac{s+9}{s(s+3)}.
$$

Use $Y=A/s+B/(s+3)$. Multiplying by $s(s+3)$ gives:

$$
s+9=A(s+3)+Bs.
$$

Set $s=0$ to obtain $9=3A$, so $A=3$. Set $s=-3$ to obtain
$6=-3B$, so $B=-2$. Substituting both constants gives:

$$
Y=\frac3s-\frac2{s+3}.
$$

<!-- print-page-break -->

Invert:

$$
\boxed{y(t)=3-2e^{-3t}}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Transform the equation using both derivative formulas:

$$
[s^2Y-sy(0)-y'(0)]
+5[sY-y(0)]
+6Y=0.
$$

Insert $y(0)=2$ and $y'(0)=-1$:

$$
[s^2Y-2s-(-1)]+5[sY-2]+6Y=0.
$$

Remove the double negative and expand:

$$
s^2Y-2s+1+5sY-10+6Y=0.
$$

Collect $Y$ and move the remaining terms to the right:

$$
(s^2+5s+6)Y=2s+9.
$$

Factor and divide:

$$
Y=\frac{2s+9}{(s+2)(s+3)}.
$$

Use $Y=A/(s+2)+B/(s+3)$:

$$
2s+9=A(s+3)+B(s+2).
$$

Set $s=-2$:

$$
5=A,
$$

and set $s=-3$:

$$
3=-B,
\qquad
B=-3.
$$

Inverting the two partial-fraction terms gives:

$$
\boxed{y(t)=5e^{-2t}-3e^{-3t}}.
$$

### Answer 6

Transform the equation and insert the zero initial values:

$$
(s^2+4)Y=\frac8s.
$$

Solve for $Y$:

$$
Y=\frac8{s(s^2+4)}.
$$

Use the form:

$$
\frac8{s(s^2+4)}=\frac As+\frac{Bs}{s^2+4}.
$$

Multiplying by $s(s^2+4)$ gives:

$$
8=A(s^2+4)+Bs^2.
$$

Match the constant term and the coefficient of $s^2$:

$$
4A=8,
\qquad
A+B=0.
$$

Therefore $A=2$ and $B=-2$, so:

$$
Y=\frac2s-2\frac{s}{s^2+4}.
$$

Invert:

$$
\boxed{y(t)=2-2\cos(2t)}.
$$

### Answer 7

Transform the equation:

$$
[sY-y(0)]+2Y=\frac{e^{-s}}s.
$$

Insert $y(0)=0$ and solve for $Y$:

$$
Y=e^{-s}\frac1{s(s+2)}.
$$

Prepare the undelayed factor:

$$
\frac1{s(s+2)}
=\frac12\left(\frac1s-\frac1{s+2}\right).
$$

Its inverse is:

$$
f(t)=\frac12(1-e^{-2t}).
$$

Apply the delay $a=1$ to the complete function:

$$
\boxed{
y(t)=\frac12u(t-1)\left[1-e^{-2(t-1)}\right]
}.
$$

### Answer 8

Transform the equation with zero initial values:

$$
(s^2+16)Y=\frac{s}{s^2+16}.
$$

Divide by $s^2+16$:

$$
Y=\frac{s}{(s^2+16)^2}.
$$

Use the transform-differentiation property:

$$
\mathcal{L}\{tf(t)\}=-\frac{d}{ds}F(s).
$$

For $f(t)=(1/4)\sin(4t)$, we have $F(s)=1/(s^2+16)$. Differentiate:

$$
-\frac{d}{ds}\left(\frac1{s^2+16}\right)
=\frac{2s}{(s^2+16)^2}.
$$

Applying the transform-differentiation property to this derivative gives:

$$
\mathcal{L}\left\{\frac t4\sin(4t)\right\}
=\frac{2s}{(s^2+16)^2}.
$$

Divide both sides by $2$ to match $Y$:

$$
\boxed{y(t)=\frac t8\sin(4t)}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Let $F(s)=\mathcal{L}\{f(t)\}$. Transform the equation with zero initial
values:

$$
(s^2+9)Y=F(s).
$$

Solve for $Y$:

$$
Y=F(s)\frac1{s^2+9}.
$$

Since:

$$
\frac1{s^2+9}\longleftrightarrow\frac13\sin(3t),
$$

the product becomes a convolution:

$$
\boxed{
y(t)=\frac13\int_0^t\sin(3(t-\tau))f(\tau)\,d\tau
}.
$$

### Answer 10

Use:

$$
\begin{aligned}
\mathcal{L}\{y'''\}
&=s^3Y-s^2y(0)-sy'(0)-y''(0),\\
\mathcal{L}\{y'\}
&=sY-y(0).
\end{aligned}
$$

Insert $y(0)=1$, $y'(0)=0$, and $y''(0)=-2$:

$$
[s^3Y-s^2-s(0)-(-2)]+[sY-1]=0.
$$

Simplify and collect $Y$:

$$
(s^3+s)Y-s^2+1=0.
$$

Move the polynomial to the right and factor:

$$
Y=\frac{s^2-1}{s(s^2+1)}.
$$

Write:

$$
\frac{s^2-1}{s(s^2+1)}
=-\frac1s+2\frac{s}{s^2+1}.
$$

Invert:

$$
\boxed{y(t)=-1+2\cos t}.
$$

### Answer 11

Recenter time at $t=3$:

$$
x=t-3,
\qquad
z(x)=y(x+3).
$$

Then $z(0)=5$, and the equation becomes:

$$
z'+2z=0.
$$

Let $Z(s)=\mathcal{L}\{z(x)\}$. Transform and insert $z(0)=5$:

$$
[sZ-5]+2Z=0.
$$

Collect and solve:

$$
Z=\frac5{s+2}.
$$

Invert in $x$:

$$
z(x)=5e^{-2x}.
$$

Return to $x=t-3$:

$$
\boxed{y(t)=5e^{-2(t-3)}}.
$$

### Answer 12

Keep:

$$
c_0=y(0),
\qquad
c_1=y'(0)
$$

arbitrary. Transform $y''-y=0$:

$$
[s^2Y-sc_0-c_1]-Y=0.
$$

Collect $Y$ and move the initial terms to the right:

$$
(s^2-1)Y=sc_0+c_1.
$$

Divide and separate the two terms:

$$
Y
=c_0\frac{s}{s^2-1}
+c_1\frac1{s^2-1}.
$$

Use:

$$
\frac{s}{s^2-1}\longleftrightarrow\cosh t,
\qquad
\frac1{s^2-1}\longleftrightarrow\sinh t.
$$

Inverting the two transform pairs gives:

$$
y(t)=c_0\cosh t+c_1\sinh t.
$$

Because $c_0$ and $c_1$ are arbitrary, this is the two-parameter solution
family. Equivalently:

$$
\boxed{y(t)=C_1e^t+C_2e^{-t}}.
$$

</details>

<details open>
<summary><strong>Chapter 24 Final Summary</strong></summary>

The essential derivative formulas are:

$$
\begin{aligned}
\mathcal{L}\{y'\}
&=sY-y(0),\\
\mathcal{L}\{y''\}
&=s^2Y-sy(0)-y'(0),\\
\mathcal{L}\{y^{(n)}\}
&=s^nY-s^{n-1}y(0)-\cdots-y^{(n-1)}(0).
\end{aligned}
$$

For a constant-coefficient initial-value problem, transform every term,
insert the data, isolate $Y(s)$, prepare the result for inversion, and verify
the time-domain function.

Partial fractions, completing the square, convolution, and time translation
are not separate topics at this stage. They are the inversion tools selected
by the structure of $Y(s)$.

> the Laplace transform carries the differential equation and its initial
> data into one algebraic equation; the quality of the solution depends on
> making every term in that translation visible.

</details>
