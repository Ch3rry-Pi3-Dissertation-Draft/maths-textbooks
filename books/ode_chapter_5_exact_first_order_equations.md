# Exact First-Order Equations And Integrating Factors

This chapter develops a systematic method for differential equations that
hide the total derivative of a two-variable function.

The method has two central tasks:

1. decide whether the equation is exact
2. reconstruct the function whose differential appears in the equation

When an equation is not exact, a carefully chosen integrating factor may make
it exact.

We will work step by step. In every reconstruction, we will state which
variable is held constant, preserve the unknown one-variable function created
by partial integration, and compare coefficients one line at a time.

The main questions are:

- what does exactness mean?
- why do cross-partial derivatives provide a test?
- how is the hidden potential function recovered?
- when should we integrate the $dx$ coefficient or the $dy$ coefficient?
- how does an initial condition select one level curve?
- how can a factor depending only on $x$ or only on $y$ restore exactness?

The central idea is:

> an exact differential equation describes motion along a level curve of one
> underlying potential function.

---

## Block 1: Exactness As A Hidden Total Derivative

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect differential form with the multivariable chain rule.

This explains both the meaning of an exact equation and the form of its
solution.

</details>

<details open>
<summary><strong>Start With A Two-Variable Function</strong></summary>

Let:

$$
\Phi=\Phi(x,y)
$$

be a differentiable function of two variables.

Its total differential is:

$$
\boxed{
d\Phi
=
\Phi_x\,dx+\Phi_y\,dy
}
$$

The notation means:

$$
\Phi_x=\frac{\partial\Phi}{\partial x}
\qquad\text{and}\qquad
\Phi_y=\frac{\partial\Phi}{\partial y}
$$

If a differential equation has the form:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

and there is a function $\Phi$ satisfying:

$$
\Phi_x=M
\qquad\text{and}\qquad
\Phi_y=N,
$$

then the equation is **exact**.

In that case:

$$
M\,dx+N\,dy=d\Phi
$$

and the differential equation becomes:

$$
d\Phi=0
$$

</details>

<details open>
<summary><strong>Why The Solution Is A Level Curve</strong></summary>

Along a solution $y=y(x)$, the chain rule gives:

$$
\frac{d}{dx}\Phi(x,y(x))
=
\Phi_x+\Phi_y y'
$$

Replace the partial derivatives by $M$ and $N$:

$$
\frac{d}{dx}\Phi(x,y(x))
=
M+Ny'
$$

The differential equation:

$$
M\,dx+N\,dy=0
$$

becomes, after division by $dx$:

$$
M+Ny'=0
$$

The expression $M+Ny'$ is the derivative of the potential along the solution,
and the differential equation says that this same expression equals zero.
Substitute that value into the derivative relation:

$$
\frac{d}{dx}\Phi(x,y(x))=0
$$

Integrating with respect to $x$ gives:

$$
\boxed{\Phi(x,y)=C}
$$

The practical meaning is:

> a solution moves through the $(x,y)$-plane without changing the value of
> the potential $\Phi$.

</details>

<details open>
<summary><strong>A Potential Built First</strong></summary>

Consider the function:

$$
\Phi(x,y)=xy^2+\sin x
$$

Differentiate with respect to $x$, holding $y$ constant:

$$
\begin{aligned}
\Phi_x
&=
\frac{\partial}{\partial x}(xy^2)
+
\frac{\partial}{\partial x}(\sin x) \\
&=
y^2+\cos x.
\end{aligned}
$$

Differentiate with respect to $y$, holding $x$ constant:

$$
\begin{aligned}
\Phi_y
&=
\frac{\partial}{\partial y}(xy^2)
+
\frac{\partial}{\partial y}(\sin x) \\
&=
2xy+0 \\
&=
2xy.
\end{aligned}
$$

Recall the total-differential formula:

$$
d\Phi=\Phi_x\,dx+\Phi_y\,dy
$$

Substitute the two partial derivatives just calculated:

$$
\begin{aligned}
d\Phi
&=\Phi_x\,dx+\Phi_y\,dy \\
&=(y^2+\cos x)\,dx+2xy\,dy.
\end{aligned}
$$

The equation:

$$
(y^2+\cos x)\,dx+2xy\,dy=0
$$

has exactly the same left side as $d\Phi$. Therefore the equation can be
rewritten as:

$$
d\Phi=0
$$

A function with zero differential is constant along a solution, so integrate
to obtain:

$$
\Phi(x,y)=C
$$

Finally, substitute the original function
$\Phi(x,y)=xy^2+\sin x$:

$$
\boxed{xy^2+\sin x=C}
$$

</details>

<details open>
<summary><strong>Verification From The Implicit Solution</strong></summary>

Start from:

$$
xy^2+\sin x=C
$$

Differentiate every term with respect to $x$.

For $xy^2$, use the product rule and remember that $y=y(x)$:

$$
\frac{d}{dx}(xy^2)
=
y^2+x(2yy')
$$

Also:

$$
\frac{d}{dx}(\sin x)=\cos x
$$

and:

$$
\frac{dC}{dx}=0
$$

Place the three differentiated terms into the equation:

$$
y^2+2xyy'+\cos x=0
$$

Reorder the terms so that the part containing $y'$ is visible:

$$
(y^2+\cos x)+2xyy'=0
$$

Replace $y'$ by $dy/dx$:

$$
(y^2+\cos x)+2xy\frac{dy}{dx}=0
$$

Multiply every term by $dx$:

$$
(y^2+\cos x)\,dx+2xy\,dy=0
$$

This is exactly the original differential equation.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

An equation:

$$
M\,dx+N\,dy=0
$$

is exact when:

$$
M=\Phi_x
\qquad\text{and}\qquad
N=\Phi_y
$$

for one potential function $\Phi$. Its solutions lie on level curves:

$$
\Phi(x,y)=C
$$

</details>

---

## Block 2: Testing An Equation For Exactness

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide whether a potential function exists before attempting
to reconstruct it.

</details>

<details open>
<summary><strong>Deriving The Cross-Partial Test</strong></summary>

Suppose:

$$
M=\Phi_x
\qquad\text{and}\qquad
N=\Phi_y
$$

Differentiate $M$ with respect to $y$:

$$
M_y=(\Phi_x)_y=\Phi_{xy}
$$

Differentiate $N$ with respect to $x$:

$$
N_x=(\Phi_y)_x=\Phi_{yx}
$$

When the relevant partial derivatives are continuous:

$$
\Phi_{xy}=\Phi_{yx}
$$

Therefore an exact equation must satisfy:

$$
\boxed{M_y=N_x}
$$

On a suitable simply connected domain, this equality is also sufficient.
For the introductory examples in this chapter, the working domains will be
rectangles, half-planes, or the whole plane unless stated otherwise.

</details>

<details open>
<summary><strong>The Four-Step Test</strong></summary>

For:

$$
M(x,y)\,dx+N(x,y)\,dy=0,
$$

use these steps.

### Step 1: Identify the coefficients

Write $M$ and $N$ separately.

### Step 2: Differentiate across the variables

Calculate:

$$
M_y
\qquad\text{and}\qquad
N_x
$$

### Step 3: Compare the complete expressions

Do not compare only one matching term.

### Step 4: State the domain conclusion

If the derivatives agree on a suitable domain, the equation is exact there.
If they do not agree, the displayed form is not exact.

</details>

<details open>
<summary><strong>Worked Exactness Test</strong></summary>

Test:

$$
(2xy+e^x\cos y)\,dx
+
(x^2-e^x\sin y+4y^3)\,dy
=0
$$

### Step 1: Identify $M$ and $N$

$$
M(x,y)=2xy+e^x\cos y
$$

$$
N(x,y)=x^2-e^x\sin y+4y^3
$$

### Step 2: Compute $M_y$

Hold $x$ constant:

$$
\begin{aligned}
M_y
&=
\frac{\partial}{\partial y}(2xy)
+
\frac{\partial}{\partial y}(e^x\cos y) \\
&=
2x-e^x\sin y.
\end{aligned}
$$

### Step 3: Compute $N_x$

Hold $y$ constant:

$$
\begin{aligned}
N_x
&=
\frac{\partial}{\partial x}(x^2)
-
\frac{\partial}{\partial x}(e^x\sin y)
+
\frac{\partial}{\partial x}(4y^3) \\
&=
2x-e^x\sin y+0 \\
&=
2x-e^x\sin y.
\end{aligned}
$$

### Step 4: Compare

$$
M_y=N_x
$$

Both coefficient functions and their first partial derivatives are continuous
on the plane. Therefore the equation is exact on $\mathbb{R}^2$.

</details>

<details open>
<summary><strong>A Nonexact Near Miss</strong></summary>

Test:

$$
(2xy+e^y)\,dx+(x^2+x+3y^2)\,dy=0
$$

Identify:

$$
M(x,y)=2xy+e^y
$$

and:

$$
N(x,y)=x^2+x+3y^2
$$

Differentiate $M$ with respect to $y$:

$$
\begin{aligned}
M_y
&=2x+e^y.
\end{aligned}
$$

Differentiate $N$ with respect to $x$:

$$
\begin{aligned}
N_x
&=2x+1.
\end{aligned}
$$

The expressions are not equal in general:

$$
2x+e^y\neq 2x+1
$$

Therefore the displayed equation is not exact.

The fact that the terms $2x$ match is not enough. The full cross-partial
expressions must agree.

</details>

<details open>
<summary><strong>Exactness Belongs To A Form And A Domain</strong></summary>

Multiplying a differential form by a nonzero function preserves its local
solution curves, but it may change exactness.

Similarly, an expression containing $1/x$, $1/y$, or a logarithm may be exact
only on regions that avoid its singularities.

For this reason, say:

> the displayed differential form is exact on the stated domain.

This is more precise than saying that an equation is exact without reference
to its representation or domain.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For:

$$
M\,dx+N\,dy=0,
$$

calculate:

$$
M_y
\qquad\text{and}\qquad
N_x
$$

Equality on a suitable domain signals exactness. Inequality means that the
displayed form is not exact.

</details>

---

## Block 3: Reconstructing The Potential From $M$

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recover $\Phi(x,y)$ from an exact equation without skipping the
one-variable correction term.

</details>

<details open>
<summary><strong>The Reconstruction Method</strong></summary>

Suppose the equation is exact:

$$
M\,dx+N\,dy=0
$$

and:

$$
\Phi_x=M,
\qquad
\Phi_y=N
$$

To reconstruct $\Phi$ from $M$:

1. integrate $M$ with respect to $x$, holding $y$ constant
2. add an unknown function $h(y)$
3. differentiate the result with respect to $y$
4. set that derivative equal to $N$
5. solve for $h'(y)$ and then $h(y)$
6. write $\Phi(x,y)=C$

The term $h(y)$ is essential. When integrating with respect to $x$, every
function of $y$ behaves like a constant.

</details>

<details open>
<summary><strong>Complete Worked Example</strong></summary>

Solve:

$$
(2xy+e^x\cos y)\,dx
+
(x^2-e^x\sin y+4y^3)\,dy
=0
$$

Before reconstructing the potential, verify exactness locally. Here:

$$
M=2xy+e^x\cos y
$$

and:

$$
N=x^2-e^x\sin y+4y^3
$$

Their cross-partials are:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+e^x\cos y) \\
&=2x-e^x\sin y
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2-e^x\sin y+4y^3) \\
&=2x-e^x\sin y
\end{aligned}
$$

Since $M_y=N_x$ on the plane, the equation is exact and a potential
$\Phi$ can be reconstructed.

### Step 1: Use $\Phi_x=M$

$$
\Phi_x=2xy+e^x\cos y
$$

### Step 2: Integrate with respect to $x$

During this integration, $y$ is held constant.

Integrate the first term:

$$
\int 2xy\,dx
=
y\int 2x\,dx
=
x^2y
$$

Integrate the second term:

$$
\int e^x\cos y\,dx
=
\cos y\int e^x\,dx
=
e^x\cos y
$$

Add the unknown function of $y$:

$$
\boxed{
\Phi(x,y)=x^2y+e^x\cos y+h(y)
}
$$

### Step 3: Differentiate this result with respect to $y$

$$
\begin{aligned}
\Phi_y
&=
\frac{\partial}{\partial y}(x^2y)
+
\frac{\partial}{\partial y}(e^x\cos y)
+h'(y) \\
&=
x^2-e^x\sin y+h'(y).
\end{aligned}
$$

### Step 4: Compare with the original $N$

The original coefficient of $dy$ is:

$$
N=x^2-e^x\sin y+4y^3
$$

Set $\Phi_y=N$:

$$
x^2-e^x\sin y+h'(y)
=
x^2-e^x\sin y+4y^3
$$

Subtract the common terms from both sides:

$$
h'(y)=4y^3
$$

### Step 5: Integrate for $h(y)$

$$
\begin{aligned}
h(y)
&=
\int 4y^3\,dy \\
&=
y^4.
\end{aligned}
$$

An additive constant inside $h$ is unnecessary because the final equation
already contains an arbitrary constant.

### Step 6: Assemble the potential

$$
\boxed{
\Phi(x,y)=x^2y+e^x\cos y+y^4
}
$$

### Step 7: Write the implicit solution

The reconstructed derivatives satisfy $\Phi_x=M$ and $\Phi_y=N$. Hence the
left side of the original equation is $d\Phi$, so the equation becomes:

$$
d\Phi=0
$$

Integrating gives:

$$
\Phi(x,y)=C
$$

Substitute the potential from Step 6:

$$
\boxed{
x^2y+e^x\cos y+y^4=C
}
$$

</details>

<details open>
<summary><strong>Final Potential Check</strong></summary>

