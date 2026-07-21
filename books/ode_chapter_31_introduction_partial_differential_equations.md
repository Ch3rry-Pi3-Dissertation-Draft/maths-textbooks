# An Introduction To Partial Differential Equations

An ordinary differential equation describes an unknown function of one
independent variable. A partial differential equation allows the unknown
function to depend on several independent variables at once.

That change is more than a notation change. A solution now describes a surface,
a temperature field, a vibrating string, or another distributed quantity. It
may need initial data in time and boundary data in space.

This chapter will:

- explain partial derivatives and mixed derivatives in PDE notation
- classify equations by order and linearity
- introduce the heat, wave, and Laplace equations
- distinguish elliptic, parabolic, and hyperbolic second-order equations
- verify proposed solutions one derivative at a time
- integrate simple PDEs without losing arbitrary functions
- derive separated solutions of the fixed-end heat equation
- derive separated solutions of the fixed-end wave equation
- apply initial and boundary conditions to finite mode combinations
- build a reliable introductory PDE workflow

---

## Block 1: Functions Of Several Variables

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what a partial derivative measures and to make the
subscript notation precise before using it inside differential equations.

> a partial derivative changes one independent variable while temporarily
> holding the others fixed.

</details>

<details open>
<summary><strong>From A Curve To A Surface</strong></summary>

An ODE commonly uses an unknown function such as:

$$
y=y(x).
$$

Its graph is a curve. A PDE may instead use:

$$
u=u(x,y).
$$

Its graph can be viewed as a surface above the $xy$-plane. The value $u(x,y)$
may represent, for example, temperature at the point $(x,y)$.

If time is also present, we may write:

$$
u=u(x,y,t).
$$

Here $x$ and $y$ are spatial variables and $t$ is time. The number of
independent variables is determined by the model, not by the letter used for
the unknown function.

</details>

<details open>
<summary><strong>First Partial Derivatives</strong></summary>

For $u=u(x,y)$, the derivative with respect to $x$ is written:

$$
u_x=\frac{\partial u}{\partial x}.
$$

When calculating $u_x$, treat $y$ as a constant. Similarly:

$$
u_y=\frac{\partial u}{\partial y},
$$

and $x$ is held constant while differentiating with respect to $y$.

Consider:

$$
u(x,y)=x^2y+e^{xy}.
$$

Differentiate with respect to $x$, holding $y$ fixed:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}\left(x^2y+e^{xy}\right)\\
&=2xy+ye^{xy}.
\end{aligned}
$$

For the exponential term, the chain rule contributes
$\partial(xy)/\partial x=y$.

</details>

<details open>
<summary><strong>Differentiate The Same Function With Respect To Y</strong></summary>

Return to:

$$
u(x,y)=x^2y+e^{xy}.
$$

Differentiate with respect to $y$, holding $x$ fixed:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}\left(x^2y+e^{xy}\right)\\
&=x^2+xe^{xy}.
\end{aligned}
$$

The two partial derivatives are different because they measure change in two
different coordinate directions.

</details>

<details open>
<summary><strong>Second And Mixed Derivatives</strong></summary>

Differentiate $u_x$ again with respect to $x$ to obtain:

$$
u_{xx}=\frac{\partial^2u}{\partial x^2}.
$$

Differentiate $u_x$ with respect to $y$ to obtain the mixed derivative:

$$
u_{xy}
=\frac{\partial}{\partial y}\left(u_x\right)
=\frac{\partial^2u}{\partial y\,\partial x}.
$$

For $u=x^2y+e^{xy}$, recall:

$$
u_x=2xy+ye^{xy}.
$$

Differentiate this expression with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=\frac{\partial}{\partial y}\left(2xy+ye^{xy}\right)\\
&=2x+e^{xy}+xye^{xy}.
\end{aligned}
$$

The final two terms come from the product rule applied to $ye^{xy}$.

</details>

<details open>
<summary><strong>Check The Other Mixed Order</strong></summary>

Recall:

$$
u_y=x^2+xe^{xy}.
$$

Differentiate with respect to $x$:

$$
\begin{aligned}
u_{yx}
&=\frac{\partial}{\partial x}\left(x^2+xe^{xy}\right)\\
&=2x+e^{xy}+xye^{xy}.
\end{aligned}
$$

Thus:

$$
u_{xy}=u_{yx}.
$$

For functions with continuous mixed second derivatives, the order of these two
different differentiations may be exchanged.[^mixed-partials]

[^mixed-partials]: Equality of mixed partials requires regularity; it is not
    guaranteed for every imaginable function. Continuous second partial
    derivatives are a standard sufficient condition.

</details>

<details open>
<summary><strong>Reading Subscript Notation</strong></summary>

For $u=u(x,t)$:

$$
\begin{aligned}
u_t&=\frac{\partial u}{\partial t},\\
u_{xx}&=\frac{\partial^2u}{\partial x^2},\\
u_{xt}&=\frac{\partial}{\partial t}\left(u_x\right),\\
u_{xtt}&=\frac{\partial}{\partial t}
\left(\frac{\partial}{\partial t}(u_x)\right).
\end{aligned}
$$

Read the derivative subscripts from left to right as the history of
differentiation. Thus $u_{xtt}$ means differentiate with respect to $x$ once,
then with respect to $t$ twice.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

A PDE solution depends on at least two independent variables. A partial
derivative changes one variable at a time, and its subscript records the
direction and order of differentiation.

</details>

---

## Block 2: Classifying A Partial Differential Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to classify PDEs by order and linearity without confusing the
number of variables with the order of the equation.

</details>

<details open>
<summary><strong>The Order Comes From The Highest Derivative</strong></summary>

The order of a PDE is the order of its highest derivative.

For example:

$$
u_t+3u_x=0
$$

is first order, because only first partial derivatives occur.

The equation:

$$
u_{tt}-4u_{xx}=0
$$

is second order. It involves two independent variables, but the number of
variables does not determine the differential order.

The equation:

$$
u_{xxy}+u_t=0
$$

is third order because $u_{xxy}$ contains three differentiations.

</details>

<details open>
<summary><strong>Linear Partial Differential Equations</strong></summary>

A PDE is linear in $u$ when:

- $u$ and all its derivatives occur only to the first power
- products such as $uu_x$ or $u_xu_y$ do not occur
- coefficients may depend on the independent variables but not on $u$

For example:

$$
(1+x^2)u_{xx}+e^yu_y-3u=\sin x
$$

is linear. The coefficient $1+x^2$ varies with $x$, and $e^y$ varies with $y$,
but neither coefficient depends on $u$.

The associated homogeneous equation is:

$$
(1+x^2)u_{xx}+e^yu_y-3u=0.
$$

</details>

<details open>
<summary><strong>Semilinear, Quasilinear, And Fully Nonlinear</strong></summary>

These terms describe how the highest-order derivatives appear.

A **semilinear** second-order equation is linear in the second derivatives,
with coefficients depending only on the independent variables, but lower-order
terms may be nonlinear. For example:

$$
u_{xx}+u_{yy}+(u_x)^2=0.
$$

A **quasilinear** equation is linear in its highest-order derivatives, but
their coefficients may depend on $u$ or lower derivatives. For example:

$$
u_t+u\,u_x=0
$$

is first-order quasilinear: $u_t$ and $u_x$ occur linearly, but the coefficient
of $u_x$ is the unknown function $u$.

A **fully nonlinear** second-order equation contains nonlinear combinations of
the highest derivatives. For example:

$$
u_{xx}u_{yy}-(u_{xy})^2=1.
$$

The classification describes algebraic structure; it does not say whether the
equation is easy to solve.

</details>

<details open>
<summary><strong>Worked Classification</strong></summary>

Classify:

$$
xu_{tt}+u_x+u^3=0.
$$

The highest derivative is $u_{tt}$, which is second order. Therefore the PDE is
second order.

The highest derivative appears linearly, and its coefficient $x$ depends only
on an independent variable. The lower-order term $u^3$ is nonlinear.

The order and nonlinearity checks therefore give:

$$
\boxed{\text{the equation is second-order semilinear}.}
$$

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Order is determined by the highest derivative. Linearity asks how the unknown
function and its derivatives occur, while semilinear and quasilinear labels
focus specifically on the highest-order derivatives.

</details>

---

## Block 3: The Three Classical Model Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to identify the heat, wave, and Laplace equations and connect each
formula with the kind of behaviour it models.

</details>

<details open>
<summary><strong>The One-Dimensional Heat Equation</strong></summary>

For a temperature $u(x,t)$ in a thin rod, the heat equation is:

$$
\boxed{u_t=\kappa u_{xx}},
\qquad \kappa>0.
$$

Here:

- $x$ is position
- $t$ is time
- $u(x,t)$ is temperature
- $\kappa$ is thermal diffusivity

The second spatial derivative measures local curvature. At a local temperature
maximum, $u_{xx}<0$, so $u_t<0$: the peak cools. At a local minimum,
$u_{xx}>0$, so $u_t>0$: the dip warms.

In short:

> heat diffusion smooths spatial differences as time passes.

</details>

<details open>
<summary><strong>The One-Dimensional Wave Equation</strong></summary>

For the displacement $u(x,t)$ of a stretched string, the wave equation is:

$$
\boxed{u_{tt}=c^2u_{xx}},
\qquad c>0.
$$

The second time derivative is acceleration, and the second spatial derivative
measures curvature. The constant $c$ is the wave speed.

Unlike the heat equation, the wave equation does not simply smooth a profile.
It supports disturbances that travel and oscillate.

</details>

<details open>
<summary><strong>Laplace's Equation</strong></summary>

For a steady field $u(x,y)$ in two spatial dimensions, Laplace's equation is:

$$
\boxed{u_{xx}+u_{yy}=0}.
$$

The combination:

$$
\nabla^2u=u_{xx}+u_{yy}
$$

is called the Laplacian. A function satisfying Laplace's equation is called
**harmonic**.

Laplace's equation has no time variable. It commonly describes an equilibrium
or steady state, such as a temperature distribution after transient changes
have died away.[^laplace-equilibrium]

[^laplace-equilibrium]: If a two-dimensional heat model satisfies
    $u_t=\kappa(u_{xx}+u_{yy})$, then a steady state has $u_t=0$ and therefore
    satisfies $u_{xx}+u_{yy}=0$.

</details>

<details open>
<summary><strong>Initial Data And Boundary Data</strong></summary>

A time-dependent PDE usually needs data of two kinds.

An **initial condition** describes the state at one time. For example:

$$
u(x,0)=f(x).
$$

A **boundary condition** describes what happens at the spatial edge. On
$0\le x\le L$, fixed zero endpoint values are:

$$
u(0,t)=0,
\qquad
u(L,t)=0.
$$

For the wave equation, which contains a second time derivative, both initial
displacement and initial velocity are commonly specified:

$$
u(x,0)=f(x),
\qquad
u_t(x,0)=g(x).
$$

</details>

<details open>
<summary><strong>Second-Order Type In Two Variables</strong></summary>

The second-order part of a linear PDE in variables $x,y$ may be written:

$$
Au_{xx}+2Bu_{xy}+Cu_{yy}.
$$

At a point, calculate:

$$
\Delta=B^2-AC.
$$

The equation is classified there as:

$$
\begin{array}{c|c}
\Delta<0 & \text{elliptic}\\
\Delta=0 & \text{parabolic}\\
\Delta>0 & \text{hyperbolic}
\end{array}
$$

This classification predicts broad qualitative behaviour; it does not replace
the order and linearity classification.

</details>

<details open>
<summary><strong>Classify The Three Models By Type</strong></summary>

For Laplace's equation:

$$
u_{xx}+u_{yy}=0,
$$

For $u_{xx}+u_{yy}=0$, the coefficients are $A=1$, $B=0$, and $C=1$.
Therefore:

$$
\Delta=0^2-(1)(1)=-1<0,
$$

so Laplace's equation is elliptic.

For the heat equation written as:

$$
\kappa u_{xx}-u_t=0,
$$

in variables $x,t$, the second-order coefficients are $A=\kappa$, $B=0$,
and $C=0$. Hence $\Delta=0$, so it is parabolic.

For the wave equation written as:

$$
c^2u_{xx}-u_{tt}=0,
$$

we have $A=c^2$, $B=0$, and $C=-1$. Thus:

$$
\Delta=0^2-(c^2)(-1)=c^2>0,
$$

so it is hyperbolic.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Heat flow is parabolic, wave motion is hyperbolic, and Laplace equilibrium is
elliptic. Their derivative structures reflect diffusion, propagation, and
steady balance.

</details>

---

## Block 4: Verifying Proposed Solutions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to verify candidate solutions by calculating only the derivatives
the PDE actually requires and then checking the resulting identity.

</details>

<details open>
<summary><strong>Worked Heat-Equation Verification</strong></summary>

Verify that:

$$
u(x,t)=e^{-9\kappa t}\sin(3x)
$$

solves:

$$
u_t=\kappa u_{xx}.
$$

Differentiate with respect to $t$:

$$
\begin{aligned}
u_t
&=\frac{\partial}{\partial t}
\left(e^{-9\kappa t}\sin(3x)\right)\\
&=-9\kappa e^{-9\kappa t}\sin(3x).
\end{aligned}
$$

Now differentiate twice with respect to $x$:

$$
\begin{aligned}
u_x
&=3e^{-9\kappa t}\cos(3x),\\
u_{xx}
&=-9e^{-9\kappa t}\sin(3x).
\end{aligned}
$$

Multiply $u_{xx}$ by $\kappa$:

$$
\kappa u_{xx}
=-9\kappa e^{-9\kappa t}\sin(3x).
$$

This is exactly $u_t$. Therefore the heat equation holds for every $(x,t)$ in
the domain.

