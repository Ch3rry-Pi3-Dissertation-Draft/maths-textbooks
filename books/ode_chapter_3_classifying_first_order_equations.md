# Recognising First-Order Equations: A Classification Toolkit

This chapter develops a practical way to classify first-order ordinary
differential equations before trying to solve them.

Classification matters because different structures suggest different
solution methods. A linear equation invites one method, a separable equation
another, and an exact equation another.

The important questions are:

- which form makes the equation easiest to read?
- is the unknown function used linearly?
- can the two variables be separated?
- does the equation depend only on a ratio such as $y/x$?
- does one nonlinear power of the unknown fit the Bernoulli pattern?
- does a differential form come from a single potential function?

The central principle is:

> classify the mathematical structure, not merely the way the equation first
> happens to be written.

An equation may belong to more than one class. Algebra can reveal a hidden
class, but division can also change the domain or discard solutions. Both
facts will be part of our classification routine.

---

## Block 1: Put The Equation In A Useful Form

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to move confidently between three common descriptions of a
first-order equation.

They are:

1. an implicit equation involving $x$, $y$, and $y'$
2. slope form, with $y'$ isolated
3. differential form, with coefficients of $dx$ and $dy$

The same differential equation can look very different in these forms.

> changing the representation does not change the intended solution curves,
> provided every algebraic step is valid on the domain being considered.

</details>

<details open>
<summary><strong>Three Common Representations</strong></summary>

A general first-order equation may be written implicitly as:

$$
G(x,y,y')=0
$$

Here:

- $x$ is the independent variable
- $y=y(x)$ is the unknown function
- $y'=dy/dx$ is its first derivative
- $G$ is a known expression

If the derivative can be isolated, the equation has **slope form**:

$$
\boxed{y'=F(x,y)}
$$

This form directly tells us the slope assigned at each permitted point
$(x,y)$.

A first-order equation may also be written in **differential form**:

$$
\boxed{M(x,y)\,dx+N(x,y)\,dy=0}
$$

If $N(x,y)\neq 0$, divide by $dx$ and use $dy/dx=y'$:

$$
M(x,y)+N(x,y)y'=0
$$

Subtract $M(x,y)$ from both sides:

$$
N(x,y)y'=-M(x,y)
$$

Now divide by $N(x,y)$. Therefore:

$$
\boxed{y'=-\frac{M(x,y)}{N(x,y)}}
$$

This last step is valid only where $N(x,y)$ is nonzero.

</details>

<details open>
<summary><strong>Example: From An Implicit Equation To Slope Form</strong></summary>

Consider:

$$
(4+x^2)y'+3y-e^{-x}=0
$$

Starting from $(4+x^2)y'+3y-e^{-x}=0$, add $e^{-x}$ to both
sides and subtract $3y$ from both sides:

$$
(4+x^2)y'=e^{-x}-3y
$$

Since $4+x^2>0$ for every real $x$, division is valid everywhere:

$$
\boxed{y'=\frac{e^{-x}-3y}{4+x^2}}
$$

The corresponding differential form is obtained from
$y'=dy/dx$:

$$
(4+x^2)\frac{dy}{dx}+3y-e^{-x}=0
$$

Multiply by $dx$:

$$
\boxed{(3y-e^{-x})\,dx+(4+x^2)\,dy=0}
$$

What this tells us:

> slope form highlights the local rate $y'$, while differential form presents
> the equation as a relation between changes in $x$ and $y$.

</details>

<details open>
<summary><strong>Example: From Differential Form To Slope Form</strong></summary>

Start with:

$$
(y-2x)\,dx+(1+y^2)\,dy=0
$$

In this displayed differential form, the coefficients are:

$$
M(x,y)=y-2x,
\qquad
N(x,y)=1+y^2
$$

Because $1+y^2>0$ for every real $y$, we may solve for $y'$ globally:

$$
\begin{aligned}
(y-2x)+(1+y^2)y'&=0,\\
(1+y^2)y'&=2x-y,\\
y'&=\frac{2x-y}{1+y^2}.
\end{aligned}
$$

Thus:

$$
\boxed{y'=\frac{2x-y}{1+y^2}}
$$

</details>

<details open>
<summary><strong>One Slope Form Has Many Differential Forms</strong></summary>

Suppose:

$$
y'=\frac{x-y}{2+y^2}
$$

One differential form is:

$$
(y-x)\,dx+(2+y^2)\,dy=0
$$

Multiplying the entire equation by any nonzero function $\mu(x,y)$ gives
another form with the same local solution curves wherever $\mu$ is defined
and nonzero:

$$
\mu(x,y)(y-x)\,dx+\mu(x,y)(2+y^2)\,dy=0
$$

For the base form
$(y-x)\,dx+(2+y^2)\,dy=0$, choosing the nonzero multiplier
$\mu=e^x$ gives:

$$
e^x(y-x)\,dx+e^x(2+y^2)\,dy=0
$$

This freedom becomes important when we discuss exactness. Exactness belongs
to a particular differential form, not automatically to every equivalent
form.

</details>

<details open>
<summary><strong>A Domain Warning</strong></summary>

Algebraic rewriting can hide restrictions.

For example, consider:

$$
(y-1)y'=x(y-1)
$$

Dividing by $y-1$ gives:

$$
y'=x
$$

but that division is invalid when $y=1$.

The original equation is also satisfied by the constant function:

$$
y(x)=1
$$

because both sides are then zero.

The practical meaning is:

> before cancelling or dividing by an expression containing the unknown,
> check whether setting that expression to zero produces additional
> solutions.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

A first-order equation may be implicit, in slope form, or in differential
form.

The most useful forms are:

$$
y'=F(x,y)
$$

and:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

Converting between them can expose structure. Every division must be checked
for domain restrictions and possible lost solutions.

</details>

---

## Block 2: A Classification Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to replace guesswork with a repeatable inspection routine.

The routine does not solve the equation. It identifies structures that may
make the equation solvable by a standard method.

> classification is a method-selection step.

</details>

<details open>
<summary><strong>The Recognition Checklist</strong></summary>

For a first-order equation, ask the following questions.

### 1. Can the derivative be isolated?

Try to obtain:

$$
y'=F(x,y)
$$

This form is especially useful for testing linearity, separability, and
first-order homogeneity.

### 2. Is it linear in the unknown function?

Look for:

$$
y'+p(x)y=q(x)
$$

Only the first power of $y$ is permitted, and its coefficient may depend on
$x$ but not on $y$.

### 3. Can all $y$-dependence be moved beside $dy$?

Look for a rearrangement such as:

$$
A(y)\,dy=B(x)\,dx
$$

This signals a separable equation.

### 4. Does the slope depend only on a ratio?

Look for:

$$
y'=H\!\left(\frac{y}{x}\right)
$$

This is the usual first-order homogeneous pattern.

### 5. Is there one nonlinear power of $y$?

Look for:

$$
y'+p(x)y=q(x)y^n
$$

This is the Bernoulli pattern.

### 6. Does differential form pass the cross-partial test?

For:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

compare:

$$
\frac{\partial M}{\partial y}
\qquad\text{and}\qquad
\frac{\partial N}{\partial x}
$$

Matching cross-partials signal exactness under the regularity and domain
conditions discussed later in this chapter.

</details>

<details open>
<summary><strong>Classifications Can Overlap</strong></summary>

Consider:

$$
y'=-3xy
$$

The equation $y'=-3xy$ is linear because adding $3xy$ to both sides
gives:

$$
y'+3xy=0
$$

It is also separable because:

$$
\frac{1}{y}\,dy=-3x\,dx
$$

where $y\neq 0$.

The function $y=0$ must be checked separately because division by $y$ was
used.

This equation is therefore not forced into one exclusive category.

The shared linear and separable example illustrates the broader point:

> a classification describes a usable structure; one equation may contain
> several usable structures.

</details>

<details open>
<summary><strong>Appearance Can Be Misleading</strong></summary>

Consider:

$$
(1+x^2)y'+2xy=1
$$

At first sight it does not match the standard linear template because the
coefficient of $y'$ is not $1$.

Divide by $1+x^2$:

$$
y'+\frac{2x}{1+x^2}y=\frac{1}{1+x^2}
$$

Now the linear structure is visible.

By contrast:

$$
(1+y^2)y'+2xy=1
$$

becomes:

$$
y'=\frac{1-2xy}{1+y^2}
$$

The coefficient attached to the derivative depends on $y$, and the resulting
equation is not linear in $y$.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

First put the equation into a revealing form. Then test for linear,
separable, first-order homogeneous, Bernoulli, and exact structures.

Do not stop after finding one valid classification. Do not classify from a
single term without checking the whole equation.

</details>

---

## Block 3: Recognising Linear Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to distinguish equations that are linear in the unknown function
from equations that merely look algebraically simple.

</details>

<details open>
<summary><strong>The Linear Pattern</strong></summary>

A first-order equation is linear in $y$ if it can be written as:

$$
\boxed{y'+p(x)y=q(x)}
$$

The functions $p$ and $q$ may be complicated functions of $x$.

What matters is how $y$ appears.

Permitted terms include:

$$
x^2y,
\qquad
e^{-x}y,
\qquad
\frac{y}{1+x^2}
$$

Nonlinear uses of $y$ include:

$$
y^2,
\qquad
\sqrt{y},
\qquad
\sin y,
\qquad
yy'
$$

The key intuition:

> coefficients may be nonlinear functions of the independent variable, but
> the unknown function and its derivative must enter to the first power and
> must not multiply each other.

</details>

<details open>
<summary><strong>Example: Reveal The Linear Structure</strong></summary>

Consider the equation for $u=u(t)$:

$$
(1+t^2)u'+4tu=\cos t
$$

Since $1+t^2$ never vanishes, divide through by it:

$$
u'+\frac{4t}{1+t^2}u=\frac{\cos t}{1+t^2}
$$

Comparing the normalized equation with the linear pattern
$u'+p(t)u=q(t)$ gives:

$$
p(t)=\frac{4t}{1+t^2},
\qquad
q(t)=\frac{\cos t}{1+t^2}
$$

Therefore the equation is linear.

Notice that $p(t)$ is not a constant. Linearity does not require constant
coefficients.

</details>

<details open>
<summary><strong>Near Misses</strong></summary>

Consider the following equations.

### Equation A

$$
z'+s^3z=e^{-s}
$$

This is linear. The coefficient $s^3$ depends only on the independent
variable $s$.

### Equation B

$$
z'+s z^3=e^{-s}
$$

This is not linear because $z$ appears to the third power.

### Equation C

$$
z'+\sin(z)=e^{-s}
$$

This is not linear because the unknown is inside a sine function.

### Equation D

$$
(1+z)z'+sz=0
$$

This is not linear because the derivative is multiplied by a function of the
unknown.

For Equation D, $(1+z)z'+sz=0$, isolating the derivative gives:

$$
z'=-\frac{sz}{1+z}
$$

the nonlinear dependence is clear.

</details>

<details open>
<summary><strong>Two Meanings Of Homogeneous</strong></summary>

A linear equation:

$$
y'+p(x)y=q(x)
$$

is called **homogeneous linear** when:

$$
q(x)=0
$$

Thus:

$$
y'+p(x)y=0
$$

is homogeneous in the linear-equation sense.

Later we will call an equation such as:

$$
y'=H(y/x)
$$

homogeneous in the first-order scale-invariance sense.

Homogeneous linear and first-order homogeneous are different definitions
that happen to use the same word.

> whenever the word "homogeneous" appears, identify which mathematical
> context supplies its meaning.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

A linear first-order equation can be written as:

$$
y'+p(x)y=q(x)
$$

The unknown and its derivative appear only to the first power. Their
coefficients depend only on the independent variable.

Nonlinear functions of $y$, powers other than one, and products such as
$yy'$ break linearity.

</details>

---

## Block 4: Recognising Separable Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise when all $x$-dependence and all $y$-dependence can be
placed on opposite sides of an equation.

</details>

<details open>
<summary><strong>The Separable Pattern</strong></summary>

A common separable form is:

$$
\boxed{y'=g(x)h(y)}
$$

Starting from $y'=g(x)h(y)$, divide by $h(y)$ and multiply by $dx$.
Where $h(y)\neq 0$, this gives:

$$
\boxed{\frac{1}{h(y)}\,dy=g(x)\,dx}
$$

The left side then depends only on $y$, while the right side depends only on
$x$.

An equivalent differential-form pattern is:

$$
A(x)\,dx+B(y)\,dy=0
$$

The practical meaning:

> separability is about a multiplicative split between the independent and
> dependent variables after valid algebraic rearrangement.

</details>

<details open>
<summary><strong>Example: An Equation With Two Classifications</strong></summary>

Consider:

$$
r'=(1+x^2)(2-r)
$$

It is separable because:

$$
\frac{1}{2-r}\,dr=(1+x^2)\,dx
$$

where $r\neq 2$.

The equation $r'=(1+x^2)(2-r)$ is also linear. First expand its right
side:

$$
r'=2(1+x^2)-(1+x^2)r
$$

Now add $(1+x^2)r$ to both sides:

$$
r'+(1+x^2)r=2(1+x^2)
$$

The same equation therefore supports both a separable method and a linear
method.

Separating $r'=(1+x^2)(2-r)$ required division by $2-r$, so we must
check the excluded value $r=2$. For this constant value:

$$
r'=0
$$

and:

$$
(1+x^2)(2-r)=0
$$

so $r(x)=2$ is a constant solution of the original equation.

</details>

<details open>
<summary><strong>A Hidden Separable Structure</strong></summary>

Consider:

$$
(1+y^2)y'=xe^x
$$

Replace $y'$ by $dy/dx$:

$$
(1+y^2)\frac{dy}{dx}=xe^x
$$

Starting from
$(1+y^2)\frac{dy}{dx}=xe^x$, multiply both sides by $dx$:

$$
\boxed{(1+y^2)\,dy=xe^x\,dx}
$$

The variables are separated even though the original equation was not
presented as a product $g(x)h(y)$.

</details>

<details open>
<summary><strong>Addition Usually Prevents Separation</strong></summary>

Consider:

$$
y'=x+y
$$

The right side is a sum, not a product of one function of $x$ and one function
of $y$.

For the equation $y'=x+y$, merely writing:

$$
\frac{dy}{x+y}=dx
$$

does not separate the variables because the denominator on the left still
contains both $x$ and $y$.

The equation is linear:

$$
y'-y=x
$$

but it is not separable by the ordinary separable-equation test.

A common mistake is:

> moving $dx$ and $dy$ to different sides is not enough; each side must
> depend on only one of the two variables.

</details>

<details open>
<summary><strong>Equilibrium Solutions And Division</strong></summary>

Suppose:

$$
y'=x(y-1)(y+2)
$$

Starting from $y'=x(y-1)(y+2)$, divide by $(y-1)(y+2)$ and multiply
by $dx$. For nonconstant solutions away from the zeros of that factor,
this gives:

$$
\frac{1}{(y-1)(y+2)}\,dy=x\,dx
$$

The separated equation was obtained by dividing the original equation by
$(y-1)(y+2)$, so it assumes:

$$
(y-1)(y+2)\neq 0
$$

The excluded constant values are:

$$
y=1
\qquad\text{and}\qquad
y=-2
$$

Substitution into the original equation shows that both are constant
solutions.

What to remember:

> when separating by dividing through a function of $y$, test its zeros in
> the original equation before continuing.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

A separable equation can be arranged so that one side depends only on $y$ and
the other only on $x$:

$$
A(y)\,dy=B(x)\,dx
$$

Products often separate; sums usually do not. Division by a function of $y$
requires a separate check of its zeros.

</details>

---

## Block 5: Recognising First-Order Homogeneous Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise first-order equations whose slope depends only on
the ratio between the dependent and independent variables.

This meaning of homogeneous is based on scaling, not on the zero right-hand
side used in linear equations.

</details>

<details open>
<summary><strong>The Ratio Pattern</strong></summary>

A first-order equation is homogeneous in this sense if it can be written as:

$$
\boxed{y'=H\!\left(\frac{y}{x}\right)}
$$

on a domain where the ratio is defined.

Equivalently, if:

$$
y'=F(x,y)
$$

then $F$ is unchanged when $x$ and $y$ are scaled by the same nonzero factor:

$$
F(\lambda x,\lambda y)=F(x,y)
$$

where both sides are defined.

Why? The ratio does not change:

$$
\frac{\lambda y}{\lambda x}=\frac{y}{x}
$$

The geometric intuition is:

> points lying on the same ray from the origin receive the same slope.

</details>

<details open>
<summary><strong>Example: Reveal The Ratio</strong></summary>

Consider:

$$
y'=\frac{x^2+4xy-y^2}{x^2+y^2}
$$

For $x\neq 0$, divide the numerator and denominator by $x^2$:

$$
\begin{aligned}
y'
&=
\frac{x^2/x^2+4xy/x^2-y^2/x^2}
{x^2/x^2+y^2/x^2} \\
&=
\frac{1+4(y/x)-(y/x)^2}{1+(y/x)^2}.
\end{aligned}
$$

For the ratio expression obtained above, set:

$$
v=\frac{y}{x}
$$

then:

$$
y'=\frac{1+4v-v^2}{1+v^2}
$$

The right side depends only on $v=y/x$. Therefore the equation is
first-order homogeneous.

</details>

<details open>
<summary><strong>Why The Substitution Works</strong></summary>

The natural substitution is:

$$
v=\frac{y}{x}
$$

which means:

$$
y=xv
$$

Since $v$ is generally a function of $x$, use the product rule:

$$
\begin{aligned}
y'&=\frac{d}{dx}(xv),\\
y'&=v+xv'.
\end{aligned}
$$

If the original equation is $y'=H(y/x)$, substitution gives:

$$
v+xv'=H(v)
$$

Starting from $v+xv'=H(v)$, subtract $v$ from both sides:

$$
xv'=H(v)-v
$$

This new equation is separable when the required divisions are valid.

We are not solving the equation here. We are seeing why the classification
points toward a useful substitution.

</details>

<details open>
<summary><strong>A Quick Degree Test</strong></summary>

Suppose the slope is a quotient of polynomials:

$$
y'=\frac{P(x,y)}{Q(x,y)}
$$

If every term in $P$ has the same total degree $m$, and every term in $Q$ has
that same degree $m$, their common scaling factor cancels.

For example:

$$
y'=\frac{3x^2+2xy}{y^2-5xy}
$$

has degree $2$ in both numerator and denominator. Dividing by $x^2$ expresses
the slope as:

$$
y'=\frac{3+2(y/x)}{(y/x)^2-5(y/x)},
$$

which is a function of $y/x$ alone.

By contrast:

$$
y'=\frac{x^2+2y}{x^2+y^2}
$$

mixes degrees in the numerator: $x^2$ has degree $2$, while $y$ has degree
$1$. The quick degree test fails, and the equation is not homogeneous by this
criterion.

</details>

<details open>
<summary><strong>A Constant Can Break Scale Invariance</strong></summary>

Consider:

$$
y'=\frac{x+y+1}{x-y}
$$

For
$F(x,y)=(x+y+1)/(x-y)$, scale $x$ and $y$ by $\lambda$:

$$
F(\lambda x,\lambda y)
=
\frac{\lambda x+\lambda y+1}{\lambda x-\lambda y}
$$

The isolated constant $1$ does not scale with $x$ and $y$, so the factor
$\lambda$ does not cancel from the whole expression.

Therefore the equation is not first-order homogeneous.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A first-order homogeneous equation has a slope that depends only on $y/x$:

$$
y'=H(y/x)
$$

The scaling test is:

$$
F(\lambda x,\lambda y)=F(x,y)
$$

The substitution $y=xv$ changes the equation into one involving $v$ and
$v'$, usually revealing separability.

</details>

---

## Block 6: Recognising Bernoulli Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise a controlled form of nonlinearity that can be
converted into a linear equation.

</details>

<details open>
<summary><strong>The Bernoulli Pattern</strong></summary>

A Bernoulli equation can be written as:

$$
\boxed{y'+p(x)y=q(x)y^n}
$$

where $n$ is a fixed real number.

For the genuinely nonlinear Bernoulli case, we take:

$$
n\neq 0
\qquad\text{and}\qquad
n\neq 1
$$

The edge cases are already linear:

- if $n=0$, then $y^n=1$
- if $n=1$, the right side is another coefficient times $y$

The defining feature is one nonlinear power $y^n$ alongside the linear term
in $y$.

</details>

<details open>
<summary><strong>The Linearising Substitution</strong></summary>

For:

$$
y'+p(x)y=q(x)y^n
$$

For the Bernoulli equation $y'+p(x)y=q(x)y^n$, the standard
substitution is:

$$
\boxed{v=y^{1-n}}
$$

Differentiate:

$$
v'=(1-n)y^{-n}y'
$$

Starting from $y'+p(x)y=q(x)y^n$, multiply every term by $y^{-n}$
where that operation is valid:

$$
y^{-n}y'+p(x)y^{1-n}=q(x)
$$

Using:

$$
y^{-n}y'=\frac{v'}{1-n}
\qquad\text{and}\qquad
y^{1-n}=v
$$

gives:

$$
\frac{v'}{1-n}+p(x)v=q(x)
$$

Multiply by $1-n$:

$$
\boxed{v'+(1-n)p(x)v=(1-n)q(x)}
$$

This is linear in $v$.

What this tells us:

> a Bernoulli equation is nonlinear in the original unknown but linear after
> a power substitution tailored to its exponent.

</details>

<details open>
<summary><strong>Example: Identify The Exponent</strong></summary>

Consider $a=a(t)$:

$$
a'+\frac{2}{1+t}a=(1+t)a^{-2}
$$

Comparing
$a'+\frac{2}{1+t}a=(1+t)a^{-2}$
with the Bernoulli pattern gives:

$$
p(t)=\frac{2}{1+t},
\qquad
q(t)=1+t,
\qquad
n=-2
$$

The equation is defined away from $t=-1$, and the displayed nonlinear term
also requires $a\neq 0$.

Since:

$$
1-n=1-(-2)=3
$$

use:

$$
v=a^3
$$

The transformed linear equation is:

$$
v'+(1-n)p(t)v=(1-n)q(t)
$$

In the transformed equation
$v'+(1-n)p(t)v=(1-n)q(t)$, substitute
$1-n=3$, $p(t)=2/(1+t)$, and $q(t)=1+t$:

$$
\begin{aligned}
v'+3\left(\frac{2}{1+t}\right)v
&=3(1+t) \\
v'+\frac{6}{1+t}v
&=3(1+t).
\end{aligned}
$$

The classification has selected the substitution without requiring us to
finish the solution.

</details>

<details open>
<summary><strong>Examples And Near Misses</strong></summary>

### Bernoulli

$$
y'+x^2y=e^{-x}y^{5/2}
$$

There is one nonlinear power, $n=5/2$.

### Linear, Not Genuinely Nonlinear Bernoulli

$$
y'+x^2y=e^{-x}
$$

This corresponds to the edge exponent $n=0$ and is already linear.

### Not Bernoulli

$$
y'+x^2y=e^{-x}\sin y
$$

The nonlinear term is not a fixed power of $y$.

### Not Bernoulli

$$
y'+xy^2=e^{-x}y^5
$$

Two different nonlinear powers appear. It does not match the required
linear-term-plus-one-power structure.

</details>

<details open>
<summary><strong>Bernoulli Can Overlap With Separable</strong></summary>

Consider:

$$
y'=x^2y^4
$$

It is Bernoulli with:

$$
p(x)=0,
\qquad
q(x)=x^2,
\qquad
n=4
$$

The same equation $y'=x^2y^4$ is also separable:

$$
y^{-4}\,dy=x^2\,dx
$$

where $y\neq 0$.

The constant solution $y=0$ must again be checked in the original equation.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

A Bernoulli equation has the form:

$$
y'+p(x)y=q(x)y^n
$$

For $n\neq 0,1$, it is nonlinear in $y$. The substitution:

$$
v=y^{1-n}
$$

converts it into a linear equation in $v$.

One nonlinear power is permitted. An arbitrary nonlinear function or several
different powers do not fit the pattern.

</details>

---

## Block 7: Recognising Exact Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise when a differential form is the total differential
of a single scalar function.

This section previews the structure. A later chapter will develop the full
solution method.

</details>

<details open>
<summary><strong>The Potential-Function Idea</strong></summary>

Suppose a function $\Phi(x,y)$ has continuous first partial derivatives. Its
total differential is:

$$
d\Phi
=
\frac{\partial\Phi}{\partial x}\,dx
+
\frac{\partial\Phi}{\partial y}\,dy
$$

A differential equation:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

is **exact** if there is a potential function $\Phi$ such that:

$$
M=\frac{\partial\Phi}{\partial x}
\qquad\text{and}\qquad
N=\frac{\partial\Phi}{\partial y}
$$

The equation then says:

$$
d\Phi=0
$$

Integrating along a solution curve gives:

$$
\Phi(x,y)=C
$$

Thus $\Phi$ remains constant along that curve.

The key intuition:

> an exact differential equation packages two partial derivatives of one
> underlying function.

</details>

<details open>
<summary><strong>The Cross-Partial Test</strong></summary>

If:

$$
M=\Phi_x
\qquad\text{and}\qquad
N=\Phi_y
$$

then:

$$
M_y=\Phi_{xy}
\qquad\text{and}\qquad
N_x=\Phi_{yx}
$$

When the relevant derivatives are continuous, the mixed partial derivatives
agree:

$$
\Phi_{xy}=\Phi_{yx}
$$

This gives the test:

$$
\boxed{\frac{\partial M}{\partial y}
=
\frac{\partial N}{\partial x}}
$$

On a suitable simply connected domain, equality of these continuous
cross-partials is also sufficient for exactness.

The domain condition matters when the region contains holes or excluded
points. For introductory examples on rectangles or the whole plane, the test
usually behaves exactly as expected.

</details>

<details open>
<summary><strong>Example: An Exact Differential Form</strong></summary>

Consider:

$$
(2xy+3)\,dx+(x^2+e^y)\,dy=0
$$

Identify:

$$
M(x,y)=2xy+3
$$

and:

$$
N(x,y)=x^2+e^y
$$

Differentiate across the variables:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+3) \\
&=2x
\end{aligned}
$$

and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2+e^y) \\
&=2x
\end{aligned}
$$

The cross-partials agree, so the form is exact on the plane.

To construct a potential, begin with $\Phi_x=M=2xy+3$ and integrate
with respect to $x$:

$$
\Phi(x,y)=x^2y+3x+g(y)
$$

For $\Phi(x,y)=x^2y+3x+g(y)$, differentiate with respect to $y$:

$$
\Phi_y=x^2+g'(y)
$$

Match it to $N=x^2+e^y$:

$$
x^2+g'(y)=x^2+e^y
$$

Subtract $x^2$ from both sides and integrate with respect to $y$:

$$
g'(y)=e^y
\qquad\Longrightarrow\qquad
g(y)=e^y
$$

An additive constant can be absorbed into the final solution constant, so
one potential function is:

$$
\Phi(x,y)=x^2y+3x+e^y
$$

because:

$$
\Phi_x=2xy+3=M
$$

and:

$$
\Phi_y=x^2+e^y=N
$$

</details>

<details open>
<summary><strong>Example: A Nonexact Differential Form</strong></summary>

Consider:

$$
(y+\cos x)\,dx+(x^2+2y)\,dy=0
$$

For the proposed nonexact form
$(y+\cos x)\,dx+(x^2+2y)\,dy=0$, the coefficients are:

$$
M(x,y)=y+\cos x,
\qquad
N(x,y)=x^2+2y
$$

The cross-partials are:

$$
M_y=1
$$

and:

$$
N_x=2x
$$

They are not equal throughout a two-dimensional region. Therefore the given
differential form is not exact.

</details>

<details open>
<summary><strong>Exactness Depends On The Chosen Form</strong></summary>

Consider:

$$
2xy\,dx+(x^2+1)\,dy=0
$$

For the original form
$2xy\,dx+(x^2+1)\,dy=0$, exactness follows because:

$$
\frac{\partial}{\partial y}(2xy)=2x
$$

and:

$$
\frac{\partial}{\partial x}(x^2+1)=2x
$$

Multiply the exact form
$2xy\,dx+(x^2+1)\,dy=0$
by the nonzero function $e^y$:

$$
2xye^y\,dx+(x^2+1)e^y\,dy=0
$$

This has the same local solution curves, but its cross-partials are:

$$
\frac{\partial}{\partial y}(2xye^y)
=
2xe^y(1+y)
$$

and:

$$
\frac{\partial}{\partial x}\left((x^2+1)e^y\right)
=
2xe^y
$$

These are not generally equal.

Therefore the multiplied form is not exact.

What to remember:

> exactness describes the displayed pair $M$ and $N$; an equivalent
> differential equation may require a different form before exactness is
> visible.

</details>

<details open>
<summary><strong>How Separability And Exactness Are Related</strong></summary>

Suppose:

$$
y'=g(x)h(y)
$$

Starting from $y'=g(x)h(y)$, and where $h(y)\neq 0$, separating the
variables gives:

$$
-g(x)\,dx+\frac{1}{h(y)}\,dy=0
$$

In the separated form
$-g(x)\,dx+\frac{1}{h(y)}\,dy=0$, the first coefficient is:

$$
M(x,y)=-g(x)
$$

depends only on $x$, and:

$$
N(x,y)=\frac{1}{h(y)}
$$

depends only on $y$.

Because $M=-g(x)$ depends only on $x$ and $N=1/h(y)$ depends only on
$y$, their cross-partials are:

$$
M_y=0
\qquad\text{and}\qquad
N_x=0
$$

so this separated form is exact on any appropriate region where it is
defined.

However, dividing by $h(y)$ may exclude constant solutions corresponding to
zeros of $h$. Those must still be checked in the original equation.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

An exact equation has differential form:

$$
M\,dx+N\,dy=0
$$

where $M$ and $N$ are partial derivatives of one potential function.

The practical test is:

$$
M_y=N_x
$$

under suitable continuity and domain conditions. Exactness depends on the
chosen differential form.

</details>

---

## Block 8: A Mixed Classification Workshop

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to classify a mixed set of equations without being told which
test to use.

For each equation, we will expose the useful form and explain the decisive
feature.

</details>

<details open>
<summary><strong>Equation 1: Linear After Normalisation</strong></summary>

Consider:

$$
(1+x^2)y'+2xy=e^{-x}
$$

Starting from $(1+x^2)y'+2xy=e^{-x}$, divide every term by
$1+x^2$:

$$
y'+\frac{2x}{1+x^2}y
=
\frac{e^{-x}}{1+x^2}
$$

This is linear.

It is not ordinarily separable because the slope contains an additive
combination of a term involving $y$ and a forcing term involving $x$.

</details>

<details open>
<summary><strong>Equation 2: Separable</strong></summary>

Consider:

$$
y'=x(1-y^2)
$$

The right side is a product of a function of $x$ and a function of $y$.
Divide by $1-y^2$ and multiply by $dx$. Where $y\neq\pm1$, this gives:

$$
\frac{1}{1-y^2}\,dy=x\,dx
$$

where $y\neq\pm 1$.

The constant functions $y=1$ and $y=-1$ must be checked separately and both
satisfy the original equation.

</details>

<details open>
<summary><strong>Equation 3: First-Order Homogeneous</strong></summary>

Consider:

$$
y'=\frac{2x^2+xy-3y^2}{x^2+y^2}
$$

Every term in the numerator and denominator has degree $2$.

For the equation
$y'=(2x^2+xy-3y^2)/(x^2+y^2)$ and $x\neq 0$, divide the numerator
and denominator by $x^2$:

$$
y'
=
\frac{2+(y/x)-3(y/x)^2}{1+(y/x)^2}
$$

The slope depends only on $y/x$, so the equation is first-order homogeneous.

</details>

<details open>
<summary><strong>Equation 4: Bernoulli</strong></summary>

Consider $u=u(t)$:

$$
u'+\frac{3}{t}u=t^2u^5
$$

On an interval not containing $t=0$, the equation
$u'+\frac{3}{t}u=t^2u^5$ is Bernoulli with:

$$
p(t)=\frac{3}{t},
\qquad
q(t)=t^2,
\qquad
n=5
$$

The linearising substitution is:

$$
v=u^{1-5}=u^{-4}
$$

</details>

<details open>
<summary><strong>Equation 5: Exact</strong></summary>

Consider:

$$
(6xy-\sin x)\,dx+(3x^2+4y^3)\,dy=0
$$

Here:

$$
M=6xy-\sin x,
\qquad
N=3x^2+4y^3
$$

For
$M=6xy-\sin x$ and $N=3x^2+4y^3$, differentiate across the
variables:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(6xy-\sin x) \\
&=6x
\end{aligned}
$$

For the same coefficients, differentiating $N=3x^2+4y^3$ with respect
to $x$ gives:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(3x^2+4y^3) \\
&=6x.
\end{aligned}
$$

Therefore the differential form is exact.

For the exact form
$(6xy-\sin x)\,dx+(3x^2+4y^3)\,dy=0$, one matching potential is:

$$
\Phi(x,y)=3x^2y+\cos x+y^4
$$

Verify it locally:

$$
\Phi_x=6xy-\sin x=M
$$

For the same potential, differentiation with respect to $y$ gives:

$$
\Phi_y=3x^2+4y^3=N
$$

</details>

<details open>
<summary><strong>Equation 6: Linear And Separable</strong></summary>

Consider:

$$
y'=-4y
$$

The equation $y'=-4y$ is linear because adding $4y$ to both sides gives:

$$
y'+4y=0
$$

The equation $y'=-4y$ is separable because dividing by $y$ and
multiplying by $dx$ gives:

$$
\frac{1}{y}\,dy=-4\,dx
$$

where $y\neq 0$.

The missing constant solution $y=0$ satisfies the original equation.

It is not first-order homogeneous in the ratio sense: the slope $-4y$
changes when $y$ is scaled.

</details>

<details open>
<summary><strong>Equation 7: None Of The Main Special Forms</strong></summary>

Consider:

$$
y'+(x+y)y=x
$$

Expand:

$$
y'+xy+y^2=x
$$

It is not linear because of $y^2$.

It is not Bernoulli because the equation contains both a forcing term
independent of $y$ and the nonlinear power $y^2$ in addition to the linear
term.

It is not separable in its displayed slope form:

$$
y'=x-xy-y^2
$$

and it is not a function only of $y/x$.

Not every first-order equation belongs to one of the special classes in this
chapter.

</details>

<details open>
<summary><strong>A Compact Decision Table</strong></summary>

| Structure | Form to look for | Decisive test |
|---|---|---|
| Linear | $y'+p(x)y=q(x)$ | $y$ and $y'$ enter to the first power |
| Separable | $A(y)\,dy=B(x)\,dx$ | each side contains one variable only |
| First-order homogeneous | $y'=H(y/x)$ | slope is unchanged by common scaling |
| Bernoulli | $y'+p(x)y=q(x)y^n$ | one fixed nonlinear power of $y$ |
| Exact | $M\,dx+N\,dy=0$ | $M_y=N_x$ on a suitable domain |

The table is a recognition aid, not a substitute for algebra and domain
checks.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

A useful classification process is:

1. normalise or rearrange the equation
2. record every restriction introduced by division
3. test all plausible structures
4. keep every valid classification
5. identify the substitution or method suggested by each class

The goal is not to attach a label as quickly as possible. The goal is to find
a mathematically justified route forward.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Convert To Slope Form

Write the following equation in slope form and state the points at which the
conversion is valid:

$$
(s^2+4)z'-3sz=\ln(s+2)
$$

### Problem 2: Convert From Differential Form

Write the following equation in slope form wherever possible:

$$
(x+y^2)\,dx+(2xy+1)\,dy=0
$$

### Problem 3: Test Linearity

Determine which equations are linear in the displayed dependent variable.

$$
\begin{aligned}
\text{(a)}\quad &w'+t^2w=\tan t,\\
\text{(b)}\quad &w'+t^2w^2=\tan t,\\
\text{(c)}\quad &(1+t^2)w'+e^t w=0,\\
\text{(d)}\quad &(1+w^2)w'+tw=0.
\end{aligned}
$$

### Problem 4: Find Every Applicable Class

Classify:

$$
y'=t^2(5-y)
$$

as linear, separable, first-order homogeneous, Bernoulli, or none of these.
More than one answer may apply.

### Problem 5: Test First-Order Homogeneity

Determine whether:

$$
y'=\frac{3x^2+y^2}{xy}
$$

is first-order homogeneous. State the domain restrictions visible in the
displayed form.

### Problem 6: Identify A Bernoulli Substitution

For:

$$
v'-2v=(1+t^2)v^{1/3}
$$

identify $p(t)$, $q(t)$, and $n$, then state the linearising substitution.

### Problem 7: Test Exactness

Determine whether:

$$
(2xy+e^x)\,dx+(x^2+6y^2)\,dy=0
$$

is exact.

### Problem 8: Diagnose Nonexactness

Test:

$$
(y^2+x)\,dx+(x+\sin y)\,dy=0
$$

for exactness. Identify the two cross-partials.

### Problem 9: Protect Constant Solutions

Separate the nonconstant part of:

$$
y'=xy(y-3)
$$

and identify every constant solution that division could discard.

### Problem 10: Distinguish Linear From Separable

Classify each equation as linear, separable, both, or neither:

$$
\begin{aligned}
\text{(a)}\quad &y'=x+y,\\
\text{(b)}\quad &y'=e^x(1+y),\\
\text{(c)}\quad &y'=x^2y^3,\\
\text{(d)}\quad &y'+\sin(y)=x.
\end{aligned}
$$

### Problem 11: Use The Scaling Test

For:

$$
F(x,y)=\frac{x^3-2xy^2}{x^2y+y^3}
$$

evaluate $F(\lambda x,\lambda y)$ and decide whether the equation
$y'=F(x,y)$ is first-order homogeneous.

### Problem 12: Full Classification

For each equation, list every class from this chapter that is immediately
available after straightforward algebra.

$$
\begin{aligned}
\text{(a)}\quad &y'+2xy=0,\\
\text{(b)}\quad &y'=\frac{x+2y}{2x-y},\\
\text{(c)}\quad &y'+xy=e^x y^{-3},\\
\text{(d)}\quad &(4xy+1)\,dx+(2x^2+3y^2)\,dy=0.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Practice Answers</strong></summary>

### Answer 1

The logarithm requires:

$$
s+2>0
$$

so $s>-2$.

Since $s^2+4>0$, isolate $z'$:

$$
\begin{aligned}
(s^2+4)z'&=3sz+\ln(s+2),\\
z'&=\frac{3sz+\ln(s+2)}{s^2+4}.
\end{aligned}
$$

Thus:

$$
\boxed{z'=\frac{3sz+\ln(s+2)}{s^2+4}},
\qquad s>-2
$$

### Answer 2

Replace $dy$ by $y'\,dx$:

$$
(x+y^2)+(2xy+1)y'=0
$$

Subtract $x+y^2$ from both sides:

$$
(2xy+1)y'=-(x+y^2)
$$

Where $2xy+1\neq 0$, divide by $2xy+1$:

$$
\boxed{y'=-\frac{x+y^2}{2xy+1}}
$$

The slope formula
$y'=-(x+y^2)/(2xy+1)$ is valid where its divisor is nonzero:

$$
2xy+1\neq 0
$$

### Answer 3

Equation (a) is linear:

$$
w'+t^2w=\tan t
$$

Equation (b) is not linear because of $w^2$.

Equation (c) is linear. Divide by $1+t^2$:

$$
w'+\frac{e^t}{1+t^2}w=0
$$

Equation (d) is not linear because the coefficient of $w'$ depends on $w$.

### Answer 4

The equation is separable:

$$
\frac{1}{5-y}\,dy=t^2\,dt
$$

where $y\neq 5$.

It is also linear:

$$
y'+t^2y=5t^2
$$

The constant solution $y=5$ satisfies the original equation and was excluded
by the displayed separation.

It is not first-order homogeneous in the ratio sense. It does not require a
genuinely nonlinear Bernoulli classification.

### Answer 5

The displayed equation requires:

$$
x\neq 0
\qquad\text{and}\qquad
y\neq 0
$$

Rewrite the slope as:

$$
\begin{aligned}
\frac{3x^2+y^2}{xy}
&=
3\frac{x}{y}+\frac{y}{x}\\
&=
\frac{3}{y/x}+\frac{y}{x}.
\end{aligned}
$$

It depends only on $y/x$, so the equation is first-order homogeneous on each
appropriate domain region.

### Answer 6

The equation already has Bernoulli form:

$$
v'+p(t)v=q(t)v^n
$$

with:

$$
p(t)=-2,
\qquad
q(t)=1+t^2,
\qquad
n=\frac{1}{3}
$$

The substitution is:

$$
\boxed{u=v^{1-n}=v^{2/3}}
$$

A new symbol such as $u$ avoids confusing the transformed variable with the
original $v$.

### Answer 7

Here:

$$
M(x,y)=2xy+e^x,
\qquad
N(x,y)=x^2+6y^2
$$

The cross-partials are:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+e^x) \\
&=2x
\end{aligned}
$$

For the same coefficients, differentiating $N=x^2+6y^2$ with respect
to $x$ gives:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2+6y^2) \\
&=2x
\end{aligned}
$$

They agree, so the differential form is exact on the plane.

### Answer 8

Here:

$$
M(x,y)=y^2+x,
\qquad
N(x,y)=x+\sin y
$$

Then:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(y^2+x) \\
&=2y
\end{aligned}
$$

For the same proposed form, differentiating
$N=x+\sin y$ with respect to $x$ gives:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x+\sin y) \\
&=1
\end{aligned}
$$

They are not equal throughout a region, so the form is not exact.

### Answer 9

For nonconstant solutions away from $y=0$ and $y=3$, start from
$y'=xy(y-3)$ and replace $y'$ by $dy/dx$:

$$
\frac{dy}{dx}=xy(y-3)
$$

Divide by $y(y-3)$ and multiply by $dx$:

$$
\boxed{\frac{1}{y(y-3)}\,dy=x\,dx}
$$

The zeros of the factor divided out give two constant candidates:

$$
y=0
\qquad\text{and}\qquad
y=3
$$

Both make the original right side zero, so both are constant solutions.

For either constant, the left side is also $y'=0$. Thus the original equation
becomes $0=0$ in both cases.

### Answer 10

Equation (a):

$$
y'=x+y
$$

is linear but not ordinarily separable.

Equation (b):

$$
y'=e^x(1+y)
$$

The equation $y'=e^x(1+y)$ is separable because:

$$
\frac{1}{1+y}\,dy=e^x\,dx,
\qquad y\neq -1,
$$

and it is linear after expansion and rearrangement:

$$
\begin{aligned}
y'&=e^x+e^x y,\\
y'-e^x y&=e^x.
\end{aligned}
$$

The excluded constant $y=-1$ also satisfies the original equation.

Equation (c):

$$
y'=x^2y^3
$$

is separable but not linear because $y$ appears to the third power. Its
separable form is:

$$
y^{-3}\,dy=x^2\,dx,
\qquad y\neq 0.
$$

The same equation $y'=x^2y^3$ also fits the Bernoulli form:

$$
y'+0\cdot y=x^2y^3,
$$

so $p(x)=0$, $q(x)=x^2$, and $n=3$. The excluded value $y=0$ is a constant
solution of the original equation.

Equation (d):

$$
y'+\sin(y)=x
$$

is neither linear nor separable by the standard tests used here.

### Answer 11

Scale both arguments:

$$
\begin{aligned}
F(\lambda x,\lambda y)
&=
\frac{(\lambda x)^3-2(\lambda x)(\lambda y)^2}
{(\lambda x)^2(\lambda y)+(\lambda y)^3}\\
&=
\frac{\lambda^3(x^3-2xy^2)}
{\lambda^3(x^2y+y^3)}\\
&=
F(x,y).
\end{aligned}
$$

The original denominator is:

$$
x^2y+y^3=y(x^2+y^2)
$$

Over the real plane it is nonzero precisely when $y\neq 0$. Therefore
$y'=F(x,y)$ is first-order homogeneous on its domain $y\neq 0$.

### Answer 12

Equation (a):

$$
y'+2xy=0
$$

is already linear with $p(x)=2x$ and $q(x)=0$. It is separable because:

$$
\frac{1}{y}\,dy=-2x\,dx,
\qquad y\neq 0.
$$

The excluded value $y=0$ satisfies the original equation.

Equation (b):

$$
y'=\frac{x+2y}{2x-y}
$$

For Equation (b),
$y'=(x+2y)/(2x-y)$, and $x\neq 0$, divide the numerator and
denominator by $x$:

$$
y'
=
\frac{1+2(y/x)}{2-(y/x)}.
$$

The slope depends only on $y/x$, so the equation is first-order homogeneous
where the original quotient is defined. In particular, the ratio rewrite
requires $x\neq 0$, and the original denominator requires $2x-y\neq 0$.

Equation (c):

$$
y'+xy=e^x y^{-3}
$$

matches $y'+p(x)y=q(x)y^n$ with:

$$
p(x)=x,
\qquad
q(x)=e^x,
\qquad
n=-3.
$$

Therefore it is Bernoulli, with the linearising substitution
$v=y^{1-(-3)}=y^4$ on a domain where the required operations are valid.

Equation (d):

$$
(4xy+1)\,dx+(2x^2+3y^2)\,dy=0
$$

For Equation (d), let $M=4xy+1$ and $N=2x^2+3y^2$. The first
cross-partial is:

$$
\frac{\partial}{\partial y}(4xy+1)=4x
$$

For Equation (d), differentiating the second coefficient
$N=2x^2+3y^2$ with respect to $x$ gives:

$$
\frac{\partial}{\partial x}(2x^2+3y^2)=4x
$$

The cross-partials agree, so Equation (d) is exact on the plane.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

Classification is the bridge between reading an equation and choosing a
method.

The most reliable habits are:

- rewrite the equation into a revealing form
- distinguish the independent variable from the unknown function
- test more than one possible class
- justify each label from its defining pattern
- record domain restrictions before dividing
- check separately for solutions that cancellation could remove

The chapter's central lesson is:

> a useful classification does more than name an equation; it reveals the
> algebraic structure that makes a solution method possible.

</details>