Differentiate the reconstructed potential both ways.

With respect to $x$:

$$
\begin{aligned}
\Phi_x
&=
2xy+e^x\cos y+0 \\
&=
M.
\end{aligned}
$$

With respect to $y$:

$$
\begin{aligned}
\Phi_y
&=
x^2-e^x\sin y+4y^3 \\
&=
N.
\end{aligned}
$$

Both coefficients have been recovered, so the potential is correct.

</details>

<details open>
<summary><strong>The Most Common Reconstruction Error</strong></summary>

The incorrect step is:

$$
\Phi=\int M(x,y)\,dx+C
$$

when $C$ is treated as a numerical constant.

The correct step is:

$$
\boxed{
\Phi=\int M(x,y)\,dx+h(y)
}
$$

because a function depending only on $y$ has zero partial derivative with
respect to $x$.

The comparison with $N$ is what determines that missing function.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Integrate $M$ with respect to $x$, append $h(y)$, differentiate with respect
to $y$, and compare with $N$.

Do not omit the one-variable correction function. It carries all potential
terms that are invisible to $\Phi_x$.

</details>

---

## Block 4: Reconstructing From $N$ Instead

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to use the direction of integration that produces the cleanest
calculation.

</details>

<details open>
<summary><strong>The Alternative Route</strong></summary>

Starting from:

$$
\Phi_y=N,
$$

we may integrate with respect to $y$:

$$
\boxed{
\Phi(x,y)=\int N(x,y)\,dy+k(x)
}
$$

Now $x$ is held constant, so the missing term may be any function $k(x)$.

Then:

1. differentiate the result with respect to $x$
2. compare with $M$
3. determine $k'(x)$
4. integrate to find $k(x)$

</details>

<details open>
<summary><strong>Worked Example Using $N$</strong></summary>

Solve:

$$
(2x\sin y+3x^2)\,dx
+
(x^2\cos y+2y)\,dy
=0
$$

### Step 1: Test exactness

Identify:

$$
M=2x\sin y+3x^2
$$

$$
N=x^2\cos y+2y
$$

Differentiate:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2x\sin y+3x^2) \\
&=2x\cos y
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2\cos y+2y) \\
&=2x\cos y
\end{aligned}
$$

The cross-partials agree, so the equation is exact on the plane.

### Step 2: Integrate $N$ with respect to $y$

Hold $x$ constant:

$$
\Phi(x,y)
=
\int(x^2\cos y+2y)\,dy+k(x)
$$

Integrate one term at a time:

$$
\int x^2\cos y\,dy=x^2\sin y
$$

$$
\int 2y\,dy=y^2
$$

Therefore:

$$
\boxed{
\Phi(x,y)=x^2\sin y+y^2+k(x)
}
$$

### Step 3: Differentiate with respect to $x$

$$
\begin{aligned}
\Phi_x
&=
2x\sin y+0+k'(x) \\
&=
2x\sin y+k'(x).
\end{aligned}
$$

### Step 4: Compare with $M$

Set $\Phi_x=M$:

$$
2x\sin y+k'(x)
=
2x\sin y+3x^2
$$

Subtract $2x\sin y$ from both sides:

$$
k'(x)=3x^2
$$

### Step 5: Integrate for $k(x)$

$$
\begin{aligned}
k(x)
&=
\int 3x^2\,dx \\
&=
x^3.
\end{aligned}
$$

### Step 6: Write the solution

The potential is:

$$
\Phi=x^2\sin y+y^2+x^3
$$

Because its partial derivatives reproduce $M$ and $N$, the differential form
is $d\Phi$. The equation is therefore:

$$
d\Phi=0
$$

Integrating gives $\Phi=C$. Substituting the displayed potential produces
the implicit solution:

$$
\boxed{x^2\sin y+y^2+x^3=C}
$$

</details>

<details open>
<summary><strong>How To Choose The Easier Direction</strong></summary>

Integrate $M$ with respect to $x$ when its $x$-antiderivative is simpler.

Integrate $N$ with respect to $y$ when its $y$-antiderivative is simpler.

For example:

- $x^2\cos y$ is easy to integrate with respect to $y$
- $e^x\cos y$ is easy to integrate with respect to $x$
- a term may be awkward in one direction but immediate in the other

Both routes must produce potentials differing by at most an additive
constant.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

The potential may be reconstructed from either coefficient:

$$
\Phi=\int M\,dx+h(y)
$$

or:

$$
\Phi=\int N\,dy+k(x)
$$

Choose the cleaner antiderivative, then compare the unused partial derivative
with the untouched coefficient.

</details>

---

## Block 5: Slope Form And Initial Conditions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to move from slope form to differential form and use an initial
condition to select one level curve.

</details>

<details open>
<summary><strong>Converting Slope Form</strong></summary>

Suppose:

$$
y'=-\frac{M(x,y)}{N(x,y)}
$$

where $N\neq 0$.

Multiply by $N$:

$$
Ny'=-M
$$

Move all terms to one side:

$$
M+Ny'=0
$$

Replace $y'$ by $dy/dx$ and multiply by $dx$:

$$
\boxed{M\,dx+N\,dy=0}
$$

Only after this conversion should the cross-partial test be applied.

</details>

<details open>
<summary><strong>Worked Slope-Form Example</strong></summary>

Solve:

$$
y'=-\frac{2x+y}{x+e^y}
$$

on a region where $x+e^y\neq 0$.

### Step 1: Convert to differential form

Multiply by $x+e^y$:

$$
(x+e^y)y'=-(2x+y)
$$

Move the right side to the left:

$$
(2x+y)+(x+e^y)y'=0
$$

Replace $y'$ by $dy/dx$:

$$
(2x+y)+(x+e^y)\frac{dy}{dx}=0
$$

Multiply every term by $dx$:

$$
(2x+y)\,dx+(x+e^y)\,dy=0
$$

The coefficient multiplying $dx$ is $M$, and the coefficient multiplying
$dy$ is $N$. Therefore:

$$
M=2x+y,
\qquad
N=x+e^y
$$

### Step 2: Test exactness

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2x+y) \\
&=1
\end{aligned}
$$

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x+e^y) \\
&=1
\end{aligned}
$$

The equation is exact.

### Step 3: Integrate $M$ with respect to $x$

Hold $y$ constant:

$$
\begin{aligned}
\Phi
&=
\int(2x+y)\,dx+h(y) \\
&=
x^2+xy+h(y).
\end{aligned}
$$

### Step 4: Differentiate with respect to $y$

$$
\Phi_y=x+h'(y)
$$

### Step 5: Compare with $N$

$$
x+h'(y)=x+e^y
$$

Subtract $x$:

$$
h'(y)=e^y
$$

Integrate:

$$
h(y)=e^y
$$

### Step 6: Write the solution

Substitute $h(y)=e^y$ into the expression from Step 3:

$$
\Phi(x,y)=x^2+xy+e^y
$$

