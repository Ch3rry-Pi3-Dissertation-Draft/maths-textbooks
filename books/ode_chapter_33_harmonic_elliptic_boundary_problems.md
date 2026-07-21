# Harmonic Functions And Elliptic Boundary Problems

Chapter 32 explained how the principal part of a second-order PDE determines
whether the equation is hyperbolic, parabolic, or elliptic. We now focus on the
central elliptic model:

$$
\Delta u=0.
$$

Solutions of this equation are called harmonic functions. They are unusually
rigid: their interior values are controlled by surrounding values, they cannot
form an isolated interior peak or trough, and boundary data can determine them
uniquely.

This chapter will:

- define harmonic, subharmonic, and superharmonic functions
- verify harmonicity one derivative at a time
- explain the circle and disk mean-value properties
- connect averaging to the maximum and minimum principles
- distinguish weak and strong maximum principles
- prove uniqueness for the Dirichlet problem
- use comparison functions to obtain interior bounds
- extend the qualitative ideas to general elliptic operators
- distinguish existence from uniqueness
- solve a rectangular Dirichlet problem by separation of variables
- formulate Neumann and Robin boundary conditions
- derive the Neumann compatibility condition
- explain why pure Neumann solutions are unique only up to a constant
- use an energy identity as a second uniqueness argument
- build a reliable elliptic boundary-value workflow

---

## Block 1: Harmonic Functions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise harmonic functions, verify the Laplace equation
carefully, and understand the role of the domain.

> a harmonic function is in exact local balance: its curvature in one
> coordinate direction cancels its curvature in the other.

</details>

<details open>
<summary><strong>The Laplacian And The Domain</strong></summary>

For a twice continuously differentiable function $u=u(x,y)$, the
two-dimensional Laplacian is:

$$
\boxed{
\Delta u=u_{xx}+u_{yy}
}.
$$

Let $\Omega$ denote an open region in the plane. The function $u$ is
**harmonic in $\Omega$** when:

$$
\Delta u=0
$$

at every point of $\Omega$.

The domain is part of the statement. A formula can be harmonic on one region
and fail to be harmonic, or even fail to be defined, on a larger region.

</details>

<details open>
<summary><strong>A Polynomial Harmonic Function</strong></summary>

Consider:

$$
u(x,y)=x^2-y^2+3x-4y.
$$

For $u=x^2-y^2+3x-4y$, differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}
\left(x^2-y^2+3x-4y\right)\\
&=2x+3.
\end{aligned}
$$

Differentiate once more with respect to $x$:

$$
u_{xx}=2.
$$

Now differentiate the original function with respect to $y$:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}
\left(x^2-y^2+3x-4y\right)\\
&=-2y-4.
\end{aligned}
$$

Differentiate once more with respect to $y$:

$$
u_{yy}=-2.
$$

Add the second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=2+(-2)\\
&=0.
\end{aligned}
$$

Therefore:

$$
\boxed{
u(x,y)=x^2-y^2+3x-4y
\text{ is harmonic on }\mathbb R^2.
}
$$

</details>

<details open>
<summary><strong>A Function That Is Not Harmonic</strong></summary>

Consider:

$$
v(x,y)=x^2+y^2.
$$

Its second derivatives are:

$$
v_{xx}=2,
\qquad
v_{yy}=2.
$$

Hence:

$$
\begin{aligned}
\Delta v
&=v_{xx}+v_{yy}\\
&=2+2\\
&=4.
\end{aligned}
$$

Since $\Delta v\ne0$, the function is not harmonic.

The geometry agrees with the calculation: $x^2+y^2$ forms a bowl with an
interior minimum at the origin, whereas a nonconstant harmonic function cannot
have a strict interior minimum.

</details>

<details open>
<summary><strong>Harmonicity Can Depend On The Domain</strong></summary>

Let:

$$
u(x,y)=\log\sqrt{x^2+y^2}.
$$

Write:

$$
r=\sqrt{x^2+y^2},
$$

With $r=\sqrt{x^2+y^2}$, the function is $u=\log r$. In polar coordinates,
a radial function has Laplacian:

$$
\Delta u=u_{rr}+\frac1r u_r.
$$

Differentiate:

$$
u_r=\frac1r
$$

and:

$$
u_{rr}=-\frac1{r^2}.
$$

Substitute into the radial Laplacian:

$$
\begin{aligned}
\Delta u
&=-\frac1{r^2}+\frac1r\left(\frac1r\right)\\
&=-\frac1{r^2}+\frac1{r^2}\\
&=0.
\end{aligned}
$$

Thus $\log r$ is harmonic wherever $r>0$. It is not defined at $r=0$, so it is
not harmonic on any domain that includes the origin.

</details>

<details open>
<summary><strong>Linear Combinations Remain Harmonic</strong></summary>

Suppose $u$ and $v$ are harmonic in the same domain $\Omega$:

$$
\Delta u=0,
\qquad
\Delta v=0.
$$

Let $\alpha$ and $\beta$ be constants. By linearity of differentiation:

$$
\begin{aligned}
\Delta(\alpha u+\beta v)
&=(\alpha u+\beta v)_{xx}
+(\alpha u+\beta v)_{yy}\\
&=\alpha(u_{xx}+u_{yy})
+\beta(v_{xx}+v_{yy})\\
&=\alpha\Delta u+\beta\Delta v\\
&=0.
\end{aligned}
$$

Therefore every linear combination $\alpha u+\beta v$ is harmonic in
$\Omega$.

</details>

<details open>
<summary><strong>Real And Imaginary Parts Of Analytic Functions</strong></summary>

Let:

$$
f(z)=u(x,y)+iv(x,y),
\qquad
z=x+iy,
$$

and suppose $f$ is analytic. The Cauchy--Riemann equations are:

$$
u_x=v_y,
\qquad
u_y=-v_x.
$$

Differentiate the first equation with respect to $x$:

$$
u_{xx}=v_{yx}.
$$

Differentiate the second equation with respect to $y$:

$$
u_{yy}=-v_{xy}.
$$

Add the two second derivatives:

$$
\begin{aligned}
u_{xx}+u_{yy}
&=v_{yx}-v_{xy}\\
&=0,
\end{aligned}
$$

provided the mixed derivatives are continuous. Hence $u$ is harmonic. A
similar calculation shows that $v$ is harmonic.[^harmonic-conjugates]

[^harmonic-conjugates]: The functions $u$ and $v$ are called harmonic
    conjugates. This connection supplies many harmonic examples, but complex
    analysis is not required for the maximum-principle arguments in this
    chapter.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

A function is harmonic when $\Delta u=0$ throughout its domain. Always state
the domain, especially for formulas with singularities. Harmonic functions
form a linear family, and real or imaginary parts of analytic functions provide
an important source of examples.

</details>

---

## Block 2: The Mean-Value Property

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand the averaging property that drives much of the
qualitative behaviour of harmonic functions.

</details>

<details open>
<summary><strong>The Circle Mean-Value Formula</strong></summary>

Let $u$ be harmonic on a region containing the closed disk centred at
$(x_0,y_0)$ with radius $R$. For any $0<r\le R$:

$$
\boxed{
u(x_0,y_0)
=\frac1{2\pi}
\int_0^{2\pi}
u(x_0+r\cos\theta,\ y_0+r\sin\theta)\,d\theta
}.
$$

The point:

$$
(x_0+r\cos\theta,\ y_0+r\sin\theta)
$$

runs once around the circle of radius $r$. The formula says that the value at
the centre equals the average of the values around every such circle.

</details>

<details open>
<summary><strong>The Disk Mean-Value Formula</strong></summary>

The same centre value also equals the average over the entire disk
$B_r(x_0,y_0)$:

$$
\boxed{
u(x_0,y_0)
=\frac1{\pi r^2}
\iint_{B_r(x_0,y_0)}u(x,y)\,dA
}.
$$

The denominator $\pi r^2$ is the disk area. The circle formula averages around
one radius; the disk formula averages those circular averages over all radii
from $0$ to $r$.

The key intuition:

> a harmonic value is not free to move independently of its neighbours. It is
> locked to their average.

</details>

<details open>
<summary><strong>Verify A Circle Average Directly</strong></summary>