</details>

<details open>
<summary><strong>A Travelling-Wave Family</strong></summary>

Let $F$ be twice differentiable and define:

$$
u(x,t)=F(x-ct).
$$

We will verify that every such function solves:

$$
u_{tt}=c^2u_{xx}.
$$

Introduce the inner variable:

$$
\xi=x-ct.
$$

Then:

$$
u(x,t)=F(\xi).
$$

Keeping this inner variable visible prevents chain-rule factors from being
lost.

</details>

<details open>
<summary><strong>Differentiate The Travelling Wave</strong></summary>

Since $\xi=x-ct$:

$$
\xi_x=1,
\qquad
\xi_t=-c.
$$

Differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=F'(\xi)\xi_x\\
&=F'(\xi),
\end{aligned}
$$

Differentiate $u_x=F'(\xi)$ once more with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=F''(\xi)\xi_x\\
&=F''(\xi).
\end{aligned}
$$

Differentiate with respect to $t$:

$$
\begin{aligned}
u_t
&=F'(\xi)\xi_t\\
&=-cF'(\xi).
\end{aligned}
$$

Differentiate once more with respect to $t$:

$$
\begin{aligned}
u_{tt}
&=-cF''(\xi)\xi_t\\
&=-cF''(\xi)(-c)\\
&=c^2F''(\xi).
\end{aligned}
$$

Since $u_{xx}=F''(\xi)$:

$$
u_{tt}=c^2u_{xx}.
$$

Thus every twice-differentiable profile $F(x-ct)$ travels to the right at
speed $c$ without changing shape.

</details>

<details open>
<summary><strong>Worked Harmonic-Function Verification</strong></summary>

Check whether:

$$
u(x,y)=e^{2x}\cos(2y)
$$

is harmonic.

Calculate the second $x$-derivative:

$$
\begin{aligned}
u_x&=2e^{2x}\cos(2y),\\
u_{xx}&=4e^{2x}\cos(2y).
\end{aligned}
$$

Calculate the second $y$-derivative:

$$
\begin{aligned}
u_y&=-2e^{2x}\sin(2y),\\
u_{yy}&=-4e^{2x}\cos(2y).
\end{aligned}
$$

Add the required derivatives:

$$
\begin{aligned}
u_{xx}+u_{yy}
&=4e^{2x}\cos(2y)-4e^{2x}\cos(2y)\\
&=0.
\end{aligned}
$$

Therefore $u$ satisfies Laplace's equation and is harmonic.

</details>

<details open>
<summary><strong>A Fast Non-Solution Check</strong></summary>

Consider:

$$
v(x,t)=e^{-\kappa t}\sin(2x).
$$

For the heat equation $v_t=\kappa v_{xx}$:

$$
v_t=-\kappa e^{-\kappa t}\sin(2x),
$$

while:

$$
\kappa v_{xx}
=-4\kappa e^{-\kappa t}\sin(2x).
$$

These expressions are not identical. Therefore $v$ is not a solution, even
though it has the same general product shape as a separated heat mode.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Verification is substitution, not visual resemblance. Calculate the required
partial derivatives, preserve every chain-rule factor, and compare both sides
as functions of all independent variables.

</details>

---

## Block 5: Solving Simple PDEs By Integration

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to integrate with respect to one variable while preserving the
most general dependence on every variable held fixed.

> in partial integration, the constant of integration becomes an arbitrary
> function of the untouched variables.

</details>

<details open>
<summary><strong>Why The Constant Becomes A Function</strong></summary>

Suppose:

$$
u_x=0.
$$

For each fixed $y$, the function does not change as $x$ changes. Therefore $u$
may still depend on $y$:

$$
\boxed{u(x,y)=F(y).}
$$

Writing only $u=C$ would lose valid solutions such as $u=y^2$ or $u=\sin y$.
Both have $u_x=0$.

For $u=u(x,y,z)$, the corresponding result is:

$$
u_x=0
\quad\Longrightarrow\quad
u=F(y,z).
$$

</details>

<details open>
<summary><strong>Worked First-Order Integration</strong></summary>

Find the general solution of:

$$
u_x=2x+3y^2.
$$

Integrate with respect to $x$, treating $y$ as constant:

$$
u(x,y)=\int(2x+3y^2)\,dx.
$$

Integrate each term:

$$
\int2x\,dx=x^2,
$$

and, because $3y^2$ is constant with respect to $x$:

$$
\int3y^2\,dx=3xy^2.
$$

Add the arbitrary function of the untouched variable:

$$
\boxed{u(x,y)=x^2+3xy^2+F(y).}
$$

Check by differentiating with respect to $x$:

$$
u_x=2x+3y^2+0.
$$

</details>

<details open>
<summary><strong>Apply Data Along A Boundary</strong></summary>

Now impose:

$$
u(0,y)=e^y.
$$

Start from the general family:

$$
u(x,y)=x^2+3xy^2+F(y).
$$

Set $x=0$:

$$
\begin{aligned}
u(0,y)
&=0^2+3(0)y^2+F(y)\\
&=F(y).
\end{aligned}
$$

The boundary data require $u(0,y)=e^y$, so:

$$
F(y)=e^y.
$$

Substitute this function into the general family:

$$
\boxed{u(x,y)=x^2+3xy^2+e^y.}
$$

</details>

<details open>
<summary><strong>Integrate A Mixed-Derivative Equation</strong></summary>

Find the general solution of:

$$
u_{xy}=4xy.
$$

To solve $u_{xy}=4xy$, first integrate with respect to $y$. Since $u_{xy}$ is
the $y$-derivative of $u_x$:

$$
u_x=\int4xy\,dy.
$$

Treat $x$ as constant:

$$
u_x=2xy^2+A(x).
$$

The integration function is $A(x)$ because differentiating it with respect to
$y$ gives zero.

Now integrate with respect to $x$:

$$
u=\int\left[2xy^2+A(x)\right]dx.
$$

Therefore:

$$
u=x^2y^2+G(x)+H(y),
$$

where $G'(x)=A(x)$ and $H(y)$ is the new arbitrary function introduced by the
second integration.

Hence:

$$
\boxed{u(x,y)=x^2y^2+G(x)+H(y).}
$$

</details>

<details open>
<summary><strong>Verify The Mixed-Derivative Family</strong></summary>

Start from:

$$
u(x,y)=x^2y^2+G(x)+H(y).
$$

For $u=x^2y^2+G(x)+H(y)$, differentiate first with respect to $x$:

$$
u_x=2xy^2+G'(x).
$$