The exact equation is $d\Phi=0$. Integrating gives $\Phi=C$, so:

$$
\boxed{x^2+xy+e^y=C}
$$

</details>

<details open>
<summary><strong>Worked Initial-Value Problem</strong></summary>

Solve:

$$
(2x\sin y+3x^2)\,dx
+
(x^2\cos y+2y)\,dy
=0,
\qquad
y(0)=1
$$

First establish the potential within this example. Take:

$$
\Phi(x,y)=x^2\sin y+x^3+y^2
$$

Differentiate it with respect to $x$:

$$
\begin{aligned}
\Phi_x
&=2x\sin y+3x^2
\end{aligned}
$$

This matches the coefficient of $dx$. Differentiate it with respect to $y$:

$$
\begin{aligned}
\Phi_y
&=x^2\cos y+2y
\end{aligned}
$$

This matches the coefficient of $dy$. Therefore the differential equation is
$d\Phi=0$. Integrating gives $\Phi=C$, so the solution family is:

$$
x^2\sin y+x^3+y^2=C
$$

Apply the initial point $(0,1)$:

$$
(0)^2\sin(1)+(0)^3+(1)^2=C
$$

Simplify each term:

$$
0+0+1=C
$$

Hence:

$$
C=1
$$

The initial-value solution is:

$$
\boxed{x^2\sin y+x^3+y^2=1}
$$

At the initial point, the coefficient of $dy$ is:

$$
N(0,1)=0^2\cos(1)+2(1)=2
$$

Since this is nonzero, the implicit relation defines a differentiable local
branch $y(x)$ through $(0,1)$.

</details>

<details open>
<summary><strong>Why Implicit Form Is Often Best</strong></summary>

The equation:

$$
x^2\sin y+x^3+y^2=1
$$

does not have a convenient elementary rearrangement for $y$.

That is not an incomplete answer. The implicit relation:

- identifies the correct level curve
- satisfies the initial condition
- can be differentiated to recover the differential equation
- can support numerical evaluation of $y$ when needed

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Convert slope form to $M\,dx+N\,dy=0$, test exactness, reconstruct the
potential, and then use the initial condition to determine $C$.

The solution naturally remains implicit when algebraic isolation of $y$ is
unhelpful.

</details>

---

## Block 6: Why Integrating Factors Work

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand an integrating factor as a multiplier that repairs
the failed cross-partial condition.

</details>

<details open>
<summary><strong>The Basic Idea</strong></summary>

Suppose:

$$
M\,dx+N\,dy=0
$$

is not exact.

We seek a nonzero function $\mu$ such that:

$$
\mu M\,dx+\mu N\,dy=0
$$

is exact.

The function $\mu$ is called an **integrating factor**.

The repaired cross-partial condition is:

$$
\boxed{(\mu M)_y=(\mu N)_x}
$$

Finding a completely general $\mu(x,y)$ is usually difficult. Two useful
special cases occur when $\mu$ depends only on $x$ or only on $y$.

</details>

<details open>
<summary><strong>Deriving A Factor Depending Only On $x$</strong></summary>

Assume:

$$
\mu=\mu(x)
$$

Because $\mu$ does not depend on $y$:

$$
(\mu M)_y=\mu M_y
$$

Use the product rule on the other side:

$$
(\mu N)_x=\mu' N+\mu N_x
$$

Exactness requires:

$$
\mu M_y=\mu' N+\mu N_x
$$

Move the $\mu N_x$ term to the left:

$$
\mu(M_y-N_x)=\mu' N
$$

Divide by $\mu N$ where both are nonzero:

$$
\frac{\mu'}{\mu}
=
\frac{M_y-N_x}{N}
$$

If the right side simplifies to a function $R(x)$ of $x$ alone, then:

$$
\frac{\mu'}{\mu}=R(x)
$$

Integrate both sides with respect to $x$:

$$
\int\frac{\mu'}{\mu}\,dx
=
\int R(x)\,dx
$$

Since the derivative of $\ln|\mu|$ is $\mu'/\mu$:

$$
\ln|\mu|=\int R(x)\,dx+K
$$

Exponentiate both sides:

$$
|\mu|
=
e^K\exp\left(\int R(x)\,dx\right)
$$

The factor $e^K$ is a positive constant, and either sign of $\mu$ is
allowed. Since multiplying an integrating factor by any nonzero constant
produces another integrating factor, choose that constant to be $1$. A
convenient integrating factor is therefore:

$$
\boxed{
\mu(x)=\exp\left(\int R(x)\,dx\right)
}
$$

A nonzero constant multiple of this choice is equally valid.

</details>

<details open>
<summary><strong>Deriving A Factor Depending Only On $y$</strong></summary>

Now assume:

$$
\mu=\mu(y)
$$

Use the product rule with respect to $y$:

$$
(\mu M)_y=\mu' M+\mu M_y
$$

Since $\mu$ does not depend on $x$:

$$
(\mu N)_x=\mu N_x
$$

Set the expressions equal:

$$
\mu' M+\mu M_y=\mu N_x
$$

Move the $\mu M_y$ term to the right:

$$
\mu' M=\mu(N_x-M_y)
$$

Divide by $\mu M$ where permitted:

$$
\frac{\mu'}{\mu}
=
\frac{N_x-M_y}{M}
$$

If the right side is a function $S(y)$ of $y$ alone, then:

$$
\frac{\mu'}{\mu}=S(y)
$$

Integrate both sides with respect to $y$:

$$
\int\frac{\mu'}{\mu}\,dy
=
\int S(y)\,dy
$$

Since the derivative of $\ln|\mu|$ is $\mu'/\mu$:

$$
\ln|\mu|=\int S(y)\,dy+K
$$

Exponentiate:

$$
|\mu|
=
e^K\exp\left(\int S(y)\,dy\right)
$$

As in the $x$-only case, omit the arbitrary nonzero constant multiple and
choose:

$$
\boxed{
\mu(y)=\exp\left(\int S(y)\,dy\right)
}
$$

Notice the order of the numerator:

$$
N_x-M_y
$$

for a $y$-only factor, but:

$$
M_y-N_x
$$

for an $x$-only factor.

</details>

<details open>
<summary><strong>A Decision Rule</strong></summary>

For a nonexact form, calculate:

$$
R(x,y)=\frac{M_y-N_x}{N}
$$

and:

$$
S(x,y)=\frac{N_x-M_y}{M}
$$

Then:

- if $R$ depends only on $x$, try $\mu(x)=e^{\int R\,dx}$
- if $S$ depends only on $y$, try $\mu(y)=e^{\int S\,dy}$
- if neither simplification occurs, these one-variable tests do not provide an
  integrating factor

Always verify exactness after multiplying. The formula is a route to a
candidate, not a replacement for the final check.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An integrating factor changes a nonexact form into an exact one.

Useful tests are:

$$
\frac{M_y-N_x}{N}=R(x)
\quad\Longrightarrow\quad
\mu(x)=e^{\int R(x)\,dx}
$$

and:

$$
\frac{N_x-M_y}{M}=S(y)
\quad\Longrightarrow\quad
\mu(y)=e^{\int S(y)\,dy}
$$

</details>

---

## Block 7: A Complete $x$-Only Integrating-Factor Example

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to carry the entire process from a failed exactness test to a
verified implicit solution.

</details>

<details open>
<summary><strong>The Problem</strong></summary>

Solve:

$$
2x(y+1)\,dx
+
\left(1+2ye^{-x^2}\right)\,dy
=0
$$

</details>

<details open>
<summary><strong>Step 1: Test The Original Form</strong></summary>

Identify:

$$
M=2x(y+1)
$$

$$
N=1+2ye^{-x^2}
$$

Differentiate $M$ with respect to $y$:

$$
M_y=2x
$$

Differentiate $N$ with respect to $x$:

$$
\begin{aligned}
N_x
&=
2y\frac{d}{dx}(e^{-x^2}) \\
&=
2y(-2x)e^{-x^2} \\
&=
-4xye^{-x^2}.
\end{aligned}
$$

Since:

$$
2x\neq -4xye^{-x^2}
$$

in general, the original form is not exact.

</details>

<details open>
<summary><strong>Step 2: Test For An $x$-Only Factor</strong></summary>

Compute:

$$
\frac{M_y-N_x}{N}
$$

Substitute the derivatives:

$$
\frac{2x-(-4xye^{-x^2})}{1+2ye^{-x^2}}
$$

Remove the double negative:

$$
\frac{2x+4xye^{-x^2}}{1+2ye^{-x^2}}
$$

Factor $2x$ from the numerator:

$$
\frac{2x(1+2ye^{-x^2})}{1+2ye^{-x^2}}
$$

Cancel the common factor where it is nonzero:

$$
\boxed{
\frac{M_y-N_x}{N}=2x
}
$$

The result depends only on $x$.

</details>

<details open>
<summary><strong>Step 3: Construct The Integrating Factor</strong></summary>

Use:

$$
\mu(x)=\exp\left(\int 2x\,dx\right)
$$

Evaluate the integral:

$$
\int 2x\,dx=x^2
$$

Therefore:

$$
\boxed{\mu(x)=e^{x^2}}
$$

</details>

<details open>
<summary><strong>Step 4: Multiply Every Term</strong></summary>

Multiply the complete differential equation by $e^{x^2}$:

$$
e^{x^2}\left[2x(y+1)\right]dx
+
e^{x^2}\left(1+2ye^{-x^2}\right)dy
=0
$$

Simplify the $dy$ coefficient:

$$
\begin{aligned}
e^{x^2}\left(1+2ye^{-x^2}\right)
&=
e^{x^2}+2y e^{x^2}e^{-x^2} \\
&=
e^{x^2}+2y.
\end{aligned}
$$

The transformed equation is:

$$
\boxed{
2xe^{x^2}(y+1)\,dx
+
(e^{x^2}+2y)\,dy
=0
}
$$

</details>

<details open>
<summary><strong>Step 5: Verify Exactness</strong></summary>

Let:

$$
\widetilde M=2xe^{x^2}(y+1)
$$

$$
\widetilde N=e^{x^2}+2y
$$

Then:

$$
\widetilde M_y=2xe^{x^2}
$$

and:

$$
\widetilde N_x=2xe^{x^2}
$$

The transformed form is exact.

The quotient in Step 2 was simplified only where
$1+2ye^{-x^2}\neq 0$. However, the candidate $e^{x^2}$ is defined and
nonzero everywhere, and the direct cross-partial check above works on the
whole plane. That verification extends the transformed exact equation across
the points where the quotient itself was undefined.

</details>

<details open>
<summary><strong>Step 6: Reconstruct The Potential</strong></summary>

Integrate $\widetilde M$ with respect to $x$, holding $y$ constant:

$$
\Phi
=
\int 2xe^{x^2}(y+1)\,dx+h(y)
$$

Factor out $y+1$:

$$
\Phi
=
(y+1)\int 2xe^{x^2}\,dx+h(y)
$$

Since:

$$
\frac{d}{dx}(e^{x^2})=2xe^{x^2},
$$

we obtain:

$$
\Phi=e^{x^2}(y+1)+h(y)
$$

Differentiate with respect to $y$:

$$
\Phi_y=e^{x^2}+h'(y)
$$

Compare with $\widetilde N$:

$$
e^{x^2}+h'(y)=e^{x^2}+2y
$$

Subtract $e^{x^2}$:

$$
h'(y)=2y
$$

Integrate:

$$
h(y)=y^2
$$

Substitute $h(y)=y^2$ into
$\Phi=e^{x^2}(y+1)+h(y)$:

$$
\boxed{
\Phi(x,y)=e^{x^2}(y+1)+y^2
}
$$

</details>

<details open>
<summary><strong>Step 7: State And Check The Solution</strong></summary>

The transformed exact equation has coefficients $\Phi_x$ and $\Phi_y$, so
its left side is $d\Phi$. Therefore:

$$
d\Phi=0
$$

Integrate to obtain $\Phi=C$, then substitute the potential from Step 6. The
implicit solution is:

$$
\boxed{
e^{x^2}(y+1)+y^2=C
}
$$

Differentiate the potential:

$$
\Phi_x=2xe^{x^2}(y+1)
$$

$$
\Phi_y=e^{x^2}+2y
$$

These are exactly the transformed coefficients. Since $e^{x^2}$ is never
zero, multiplying by it did not introduce or remove points through a zero of
the integrating factor.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The full integrating-factor workflow is:

1. fail the original exactness test
2. simplify the one-variable quotient
3. integrate to obtain $\mu$
4. multiply every term
5. verify exactness again
6. reconstruct the potential
7. check the result and domain

</details>

---

## Block 8: A Complete $y$-Only Integrating-Factor Example

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to repeat the method when the repairing factor depends only on
$y$.

</details>

<details open>
<summary><strong>The Problem And Original Test</strong></summary>

Solve:

$$
(2x+1)\,dx+(x^2+x+e^{-y})\,dy=0
$$

Identify:

$$
M=2x+1
$$

$$
N=x^2+x+e^{-y}
$$

Compute:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2x+1) \\
&=0
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2+x+e^{-y}) \\
&=2x+1
\end{aligned}
$$

The form is not exact.

</details>

<details open>
<summary><strong>Step 1: Test For A $y$-Only Factor</strong></summary>

Compute:

$$
\frac{N_x-M_y}{M}
$$

Substitute:

$$
\frac{(2x+1)-0}{2x+1}
$$

Simplify where $2x+1\neq 0$:

$$
\boxed{
\frac{N_x-M_y}{M}=1
}
$$

The result is a function of $y$ alone because a constant is allowed.

</details>

<details open>
<summary><strong>Step 2: Construct And Apply The Factor</strong></summary>

Use:

$$
\mu(y)=\exp\left(\int 1\,dy\right)
$$

Therefore:

$$
\boxed{\mu(y)=e^y}
$$

Multiply every term by $e^y$:

$$
e^y(2x+1)\,dx
+
e^y(x^2+x+e^{-y})\,dy
=0
$$

Simplify:

$$
e^y e^{-y}=1
$$

so the transformed equation is:

$$
\boxed{
e^y(2x+1)\,dx
+
\left(e^y(x^2+x)+1\right)\,dy
=0
}
$$

</details>

<details open>
<summary><strong>Step 3: Verify And Solve</strong></summary>

Set:

$$
\widetilde M=e^y(2x+1)
$$

$$
\widetilde N=e^y(x^2+x)+1
$$

Differentiate:

$$
\widetilde M_y=e^y(2x+1)
$$

$$
\widetilde N_x=e^y(2x+1)
$$

The transformed equation is exact.

The quotient used to discover the factor required $2x+1\neq 0$. The final
factor $e^y$, however, is defined and nonzero for every $(x,y)$, and the
cross-partials above agree even when $x=-\tfrac12$. Thus the verified
transformed equation is exact on the whole plane.

Integrate $\widetilde M$ with respect to $x$, holding $y$ constant:

$$
\begin{aligned}
\Phi
&=
\int e^y(2x+1)\,dx+h(y) \\
&=
e^y(x^2+x)+h(y).
\end{aligned}
$$

Differentiate with respect to $y$:

$$
\Phi_y=e^y(x^2+x)+h'(y)
$$

Compare with $\widetilde N$:

$$
e^y(x^2+x)+h'(y)
=
e^y(x^2+x)+1
$$

Cancel the common term:

$$
h'(y)=1
$$

Integrate:

$$
h(y)=y
$$

Substitute $h(y)=y$ into the reconstructed expression for $\Phi$:

$$
\Phi(x,y)=e^y(x^2+x)+y
$$

The transformed exact equation is $d\Phi=0$. Integrating gives $\Phi=C$, so:

$$
\boxed{
e^y(x^2+x)+y=C
}
$$

</details>

<details open>
<summary><strong>Integrating-Factor Cautions</strong></summary>

An integrating factor may be valid only on part of the plane.

For example, factors such as:

$$
\frac{1}{x},
\qquad
\frac{1}{y^2},
\qquad
|x|^a
$$

require explicit domain restrictions.

Multiplication by a finite nonzero factor preserves the local solution curves.
A factor that is zero, undefined, or obtained after division by a vanishing
coefficient requires additional checking in the original equation.

Integrating factors are also not unique. If $\mu$ works, then any nonzero
constant multiple $K\mu$ works as well.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

For a $y$-only factor, simplify:

$$
\frac{N_x-M_y}{M}
$$

to a function of $y$, integrate it, multiply the whole equation, and verify
exactness before reconstructing the potential.

</details>

---

## Block 9: A Step-By-Step Checklist

<details open>
<summary><strong>For An Equation That May Already Be Exact</strong></summary>

1. Put the equation in the form $M\,dx+N\,dy=0$.
2. Write $M$ and $N$ on separate lines.
3. Calculate $M_y$ and $N_x$.
4. Compare the complete expressions and state the domain.
5. Integrate the easier coefficient in the appropriate variable.
6. Add $h(y)$ or $k(x)$.
7. Differentiate in the other variable.
8. Compare with the untouched coefficient.
9. Solve for the missing one-variable function.
10. Write $\Phi=C$ and verify both partial derivatives.

</details>

<details open>
<summary><strong>For A Nonexact Equation</strong></summary>

1. Confirm that $M_y\neq N_x$.
2. Calculate $(M_y-N_x)/N$.
3. Check whether it depends only on $x$.
4. Calculate $(N_x-M_y)/M$.
5. Check whether it depends only on $y$.
6. Construct the available integrating factor.
7. Record its domain.
8. Multiply both coefficients, not just one term.
9. Retest exactness using the transformed coefficients.
10. Solve the resulting exact equation.
11. Verify the result against the original domain and equation.

</details>

<details open>
<summary><strong>Common Mistakes</strong></summary>

### Comparing the wrong derivatives

The test is:

$$
M_y=N_x
$$

not $M_x=N_y$.

### Treating a partial-integration constant as a number

Use $h(y)$ after integrating with respect to $x$, and $k(x)$ after
integrating with respect to $y$.

### Integrating both coefficients and adding the results

This usually double-counts shared terms. Integrate one coefficient, then use
the other to determine the missing function.

### Applying an integrating-factor formula with both variables remaining

The $x$-only formula requires an expression depending only on $x$. The
$y$-only formula requires an expression depending only on $y$.

### Failing to retest after multiplication

A sign error in the quotient or integral is exposed immediately by the final
cross-partial check.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

Exact-equation work is reliable when every stage has a check:

- cross-partials check the classification
- coefficient comparison checks the missing function
- differentiating $\Phi$ checks the reconstruction
- retesting checks the integrating factor
- the original equation and domain check the final result

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Test Exactness

Determine whether:

$$
(y^2+x)\,dx+(2xy+e^y)\,dy=0
$$

is exact.

### Problem 2: Reconstruct From $M$

Solve:

$$
(2xy+\cos x)\,dx+(x^2+3y^2)\,dy=0
$$

### Problem 3: Reconstruct From $N$

Solve:

$$
(e^x+y)\,dx+(x+2y)\,dy=0
$$

by beginning with the coefficient of $dy$.

### Problem 4: Convert From Slope Form

Convert and solve:

$$
y'=-\frac{y+2x}{x+2y}
$$

on a region where the denominator is nonzero.

### Problem 5: Apply An Initial Condition

Solve:

$$
(e^x+y)\,dx+(x+2y)\,dy=0,
\qquad
y(0)=1
$$

### Problem 6: Find An $x$-Only Integrating Factor

For $x\neq -1$, find an integrating factor depending only on $x$ for:

$$
\left(2+\frac{3y}{1+x}\right)dx+dy=0
$$

Then solve the exact equation that results.

### Problem 7: Find A $y$-Only Integrating Factor

Find an integrating factor depending only on $y$ for:

$$
(1+x^2)\,dx
+
y\left(x+\frac{x^3}{3}\right)\,dy
=0
$$

Then give the potential function.

### Problem 8: Diagnose A Failed Test

For:

$$
(x+y^2)\,dx+(x^2+y)\,dy=0,
$$

calculate both one-variable integrating-factor test quotients. Explain why
neither standard test applies directly.

### Problem 9: Check A Proposed Potential

Determine whether:

$$
\Phi(x,y)=x^2e^y+\ln(1+y^2)
$$

is a potential for:

$$
2xe^y\,dx
+
\left(x^2e^y+\frac{2y}{1+y^2}\right)dy
=0.
$$

### Problem 10: Check A Proposed Integrating Factor

Determine whether $\mu(y)=e^{2y}$ is an integrating factor for:

$$
(3x+1)\,dx
+
\left(\frac{3}{2}x^2+x+e^{-2y}\right)dy
=0.
$$

</details>

<details open>
<summary><strong>Practice Answers</strong></summary>

### Answer 1

Identify:

$$
M=y^2+x,
\qquad
N=2xy+e^y
$$

Differentiate:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(y^2+x) \\
&=2y
\end{aligned}
$$

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(2xy+e^y) \\
&=2y
\end{aligned}
$$

The cross-partials agree, so the equation is exact on the plane.

### Answer 2

Identify the coefficients:

$$
M=2xy+\cos x,
\qquad
N=x^2+3y^2
$$

Test exactness:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+\cos x) \\
&=2x
\end{aligned}
$$

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2+3y^2) \\
&=2x
\end{aligned}
$$

Now integrate $M$ with respect to $x$:

$$
\begin{aligned}
\Phi
&=
\int(2xy+\cos x)\,dx+h(y) \\
&=
x^2y+\sin x+h(y).
\end{aligned}
$$

Differentiate with respect to $y$:

$$
\Phi_y=x^2+h'(y)
$$

Compare with $N=x^2+3y^2$:

$$
x^2+h'(y)=x^2+3y^2
$$

Subtract $x^2$ from both sides:

$$
h'(y)=3y^2
$$

Integrate with respect to $y$:

$$
\begin{aligned}
h(y)
&=\int 3y^2\,dy \\
&=y^3.
\end{aligned}
$$

Substitute $h(y)=y^3$ into the reconstructed potential:

$$
\Phi(x,y)=x^2y+\sin x+y^3
$$

The exact equation is $d\Phi=0$. Integrating gives $\Phi=C$, so the solution
is:

$$
\boxed{x^2y+\sin x+y^3=C}
$$

### Answer 3

Here:

$$
M=e^x+y,
\qquad
N=x+2y
$$

Differentiate each coefficient across the variables:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(e^x+y) \\
&=1
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x+2y) \\
&=1
\end{aligned}
$$

The cross-partials agree, so the form is exact.

Integrate $N$ with respect to $y$:

$$
\begin{aligned}
\Phi
&=
\int(x+2y)\,dy+k(x) \\
&=
xy+y^2+k(x).
\end{aligned}
$$

Differentiate with respect to $x$:

$$
\Phi_x=y+k'(x)
$$

Compare with $M=e^x+y$:

$$
y+k'(x)=e^x+y
$$

Subtract $y$ from both sides:

$$
k'(x)=e^x
$$

Integrate with respect to $x$:

$$
\begin{aligned}
k(x)
&=\int e^x\,dx \\
&=e^x.
\end{aligned}
$$

Substitute $k(x)=e^x$ into the reconstructed potential:

$$
\Phi(x,y)=xy+y^2+e^x
$$

Since the exact equation is $d\Phi=0$, integrate to obtain $\Phi=C$:

$$
\boxed{xy+y^2+e^x=C}
$$

### Answer 4

Multiply by $x+2y$:

$$
(x+2y)y'=-(y+2x)
$$

Move all terms to the left:

$$
(y+2x)+(x+2y)y'=0
$$

Replace $y'$ by $dy/dx$:

$$
(y+2x)+(x+2y)\frac{dy}{dx}=0
$$

Multiply every term by $dx$:

$$
(y+2x)\,dx+(x+2y)\,dy=0
$$

The form is exact because:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(y+2x) \\
&=1
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x+2y) \\
&=1.
\end{aligned}
$$