Consider the harmonic function:

$$
u(x,y)=3+2x-y+x^2-y^2.
$$

At the origin:

$$
u(0,0)=3.
$$

On the circle of radius $r$ centred at the origin, substitute:

$$
x=r\cos\theta,
\qquad
y=r\sin\theta.
$$

After substituting the circle coordinates:

$$
\begin{aligned}
u(r\cos\theta,r\sin\theta)
={}&3+2r\cos\theta-r\sin\theta\\
&+r^2\cos^2\theta-r^2\sin^2\theta.
\end{aligned}
$$

Average this expression:

$$
\begin{aligned}
\frac1{2\pi}\int_0^{2\pi}u\,d\theta
={}&3
+\frac{2r}{2\pi}\int_0^{2\pi}\cos\theta\,d\theta\\
&-\frac{r}{2\pi}\int_0^{2\pi}\sin\theta\,d\theta\\
&+\frac{r^2}{2\pi}
\int_0^{2\pi}(\cos^2\theta-\sin^2\theta)\,d\theta.
\end{aligned}
$$

Use:

$$
\int_0^{2\pi}\cos\theta\,d\theta=0,
\qquad
\int_0^{2\pi}\sin\theta\,d\theta=0
$$

and:

$$
\cos^2\theta-\sin^2\theta=\cos(2\theta),
$$

so:

$$
\int_0^{2\pi}(\cos^2\theta-\sin^2\theta)\,d\theta=0.
$$

Every nonconstant term averages to zero. Therefore:

$$
\frac1{2\pi}\int_0^{2\pi}u\,d\theta=3=u(0,0).
$$

</details>

<details open>
<summary><strong>Why An Interior Maximum Causes Trouble</strong></summary>

Suppose $u$ is harmonic and has a local maximum $M$ at an interior point
$P$. On a small circle around $P$:

$$
u\le M.
$$

The mean-value property also says:

$$
M=u(P)=\text{average of the values on the circle}.
$$

An average of numbers that are all at most $M$ can equal $M$ only if every
number being averaged is itself $M$. Therefore $u=M$ around the whole small
circle.

Repeating this argument through overlapping circles forces the same value to
propagate across a connected domain. This is the core idea behind the strong
maximum principle.

</details>

<details open>
<summary><strong>The Converse Is Also Powerful</strong></summary>

Under suitable continuity assumptions, a function that satisfies the
mean-value property on every sufficiently small disk is harmonic.

So the mean-value property is not merely a consequence of Laplace's equation.
It also characterises its solutions.

This fact explains why averaging algorithms can approximate harmonic
functions: replacing each interior value by a local neighbour average imitates
the defining balance.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For a harmonic function, the value at the centre of every contained circle or
disk equals the corresponding average. This averaging rule prevents isolated
interior peaks and troughs and leads directly to maximum principles.

</details>

---

## Block 3: Maximum, Minimum, And Comparison Principles

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn the mean-value intuition into precise tools for locating
extreme values, proving bounds, and establishing uniqueness.

</details>

<details open>
<summary><strong>The Weak Maximum And Minimum Principles</strong></summary>

Let $\Omega$ be a bounded connected domain, and suppose:

- $u$ is harmonic in $\Omega$
- $u$ is continuous on the closure $\overline\Omega$

Then:

$$
\boxed{
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
}
$$

and:

$$
\boxed{
\min_{\overline\Omega}u
=\min_{\partial\Omega}u
}.
$$

Here $\partial\Omega$ denotes the boundary. The theorem does not claim that
the maximum occurs at only one boundary point. It says that at least one
boundary point attains the global maximum, and similarly for the minimum.

</details>

<details open>
<summary><strong>The Strong Maximum Principle</strong></summary>

Suppose $u$ is harmonic in a connected domain $\Omega$. If $u$ attains a
maximum at an interior point, then:

$$
\boxed{
u\text{ is constant throughout }\Omega
}.
$$

The corresponding statement holds for an interior minimum.

Thus a nonconstant harmonic function cannot attain either global extreme in
the interior. It may have an interior saddle point, because a saddle is neither
a local maximum nor a local minimum.

</details>

<details open>
<summary><strong>Use Boundary Data To Bound Every Interior Value</strong></summary>

Suppose $u$ is harmonic in a bounded domain and its boundary values satisfy:

$$
-2\le u\le5
\qquad\text{on }\partial\Omega.
$$

The maximum principle gives:

$$
u\le5
\qquad\text{in }\overline\Omega.
$$

The minimum principle gives:

$$
u\ge-2
\qquad\text{in }\overline\Omega.
$$

Combine the two bounds:

$$
\boxed{
-2\le u(x,y)\le5
\quad\text{throughout }\overline\Omega
}.
$$

No explicit formula for $u$ was needed.

</details>

<details open>
<summary><strong>The Comparison Principle</strong></summary>

Let $u$ and $v$ be harmonic in $\Omega$ and continuous on
$\overline\Omega$. Suppose:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

Define their difference:

$$
w=u-v.
$$

By linearity:

$$
\begin{aligned}
\Delta w
&=\Delta(u-v)\\
&=\Delta u-\Delta v\\
&=0-0\\
&=0.
\end{aligned}
$$

Thus $w$ is harmonic. On the boundary:

$$
w=u-v\le0.
$$

The maximum principle gives:

$$
w\le0
\qquad\text{in }\Omega.
$$

Return to $w=u-v$:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

</details>

<details open>
<summary><strong>Uniqueness For The Dirichlet Problem</strong></summary>

Suppose $u_1$ and $u_2$ both satisfy:

$$
\Delta u=0
\qquad\text{in }\Omega
$$

with the same boundary data:

$$
u=g
\qquad\text{on }\partial\Omega.
$$

Define:

$$
w=u_1-u_2.
$$

Inside the domain:

$$
\begin{aligned}
\Delta w
&=\Delta u_1-\Delta u_2\\
&=0-0\\
&=0.
\end{aligned}
$$

On the boundary:

$$
\begin{aligned}
w
&=u_1-u_2\\
&=g-g\\
&=0.
\end{aligned}
$$

The maximum principle gives:

$$
\max_{\overline\Omega}w=0.
$$

Apply the same principle to $-w$, which is also harmonic and zero on the
boundary:

$$
\max_{\overline\Omega}(-w)=0.
$$

The last equation means:

$$
\min_{\overline\Omega}w=0.
$$

Therefore:

$$
0\le w\le0,
$$

so:

$$
w=0.
$$

Hence:

$$
\boxed{
u_1=u_2
}.
$$

The Dirichlet problem has at most one solution.

</details>

<details open>
<summary><strong>Subharmonic And Superharmonic Functions</strong></summary>

With the sign convention used here:

- $u$ is **subharmonic** when $\Delta u\ge0$
- $u$ is **superharmonic** when $\Delta u\le0$

A subharmonic function cannot have a strict interior maximum unless it is
constant in the relevant connected region. A superharmonic function cannot
have a strict interior minimum.

A concrete subharmonic example is:

$$
u(x,y)=x^2+y^2
$$

satisfies:

$$
\Delta u=4>0.
$$

It is subharmonic. It has an interior minimum at the origin, which is allowed,
but no interior maximum on a bounded disk.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Boundary values control harmonic functions throughout bounded domains. The
weak principles locate global extrema, the strong principle rules out
nonconstant interior extrema, and the comparison principle turns boundary
inequalities into interior inequalities. Applying these ideas to the
difference of two solutions proves uniqueness.

</details>

---

## Block 4: General Elliptic Operators

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to extend the qualitative picture beyond Laplace's equation and to
state clearly which coefficient conditions support a maximum principle.

</details>

<details open>
<summary><strong>A General Linear Operator</strong></summary>

Consider:

$$
\boxed{
L[u]
=a\,u_{xx}+2b\,u_{xy}+c\,u_{yy}
+d\,u_x+e\,u_y+q\,u
}.
$$

The coefficients may depend on $(x,y)$. The principal matrix is:

$$
M(x,y)=
\begin{pmatrix}
a&b\\
b&c
\end{pmatrix}.
$$

The first-order coefficients $d,e$ and the zero-order coefficient $q$ do not
change the elliptic classification. The principal matrix controls the type.

