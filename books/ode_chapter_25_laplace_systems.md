# Solving Linear Systems With Laplace Transforms

Chapter 24 used Laplace transforms to turn one differential-equation
initial-value problem into an algebraic equation for one unknown transform.
The same idea extends to coupled systems: one transform is introduced for
each unknown function, producing simultaneous algebraic equations.

This chapter develops that extension carefully. We will:

- transform two- and three-variable systems term by term
- solve the transformed equations by elimination and Cramer's rule
- handle homogeneous, forced, oscillatory, and delayed systems
- treat triangular, fully coupled, mixed-order, and algebraic-differential
  systems
- connect the scalar calculations with the matrix expression
  $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$

---

## Block 1: From A Differential System To An Algebraic System

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see exactly how a coupled system in time becomes a simultaneous
system in the transform variable $s$.

> one unknown function produces one unknown transform; coupling remains as
> coupling, but differentiation disappears.

</details>

<details open>
<summary><strong>Notation For Two Unknown Functions</strong></summary>

Let $u(t)$ and $v(t)$ be unknown functions. Define:

$$
U(s)=\mathcal{L}\{u(t)\},
\qquad
V(s)=\mathcal{L}\{v(t)\}.
$$

Their first derivatives transform as:

$$
\begin{aligned}
\mathcal{L}\{u'(t)\}
&=sU(s)-u(0),\\
\mathcal{L}\{v'(t)\}
&=sV(s)-v(0).
\end{aligned}
$$

The capital letters $U$ and $V$ are functions of $s$. They are not constants
and must be solved for simultaneously.

</details>

<details open>
<summary><strong>A General Two-Variable System</strong></summary>

Consider:

$$
\begin{aligned}
u'&=a_{11}u+a_{12}v+f(t),\\
v'&=a_{21}u+a_{22}v+g(t),
\end{aligned}
$$

with:

$$
u(0)=u_0,
\qquad
v(0)=v_0.
$$

Let:

$$
F(s)=\mathcal{L}\{f(t)\},
\qquad
G(s)=\mathcal{L}\{g(t)\}.
$$

Transform the first differential equation:

$$
sU-u_0=a_{11}U+a_{12}V+F.
$$

Move the unknown-transform terms to the left:

$$
(s-a_{11})U-a_{12}V=u_0+F.
$$

Transform the second differential equation:

$$
sV-v_0=a_{21}U+a_{22}V+G.
$$

Move its unknown-transform terms to the left:

$$
-a_{21}U+(s-a_{22})V=v_0+G.
$$

The transformed system is therefore:

$$
\boxed{
\begin{aligned}
(s-a_{11})U-a_{12}V&=u_0+F,\\
-a_{21}U+(s-a_{22})V&=v_0+G.
\end{aligned}
}
$$

</details>

<details open>
<summary><strong>What Has Changed And What Has Not</strong></summary>

Before transformation, $u$ and $v$ are linked by derivatives. After
transformation, $U$ and $V$ are linked by simultaneous algebraic equations.

The coupling coefficients remain visible. For example, the term $a_{12}v$
becomes $a_{12}V$; it does not disappear.

The key change is:

$$
u'\quad\longrightarrow\quad sU-u(0),
\qquad
v'\quad\longrightarrow\quad sV-v(0).
$$

Initial values become part of the algebraic right sides.

</details>

<details open>
<summary><strong>The Seven-Step Workflow</strong></summary>

For a coupled initial-value problem:

1. Define one transform for each unknown function.
2. Transform every differential equation independently.
3. Insert each initial value into the derivative where it belongs.
4. Move all unknown transforms to the left side.
5. Solve the simultaneous algebraic system.
6. Prepare each transform for inversion.
7. Invert and verify every component.

Preserve the same unknown order in every equation. If the order is $U,V$ in
the first row, keep $U,V$ in every row and in every determinant.

</details>

<details open>
<summary><strong>A Small Setup Check</strong></summary>

Suppose:

$$
u'-2u+3v=t,
\qquad
u(0)=-1.
$$

Transform the derivative and the forcing:

$$
[sU-u(0)]-2U+3V=\frac1{s^2}.
$$

Insert $u(0)=-1$ with parentheses:

$$
sU-(-1)-2U+3V=\frac1{s^2}.
$$

Remove the double negative and collect $U$:

$$
\boxed{(s-2)U+3V=\frac1{s^2}-1}.
$$

The value $v(0)$ does not appear here because this equation contains $v$, not
$v'$.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Transform each row separately, insert only the initial values associated with
derivatives in that row, and arrange every equation in one consistent unknown
order. The result is a simultaneous algebra problem for the transforms.

</details>

---

## Block 2: Solving A Two-Variable System By Elimination

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to solve a complete coupled initial-value problem while showing
every elimination and partial-fraction step.

</details>

<details open>
<summary><strong>The Initial-Value Problem</strong></summary>

Solve:

$$
\begin{aligned}
u'&=2u+v,\\
v'&=u+2v,
\end{aligned}
\qquad
u(0)=3,
\qquad
v(0)=1.
$$

Define:

$$
U(s)=\mathcal{L}\{u(t)\},
\qquad
V(s)=\mathcal{L}\{v(t)\}.
$$

</details>

<details open>
<summary><strong>Transform Both Equations</strong></summary>

Transform the first equation $u'=2u+v$:

$$
sU-u(0)=2U+V.
$$

Insert $u(0)=3$ and move the transform terms to the left:

$$
\boxed{(s-2)U-V=3}.
$$

Transform the second equation $v'=u+2v$:

$$
sV-v(0)=U+2V.
$$

Insert $v(0)=1$ and arrange the unknowns in the order $U,V$:

$$
\boxed{-U+(s-2)V=1}.
$$

The complete transformed system is:

$$
\begin{aligned}
(s-2)U-V&=3,\\
-U+(s-2)V&=1.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Eliminate V To Find U</strong></summary>

Solve the first transformed equation for $V$:

$$
\begin{aligned}
(s-2)U-V&=3,\\
-V&=3-(s-2)U,\\
V&=(s-2)U-3.
\end{aligned}
$$

Substitute this expression into the second transformed equation:

$$
-U+(s-2)[(s-2)U-3]=1.
$$

Expand the product:

$$
-U+(s-2)^2U-3(s-2)=1.
$$

Collect $U$ on the left and move $-3(s-2)$ to the right:

$$
[(s-2)^2-1]U=1+3(s-2).
$$

Expand the right side:

$$
1+3(s-2)=1+3s-6=3s-5.
$$

Factor the coefficient of $U$ as a difference of squares:

$$
\begin{aligned}
(s-2)^2-1
&=[(s-2)-1][(s-2)+1]\\
&=(s-3)(s-1).
\end{aligned}
$$

Divide to isolate $U$:

$$
U=\frac{3s-5}{(s-3)(s-1)}.
$$

</details>

<details open>
<summary><strong>Decompose And Invert U</strong></summary>

Use:

$$
\frac{3s-5}{(s-3)(s-1)}
=\frac A{s-3}+\frac B{s-1}.
$$

Multiply by $(s-3)(s-1)$:

$$
3s-5=A(s-1)+B(s-3).
$$

Set $s=3$. The term containing $B$ vanishes:

$$
9-5=A(2),
\qquad
A=2.
$$

Set $s=1$. The term containing $A$ vanishes:

$$
3-5=B(-2),
\qquad
B=1.
$$

Substituting $A=2$ and $B=1$ into the decomposition gives:

$$
U=\frac2{s-3}+\frac1{s-1}.
$$

Invert both terms:

$$
\boxed{u(t)=2e^{3t}+e^t}.
$$

</details>

<details open>
<summary><strong>Recover V Without Skipping Algebra</strong></summary>

Return to the local relation:

$$
V=(s-2)U-3.
$$

Substitute the unreduced rational form for $U$:

$$
V
=(s-2)\frac{3s-5}{(s-3)(s-1)}-3.
$$

Put both terms over the common denominator $(s-3)(s-1)$:

$$
V
=\frac{(s-2)(3s-5)-3(s-3)(s-1)}{(s-3)(s-1)}.
$$

Expand the first product:

$$
(s-2)(3s-5)=3s^2-11s+10.
$$

Expand the second product:

$$
3(s-3)(s-1)=3(s^2-4s+3)=3s^2-12s+9.
$$

Subtract the two numerators:

$$
(3s^2-11s+10)-(3s^2-12s+9)=s+1.
$$

The numerator subtraction reduces the recovered transform to:

$$
V=\frac{s+1}{(s-3)(s-1)}.
$$

</details>

<details open>
<summary><strong>Decompose And Invert V</strong></summary>

Write:

$$
\frac{s+1}{(s-3)(s-1)}
=\frac C{s-3}+\frac D{s-1}.
$$

Multiply by the denominator:

$$
s+1=C(s-1)+D(s-3).
$$

Set $s=3$:

$$
4=2C,
\qquad
C=2.
$$

Set $s=1$:

$$
2=-2D,
\qquad
D=-1.
$$

The inverse transform is:

$$
\boxed{v(t)=2e^{3t}-e^t}.
$$

</details>

<details open>
<summary><strong>Verify The Coupled Solution</strong></summary>

Check the initial values:

$$
\begin{aligned}
u(0)&=2+1=3,\\
v(0)&=2-1=1.
\end{aligned}
$$

Differentiate both components:

$$
\begin{aligned}
u'(t)&=6e^{3t}+e^t,\\
v'(t)&=6e^{3t}-e^t.
\end{aligned}
$$

Check the first equation:

$$
\begin{aligned}
2u+v
&=2(2e^{3t}+e^t)+(2e^{3t}-e^t)\\
&=6e^{3t}+e^t\\
&=u'.
\end{aligned}
$$

Check the second equation:

$$
\begin{aligned}
u+2v
&=(2e^{3t}+e^t)+2(2e^{3t}-e^t)\\
&=6e^{3t}-e^t\\
&=v'.
\end{aligned}
$$

Both functions must be checked because the original problem contains two
differential equations.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Elimination works exactly as it does for ordinary simultaneous equations,
except that the coefficients are functions of $s$. After one transform is
found, recover the other with a locally restated equation and simplify it
before attempting inversion.

</details>

---

## Block 3: Determinants And An Oscillatory System

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to solve transformed systems systematically with determinants and
to connect the resulting quadratic denominator with oscillation.

</details>

<details open>
<summary><strong>Cramer's Rule For Two Unknown Transforms</strong></summary>

For:

$$
\begin{aligned}
aU+bV&=p,\\
cU+dV&=q,
\end{aligned}
$$

the coefficient determinant is:

$$
\Delta=\begin{vmatrix}a&b\\c&d\end{vmatrix}=ad-bc.
$$

If $\Delta\neq0$, replace the $U$ column by the right side to obtain:

$$
\boxed{
U=\frac{\begin{vmatrix}p&b\\q&d\end{vmatrix}}{\Delta}
=\frac{pd-bq}{\Delta}
}.
$$

Replace the $V$ column by the right side to obtain:

$$
\boxed{
V=\frac{\begin{vmatrix}a&p\\c&q\end{vmatrix}}{\Delta}
=\frac{aq-cp}{\Delta}
}.
$$

The column order is not negotiable. The first column always belongs to $U$,
and the second always belongs to $V$.

</details>

<details open>
<summary><strong>An Oscillatory Initial-Value Problem</strong></summary>

Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=-4x,
\end{aligned}
\qquad
x(0)=2,
\qquad
y(0)=1.
$$

Define $X(s)=\mathcal{L}\{x(t)\}$ and
$Y(s)=\mathcal{L}\{y(t)\}$.

Transform $x'=y$:

$$
sX-2=Y,
$$

which becomes:

$$
sX-Y=2.
$$

Transform $y'=-4x$:

$$
sY-1=-4X,
$$

which becomes:

$$
4X+sY=1.
$$

The coefficient system is:

$$
\begin{bmatrix}
s&-1\\
4&s
\end{bmatrix}
\begin{bmatrix}X\\Y\end{bmatrix}
=
\begin{bmatrix}2\\1\end{bmatrix}.
$$

</details>

<details open>
<summary><strong>Calculate X With Cramer's Rule</strong></summary>

First calculate the coefficient determinant:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s&-1\\4&s\end{vmatrix}\\
&=s(s)-(-1)(4)\\
&=s^2+4.
\end{aligned}
$$

Replace the first column by the right side:

$$
\begin{aligned}
\Delta_X
&=\begin{vmatrix}2&-1\\1&s\end{vmatrix}\\
&=2s-(-1)(1)\\
&=2s+1.
\end{aligned}
$$

Divide by $\Delta$:

$$
X=\frac{2s+1}{s^2+4}
=2\frac{s}{s^2+4}+\frac1{s^2+4}.
$$

Use the cosine and sine transform pairs:

$$
\boxed{x(t)=2\cos(2t)+\frac12\sin(2t)}.
$$

</details>

<details open>
<summary><strong>Calculate Y With Cramer's Rule</strong></summary>

Replace the second column by the right side:

$$
\begin{aligned}
\Delta_Y
&=\begin{vmatrix}s&2\\4&1\end{vmatrix}\\
&=s(1)-2(4)\\
&=s-8.
\end{aligned}
$$

Divide by the same coefficient determinant:

$$
Y=\frac{s-8}{s^2+4}
=\frac{s}{s^2+4}-4\frac2{s^2+4}.
$$

Invert:

$$
\boxed{y(t)=\cos(2t)-4\sin(2t)}.
$$

The same denominator $s^2+4$ appears in both transforms because both state
components belong to the same coupled motion.

</details>

<details open>
<summary><strong>Use The First Equation As A Fast Check</strong></summary>

The first differential equation says $x'=y$. Differentiate the calculated
$x(t)$:

$$
\begin{aligned}
x'(t)
&=\frac{d}{dt}\left[2\cos(2t)+\frac12\sin(2t)\right]\\
&=-4\sin(2t)+\cos(2t)\\
&=y(t).
\end{aligned}
$$

The relation between the components provides a shorter verification than
substituting both into every equation from scratch.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Cramer's rule gives each transform from the same coefficient determinant.
Linear factors in that determinant create exponential modes; irreducible
quadratic factors create sine and cosine modes.

</details>

---

## Block 4: Forced And Delayed Systems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to track ordinary and delayed forcing through a coupled transform
calculation without losing which equation receives the input.

</details>

<details open>
<summary><strong>A Constant-Forced System</strong></summary>

Solve:

$$
\begin{aligned}
u'&=-u+v+2,\\
v'&=u-v,
\end{aligned}
\qquad
u(0)=0,
\qquad
v(0)=1.
$$

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

Transform the first equation:

$$
sU-0=-U+V+\frac2s.
$$

Move $U$ and $V$ to the left:

$$
(s+1)U-V=\frac2s.
$$

Transform the second equation:

$$
sV-1=U-V.
$$

Move the transform terms to the left:

$$
-U+(s+1)V=1.
$$

The transformed system is:

$$
\begin{aligned}
(s+1)U-V&=\frac2s,\\
-U+(s+1)V&=1.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Find U From The Forced System</strong></summary>

The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s+1&-1\\-1&s+1\end{vmatrix}\\
&=(s+1)^2-1\\
&=s^2+2s\\
&=s(s+2).
\end{aligned}
$$

Replace the first column by the right side:

$$
\begin{aligned}
\Delta_U
&=\begin{vmatrix}\frac2s&-1\\1&s+1\end{vmatrix}\\
&=\frac{2(s+1)}s+1\\
&=\frac{2s+2+s}{s}\\
&=\frac{3s+2}{s}.
\end{aligned}
$$

Divide by $\Delta=s(s+2)$:

$$
U=\frac{3s+2}{s^2(s+2)}.
$$

</details>

<details open>
<summary><strong>Decompose And Invert U</strong></summary>

Use the repeated-factor form:

$$
\frac{3s+2}{s^2(s+2)}
=\frac As+\frac B{s^2}+\frac C{s+2}.
$$

Multiply by $s^2(s+2)$:

$$
3s+2=As(s+2)+B(s+2)+Cs^2.
$$

Expand and group powers of $s$:

$$
3s+2=(A+C)s^2+(2A+B)s+2B.
$$

Match coefficients with $0s^2+3s+2$:

$$
A+C=0,
\qquad
2A+B=3,
\qquad
2B=2.
$$

Solve from the last equation upward:

$$
B=1,
\qquad
A=1,
\qquad
C=-1.
$$

Substituting $A=1$, $B=1$, and $C=-1$ gives:

$$
U=\frac1s+\frac1{s^2}-\frac1{s+2}.
$$

Invert:

$$
\boxed{u(t)=1+t-e^{-2t}}.
$$

</details>

<details open>
<summary><strong>Find And Invert V</strong></summary>

Replace the second column of the coefficient matrix by the right side:

$$
\begin{aligned}
\Delta_V
&=\begin{vmatrix}s+1&\frac2s\\-1&1\end{vmatrix}\\
&=(s+1)+\frac2s\\
&=\frac{s^2+s+2}{s}.
\end{aligned}
$$

Divide by $\Delta=s(s+2)$:

$$
V=\frac{s^2+s+2}{s^2(s+2)}.
$$

Use:

$$
\frac{s^2+s+2}{s^2(s+2)}
=\frac As+\frac B{s^2}+\frac C{s+2}.
$$

After multiplying by $s^2(s+2)$ and grouping powers, we obtain:

$$
s^2+s+2=(A+C)s^2+(2A+B)s+2B.
$$

Match coefficients:

$$
A+C=1,
\qquad
2A+B=1,
\qquad
2B=2.
$$

The last equation gives $B=1$. Then $2A+1=1$, so $A=0$, and finally
$C=1$. Therefore:

$$
V=\frac1{s^2}+\frac1{s+2}.
$$

Invert:

$$
\boxed{v(t)=t+e^{-2t}}.
$$

The linear terms arise because the transformed determinant contains a factor
$s^2$. The system has a nondecaying mode that accumulates the constant input.

</details>

<details open>
<summary><strong>Verify The Forced Components Together</strong></summary>

Differentiate:

$$
u'(t)=1+2e^{-2t},
\qquad
v'(t)=1-2e^{-2t}.
$$

Check the first right side:

$$
\begin{aligned}
-u+v+2
&=-(1+t-e^{-2t})+(t+e^{-2t})+2\\
&=1+2e^{-2t}\\
&=u'.
\end{aligned}
$$

Check the second right side:

$$
\begin{aligned}
u-v
&=(1+t-e^{-2t})-(t+e^{-2t})\\
&=1-2e^{-2t}\\
&=v'.
\end{aligned}
$$

At $t=0$, $u(0)=0$ and $v(0)=1$ as required.

</details>

<details open>
<summary><strong>A Delayed Input To A Coupled Oscillator</strong></summary>

Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=-x+u(t-2),
\end{aligned}
\qquad
x(0)=0,
\qquad
y(0)=0.
$$

Transform the first equation:

$$
sX-Y=0.
$$

Transform the second equation using
$\mathcal{L}\{u(t-2)\}=e^{-2s}/s$:

$$
sY=-X+\frac{e^{-2s}}s.
$$

Move $-X$ to the left:

$$
X+sY=\frac{e^{-2s}}s.
$$

</details>

<details open>
<summary><strong>Eliminate And Apply The Delay</strong></summary>

The first transformed equation gives:

$$
Y=sX.
$$

Substitute this into the second equation:

$$
X+s(sX)=\frac{e^{-2s}}s.
$$

Collect $X$:

$$
(s^2+1)X=\frac{e^{-2s}}s.
$$

Divide by $s^2+1$:

$$
X=e^{-2s}\frac1{s(s^2+1)}.
$$

Decompose the undelayed factor:

$$
\frac1{s(s^2+1)}=\frac1s-\frac{s}{s^2+1}.
$$

Its inverse is:

$$
f(t)=1-\cos t.
$$

Apply the delay $a=2$ to the complete function:

$$
\boxed{x(t)=u(t-2)[1-\cos(t-2)]}.
$$

Now use $Y=sX$:

$$
Y=e^{-2s}\frac1{s^2+1}.
$$

Apply the same delay to $\sin t$:

$$
\boxed{y(t)=u(t-2)\sin(t-2)}.
$$

</details>

<details open>
<summary><strong>Interpret The Delayed Response</strong></summary>

![Delayed input and two coupled state responses](books/assets/chapter_25/chapter_25_figure-1.png)

Both state components remain zero before $t=2$. The forcing enters only the
second differential equation, but coupling carries its effect into $x$ as
well.

For $t>2$:

$$
x'(t)=\sin(t-2)=y(t),
$$

so the first system equation remains visible in the two plotted responses.

What to remember:

> a delayed input to one equation can activate every coupled component, but
> no zero-state response should begin before the switch time.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Forcing changes the right side of the transformed algebraic system. Constant
inputs may create repeated factors at $s=0$, while delayed inputs attach a
common exponential factor to every state response reached through coupling.

</details>

---

## Block 5: Three-Variable Systems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to scale the method to three unknown functions without hiding the
extra simultaneous algebra.

</details>

<details open>
<summary><strong>A Triangular System</strong></summary>

Solve:

$$
\begin{aligned}
p'&=-p,\\
q'&=p-q,\\
r'&=q-r,
\end{aligned}
\qquad
p(0)=2,
\quad
q(0)=0,
\quad
r(0)=1.
$$

This system is **triangular**: the first equation determines $p$, the second
then determines $q$, and the third finally determines $r$.

Define transforms $P,Q,R$ for $p,q,r$ respectively.

</details>

<details open>
<summary><strong>Solve The Triangular Transforms In Order</strong></summary>

Transform $p'=-p$:

$$
sP-2=-P.
$$

Collect $P$:

$$
(s+1)P=2,
\qquad
P=\frac2{s+1}.
$$

Transform $q'=p-q$:

$$
sQ-0=P-Q.
$$

Collect $Q$ and substitute the known $P$:

$$
\begin{aligned}
(s+1)Q&=P,\\
Q&=\frac{P}{s+1}\\
&=\frac2{(s+1)^2}.
\end{aligned}
$$

Transform $r'=q-r$:

$$
sR-1=Q-R.
$$

Collect $R$ and substitute $Q$:

$$
\begin{aligned}
(s+1)R&=Q+1,\\
R&=\frac{Q}{s+1}+\frac1{s+1}\\
&=\frac2{(s+1)^3}+\frac1{s+1}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Invert The Triangular Solution</strong></summary>

Use the shifted-power pair:

$$
\mathcal{L}^{-1}\left\{\frac1{(s+a)^{n+1}}\right\}
=\frac{t^n}{n!}e^{-at}.
$$

For $P$:

$$
\boxed{p(t)=2e^{-t}}.
$$

For $Q=2/(s+1)^2$:

$$
\boxed{q(t)=2te^{-t}}.
$$

For $R=2/(s+1)^3+1/(s+1)$:

$$
\begin{aligned}
r(t)
&=2\left(\frac{t^2}{2}e^{-t}\right)+e^{-t}\\
&=\boxed{(1+t^2)e^{-t}}.
\end{aligned}
$$

The repeated factor $(s+1)^3$ appears because information passes through
three successive equations with the same decay rate.

</details>

<details open>
<summary><strong>A Fully Coupled Three-Variable System</strong></summary>

Solve:

$$
\begin{aligned}
x'&=y,\\
y'&=z,\\
z'&=-x-y-z,
\end{aligned}
\qquad
x(0)=1,
\quad
y(0)=0,
\quad
z(0)=0.
$$

Define $X,Y,Z$ as the transforms of $x,y,z$.

Transform all three equations:

$$
\begin{aligned}
sX-1&=Y,\\
sY&=Z,\\
sZ&=-X-Y-Z.
\end{aligned}
$$

Rewrite the first two as substitution formulas:

$$
Y=sX-1,
\qquad
Z=sY=s(sX-1)=s^2X-s.
$$

Move every transform in the third equation to the left:

$$
X+Y+(s+1)Z=0.
$$

</details>

<details open>
<summary><strong>Eliminate Y And Z</strong></summary>

Substitute $Y=sX-1$ and $Z=s^2X-s$ into the third transformed equation:

$$
X+(sX-1)+(s+1)(s^2X-s)=0.
$$

Expand the final product while keeping its $X$ and non-$X$ parts visible:

$$
X+sX-1+s^2(s+1)X-s(s+1)=0.
$$

Collect $X$:

$$
[1+s+s^2(s+1)]X=1+s(s+1).
$$

Expand both polynomials:

$$
(s^3+s^2+s+1)X=s^2+s+1.
$$

Factor the coefficient on the left:

$$
s^3+s^2+s+1
=(s+1)(s^2+1).
$$

Divide:

$$
X=\frac{s^2+s+1}{(s+1)(s^2+1)}.
$$

</details>

<details open>
<summary><strong>Prepare And Invert X</strong></summary>

Use:

$$
\frac{s^2+s+1}{(s+1)(s^2+1)}
=\frac A{s+1}+\frac{Bs+C}{s^2+1}.
$$

Multiply by $(s+1)(s^2+1)$:

$$
s^2+s+1=A(s^2+1)+(Bs+C)(s+1).
$$

Set $s=-1$:

$$
1=2A,
\qquad
A=\frac12.
$$

Expand the right side:

$$
s^2+s+1=(A+B)s^2+(B+C)s+(A+C).
$$

Match the coefficient of $s^2$:

$$
A+B=1,
\qquad
B=\frac12.
$$

Match the coefficient of $s$:

$$
B+C=1,
\qquad
C=\frac12.
$$

Substituting the three constants into the decomposition gives:

$$
X
=\frac1{2(s+1)}
+\frac12\frac{s}{s^2+1}
+\frac12\frac1{s^2+1}.
$$

Invert:

$$
\boxed{
x(t)=\frac12e^{-t}+\frac12\cos t+\frac12\sin t
}.
$$

</details>

<details open>
<summary><strong>Recover The Remaining Components From The Chain</strong></summary>

The original system gives $y=x'$ and $z=y'=x''$. Differentiate $x$ once:

$$
\begin{aligned}
y(t)=x'(t)
&=-\frac12e^{-t}-\frac12\sin t+\frac12\cos t.
\end{aligned}
$$

Differentiate again:

$$
\begin{aligned}
z(t)=x''(t)
&=\frac12e^{-t}-\frac12\cos t-\frac12\sin t.
\end{aligned}
$$

Collecting the three component formulas gives:

$$
\boxed{
\begin{aligned}
x(t)&=\frac12(e^{-t}+\cos t+\sin t),\\
y(t)&=\frac12(-e^{-t}-\sin t+\cos t),\\
z(t)&=\frac12(e^{-t}-\cos t-\sin t).
\end{aligned}
}
$$

The chain relations make differentiation a legitimate recovery method here;
in a general three-variable system, each transform may need to be solved
separately.

</details>

<details open>
<summary><strong>Verify The Third Equation</strong></summary>

Differentiate $z$:

$$
z'(t)=\frac12[-e^{-t}+\sin t-\cos t].
$$

Add the three state components:

$$
\begin{aligned}
x+y+z
&=\frac12[e^{-t}+\cos t-\sin t].
\end{aligned}
$$

Negate this sum:

$$
-(x+y+z)
=\frac12[-e^{-t}-\cos t+\sin t]
=z'(t).
$$

The final coupled equation is satisfied.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Triangular systems should be solved in dependency order. Fully coupled
three-variable systems require systematic elimination or determinants, but
chain relations can sometimes recover later components by differentiation.

</details>

---

## Block 6: Mixed-Order And Algebraic-Differential Systems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to apply the transform method when the equations do not all have
the same derivative order.

</details>

<details open>
<summary><strong>A Second-Order And First-Order Pair</strong></summary>

Solve:

$$
\begin{aligned}
u''+u-v&=0,\\
v'+v&=u,
\end{aligned}
$$

with:

$$
u(0)=1,
\qquad
u'(0)=0,
\qquad
v(0)=0.
$$

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

Transform the first equation:

$$
[s^2U-su(0)-u'(0)]+U-V=0.
$$

Insert $u(0)=1$ and $u'(0)=0$:

$$
(s^2+1)U-V=s.
$$

Transform the second equation and insert $v(0)=0$:

$$
sV+V=U,
$$

or:

$$
-U+(s+1)V=0.
$$

</details>

<details open>
<summary><strong>Solve The Mixed-Order Transform System</strong></summary>

The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=\begin{vmatrix}s^2+1&-1\\-1&s+1\end{vmatrix}\\
&=(s^2+1)(s+1)-1\\
&=s^3+s^2+s\\
&=s(s^2+s+1).
\end{aligned}
$$

For $U$, replace the first column by the right side:

$$
\begin{aligned}
\Delta_U
&=\begin{vmatrix}s&-1\\0&s+1\end{vmatrix}\\
&=s(s+1).
\end{aligned}
$$

Divide and cancel the common factor $s$:

$$
U
=\frac{s(s+1)}{s(s^2+s+1)}
=\frac{s+1}{s^2+s+1}.
$$

For $V$, replace the second column by the right side:

$$
\begin{aligned}
\Delta_V
&=\begin{vmatrix}s^2+1&s\\-1&0\end{vmatrix}\\
&=s.
\end{aligned}
$$

Divide and cancel $s$:

$$
V=\frac1{s^2+s+1}.
$$

</details>

<details open>
<summary><strong>Complete The Square And Invert Both Components</strong></summary>

Complete the common denominator:

$$
\begin{aligned}
s^2+s+1
&=\left(s+\frac12\right)^2+\frac34\\
&=\left(s+\frac12\right)^2+\left(\frac{\sqrt3}{2}\right)^2.
\end{aligned}
$$

Rewrite the numerator of $U$:

$$
s+1=\left(s+\frac12\right)+\frac12.
$$

Let $b=\sqrt3/2$. Then:

$$
U
=\frac{s+\frac12}{(s+\frac12)^2+b^2}
+\frac1{\sqrt3}\frac{b}{(s+\frac12)^2+b^2}.
$$

Invert $U$:

$$
\boxed{
u(t)=e^{-t/2}\cos\left(\frac{\sqrt3}{2}t\right)
+\frac1{\sqrt3}e^{-t/2}\sin\left(\frac{\sqrt3}{2}t\right)
}.
$$

For $V$, write $1=(2/\sqrt3)b$:

$$
V
=\frac2{\sqrt3}\frac{b}{(s+\frac12)^2+b^2}.
$$

Invert:

$$
\boxed{
v(t)=\frac2{\sqrt3}e^{-t/2}
\sin\left(\frac{\sqrt3}{2}t\right)
}.
$$

</details>

<details open>
<summary><strong>An Equation Without A Derivative</strong></summary>

Consider the algebraic-differential system:

$$
\begin{aligned}
u'+v&=0,\\
u-v&=2,
\end{aligned}
\qquad
u(0)=0.
$$

The second equation contains no derivative. It is an algebraic constraint
that must hold at every time.

Transform the first equation:

$$
sU-u(0)+V=0.
$$

Insert $u(0)=0$:

$$
sU+V=0.
$$

Transform the algebraic equation:

$$
U-V=\frac2s.
$$

No value $v(0)$ appears because $v$ is never differentiated.

</details>

<details open>
<summary><strong>Solve And Check The Constraint System</strong></summary>

From the first transformed equation:

$$
V=-sU.
$$

Substitute this into $U-V=2/s$:

$$
U-(-sU)=\frac2s.
$$

Remove the double negative and collect $U$:

$$
(s+1)U=\frac2s.
$$

Divide and decompose:

$$
U=\frac2{s(s+1)}
=\frac2s-\frac2{s+1}.
$$

Invert:

$$
\boxed{u(t)=2-2e^{-t}}.
$$

Recover $V=-sU$ from the unreduced transform:

$$
V=-s\frac2{s(s+1)}=-\frac2{s+1}.
$$

Invert:

$$
\boxed{v(t)=-2e^{-t}}.
$$

Check the algebraic constraint:

$$
u-v=(2-2e^{-t})-(-2e^{-t})=2.
$$

Check the differential equation:

$$
u'+v=2e^{-t}-2e^{-t}=0.
$$

At $t=0$, the constraint determines $v(0)=-2$ automatically.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Transform each derivative according to its own order. A variable contributes
initial data only when its derivative is transformed. Equations without
derivatives remain algebraic constraints in the transform domain.

</details>

---

## Block 7: The Matrix-Resolvent View

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to compress the component calculations into one matrix equation
without concealing what each matrix entry means.

</details>

<details open>
<summary><strong>Start From A Matrix Initial-Value Problem</strong></summary>

Write a first-order linear system as:

$$
\mathbf{x}'(t)=A\mathbf{x}(t)+\mathbf{f}(t),
\qquad
\mathbf{x}(0)=\mathbf{x}_0.
$$

Here:

- $\mathbf{x}(t)$ is the column vector of unknown functions
- $A$ is a constant coefficient matrix
- $\mathbf{f}(t)$ is the forcing vector
- $\mathbf{x}_0$ is the initial state

Define the componentwise transforms:

$$
\mathbf{X}(s)=\mathcal{L}\{\mathbf{x}(t)\},
\qquad
\mathbf{F}(s)=\mathcal{L}\{\mathbf{f}(t)\}.
$$

</details>

<details open>
<summary><strong>Transform The Vector Equation</strong></summary>

Apply the first-derivative formula to every component:

$$
\mathcal{L}\{\mathbf{x}'(t)\}
=s\mathbf{X}(s)-\mathbf{x}_0.
$$

Because $A$ is constant:

$$
\mathcal{L}\{A\mathbf{x}(t)\}=A\mathbf{X}(s).
$$

Transform the complete system:

$$
s\mathbf{X}-\mathbf{x}_0=A\mathbf{X}+\mathbf{F}.
$$

Move $A\mathbf{X}$ to the left:

$$
s\mathbf{X}-A\mathbf{X}=\mathbf{x}_0+\mathbf{F}.
$$

Factor $\mathbf{X}$ using the identity matrix $I$:

$$
\boxed{
(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}
}.
$$

If the inverse matrix exists, multiply by $(sI-A)^{-1}$:

$$
\boxed{
\mathbf{X}(s)
=(sI-A)^{-1}[\mathbf{x}_0+\mathbf{F}(s)]
}.
$$

The matrix $(sI-A)^{-1}$ is called the **resolvent** of $A$.

</details>

<details open>
<summary><strong>Expand The Two-By-Two Resolvent</strong></summary>

Let:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix}.
$$

Subtracting $A$ from $sI$ entry by entry gives:

$$
sI-A
=
\begin{bmatrix}
s-a&-b\\
-c&s-d
\end{bmatrix}.
$$

Its determinant is:

$$
\boxed{
D(s)=(s-a)(s-d)-bc
}.
$$

Using the inverse formula for a two-by-two matrix:

$$
\boxed{
(sI-A)^{-1}
=\frac1{D(s)}
\begin{bmatrix}
s-d&b\\
c&s-a
\end{bmatrix}
}.
$$

Multiplying this inverse by $\mathbf{x}_0+\mathbf{F}$ reproduces the same
formulas obtained by Cramer's rule.

</details>

<details open>
<summary><strong>Why The Determinant Matters</strong></summary>

The denominator:

$$
D(s)=\det(sI-A)
$$

is the characteristic polynomial of the system matrix, written in the
transform variable $s$.

Its factors determine the shared modes:

- a factor $s-r$ produces a mode $e^{rt}$
- a repeated factor $(s-r)^k$ can produce $t^je^{rt}$ terms
- a quadratic $(s+a)^2+b^2$ produces decaying or growing oscillations

Different components usually have different numerators, but they share the
same characteristic denominator after cancellation is accounted for.

</details>

<details open>
<summary><strong>A Concrete Resolvent Setup</strong></summary>

Consider:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&-3
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
2\\
-1
\end{bmatrix}.
$$

Form $sI-A$ entry by entry:

$$
sI-A
=
\begin{bmatrix}
s&-1\\
4&s+3
\end{bmatrix}.
$$

Transform the forcing vector:

$$
\mathbf{F}(s)
=
\begin{bmatrix}
0\\
\frac1{s+1}
\end{bmatrix}.
$$

Add the initial vector:

$$
\mathbf{x}_0+\mathbf{F}(s)
=
\begin{bmatrix}
2\\
-1+\frac1{s+1}
\end{bmatrix}.
$$

The complete transformed system is:

$$
\boxed{
\begin{bmatrix}
s&-1\\
4&s+3
\end{bmatrix}
\begin{bmatrix}X\\Y\end{bmatrix}
=
\begin{bmatrix}
2\\
-1+\frac1{s+1}
\end{bmatrix}
}.
$$

This matrix equation contains exactly the same information as two separately
transformed scalar equations.

</details>

<details open>
<summary><strong>The Bridge To Matrix Solution Methods</strong></summary>

This chapter solves for $\mathbf{X}(s)$ and then inverts its components.
Chapter 26 will instead work directly with the matrix exponential and related
time-domain formulas.

The two viewpoints are connected by the transform pair:

$$
\mathcal{L}\{e^{At}\}=(sI-A)^{-1},
$$

under the usual convergence conditions.

In simple terms:

> the resolvent is the Laplace-domain version of the matrix exponential.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The compact transformed system is $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$.
Its determinant controls the common modes, while its inverse or Cramer's rule
provides the individual component transforms.

</details>

---

## Block 8: Choosing A Reliable Route

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to choose an efficient algebraic method while preserving enough
detail for every component to remain checkable.

</details>

<details open>
<summary><strong>Choose The Algebra From The System Shape</strong></summary>

After transformation:

- use direct substitution when one equation already isolates a transform
- use elimination when a short multiple cancels one unknown cleanly
- use Cramer's rule for a general two-by-two system
- use dependency order for a triangular system
- use systematic elimination or a matrix inverse for a larger fully coupled
  system

No method changes the mathematics. The goal is to reduce unnecessary algebra
without skipping the algebra that explains where a transform came from.

</details>

<details open>
<summary><strong>Keep A Transform Ledger</strong></summary>

For each original unknown, record:

$$
u\leftrightarrow U,
\qquad
v\leftrightarrow V,
\qquad
w\leftrightarrow W.
$$

Beside it, record the derivative data:

$$
\begin{aligned}
u'&\longleftrightarrow sU-u(0),\\
v''&\longleftrightarrow s^2V-sv(0)-v'(0).
\end{aligned}
$$

This small ledger prevents an initial value belonging to one function from
being inserted into another function's derivative transform.

</details>

<details open>
<summary><strong>Verify Relations Between Components First</strong></summary>

If the system contains a simple relation such as:

$$
x'=y,
$$

check it before the more complicated rows. A proposed pair must satisfy:

$$
\frac{d}{dt}x(t)=y(t).
$$

For a derivative chain $x'=y$, $y'=z$, checking $x'=y$ and $y'=z$ confirms
two rows immediately. Only the final dynamic equation then needs a full
substitution.

</details>

<details open>
<summary><strong>Check Every Initial Component</strong></summary>

A system solution is a vector of functions. Checking only one initial value
is not sufficient.

For:

$$
\mathbf{x}(0)=
\begin{bmatrix}
2\\-1\\3
\end{bmatrix},
$$

verify all three statements:

$$
x_1(0)=2,
\qquad
x_2(0)=-1,
\qquad
x_3(0)=3.
$$

If a variable is constrained algebraically rather than assigned independently,
verify the constraint at $t=0$ instead.

</details>

<details open>
<summary><strong>Common Errors</strong></summary>

Watch for:

- using one capital transform letter for two different functions
- inserting $v(0)$ into an equation that contains $v$ but not $v'$
- changing the unknown order between transformed rows
- replacing the wrong determinant column in Cramer's rule
- using a different coefficient determinant for each component
- cancelling a factor in one transform and assuming it cancels in all others
- recovering a second transform from an old equation without restating it
- delaying only one component when coupling should transmit the delayed input
- checking one differential equation but not the rest of the system

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Use the shape of the transformed system to choose substitution, elimination,
determinants, or triangular back-substitution. Preserve transform order,
initial-value ownership, and local recovery formulas, then verify the solution
as a complete vector.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Two-Variable Foundations</strong></summary>

### Problem 1: Build The Transformed System

Transform, but do not solve:

$$
\begin{aligned}
a'&=-2a+3b+t,\\
b'&=a-b,
\end{aligned}
\qquad
a(0)=1,
\qquad
b(0)=-2.
$$

### Problem 2: Solve A Decoupled System

Use Laplace transforms to solve:

$$
u'=-u,
\qquad
v'=2v,
\qquad
u(0)=3,
\qquad
v(0)=-1.
$$

### Problem 3: Solve A Symmetric Coupled System

Use Laplace transforms to solve:

$$
\begin{aligned}
p'&=p+2q,\\
q'&=2p+q,
\end{aligned}
\qquad
p(0)=1,
\qquad
q(0)=0.
$$

### Problem 4: Solve A Scaled Oscillator

Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=2y,\\
y'&=-2x,
\end{aligned}
\qquad
x(0)=1,
\qquad
y(0)=-1.
$$

</details>

<details open>
<summary><strong>Problems 5 To 8: Forcing And Three Components</strong></summary>

### Problem 5: Solve A Forced Triangular Pair

Use Laplace transforms to solve:

$$
\begin{aligned}
u'&=-u+1,\\
v'&=u-v,
\end{aligned}
\qquad
u(0)=0,
\qquad
v(0)=0.
$$

### Problem 6: Delay A Triangular Response

Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=-x+y,\\
y'&=-y+u(t-1),
\end{aligned}
\qquad
x(0)=0,
\qquad
y(0)=0.
$$

### Problem 7: Solve A Three-Stage Decay Chain

Use Laplace transforms to solve:

$$
\begin{aligned}
p'&=-2p,\\
q'&=p-2q,\\
r'&=q-2r,
\end{aligned}
\qquad
p(0)=1,
\quad
q(0)=0,
\quad
r(0)=0.
$$

### Problem 8: Use A Derivative Chain

Use Laplace transforms to solve:

$$
\begin{aligned}
x'&=y,\\
y'&=z,\\
z'&=-z,
\end{aligned}
\qquad
x(0)=0,
\quad
y(0)=1,
\quad
z(0)=-1.
$$

</details>

<details open>
<summary><strong>Problems 9 To 12: Mixed Structures And Verification</strong></summary>

### Problem 9: Combine Second And First Derivatives

Use Laplace transforms to solve:

$$
\begin{aligned}
u''-v&=0,\\
v'+v&=0,
\end{aligned}
$$

with:

$$
u(0)=0,
\qquad
u'(0)=1,
\qquad
v(0)=2.
$$

### Problem 10: Use An Algebraic Constraint

Use Laplace transforms to solve:

$$
\begin{aligned}
u'+v&=1,\\
u+v&=0,
\end{aligned}
\qquad
u(0)=2.
$$

### Problem 11: Verify A Proposed Pair

Verify that:

$$
u(t)=e^{-t}\cos t,
\qquad
v(t)=-e^{-t}\sin t
$$

solves:

$$
u'=-u+v,
\qquad
v'=-u-v,
\qquad
u(0)=1,
\qquad
v(0)=0.
$$

### Problem 12: Write A Matrix Resolvent Setup

For:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-5&-2
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\e^{-t}
\end{bmatrix},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\0
\end{bmatrix},
$$

write $(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}$ explicitly and calculate
$\det(sI-A)$. Do not invert the component transforms.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Define $A(s)=\mathcal{L}\{a(t)\}$ and
$B(s)=\mathcal{L}\{b(t)\}$.

Transform the first equation:

$$
[sA-a(0)]=-2A+3B+\frac1{s^2}.
$$

Insert $a(0)=1$ and arrange the transforms in the order $A,B$:

$$
(s+2)A-3B=1+\frac1{s^2}.
$$

Transform the second equation:

$$
sB-b(0)=A-B.
$$

Insert $b(0)=-2$:

$$
sB-(-2)=A-B.
$$

Remove the double negative and arrange the transforms:

$$
-A+(s+1)B=-2.
$$

The requested transformed system is:

$$
\boxed{
\begin{aligned}
(s+2)A-3B&=1+\frac1{s^2},\\
-A+(s+1)B&=-2.
\end{aligned}
}
$$

### Answer 2

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$.

Transform $u'=-u$ and insert $u(0)=3$:

$$
sU-3=-U.
$$

Collect and solve for $U$:

$$
U=\frac3{s+1}.
$$

Transform $v'=2v$ and insert $v(0)=-1$:

$$
sV-(-1)=2V.
$$

Remove the double negative and solve:

$$
(s-2)V=-1,
\qquad
V=-\frac1{s-2}.
$$

Invert both transforms:

$$
\boxed{
u(t)=3e^{-t},
\qquad
v(t)=-e^{2t}
}.
$$

### Answer 3

Define $P=\mathcal{L}\{p\}$ and $Q=\mathcal{L}\{q\}$. Transform both
equations and insert the data:

$$
\begin{aligned}
(s-1)P-2Q&=1,\\
-2P+(s-1)Q&=0.
\end{aligned}
$$

The coefficient determinant is:

$$
\begin{aligned}
\Delta
&=(s-1)^2-4\\
&=(s-3)(s+1).
\end{aligned}
$$

For $P$, replace the first column by the right side:

$$
P=\frac{\begin{vmatrix}1&-2\\0&s-1\end{vmatrix}}{\Delta}
=\frac{s-1}{(s-3)(s+1)}.
$$

Write $P=A/(s-3)+B/(s+1)$ and multiply by the denominator:

$$
s-1=A(s+1)+B(s-3).
$$

Set $s=3$ to obtain $2=4A$, so $A=1/2$. Set $s=-1$ to obtain
$-2=-4B$, so $B=1/2$. Hence:

$$
P=\frac{1/2}{s-3}+\frac{1/2}{s+1}.
$$

For $Q$, replace the second column:

$$
Q=\frac{\begin{vmatrix}s-1&1\\-2&0\end{vmatrix}}{\Delta}
=\frac2{(s-3)(s+1)}.
$$

Write $Q=C/(s-3)+D/(s+1)$ and multiply by the denominator:

$$
2=C(s+1)+D(s-3).
$$

Set $s=3$ to obtain $2=4C$, so $C=1/2$. Set $s=-1$ to obtain
$2=-4D$, so $D=-1/2$. Hence:

$$
Q=\frac{1/2}{s-3}-\frac{1/2}{s+1}.
$$

Invert:

$$
\boxed{
\begin{aligned}
p(t)&=\frac12(e^{3t}+e^{-t}),\\
q(t)&=\frac12(e^{3t}-e^{-t}).
\end{aligned}
}
$$

### Answer 4

Transform the two equations using $x(0)=1$ and $y(0)=-1$:

$$
\begin{aligned}
sX-2Y&=1,\\
2X+sY&=-1.
\end{aligned}
$$

The coefficient determinant is:

$$
\Delta=s^2+4.
$$

Cramer's rule gives:

$$
\begin{aligned}
X
&=\frac{\begin{vmatrix}1&-2\\-1&s\end{vmatrix}}{s^2+4}
=\frac{s-2}{s^2+4},\\
Y
&=\frac{\begin{vmatrix}s&1\\2&-1\end{vmatrix}}{s^2+4}
=\frac{-s-2}{s^2+4}.
\end{aligned}
$$

Separate the sine and cosine numerators:

$$
X=\frac{s}{s^2+4}-\frac2{s^2+4},
\qquad
Y=-\frac{s}{s^2+4}-\frac2{s^2+4}.
$$

Invert:

$$
\boxed{
x(t)=\cos(2t)-\sin(2t),
\qquad
y(t)=-\cos(2t)-\sin(2t)
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Transform the first equation and insert $u(0)=0$:

$$
(s+1)U=\frac1s.
$$

Dividing by $s+1$ and decomposing gives:

$$
U=\frac1{s(s+1)}=\frac1s-\frac1{s+1}.
$$

Invert:

$$
u(t)=1-e^{-t}.
$$

Transform the second equation and insert $v(0)=0$:

$$
(s+1)V=U.
$$

Substitute the transform just found:

$$
V=\frac1{s(s+1)^2}.
$$

Use the self-contained decomposition:

$$
\frac1{s(s+1)^2}
=\frac1s-\frac1{s+1}-\frac1{(s+1)^2}.
$$

Invert:

$$
\boxed{
u(t)=1-e^{-t},
\qquad
v(t)=1-(1+t)e^{-t}
}.
$$

### Answer 6

Transform both equations with zero initial values:

$$
\begin{aligned}
(s+1)X-Y&=0,\\
(s+1)Y&=\frac{e^{-s}}s.
\end{aligned}
$$

Solve the second equation first:

$$
Y=e^{-s}\frac1{s(s+1)}.
$$

The undelayed inverse of $1/[s(s+1)]$ is $1-e^{-t}$. Apply the delay:

$$
y(t)=u(t-1)[1-e^{-(t-1)}].
$$

Use $(s+1)X=Y$:

$$
X=e^{-s}\frac1{s(s+1)^2}.
$$

The undelayed inverse is:

$$
1-(1+t)e^{-t}.
$$

Apply the same delay to the complete function:

$$
\boxed{
\begin{aligned}
x(t)&=u(t-1)\{1-[1+(t-1)]e^{-(t-1)}\},\\
y(t)&=u(t-1)[1-e^{-(t-1)}].
\end{aligned}
}
$$

### Answer 7

Define transforms $P,Q,R$. Transform in dependency order:

$$
\begin{aligned}
(s+2)P&=1,\\
(s+2)Q&=P,\\
(s+2)R&=Q.
\end{aligned}
$$

Solve successively:

$$
P=\frac1{s+2},
\qquad
Q=\frac1{(s+2)^2},
\qquad
R=\frac1{(s+2)^3}.
$$

Use the shifted-power transform pair to invert:

$$
\boxed{
p(t)=e^{-2t},
\qquad
q(t)=te^{-2t},
\qquad
r(t)=\frac{t^2}{2}e^{-2t}
}.
$$

### Answer 8

Transform the final equation first:

$$
sZ-z(0)=-Z.
$$

Insert $z(0)=-1$:

$$
sZ-(-1)=-Z.
$$

Remove the double negative and solve:

$$
(s+1)Z=-1,
\qquad
Z=-\frac1{s+1}.
$$

Transform $y'=z$ and insert $y(0)=1$:

$$
sY-1=Z.
$$

Substitute $Z=-1/(s+1)$:

$$
\begin{aligned}
Y
&=\frac{1+Z}{s}\\
&=\frac{1-\frac1{s+1}}s\\
&=\frac1{s+1}.
\end{aligned}
$$

Transform $x'=y$ and insert $x(0)=0$:

$$
sX=Y,
\qquad
X=\frac1{s(s+1)}.
$$

Invert all three transforms:

$$
\boxed{
x(t)=1-e^{-t},
\qquad
y(t)=e^{-t},
\qquad
z(t)=-e^{-t}
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Transform $v'+v=0$ and insert $v(0)=2$:

$$
(s+1)V=2,
\qquad
V=\frac2{s+1}.
$$

Transform $u''-v=0$ using $u(0)=0$ and $u'(0)=1$:

$$
[s^2U-1]-V=0.
$$

Move $-V$ to the right and substitute $V$:

$$
s^2U=1+\frac2{s+1}.
$$

Combine and divide:

$$
U=\frac{s+3}{s^2(s+1)}.
$$

Use:

$$
\frac{s+3}{s^2(s+1)}
=-\frac2s+\frac3{s^2}+\frac2{s+1}.
$$

Invert both components:

$$
\boxed{
u(t)=-2+3t+2e^{-t},
\qquad
v(t)=2e^{-t}
}.
$$

### Answer 10

Define $U=\mathcal{L}\{u\}$ and $V=\mathcal{L}\{v\}$. Transform the
differential equation:

$$
sU-2+V=\frac1s.
$$

Transform the algebraic constraint:

$$
U+V=0.
$$

The constraint gives $V=-U$. Substitute it into the first equation:

$$
sU-2-U=\frac1s.
$$

Collect $U$ and move $-2$ to the right:

$$
(s-1)U=2+\frac1s=\frac{2s+1}{s}.
$$

Divide and decompose:

$$
U=\frac{2s+1}{s(s-1)}
=-\frac1s+\frac3{s-1}.
$$

Invert $U$ and use $V=-U$:

$$
\boxed{
u(t)=-1+3e^t,
\qquad
v(t)=1-3e^t
}.
$$

### Answer 11

Differentiate the proposed $u$:

$$
\begin{aligned}
u'(t)
&=\frac{d}{dt}[e^{-t}\cos t]\\
&=-e^{-t}\cos t-e^{-t}\sin t.
\end{aligned}
$$

Calculate $-u+v$ from the proposed pair:

$$
\begin{aligned}
-u+v
&=-e^{-t}\cos t-e^{-t}\sin t\\
&=u'.
\end{aligned}
$$

Differentiate the proposed $v$:

$$
\begin{aligned}
v'(t)
&=\frac{d}{dt}[-e^{-t}\sin t]\\
&=e^{-t}\sin t-e^{-t}\cos t.
\end{aligned}
$$

Calculate $-u-v$:

$$
\begin{aligned}
-u-v
&=-e^{-t}\cos t+e^{-t}\sin t\\
&=v'.
\end{aligned}
$$

Finally:

$$
u(0)=1,
\qquad
v(0)=0.
$$

Both equations and both initial values are satisfied.

### Answer 12

The coefficient matrix is:

$$
A=
\begin{bmatrix}
0&1\\
-5&-2
\end{bmatrix}.
$$

Form $sI-A$:

$$
sI-A
=
\begin{bmatrix}
s&-1\\
5&s+2
\end{bmatrix}.
$$

Transform the forcing and add the initial vector:

$$
\mathbf{x}_0+\mathbf{F}(s)
=
\begin{bmatrix}1\\0\end{bmatrix}
+
\begin{bmatrix}0\\\frac1{s+1}\end{bmatrix}
=
\begin{bmatrix}1\\\frac1{s+1}\end{bmatrix}.
$$

The explicit transformed system is:

$$
\boxed{
\begin{bmatrix}
s&-1\\
5&s+2
\end{bmatrix}
\begin{bmatrix}X_1\\X_2\end{bmatrix}
=
\begin{bmatrix}1\\\frac1{s+1}\end{bmatrix}
}.
$$

Calculate the determinant:

$$
\begin{aligned}
\det(sI-A)
&=s(s+2)-(-1)(5)\\
&=s^2+2s+5\\
&=(s+1)^2+4.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Chapter 25 Final Summary</strong></summary>

For one transform per unknown function, a constant-coefficient system becomes
a simultaneous algebraic system. In matrix form:

$$
\boxed{
(sI-A)\mathbf{X}=\mathbf{x}_0+\mathbf{F}(s)
}.
$$

Solve transformed systems by substitution, elimination, Cramer's rule,
triangular dependency order, or a matrix inverse. The determinant
$\det(sI-A)$ reveals the shared modes, while component numerators determine
how strongly each mode appears in each unknown.

> transform each row carefully, solve all transforms consistently, and verify
> the result as one coupled vector rather than as unrelated scalar functions.

</details>