Integrate $M$ with respect to $x$:

$$
\begin{aligned}
\Phi
&=\int(y+2x)\,dx+h(y) \\
&=xy+x^2+h(y),
\end{aligned}
$$

where $y$ is held constant.

Then:

$$
\Phi_y=x+h'(y)
$$

Compare with $N=x+2y$:

$$
x+h'(y)=x+2y
$$

Subtract $x$ from both sides:

$$
h'(y)=2y
$$

Integrate with respect to $y$:

$$
\begin{aligned}
h(y)
&=\int 2y\,dy \\
&=y^2.
\end{aligned}
$$

Substitute $h(y)=y^2$ into the reconstructed potential:

$$
\Phi(x,y)=xy+x^2+y^2
$$

The exact equation is $d\Phi=0$. Integrating gives $\Phi=C$, so the solution
is:

$$
\boxed{x^2+xy+y^2=C}
$$

### Answer 5

Use the potential:

$$
\Phi(x,y)=xy+y^2+e^x
$$

Check it locally:

$$
\Phi_x=y+e^x=M
$$

and:

$$
\Phi_y=x+2y=N
$$

Both coefficients are recovered, so the differential equation is $d\Phi=0$.
Integrating gives $\Phi=C$, or:

$$
xy+y^2+e^x=C
$$

