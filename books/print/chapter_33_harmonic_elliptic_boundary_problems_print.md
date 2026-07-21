```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 33}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Harmonic Functions And Elliptic Boundary Problems}
```
# Chapter 33 - Harmonic Functions And Elliptic Boundary Problems

```{=latex}
\Needspace{10\baselineskip}
```
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

-   define harmonic, subharmonic, and superharmonic functions
-   verify harmonicity one derivative at a time
-   explain the circle and disk mean-value properties
-   connect averaging to the maximum and minimum principles
-   distinguish weak and strong maximum principles
-   prove uniqueness for the Dirichlet problem
-   use comparison functions to obtain interior bounds
-   extend the qualitative ideas to general elliptic operators
-   distinguish existence from uniqueness
-   solve a rectangular Dirichlet problem by separation of variables
-   formulate Neumann and Robin boundary conditions
-   derive the Neumann compatibility condition
-   explain why pure Neumann solutions are unique only up to a constant
-   use an energy identity as a second uniqueness argument
-   build a reliable elliptic boundary-value workflow

```{=latex}
\Needspace{20\baselineskip}
```
## Harmonic Functions {#block-1-harmonic-functions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to recognise harmonic functions, verify the Laplace equation
carefully, and understand the role of the domain.

```{=latex}
\Needspace{8\baselineskip}
```
> a harmonic function is in exact local balance: its curvature in one
> coordinate direction cancels its curvature in the other.

```{=latex}
\Needspace{12\baselineskip}
```
### The Laplacian And The Domain {#the-laplacian-and-the-domain-2}

```{=latex}
\Needspace{10\baselineskip}
```
For a twice continuously differentiable function $u=u(x,y)$, the
two-dimensional Laplacian is:

$$
\boxed{
\Delta u=u_{xx}+u_{yy}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $\Omega$ denote an open region in the plane. The function $u$ is
**harmonic in $\Omega$** when:

$$
\Delta u=0
$$

at every point of $\Omega$.

The domain is part of the statement. A formula can be harmonic on one region
and fail to be harmonic, or even fail to be defined, on a larger region.

```{=latex}
\Needspace{12\baselineskip}
```
### A Polynomial Harmonic Function {#a-polynomial-harmonic-function-3}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u(x,y)=x^2-y^2+3x-4y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u=x^2-y^2+3x-4y$, differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}
\left(x^2-y^2+3x-4y\right)\\
&=2x+3.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $x$:

$$
u_{xx}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now differentiate the original function with respect to $y$:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}
\left(x^2-y^2+3x-4y\right)\\
&=-2y-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $y$:

$$
u_{yy}=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=2+(-2)\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
u(x,y)=x^2-y^2+3x-4y
\text{ is harmonic on }\mathbb R^2.
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Function That Is Not Harmonic {#a-function-that-is-not-harmonic-4}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
v(x,y)=x^2+y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its second derivatives are:

$$
v_{xx}=2,
\qquad
v_{yy}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Harmonicity Can Depend On The Domain {#harmonicity-can-depend-on-the-domain-5}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
u(x,y)=\log\sqrt{x^2+y^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
r=\sqrt{x^2+y^2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $r=\sqrt{x^2+y^2}$, the function is $u=\log r$. In polar coordinates,
a radial function has Laplacian:

$$
\Delta u=u_{rr}+\frac1r u_r.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
u_r=\frac1r
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{rr}=-\frac1{r^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Linear Combinations Remain Harmonic {#linear-combinations-remain-harmonic-6}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ and $v$ are harmonic in the same domain $\Omega$:

$$
\Delta u=0,
\qquad
\Delta v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Real And Imaginary Parts Of Analytic Functions {#real-and-imaginary-parts-of-analytic-functions-7}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
f(z)=u(x,y)+iv(x,y),
\qquad
z=x+iy,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and suppose $f$ is analytic. The Cauchy--Riemann equations are:

$$
u_x=v_y,
\qquad
u_y=-v_x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the first equation with respect to $x$:

$$
u_{xx}=v_{yx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the second equation with respect to $y$:

$$
u_{yy}=-v_{xy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the two second derivatives:

$$
\begin{aligned}
u_{xx}+u_{yy}
&=v_{yx}-v_{xy}\\
&=0,
\end{aligned}
$$

provided the mixed derivatives are continuous. Hence $u$ is harmonic. A
similar calculation shows that $v$ is harmonic.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-8}

A function is harmonic when $\Delta u=0$ throughout its domain. Always state
the domain, especially for formulas with singularities. Harmonic functions
form a linear family, and real or imaginary parts of analytic functions provide
an important source of examples.

```{=latex}
\Needspace{20\baselineskip}
```
## The Mean-Value Property {#block-2-the-mean-value-property}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-9}

The goal is to understand the averaging property that drives much of the
qualitative behaviour of harmonic functions.

```{=latex}
\Needspace{12\baselineskip}
```
### The Circle Mean-Value Formula {#the-circle-mean-value-formula-10}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The point:

$$
(x_0+r\cos\theta,\ y_0+r\sin\theta)
$$

runs once around the circle of radius $r$. The formula says that the value at
the centre equals the average of the values around every such circle.

```{=latex}
\Needspace{12\baselineskip}
```
### The Disk Mean-Value Formula {#the-disk-mean-value-formula-11}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> a harmonic value is not free to move independently of its neighbours. It is
> locked to their average.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify A Circle Average Directly {#verify-a-circle-average-directly-12}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the harmonic function:

$$
u(x,y)=3+2x-y+x^2-y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the origin:

$$
u(0,0)=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the circle of radius $r$ centred at the origin, substitute:

$$
x=r\cos\theta,
\qquad
y=r\sin\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After substituting the circle coordinates:

$$
\begin{aligned}
u(r\cos\theta,r\sin\theta)
={}&3+2r\cos\theta-r\sin\theta\\
&+r^2\cos^2\theta-r^2\sin^2\theta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\int_0^{2\pi}\cos\theta\,d\theta=0,
\qquad
\int_0^{2\pi}\sin\theta\,d\theta=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\cos^2\theta-\sin^2\theta=\cos(2\theta),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\int_0^{2\pi}(\cos^2\theta-\sin^2\theta)\,d\theta=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Every nonconstant term averages to zero. Therefore:

$$
\frac1{2\pi}\int_0^{2\pi}u\,d\theta=3=u(0,0).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why An Interior Maximum Causes Trouble {#why-an-interior-maximum-causes-trouble-13}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ is harmonic and has a local maximum $M$ at an interior point
$P$. On a small circle around $P$:

$$
u\le M.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Converse Is Also Powerful {#the-converse-is-also-powerful-14}

Under suitable continuity assumptions, a function that satisfies the
mean-value property on every sufficiently small disk is harmonic.

So the mean-value property is not merely a consequence of Laplace's equation.
It also characterises its solutions.

This fact explains why averaging algorithms can approximate harmonic
functions: replacing each interior value by a local neighbour average imitates
the defining balance.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

For a harmonic function, the value at the centre of every contained circle or
disk equals the corresponding average. This averaging rule prevents isolated
interior peaks and troughs and leads directly to maximum principles.

```{=latex}
\Needspace{20\baselineskip}
```
## Maximum, Minimum, And Comparison Principles {#block-3-maximum-minimum-and-comparison-principles}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to turn the mean-value intuition into precise tools for locating
extreme values, proving bounds, and establishing uniqueness.

```{=latex}
\Needspace{12\baselineskip}
```
### The Weak Maximum And Minimum Principles {#the-weak-maximum-and-minimum-principles-17}

Let $\Omega$ be a bounded connected domain, and suppose:

-   $u$ is harmonic in $\Omega$
-   $u$ is continuous on the closure $\overline\Omega$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\boxed{
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Strong Maximum Principle {#the-strong-maximum-principle-18}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Use Boundary Data To Bound Every Interior Value {#use-boundary-data-to-bound-every-interior-value-19}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ is harmonic in a bounded domain and its boundary values satisfy:

$$
-2\le u\le5
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The maximum principle gives:

$$
u\le5
\qquad\text{in }\overline\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The minimum principle gives:

$$
u\ge-2
\qquad\text{in }\overline\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the two bounds:

$$
\boxed{
-2\le u(x,y)\le5
\quad\text{throughout }\overline\Omega
}.
$$

No explicit formula for $u$ was needed.

```{=latex}
\Needspace{12\baselineskip}
```
### The Comparison Principle {#the-comparison-principle-20}

```{=latex}
\Needspace{10\baselineskip}
```
Let $u$ and $v$ be harmonic in $\Omega$ and continuous on
$\overline\Omega$. Suppose:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define their difference:

$$
w=u-v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Thus $w$ is harmonic. On the boundary:

$$
w=u-v\le0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The maximum principle gives:

$$
w\le0
\qquad\text{in }\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $w=u-v$:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Uniqueness For The Dirichlet Problem {#uniqueness-for-the-dirichlet-problem-21}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u_1$ and $u_2$ both satisfy:

$$
\Delta u=0
\qquad\text{in }\Omega
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the same boundary data:

$$
u=g
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
w=u_1-u_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Inside the domain:

$$
\begin{aligned}
\Delta w
&=\Delta u_1-\Delta u_2\\
&=0-0\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the boundary:

$$
\begin{aligned}
w
&=u_1-u_2\\
&=g-g\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The maximum principle gives:

$$
\max_{\overline\Omega}w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the same principle to $-w$, which is also harmonic and zero on the
boundary:

$$
\max_{\overline\Omega}(-w)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The last equation means:

$$
\min_{\overline\Omega}w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
0\le w\le0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
u_1=u_2
}.
$$

The Dirichlet problem has at most one solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Subharmonic And Superharmonic Functions {#subharmonic-and-superharmonic-functions-22}

With the sign convention used here:

-   $u$ is **subharmonic** when $\Delta u\ge0$
-   $u$ is **superharmonic** when $\Delta u\le0$

A subharmonic function cannot have a strict interior maximum unless it is
constant in the relevant connected region. A superharmonic function cannot
have a strict interior minimum.

```{=latex}
\Needspace{10\baselineskip}
```
A concrete subharmonic example is:

$$
u(x,y)=x^2+y^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
satisfies:

$$
\Delta u=4>0.
$$

It is subharmonic. It has an interior minimum at the origin, which is allowed,
but no interior maximum on a bounded disk.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-23}

Boundary values control harmonic functions throughout bounded domains. The
weak principles locate global extrema, the strong principle rules out
nonconstant interior extrema, and the comparison principle turns boundary
inequalities into interior inequalities. Applying these ideas to the
difference of two solutions proves uniqueness.

```{=latex}
\Needspace{20\baselineskip}
```
## General Elliptic Operators {#block-4-general-elliptic-operators}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-24}

The goal is to extend the qualitative picture beyond Laplace's equation and to
state clearly which coefficient conditions support a maximum principle.

```{=latex}
\Needspace{12\baselineskip}
```
### A General Linear Operator {#a-general-linear-operator-25}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\boxed{
L[u]
=a\,u_{xx}+2b\,u_{xy}+c\,u_{yy}
+d\,u_x+e\,u_y+q\,u
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Positive Definiteness And Ellipticity {#positive-definiteness-and-ellipticity-26}

```{=latex}
\Needspace{10\baselineskip}
```
For any direction vector:

$$
\zeta=
\begin{pmatrix}
\zeta_1\\
\zeta_2
\end{pmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the principal quadratic form is:

$$
\zeta^T M\zeta
=a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The principal part is positive definite when:

$$
a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2>0
$$

for every nonzero vector $\zeta$.

```{=latex}
\Needspace{10\baselineskip}
```
For a symmetric $2\times2$ matrix, this is equivalent to:

$$
a>0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
ac-b^2>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the PDE discriminant is $b^2-ac$, positive definiteness gives:

$$
b^2-ac<0.
$$

Thus the equation is elliptic.

```{=latex}
\Needspace{12\baselineskip}
```
### Uniform Ellipticity {#uniform-ellipticity-27}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Worked Uniform-Ellipticity Check {#a-worked-uniform-ellipticity-check-28}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the principal part:

$$
(2+x^2)u_{xx}+2xy\,u_{xy}+(3+y^2)u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=2+x^2,
\qquad
b=xy,
\qquad
c=3+y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a vector $\zeta=(\zeta_1,\zeta_2)^T$, form:

$$
\begin{aligned}
Q
={}&(2+x^2)\zeta_1^2
+2xy\zeta_1\zeta_2
+(3+y^2)\zeta_2^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since every square is nonnegative:

$$
Q\ge2\zeta_1^2+3\zeta_2^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also:

$$
2\zeta_1^2+3\zeta_2^2
\ge2(\zeta_1^2+\zeta_2^2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
Q\ge2|\zeta|^2
}.
$$

The operator is uniformly elliptic with $\lambda=2$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Maximum Principle For A General Operator {#a-maximum-principle-for-a-general-operator-29}

Suppose the principal part is uniformly elliptic and the coefficients are
regular enough for the classical maximum principle.

```{=latex}
\Needspace{10\baselineskip}
```
In the especially transparent case:

$$
q=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Under the assumption $q=0$, suppose:

$$
L[u]\ge0
\qquad\text{in }\Omega,
$$

then $u$ cannot have a strict positive interior maximum unless it is constant.
Boundary values therefore control the maximum.

```{=latex}
\Needspace{10\baselineskip}
```
When:

$$
q\le0,
$$

a closely related statement holds: a positive interior maximum is still ruled
out under the standard hypotheses. The sign restriction on the zero-order term
is essential rather than cosmetic.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Zero-Order Sign Matters {#why-the-zero-order-sign-matters-30}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the square:

$$
\Omega=(0,\pi)\times(0,\pi)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and the function:

$$
u(x,y)=\sin x\sin y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It vanishes on the entire boundary. Differentiate:

$$
u_{xx}=-\sin x\sin y=-u
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second $y$-derivative is:

$$
u_{yy}=-\sin x\sin y=-u.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\Delta u=-2u.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
\Delta u+2u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The zero-order coefficient is $q=2>0$. Although the boundary data are zero,
$u$ is positive inside the square and reaches an interior maximum of $1$ at:

$$
\left(\frac\pi2,\frac\pi2\right).
$$

This example shows why a maximum principle for $L[u]$ cannot ignore the sign
of $q$.

```{=latex}
\Needspace{12\baselineskip}
```
### Comparison For The Same Elliptic Operator {#comparison-for-the-same-elliptic-operator-31}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $q=0$, and let $u,v$ satisfy:

$$
L[u]\ge L[v]
\qquad\text{in }\Omega
$$

```{=latex}
\Needspace{10\baselineskip}
```
and on the boundary:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
w=u-v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Linearity gives:

$$
L[w]=L[u]-L[v]\ge0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the boundary:

$$
w\le0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general maximum principle then gives:

$$
w\le0
\qquad\text{in }\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-32}

General elliptic operators are controlled by a positive-definite principal
matrix. Uniform ellipticity supplies a fixed lower bound in every direction.
First-order terms do not alter the type, while the zero-order coefficient
requires the correct sign for a standard maximum principle.

```{=latex}
\Needspace{20\baselineskip}
```
## The Dirichlet Problem {#block-5-the-dirichlet-problem}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-33}

The goal is to formulate elliptic boundary-value problems precisely, separate
existence from uniqueness, and construct one explicit rectangular solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Laplace And Poisson Dirichlet Problems {#laplace-and-poisson-dirichlet-problems-34}

```{=latex}
\Needspace{10\baselineskip}
```
The Laplace Dirichlet problem prescribes:

$$
\begin{cases}
\Delta u=0,&(x,y)\in\Omega,\\
u=g,&(x,y)\in\partial\Omega.
\end{cases}
$$

The boundary function $g$ specifies the value of $u$ along the boundary.

```{=latex}
\Needspace{10\baselineskip}
```
The Poisson Dirichlet problem includes a forcing term:

$$
\begin{cases}
\Delta u=f,&(x,y)\in\Omega,\\
u=g,&(x,y)\in\partial\Omega.
\end{cases}
$$

The unknown is not only a formula satisfying the PDE. It must satisfy the
entire boundary prescription as well.

```{=latex}
\Needspace{12\baselineskip}
```
### Existence And Uniqueness Are Different Questions {#existence-and-uniqueness-are-different-questions-35}

```{=latex}
\Needspace{12\baselineskip}
```
A uniqueness proof says:

```{=latex}
\Needspace{8\baselineskip}
```
> if a solution exists, there cannot be two different solutions with the same
> data.

It does not automatically produce a solution.

An existence argument must construct a solution or invoke a theorem whose
hypotheses guarantee one. Boundary regularity and compatibility at corners can
matter.[^2]

```{=latex}
\Needspace{12\baselineskip}
```
### A Rectangular Dirichlet Problem {#a-rectangular-dirichlet-problem-36}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
u_{xx}+u_{yy}=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
on:

$$
0<x<\pi,
\qquad
0<y<1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with boundary data:

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Separate The Rectangular Problem {#separate-the-rectangular-problem-37}

```{=latex}
\Needspace{10\baselineskip}
```
Seek:

$$
u(x,y)=X(x)Y(y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
u_{xx}=X''(x)Y(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second derivative with respect to $y$ is:

$$
u_{yy}=X(x)Y''(y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into Laplace's equation:

$$
X''Y+XY''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nontrivial product, divide by $XY$:

$$
\frac{X''}{X}+\frac{Y''}{Y}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the $Y$ ratio to the other side:

$$
\frac{X''}{X}=-\frac{Y''}{Y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The left side depends only on $x$, while the right side depends only on $y$.
Set both sides equal to $-\lambda$:

$$
\frac{X''}{X}=-\lambda
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
-\frac{Y''}{Y}=-\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
X''+\lambda X=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding $Y$-equation is:

$$
Y''-\lambda Y=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Use The X-Boundary Conditions {#use-the-x-boundary-conditions-38}

```{=latex}
\Needspace{10\baselineskip}
```
The conditions:

$$
u(0,y)=u(\pi,y)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
require:

$$
X(0)=X(\pi)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
As in the fixed-end eigenvalue problem:

$$
\lambda_n=n^2,
\qquad
X_n(x)=\sin(nx),
\qquad
n=1,2,3,\ldots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The top boundary value is:

$$
\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore only the mode $n=2$ is needed:

$$
\lambda=4,
\qquad
X(x)=\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding $Y$ equation is:

$$
Y''-4Y=0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Y-Equation And Apply Both Horizontal Edges {#solve-the-y-equation-and-apply-both-horizontal-edges-39}

```{=latex}
\Needspace{10\baselineskip}
```
The general solution of:

$$
Y''-4Y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
is:

$$
Y(y)=C\cosh(2y)+D\sinh(2y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The bottom condition $u(x,0)=0$ requires:

$$
Y(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y=0$:

$$
\begin{aligned}
Y(0)
&=C\cosh0+D\sinh0\\
&=C.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
Y(y)=D\sinh(2y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The top condition $u(x,1)=\sin(2x)$ requires:

$$
X(x)Y(1)=\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $X(x)=\sin(2x)$:

$$
\sin(2x)Y(1)=\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
Y(1)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $Y(1)=D\sinh2$:

$$
D\sinh2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $D$:

$$
D=\frac1{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
Y(y)=\frac{\sinh(2y)}{\sinh2}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Assemble And Verify The Dirichlet Solution {#assemble-and-verify-the-dirichlet-solution-40}

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the two separated factors:

$$
\boxed{
u(x,y)
=\sin(2x)\frac{\sinh(2y)}{\sinh2}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For
$u=\sin(2x)\sinh(2y)/\sinh2$,
differentiate twice with respect to $x$:

$$
u_{xx}
=-4\sin(2x)\frac{\sinh(2y)}{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate twice with respect to $y$:

$$
u_{yy}
=4\sin(2x)\frac{\sinh(2y)}{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the two second derivatives:

$$
u_{xx}+u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now check each edge. At $x=0$ and $x=\pi$:

$$
\sin(2x)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
u(0,y)=u(\pi,y)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $y=0$:

$$
\sinh(0)=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
u(x,0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $y=1$:

$$
\frac{\sinh(2)}{\sinh2}=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
u(x,1)=\sin(2x).
$$

The PDE and all four boundary conditions are satisfied.

```{=latex}
\Needspace{12\baselineskip}
```
### A Qualitative Check Before Any Differentiation {#a-qualitative-check-before-any-differentiation-41}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Simple Poisson Problem {#a-simple-poisson-problem-42}

```{=latex}
\Needspace{10\baselineskip}
```
On the unit disk:

$$
x^2+y^2<1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
consider:

$$
u(x,y)=1-x^2-y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u=1-x^2-y^2$, the second derivatives are:

$$
u_{xx}=-2,
\qquad
u_{yy}=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\Delta u=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the unit circle $x^2+y^2=1$:

$$
u=1-1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-43}

A Dirichlet problem prescribes the value of the solution on the boundary.
Maximum principles often prove uniqueness and bounds, while separation of
variables can construct solutions on suitable geometries. Poisson forcing can
change which interior extrema are possible.

```{=latex}
\Needspace{20\baselineskip}
```
## Neumann And Robin Boundary Data {#block-6-neumann-and-robin-boundary-data}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-44}

The goal is to interpret normal derivatives, derive the compatibility
condition for a pure Neumann problem, and explain its additive-constant
ambiguity.

```{=latex}
\Needspace{12\baselineskip}
```
### The Outward Normal Derivative {#the-outward-normal-derivative-45}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\mathbf n=(n_1,n_2)
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Normals On A Rectangle {#normals-on-a-rectangle-46}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\Omega=(0,L)\times(0,H),
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Pure Neumann Problem {#the-pure-neumann-problem-47}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Neumann Compatibility Condition {#derive-the-neumann-compatibility-condition-48}

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the PDE $\Delta u=f$ over $\Omega$:

$$
\iint_\Omega\Delta u\,dA
=\iint_\Omega f\,dA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the Laplacian as a divergence:

$$
\Delta u=\nabla\cdot(\nabla u).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The divergence theorem then gives:

$$
\iint_\Omega\Delta u\,dA
=\int_{\partial\Omega}\nabla u\cdot\mathbf n\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\nabla u\cdot\mathbf n
=\frac{\partial u}{\partial n}
=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds
}.
$$

The total source inside must equal the total outward normal derivative across
the boundary.[^3]

```{=latex}
\Needspace{12\baselineskip}
```
### A Compatible Neumann Example On The Unit Disk {#a-compatible-neumann-example-on-the-unit-disk-49}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\Omega=\{(x,y):x^2+y^2<1\}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and consider:

$$
u(x,y)=x^2+y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its Laplacian is:

$$
\Delta u=2+2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the unit circle, the outward unit normal is:

$$
\mathbf n=(x,y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The gradient is:

$$
\nabla u=(2x,2y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Check the interior integral:

$$
\iint_\Omega4\,dA
=4(\text{area of the unit disk})
=4\pi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the boundary integral:

$$
\int_{\partial\Omega}2\,ds
=2(\text{circumference of the unit circle})
=2(2\pi)
=4\pi.
$$

The compatibility condition holds.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Pure Neumann Solutions Are Not Unique {#why-pure-neumann-solutions-are-not-unique-50}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ solves:

$$
\Delta u=f,
\qquad
\frac{\partial u}{\partial n}=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $C$ be any constant and define:

$$
v=u+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since derivatives of $C$ vanish:

$$
\Delta v
=\Delta(u+C)
=\Delta u
=f.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Similarly:

$$
\frac{\partial v}{\partial n}
=\frac{\partial}{\partial n}(u+C)
=\frac{\partial u}{\partial n}
=g.
$$

Thus $u+C$ satisfies exactly the same Neumann problem.

```{=latex}
\Needspace{10\baselineskip}
```
For the disk example, the full family is:

$$
\boxed{
u(x,y)=x^2+y^2+C
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A normalisation such as:

$$
\iint_\Omega u\,dA=0
$$

can be added to select one member of the family.

```{=latex}
\Needspace{12\baselineskip}
```
### An Incompatible Neumann Problem {#an-incompatible-neumann-problem-51}

```{=latex}
\Needspace{10\baselineskip}
```
On the unit disk, suppose:

$$
\Delta u=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{\partial u}{\partial n}=0
$$

on the boundary.

```{=latex}
\Needspace{10\baselineskip}
```
The interior source integral is:

$$
\iint_\Omega1\,dA=\pi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The boundary integral is:

$$
\int_{\partial\Omega}0\,ds=0.
$$

The required integrals are therefore $\pi$ and $0$. Because $\pi\ne0$, they do
not agree, so the compatibility condition fails. Therefore no sufficiently
smooth solution exists.

```{=latex}
\Needspace{12\baselineskip}
```
### Robin Boundary Data {#robin-boundary-data-52}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-53}

Neumann data prescribe outward normal derivatives rather than values. A pure
Neumann problem requires the global balance
$\iint_\Omega f\,dA=\int_{\partial\Omega}g\,ds$ and, when solvable, determines
the solution only up to an additive constant. Robin data mix value and flux.

```{=latex}
\Needspace{20\baselineskip}
```
## Energy Identities And Uniqueness {#block-7-energy-identities-and-uniqueness}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-54}

The goal is to prove uniqueness in a second way, using an integral that measures
how much the solution varies through the domain.

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Basic Energy Identity {#build-the-basic-energy-identity-55}

```{=latex}
\Needspace{10\baselineskip}
```
Let $w$ be twice continuously differentiable. Apply the product rule to the
vector field $w\nabla w$:

$$
\begin{aligned}
\nabla\cdot(w\nabla w)
&=\nabla w\cdot\nabla w+w\,\nabla\cdot(\nabla w)\\
&=|\nabla w|^2+w\Delta w.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate over $\Omega$:

$$
\iint_\Omega\nabla\cdot(w\nabla w)\,dA
=\iint_\Omega|\nabla w|^2\,dA
+\iint_\Omega w\Delta w\,dA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The divergence theorem transforms the left side:

$$
\iint_\Omega\nabla\cdot(w\nabla w)\,dA
=\int_{\partial\Omega}w\nabla w\cdot\mathbf n\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recognise the normal derivative:

$$
\nabla w\cdot\mathbf n
=\frac{\partial w}{\partial n},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we obtain:

$$
\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
=\iint_\Omega|\nabla w|^2\,dA
+\iint_\Omega w\Delta w\,dA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Dirichlet Uniqueness From Energy {#dirichlet-uniqueness-from-energy-56}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u_1$ and $u_2$ solve the same Poisson--Dirichlet problem:

```{=latex}
\Needspace{10\baselineskip}
```
$$
\Delta u=f
\qquad\text{in }\Omega,
$$

$$
u=g
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
w=u_1-u_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the two PDEs:

$$
\begin{aligned}
\Delta w
&=\Delta u_1-\Delta u_2\\
&=f-f\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the boundary data:

$$
w=g-g=0
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The integrand $|\nabla w|^2$ is nonnegative. Its integral can be zero only when:

$$
\nabla w=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
throughout the connected domain. Therefore $w$ is constant. Since $w=0$ on
the boundary, that constant is zero:

$$
w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{u_1=u_2.}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Neumann Uniqueness Up To A Constant {#neumann-uniqueness-up-to-a-constant-57}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u_1$ and $u_2$ solve the same Poisson--Neumann problem. Their
difference:

$$
w=u_1-u_2
$$

```{=latex}
\Needspace{10\baselineskip}
```
satisfies:

$$
\Delta w=0
\qquad\text{in }\Omega
$$

```{=latex}
\Needspace{10\baselineskip}
```
The same difference also satisfies the zero Neumann data:

$$
\frac{\partial w}{\partial n}=0
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert these conditions into the energy identity:

$$
\begin{aligned}
\iint_\Omega|\nabla w|^2\,dA
&=\int_{\partial\Omega}w(0)\,ds
-\iint_\Omega w(0)\,dA\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\nabla w=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $w$ is constant:

$$
w=C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
u_1=u_2+C
}.
$$

The energy proof identifies exactly the same ambiguity found by directly
adding a constant.

```{=latex}
\Needspace{12\baselineskip}
```
### The Energy Interpretation {#the-energy-interpretation-58}

```{=latex}
\Needspace{10\baselineskip}
```
The quantity:

$$
E[w]=\iint_\Omega|\nabla w|^2\,dA
$$

is the Dirichlet energy. It is zero only for a constant function on a connected
domain.

Harmonic functions can also be characterised as functions that minimise this
energy among functions with fixed boundary values. That variational viewpoint
will become useful in more advanced elliptic theory.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-59}

Green's identity converts a PDE and its boundary data into an integral of
$|\nabla w|^2$. Zero Dirichlet data force the difference of two solutions to be
zero. Zero Neumann data force only its gradient to vanish, leaving an arbitrary
constant.

```{=latex}
\Needspace{20\baselineskip}
```
## Geometry, Multiple Boundaries, And Radial Harmonic Functions {#block-8-geometry-multiple-boundaries-and-radial-harmonic-functions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-60}

The goal is to apply the qualitative theory on an annulus and to show how each
boundary component participates in the maximum principle.

```{=latex}
\Needspace{12\baselineskip}
```
### A Radial Laplace Equation {#a-radial-laplace-equation-61}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
u=u(r)
$$

```{=latex}
\Needspace{10\baselineskip}
```
depends only on:

$$
r=\sqrt{x^2+y^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In two dimensions:

$$
\Delta u=u_{rr}+\frac1r u_r.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $\Delta u=0$:

$$
u_{rr}+\frac1r u_r=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $r$:

$$
r u_{rr}+u_r=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recognise the product derivative:

$$
\frac{d}{dr}(r u_r)=r u_{rr}+u_r.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\frac{d}{dr}(r u_r)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate once:

$$
r u_r=A,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where $A$ is a constant. Divide by $r>0$:

$$
u_r=\frac{A}{r}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate again:

$$
\boxed{
u(r)=A\log r+B
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Dirichlet Problem On An Annulus {#a-dirichlet-problem-on-an-annulus-62}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\Omega=\{(x,y):a<r<b\},
\qquad
0<a<b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\Delta u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u=0
\qquad\text{on }r=a
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u=1
\qquad\text{on }r=b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the radial family:

$$
u(r)=A\log r+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $u(a)=0$:

$$
A\log a+B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $u(b)=1$:

$$
A\log b+B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the first equation from the second:

$$
A(\log b-\log a)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\log b-\log a=\log\left(\frac ba\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A\log\left(\frac ba\right)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $A$:

$$
A=\frac1{\log(b/a)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $A\log a+B=0$:

$$
B=-A\log a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A$ and combine the logarithms:

$$
\begin{aligned}
u(r)
&=\frac{\log r-\log a}{\log(b/a)}\\
&=\frac{\log(r/a)}{\log(b/a)}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting the calculated constants gives the annular solution:

$$
\boxed{
u(r)=\frac{\log(r/a)}{\log(b/a)}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Annular Bounds {#check-the-annular-bounds-63}

```{=latex}
\Needspace{10\baselineskip}
```
For $a<r<b$:

$$
1<\frac ra<\frac ba.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the logarithm is increasing:

$$
0<\log(r/a)<\log(b/a).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by the positive number $\log(b/a)$:

$$
0<
\frac{\log(r/a)}{\log(b/a)}
<1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The logarithmic inequalities therefore give:

$$
\boxed{
0<u(r)<1
\qquad\text{inside the annulus}
}.
$$

This agrees with the strong maximum principle. The values $0$ and $1$ occur on
the two different boundary components, not at interior points.

```{=latex}
\Needspace{12\baselineskip}
```
### Boundary Means Every Boundary Component {#boundary-means-every-boundary-component-64}

An annulus has:

-   an outer boundary $r=b$
-   an inner boundary $r=a$

When a maximum principle refers to $\partial\Omega$, it includes both. Ignoring
the inner circle would discard part of the data and could produce incorrect
bounds or a different boundary-value problem.

```{=latex}
\Needspace{12\baselineskip}
```
### Interior Critical Points Can Still Be Saddles {#interior-critical-points-can-still-be-saddles-65}

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
u(x,y)=x^2-y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its gradient is:

$$
\nabla u=(2x,-2y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the origin:

$$
\nabla u(0,0)=(0,0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Along the $x$-axis:

$$
u(x,0)=x^2\ge0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Along the $y$-axis:

$$
u(0,y)=-y^2\le0.
$$

Thus the origin is a saddle point, not a maximum or minimum. Maximum principles
do not forbid interior critical points; they forbid nonconstant interior
extrema.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-66}

Radial harmonic functions in two dimensions have the form $A\log r+B$ away
from the origin. On a domain with holes, every boundary component contributes
to the boundary data and the global extrema. Interior saddle points remain
possible.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Elliptic-Problem Workflow {#block-9-a-reliable-elliptic-problem-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-67}

The goal is to organise classification, boundary data, qualitative checks, and
verification into one dependable sequence.

```{=latex}
\Needspace{12\baselineskip}
```
### The Full Workflow {#the-full-workflow-68}

**Step 1: State the domain.** Identify $\Omega$, its boundary
$\partial\Omega$, and every separate boundary component.

**Step 2: Identify the principal part.** Confirm that the equation is elliptic
on the entire region where the theorem or method will be used.

```{=latex}
\Needspace{10\baselineskip}
```
**Step 3: Record the forcing.** Distinguish:

$$
\Delta u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
from:

$$
\Delta u=f.
$$

**Step 4: Classify the boundary data.**

-   Dirichlet: prescribe $u$
-   Neumann: prescribe $\partial u/\partial n$
-   Robin: prescribe a linear combination of both

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Applying A Harmonic Principle To A Forced PDE {#common-mistake-applying-a-harmonic-principle-to-a-forced-pde-69}

```{=latex}
\Needspace{10\baselineskip}
```
The statement:

$$
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
$$

```{=latex}
\Needspace{10\baselineskip}
```
applies to harmonic $u$ under the stated hypotheses. If:

$$
\Delta u=f\ne0,
$$

the sign of $f$ matters. Do not quote the harmonic result without checking the
actual equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Proving Uniqueness And Claiming Existence {#common-mistake-proving-uniqueness-and-claiming-existence-70}

If the difference of two possible solutions must be zero, then the problem has
**at most one** solution.

This argument does not show that any solution exists. Construction and
uniqueness are separate tasks.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting The Normal Direction {#common-mistake-forgetting-the-normal-direction-71}

```{=latex}
\Needspace{10\baselineskip}
```
On the left edge $x=0$ of a rectangle, the outward normal is $(-1,0)$.
Therefore:

$$
\frac{\partial u}{\partial n}=-u_x,
$$

not $u_x$.

Always calculate $\nabla u\cdot\mathbf n$ rather than guessing the sign.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Expecting Pure Neumann Uniqueness {#common-mistake-expecting-pure-neumann-uniqueness-72}

If only derivatives are prescribed, adding a constant changes neither the PDE
nor the boundary flux. A pure Neumann problem needs a normalisation to select a
single representative.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Ignoring An Inner Boundary {#common-mistake-ignoring-an-inner-boundary-73}

```{=latex}
\Needspace{10\baselineskip}
```
For an annulus:

$$
\Omega=\{a<r<b\},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the boundary is:

$$
\partial\Omega=\{r=a\}\cup\{r=b\}.
$$

Both circles matter in boundary extrema, compatibility integrals, and boundary
conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-74}

```{=latex}
\Needspace{12\baselineskip}
```
The dependable chain is:

```{=latex}
\Needspace{8\baselineskip}
```
> domain $\longrightarrow$ ellipticity $\longrightarrow$ forcing
> $\longrightarrow$ boundary-data type $\longrightarrow$ compatibility and
> qualitative bounds $\longrightarrow$ construction $\longrightarrow$
> verification $\longrightarrow$ uniqueness.

Do not let an explicit formula replace the domain and boundary checks.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Harmonicity And Mean Values {#problems-1-to-4-harmonicity-and-mean-values-75}

#### Problem 1: Verify A Cubic Harmonic Function

```{=latex}
\Needspace{10\baselineskip}
```
Show that:

$$
u(x,y)=x^3-3xy^2
$$

is harmonic on $\mathbb R^2$.

#### Problem 2: State The Correct Domain

```{=latex}
\Needspace{10\baselineskip}
```
Determine where:

$$
u(x,y)=\log\sqrt{(x-1)^2+(y+2)^2}
$$

is harmonic.

#### Problem 3: Calculate A Circle Average

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u(x,y)=5+x-2y+xy,
$$

calculate the average on the circle
$x=r\cos\theta$, $y=r\sin\theta$ and compare it with $u(0,0)$.

#### Problem 4: Bound A Harmonic Function

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $u$ is harmonic in a bounded domain, continuous on its closure, and:

$$
1\le u\le7
$$

on the boundary. What can be concluded inside the domain?

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Comparison, Ellipticity, And Dirichlet Data {#problems-5-to-8-comparison-ellipticity-and-dirichlet-data-76}

#### Problem 5: Prove A Comparison

Suppose $u$ and $v$ are harmonic in $\Omega$, continuous on
$\overline\Omega$, and $u\le v$ on $\partial\Omega$. Prove $u\le v$ in
$\Omega$.

#### Problem 6: Check Uniform Ellipticity

```{=latex}
\Needspace{10\baselineskip}
```
Show that the principal part:

$$
(4+x^2)u_{xx}+2xy\,u_{xy}+(5+y^2)u_{yy}
$$

is uniformly elliptic.

#### Problem 7: Verify A Rectangular Dirichlet Solution

```{=latex}
\Needspace{10\baselineskip}
```
On $0<x<\pi$, $0<y<2$, verify that:

$$
u(x,y)=\sin x\,\frac{\sinh y}{\sinh2}
$$

solves Laplace's equation with zero data on $x=0$, $x=\pi$, and $y=0$, and
with $u(x,2)=\sin x$.

#### Problem 8: Verify A Poisson Solution

```{=latex}
\Needspace{10\baselineskip}
```
On the unit disk, verify that:

$$
u(x,y)=\frac{1-x^2-y^2}{4}
$$

solves $\Delta u=-1$ with zero Dirichlet boundary data.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Neumann And Energy Ideas {#problems-9-to-12-neumann-and-energy-ideas-77}

#### Problem 9: Determine Compatible Constant Flux

```{=latex}
\Needspace{10\baselineskip}
```
On the unit disk, suppose:

$$
\Delta u=6
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{\partial u}{\partial n}=g_0
$$

is constant on the boundary. Find the value of $g_0$ required by
compatibility.

#### Problem 10: Exhibit The Neumann Family

```{=latex}
\Needspace{10\baselineskip}
```
Verify that:

$$
u(x,y)=\frac32(x^2+y^2)+C
$$

solves the problem in Problem 9 for every constant $C$.

#### Problem 11: Read Rectangle Normals

For $\Omega=(0,L)\times(0,H)$, express $\partial u/\partial n$ on each of the
four edges in terms of $u_x$ and $u_y$.

#### Problem 12: Use The Energy Identity

```{=latex}
\Needspace{10\baselineskip}
```
Let $w$ be harmonic in a connected bounded domain and suppose:

$$
\frac{\partial w}{\partial n}=0
$$

on the boundary. Use the energy identity to show that $w$ is constant.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 13 And 14: Radial Solutions And Diagnosis {#problems-13-and-14-radial-solutions-and-diagnosis-78}

#### Problem 13: Solve An Annular Dirichlet Problem

```{=latex}
\Needspace{10\baselineskip}
```
Find a radial harmonic function on:

$$
1<r<e^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(1)=0,
\qquad
u(e^2)=4.
$$

#### Problem 14: Diagnose A False Uniqueness Claim

A calculation shows that the difference of two solutions of a pure Neumann
problem is constant. Explain why this proves uniqueness only after an
additional normalisation is imposed.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-79}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
u(x,y)=x^3-3xy^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}(x^3-3xy^2)\\
&=3x^2-3y^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $x$:

$$
u_{xx}=6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the original function with respect to $y$:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}(x^3-3xy^2)\\
&=-6xy.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $y$:

$$
u_{yy}=-6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=6x-6x\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta u=0$, the derivative calculation proves:

$$
\boxed{
u(x,y)=x^3-3xy^2
\text{ is harmonic on }\mathbb R^2.
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
The function is:

$$
u(x,y)=\log\sqrt{(x-1)^2+(y+2)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the distance from $(1,-2)$:

$$
\rho=\sqrt{(x-1)^2+(y+2)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
u=\log\rho.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The shifted radial logarithm is harmonic wherever:

$$
\rho>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distance $\rho$ equals zero only when:

$$
(x,y)=(1,-2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the largest natural domain is:

$$
\boxed{
\mathbb R^2\setminus\{(1,-2)\}
}.
$$

The formula is also harmonic on every smaller open domain that excludes the
point $(1,-2)$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
On the circle:

$$
x=r\cos\theta,
\qquad
y=r\sin\theta,
$$

```{=latex}
\Needspace{10\baselineskip}
```
substitute into:

$$
u(x,y)=5+x-2y+xy.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
u=5+r\cos\theta-2r\sin\theta
+r^2\cos\theta\sin\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\int_0^{2\pi}\cos\theta\,d\theta=0,
\qquad
\int_0^{2\pi}\sin\theta\,d\theta=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the remaining product term, use:

$$
\cos\theta\sin\theta=\frac12\sin(2\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product term $\cos\theta\sin\theta$ has integral zero over a full period
because $\sin(2\theta)$ does. Thus every nonconstant term has zero average,
and:

$$
\frac1{2\pi}\int_0^{2\pi}u\,d\theta=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the centre:

$$
u(0,0)=5.
$$

Hence the circle average equals the centre value, as required by the
mean-value property.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The boundary data satisfy:

$$
1\le u\le7
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $u$ is harmonic, the minimum principle gives:

$$
u\ge1
\qquad\text{in }\overline\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The maximum principle gives:

$$
u\le7
\qquad\text{in }\overline\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the inequalities:

$$
\boxed{
1\le u(x,y)\le7
\quad\text{throughout }\overline\Omega
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-80}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
u\le v
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
w=u-v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $u$ and $v$ are harmonic:

$$
\Delta u=0,
\qquad
\Delta v=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\Delta w
&=\Delta(u-v)\\
&=\Delta u-\Delta v\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $w$ is harmonic. On the boundary:

$$
w=u-v\le0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The maximum principle gives:

$$
w\le0
\qquad\text{throughout }\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $w=u-v$:

$$
u-v\le0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $v$ to both sides:

$$
\boxed{
u\le v
\quad\text{throughout }\Omega
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The principal part is:

$$
(4+x^2)u_{xx}+2xy\,u_{xy}+(5+y^2)u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a vector $\zeta=(\zeta_1,\zeta_2)^T$, the quadratic form is:

$$
\begin{aligned}
Q
={}&(4+x^2)\zeta_1^2
+2xy\zeta_1\zeta_2
+(5+y^2)\zeta_2^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Complete the square in the last three terms:

$$
Q
=4\zeta_1^2+5\zeta_2^2
+(x\zeta_1+y\zeta_2)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the square is nonnegative:

$$
Q\ge4\zeta_1^2+5\zeta_2^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant-coefficient part satisfies:

$$
4\zeta_1^2+5\zeta_2^2
\ge4(\zeta_1^2+\zeta_2^2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
Q\ge4|\zeta|^2
}.
$$

The operator is uniformly elliptic with $\lambda=4$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Use the proposed function:

$$
u(x,y)=\sin x\,\frac{\sinh y}{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate twice with respect to $x$:

$$
u_x=\cos x\,\frac{\sinh y}{\sinh2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{xx}=-\sin x\,\frac{\sinh y}{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate twice with respect to $y$:

$$
u_y=\sin x\,\frac{\cosh y}{\sinh2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{yy}=\sin x\,\frac{\sinh y}{\sinh2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
At $x=0$:

$$
u(0,y)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $x=\pi$:

$$
u(\pi,y)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $y=0$:

$$
u(x,0)=\sin x\,\frac{\sinh0}{\sinh2}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $y=2$:

$$
\begin{aligned}
u(x,2)
&=\sin x\,\frac{\sinh2}{\sinh2}\\
&=\sin x.
\end{aligned}
$$

The PDE and all four boundary conditions hold.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
u(x,y)=\frac{1-x^2-y^2}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $x$ twice:

$$
u_x=-\frac{x}{2},
\qquad
u_{xx}=-\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $y$ twice:

$$
u_y=-\frac{y}{2},
\qquad
u_{yy}=-\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the two calculated second derivatives:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=-\frac12-\frac12\\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the unit circle:

$$
x^2+y^2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-81}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The compatibility condition is:

$$
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the unit disk:

$$
f=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The area is $\pi$, so:

$$
\begin{aligned}
\iint_\Omega6\,dA
&=6(\pi)\\
&=6\pi.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The boundary flux is the constant $g_0$. The unit-circle circumference is
$2\pi$, so:

$$
\begin{aligned}
\int_{\partial\Omega}g_0\,ds
&=g_0(2\pi).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set the two integrals equal:

$$
6\pi=2\pi g_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2\pi$:

$$
\boxed{
g_0=3
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u(x,y)=\frac32(x^2+y^2)+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate twice:

$$
u_{xx}=3,
\qquad
u_{yy}=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\Delta u
&=u_{xx}+u_{yy}\\
&=3+3\\
&=6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The gradient is:

$$
\nabla u=(3x,3y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the unit circle, the outward normal is:

$$
\mathbf n=(x,y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The constant $C$ disappears from every derivative. Hence:

$$
\boxed{
u(x,y)=\frac32(x^2+y^2)+C
}
$$

solves the compatible Neumann problem for every real $C$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\Omega=(0,L)\times(0,H),
$$

```{=latex}
\Needspace{10\baselineskip}
```
use:

$$
\frac{\partial u}{\partial n}
=\nabla u\cdot\mathbf n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the left edge $x=0$:

$$
\mathbf n=(-1,0),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\frac{\partial u}{\partial n}=-u_x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the right edge $x=L$:

$$
\mathbf n=(1,0),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\frac{\partial u}{\partial n}=u_x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the bottom edge $y=0$:

$$
\mathbf n=(0,-1),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\frac{\partial u}{\partial n}=-u_y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
On the top edge $y=H$:

$$
\mathbf n=(0,1),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\frac{\partial u}{\partial n}=u_y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The energy identity is:

$$
\iint_\Omega|\nabla w|^2\,dA
=\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w\Delta w\,dA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $w$ is harmonic:

$$
\Delta w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the normal derivative is zero:

$$
\frac{\partial w}{\partial n}=0
\qquad\text{on }\partial\Omega.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both conditions into the identity:

$$
\begin{aligned}
\iint_\Omega|\nabla w|^2\,dA
&=\int_{\partial\Omega}w(0)\,ds
-\iint_\Omega w(0)\,dA\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $|\nabla w|^2\ge0$, a zero integral gives:

$$
\nabla w=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
throughout the domain. Since $\Omega$ is connected:

$$
\boxed{
w\text{ is constant}
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 13 And 14 {#worked-answers-problems-13-and-14-82}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 13

```{=latex}
\Needspace{10\baselineskip}
```
A radial harmonic function on an annulus has the form:

$$
u(r)=A\log r+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply:

$$
u(1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\log1=0$:

$$
\begin{aligned}
u(1)
&=A\log1+B\\
&=B.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply:

$$
u(e^2)=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $B=0$:

$$
A\log(e^2)=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\log(e^2)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $\log(e^2)=2$, the equation $A\log(e^2)=4$ becomes:

$$
2A=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
u(r)=2\log r
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the boundary values:

$$
u(1)=2\log1=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
At the outer boundary $r=e^2$:

$$
u(e^2)=2\log(e^2)=2(2)=4.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 14

```{=latex}
\Needspace{10\baselineskip}
```
Suppose two solutions $u_1$ and $u_2$ of the same pure Neumann problem satisfy:

$$
u_1-u_2=C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This result does not force $C=0$. Every value of $C$ gives the same derivatives:

$$
\Delta(u_2+C)=\Delta u_2
$$

```{=latex}
\Needspace{10\baselineskip}
```
The normal derivative is also unchanged:

$$
\frac{\partial}{\partial n}(u_2+C)
=\frac{\partial u_2}{\partial n}.
$$

Therefore the PDE and pure Neumann boundary data cannot distinguish $u_2$ from
$u_2+C$.

```{=latex}
\Needspace{10\baselineskip}
```
Add a normalisation, for example:

$$
\iint_\Omega u\,dA=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If both $u_1$ and $u_2$ satisfy this normalisation, then:

$$
\iint_\Omega(u_1-u_2)\,dA=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $u_1-u_2=C$:

$$
\iint_\Omega C\,dA=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
C\,|\Omega|=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a domain with positive area, $|\Omega|>0$, so:

$$
C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Only after the normalisation is imposed can we conclude:

$$
\boxed{
u_1=u_2
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 33 Final Summary {#chapter-33-final-summary-83}

```{=latex}
\Needspace{10\baselineskip}
```
A function is harmonic in $\Omega$ when:

$$
\Delta u=u_{xx}+u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its centre value equals its average over every contained circle or disk. This
mean-value property leads to:

$$
\max_{\overline\Omega}u
=\max_{\partial\Omega}u
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\min_{\overline\Omega}u
=\min_{\partial\Omega}u
$$

for a harmonic function continuous on the closure of a bounded domain.

A nonconstant harmonic function cannot attain an interior maximum or minimum.
Applying this principle to the difference of two solutions proves uniqueness
for the Dirichlet problem.

```{=latex}
\Needspace{10\baselineskip}
```
For a general operator:

$$
L[u]
=a u_{xx}+2b u_{xy}+c u_{yy}
+d u_x+e u_y+q u,
$$

```{=latex}
\Needspace{10\baselineskip}
```
uniform ellipticity means that one $\lambda>0$ satisfies:

$$
a\zeta_1^2+2b\zeta_1\zeta_2+c\zeta_2^2
\ge\lambda(\zeta_1^2+\zeta_2^2).
$$

The sign of the zero-order coefficient matters when applying a general maximum
principle.

```{=latex}
\Needspace{10\baselineskip}
```
The three main boundary-data types are:

$$
\begin{array}{c|c}
\text{Dirichlet}&u=g\\
\text{Neumann}&\partial u/\partial n=g\\
\text{Robin}&\alpha u+\beta\,\partial u/\partial n=g
\end{array}
$$

```{=latex}
\Needspace{10\baselineskip}
```
A pure Neumann problem for $\Delta u=f$ requires:

$$
\iint_\Omega f\,dA
=\int_{\partial\Omega}g\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When it is solvable, its solutions differ by an additive constant. Green's
identity explains both Dirichlet uniqueness and Neumann uniqueness up to a
constant:

$$
\iint_\Omega|\nabla w|^2\,dA
=\int_{\partial\Omega}
w\frac{\partial w}{\partial n}\,ds
-\iint_\Omega w\Delta w\,dA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Radial harmonic functions in two dimensions have the form:

$$
u(r)=A\log r+B,
$$

```{=latex}
\Needspace{12\baselineskip}
```
on domains that exclude $r=0$.

```{=latex}
\Needspace{8\baselineskip}
```
> state the domain, confirm ellipticity, distinguish harmonic from forced
> equations, identify the boundary-data type, check compatibility, predict
> qualitative bounds, construct the solution, verify every boundary component,
> and prove uniqueness separately.

[^1]: The functions $u$ and $v$ are called harmonic
    conjugates. This connection supplies many harmonic examples, but complex
    analysis is not required for the maximum-principle arguments in this
    chapter.

[^2]: On a rectangle, boundary formulas meeting at one corner should
    normally assign the same corner value when a solution continuous on the
    closed rectangle is required.

[^3]: This is a global balance law. If the interior creates a
    net amount of a quantity, the boundary must carry the same net amount
    outward in a steady state.
