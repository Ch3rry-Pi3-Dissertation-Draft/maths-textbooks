# Variation Of Parameters For Linear Differential Equations

Chapter 11 constructed particular solutions by guessing a derivative-closed
trial family. That method is efficient when the equation has constant
coefficients and the forcing has one of the familiar polynomial, exponential,
or trigonometric forms.

This chapter develops a broader method. Instead of guessing the shape of the
forced response, **variation of parameters** begins with the known homogeneous
solutions and allows their constant coefficients to become functions.

The main questions are:

- why does replacing constants by functions create a particular solution?
- why is an additional simplifying condition introduced?
- where do the two Wronskian formulas come from?
- why must an equation be put into standard form first?
- how does the method handle forcing terms outside the scope of undetermined
  coefficients?
- how are initial conditions incorporated without losing the particular
  solution?
- what changes for first-order and higher-order equations?
- when is variation of parameters theoretically valid but practically awkward?

All examples, equations, and exercises in this chapter are independently
constructed. The reference text is used only to identify the mathematical
topics.

---

## Block 1: Turning Homogeneous Constants Into Functions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand the central move behind variation of parameters:

$$
y_h=c_1y_1+c_2y_2
$$

becomes the particular-solution proposal:

$$
\boxed{y_p=u_1(x)y_1(x)+u_2(x)y_2(x)}.
$$

The known homogeneous solutions $y_1,y_2$ are retained. The constants
$c_1,c_2$ are replaced by unknown functions $u_1,u_2$ that can adapt to the
forcing.

</details>

<details open>
<summary><strong>What Problem Are We Solving?</strong></summary>

Consider a second-order linear nonhomogeneous equation:

$$
a(x)y''+b(x)y'+c(x)y=g(x),
$$

on an interval where $a(x)\ne 0$.

As in Chapter 11, the general solution has the structure:

$$
\boxed{y=y_h+y_p},
$$

where:

- $y_h$ is the general solution of the associated homogeneous equation
- $y_p$ is one particular solution of the nonhomogeneous equation

Variation of parameters is a method for constructing that one $y_p$ after a
fundamental pair of homogeneous solutions is known.

The phrase **fundamental pair** means two linearly independent solutions
$y_1,y_2$. Their linear combinations produce the complete homogeneous family:

$$
y_h=c_1y_1+c_2y_2.
$$

</details>

<details open>
<summary><strong>Why Chapter 11 Needs A Companion Method</strong></summary>

Undetermined coefficients depends on predicting a finite trial family that is
preserved by differentiation. It works well for forcing terms such as:

$$
x^3-2x,
\qquad
e^{4x},
\qquad
\cos(5x),
\qquad
xe^x\sin(2x).
$$

Now consider forcing terms such as:

$$
\ln x,
\qquad
\tan x,
\qquad
\frac{1}{1+x^2}.
$$

Repeated differentiation does not keep these functions inside a small,
predictable trial family. The Chapter 11 trial ledger therefore has no standard
entry for them.

Variation of parameters does not require that kind of guess. It converts the
problem into equations for $u_1'$ and $u_2'$, followed by integration.

The practical meaning is:

> undetermined coefficients predicts a convenient response shape, whereas
> variation of parameters builds the response from the homogeneous modes.

</details>

<details open>
<summary><strong>Why Vary The Parameters?</strong></summary>

Suppose the homogeneous equation has the solution family:

$$
y_h=c_1y_1+c_2y_2.
$$

The constants $c_1,c_2$ allow us to select different homogeneous solutions,
but constant coefficients cannot create a nonzero forcing. Every such linear
combination still satisfies the homogeneous equation.

Variation of parameters replaces the constants by functions:

$$
c_1\longrightarrow u_1(x),
\qquad
c_2\longrightarrow u_2(x).
$$

This produces:

$$
y_p=u_1y_1+u_2y_2.
$$

When this expression is differentiated, the new terms $u_1'$ and $u_2'$
appear. Those terms provide the extra freedom needed to reproduce $g(x)$.

Another way to see it:

> the homogeneous functions provide the available modes, while the varying
> coefficients determine how much of each mode is supplied at each value of
> the independent variable.

</details>

<details open>
<summary><strong>Why One Particular Solution Is Still Enough</strong></summary>

Suppose variation of parameters produces one function $y_p$ satisfying:

$$
L[y_p]=g(x).
$$

If integration choices produce another particular solution $\widetilde y_p$,
then:

$$
L[\widetilde y_p]=g(x).
$$

Subtract the two equations:

$$
\begin{aligned}
L[\widetilde y_p-y_p]
&=L[\widetilde y_p]-L[y_p] \\
&=g(x)-g(x) \\
&=0.
\end{aligned}
$$

Thus $\widetilde y_p-y_p$ is homogeneous. Any difference caused by constants
of integration is already represented by $y_h$.

This is why the integrals used to build $u_1,u_2$ may be taken without adding
arbitrary constants.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Variation of parameters starts from a known fundamental pair $y_1,y_2$ and
seeks:

$$
y_p=u_1y_1+u_2y_2.
$$

The unknown functions $u_1,u_2$ vary the homogeneous coefficients so that the
new derivative terms can generate the forcing. Only one particular solution is
needed because all differences between particular solutions are homogeneous.

</details>

---

## Block 2: Deriving The Second-Order Method

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive, rather than merely quote, the formulas:

$$
\boxed{
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}
}.
$$

Here $R$ is the forcing after the equation has been normalized, and $W$ is the
Wronskian of $y_1,y_2$.

</details>

<details open>
<summary><strong>Start With Standard Form</strong></summary>

For the derivation, write the equation in **standard form**:

$$
y''+P(x)y'+Q(x)y=R(x).
$$

The associated homogeneous equation is:

$$
y''+P(x)y'+Q(x)y=0.
$$

Let $y_1,y_2$ be linearly independent solutions of this homogeneous equation.
Therefore:

$$
y_1''+Py_1'+Qy_1=0
$$

and:

$$
y_2''+Py_2'+Qy_2=0.
$$

These two zero identities will be used locally when the proposed particular
solution is substituted.

</details>

<details open>
<summary><strong>Differentiate The Proposal Without Skipping Terms</strong></summary>

Begin with:

$$
y_p=u_1y_1+u_2y_2.
$$

Differentiate each product separately:

$$
\begin{aligned}
y_p'
&=(u_1y_1)'+(u_2y_2)' \\
&=u_1'y_1+u_1y_1'+u_2'y_2+u_2y_2'.
\end{aligned}
$$

At this point there are two unknown functions but only one differential
equation. There is freedom to impose one additional relation that makes the
calculation manageable.

</details>

<details open>
<summary><strong>Why We Introduce The Auxiliary Condition</strong></summary>

Choose the auxiliary condition:

$$
\boxed{u_1'y_1+u_2'y_2=0}.
$$

This condition is not taken from the original differential equation. It is a
deliberate choice that uses the extra freedom in representing one function
$y_p$ with two unknown coefficient functions.

Group the full derivative as:

$$
y_p'
=\underbrace{u_1'y_1+u_2'y_2}_{0}
+u_1y_1'+u_2y_2'.
$$

The auxiliary condition removes the underbraced group, leaving:

$$
\boxed{y_p'=u_1y_1'+u_2y_2'}.
$$

Why is this useful? If the four-term expression for $y_p'$ were differentiated
again, second derivatives $u_1''$ and $u_2''$ would appear. The chosen condition
prevents those terms from entering the calculation.

What to remember:

> the auxiliary condition does not change the differential equation; it selects
> a convenient pair of coefficient functions representing the particular
> solution.

</details>

<details open>
<summary><strong>Differentiate Again And Substitute</strong></summary>

The simplified first derivative is:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

Differentiate both products:

$$
\begin{aligned}
y_p''
&=(u_1y_1')'+(u_2y_2')' \\
&=u_1'y_1'+u_1y_1''+u_2'y_2'+u_2y_2''.
\end{aligned}
$$

Now substitute $y_p$, $y_p'$, and $y_p''$ into the left side of:

$$
y_p''+Py_p'+Qy_p=R.
$$

This gives:

$$
\begin{aligned}
&y_p''+Py_p'+Qy_p \\
&=u_1'y_1'+u_1y_1''+u_2'y_2'+u_2y_2'' \\
&\quad +P(u_1y_1'+u_2y_2')+Q(u_1y_1+u_2y_2).
\end{aligned}
$$

Group the terms multiplying $u_1$, the terms multiplying $u_2$, and the two
terms containing derivatives of the parameters:

$$
\begin{aligned}
y_p''+Py_p'+Qy_p
&=u_1'y_1'+u_2'y_2' \\
&\quad +u_1(y_1''+Py_1'+Qy_1) \\
&\quad +u_2(y_2''+Py_2'+Qy_2).
\end{aligned}
$$

Because $y_1$ and $y_2$ solve the homogeneous equation:

$$
y_1''+Py_1'+Qy_1=0,
\qquad
y_2''+Py_2'+Qy_2=0.
$$

Substitute those two zero values into the grouped expression:

$$
y_p''+Py_p'+Qy_p=u_1'y_1'+u_2'y_2'.
$$

The required right side is $R$, so the remaining equation is:

$$
\boxed{u_1'y_1'+u_2'y_2'=R}.
$$

</details>

<details open>
<summary><strong>The Two-Equation System</strong></summary>

The auxiliary condition supplied the first equation:

$$
u_1'y_1+u_2'y_2=0.
$$

Substitution into the differential equation supplied the second:

$$
u_1'y_1'+u_2'y_2'=R.
$$

Place them together:

$$
\boxed{
\begin{aligned}
y_1u_1'+y_2u_2'&=0, \\
y_1'u_1'+y_2'u_2'&=R.
\end{aligned}
}
$$

This is an algebraic linear system for the two quantities $u_1'$ and $u_2'$ at
each $x$. The unknowns at this stage are the derivatives of the parameters,
not the parameters themselves.

</details>

<details open>
<summary><strong>Solve The System With The Wronskian</strong></summary>

Write the system in matrix form:

$$
\begin{bmatrix}
y_1 & y_2 \\
y_1' & y_2'
\end{bmatrix}
\begin{bmatrix}
u_1' \\
u_2'
\end{bmatrix}
=
\begin{bmatrix}
0 \\
R
\end{bmatrix}.
$$

The determinant of the coefficient matrix is the Wronskian:

$$
\boxed{W=y_1y_2'-y_1'y_2}.
$$

Because $y_1,y_2$ are linearly independent, $W\ne 0$ on the interval under
consideration. The system therefore has a unique solution.

For $u_1'$, replace the first column by the right-side column. Cramer's rule
gives:

$$
\begin{aligned}
u_1'
&=\frac{
\begin{vmatrix}
0 & y_2 \\
R & y_2'
\end{vmatrix}
}{W} \\
&=\frac{0\cdot y_2'-y_2R}{W} \\
&=-\frac{y_2R}{W}.
\end{aligned}
$$

For $u_2'$, replace the second column by the right-side column:

$$
\begin{aligned}
u_2'
&=\frac{
\begin{vmatrix}
y_1 & 0 \\
y_1' & R
\end{vmatrix}
}{W} \\
&=\frac{y_1R-0\cdot y_1'}{W} \\
&=\frac{y_1R}{W}.
\end{aligned}
$$

Thus:

$$
\boxed{
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}
}.
$$

</details>

<details open>
<summary><strong>Integrate And Reconstruct The Particular Solution</strong></summary>

Once $u_1'$ and $u_2'$ are known, integrate:

$$
u_1=-\int \frac{y_2R}{W}\,dx,
\qquad
u_2=\int \frac{y_1R}{W}\,dx.
$$

Then return to the proposal:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute the two integral expressions:

$$
\boxed{
y_p
=-y_1\int \frac{y_2R}{W}\,dx
+y_2\int \frac{y_1R}{W}\,dx
}.
$$

Do not attach arbitrary constants to these two integrals when seeking one
particular solution. If constants $k_1,k_2$ were included, they would add:

$$
k_1y_1+k_2y_2,
$$

which is already part of $y_h$.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For:

$$
y''+Py'+Qy=R,
$$

with a fundamental pair $y_1,y_2$, set:

$$
y_p=u_1y_1+u_2y_2.
$$

The auxiliary condition and the differential equation produce:

$$
\begin{aligned}
y_1u_1'+y_2u_2'&=0, \\
y_1'u_1'+y_2'u_2'&=R.
\end{aligned}
$$

Solving with $W=y_1y_2'-y_1'y_2$ gives:

$$
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}.
$$

Integrate, substitute into $y_p=u_1y_1+u_2y_2$, and finally add $y_h$.

</details>

---

## Block 3: Standard Form, Intervals, And The Wronskian

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to prepare an equation correctly before applying the formulas. The
most important preliminary step is making the coefficient of $y''$ equal to
$1$.

</details>

<details open>
<summary><strong>Normalize Every Term</strong></summary>

Suppose the equation is:

$$
a(x)y''+b(x)y'+c(x)y=g(x),
$$

where $a(x)\ne 0$ on the chosen interval.

Divide **every term** by $a(x)$:

$$
\frac{a}{a}y''+\frac{b}{a}y'+\frac{c}{a}y=\frac{g}{a}.
$$

Since $a/a=1$, the standard form is:

$$
y''+\frac{b}{a}y'+\frac{c}{a}y=\frac{g}{a}.
$$

Therefore:

$$
P=\frac{b}{a},
\qquad
Q=\frac{c}{a},
\qquad
\boxed{R=\frac{g}{a}}.
$$

The forcing used in the variation formulas is $R=g/a$, not the original
$g$.

</details>

<details open>
<summary><strong>The Equivalent Nonstandard Formula</strong></summary>

After normalization:

$$
R=\frac{g}{a}.
$$

Substitute this into the standard formulas:

$$
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}.
$$

For $u_1'$:

$$
u_1'
=-\frac{y_2(g/a)}{W}
=-\frac{y_2g}{aW}.
$$

For $u_2'$:

$$
u_2'
=\frac{y_1(g/a)}{W}
=\frac{y_1g}{aW}.
$$

Thus the equivalent formulas for the unnormalized equation are:

$$
\boxed{
u_1'=-\frac{y_2g}{aW},
\qquad
u_2'=\frac{y_1g}{aW}
}.
$$

Using these formulas is valid, but normalizing first is usually clearer because
it makes the actual forcing $R$ visible.

</details>

<details open>
<summary><strong>Compute The Wronskian In A Fixed Order</strong></summary>

For an ordered pair $(y_1,y_2)$, use:

$$
W(y_1,y_2)
=
\begin{vmatrix}
y_1 & y_2 \\
y_1' & y_2'
\end{vmatrix}
=y_1y_2'-y_1'y_2.
$$

If the pair is reversed, then:

$$
W(y_2,y_1)=-W(y_1,y_2).
$$

The formulas for $u_1'$ and $u_2'$ are tied to the same ordering. Reversing the
functions without recomputing the Wronskian is a common source of sign errors.

</details>

<details open>
<summary><strong>The Interval Matters</strong></summary>

Variation of parameters is applied on an interval where:

- the normalized coefficients $P,Q,R$ are continuous
- the leading coefficient $a(x)$ is nonzero
- the selected fundamental solutions are defined
- the Wronskian is nonzero

For example, if normalization requires division by $x^2$, the calculation
cannot pass through $x=0$. One might work on $(0,\infty)$ or on
$(-\infty,0)$, but not on a single interval crossing zero.

Likewise, an antiderivative such as:

$$
\int \cot x\,dx=\ln|\sin x|
$$

must be interpreted on an interval that does not contain a zero of $\sin x$.

</details>

<details open>
<summary><strong>A Preparation Example</strong></summary>

Prepare the equation:

$$
2x^2y''-6xy'+8y=x^4\ln x,
\qquad x>0.
$$

The leading coefficient is:

$$
a(x)=2x^2.
$$

Divide each term by $2x^2$:

$$
\frac{2x^2}{2x^2}y''
-\frac{6x}{2x^2}y'
+\frac{8}{2x^2}y
=\frac{x^4\ln x}{2x^2}.
$$

Simplify each coefficient:

$$
y''-\frac{3}{x}y'+\frac{4}{x^2}y
=\frac{x^2\ln x}{2}.
$$

Thus the forcing used in the variation formulas is:

$$
\boxed{R(x)=\frac{x^2\ln x}{2}}.
$$

The restriction $x>0$ keeps the divided coefficients defined and makes
$\ln x$ real.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Before using variation of parameters:

1. choose an interval on which the equation is regular
2. divide every term by the leading coefficient
3. identify the normalized forcing $R=g/a$
4. order the fundamental solutions and compute $W=y_1y_2'-y_1'y_2$
5. keep that ordering throughout the calculation

The most frequent setup error is using $g$ where the formulas require $R$.

</details>

---

## Block 4: Complete Second-Order Examples

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to carry the entire method through two different situations:

- a forcing function outside the usual undetermined-coefficients ledger
- a variable-coefficient equation that must be normalized first

</details>

<details open>
<summary><strong>A Trigonometric Forcing Outside The Trial Ledger</strong></summary>

Solve on the interval $0<x<\pi$:

$$
y''+y=\csc x.
$$

### Step 1: Solve the associated homogeneous equation

The associated homogeneous equation is:

$$
y''+y=0.
$$

Its characteristic equation is:

$$
r^2+1=0.
$$

The roots are $r=\pm i$, so choose the ordered fundamental pair:

$$
y_1=\cos x,
\qquad
y_2=\sin x.
$$

Therefore:

$$
y_h=c_1\cos x+c_2\sin x.
$$

### Step 2: Identify the normalized forcing

The coefficient of $y''$ is already $1$, so no division is needed. Therefore:

$$
R(x)=\csc x.
$$

### Step 3: Compute the Wronskian

Differentiate the selected pair:

$$
y_1'=-\sin x,
\qquad
y_2'=\cos x.
$$

Use $W=y_1y_2'-y_1'y_2$:

$$
\begin{aligned}
W
&=(\cos x)(\cos x)-(-\sin x)(\sin x) \\
&=\cos^2x+\sin^2x \\
&=1.
\end{aligned}
$$

### Step 4: Find $u_1'$

The first variation formula is:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute $y_2=\sin x$, $R=\csc x$, and $W=1$:

$$
\begin{aligned}
u_1'
&=-\frac{(\sin x)(\csc x)}{1} \\
&=-1.
\end{aligned}
$$

Integrate without adding a homogeneous constant:

$$
u_1=-x.
$$

### Step 5: Find $u_2'$

The second variation formula is:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute $y_1=\cos x$, $R=\csc x$, and $W=1$:

$$
\begin{aligned}
u_2'
&=\frac{(\cos x)(\csc x)}{1} \\
&=\frac{\cos x}{\sin x} \\
&=\cot x.
\end{aligned}
$$

On $0<x<\pi$, $\sin x>0$, so:

$$
u_2=\int \cot x\,dx=\ln(\sin x).
$$

### Step 6: Return to $y_p=u_1y_1+u_2y_2$

Restate the reconstruction formula:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute $u_1=-x$, $y_1=\cos x$, $u_2=\ln(\sin x)$, and
$y_2=\sin x$:

$$
\boxed{
y_p=-x\cos x+\sin x\ln(\sin x)
}.
$$

### Step 7: Verify the particular solution directly

Differentiate $y_p$ term by term. First:

$$
\frac{d}{dx}(-x\cos x)=-\cos x+x\sin x.
$$

For the second product:

$$
\begin{aligned}
\frac{d}{dx}[\sin x\ln(\sin x)]
&=\cos x\ln(\sin x)
+\sin x\frac{\cos x}{\sin x} \\
&=\cos x\ln(\sin x)+\cos x.
\end{aligned}
$$

Add the two derivatives. The $-\cos x$ and $+\cos x$ terms cancel:

$$
y_p'=x\sin x+\cos x\ln(\sin x).
$$

Differentiate again:

$$
\begin{aligned}
y_p''
&=\sin x+x\cos x
-\sin x\ln(\sin x)
+\frac{\cos^2x}{\sin x}.
\end{aligned}
$$

Now add $y_p$:

$$
\begin{aligned}
y_p''+y_p
&=\sin x+x\cos x-\sin x\ln(\sin x)
+\frac{\cos^2x}{\sin x} \\
&\quad -x\cos x+\sin x\ln(\sin x).
\end{aligned}
$$

Cancel the opposite terms:

$$
y_p''+y_p
=\sin x+\frac{\cos^2x}{\sin x}.
$$

Write $\sin x$ with denominator $\sin x$:

$$
\sin x=\frac{\sin^2x}{\sin x}.
$$

Therefore:

$$
\begin{aligned}
y_p''+y_p
&=\frac{\sin^2x+\cos^2x}{\sin x} \\
&=\frac{1}{\sin x} \\
&=\csc x.
\end{aligned}
$$

The particular solution is verified.

### Step 8: Write the general solution

Combine $y=y_h+y_p$:

$$
\boxed{
y=c_1\cos x+c_2\sin x-x\cos x
+\sin x\ln(\sin x),
\qquad 0<x<\pi
}.
$$

</details>

<details open>
<summary><strong>A Variable-Coefficient Equation</strong></summary>

Solve for $x>0$:

$$
x^2y''-2xy'+2y=x^3.
$$

### Step 1: Normalize the equation

The leading coefficient is $x^2$. Divide every term by $x^2$:

$$
\frac{x^2}{x^2}y''
-\frac{2x}{x^2}y'
+\frac{2}{x^2}y
=\frac{x^3}{x^2}.
$$

Simplify:

$$
y''-\frac{2}{x}y'+\frac{2}{x^2}y=x.
$$

Thus:

$$
R(x)=x.
$$

### Step 2: Solve the Euler-Cauchy homogeneous equation

The associated homogeneous equation before normalization is:

$$
x^2y''-2xy'+2y=0.
$$

Try $y=x^m$. Then:

$$
y'=mx^{m-1},
\qquad
y''=m(m-1)x^{m-2}.
$$

Substitute these expressions:

$$
x^2m(m-1)x^{m-2}
-2xmx^{m-1}
+2x^m=0.
$$

Each term contains $x^m$:

$$
[m(m-1)-2m+2]x^m=0.
$$

For $x>0$, divide by $x^m$:

$$
m(m-1)-2m+2=0.
$$

Expand and factor:

$$
\begin{aligned}
m^2-3m+2&=0, \\
(m-1)(m-2)&=0.
\end{aligned}
$$

The roots are $m=1,2$, so choose:

$$
y_1=x,
\qquad
y_2=x^2.
$$

Therefore:

$$
y_h=c_1x+c_2x^2.
$$

### Step 3: Compute the Wronskian

Differentiate:

$$
y_1'=1,
\qquad
y_2'=2x.
$$

Then:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=x(2x)-1(x^2) \\
&=2x^2-x^2 \\
&=x^2.
\end{aligned}
$$

Since $x>0$, the Wronskian is nonzero.

### Step 4: Find and integrate $u_1'$

Use:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute $y_2=x^2$, $R=x$, and $W=x^2$:

$$
\begin{aligned}
u_1'
&=-\frac{x^2\cdot x}{x^2} \\
&=-x.
\end{aligned}
$$

Integrate:

$$
u_1=-\frac{x^2}{2}.
$$

### Step 5: Find and integrate $u_2'$

Use:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute $y_1=x$, $R=x$, and $W=x^2$:

$$
\begin{aligned}
u_2'
&=\frac{x\cdot x}{x^2} \\
&=1.
\end{aligned}
$$

Integrate:

$$
u_2=x.
$$

### Step 6: Reconstruct $y_p$

Return to:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute the four current expressions:

$$
\begin{aligned}
y_p
&=\left(-\frac{x^2}{2}\right)(x)+(x)(x^2) \\
&=-\frac{x^3}{2}+x^3 \\
&=\frac{x^3}{2}.
\end{aligned}
$$

### Step 7: Verify in the original equation

For:

$$
y_p=\frac{x^3}{2},
$$

the derivatives are:

$$
y_p'=\frac{3x^2}{2},
\qquad
y_p''=3x.
$$

Substitute into the original left side:

$$
\begin{aligned}
x^2y_p''-2xy_p'+2y_p
&=x^2(3x)-2x\left(\frac{3x^2}{2}\right)
+2\left(\frac{x^3}{2}\right) \\
&=3x^3-3x^3+x^3 \\
&=x^3.
\end{aligned}
$$

This matches the original forcing.

### Step 8: Write the general solution

Combine $y_h$ and $y_p$:

$$
\boxed{
y=c_1x+c_2x^2+\frac{x^3}{2},
\qquad x>0
}.
$$

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

The method does not depend on guessing the particular solution's final form.
It depends on four reliable inputs:

1. a normalized equation
2. a fundamental homogeneous pair
3. the Wronskian
4. two integrals for the varying parameters

The reconstruction step must remain explicit:

$$
y_p=u_1y_1+u_2y_2.
$$

This formula explains exactly where every term in the particular solution
comes from.

</details>

---

## Block 5: Definite Integrals And Initial Conditions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to use definite integrals to build a particular solution anchored
at the same point as the initial conditions. This makes the roles of the forced
response and the homogeneous constants especially clear.

</details>

<details open>
<summary><strong>Anchoring The Parameters At A Base Point</strong></summary>

Choose a base point $x_0$ inside the working interval. Instead of indefinite
integrals, define:

$$
u_1(x)
=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt
$$

and:

$$
u_2(x)
=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

The letter $t$ is a dummy integration variable. The resulting quantities
$u_1(x),u_2(x)$ are functions of the upper limit $x$.

At $x=x_0$, each integral has equal limits, so:

$$
u_1(x_0)=0,
\qquad
u_2(x_0)=0.
$$

<!-- print-page-break -->

Because:

$$
y_p=u_1y_1+u_2y_2,
$$

substitution at the base point gives:

$$
\begin{aligned}
y_p(x_0)
&=u_1(x_0)y_1(x_0)+u_2(x_0)y_2(x_0) \\
&=0.
\end{aligned}
$$

Under the auxiliary condition, the first derivative is:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

Therefore:

$$
\begin{aligned}
y_p'(x_0)
&=u_1(x_0)y_1'(x_0)+u_2(x_0)y_2'(x_0) \\
&=0.
\end{aligned}
$$

Thus the anchored particular solution satisfies:

$$
\boxed{y_p(x_0)=0,\qquad y_p'(x_0)=0}.
$$

This does not mean every particular solution has zero initial data. It means
the chosen lower limits construct one convenient particular solution with that
property.

</details>

<details open>
<summary><strong>A Forced Initial-Value Problem</strong></summary>

Solve on $-\pi/2<x<\pi/2$:

$$
y''+y=2\sec x,
$$

subject to:

$$
y(0)=3,
\qquad
y'(0)=-1.
$$

### Step 1: Find a fundamental homogeneous pair

The associated homogeneous equation is:

$$
y''+y=0.
$$

Choose:

$$
y_1=\cos x,
\qquad
y_2=\sin x.
$$

Their Wronskian was calculated in Block 4:

$$
W=1.
$$

The homogeneous solution is:

$$
y_h=c_1\cos x+c_2\sin x.
$$

### Step 2: Build $u_1$ with lower limit $0$

The normalized forcing is:

$$
R(x)=2\sec x.
$$

Use the definite-integral formula:

$$
u_1(x)
=-\int_0^x\frac{y_2(t)R(t)}{W(t)}\,dt.
$$

Substitute $y_2(t)=\sin t$, $R(t)=2\sec t$, and $W(t)=1$:

$$
\begin{aligned}
u_1(x)
&=-\int_0^x 2\sin t\sec t\,dt \\
&=-2\int_0^x \tan t\,dt.
\end{aligned}
$$

On the chosen interval, $\cos t>0$, and:

$$
\int \tan t\,dt=-\ln(\cos t).
$$

Apply the limits:

$$
\begin{aligned}
u_1(x)
&=-2[-\ln(\cos t)]_0^x \\
&=2[\ln(\cos t)]_0^x \\
&=2\ln(\cos x)-2\ln(1) \\
&=2\ln(\cos x).
\end{aligned}
$$

### Step 3: Build $u_2$ with lower limit $0$

Use:

$$
u_2(x)
=\int_0^x\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

Substitute $y_1(t)=\cos t$, $R(t)=2\sec t$, and $W(t)=1$:

$$
\begin{aligned}
u_2(x)
&=\int_0^x 2\cos t\sec t\,dt \\
&=\int_0^x 2\,dt \\
&=[2t]_0^x \\
&=2x.
\end{aligned}
$$

### Step 4: Reconstruct the anchored particular solution

Return to:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute the four current functions:

$$
\boxed{
y_p=2\cos x\ln(\cos x)+2x\sin x
}.
$$

At the base point $x=0$:

$$
\begin{aligned}
y_p(0)
&=2\cos(0)\ln(\cos 0)+2(0)\sin(0) \\
&=2(1)\ln(1)+0 \\
&=0.
\end{aligned}
$$

### Step 5: Differentiate the particular solution locally

The auxiliary condition gives the shorter derivative formula:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

Here:

$$
y_1'=-\sin x,
\qquad
y_2'=\cos x.
$$

Substitute $u_1=2\ln(\cos x)$ and $u_2=2x$:

$$
y_p'
=-2\sin x\ln(\cos x)+2x\cos x.
$$

Evaluate at $x=0$:

$$
\begin{aligned}
y_p'(0)
&=-2\sin(0)\ln(1)+2(0)\cos(0) \\
&=0.
\end{aligned}
$$

### Step 6: Write the complete solution before applying the conditions

Use $y=y_h+y_p$:

$$
y=c_1\cos x+c_2\sin x
+2\cos x\ln(\cos x)+2x\sin x.
$$

### Step 7: Apply $y(0)=3$

Substitute $x=0$ into the complete solution:

$$
\begin{aligned}
3
&=c_1\cos(0)+c_2\sin(0)+y_p(0) \\
&=c_1(1)+c_2(0)+0 \\
&=c_1.
\end{aligned}
$$

Therefore:

$$
c_1=3.
$$

### Step 8: Apply $y'(0)=-1$

Differentiate the complete solution:

$$
y'=-c_1\sin x+c_2\cos x+y_p'.
$$

Substitute $x=0$ and $y_p'(0)=0$:

$$
\begin{aligned}
-1
&=-c_1\sin(0)+c_2\cos(0)+y_p'(0) \\
&=0+c_2+0.
\end{aligned}
$$

Thus:

$$
c_2=-1.
$$

### Step 9: Write the selected solution

Substitute $c_1=3$ and $c_2=-1$ into the complete solution:

$$
\boxed{
y=3\cos x-\sin x
+2\cos x\ln(\cos x)+2x\sin x,
\quad -\frac{\pi}{2}<x<\frac{\pi}{2}
}.
$$

</details>

<details open>
<summary><strong>Why The Base Point Must Belong To The Interval</strong></summary>

The lower limit $x_0$ must lie inside an interval where the integrands are
continuous.

For the equation:

$$
y''+y=\csc x,
$$

the forcing is undefined at $x=0$. Therefore an integral beginning at $0$ is
not valid for a solution on $(0,\pi)$. A base point such as $x_0=\pi/2$ would
be appropriate on that interval.

The choice of lower limit is mathematical, not cosmetic. It fixes a particular
solution and must respect the equation's domain.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Definite integrals anchored at $x_0$ produce:

$$
u_1(x)
=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt,
\qquad
u_2(x)
=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

The resulting particular solution satisfies:

$$
y_p(x_0)=0,
\qquad
y_p'(x_0)=0.
$$

This allows initial data at $x_0$ to determine the homogeneous constants
directly.

</details>

---

## Block 6: First-Order And Higher-Order Versions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see that variation of parameters is not restricted to
second-order equations. The same principle works for a single homogeneous mode
at first order and for an entire fundamental set at higher order.

</details>

<details open>
<summary><strong>First Order: Variation Of A Single Constant</strong></summary>

Consider the normalized first-order equation:

$$
y'+P(x)y=R(x).
$$

Let $y_1$ be a nonzero solution of the associated homogeneous equation:

$$
y_1'+Py_1=0.
$$

The homogeneous family is:

$$
y_h=cy_1.
$$

Vary the single constant by proposing:

$$
y_p=u(x)y_1(x).
$$

Differentiate with the product rule:

$$
y_p'=u'y_1+uy_1'.
$$

Substitute $y_p$ and $y_p'$ into the normalized equation:

$$
u'y_1+uy_1'+Puy_1=R.
$$

Group the terms multiplying $u$:

$$
u'y_1+u(y_1'+Py_1)=R.
$$

Since $y_1$ is homogeneous:

$$
y_1'+Py_1=0.
$$

Substitute this zero value:

$$
u'y_1=R.
$$

Divide by the nonzero homogeneous solution $y_1$:

$$
\boxed{u'=\frac{R}{y_1}}.
$$

Then:

$$
u=\int\frac{R}{y_1}\,dx,
\qquad
y_p=uy_1.
$$

This is the same mechanism that appears in the integrating-factor method,
expressed through the homogeneous solution.

</details>

<details open>
<summary><strong>A First-Order Worked Example</strong></summary>

Solve for $x>0$:

$$
y'+\frac{2}{x}y=x^2.
$$

### Step 1: Find the homogeneous solution

The associated homogeneous equation is:

$$
y'+\frac{2}{x}y=0.
$$

Separate variables:

$$
\frac{dy}{dx}=-\frac{2}{x}y.
$$

For a nonzero homogeneous solution, divide by $y$ and multiply by $dx$:

$$
\frac{1}{y}\,dy=-\frac{2}{x}\,dx.
$$

Integrate:

$$
\ln|y|=-2\ln x+C.
$$

One convenient nonzero homogeneous solution is:

$$
y_1=x^{-2}.
$$

Therefore:

$$
y_h=cx^{-2}.
$$

### Step 2: Vary the constant

Set:

$$
y_p=uy_1=ux^{-2}.
$$

The first-order variation formula is:

$$
u'=\frac{R}{y_1}.
$$

Here $R=x^2$ and $y_1=x^{-2}$, so:

$$
\begin{aligned}
u'
&=\frac{x^2}{x^{-2}} \\
&=x^{2-(-2)} \\
&=x^4.
\end{aligned}
$$

Integrate:

$$
u=\frac{x^5}{5}.
$$

### Step 3: Reconstruct the particular solution

Return to $y_p=uy_1$:

$$
\begin{aligned}
y_p
&=\left(\frac{x^5}{5}\right)x^{-2} \\
&=\frac{x^3}{5}.
\end{aligned}
$$

### Step 4: Write the general solution

Combine the homogeneous and particular parts:

$$
\boxed{
y=\frac{c}{x^2}+\frac{x^3}{5},
\qquad x>0
}.
$$

</details>

<details open>
<summary><strong>The Higher-Order System</strong></summary>

Consider an $n$th-order linear equation in standard form:

$$
y^{(n)}+a_{n-1}(x)y^{(n-1)}+\cdots+a_1(x)y'+a_0(x)y=R(x).
$$

Suppose $y_1,\ldots,y_n$ form a fundamental set for the associated homogeneous
equation. Then:

$$
y_h=c_1y_1+\cdots+c_ny_n.
$$

Vary all $n$ constants:

$$
y_p=u_1y_1+\cdots+u_ny_n.
$$

To avoid higher derivatives of the unknown parameters, impose $n-1$
auxiliary conditions:

$$
\begin{aligned}
u_1'y_1+u_2'y_2+\cdots+u_n'y_n&=0, \\
u_1'y_1'+u_2'y_2'+\cdots+u_n'y_n'&=0, \\
&\ \vdots \\
u_1'y_1^{(n-2)}+\cdots+u_n'y_n^{(n-2)}&=0.
\end{aligned}
$$

Substitution into the original equation supplies the final relation:

$$
u_1'y_1^{(n-1)}+\cdots+u_n'y_n^{(n-1)}=R.
$$

Together these form the Wronskian system:

$$
\boxed{
\begin{bmatrix}
y_1 & y_2 & \cdots & y_n \\
y_1' & y_2' & \cdots & y_n' \\
\vdots & \vdots & \ddots & \vdots \\
y_1^{(n-1)} & y_2^{(n-1)} & \cdots & y_n^{(n-1)}
\end{bmatrix}
\begin{bmatrix}
u_1' \\
u_2' \\
\vdots \\
u_n'
\end{bmatrix}
=
\begin{bmatrix}
0 \\
0 \\
\vdots \\
R
\end{bmatrix}
}.
$$

The determinant of the coefficient matrix is the $n$-function Wronskian. It is
nonzero for a fundamental set on the working interval, so the system can be
solved for $u_1',\ldots,u_n'$.

</details>

<details open>
<summary><strong>A Third-Order Worked Example</strong></summary>

Solve:

$$
y'''-y'=6x.
$$

This problem could be solved more quickly by a simpler method. It is used here
because its third-order variation system can be solved transparently.

### Step 1: Find a fundamental homogeneous set

The associated homogeneous equation is:

$$
y'''-y'=0.
$$

Its characteristic equation is:

$$
r^3-r=0.
$$

Factor:

$$
r(r-1)(r+1)=0.
$$

The roots are $0,1,-1$, so choose:

$$
y_1=1,
\qquad
y_2=e^x,
\qquad
y_3=e^{-x}.
$$

Therefore:

$$
y_h=c_1+c_2e^x+c_3e^{-x}.
$$

### Step 2: Write the three-equation variation system

For a third-order equation, use two auxiliary equations and one forcing
equation:

$$
\begin{aligned}
y_1u_1'+y_2u_2'+y_3u_3'&=0, \\
y_1'u_1'+y_2'u_2'+y_3'u_3'&=0, \\
y_1''u_1'+y_2''u_2'+y_3''u_3'&=R.
\end{aligned}
$$

The required derivatives are:

$$
\begin{array}{c|ccc}
&y_1&y_2&y_3\\
\hline
\text{function}&1&e^x&e^{-x}\\
\text{first derivative}&0&e^x&-e^{-x}\\
\text{second derivative}&0&e^x&e^{-x}
\end{array}
$$

Here $R=6x$. Substitute the table into the system:

$$
\begin{aligned}
u_1'+e^xu_2'+e^{-x}u_3'&=0, \\
e^xu_2'-e^{-x}u_3'&=0, \\
e^xu_2'+e^{-x}u_3'&=6x.
\end{aligned}
$$

### Step 3: Solve for $u_2'$ and $u_3'$

From the second equation:

$$
e^xu_2'=e^{-x}u_3'.
$$

The two terms on the left of the third equation are therefore equal. Let their
common value be $q$:

$$
e^xu_2'=q,
\qquad
e^{-x}u_3'=q.
$$

Substitute these into the third equation:

$$
q+q=6x.
$$

Combine the left side:

$$
2q=6x.
$$

Divide by $2$:

$$
q=3x.
$$

Therefore:

$$
e^xu_2'=3x.
$$

Multiply both sides by $e^{-x}$:

$$
u_2'=3xe^{-x}.
$$

Similarly:

$$
e^{-x}u_3'=3x.
$$

Multiply both sides by $e^x$:

$$
u_3'=3xe^x.
$$

### Step 4: Solve for $u_1'$

Return to the first system equation:

$$
u_1'+e^xu_2'+e^{-x}u_3'=0.
$$

The previous step found:

$$
e^xu_2'=3x,
\qquad
e^{-x}u_3'=3x.
$$

Substitute both values:

$$
u_1'+3x+3x=0.
$$

Combine the two $x$-terms:

$$
u_1'+6x=0.
$$

Subtract $6x$ from both sides:

$$
u_1'=-6x.
$$

### Step 5: Integrate the three parameter derivatives

For $u_1$:

$$
u_1=\int -6x\,dx=-3x^2.
$$

For $u_2$, use integration by parts:

$$
u_2=3\int xe^{-x}\,dx.
$$

Choose:

$$
U=x,
\qquad
dV=e^{-x}\,dx.
$$

Then:

$$
dU=dx,
\qquad
V=-e^{-x}.
$$

Apply $\int U\,dV=UV-\int V\,dU$:

$$
\begin{aligned}
u_2
&=3\left[-xe^{-x}+\int e^{-x}\,dx\right] \\
&=3[-xe^{-x}-e^{-x}] \\
&=-3(x+1)e^{-x}.
\end{aligned}
$$

For $u_3$:

$$
u_3=3\int xe^x\,dx.
$$

Integration by parts gives:

$$
\begin{aligned}
u_3
&=3\left[xe^x-\int e^x\,dx\right] \\
&=3(x-1)e^x.
\end{aligned}
$$

### Step 6: Reconstruct $y_p$

For third order, the reconstruction formula is:

$$
y_p=u_1y_1+u_2y_2+u_3y_3.
$$

Substitute every current expression:

$$
\begin{aligned}
y_p
&=(-3x^2)(1)
+[-3(x+1)e^{-x}]e^x
+[3(x-1)e^x]e^{-x}.
\end{aligned}
$$

Use $e^{-x}e^x=1$ and $e^xe^{-x}=1$:

$$
\begin{aligned}
y_p
&=-3x^2-3(x+1)+3(x-1) \\
&=-3x^2-3x-3+3x-3 \\
&=-3x^2-6.
\end{aligned}
$$

The constant $-6$ is a homogeneous solution because constants are multiples of
$y_1=1$. It can be absorbed into $c_1$. A simpler representative is therefore:

$$
y_p=-3x^2.
$$

### Step 7: Verify and write the general solution

For $y_p=-3x^2$:

$$
y_p'=-6x,
\qquad
y_p'''=0.
$$

Substitute into the differential operator:

$$
\begin{aligned}
y_p'''-y_p'
&=0-(-6x) \\
&=6x.
\end{aligned}
$$

The forcing is reproduced. Hence:

$$
\boxed{
y=c_1+c_2e^x+c_3e^{-x}-3x^2
}.
$$

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

At first order, one constant is varied:

$$
y_p=uy_1,
\qquad
u'=\frac{R}{y_1}.
$$

At order $n$, all $n$ homogeneous coefficients are varied. The first $n-1$
rows of the Wronskian system have right side zero, and the final row has right
side $R$.

The pattern is the same at every order:

> start with a fundamental homogeneous set, solve for the derivatives of the
> varying coefficients, integrate, and reconstruct the particular solution.

</details>

---

## Block 7: Workflow, Method Choice, And Common Mistakes

<details open>
<summary><strong>The Complete Second-Order Workflow</strong></summary>

### Step 1: Choose a valid interval

Identify zeros of the leading coefficient, singular forcing terms, and any
domain restrictions.

### Step 2: Normalize the equation

Rewrite the problem as:

$$
y''+Py'+Qy=R.
$$

### Step 3: Find a fundamental homogeneous pair

Solve the associated homogeneous equation and select an ordered pair
$y_1,y_2$.

### Step 4: Compute the Wronskian

Use:

$$
W=y_1y_2'-y_1'y_2.
$$

Confirm that $W\ne 0$ on the working interval.

### Step 5: Find $u_1'$ and $u_2'$

Use the normalized forcing $R$:

$$
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}.
$$

### Step 6: Integrate separately

Calculate $u_1$ and $u_2$. State substitutions, integration by parts, or
trigonometric identities used in either integral.

### Step 7: Reconstruct $y_p$

Restate and use:

$$
y_p=u_1y_1+u_2y_2.
$$

### Step 8: Simplify only after reconstruction

Opposite homogeneous terms may cancel, or a homogeneous term may be absorbed
into $y_h$.

### Step 9: Form the general solution

Write:

$$
y=y_h+y_p.
$$

### Step 10: Verify and apply extra conditions

Check the particular solution in the original equation. Apply initial or
boundary conditions to the complete solution, not to $y_p$ alone.

</details>

<details open>
<summary><strong>Choosing Between The Two Particular-Solution Methods</strong></summary>

Use **undetermined coefficients** when:

- the equation has constant coefficients
- the forcing belongs to a standard finite derivative-closed family
- a short trial can be written immediately

Use **variation of parameters** when:

- a fundamental homogeneous set is known
- the equation has variable coefficients
- the forcing has no standard undetermined-coefficients trial
- a systematic integral representation is more valuable than a guessed form

If both methods apply, undetermined coefficients is often shorter. Variation
of parameters remains valid, but it may create integrals that later simplify
back to the same elementary trial.

</details>

<details open>
<summary><strong>When The Integrals Do Not Simplify</strong></summary>

Variation of parameters can be mathematically successful even when an
antiderivative cannot be written with elementary functions.

For example, the method might produce:

$$
u_2(x)=\int \frac{e^{x^2}}{1+x^2}\,dx.
$$

If no elementary antiderivative is available, the integral expression itself
still defines a particular solution on a suitable interval.

Depending on the problem, one may:

- leave the answer in integral form
- express it using a named special function
- approximate the integral numerically

The method has not failed merely because the final integral is not elementary.

</details>

<details open>
<summary><strong>Common Mistake: Using The Unnormalized Forcing</strong></summary>

For:

$$
a(x)y''+b(x)y'+c(x)y=g(x),
$$

the standard-form forcing is:

$$
R=\frac{g}{a}.
$$

Using $g$ directly in:

$$
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}
$$

introduces a missing factor of $1/a(x)$. Divide the entire equation first and
write $R$ explicitly before calculating the Wronskian formulas.

</details>

<details open>
<summary><strong>Common Mistake: Treating The Auxiliary Condition As A Given Law</strong></summary>

The relation:

$$
u_1'y_1+u_2'y_2=0
$$

is not an additional physical condition and is not copied from the original
equation. It is a convenient representation choice that removes $u_1''$ and
$u_2''$ from the calculation.

Its role should be explained whenever the method is derived, because otherwise
the second system equation appears to come from nowhere.

</details>

<details open>
<summary><strong>Common Mistake: Losing The Wronskian Sign</strong></summary>

With the ordered pair $(y_1,y_2)$:

$$
W=y_1y_2'-y_1'y_2.
$$

The matching formulas are:

$$
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}.
$$

Write all three formulas together before substitution. Memorizing one minus
sign without recording the order of $y_1,y_2$ is unreliable.

</details>

<details open>
<summary><strong>Common Mistake: Adding Integration Constants Twice</strong></summary>

If:

$$
u_1=U_1+k_1,
\qquad
u_2=U_2+k_2,
$$

then reconstruction gives:

$$
\begin{aligned}
y_p
&=(U_1+k_1)y_1+(U_2+k_2)y_2 \\
&=U_1y_1+U_2y_2+k_1y_1+k_2y_2.
\end{aligned}
$$

The last two terms are homogeneous. They duplicate the arbitrary constants in
$y_h$. Omit integration constants while constructing one $y_p$.

</details>

<details open>
<summary><strong>Common Mistake: Forgetting To Return To $y_p$</strong></summary>

Finding $u_1$ and $u_2$ does not complete the method. They are coefficient
functions, not the particular solution.

Always restate:

$$
y_p=u_1y_1+u_2y_2
$$

and substitute all four functions. This prevents $u_1$ or $u_2$ from being
reported incorrectly as the answer.

</details>

<details open>
<summary><strong>Common Mistake: Applying Conditions To The Wrong Function</strong></summary>

Initial conditions belong to the complete solution:

$$
y=y_h+y_p.
$$

Unless a definite-integral construction has deliberately made
$y_p(x_0)=y_p'(x_0)=0$, both the homogeneous and particular parts contribute to
the initial values.

Write the full solution and its required derivatives before substituting any
condition.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The method is reliable when its decisions occur in the correct order:

1. choose the interval
2. normalize
3. solve the homogeneous problem
4. compute the Wronskian
5. solve for the parameter derivatives
6. integrate
7. reconstruct $y_p$
8. attach $y_h$, verify, and apply conditions

Variation of parameters is broader than undetermined coefficients, but broader
does not always mean shorter.

</details>

---

## Block 8: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Normalize Before Using The Formulas

For $x>0$, rewrite the equation in standard form and identify $P,Q,R$:

$$
3x^2y''+6xy'-9y=\frac{x^5}{1+x}.
$$

### Problem 2: Compute A Wronskian

For $x>0$, calculate $W(y_1,y_2)$ for:

$$
y_1=x^{-1},
\qquad
y_2=x^2.
$$

State what the result says about linear independence.

### Problem 3: Find The Parameter Derivatives

A standard-form equation has:

$$
y_1=e^x,
\qquad
y_2=e^{-x},
\qquad
R(x)=\frac{1}{1+x^2}.
$$

Calculate $W,u_1'$, and $u_2'$. Do not evaluate the resulting integrals.

### Problem 4: Explain The Anchored Initial Values

Suppose:

$$
u_1(x)=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt,
\qquad
u_2(x)=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

Show that the reconstructed particular solution satisfies:

$$
y_p(x_0)=0,
\qquad
y_p'(x_0)=0.
$$

### Problem 5: Vary One Parameter At First Order

Solve:

$$
y'-3y=e^{2x}
$$

by varying the constant in a homogeneous solution.

### Problem 6: Build A Third-Order System

A third-order standard-form equation has the fundamental set:

$$
y_1=1,
\qquad
y_2=x,
\qquad
y_3=e^x,
$$

and normalized forcing:

$$
R(x)=\ln x,
\qquad x>0.
$$

Write the three equations for $u_1',u_2',u_3'$. Do not solve them.

### Problem 7: Solve A Constant-Coefficient Equation

Use variation of parameters to solve:

$$
y''-4y=8e^x.
$$

### Problem 8: Solve A Nonstandard Trigonometric Forcing

Use variation of parameters to solve on $-\pi/2<x<\pi/2$:

$$
y''+y=\tan x.
$$

### Problem 9: Solve A Repeated-Root Euler Equation

Use variation of parameters to solve for $x>0$:

$$
x^2y''-xy'+y=x^2.
$$

### Problem 10: Solve An Initial-Value Problem

Use definite integrals based at $x_0=0$ to solve:

$$
y''+4y=4\sec(2x),
$$

subject to:

$$
y(0)=2,
\qquad
y'(0)=-1,
$$

on $-\pi/4<x<\pi/4$.

### Problem 11: Solve A Third-Order Equation

Use variation of parameters to solve:

$$
y'''-4y'=8.
$$

### Problem 12: Choose And Diagnose The Method

For each equation, state whether variation of parameters applies and whether
undetermined coefficients would be the more efficient method.

**(a)**

$$
y''+y=xe^x
$$

**(b)**

$$
x^2y''+xy'+y=\ln x,
\qquad x>0
$$

**(c)**

$$
y''+y=e^{x^2}
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 1 To 6</strong></summary>

### Answer 1

Normalize:

$$
3x^2y''+6xy'-9y=\frac{x^5}{1+x},
\qquad x>0.
$$

The leading coefficient is $3x^2$. Divide every term by $3x^2$:

$$
\frac{3x^2}{3x^2}y''
+\frac{6x}{3x^2}y'
-\frac{9}{3x^2}y
=\frac{x^5}{3x^2(1+x)}.
$$

Simplify the four coefficients:

$$
y''+\frac{2}{x}y'-\frac{3}{x^2}y
=\frac{x^3}{3(1+x)}.
$$

Comparing with $y''+Py'+Qy=R$ gives:

$$
\boxed{
P(x)=\frac{2}{x},
\qquad
Q(x)=-\frac{3}{x^2},
\qquad
R(x)=\frac{x^3}{3(1+x)}
}.
$$

### Answer 2

The functions are:

$$
y_1=x^{-1},
\qquad
y_2=x^2.
$$

Differentiate:

$$
y_1'=-x^{-2},
\qquad
y_2'=2x.
$$

Use:

$$
W=y_1y_2'-y_1'y_2.
$$

Substitute the four expressions:

$$
\begin{aligned}
W
&=(x^{-1})(2x)-(-x^{-2})(x^2) \\
&=2-(-1) \\
&=3.
\end{aligned}
$$

Since $W=3\ne 0$, the two functions are linearly independent on $x>0$.

### Answer 3

The ordered pair and forcing are:

$$
y_1=e^x,
\qquad
y_2=e^{-x},
\qquad
R=\frac{1}{1+x^2}.
$$

Differentiate the pair:

$$
y_1'=e^x,
\qquad
y_2'=-e^{-x}.
$$

Compute the Wronskian:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=e^x(-e^{-x})-e^x(e^{-x}) \\
&=-1-1 \\
&=-2.
\end{aligned}
$$

For the first parameter derivative, use:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute $y_2=e^{-x}$, $R=1/(1+x^2)$, and $W=-2$:

$$
\begin{aligned}
u_1'
&=-\frac{e^{-x}/(1+x^2)}{-2} \\
&=\frac{e^{-x}}{2(1+x^2)}.
\end{aligned}
$$

For the second parameter derivative, use:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute $y_1=e^x$, $R=1/(1+x^2)$, and $W=-2$:

$$
\begin{aligned}
u_2'
&=\frac{e^x/(1+x^2)}{-2} \\
&=-\frac{e^x}{2(1+x^2)}.
\end{aligned}
$$

Therefore:

$$
\boxed{
u_1'=\frac{e^{-x}}{2(1+x^2)},
\qquad
u_2'=-\frac{e^x}{2(1+x^2)}
}.
$$

### Answer 4

The anchored parameters are:

$$
u_1(x)=-\int_{x_0}^{x}\frac{y_2(t)R(t)}{W(t)}\,dt,
\qquad
u_2(x)=\int_{x_0}^{x}\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

At $x=x_0$, both integrals have the same upper and lower limit:

$$
u_1(x_0)=0,
\qquad
u_2(x_0)=0.
$$

Use the reconstruction formula:

$$
y_p=u_1y_1+u_2y_2.
$$

Evaluate at $x_0$:

$$
\begin{aligned}
y_p(x_0)
&=u_1(x_0)y_1(x_0)+u_2(x_0)y_2(x_0) \\
&=0+0 \\
&=0.
\end{aligned}
$$

Under the auxiliary condition:

$$
y_p'=u_1y_1'+u_2y_2'.
$$

Evaluate this derivative at $x_0$:

$$
\begin{aligned}
y_p'(x_0)
&=u_1(x_0)y_1'(x_0)+u_2(x_0)y_2'(x_0) \\
&=0+0 \\
&=0.
\end{aligned}
$$

Hence:

$$
\boxed{y_p(x_0)=0,\qquad y_p'(x_0)=0}.
$$

### Answer 5

Solve:

$$
y'-3y=e^{2x}.
$$

The associated homogeneous equation is:

$$
y'-3y=0.
$$

One nonzero homogeneous solution is:

$$
y_1=e^{3x}.
$$

Therefore:

$$
y_h=ce^{3x}.
$$

Set:

$$
y_p=uy_1=ue^{3x}.
$$

For a normalized first-order equation, the variation formula is:

$$
u'=\frac{R}{y_1}.
$$

Here $R=e^{2x}$ and $y_1=e^{3x}$, so:

$$
\begin{aligned}
u'
&=\frac{e^{2x}}{e^{3x}} \\
&=e^{-x}.
\end{aligned}
$$

Integrate:

$$
u=-e^{-x}.
$$

Return to $y_p=uy_1$:

$$
\begin{aligned}
y_p
&=(-e^{-x})e^{3x} \\
&=-e^{2x}.
\end{aligned}
$$

Thus:

$$
\boxed{y=ce^{3x}-e^{2x}}.
$$

### Answer 6

The fundamental set and forcing are:

$$
y_1=1,
\qquad
y_2=x,
\qquad
y_3=e^x,
\qquad
R=\ln x.
$$

For third order, use:

$$
\begin{aligned}
y_1u_1'+y_2u_2'+y_3u_3'&=0, \\
y_1'u_1'+y_2'u_2'+y_3'u_3'&=0, \\
y_1''u_1'+y_2''u_2'+y_3''u_3'&=R.
\end{aligned}
$$

The first derivatives are:

$$
y_1'=0,
\qquad
y_2'=1,
\qquad
y_3'=e^x.
$$

The second derivatives are:

$$
y_1''=0,
\qquad
y_2''=0,
\qquad
y_3''=e^x.
$$

Substitute these values and $R=\ln x$ into the three equations:

$$
\boxed{
\begin{aligned}
u_1'+xu_2'+e^xu_3'&=0, \\
u_2'+e^xu_3'&=0, \\
e^xu_3'&=\ln x.
\end{aligned}
}
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 7 To 9</strong></summary>

### Answer 7

Solve by variation of parameters:

$$
y''-4y=8e^x.
$$

The associated homogeneous characteristic equation is:

$$
r^2-4=0.
$$

Factor:

$$
(r-2)(r+2)=0.
$$

Choose the ordered fundamental pair:

$$
y_1=e^{2x},
\qquad
y_2=e^{-2x}.
$$

Thus:

$$
y_h=c_1e^{2x}+c_2e^{-2x}.
$$

Differentiate:

$$
y_1'=2e^{2x},
\qquad
y_2'=-2e^{-2x}.
$$

Compute the Wronskian:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=e^{2x}(-2e^{-2x})-(2e^{2x})e^{-2x} \\
&=-2-2 \\
&=-4.
\end{aligned}
$$

The normalized forcing is:

$$
R=8e^x.
$$

Use the first formula:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute:

$$
\begin{aligned}
u_1'
&=-\frac{e^{-2x}(8e^x)}{-4} \\
&=2e^{-x}.
\end{aligned}
$$

Integrate:

$$
u_1=-2e^{-x}.
$$

Use the second formula:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute:

$$
\begin{aligned}
u_2'
&=\frac{e^{2x}(8e^x)}{-4} \\
&=-2e^{3x}.
\end{aligned}
$$

Integrate:

$$
u_2=-\frac{2}{3}e^{3x}.
$$

Return to:

$$
y_p=u_1y_1+u_2y_2.
$$

Substitute all four functions:

$$
\begin{aligned}
y_p
&=(-2e^{-x})e^{2x}
+\left(-\frac{2}{3}e^{3x}\right)e^{-2x} \\
&=-2e^x-\frac{2}{3}e^x \\
&=-\frac{8}{3}e^x.
\end{aligned}
$$

Therefore:

$$
\boxed{
y=c_1e^{2x}+c_2e^{-2x}-\frac{8}{3}e^x
}.
$$

### Answer 8

Solve on $-\pi/2<x<\pi/2$:

$$
y''+y=\tan x.
$$

The associated homogeneous equation has the fundamental pair:

$$
y_1=\cos x,
\qquad
y_2=\sin x.
$$

Therefore:

$$
y_h=c_1\cos x+c_2\sin x.
$$

The Wronskian is:

$$
W=1.
$$

The normalized forcing is:

$$
R=\tan x.
$$

Use:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute:

$$
\begin{aligned}
u_1'
&=-\sin x\tan x \\
&=-\frac{\sin^2x}{\cos x}.
\end{aligned}
$$

Use $\sin^2x=1-\cos^2x$:

$$
\begin{aligned}
u_1'
&=-\frac{1-\cos^2x}{\cos x} \\
&=-\sec x+\cos x.
\end{aligned}
$$

Integrate:

$$
u_1=-\ln|\sec x+\tan x|+\sin x.
$$

Now use:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute:

$$
\begin{aligned}
u_2'
&=\cos x\tan x \\
&=\sin x.
\end{aligned}
$$

Integrate:

$$
u_2=-\cos x.
$$

Reconstruct the particular solution:

$$
\begin{aligned}
y_p
&=u_1y_1+u_2y_2 \\
&=[-\ln|\sec x+\tan x|+\sin x]\cos x
-\cos x\sin x.
\end{aligned}
$$

The two $\sin x\cos x$ terms cancel:

$$
y_p=-\cos x\ln|\sec x+\tan x|.
$$

To verify, let:

$$
h(x)=\ln|\sec x+\tan x|.
$$

On the chosen interval:

$$
h'(x)=\sec x.
$$

Since $y_p=-\cos x\,h$:

$$
\begin{aligned}
y_p'
&=\sin x\,h-\cos x\,h' \\
&=\sin x\,h-1.
\end{aligned}
$$

Differentiate once more:

$$
y_p''=\cos x\,h+\sin x\sec x.
$$

Add $y_p=-\cos x\,h$:

$$
\begin{aligned}
y_p''+y_p
&=\cos x\,h+\sin x\sec x-\cos x\,h \\
&=\sin x\sec x \\
&=\tan x.
\end{aligned}
$$

Therefore:

$$
\boxed{
y=c_1\cos x+c_2\sin x
-\cos x\ln|\sec x+\tan x|
}.
$$

### Answer 9

Solve for $x>0$:

$$
x^2y''-xy'+y=x^2.
$$

Normalize by dividing every term by $x^2$:

$$
y''-\frac{1}{x}y'+\frac{1}{x^2}y=1.
$$

Thus:

$$
R=1.
$$

For the homogeneous Euler equation, try $y=x^m$. Substitution gives:

$$
m(m-1)-m+1=0.
$$

Expand:

$$
m^2-2m+1=0.
$$

Factor:

$$
(m-1)^2=0.
$$

The repeated root is $m=1$, so choose:

$$
y_1=x,
\qquad
y_2=x\ln x.
$$

Therefore:

$$
y_h=c_1x+c_2x\ln x.
$$

Differentiate the fundamental pair:

$$
y_1'=1,
\qquad
y_2'=\ln x+1.
$$

Compute the Wronskian:

$$
\begin{aligned}
W
&=x(\ln x+1)-1(x\ln x) \\
&=x\ln x+x-x\ln x \\
&=x.
\end{aligned}
$$

Use:

$$
u_1'=-\frac{y_2R}{W}.
$$

Substitute $y_2=x\ln x$, $R=1$, and $W=x$:

$$
u_1'=-\ln x.
$$

Integrate by parts:

$$
u_1=-x\ln x+x.
$$

For the second parameter:

$$
u_2'=\frac{y_1R}{W}.
$$

Substitute $y_1=x$, $R=1$, and $W=x$:

$$
u_2'=1.
$$

Integrate:

$$
u_2=x.
$$

Reconstruct:

$$
\begin{aligned}
y_p
&=u_1y_1+u_2y_2 \\
&=(-x\ln x+x)x+x(x\ln x) \\
&=-x^2\ln x+x^2+x^2\ln x \\
&=x^2.
\end{aligned}
$$

Therefore:

$$
\boxed{
y=c_1x+c_2x\ln x+x^2,
\qquad x>0
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 10 To 12</strong></summary>

### Answer 10

Solve on $-\pi/4<x<\pi/4$:

$$
y''+4y=4\sec(2x),
$$

with:

$$
y(0)=2,
\qquad
y'(0)=-1.
$$

The associated homogeneous equation is:

$$
y''+4y=0.
$$

Choose:

$$
y_1=\cos(2x),
\qquad
y_2=\sin(2x).
$$

Thus:

$$
y_h=c_1\cos(2x)+c_2\sin(2x).
$$

Differentiate:

$$
y_1'=-2\sin(2x),
\qquad
y_2'=2\cos(2x).
$$

Compute the Wronskian:

$$
\begin{aligned}
W
&=y_1y_2'-y_1'y_2 \\
&=2\cos^2(2x)+2\sin^2(2x) \\
&=2.
\end{aligned}
$$

Use lower limit $0$. For $u_1$:

$$
u_1(x)
=-\int_0^x\frac{y_2(t)R(t)}{W(t)}\,dt.
$$

Substitute $y_2(t)=\sin(2t)$, $R(t)=4\sec(2t)$, and $W=2$:

$$
\begin{aligned}
u_1(x)
&=-\int_0^x\frac{4\sin(2t)\sec(2t)}{2}\,dt \\
&=-2\int_0^x\tan(2t)\,dt.
\end{aligned}
$$

Since:

$$
\int \tan(2t)\,dt=-\frac12\ln(\cos(2t)),
$$

we obtain:

$$
\begin{aligned}
u_1(x)
&=-2\left[-\frac12\ln(\cos(2t))\right]_0^x \\
&=[\ln(\cos(2t))]_0^x \\
&=\ln(\cos(2x)).
\end{aligned}
$$

For $u_2$:

$$
u_2(x)
=\int_0^x\frac{y_1(t)R(t)}{W(t)}\,dt.
$$

Substitute:

$$
\begin{aligned}
u_2(x)
&=\int_0^x\frac{4\cos(2t)\sec(2t)}{2}\,dt \\
&=\int_0^x2\,dt \\
&=2x.
\end{aligned}
$$

Reconstruct the anchored particular solution:

$$
\boxed{
y_p=\cos(2x)\ln(\cos(2x))+2x\sin(2x)
}.
$$

The definite limits guarantee:

$$
y_p(0)=0,
\qquad
y_p'(0)=0.
$$

Write the complete solution:

$$
y=c_1\cos(2x)+c_2\sin(2x)+y_p.
$$

Apply $y(0)=2$:

$$
\begin{aligned}
2
&=c_1\cos(0)+c_2\sin(0)+y_p(0) \\
&=c_1.
\end{aligned}
$$

Therefore:

$$
c_1=2.
$$

Differentiate the complete solution:

$$
y'=-2c_1\sin(2x)+2c_2\cos(2x)+y_p'.
$$

Apply $y'(0)=-1$:

$$
\begin{aligned}
-1
&=-2c_1\sin(0)+2c_2\cos(0)+y_p'(0) \\
&=2c_2.
\end{aligned}
$$

Divide by $2$:

$$
c_2=-\frac12.
$$

Hence:

$$
\boxed{
y=2\cos(2x)-\frac12\sin(2x)
+\cos(2x)\ln(\cos(2x))+2x\sin(2x)
}.
$$

### Answer 11

Solve:

$$
y'''-4y'=8.
$$

The associated characteristic equation is:

$$
r^3-4r=0.
$$

Factor:

$$
r(r-2)(r+2)=0.
$$

Choose the fundamental set:

$$
y_1=1,
\qquad
y_2=e^{2x},
\qquad
y_3=e^{-2x}.
$$

Thus:

$$
y_h=c_1+c_2e^{2x}+c_3e^{-2x}.
$$

For third order, write:

$$
\begin{aligned}
y_1u_1'+y_2u_2'+y_3u_3'&=0, \\
y_1'u_1'+y_2'u_2'+y_3'u_3'&=0, \\
y_1''u_1'+y_2''u_2'+y_3''u_3'&=R.
\end{aligned}
$$

Here $R=8$. The needed derivatives are:

$$
\begin{array}{c|ccc}
&y_1&y_2&y_3\\
\hline
\text{function}&1&e^{2x}&e^{-2x}\\
\text{first derivative}&0&2e^{2x}&-2e^{-2x}\\
\text{second derivative}&0&4e^{2x}&4e^{-2x}
\end{array}
$$

Substitution gives:

$$
\begin{aligned}
u_1'+e^{2x}u_2'+e^{-2x}u_3'&=0, \\
2e^{2x}u_2'-2e^{-2x}u_3'&=0, \\
4e^{2x}u_2'+4e^{-2x}u_3'&=8.
\end{aligned}
$$

Divide the second equation by $2$:

$$
e^{2x}u_2'=e^{-2x}u_3'.
$$

Let their common value be $q$. The third equation becomes:

$$
4q+4q=8.
$$

Combine the left side:

$$
8q=8.
$$

Therefore:

$$
q=1.
$$

Hence:

$$
e^{2x}u_2'=1,
\qquad
e^{-2x}u_3'=1.
$$

Solve each equation:

$$
u_2'=e^{-2x},
\qquad
u_3'=e^{2x}.
$$

The first system equation now gives:

$$
u_1'+1+1=0.
$$

Therefore:

$$
u_1'=-2.
$$

Integrate all three parameter derivatives:

$$
u_1=-2x,
\qquad
u_2=-\frac12e^{-2x},
\qquad
u_3=\frac12e^{2x}.
$$

Reconstruct:

$$
\begin{aligned}
y_p
&=u_1y_1+u_2y_2+u_3y_3 \\
&=(-2x)(1)
+\left(-\frac12e^{-2x}\right)e^{2x}
+\left(\frac12e^{2x}\right)e^{-2x} \\
&=-2x-\frac12+\frac12 \\
&=-2x.
\end{aligned}
$$

Verify:

$$
y_p'=-2,
\qquad
y_p'''=0.
$$

Then:

$$
y_p'''-4y_p'=0-4(-2)=8.
$$

Therefore:

$$
\boxed{
y=c_1+c_2e^{2x}+c_3e^{-2x}-2x
}.
$$

### Answer 12

#### Part (a)

The equation is:

$$
y''+y=xe^x.
$$

It is linear with constant coefficients, and $xe^x$ belongs to the standard
undetermined-coefficients trial family. Variation of parameters applies after
the homogeneous pair is found, but undetermined coefficients is likely to be
shorter.

#### Part (b)

The equation is:

$$
x^2y''+xy'+y=\ln x,
\qquad x>0.
$$

It is linear but has variable coefficients. Undetermined coefficients in its
standard constant-coefficient form does not apply. Variation of parameters
does apply on $x>0$ once a fundamental homogeneous pair is known and the
equation is normalized by dividing through by $x^2$.

#### Part (c)

The equation is:

$$
y''+y=e^{x^2}.
$$

It is linear and already in standard form. Variation of parameters applies
using $y_1=\cos x$ and $y_2=\sin x$. Standard undetermined coefficients does
not provide a finite trial family for $e^{x^2}$.

The variation integrals may not have elementary antiderivatives. An integral
representation can still be a valid particular solution.

</details>

<details open>
<summary><strong>Chapter 12 Final Summary</strong></summary>

For a normalized second-order equation:

$$
y''+Py'+Qy=R,
$$

begin with an ordered fundamental pair $y_1,y_2$ and its Wronskian:

$$
W=y_1y_2'-y_1'y_2.
$$

Vary the homogeneous parameters:

$$
y_p=u_1y_1+u_2y_2.
$$

The auxiliary condition and the differential equation produce:

$$
\begin{aligned}
y_1u_1'+y_2u_2'&=0, \\
y_1'u_1'+y_2'u_2'&=R.
\end{aligned}
$$

Solving gives:

$$
\boxed{
u_1'=-\frac{y_2R}{W},
\qquad
u_2'=\frac{y_1R}{W}
}.
$$

Integrate and reconstruct:

$$
\boxed{y_p=u_1y_1+u_2y_2}.
$$

Finally:

$$
\boxed{y=y_h+y_p}.
$$

The chapter's central lesson is:

> normalize first, preserve the order of the homogeneous basis, make the
> auxiliary condition explicit, integrate the parameter derivatives, and
> always return to the reconstruction formula before presenting the solution.

</details>