</details>

<details open>
<summary><strong>Positive Definiteness And Ellipticity</strong></summary>

For any direction vector:

$$
\zeta=
\begin{pmatrix}
\zeta_1\\
\zeta_2
\end{pmatrix},
$$

the principal quadratic form is:

$$
\zeta^T M\zeta
=a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2.
$$

The principal part is positive definite when:

$$
a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2>0
$$

for every nonzero vector $\zeta$.

For a symmetric $2\times2$ matrix, this is equivalent to:

$$
a>0
$$

and:

$$
ac-b^2>0.
$$

Since the PDE discriminant is $b^2-ac$, positive definiteness gives:

$$
b^2-ac<0.
$$

Thus the equation is elliptic.

</details>

<details open>
<summary><strong>Uniform Ellipticity</strong></summary>

Pointwise ellipticity says the principal quadratic form is positive at each
point. **Uniform ellipticity** requires one fixed constant $\lambda>0$ such
that:

$$
\boxed{
a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2
\ge\lambda(\zeta_1^2+\zeta_2^2)
}
$$

for every point in the domain and every vector $\zeta$.

The constant $\lambda$ prevents the ellipticity from weakening to zero near
some part of the domain. Uniform control is important in general maximum
principles and estimates.

</details>

<details open>
<summary><strong>A Worked Uniform-Ellipticity Check</strong></summary>

Consider the principal part:

$$
(2+x^2)u_{xx}+2xy\,u_{xy}+(3+y^2)u_{yy}.
$$

Here:

$$
a=2+x^2,
\qquad
b=xy,
\qquad
c=3+y^2.
$$

For a vector $\zeta=(\zeta_1,\zeta_2)^T$, form:

$$
\begin{aligned}
Q
={}&(2+x^2)\zeta_1^2
+2xy\zeta_1\zeta_2
+(3+y^2)\zeta_2^2.
\end{aligned}
$$

Group the variable-coefficient terms into a square:

$$
\begin{aligned}
Q
={}&2\zeta_1^2+3\zeta_2^2\\
&+x^2\zeta_1^2
+2xy\zeta_1\zeta_2
+y^2\zeta_2^2\\
={}&2\zeta_1^2+3\zeta_2^2
+(x\zeta_1+y\zeta_2)^2.
\end{aligned}
$$

Since every square is nonnegative:

$$
Q\ge2\zeta_1^2+3\zeta_2^2.
$$

Also:

$$
2\zeta_1^2+3\zeta_2^2
\ge2(\zeta_1^2+\zeta_2^2).
$$

Therefore:

$$
\boxed{
Q\ge2|\zeta|^2
}.
$$

The operator is uniformly elliptic with $\lambda=2$.

</details>

<details open>
<summary><strong>A Maximum Principle For A General Operator</strong></summary>

Suppose the principal part is uniformly elliptic and the coefficients are
regular enough for the classical maximum principle.

In the especially transparent case:

$$
q=0,
$$

Under the assumption $q=0$, suppose:

$$
L[u]\ge0
\qquad\text{in }\Omega,
$$

then $u$ cannot have a strict positive interior maximum unless it is constant.
Boundary values therefore control the maximum.

When:

$$
q\le0,
$$

a closely related statement holds: a positive interior maximum is still ruled
out under the standard hypotheses. The sign restriction on the zero-order term
is essential rather than cosmetic.

</details>

<details open>
<summary><strong>Why The Zero-Order Sign Matters</strong></summary>

Consider the square:

$$
\Omega=(0,\pi)\times(0,\pi)
$$

and the function:

$$
u(x,y)=\sin x\sin y.
$$

It vanishes on the entire boundary. Differentiate:

$$
u_{xx}=-\sin x\sin y=-u
$$

The second $y$-derivative is:

$$
u_{yy}=-\sin x\sin y=-u.
$$

Therefore:

$$
\Delta u=-2u.
$$

Rearrange:

$$
\Delta u+2u=0.
$$

The zero-order coefficient is $q=2>0$. Although the boundary data are zero,
$u$ is positive inside the square and reaches an interior maximum of $1$ at:

$$
\left(\frac\pi2,\frac\pi2\right).
$$

This example shows why a maximum principle for $L[u]$ cannot ignore the sign
of $q$.

</details>

<details open>
<summary><strong>Comparison For The Same Elliptic Operator</strong></summary>

Suppose $q=0$, and let $u,v$ satisfy:

$$
L[u]\ge L[v]
\qquad\text{in }\Omega
$$

and on the boundary:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

Define:

$$
w=u-v.
$$

Linearity gives:

$$
L[w]=L[u]-L[v]\ge0.
$$

On the boundary:

$$
w\le0.
$$

The general maximum principle then gives:

$$
w\le0
\qquad\text{in }\Omega.
$$

Hence:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

General elliptic operators are controlled by a positive-definite principal
matrix. Uniform ellipticity supplies a fixed lower bound in every direction.
First-order terms do not alter the type, while the zero-order coefficient
requires the correct sign for a standard maximum principle.

</details>

---

## Block 5: The Dirichlet Problem

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to formulate elliptic boundary-value problems precisely, separate
existence from uniqueness, and construct one explicit rectangular solution.

</details>

<details open>
<summary><strong>Laplace And Poisson Dirichlet Problems</strong></summary>

The Laplace Dirichlet problem prescribes:

$$
\begin{cases}
\Delta u=0,&(x,y)\in\Omega,\\
u=g,&(x,y)\in\partial\Omega.
\end{cases}
$$

The boundary function $g$ specifies the value of $u$ along the boundary.

The Poisson Dirichlet problem includes a forcing term:

$$
\begin{cases}
\Delta u=f,&(x,y)\in\Omega,\\
u=g,&(x,y)\in\partial\Omega.
\end{cases}
$$

The unknown is not only a formula satisfying the PDE. It must satisfy the
entire boundary prescription as well.

</details>

<details open>
<summary><strong>Existence And Uniqueness Are Different Questions</strong></summary>

A uniqueness proof says:

> if a solution exists, there cannot be two different solutions with the same
> data.

It does not automatically produce a solution.

An existence argument must construct a solution or invoke a theorem whose
hypotheses guarantee one. Boundary regularity and compatibility at corners can
matter.[^corner-data]

[^corner-data]: On a rectangle, boundary formulas meeting at one corner should
    normally assign the same corner value when a solution continuous on the
    closed rectangle is required.

</details>

<details open>
<summary><strong>A Rectangular Dirichlet Problem</strong></summary>

Solve:

$$
u_{xx}+u_{yy}=0
$$

on:

$$
0<x<\pi,
\qquad
0<y<1,
$$

with boundary data:

$$
u(0,y)=0,
\qquad
u(\pi,y)=0,
$$

$$
u(x,0)=0,
\qquad
u(x,1)=\sin(2x).
$$

The side and bottom values are zero. The top edge supplies one sine mode.

</details>

<details open>
<summary><strong>Separate The Rectangular Problem</strong></summary>

Seek:

$$
u(x,y)=X(x)Y(y).
$$

Then:

$$
u_{xx}=X''(x)Y(y)
$$

The second derivative with respect to $y$ is:

$$
u_{yy}=X(x)Y''(y).
$$

Substitute into Laplace's equation:

$$
X''Y+XY''=0.
$$

For a nontrivial product, divide by $XY$:

$$
\frac{X''}{X}+\frac{Y''}{Y}=0.
$$

Move the $Y$ ratio to the other side:

$$
\frac{X''}{X}=-\frac{Y''}{Y}.
$$

The left side depends only on $x$, while the right side depends only on $y$.
Set both sides equal to $-\lambda$:

$$
\frac{X''}{X}=-\lambda
$$

and:

$$
-\frac{Y''}{Y}=-\lambda.
$$

Therefore:

$$
X''+\lambda X=0
$$

The corresponding $Y$-equation is:

$$
Y''-\lambda Y=0.
$$

</details>

<details open>
<summary><strong>Use The X-Boundary Conditions</strong></summary>

The conditions:

$$
u(0,y)=u(\pi,y)=0
$$

require:

$$
X(0)=X(\pi)=0.
$$

As in the fixed-end eigenvalue problem:

$$
\lambda_n=n^2,
\qquad
X_n(x)=\sin(nx),
\qquad
n=1,2,3,\ldots.
$$

The top boundary value is:

$$
\sin(2x).
$$

Therefore only the mode $n=2$ is needed:

$$
\lambda=4,
\qquad
X(x)=\sin(2x).
$$

The corresponding $Y$ equation is:

$$
Y''-4Y=0.
$$

</details>

<details open>
<summary><strong>Solve The Y-Equation And Apply Both Horizontal Edges</strong></summary>

The general solution of:

$$
Y''-4Y=0
$$

is:

$$
Y(y)=C\cosh(2y)+D\sinh(2y).
$$

The bottom condition $u(x,0)=0$ requires:

$$
Y(0)=0.
$$

Substitute $y=0$:

$$
\begin{aligned}
Y(0)
&=C\cosh0+D\sinh0\\
&=C.
\end{aligned}
$$

Hence:

$$
C=0.
$$

Thus:

$$
Y(y)=D\sinh(2y).
$$

The top condition $u(x,1)=\sin(2x)$ requires:

$$
X(x)Y(1)=\sin(2x).
$$

Insert $X(x)=\sin(2x)$:

$$
\sin(2x)Y(1)=\sin(2x).
$$

Therefore:

$$
Y(1)=1.
$$

Use $Y(1)=D\sinh2$:

$$
D\sinh2=1.
$$

Solve for $D$:

$$
D=\frac1{\sinh2}.
$$

Hence:

$$
Y(y)=\frac{\sinh(2y)}{\sinh2}.
$$

</details>

<details open>
<summary><strong>Assemble And Verify The Dirichlet Solution</strong></summary>

Multiply the two separated factors:

$$
\boxed{
u(x,y)
=\sin(2x)\frac{\sinh(2y)}{\sinh2}
}.
$$

For
$u=\sin(2x)\sinh(2y)/\sinh2$,
differentiate twice with respect to $x$:

$$
u_{xx}
=-4\sin(2x)\frac{\sinh(2y)}{\sinh2}.
$$

Differentiate twice with respect to $y$:

$$
u_{yy}
=4\sin(2x)\frac{\sinh(2y)}{\sinh2}.
$$

Add the two second derivatives:

$$
u_{xx}+u_{yy}=0.
$$

Now check each edge. At $x=0$ and $x=\pi$:

$$
\sin(2x)=0.
$$

Thus:

$$
u(0,y)=u(\pi,y)=0.
$$

At $y=0$:

$$
\sinh(0)=0,
$$

so:

$$
u(x,0)=0.
$$

At $y=1$:

$$
\frac{\sinh(2)}{\sinh2}=1,
$$

so:

$$
u(x,1)=\sin(2x).
$$

The PDE and all four boundary conditions are satisfied.

</details>

<details open>
<summary><strong>A Qualitative Check Before Any Differentiation</strong></summary>

The boundary values lie between $-1$ and $1$. Since the solution is harmonic,
the maximum and minimum principles imply:

$$
\boxed{
-1\le u(x,y)\le1
}.
$$

This does not verify the exact formula, but it supplies a fast error check. A
candidate exceeding $1$ inside the rectangle could not be the required
harmonic solution.

</details>

<details open>
<summary><strong>A Simple Poisson Problem</strong></summary>

On the unit disk:

$$
x^2+y^2<1,
$$

consider:

$$
u(x,y)=1-x^2-y^2.
$$

For $u=1-x^2-y^2$, the second derivatives are:

$$
u_{xx}=-2,
\qquad
u_{yy}=-2.
$$

Therefore:

$$
\Delta u=-4.
$$

On the unit circle $x^2+y^2=1$:

$$
u=1-1=0.
$$

Hence $u$ solves:

$$
\begin{cases}
\Delta u=-4,&x^2+y^2<1,\\
u=0,&x^2+y^2=1.
\end{cases}
$$

The function has a positive interior maximum at the origin. This does not
contradict the harmonic maximum principle because the equation is forced:
$\Delta u=-4$, not $\Delta u=0$.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A Dirichlet problem prescribes the value of the solution on the boundary.
Maximum principles often prove uniqueness and bounds, while separation of
variables can construct solutions on suitable geometries. Poisson forcing can
change which interior extrema are possible.

</details>

---

## Block 6: Neumann And Robin Boundary Data

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret normal derivatives, derive the compatibility
condition for a pure Neumann problem, and explain its additive-constant
ambiguity.

</details>

<details open>
<summary><strong>The Outward Normal Derivative</strong></summary>

Let:

$$
\mathbf n=(n_1,n_2)
$$

be the outward unit normal on $\partial\Omega$. The normal derivative is:

$$
\boxed{
\frac{\partial u}{\partial n}
=\nabla u\cdot\mathbf n
=u_xn_1+u_yn_2
}.
$$

It measures the directional rate of change as one moves outward through the
boundary.

For heat flow, a normal derivative is related to flux across the boundary.
The sign depends on the physical flux convention.

</details>

<details open>
<summary><strong>Normals On A Rectangle</strong></summary>

For:

$$
\Omega=(0,L)\times(0,H),
$$

the outward normals are:

$$
\begin{array}{c|c|c}
\text{edge}&\mathbf n&\partial u/\partial n\\
\hline
x=0&(-1,0)&-u_x\\
x=L&(1,0)&u_x\\
y=0&(0,-1)&-u_y\\
y=H&(0,1)&u_y
\end{array}
$$

The minus signs on the left and bottom edges come from the outward direction,
not from a new differentiation rule.

</details>

<details open>
<summary><strong>The Pure Neumann Problem</strong></summary>

A Poisson--Neumann problem has the form:

$$
\begin{cases}
\Delta u=f,&\text{in }\Omega,\\
\dfrac{\partial u}{\partial n}=g,&\text{on }\partial\Omega.
\end{cases}
$$

The PDE specifies the interior source $f$, while $g$ specifies the outward
normal derivative on the boundary.

These data cannot be chosen independently. They must satisfy a compatibility
condition.

</details>

<details open>
<summary><strong>Derive The Neumann Compatibility Condition</strong></summary>

Integrate the PDE $\Delta u=f$ over $\Omega$:

$$
\iint_\Omega\Delta u\,dA
=\iint_\Omega f\,dA.
$$

Write the Laplacian as a divergence:

$$
\Delta u=\nabla\cdot(\nabla u).
$$

The divergence theorem then gives:

$$
\iint_\Omega\Delta u\,dA
=\int_{\partial\Omega}\nabla u\cdot\mathbf n\,ds.
$$

Use:

$$
\nabla u\cdot\mathbf n
=\frac{\partial u}{\partial n}
=g.
$$

Therefore:

$$
\boxed{
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds
}.
$$

The total source inside must equal the total outward normal derivative across
the boundary.[^neumann-balance]

[^neumann-balance]: This is a global balance law. If the interior creates a
    net amount of a quantity, the boundary must carry the same net amount
    outward in a steady state.

</details>

<details open>
<summary><strong>A Compatible Neumann Example On The Unit Disk</strong></summary>

Let:

$$
\Omega=\{(x,y):x^2+y^2<1\}
$$

and consider:

$$
u(x,y)=x^2+y^2.
$$

Its Laplacian is:

$$
\Delta u=2+2=4.
$$

On the unit circle, the outward unit normal is:

$$
\mathbf n=(x,y).
$$

The gradient is:

$$
\nabla u=(2x,2y).
$$

Therefore:

$$
\begin{aligned}
\frac{\partial u}{\partial n}
&=\nabla u\cdot\mathbf n\\
&=(2x,2y)\cdot(x,y)\\
&=2x^2+2y^2\\
&=2.
\end{aligned}
$$

Check the interior integral:

$$
\iint_\Omega4\,dA
=4(\text{area of the unit disk})
=4\pi.
$$

Check the boundary integral:

$$
\int_{\partial\Omega}2\,ds
=2(\text{circumference of the unit circle})
=2(2\pi)
=4\pi.
$$

The compatibility condition holds.

</details>

<details open>
<summary><strong>Why Pure Neumann Solutions Are Not Unique</strong></summary>

Suppose $u$ solves:

$$
\Delta u=f,
\qquad
\frac{\partial u}{\partial n}=g.
$$

Let $C$ be any constant and define:

$$
v=u+C.
$$

Since derivatives of $C$ vanish:

$$
\Delta v
=\Delta(u+C)
=\Delta u
=f.
$$

Similarly:

$$
\frac{\partial v}{\partial n}
=\frac{\partial}{\partial n}(u+C)
=\frac{\partial u}{\partial n}
=g.
$$

Thus $u+C$ satisfies exactly the same Neumann problem.

For the disk example, the full family is:

$$
\boxed{
u(x,y)=x^2+y^2+C
}.
$$

A normalisation such as:

$$
\iint_\Omega u\,dA=0
$$

can be added to select one member of the family.

</details>

<details open>
<summary><strong>An Incompatible Neumann Problem</strong></summary>

On the unit disk, suppose:

$$
\Delta u=1
$$

and:

$$
\frac{\partial u}{\partial n}=0
$$

on the boundary.

The interior source integral is:

$$
\iint_\Omega1\,dA=\pi.
$$

The boundary integral is:

$$
\int_{\partial\Omega}0\,ds=0.
$$

The required integrals are therefore $\pi$ and $0$. Because $\pi\ne0$, they do
not agree, so the compatibility condition fails. Therefore no sufficiently
smooth solution exists.

</details>

<details open>
<summary><strong>Robin Boundary Data</strong></summary>

A Robin condition combines the value and normal derivative:

$$
\boxed{
\alpha u+\beta\frac{\partial u}{\partial n}=g
\quad\text{on }\partial\Omega
}.
$$

Dirichlet data are recovered when $\beta=0$. Neumann data are recovered when
$\alpha=0$.

When $\alpha$ is nonzero, adding an arbitrary constant usually changes the
boundary condition. Robin data can therefore remove the additive ambiguity of
a pure Neumann problem.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Neumann data prescribe outward normal derivatives rather than values. A pure
Neumann problem requires the global balance
$\iint_\Omega f\,dA=\int_{\partial\Omega}g\,ds$ and, when solvable, determines
the solution only up to an additive constant. Robin data mix value and flux.

</details>

---

## Block 7: Energy Identities And Uniqueness

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to prove uniqueness in a second way, using an integral that measures
how much the solution varies through the domain.

</details>

<details open>
<summary><strong>Build The Basic Energy Identity</strong></summary>

Let $w$ be twice continuously differentiable. Apply the product rule to the
vector field $w\nabla w$:

$$
\begin{aligned}
\nabla\cdot(w\nabla w)
&=\nabla w\cdot\nabla w+w\,\nabla\cdot(\nabla w)\\
&=|\nabla w|^2+w\Delta w.
\end{aligned}
$$

Integrate over $\Omega$:

$$
\iint_\Omega\nabla\cdot(w\nabla w)\,dA
=\iint_\Omega|\nabla w|^2\,dA
+\iint_\Omega w\Delta w\,dA.
$$

The divergence theorem transforms the left side:

$$
\iint_\Omega\nabla\cdot(w\nabla w)\,dA
=\int_{\partial\Omega}w\nabla w\cdot\mathbf n\,ds.
$$

Recognise the normal derivative:

$$
\nabla w\cdot\mathbf n
=\frac{\partial w}{\partial n},
$$

we obtain:

$$
\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
=\iint_\Omega|\nabla w|^2\,dA
+\iint_\Omega w\Delta w\,dA.
$$

Rearranging the integrated product identity gives:

$$
\boxed{
\iint_\Omega|\nabla w|^2\,dA
=\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w\Delta w\,dA
}.
$$

This is a special case of Green's first identity.

</details>

<details open>
<summary><strong>Dirichlet Uniqueness From Energy</strong></summary>

Suppose $u_1$ and $u_2$ solve the same Poisson--Dirichlet problem:

$$
\Delta u=f
\qquad\text{in }\Omega,
$$

$$
u=g
\qquad\text{on }\partial\Omega.
$$

Define:

$$
w=u_1-u_2.
$$

Subtract the two PDEs:

$$
\begin{aligned}
\Delta w
&=\Delta u_1-\Delta u_2\\
&=f-f\\
&=0.
\end{aligned}
$$

Subtract the boundary data:

$$
w=g-g=0
\qquad\text{on }\partial\Omega.
$$

Insert $\Delta w=0$ and $w=0$ on the boundary into the energy identity:

$$
\begin{aligned}
\iint_\Omega|\nabla w|^2\,dA
&=\int_{\partial\Omega}
0\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w(0)\,dA\\
&=0.
\end{aligned}
$$

The integrand $|\nabla w|^2$ is nonnegative. Its integral can be zero only when:

$$
\nabla w=0
$$

throughout the connected domain. Therefore $w$ is constant. Since $w=0$ on
the boundary, that constant is zero:

$$
w=0.
$$

Hence:

$$
\boxed{u_1=u_2.}
$$

</details>

<details open>
<summary><strong>Neumann Uniqueness Up To A Constant</strong></summary>

Suppose $u_1$ and $u_2$ solve the same Poisson--Neumann problem. Their
difference:

$$
w=u_1-u_2
$$

satisfies:

$$
\Delta w=0
\qquad\text{in }\Omega
$$

The same difference also satisfies the zero Neumann data:

$$
\frac{\partial w}{\partial n}=0
\qquad\text{on }\partial\Omega.
$$

Insert these conditions into the energy identity:

$$
\begin{aligned}
\iint_\Omega|\nabla w|^2\,dA
&=\int_{\partial\Omega}w(0)\,ds
-\iint_\Omega w(0)\,dA\\
&=0.
\end{aligned}
$$

Therefore:

$$
\nabla w=0,
$$

so $w$ is constant:

$$
w=C.
$$

Thus:

$$
\boxed{
u_1=u_2+C
}.
$$

The energy proof identifies exactly the same ambiguity found by directly
adding a constant.

</details>

<details open>
<summary><strong>The Energy Interpretation</strong></summary>

The quantity:

$$
E[w]=\iint_\Omega|\nabla w|^2\,dA
$$

is the Dirichlet energy. It is zero only for a constant function on a connected
domain.

Harmonic functions can also be characterised as functions that minimise this
energy among functions with fixed boundary values. That variational viewpoint
will become useful in more advanced elliptic theory.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Green's identity converts a PDE and its boundary data into an integral of
$|\nabla w|^2$. Zero Dirichlet data force the difference of two solutions to be
zero. Zero Neumann data force only its gradient to vanish, leaving an arbitrary
constant.

</details>

---

## Block 8: Geometry, Multiple Boundaries, And Radial Harmonic Functions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to apply the qualitative theory on an annulus and to show how each
boundary component participates in the maximum principle.

</details>

<details open>
<summary><strong>A Radial Laplace Equation</strong></summary>

Suppose:

$$
u=u(r)
$$

depends only on:

$$
r=\sqrt{x^2+y^2}.
$$

In two dimensions:

$$
\Delta u=u_{rr}+\frac1r u_r.
$$

Set $\Delta u=0$:

$$
u_{rr}+\frac1r u_r=0.
$$

Multiply by $r$:

$$
r u_{rr}+u_r=0.
$$

Recognise the product derivative:

$$
\frac{d}{dr}(r u_r)=r u_{rr}+u_r.
$$

Therefore:

$$
\frac{d}{dr}(r u_r)=0.
$$

Integrate once:

$$
r u_r=A,
$$

where $A$ is a constant. Divide by $r>0$:

$$
u_r=\frac{A}{r}.
$$

Integrate again:

$$
\boxed{
u(r)=A\log r+B
}.
$$

</details>

<details open>
<summary><strong>A Dirichlet Problem On An Annulus</strong></summary>

Let:

$$
\Omega=\{(x,y):a<r<b\},
\qquad
0<a<b.
$$

Solve:

$$
\Delta u=0
$$

with:

$$
u=0
\qquad\text{on }r=a
$$

and:

$$
u=1
\qquad\text{on }r=b.
$$

Use the radial family:

$$
u(r)=A\log r+B.
$$

Apply $u(a)=0$:

$$
A\log a+B=0.
$$

Apply $u(b)=1$:

$$
A\log b+B=1.
$$

Subtract the first equation from the second:

$$
A(\log b-\log a)=1.
$$

Use:

$$
\log b-\log a=\log\left(\frac ba\right).
$$

Therefore:

$$
A\log\left(\frac ba\right)=1.
$$

Solve for $A$:

$$
A=\frac1{\log(b/a)}.
$$

From $A\log a+B=0$:

$$
B=-A\log a.
$$

Substitute $A$ and combine the logarithms:

$$
\begin{aligned}
u(r)
&=\frac{\log r-\log a}{\log(b/a)}\\
&=\frac{\log(r/a)}{\log(b/a)}.
\end{aligned}
$$

Substituting the calculated constants gives the annular solution:

$$
\boxed{
u(r)=\frac{\log(r/a)}{\log(b/a)}
}.
$$

</details>

<details open>
<summary><strong>Check The Annular Bounds</strong></summary>

For $a<r<b$:

$$
1<\frac ra<\frac ba.
$$

Since the logarithm is increasing:

$$
0<\log(r/a)<\log(b/a).
$$

Divide by the positive number $\log(b/a)$:

$$
0<
\frac{\log(r/a)}{\log(b/a)}
<1.
$$

The logarithmic inequalities therefore give:

$$
\boxed{
0<u(r)<1
\qquad\text{inside the annulus}
}.
$$

This agrees with the strong maximum principle. The values $0$ and $1$ occur on
the two different boundary components, not at interior points.

</details>

<details open>
<summary><strong>Boundary Means Every Boundary Component</strong></summary>

An annulus has:

- an outer boundary $r=b$
- an inner boundary $r=a$

When a maximum principle refers to $\partial\Omega$, it includes both. Ignoring
the inner circle would discard part of the data and could produce incorrect
bounds or a different boundary-value problem.

</details>

<details open>
<summary><strong>Interior Critical Points Can Still Be Saddles</strong></summary>

Return to:

$$
u(x,y)=x^2-y^2.
$$

Its gradient is:

$$
\nabla u=(2x,-2y).
$$

At the origin:

$$
\nabla u(0,0)=(0,0).
$$

Along the $x$-axis:

$$
u(x,0)=x^2\ge0.
$$

Along the $y$-axis:

$$
u(0,y)=-y^2\le0.
$$

Thus the origin is a saddle point, not a maximum or minimum. Maximum principles
do not forbid interior critical points; they forbid nonconstant interior
extrema.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Radial harmonic functions in two dimensions have the form $A\log r+B$ away
from the origin. On a domain with holes, every boundary component contributes
to the boundary data and the global extrema. Interior saddle points remain
possible.

</details>

---

## Block 9: A Reliable Elliptic-Problem Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to organise classification, boundary data, qualitative checks, and
verification into one dependable sequence.

</details>

<details open>
<summary><strong>The Full Workflow</strong></summary>

**Step 1: State the domain.** Identify $\Omega$, its boundary
$\partial\Omega$, and every separate boundary component.

**Step 2: Identify the principal part.** Confirm that the equation is elliptic
on the entire region where the theorem or method will be used.

**Step 3: Record the forcing.** Distinguish:

$$
\Delta u=0
$$

from:

$$
\Delta u=f.
$$

**Step 4: Classify the boundary data.**

- Dirichlet: prescribe $u$
- Neumann: prescribe $\partial u/\partial n$
- Robin: prescribe a linear combination of both

**Step 5: Run compatibility checks.** For a pure Neumann problem, verify:

$$
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds.
$$

**Step 6: Predict qualitative bounds.** Use boundary extrema, comparison
functions, and the sign of $\Delta u$ or $L[u]$.

**Step 7: Choose a construction method.** Geometry may suggest separation of
variables, radial coordinates, a transform, or a numerical method.

**Step 8: Apply every boundary condition locally.** On a rectangle, check all
four edges separately. On a domain with holes, check every boundary component.

**Step 9: Verify the PDE.** Calculate all required derivatives and substitute
them into the original equation.

**Step 10: Verify uniqueness separately.** Use a maximum principle, comparison
principle, or energy identity.

**Step 11: Check the result against the predicted bounds.** A formula that
violates a maximum-principle bound is wrong even if part of its algebra looks
plausible.

</details>

<details open>
<summary><strong>Common Mistake: Applying A Harmonic Principle To A Forced PDE</strong></summary>

The statement:

$$
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
$$

applies to harmonic $u$ under the stated hypotheses. If:

$$
\Delta u=f\ne0,
$$

the sign of $f$ matters. Do not quote the harmonic result without checking the
actual equation.

</details>

<details open>
<summary><strong>Common Mistake: Proving Uniqueness And Claiming Existence</strong></summary>

If the difference of two possible solutions must be zero, then the problem has
**at most one** solution.

This argument does not show that any solution exists. Construction and
uniqueness are separate tasks.

</details>

<details open>
<summary><strong>Common Mistake: Forgetting The Normal Direction</strong></summary>

On the left edge $x=0$ of a rectangle, the outward normal is $(-1,0)$.
Therefore:

$$
\frac{\partial u}{\partial n}=-u_x,
$$

not $u_x$.

Always calculate $\nabla u\cdot\mathbf n$ rather than guessing the sign.

</details>

<details open>
<summary><strong>Common Mistake: Expecting Pure Neumann Uniqueness</strong></summary>

If only derivatives are prescribed, adding a constant changes neither the PDE
nor the boundary flux. A pure Neumann problem needs a normalisation to select a
single representative.

</details>

<details open>
<summary><strong>Common Mistake: Ignoring An Inner Boundary</strong></summary>

For an annulus:

$$
\Omega=\{a<r<b\},
$$

the boundary is:

$$
\partial\Omega=\{r=a\}\cup\{r=b\}.
$$

Both circles matter in boundary extrema, compatibility integrals, and boundary
conditions.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

The dependable chain is:

> domain $\longrightarrow$ ellipticity $\longrightarrow$ forcing
> $\longrightarrow$ boundary-data type $\longrightarrow$ compatibility and
> qualitative bounds $\longrightarrow$ construction $\longrightarrow$
> verification $\longrightarrow$ uniqueness.

Do not let an explicit formula replace the domain and boundary checks.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Harmonicity And Mean Values</strong></summary>

### Problem 1: Verify A Cubic Harmonic Function

Show that:

$$
u(x,y)=x^3-3xy^2
$$

is harmonic on $\mathbb R^2$.

### Problem 2: State The Correct Domain

Determine where:

$$
u(x,y)=\log\sqrt{(x-1)^2+(y+2)^2}
$$

is harmonic.

### Problem 3: Calculate A Circle Average

For:

$$
u(x,y)=5+x-2y+xy,
$$

calculate the average on the circle
$x=r\cos\theta$, $y=r\sin\theta$ and compare it with $u(0,0)$.

### Problem 4: Bound A Harmonic Function

Suppose $u$ is harmonic in a bounded domain, continuous on its closure, and:

$$
1\le u\le7
$$

on the boundary. What can be concluded inside the domain?

</details>

<details open>
<summary><strong>Problems 5 To 8: Comparison, Ellipticity, And Dirichlet Data</strong></summary>

### Problem 5: Prove A Comparison

Suppose $u$ and $v$ are harmonic in $\Omega$, continuous on
$\overline\Omega$, and $u\le v$ on $\partial\Omega$. Prove $u\le v$ in
$\Omega$.

### Problem 6: Check Uniform Ellipticity

Show that the principal part:

$$
(4+x^2)u_{xx}+2xy\,u_{xy}+(5+y^2)u_{yy}
$$

is uniformly elliptic.

### Problem 7: Verify A Rectangular Dirichlet Solution

On $0<x<\pi$, $0<y<2$, verify that:

$$
u(x,y)=\sin x\,\frac{\sinh y}{\sinh2}
$$

solves Laplace's equation with zero data on $x=0$, $x=\pi$, and $y=0$, and
with $u(x,2)=\sin x$.

### Problem 8: Verify A Poisson Solution

On the unit disk, verify that:

$$
u(x,y)=\frac{1-x^2-y^2}{4}
$$

solves $\Delta u=-1$ with zero Dirichlet boundary data.