Apply $(0,1)$:

$$
(0)(1)+(1)^2+e^0=C
$$

Therefore:

$$
0+1+1=C
$$

so:

$$
C=2
$$

The initial-value solution is:

$$
\boxed{xy+y^2+e^x=2}
$$

### Answer 6

Identify:

$$
M=2+\frac{3y}{1+x},
\qquad
N=1
$$

Then:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}\left(2+\frac{3y}{1+x}\right) \\
&=\frac{3}{1+x}
\end{aligned}
$$

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(1) \\
&=0
\end{aligned}
$$

The $x$-test gives:

$$
\begin{aligned}
\frac{M_y-N_x}{N}
&=\frac{\frac{3}{1+x}-0}{1} \\
&=\frac{3}{1+x}
\end{aligned}
$$

Therefore:

$$
\begin{aligned}
\mu(x)
&=
\exp\left(\int\frac{3}{1+x}\,dx\right) \\
&=
\exp(3\ln|1+x|) \\
&=|1+x|^3.
\end{aligned}
$$

On $x>-1$, this is $(1+x)^3$. On $x<-1$, it is $-(1+x)^3$.
These differ only by the nonzero constant factor $-1$, so on either interval
we may use the simpler representative:

$$
\boxed{\mu(x)=(1+x)^3}
$$

Multiply the equation:

$$
\left[2(1+x)^3+3y(1+x)^2\right]dx
+
(1+x)^3dy
=0
$$

Call the transformed coefficients $\widetilde M$ and $\widetilde N$:

$$
\widetilde M=2(1+x)^3+3y(1+x)^2
$$

$$
\widetilde N=(1+x)^3
$$

Retest exactness:

$$
\widetilde M_y=3(1+x)^2
$$

and:

$$
\widetilde N_x=3(1+x)^2
$$

The transformed equation is exact.

Integrate the $dy$ coefficient with respect to $y$:

$$
\begin{aligned}
\Phi
&=\int(1+x)^3\,dy+k(x) \\
&=(1+x)^3y+k(x),
\end{aligned}
$$