Now differentiate with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=\frac{\partial}{\partial y}
\left[2xy^2+G'(x)\right]\\
&=4xy+0\\
&=4xy.
\end{aligned}
$$

Both arbitrary functions are valid: $G(x)$ disappears after the $y$
derivative, and $H(y)$ disappeared during the first $x$ derivative.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

When integrating with respect to one variable, preserve arbitrary dependence
on all other variables. Repeated partial integration may produce more than one
arbitrary function.

</details>

---

## Block 6: Separating The Fixed-End Heat Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn one PDE into two ODEs, justify the separation constant, and
show why fixed endpoint conditions select only certain spatial frequencies.

</details>

<details open>
<summary><strong>The Heat Problem</strong></summary>

Consider a rod on $0\le x\le L$ whose endpoints are held at zero temperature:

$$
u_t=\kappa u_{xx},
\qquad \kappa>0,
$$

with:

$$
u(0,t)=0,
\qquad
u(L,t)=0.
$$

The initial temperature will be imposed later. First we seek nonzero solutions
that satisfy the PDE and the two boundary conditions.

Assume a product form:

$$
\boxed{u(x,t)=X(x)T(t).}
$$

This is an assumption about the form of a solution. It is called separation of
variables because all $x$-dependence is placed in $X$ and all $t$-dependence is
placed in $T$.

</details>

<details open>
<summary><strong>Substitute The Product</strong></summary>

From:

$$
u(x,t)=X(x)T(t),
$$

differentiate with respect to $t$:

$$
u_t=X(x)T'(t).
$$

Differentiate twice with respect to $x$:

$$
u_{xx}=X''(x)T(t).
$$

Substitute these expressions into $u_t=\kappa u_{xx}$:

$$
X(x)T'(t)=\kappa X''(x)T(t).
$$

For a nontrivial separated solution, work where $X(x)T(t)\ne0$ and divide by
$\kappa X(x)T(t)$:

$$
\frac{T'(t)}{\kappa T(t)}
=\frac{X''(x)}{X(x)}.
$$

</details>

<details open>
<summary><strong>Why Both Ratios Must Be Constant</strong></summary>

In:

$$
\frac{T'(t)}{\kappa T(t)}
=\frac{X''(x)}{X(x)},
$$

the left side depends only on $t$, while the right side depends only on $x$.
Yet the equality must hold for every admissible pair $(x,t)$.

Fix one value of $t$. The left side is then one number, so the right side must
have that same value for every $x$. Therefore $X''/X$ is constant. The same
argument then makes $T'/(\kappa T)$ that constant as well.

Write the common constant as $-\lambda$:

$$
\boxed{
\frac{T'}{\kappa T}
=\frac{X''}{X}
=-\lambda
}.
$$

The minus sign is a convention chosen because positive $\lambda$ will produce
the sine modes required by the fixed endpoints.

</details>

<details open>
<summary><strong>Obtain The Two Ordinary Differential Equations</strong></summary>

Start with the spatial ratio:

$$
\frac{X''}{X}=-\lambda.
$$

Multiply by $X$:

$$
X''=-\lambda X.
$$

Move every term to the left:

$$
\boxed{X''+\lambda X=0.}
$$

Now use the temporal ratio:

$$
\frac{T'}{\kappa T}=-\lambda.
$$

Multiply by $\kappa T$:

$$
\boxed{T'+\kappa\lambda T=0.}
$$

The PDE has become a spatial boundary-value problem and a temporal
first-order ODE.

</details>

<details open>
<summary><strong>Transfer The Boundary Conditions To X</strong></summary>

The first boundary condition is:

$$
u(0,t)=0.
$$

Using $u=XT$:

$$
X(0)T(t)=0
$$

for every $t$. A nontrivial separated solution cannot have $T(t)$ identically
zero, so:

$$
X(0)=0.
$$

Similarly, $u(L,t)=0$ gives:

$$
X(L)T(t)=0,
$$

and hence:

$$
X(L)=0.
$$

The spatial problem is therefore:

$$
X''+\lambda X=0,
\qquad
X(0)=X(L)=0.
$$

</details>

<details open>
<summary><strong>Case One: Negative Lambda</strong></summary>

Suppose $\lambda<0$. Write:

$$
\lambda=-\mu^2,
\qquad \mu>0.
$$

The spatial equation becomes:

$$
X''-\mu^2X=0.
$$

Its general solution is:

$$
X(x)=A\cosh(\mu x)+B\sinh(\mu x).
$$

Apply $X(0)=0$:

$$
\begin{aligned}
0
&=A\cosh(0)+B\sinh(0)\\
&=A.
\end{aligned}
$$

Thus $A=0$ and $X=B\sinh(\mu x)$. Now apply $X(L)=0$:

$$
B\sinh(\mu L)=0.
$$

Because $\mu L>0$, $\sinh(\mu L)\ne0$. Therefore $B=0$, leaving only
$X=0$. Negative $\lambda$ produces no nontrivial fixed-end mode.

</details>

<details open>
<summary><strong>Case Two: Zero Lambda</strong></summary>

If $\lambda=0$, the spatial equation is:

$$
X''=0.
$$

For the zero-separation case $X''=0$, integrate twice:

$$
X(x)=A+Bx.
$$

Apply $X(0)=0$:

$$
A=0.
$$

Then $X(L)=0$ gives:

$$
BL=0.
$$

Since $L>0$, divide by $L$ to obtain $B=0$. Again only the trivial spatial
solution remains.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Case Three: Positive Lambda</strong></summary>

Suppose $\lambda>0$ and define:

$$
\alpha=\sqrt\lambda.
$$

The spatial equation is:

$$
X''+\alpha^2X=0.
$$

Its general solution is:

$$
X(x)=A\cos(\alpha x)+B\sin(\alpha x).
$$

Apply $X(0)=0$:

$$
\begin{aligned}
0
&=A\cos(0)+B\sin(0)\\
&=A.
\end{aligned}
$$

Therefore $A=0$, so:

$$
X(x)=B\sin(\alpha x).
$$

Apply $X(L)=0$:

$$
B\sin(\alpha L)=0.
$$

For a nontrivial solution, $B\ne0$. Divide by $B$:

$$
\sin(\alpha L)=0.
$$

</details>

<details open>
<summary><strong>Find The Allowed Spatial Frequencies</strong></summary>

The sine function is zero at integer multiples of $\pi$. Therefore:

$$
\alpha L=n\pi,
\qquad n=1,2,3,\ldots.
$$

The value $n=0$ would reproduce the already-trivial $\lambda=0$ case, so the
positive integers begin at $1$.

Solve for $\alpha$:

$$
\alpha_n=\frac{n\pi}{L}.
$$

Since $\lambda=\alpha^2$:

$$
\boxed{
\lambda_n=\left(\frac{n\pi}{L}\right)^2
}.
$$

The associated spatial functions are:

$$
\boxed{
X_n(x)=\sin\left(\frac{n\pi x}{L}\right)
},
$$

where an arbitrary nonzero multiplier has been left for the final solution.

</details>

<details open>
<summary><strong>Solve The Temporal Equation</strong></summary>

For $\lambda=\lambda_n$, the temporal equation is:

$$
T_n'+\kappa\lambda_nT_n=0.
$$

Insert
$\lambda_n=(n\pi/L)^2$
into the temporal equation $T_n'+\kappa\lambda_nT_n=0$:

$$
T_n'
+\kappa\left(\frac{n\pi}{L}\right)^2T_n=0.
$$

This first-order linear ODE has solution:

$$
T_n(t)=C_ne^{-\kappa(n\pi/L)^2t}.
$$

Multiply the spatial and temporal factors:

$$
\boxed{
u_n(x,t)
=C_ne^{-\kappa(n\pi/L)^2t}
\sin\left(\frac{n\pi x}{L}\right)
}.
$$

Each $u_n$ is a separated heat mode.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Fixed zero endpoints reject negative and zero separation values. Positive
values are quantized as $(n\pi/L)^2$, and each spatial sine mode decays
exponentially in time.

</details>

---

## Block 7: Combining Heat Modes And Applying Initial Data

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to use linearity to combine separated modes and match a prescribed
initial temperature without hiding where each time factor comes from.

</details>

<details open>
<summary><strong>Why Modes May Be Added</strong></summary>

Write the heat operator as:

$$
L[u]=u_t-\kappa u_{xx}.
$$

It is linear. If $L[u_1]=0$ and $L[u_2]=0$, then for constants $a,b$:

$$
\begin{aligned}
L[au_1+bu_2]
&=aL[u_1]+bL[u_2]\\
&=0.
\end{aligned}
$$

Therefore finite sums of heat modes are also solutions:

$$
u(x,t)
=\sum_{n=1}^{N}
b_ne^{-\kappa(n\pi/L)^2t}
\sin\left(\frac{n\pi x}{L}\right).
$$

The same statement extends to suitable infinite sums when convergence permits
term-by-term differentiation.

</details>

<details open>
<summary><strong>A Finite Initial Temperature</strong></summary>

On $0\le x\le\pi$, solve:

$$
u_t=2u_{xx},
$$

The remaining data for this heat problem are the fixed-end conditions:

$$
u(0,t)=u(\pi,t)=0,
$$

and:

$$
u(x,0)=4\sin(2x)-3\sin(5x).
$$

Here $L=\pi$ and $\kappa=2$. The general $n$th mode is:

$$
u_n=b_ne^{-2n^2t}\sin(nx).
$$

Only the frequencies $n=2$ and $n=5$ occur in the initial data.

</details>

<details open>
<summary><strong>Attach The Correct Time Factor To Each Mode</strong></summary>

For $n=2$, the decay exponent is:

$$
-2n^2t=-2(2^2)t=-8t.
$$

Thus the first mode is:

$$
4e^{-8t}\sin(2x).
$$

For $n=5$:

$$
-2n^2t=-2(5^2)t=-50t.
$$

For $n=5$, the coefficient is $-3$ and the time factor is $e^{-50t}$, so
the second mode is:

$$
-3e^{-50t}\sin(5x).
$$

Combine them:

$$
\boxed{
u(x,t)
=4e^{-8t}\sin(2x)-3e^{-50t}\sin(5x)
}.
$$

</details>

<details open>
<summary><strong>Verify The PDE</strong></summary>

Start from:

$$
u=4e^{-8t}\sin(2x)-3e^{-50t}\sin(5x).
$$

Differentiate with respect to $t$:

$$
u_t
=-32e^{-8t}\sin(2x)
+150e^{-50t}\sin(5x).
$$

Differentiate twice with respect to $x$:

$$
u_{xx}
=-16e^{-8t}\sin(2x)
+75e^{-50t}\sin(5x).
$$

Multiply by $2$:

$$
2u_{xx}
=-32e^{-8t}\sin(2x)
+150e^{-50t}\sin(5x).
$$

This is exactly $u_t$, so the PDE is satisfied.

</details>

<details open>
<summary><strong>Verify The Boundary And Initial Conditions</strong></summary>

At $x=0$, both sine factors vanish:

$$
u(0,t)=0.
$$

At $x=\pi$:

$$
\sin(2\pi)=0,
\qquad
\sin(5\pi)=0,
$$

so:

$$
u(\pi,t)=0.
$$

Set $t=0$. Since $e^0=1$:

$$
\begin{aligned}
u(x,0)
&=4e^0\sin(2x)-3e^0\sin(5x)\\
&=4\sin(2x)-3\sin(5x).
\end{aligned}
$$

The candidate satisfies the PDE and all three conditions.

</details>

<details open>
<summary><strong>General Initial Profiles</strong></summary>

For a more general initial temperature $f(x)$, seek:

$$
u(x,t)
=\sum_{n=1}^{\infty}
b_ne^{-\kappa(n\pi/L)^2t}
\sin\left(\frac{n\pi x}{L}\right).
$$

At $t=0$:

$$
f(x)
=\sum_{n=1}^{\infty}
b_n\sin\left(\frac{n\pi x}{L}\right).
$$

To determine the coefficients $b_n$, use the orthogonality of the sine
functions on $[0,L]$. Their projection coefficients are:

$$
\boxed{
b_n
=\frac{2}{L}\int_0^L
f(x)\sin\left(\frac{n\pi x}{L}\right)dx
}.
$$

This is the bridge from separation of variables to Fourier sine series.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Linearity allows separated heat modes to be superposed. The initial profile
determines their coefficients, while higher spatial frequencies decay faster
because their exponents contain $n^2$.

</details>

---

## Block 8: Separating The Fixed-End Wave Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to reuse the spatial eigenfunctions from the heat problem while
showing why the wave equation produces time oscillation instead of decay.

</details>

<details open>
<summary><strong>Separate The Wave Equation</strong></summary>

Consider:

$$
u_{tt}=c^2u_{xx},
$$

with fixed endpoints:

$$
u(0,t)=u(L,t)=0.
$$

For this fixed-end wave equation, seek a separated solution:

$$
u(x,t)=X(x)T(t).
$$

Its required second derivatives are:

$$
u_{tt}=X(x)T''(t),
\qquad
u_{xx}=X''(x)T(t).
$$

Substitute into the wave equation:

$$
X(x)T''(t)=c^2X''(x)T(t).
$$

Divide a nontrivial product by $c^2XT$:

$$
\frac{T''}{c^2T}
=\frac{X''}{X}
=-\lambda.
$$

</details>

<details open>
<summary><strong>Obtain The Spatial And Temporal Equations</strong></summary>

From:

$$
\frac{X''}{X}=-\lambda,
$$

we obtain:

$$
X''+\lambda X=0.
$$

The fixed endpoint conditions again give:

$$
X(0)=X(L)=0.
$$

This is the same fixed-end spatial problem analysed in Block 6. Its nontrivial
solutions therefore occur at:

$$
\lambda_n=\left(\frac{n\pi}{L}\right)^2,
\qquad
X_n(x)=\sin\left(\frac{n\pi x}{L}\right).
$$

From the temporal ratio:

$$
\frac{T''}{c^2T}=-\lambda_n,
$$

multiply by $c^2T$:

$$
T_n''+c^2\lambda_nT_n=0.
$$

</details>

<details open>
<summary><strong>Solve The Temporal Oscillator</strong></summary>

Substitute:

$$
\lambda_n=\left(\frac{n\pi}{L}\right)^2
$$

into:

$$
T_n''+c^2\lambda_nT_n=0.
$$

This gives:

$$
T_n''+\left(\frac{cn\pi}{L}\right)^2T_n=0.
$$

Define the angular frequency:

$$
\omega_n=\frac{cn\pi}{L}.
$$

Then:

$$
T_n(t)=A_n\cos(\omega_nt)+B_n\sin(\omega_nt).
$$

The $n$th fixed-end wave mode is:

$$
\boxed{
u_n(x,t)
=\left[A_n\cos(\omega_nt)+B_n\sin(\omega_nt)\right]
\sin\left(\frac{n\pi x}{L}\right)
}.
$$

</details>

<details open>
<summary><strong>Heat Decay Versus Wave Oscillation</strong></summary>

The heat mode has time factor:

$$
e^{-\kappa(n\pi/L)^2t}.
$$

It decreases toward zero.

The wave mode has time factors:

$$
\cos\left(\frac{cn\pi t}{L}\right),
\qquad
\sin\left(\frac{cn\pi t}{L}\right).
$$

They oscillate without decay in the ideal model.

The same boundary conditions produce the same spatial sine functions, but the
different time derivatives in the PDE produce different temporal behaviour.

</details>

<details open>
<summary><strong>Worked Wave Initial-Data Problem</strong></summary>

On $0\le x\le\pi$, let $c=2$ and impose:

$$
u(0,t)=u(\pi,t)=0,
$$

with initial displacement:

$$
u(x,0)=2\sin x-\sin(3x),
$$

and initial velocity:

$$
u_t(x,0)=4\sin(2x).
$$

Since $L=\pi$ and $c=2$:

$$
\omega_n=\frac{cn\pi}{L}=2n.
$$

Only modes $n=1,2,3$ are needed.

</details>

<details open>
<summary><strong>Use The Initial Displacement</strong></summary>

Write the relevant finite sum:

$$
u(x,t)
=\sum_{n=1}^{3}
\left[A_n\cos(2nt)+B_n\sin(2nt)\right]\sin(nx).
$$

Set $t=0$. Since $\cos0=1$ and $\sin0=0$:

$$
u(x,0)
=A_1\sin x+A_2\sin(2x)+A_3\sin(3x).
$$

Match this displacement expansion with the prescribed initial displacement:

$$
u(x,0)=2\sin x-\sin(3x).
$$

Comparing the sine coefficients therefore gives:

$$
A_1=2,
\qquad
A_2=0,
\qquad
A_3=-1.
$$

</details>

<details open>
<summary><strong>Use The Initial Velocity</strong></summary>

Differentiate the finite mode sum with respect to $t$:

$$
u_t(x,t)
=\sum_{n=1}^{3}
\left[-2nA_n\sin(2nt)+2nB_n\cos(2nt)\right]\sin(nx).
$$

Set $t=0$:

$$
u_t(x,0)
=2B_1\sin x+4B_2\sin(2x)+6B_3\sin(3x).
$$

Match this with the prescribed velocity:

$$
u_t(x,0)=4\sin(2x).
$$

Compare the sine coefficients:

$$
2B_1=0,
\qquad
4B_2=4,
\qquad
6B_3=0.
$$

Solving these three coefficient equations gives:

$$
B_1=0,
\qquad
B_2=1,
\qquad
B_3=0.
$$

</details>

<details open>
<summary><strong>Assemble And Check The Wave Solution</strong></summary>

Insert the calculated constants into the mode sum:

$$
\boxed{
u(x,t)
=2\cos(2t)\sin x
+\sin(4t)\sin(2x)
-\cos(6t)\sin(3x)
}.
$$

Every spatial factor vanishes at $x=0$ and $x=\pi$, so both endpoint
conditions hold.

At $t=0$:

$$
u(x,0)=2\sin x-\sin(3x).
$$

Differentiate the final expression:

$$
u_t
=-4\sin(2t)\sin x
+4\cos(4t)\sin(2x)
+6\sin(6t)\sin(3x).
$$

Set $t=0$:

$$
u_t(x,0)=4\sin(2x).
$$

Each term is a separated wave mode, so linearity ensures the sum satisfies the
wave equation.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

The fixed-end heat and wave equations share spatial sine eigenfunctions. Heat
modes decay exponentially, whereas wave modes oscillate and require both
initial displacement and initial velocity.

</details>

---

## Block 9: A Reliable Introductory PDE Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn the chapter into a dependable sequence and identify the
mistakes that most often hide inside compact PDE notation.

</details>

<details open>
<summary><strong>The Workflow</strong></summary>

**Step 1: List the variables.** State the dependent variable and every
independent variable.

**Step 2: Classify the equation.** Identify order, linearity, and, when useful,
elliptic/parabolic/hyperbolic type.

**Step 3: List all conditions.** Separate initial data from spatial boundary
data.

**Step 4: If verifying, calculate only the derivatives required by the PDE.**
Carry each source expression into its derivative.

**Step 5: If integrating, name the held-fixed variables.** Add an arbitrary
function of those variables.

**Step 6: If separating, write $u=XT$ and substitute before dividing.** Do not
state separated ODEs without showing the ratio equation.

**Step 7: Analyze every sign of the separation constant.** Let the boundary
conditions decide which sign produces nontrivial modes.

**Step 8: Solve the temporal equation only after the spatial values are known.**
This keeps the mode index and time factor connected.

**Step 9: Apply each condition locally.** Restate the current solution before
substitution.

**Step 10: Verify the final PDE, boundary data, and initial data separately.**

</details>

<details open>
<summary><strong>Common Mistake: Treating Other Variables As Numerical Constants Forever</strong></summary>

When integrating $u_x$, the variable $y$ is held constant during the
integration, but the result may still depend on $y$ afterward.

Thus:

$$
u_x=2x
$$

has general solution:

$$
u=x^2+F(y),
$$

not merely $u=x^2+C$.

</details>

<details open>
<summary><strong>Common Mistake: Confusing Two Kinds Of Separation</strong></summary>

For a separable ODE, variables are rearranged into expressions such as:

$$
g(y)\,dy=f(x)\,dx.
$$

For PDE separation of variables, we assume a product:

$$
u(x,t)=X(x)T(t).
$$

The methods share a name but perform different operations.

</details>

<details open>
<summary><strong>Common Mistake: Dividing Before Naming The Nontrivial Case</strong></summary>

The step:

$$
XT'=\kappa X''T
\quad\Longrightarrow\quad
\frac{T'}{\kappa T}=\frac{X''}{X}
$$

divides by $X$ and $T$. State that the calculation seeks a nontrivial
separated solution and works on regions where the factors are nonzero. The
resulting ODE solutions extend across their isolated zeros.

</details>

<details open>
<summary><strong>Common Mistake: Keeping Only The Convenient Sign</strong></summary>

The fixed-end heat derivation eventually uses $\lambda>0$, but that conclusion
comes from testing:

$$
\lambda<0,
\qquad
\lambda=0,
\qquad
\lambda>0.
$$

Skipping the first two cases hides why positive discrete values are selected.

</details>

<details open>
<summary><strong>Common Mistake: Applying Superposition To A Nonlinear PDE</strong></summary>

If $u_1$ and $u_2$ solve a linear homogeneous PDE, then $au_1+bu_2$ also
solves it. This does not generally hold for nonlinear equations.

For example, the product term in:

$$
u_t+uu_x=0
$$

creates cross terms when two solutions are added. Check linearity before
building a mode sum.

</details>

<details open>
<summary><strong>Common Mistake: Confusing Fixed And Insulated Ends</strong></summary>

Fixed zero temperature uses value conditions:

$$
u(0,t)=u(L,t)=0.
$$

Insulated ends use zero heat-flux conditions, which in the simplest model are:

$$
u_x(0,t)=u_x(L,t)=0.
$$

These conditions select different spatial eigenfunctions. Read the physical
condition before writing the mathematics.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

PDE work is reliable when variables, derivative directions, arbitrary
functions, separation signs, domains, and all initial and boundary conditions
remain explicit.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Derivatives, Classification, And Verification</strong></summary>

**Problem 1: Calculate Partial Derivatives.** For:

$$
u(x,y)=xy^2+\cos(xy),
$$

find $u_x$, $u_y$, and $u_{xy}$.

**Problem 2: Classify A PDE.** Classify by order and linearity:

$$
u_{xx}+u_{tt}+e^u=0.
$$

**Problem 3: Identify The Classical Type.** Classify each as elliptic,
parabolic, or hyperbolic:

$$
u_{xx}+4u_{yy}=0,
$$

$$
u_t-5u_{xx}=0,
$$

$$
9u_{xx}-u_{tt}=0.
$$

**Problem 4: Verify A Heat Solution.** Verify that:

$$
u(x,t)=e^{-16\kappa t}\cos(4x)
$$

satisfies $u_t=\kappa u_{xx}$.

</details>

<details open>
<summary><strong>Problems 5 To 8: Harmonic Functions, Integration, And Separation</strong></summary>

**Problem 5: Check A Harmonic Polynomial.** Determine whether:

$$
u(x,y)=x^3-3xy^2
$$

satisfies Laplace's equation.

**Problem 6: Integrate And Apply Data.** Solve:

$$
u_x=4x-y,
\qquad
u(0,y)=y^2.
$$

**Problem 7: Integrate A Mixed Derivative.** Find the general solution of:

$$
u_{xy}=6x^2y.
$$

**Problem 8: Separate A Heat Equation.** For:

$$
u_t=3u_{xx},
\qquad
u(0,t)=u(L,t)=0,
$$

assume $u=XT$ and derive the two ODEs after setting the common ratio to
$-\lambda$.

</details>

<details open>
<summary><strong>Problems 9 To 12: Heat And Wave Modes</strong></summary>

**Problem 9: Find Fixed-End Eigenvalues.** Solve:

$$
X''+\lambda X=0,
\qquad
X(0)=X(2)=0
$$

for its positive eigenvalues and corresponding sine eigenfunctions.

**Problem 10: Solve A Finite Heat Problem.** On $0\le x\le\pi$, solve:

$$
u_t=3u_{xx},
\qquad
u(0,t)=u(\pi,t)=0,
$$

with:

$$
u(x,0)=2\sin x+5\sin(4x).
$$

**Problem 11: Verify A Wave Mode.** Verify that:

$$
u(x,t)
=\sin\left(\frac{2\pi x}{L}\right)
\cos\left(\frac{2\pi ct}{L}\right)
$$

satisfies the wave equation and fixed endpoint conditions.

**Problem 12: Match Wave Initial Data.** On $0\le x\le\pi$ with $c=1$, find
the fixed-end wave solution with:

$$
u(x,0)=3\sin(2x),
\qquad
u_t(x,0)=-4\sin(4x).
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Use:

$$
u(x,y)=xy^2+\cos(xy).
$$

Differentiate with respect to $x$, holding $y$ fixed:

$$
\begin{aligned}
u_x
&=\frac{\partial}{\partial x}\left[xy^2+\cos(xy)\right]\\
&=y^2-y\sin(xy).
\end{aligned}
$$

Differentiate with respect to $y$, holding $x$ fixed:

$$
\begin{aligned}
u_y
&=\frac{\partial}{\partial y}\left[xy^2+\cos(xy)\right]\\
&=2xy-x\sin(xy).
\end{aligned}
$$

To find $u_{xy}$, differentiate $u_x$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=\frac{\partial}{\partial y}
\left[y^2-y\sin(xy)\right]\\
&=2y-\sin(xy)-xy\cos(xy).
\end{aligned}
$$

### Answer 2

The equation is:

$$
u_{xx}+u_{tt}+e^u=0.
$$

The highest derivatives, $u_{xx}$ and $u_{tt}$, are second order and occur
linearly with constant coefficients. The lower-order term $e^u$ is nonlinear.
The order and nonlinearity checks therefore give:

$$
\boxed{\text{the PDE is second-order semilinear}.}
$$

### Answer 3

For:

$$
u_{xx}+4u_{yy}=0,
$$

$A=1$, $B=0$, and $C=4$. Thus:

$$
B^2-AC=0-(1)(4)=-4<0,
$$

so the equation is elliptic.

For:

$$
u_t-5u_{xx}=0,
$$

the second-order coefficients in $(x,t)$ are $A=-5$, $B=0$, and $C=0$.
Thus $B^2-AC=0$, so the equation is parabolic.

For:

$$
9u_{xx}-u_{tt}=0,
$$

$A=9$, $B=0$, and $C=-1$. Therefore:

$$
B^2-AC=0-(9)(-1)=9>0,
$$

so the equation is hyperbolic.

### Answer 4

Start with:

$$
u(x,t)=e^{-16\kappa t}\cos(4x).
$$

For the candidate $u=e^{-16\kappa t}\cos(4x)$, differentiate with respect to
$t$:

$$
u_t=-16\kappa e^{-16\kappa t}\cos(4x).
$$

Differentiate twice with respect to $x$:

$$
\begin{aligned}
u_x&=-4e^{-16\kappa t}\sin(4x),\\
u_{xx}&=-16e^{-16\kappa t}\cos(4x).
\end{aligned}
$$

Multiply by $\kappa$:

$$
\kappa u_{xx}
=-16\kappa e^{-16\kappa t}\cos(4x)
=u_t.
$$

Therefore the heat equation is satisfied.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

For:

$$
u(x,y)=x^3-3xy^2,
$$

calculate:

$$
\begin{aligned}
u_x&=3x^2-3y^2,\\
u_{xx}&=6x.
\end{aligned}
$$

Differentiate with respect to $y$:

$$
\begin{aligned}
u_y&=-6xy,\\
u_{yy}&=-6x.
\end{aligned}
$$

Add:

$$
u_{xx}+u_{yy}=6x-6x=0.
$$

Therefore the polynomial is harmonic.

### Answer 6

Integrate:

$$
u_x=4x-y
$$

with respect to $x$, treating $y$ as constant:

$$
u(x,y)=2x^2-xy+F(y).
$$

Apply the boundary data $u(0,y)=y^2$ to
$u=2x^2-xy+F(y)$:

$$
\begin{aligned}
u(0,y)
&=2(0)^2-(0)y+F(y)\\
&=F(y).
\end{aligned}
$$

Therefore $F(y)=y^2$, and:

$$
\boxed{u(x,y)=2x^2-xy+y^2.}
$$

### Answer 7

Start from:

$$
u_{xy}=6x^2y.
$$

Integrate with respect to $y$:

$$
u_x=3x^2y^2+A(x).
$$

Integrate with respect to $x$:

$$
\begin{aligned}
u(x,y)
&=\int\left[3x^2y^2+A(x)\right]dx\\
&=x^3y^2+G(x)+H(y),
\end{aligned}
$$

where $G'(x)=A(x)$. Hence:

$$
\boxed{u(x,y)=x^3y^2+G(x)+H(y).}
$$

### Answer 8

For the heat equation $u_t=3u_{xx}$, seek a separated solution:

$$
u(x,t)=X(x)T(t).
$$

Then:

$$
u_t=XT',
\qquad
u_{xx}=X''T.
$$

Substitute into $u_t=3u_{xx}$:

$$
XT'=3X''T.
$$

Divide a nontrivial product by $3XT$:

$$
\frac{T'}{3T}=\frac{X''}{X}=-\lambda.
$$

From $X''/X=-\lambda$:

$$
\boxed{X''+\lambda X=0.}
$$

From $T'/(3T)=-\lambda$:

$$
\boxed{T'+3\lambda T=0.}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

For positive $\lambda$, write $\alpha=\sqrt\lambda$. Then:

$$
X(x)=A\cos(\alpha x)+B\sin(\alpha x).
$$

Apply $X(0)=0$:

$$
A=0.
$$

Thus $X=B\sin(\alpha x)$. Apply $X(2)=0$:

$$
B\sin(2\alpha)=0.
$$

For a nontrivial eigenfunction, $B\ne0$, so:

$$
\sin(2\alpha)=0.
$$

Therefore:

$$
2\alpha=n\pi,
\qquad n=1,2,3,\ldots.
$$

Divide by $2$ and square:

$$
\boxed{
\lambda_n=\left(\frac{n\pi}{2}\right)^2
}.
$$

The corresponding eigenfunctions may be chosen as:

$$
\boxed{
X_n(x)=\sin\left(\frac{n\pi x}{2}\right)
}.
$$

### Answer 10

For $L=\pi$ and $\kappa=3$, the $n$th heat mode is:

$$
b_ne^{-3n^2t}\sin(nx).
$$

The initial profile contains modes $n=1$ and $n=4$.

For $n=1$:

$$
-3n^2t=-3t.
$$

For $n=4$:

$$
-3n^2t=-3(16)t=-48t.
$$

Attach these factors to the initial coefficients:

$$
\boxed{
u(x,t)=2e^{-3t}\sin x+5e^{-48t}\sin(4x)
}.
$$

At $t=0$, both exponentials equal $1$, recovering the prescribed initial
temperature.

### Answer 11

Use:

$$
u(x,t)
=\sin\left(\frac{2\pi x}{L}\right)
\cos\left(\frac{2\pi ct}{L}\right).
$$

Let:

$$
a=\frac{2\pi}{L}.
$$

With $a=2\pi/L$, the proposed function becomes
$u=\sin(ax)\cos(act)$. Differentiate it twice in time:

$$
u_{tt}
=-a^2c^2\sin(ax)\cos(act).
$$

Differentiate twice in space:

$$
u_{xx}
=-a^2\sin(ax)\cos(act).
$$

Multiply by $c^2$:

$$
c^2u_{xx}
=-a^2c^2\sin(ax)\cos(act)
=u_{tt}.
$$

At $x=0$:

$$
\sin(0)=0.
$$

At $x=L$:

$$
\sin(aL)=\sin(2\pi)=0.
$$

Thus the PDE and both fixed endpoint conditions hold.

### Answer 12

For $L=\pi$ and $c=1$, the $n$th wave frequency is:

$$
\omega_n=n.
$$

The displacement contains mode $n=2$, and the velocity contains mode $n=4$.
Use:

$$
u(x,t)
=A_2\cos(2t)\sin(2x)
+B_4\sin(4t)\sin(4x).
$$

Apply the initial displacement at $t=0$ to this two-mode wave sum:

$$
u(x,0)=A_2\sin(2x).
$$

Match $u(x,0)=3\sin(2x)$:

$$
A_2=3.
$$

Differentiate the mode sum:

$$
u_t
=-2A_2\sin(2t)\sin(2x)
+4B_4\cos(4t)\sin(4x).
$$

Set $t=0$:

$$
u_t(x,0)=4B_4\sin(4x).
$$

Match $u_t(x,0)=-4\sin(4x)$:

$$
4B_4=-4,
\qquad
B_4=-1.
$$

Therefore:

$$
\boxed{
u(x,t)
=3\cos(2t)\sin(2x)
-\sin(4t)\sin(4x)
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 31 Final Summary</strong></summary>

A PDE contains partial derivatives of a function with several independent
variables. The three central models are:

$$
\begin{aligned}
u_t&=\kappa u_{xx} &&\text{heat},\\
u_{tt}&=c^2u_{xx} &&\text{wave},\\
u_{xx}+u_{yy}&=0 &&\text{Laplace}.
\end{aligned}
$$

When integrating a partial derivative, preserve arbitrary dependence on every
untouched variable:

$$
u_x=f(x,y)
\quad\Longrightarrow\quad
u=\int f(x,y)\,dx+F(y).
$$

For fixed zero endpoints on $[0,L]$, separation of variables selects:

$$
\lambda_n=\left(\frac{n\pi}{L}\right)^2,
\qquad
X_n(x)=\sin\left(\frac{n\pi x}{L}\right).
$$

The same spatial modes have different time factors:

$$
\begin{aligned}
\text{heat:}\quad
&e^{-\kappa(n\pi/L)^2t},\\
\text{wave:}\quad
&A_n\cos\left(\frac{cn\pi t}{L}\right)
+B_n\sin\left(\frac{cn\pi t}{L}\right).
\end{aligned}
$$

> partial derivatives describe change in several directions, separation turns
> the PDE into linked ODEs, boundary conditions select the spatial modes, and
> initial data determine how those modes are combined.

</details>