</details>

<details open>
<summary><strong>Problems 9 To 12: Neumann And Energy Ideas</strong></summary>

### Problem 9: Determine Compatible Constant Flux

On the unit disk, suppose:

$$
\Delta u=6
$$

and:

$$
\frac{\partial u}{\partial n}=g_0
$$

is constant on the boundary. Find the value of $g_0$ required by
compatibility.

### Problem 10: Exhibit The Neumann Family

Verify that:

$$
u(x,y)=\frac32(x^2+y^2)+C
$$

solves the problem in Problem 9 for every constant $C$.

### Problem 11: Read Rectangle Normals

For $\Omega=(0,L)\times(0,H)$, express $\partial u/\partial n$ on each of the
four edges in terms of $u_x$ and $u_y$.

### Problem 12: Use The Energy Identity

Let $w$ be harmonic in a connected bounded domain and suppose:

$$
\frac{\partial w}{\partial n}=0
$$

on the boundary. Use the energy identity to show that $w$ is constant.

</details>

<details open>
<summary><strong>Problems 13 And 14: Radial Solutions And Diagnosis</strong></summary>

### Problem 13: Solve An Annular Dirichlet Problem

Find a radial harmonic function on:

$$
1<r<e^2
$$

with:

$$
u(1)=0,
\qquad
u(e^2)=4.
$$

### Problem 14: Diagnose A False Uniqueness Claim

A calculation shows that the difference of two solutions of a pure Neumann
problem is constant. Explain why this proves uniqueness only after an
additional normalisation is imposed.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Start from:

$$
u(x,y)=x^3-3xy^2.
$$

Differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}(x^3-3xy^2)\\
&=3x^2-3y^2.
\end{aligned}
$$

Differentiate once more with respect to $x$:

$$
u_{xx}=6x.
$$

Differentiate the original function with respect to $y$:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}(x^3-3xy^2)\\
&=-6xy.
\end{aligned}
$$

Differentiate once more with respect to $y$:

$$
u_{yy}=-6x.
$$

Add the second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=6x-6x\\
&=0.
\end{aligned}
$$

Since $\Delta u=0$, the derivative calculation proves:

$$
\boxed{
u(x,y)=x^3-3xy^2
\text{ is harmonic on }\mathbb R^2.
}
$$

### Answer 2

The function is:

$$
u(x,y)=\log\sqrt{(x-1)^2+(y+2)^2}.
$$

Define the distance from $(1,-2)$:

$$
\rho=\sqrt{(x-1)^2+(y+2)^2}.
$$

Then:

$$
u=\log\rho.
$$

The shifted radial logarithm is harmonic wherever:

$$
\rho>0.
$$

The distance $\rho$ equals zero only when:

$$
(x,y)=(1,-2).
$$

Therefore the largest natural domain is:

$$
\boxed{
\mathbb R^2\setminus\{(1,-2)\}
}.
$$

The formula is also harmonic on every smaller open domain that excludes the
point $(1,-2)$.

### Answer 3

On the circle:

$$
x=r\cos\theta,
\qquad
y=r\sin\theta,
$$

substitute into:

$$
u(x,y)=5+x-2y+xy.
$$

This gives:

$$
u=5+r\cos\theta-2r\sin\theta
+r^2\cos\theta\sin\theta.
$$

Average from $0$ to $2\pi$:

$$
\begin{aligned}
\frac1{2\pi}\int_0^{2\pi}u\,d\theta
={}&5
+\frac{r}{2\pi}\int_0^{2\pi}\cos\theta\,d\theta\\
&-\frac{2r}{2\pi}\int_0^{2\pi}\sin\theta\,d\theta\\
&+\frac{r^2}{2\pi}
\int_0^{2\pi}\cos\theta\sin\theta\,d\theta.
\end{aligned}
$$

Use:

$$
\int_0^{2\pi}\cos\theta\,d\theta=0,
\qquad
\int_0^{2\pi}\sin\theta\,d\theta=0
$$

For the remaining product term, use:

$$
\cos\theta\sin\theta=\frac12\sin(2\theta).
$$

The product term $\cos\theta\sin\theta$ has integral zero over a full period
because $\sin(2\theta)$ does. Thus every nonconstant term has zero average,
and:

$$
\frac1{2\pi}\int_0^{2\pi}u\,d\theta=5.
$$

At the centre:

$$
u(0,0)=5.
$$

Hence the circle average equals the centre value, as required by the
mean-value property.

### Answer 4

The boundary data satisfy:

$$
1\le u\le7
\qquad\text{on }\partial\Omega.
$$

Since $u$ is harmonic, the minimum principle gives:

$$
u\ge1
\qquad\text{in }\overline\Omega.
$$

The maximum principle gives:

$$
u\le7
\qquad\text{in }\overline\Omega.
$$

Combine the inequalities:

$$
\boxed{
1\le u(x,y)\le7
\quad\text{throughout }\overline\Omega
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Suppose:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

Define:

$$
w=u-v.
$$

Since $u$ and $v$ are harmonic:

$$
\Delta u=0,
\qquad
\Delta v=0.
$$

Therefore:

$$
\begin{aligned}
\Delta w
&=\Delta(u-v)\\
&=\Delta u-\Delta v\\
&=0.
\end{aligned}
$$

Thus $w$ is harmonic. On the boundary:

$$
w=u-v\le0.
$$

The maximum principle gives:

$$
w\le0
\qquad\text{throughout }\Omega.
$$

Return to $w=u-v$:

$$
u-v\le0.
$$

Add $v$ to both sides:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

### Answer 6

The principal part is:

$$
(4+x^2)u_{xx}+2xy\,u_{xy}+(5+y^2)u_{yy}.
$$

For a vector $\zeta=(\zeta_1,\zeta_2)^T$, the quadratic form is:

$$
\begin{aligned}
Q
={}&(4+x^2)\zeta_1^2
+2xy\zeta_1\zeta_2
+(5+y^2)\zeta_2^2.
\end{aligned}
$$

Separate the constant and variable terms:

$$
\begin{aligned}
Q
={}&4\zeta_1^2+5\zeta_2^2\\
&+x^2\zeta_1^2
+2xy\zeta_1\zeta_2
+y^2\zeta_2^2.
\end{aligned}
$$

Complete the square in the last three terms:

$$
Q
=4\zeta_1^2+5\zeta_2^2
+(x\zeta_1+y\zeta_2)^2.
$$

Since the square is nonnegative:

$$
Q\ge4\zeta_1^2+5\zeta_2^2.
$$

The constant-coefficient part satisfies:

$$
4\zeta_1^2+5\zeta_2^2
\ge4(\zeta_1^2+\zeta_2^2).
$$

Therefore:

$$
\boxed{
Q\ge4|\zeta|^2
}.
$$

The operator is uniformly elliptic with $\lambda=4$.

### Answer 7

Use the proposed function:

$$
u(x,y)=\sin x\,\frac{\sinh y}{\sinh2}.
$$

Differentiate twice with respect to $x$:

$$
u_x=\cos x\,\frac{\sinh y}{\sinh2}
$$

and:

$$
u_{xx}=-\sin x\,\frac{\sinh y}{\sinh2}.
$$

Differentiate twice with respect to $y$:

$$
u_y=\sin x\,\frac{\cosh y}{\sinh2}
$$

and:

$$
u_{yy}=\sin x\,\frac{\sinh y}{\sinh2}.
$$

Add the two calculated second derivatives:

$$
\begin{aligned}
u_{xx}+u_{yy}
&=-\sin x\,\frac{\sinh y}{\sinh2}
+\sin x\,\frac{\sinh y}{\sinh2}\\
&=0.
\end{aligned}
$$

Thus the PDE is satisfied.

At $x=0$:

$$
u(0,y)=0.
$$

At $x=\pi$:

$$
u(\pi,y)=0.
$$

At $y=0$:

$$
u(x,0)=\sin x\,\frac{\sinh0}{\sinh2}=0.
$$

At $y=2$:

$$
\begin{aligned}
u(x,2)
&=\sin x\,\frac{\sinh2}{\sinh2}\\
&=\sin x.
\end{aligned}
$$

The PDE and all four boundary conditions hold.

### Answer 8

Use:

$$
u(x,y)=\frac{1-x^2-y^2}{4}.
$$

Differentiate with respect to $x$ twice:

$$
u_x=-\frac{x}{2},
\qquad
u_{xx}=-\frac12.
$$

Differentiate with respect to $y$ twice:

$$
u_y=-\frac{y}{2},
\qquad
u_{yy}=-\frac12.
$$

Add the two calculated second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=-\frac12-\frac12\\
&=-1.
\end{aligned}
$$

On the unit circle:

$$
x^2+y^2=1.
$$

Therefore:

$$
\begin{aligned}
u
&=\frac{1-(x^2+y^2)}4\\
&=\frac{1-1}{4}\\
&=0.
\end{aligned}
$$

Hence the proposed function solves the Poisson equation and the zero Dirichlet
boundary condition.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

The compatibility condition is:

$$
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds.
$$

For the unit disk:

$$
f=6.
$$

The area is $\pi$, so:

$$
\begin{aligned}
\iint_\Omega6\,dA
&=6(\pi)\\
&=6\pi.
\end{aligned}
$$

The boundary flux is the constant $g_0$. The unit-circle circumference is
$2\pi$, so:

$$
\begin{aligned}
\int_{\partial\Omega}g_0\,ds
&=g_0(2\pi).
\end{aligned}
$$

Set the two integrals equal:

$$
6\pi=2\pi g_0.
$$

Divide by $2\pi$:

$$
\boxed{
g_0=3
}.
$$

### Answer 10

Consider:

$$
u(x,y)=\frac32(x^2+y^2)+C.
$$

Differentiate twice:

$$
u_{xx}=3,
\qquad
u_{yy}=3.
$$

Therefore:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=3+3\\
&=6.
\end{aligned}
$$

The gradient is:

$$
\nabla u=(3x,3y).
$$

On the unit circle, the outward normal is:

$$
\mathbf n=(x,y).
$$

Calculate the normal derivative:

$$
\begin{aligned}
\frac{\partial u}{\partial n}
&=\nabla u\cdot\mathbf n\\
&=(3x,3y)\cdot(x,y)\\
&=3x^2+3y^2\\
&=3.
\end{aligned}
$$

The constant $C$ disappears from every derivative. Hence:

$$
\boxed{
u(x,y)=\frac32(x^2+y^2)+C
}
$$

solves the compatible Neumann problem for every real $C$.

### Answer 11

For:

$$
\Omega=(0,L)\times(0,H),
$$

use:

$$
\frac{\partial u}{\partial n}
=\nabla u\cdot\mathbf n.
$$

On the left edge $x=0$:

$$
\mathbf n=(-1,0),
$$

so:

$$
\frac{\partial u}{\partial n}=-u_x.
$$

On the right edge $x=L$:

$$
\mathbf n=(1,0),
$$

so:

$$
\frac{\partial u}{\partial n}=u_x.
$$

On the bottom edge $y=0$:

$$
\mathbf n=(0,-1),
$$

so:

$$
\frac{\partial u}{\partial n}=-u_y.
$$

On the top edge $y=H$:

$$
\mathbf n=(0,1),
$$

so:

$$
\frac{\partial u}{\partial n}=u_y.
$$

Collecting the four results:

$$
\boxed{
\begin{array}{c|c}
x=0&-u_x\\
x=L&u_x\\
y=0&-u_y\\
y=H&u_y
\end{array}
}.
$$

### Answer 12

The energy identity is:

$$
\iint_\Omega|\nabla w|^2\,dA
=\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w\Delta w\,dA.
$$

Since $w$ is harmonic:

$$
\Delta w=0.
$$

Since the normal derivative is zero:

$$
\frac{\partial w}{\partial n}=0
\qquad\text{on }\partial\Omega.
$$

Substitute both conditions into the identity:

$$
\begin{aligned}
\iint_\Omega|\nabla w|^2\,dA
&=\int_{\partial\Omega}w(0)\,ds
-\iint_\Omega w(0)\,dA\\
&=0.
\end{aligned}
$$

Because $|\nabla w|^2\ge0$, a zero integral gives:

$$
\nabla w=0
$$

throughout the domain. Since $\Omega$ is connected:

$$
\boxed{
w\text{ is constant}
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 13 And 14</strong></summary>

### Answer 13

A radial harmonic function on an annulus has the form:

$$
u(r)=A\log r+B.
$$

Apply:

$$
u(1)=0.
$$

Since $\log1=0$:

$$
\begin{aligned}
u(1)
&=A\log1+B\\
&=B.
\end{aligned}
$$

Therefore:

$$
B=0.
$$

Now apply:

$$
u(e^2)=4.
$$

Substitute $B=0$:

$$
A\log(e^2)=4.
$$

Use:

$$
\log(e^2)=2.
$$

Using $\log(e^2)=2$, the equation $A\log(e^2)=4$ becomes:

$$
2A=4.
$$

Divide by $2$:

$$
A=2.
$$

Hence:

$$
\boxed{
u(r)=2\log r
}.
$$

Check the boundary values:

$$
u(1)=2\log1=0
$$

At the outer boundary $r=e^2$:

$$
u(e^2)=2\log(e^2)=2(2)=4.
$$

### Answer 14

Suppose two solutions $u_1$ and $u_2$ of the same pure Neumann problem satisfy:

$$
u_1-u_2=C.
$$

This result does not force $C=0$. Every value of $C$ gives the same derivatives:

$$
\Delta(u_2+C)=\Delta u_2
$$

The normal derivative is also unchanged:

$$
\frac{\partial}{\partial n}(u_2+C)
=\frac{\partial u_2}{\partial n}.
$$

Therefore the PDE and pure Neumann boundary data cannot distinguish $u_2$ from
$u_2+C$.

Add a normalisation, for example:

$$
\iint_\Omega u\,dA=0.
$$

If both $u_1$ and $u_2$ satisfy this normalisation, then:

$$
\iint_\Omega(u_1-u_2)\,dA=0.
$$

Since $u_1-u_2=C$:

$$
\iint_\Omega C\,dA=0.
$$

Thus:

$$
C\,|\Omega|=0.
$$

For a domain with positive area, $|\Omega|>0$, so:

$$
C=0.
$$

Only after the normalisation is imposed can we conclude:

$$
\boxed{
u_1=u_2
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 33 Final Summary</strong></summary>

A function is harmonic in $\Omega$ when:

$$
\Delta u=u_{xx}+u_{yy}=0.
$$

Its centre value equals its average over every contained circle or disk. This
mean-value property leads to:

$$
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
$$

and:

$$
\min_{\overline\Omega}u
=\min_{\partial\Omega}u
$$

for a harmonic function continuous on the closure of a bounded domain.

A nonconstant harmonic function cannot attain an interior maximum or minimum.
Applying this principle to the difference of two solutions proves uniqueness
for the Dirichlet problem.

For a general operator:

$$
L[u]
=a u_{xx}+2b u_{xy}+c u_{yy}
+d u_x+e u_y+q u,
$$

uniform ellipticity means that one $\lambda>0$ satisfies:

$$
a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2
\ge\lambda(\zeta_1^2+\zeta_2^2).
$$

The sign of the zero-order coefficient matters when applying a general maximum
principle.

The three main boundary-data types are:

$$
\begin{array}{c|c}
\text{Dirichlet}&u=g\\
\text{Neumann}&\partial u/\partial n=g\\
\text{Robin}&\alpha u+\beta\,\partial u/\partial n=g
\end{array}
$$

A pure Neumann problem for $\Delta u=f$ requires:

$$
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds.
$$

When it is solvable, its solutions differ by an additive constant. Green's
identity explains both Dirichlet uniqueness and Neumann uniqueness up to a
constant:

$$
\iint_\Omega|\nabla w|^2\,dA
=\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w\Delta w\,dA.
$$

Radial harmonic functions in two dimensions have the form:

$$
u(r)=A\log r+B,
$$

on domains that exclude $r=0$.

> state the domain, confirm ellipticity, distinguish harmonic from forced
> equations, identify the boundary-data type, check compatibility, predict
> qualitative bounds, construct the solution, verify every boundary component,
> and prove uniqueness separately.

</details>