where $x$ is held constant during the integration.

Differentiate with respect to $x$:

$$
\Phi_x=3(1+x)^2y+k'(x)
$$

Set this equal to $\widetilde M$:

$$
3(1+x)^2y+k'(x)
=
2(1+x)^3+3y(1+x)^2
$$

Subtract the common $3y(1+x)^2$ term:

$$
k'(x)=2(1+x)^3
$$

Integrate using $u=1+x$, so $du=dx$:

$$
\begin{aligned}
k(x)
&=\int 2(1+x)^3\,dx \\
&=\int 2u^3\,du \\
&=\frac{u^4}{2} \\
&=\frac{(1+x)^4}{2}.
\end{aligned}
$$

Substitute this $k(x)$ into the reconstructed potential:

$$
\Phi(x,y)=(1+x)^3y+\frac{(1+x)^4}{2}
$$

The transformed exact equation is $d\Phi=0$. Integrating gives $\Phi=C$, so
the solution is:

$$
\boxed{
(1+x)^3y+\frac{(1+x)^4}{2}=C
}
$$

### Answer 7

Identify:

$$
M=1+x^2
$$

$$
N=y\left(x+\frac{x^3}{3}\right)
$$

Compute:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(1+x^2) \\
&=0
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}
\left[y\left(x+\frac{x^3}{3}\right)\right] \\
&=y(1+x^2).
\end{aligned}
$$

The $y$-test gives:

$$
\frac{N_x-M_y}{M}
=
\frac{y(1+x^2)}{1+x^2}
=
y
$$

Therefore:

$$
\begin{aligned}
\mu(y)
&=\exp\left(\int y\,dy\right) \\
&=\boxed{e^{y^2/2}}.
\end{aligned}
$$

Multiply both original coefficients by $e^{y^2/2}$:

$$
e^{y^2/2}(1+x^2)\,dx
+
e^{y^2/2}y\left(x+\frac{x^3}{3}\right)\,dy
=0
$$

The transformed coefficients are:

$$
\widetilde M=e^{y^2/2}(1+x^2)
$$

$$
\widetilde N=e^{y^2/2}y\left(x+\frac{x^3}{3}\right)
$$

Retest exactness. Differentiating $\widetilde M$ with respect to $y$ gives:

$$
\widetilde M_y
=
ye^{y^2/2}(1+x^2)
$$

Differentiating $\widetilde N$ with respect to $x$ gives:

$$
\widetilde N_x
=
ye^{y^2/2}(1+x^2)
$$

The transformed equation is exact.

Now integrate $\widetilde M$ with respect to $x$. The factor
$e^{y^2/2}$ is constant during this integration:

$$
\begin{aligned}
\Phi
&=\int e^{y^2/2}(1+x^2)\,dx+h(y) \\
&=e^{y^2/2}\int(1+x^2)\,dx+h(y) \\
&=e^{y^2/2}\left(x+\frac{x^3}{3}\right)+h(y).
\end{aligned}
$$

Differentiate with respect to $y$:

$$
\Phi_y
=
ye^{y^2/2}\left(x+\frac{x^3}{3}\right)+h'(y)
$$

Compare this with $\widetilde N$:

$$
ye^{y^2/2}\left(x+\frac{x^3}{3}\right)+h'(y)
=
ye^{y^2/2}\left(x+\frac{x^3}{3}\right)
$$

Subtract the common term:

$$
h'(y)=0
$$

Thus $h(y)$ is constant, and that constant may be omitted from the potential:

$$
\boxed{
\Phi(x,y)=e^{y^2/2}\left(x+\frac{x^3}{3}\right)
}
$$

### Answer 8

Here:

$$
M=x+y^2,
\qquad
N=x^2+y
$$

Then:

$$
M_y=2y,
\qquad
N_x=2x
$$

The $x$-test quotient is:

$$
\frac{M_y-N_x}{N}
=
\frac{2y-2x}{x^2+y},
$$

which depends on both variables.

The $y$-test quotient is:

$$
\frac{N_x-M_y}{M}
=
\frac{2x-2y}{x+y^2},
$$

which also depends on both variables.

Therefore neither one-variable integrating-factor test applies directly.

### Answer 9

Differentiate the proposed potential:

$$
\Phi_x=2xe^y
$$

For the $y$ derivative:

$$
\begin{aligned}
\Phi_y
&=
x^2e^y
+
\frac{1}{1+y^2}(2y) \\
&=
x^2e^y+\frac{2y}{1+y^2}.
\end{aligned}
$$

These derivatives match the two displayed coefficients, so $\Phi$ is a
potential.

### Answer 10

Multiply the equation by $e^{2y}$:

$$
e^{2y}(3x+1)\,dx
+
\left[e^{2y}\left(\frac{3}{2}x^2+x\right)+1\right]dy
=0
$$

Let the transformed coefficients be $\widetilde M$ and $\widetilde N$.

Differentiate:

$$
\widetilde M_y=2e^{2y}(3x+1)
$$

and:

$$
\begin{aligned}
\widetilde N_x
&=
e^{2y}(3x+1).
\end{aligned}
$$

These are not equal. Therefore the proposed factor $e^{2y}$ is **not** an
integrating factor.

The mismatch is deliberate: it demonstrates that a proposed factor must be
verified rather than accepted from appearance alone.

To find the correct factor, return to the original coefficients. Their
cross-partials are:

$$
M_y=0
$$

Differentiate $N$ with respect to $x$:

$$
N_x=3x+1
$$

Therefore, where $3x+1\neq 0$:

$$
\begin{aligned}
\frac{N_x-M_y}{M}
&=\frac{(3x+1)-0}{3x+1} \\
&=1.
\end{aligned}
$$

Integrating this result gives:

$$
\begin{aligned}
\mu(y)
&=\exp\left(\int 1\,dy\right) \\
&=e^y.
\end{aligned}
$$

Thus a valid integrating factor is:

$$
\boxed{\mu(y)=e^y}
$$

To verify it directly, multiply the original coefficients by $e^y$:

$$
\widehat M=e^y(3x+1)
$$

$$
\widehat N
=
e^y\left(\frac{3}{2}x^2+x\right)+e^{-y}
$$

Then:

$$
\widehat M_y=e^y(3x+1)
$$

and:

$$
\widehat N_x=e^y(3x+1)
$$

The cross-partials agree everywhere. This direct check also shows that the
factor remains valid on the line $3x+1=0$, where the discovery quotient was
undefined.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

Exact equations are solved by uncovering a potential function:

$$
M\,dx+N\,dy=d\Phi
$$

The test:

$$
M_y=N_x
$$

checks whether that potential can exist on the working domain.

The reconstruction then uses one partial integration and one coefficient
comparison. If the original form is not exact, a one-variable integrating
factor may repair it.

The main lesson is:

> show each partial derivative, integration choice, comparison, and
> substitution clearly enough that every line can be checked against the
> original equation.

</details>
