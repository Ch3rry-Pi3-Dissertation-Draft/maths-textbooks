# Solving Linear First-Order Equations

This chapter develops a complete method for first-order linear differential
equations and then uses that method to solve Bernoulli equations after a
change of unknown function.

The central difficulty is not integration alone. It is recognising a product
derivative that is not yet visible.

The main questions are:

- what makes a first-order equation linear?
- why must the equation be normalised before choosing an integrating factor?
- what is the integrating factor designed to create?
- how do initial conditions and interval restrictions enter the calculation?
- why does a Bernoulli substitution turn one controlled nonlinearity into a
  linear equation?

The chapter's organising idea is:

> an integrating factor is chosen to manufacture one product derivative from
> the two terms on the left side of a linear equation.

Every worked example is built independently and includes the intermediate
steps needed to see that product appear.

---

## Block 1: Recognising And Normalising The Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise a first-order linear equation even when it is not
initially written in standard form.

Before using an integrating factor, we must know exactly which functions play
the roles of $p(x)$ and $q(x)$.

> normalisation is not cosmetic; it determines the integrating factor.

</details>

<details open>
<summary><strong>The Linear Pattern</strong></summary>

A first-order equation is linear in the unknown function $y(x)$ when it can be
written as:

$$
\boxed{y'+p(x)y=q(x)}
$$

Here:

- $x$ is the independent variable
- $y=y(x)$ is the unknown function
- $y'=dy/dx$ is its derivative
- $p(x)$ is the coefficient multiplying $y$
- $q(x)$ is the forcing term

The word **linear** describes how the unknown function appears.

The permitted unknown-dependent terms are:

$$
y'
\qquad\text{and}\qquad
p(x)y.
$$

The following would break linearity:

$$
y^2,
\qquad
\sqrt{y},
\qquad
\sin y,
\qquad
yy'.
$$

The practical meaning is:

> the coefficients may be complicated functions of $x$, but $y$ and $y'$
> must appear only to the first power and must not multiply each other.

</details>

<details open>
<summary><strong>Why The Coefficient Of The Derivative Must Be One</strong></summary>

An equation may first appear as:

$$
a(x)y'+b(x)y=c(x).
$$

If $a(x)\neq 0$ on the interval under consideration, divide **every term** by
$a(x)$:

$$
\frac{a(x)y'}{a(x)}
+
\frac{b(x)y}{a(x)}
=
\frac{c(x)}{a(x)}.
$$

Simplifying gives:

$$
y'+\frac{b(x)}{a(x)}y=\frac{c(x)}{a(x)}.
$$

Therefore:

$$
p(x)=\frac{b(x)}{a(x)},
\qquad
q(x)=\frac{c(x)}{a(x)}.
$$

This is the normalised equation.

The division also creates an interval restriction: the method applies only
where $a(x)$ is nonzero.

</details>

<details open>
<summary><strong>Worked Recognition Example</strong></summary>

Consider:

$$
(1+s^2)v'+2sv=4s.
$$

The unknown function is $v=v(s)$, and the independent variable is $s$.

The coefficient of $v'$ is $1+s^2$. Because:

$$
1+s^2>0
$$

for every real $s$, we may divide the entire equation by $1+s^2$:

$$
\frac{(1+s^2)v'}{1+s^2}
+
\frac{2sv}{1+s^2}
=
\frac{4s}{1+s^2}.
$$

Simplify each term:

$$
\boxed{
v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}
}
$$

The equation now matches $v'+p(s)v=q(s)$ with:

$$
p(s)=\frac{2s}{1+s^2},
\qquad
q(s)=\frac{4s}{1+s^2}.
$$

What this tells us:

> the equation was linear before division, but normalisation exposes the two
> functions needed by the integrating-factor method.

</details>

<details open>
<summary><strong>Linear And Nonlinear Near Misses</strong></summary>

Consider the equations below, all written for $u=u(t)$.

The equation:

$$
u'+t^4u=\cos t
$$

is linear. The coefficient $t^4$ may be nonlinear as a function of $t$.

The equation:

$$
u'+t^4u^2=\cos t
$$

is not linear in $u$ because the unknown appears as $u^2$.

The equation:

$$
(2+u)u'+tu=1
$$

is not linear because the coefficient of $u'$ depends on the unknown $u$.

The equation:

$$
u'+tu=t^2u^3
$$

is not linear in $u$, but it has the controlled nonlinear structure of a
Bernoulli equation. We will return to that structure later.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

A first-order linear equation can be written as:

$$
y'+p(x)y=q(x).
$$

If the coefficient of $y'$ is not one, divide every term by that coefficient
before identifying $p$ and $q$.

Record where that division is valid.

Do not classify an equation from the complexity of $p(x)$ or $q(x)$. Linearity
is determined by the way the unknown function appears.

</details>

---

## Block 2: The Integrating Factor As A Reverse Product Rule

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the integrating factor rather than memorise it as an
unmotivated formula.

We will begin with the product we want and work backwards to the factor that
creates it.

</details>

<details open>
<summary><strong>The Product We Want To Manufacture</strong></summary>

Start with the normalised linear equation:

$$
y'+p(x)y=q(x).
$$

Suppose we multiply every term by a function $\mu(x)$:

$$
\mu y'+\mu p(x)y=\mu q(x).
$$

We want the left side to become the derivative of one product:

$$
(\mu y)'.
$$

Use the product rule:

$$
(\mu y)'=\mu y'+\mu' y.
$$

Compare the two left sides:

$$
\mu y'+\mu p(x)y
$$

The product-rule expression is:

$$
\mu y'+\mu' y.
$$

The first terms already match. The second terms will match if:

$$
\mu' y=\mu p(x)y.
$$

For the coefficient identity, we require:

$$
\boxed{\mu'=p(x)\mu}.
$$

This is the design condition for the integrating factor.

</details>

<details open>
<summary><strong>Solving The Design Condition</strong></summary>

The integrating factor must satisfy:

$$
\mu'=p(x)\mu.
$$

Choose a nonzero solution. Divide by $\mu$:

$$
\frac{\mu'}{\mu}=p(x).
$$

The left side is the derivative of $\ln|\mu|$:

$$
\frac{d}{dx}\ln|\mu|=p(x).
$$

Starting from $\mu'/\mu=p(x)$, integrate with respect to $x$:

$$
\ln|\mu|=\int p(x)\,dx.
$$

Exponentiating gives a nonzero choice:

$$
\boxed{
\mu(x)=e^{\int p(x)\,dx}
}.
$$

Any nonzero constant multiplier would also work. We choose the simplest
representative because multiplying the entire transformed equation by a
constant does not change its solution set.

The key intuition:

> the exponential is used because its derivative reproduces itself times the
> derivative of its exponent.

</details>

<details open>
<summary><strong>Watch The Product Appear</strong></summary>

Return to:

$$
y'+p(x)y=q(x).
$$

Choose:

$$
\mu=e^{\int p(x)\,dx}.
$$

Because this choice satisfies $\mu'=p\mu$, multiply every term by $\mu$:

$$
\mu y'+\mu p y=\mu q.
$$

In the transformed equation
$\mu y'+\mu p y=\mu q$, replace $\mu p$ by $\mu'$:

$$
\mu y'+\mu' y=\mu q.
$$

Apply the product rule in reverse:

$$
\boxed{(\mu y)'=\mu q}.
$$

Now integrate both sides with respect to $x$:

$$
\mu y=\int \mu(x)q(x)\,dx+C.
$$

Finally, divide by the nonzero integrating factor:

$$
\boxed{
y(x)=\frac{1}{\mu(x)}
\left(
\int \mu(x)q(x)\,dx+C
\right)
}.
$$

This formula summarises the method, but the reverse-product-rule step is the
reason the method works.

</details>

<details open>
<summary><strong>What The Factor Is Actually Doing</strong></summary>

Before multiplication, the two left-side terms are:

$$
y'
\qquad\text{and}\qquad
p(x)y.
$$

They do not usually form an immediately integrable expression.

After multiplication, they become:

$$
\mu y'
\qquad\text{and}\qquad
\mu' y.
$$

Those are precisely the two pieces produced when differentiating $\mu y$.

Another way to see it:

> the integrating factor changes the packaging of the equation, not its
> underlying solutions. Two separate terms become one derivative.

</details>

<details open>
<summary><strong>A Common Misunderstanding</strong></summary>

The integrating factor is not chosen because it makes every individual term
easy to integrate.

Its purpose is more specific:

$$
\mu y'+\mu p y
\quad\longrightarrow\quad
(\mu y)'.
$$

Trying to integrate $y'$ and $p(x)y$ separately treats $y$ as though it were
constant with respect to $x$. That is generally invalid because $y=y(x)$.

The product derivative is what makes the integration legitimate.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For:

$$
y'+p(x)y=q(x),
$$

choose:

$$
\mu=e^{\int p(x)\,dx}.
$$

This choice satisfies $\mu'=p\mu$, so:

$$
\mu y'+\mu p y=(\mu y)'.
$$

The integrating factor is therefore a reverse-product-rule device.

</details>

---

## Block 3: A Reliable Solution Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn the derivation into a dependable procedure while keeping
the reason for each step visible.

</details>

<details open>
<summary><strong>The Seven-Step Method</strong></summary>

For a proposed first-order linear equation:

### Step 1: Normalise

Put the equation into:

$$
y'+p(x)y=q(x).
$$

Record any interval restrictions introduced by division.

### Step 2: Identify $p$ and $q$

Write them explicitly. Do not identify $p$ before normalisation.

### Step 3: Construct the integrating factor

Use:

$$
\mu=e^{\int p(x)\,dx}.
$$

### Step 4: Multiply every term

Write:

$$
\mu y'+\mu p y=\mu q.
$$

### Step 5: Display the product derivative

Use $\mu'=p\mu$ to rewrite the equation as:

$$
(\mu y)'=\mu q.
$$

### Step 6: Integrate and isolate the unknown

Integrate both sides, include one arbitrary constant, and divide by $\mu$.

### Step 7: Apply conditions and verify

If an initial condition is supplied, use it to determine the constant. Then
substitute the result into the original differential equation and state the
interval of validity.

</details>

<details open>
<summary><strong>Complete Worked Example</strong></summary>

Solve:

$$
y'+3x^2y=6x^2.
$$

### Step 1: Read the normalised equation

The coefficient of $y'$ is already one. Therefore:

$$
p(x)=3x^2,
\qquad
q(x)=6x^2.
$$

Both functions are continuous for every real $x$.

### Step 2: Construct the integrating factor

Start from:

$$
\mu=e^{\int p(x)\,dx}.
$$

Substitute $p(x)=3x^2$:

$$
\begin{aligned}
\mu(x)
&=e^{\int 3x^2\,dx} \\
&=e^{x^3}.
\end{aligned}
$$

For $\mu=e^{x^3}$, check the design condition:

$$
\mu'(x)=3x^2e^{x^3}=p(x)\mu(x).
$$

### Step 3: Multiply every term

Multiply
$y'+3x^2y=6x^2$
by $e^{x^3}$:

$$
e^{x^3}y'+3x^2e^{x^3}y=6x^2e^{x^3}.
$$

### Step 4: Recognise the product derivative

Differentiate the product $e^{x^3}y$:

$$
\begin{aligned}
\frac{d}{dx}\left(e^{x^3}y\right)
&=e^{x^3}y'+\left(3x^2e^{x^3}\right)y \\
&=e^{x^3}y'+3x^2e^{x^3}y.
\end{aligned}
$$

This is exactly the transformed left side. Therefore:

$$
\left(e^{x^3}y\right)'=6x^2e^{x^3}.
$$

### Step 5: Integrate

Integrate both sides with respect to $x$:

$$
e^{x^3}y=\int 6x^2e^{x^3}\,dx+C.
$$

For the integral, let:

$$
w=x^3,
\qquad
dw=3x^2\,dx.
$$

Then $6x^2\,dx=2\,dw$, so:

$$
\begin{aligned}
\int 6x^2e^{x^3}\,dx
&=2\int e^w\,dw \\
&=2e^w \\
&=2e^{x^3}.
\end{aligned}
$$

After evaluating the integral, the product equation becomes:

$$
e^{x^3}y=2e^{x^3}+C.
$$

### Step 6: Isolate $y$

Divide by $e^{x^3}$, which is nonzero for every real $x$:

$$
\boxed{y=2+Ce^{-x^3}}.
$$

### Step 7: Verify

Start from the proposed family:

$$
y=2+Ce^{-x^3}.
$$

Differentiate:

$$
y'=-3Cx^2e^{-x^3}.
$$

Substitute $y$ and $y'$ into the original left side:

$$
\begin{aligned}
y'+3x^2y
&=-3Cx^2e^{-x^3}
+3x^2\left(2+Ce^{-x^3}\right) \\
&=-3Cx^2e^{-x^3}+6x^2+3Cx^2e^{-x^3} \\
&=6x^2.
\end{aligned}
$$

This equals the original right side, so the family is verified on the whole
real line.

The qualitative interpretation is also visible:

> every solution is a deviation from the constant level $y=2$, and that
> deviation is multiplied by $e^{-x^3}$.

</details>

<details open>
<summary><strong>Worked Example Starting Outside Standard Form</strong></summary>

Solve:

$$
(1+s^2)v'+2sv=4s.
$$

### Step 1: Normalise

Because $1+s^2>0$ for every real $s$, divide every term by $1+s^2$:

$$
v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}.
$$

Therefore:

$$
p(s)=\frac{2s}{1+s^2},
\qquad
q(s)=\frac{4s}{1+s^2}.
$$

### Step 2: Construct the integrating factor

Substitute $p(s)=2s/(1+s^2)$ into the integrating-factor formula:

$$
\mu(s)
=
e^{\int \frac{2s}{1+s^2}\,ds}.
$$

Let $w=1+s^2$, so $dw=2s\,ds$. Then:

$$
\int \frac{2s}{1+s^2}\,ds
=
\int \frac{1}{w}\,dw
=
\ln(1+s^2).
$$

Since $1+s^2$ is always positive:

$$
\begin{aligned}
\mu(s)
&=e^{\ln(1+s^2)} \\
&=1+s^2.
\end{aligned}
$$

### Step 3: Multiply the normalised equation

Multiply every term in
$v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}$
by $1+s^2$:

$$
(1+s^2)v'+2sv=4s.
$$

This happens to recover the original equation.

### Step 4: Recognise the product

Use the product rule:

$$
\begin{aligned}
\frac{d}{ds}\left((1+s^2)v\right)
&=(1+s^2)v'+2sv.
\end{aligned}
$$

Therefore the equation is:

$$
\left((1+s^2)v\right)'=4s.
$$

### Step 5: Integrate and solve

Integrate both sides with respect to $s$:

$$
(1+s^2)v=\int 4s\,ds+C.
$$

Evaluate the integral:

$$
(1+s^2)v=2s^2+C.
$$

Divide by $1+s^2$:

$$
\boxed{
v(s)=\frac{2s^2+C}{1+s^2}
}.
$$

The useful observation is:

> sometimes the original left side already is a product derivative; the
> integrating-factor calculation explains how to recognise that fact.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

The reliable sequence is:

1. normalise
2. identify $p$ and $q$
3. compute $\mu=e^{\int p\,dx}$
4. multiply every term
5. rewrite the left side as $(\mu y)'$
6. integrate and isolate $y$
7. apply conditions, verify, and state the interval

The product derivative should always be displayed. It is the central step,
not an optional abbreviation.

</details>

---

## Block 4: Initial Conditions And Valid Intervals

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to solve an initial-value problem without losing track of where
the coefficient functions and integrating factor are valid.

A formula and its interval belong together.

</details>

<details open>
<summary><strong>Complete Initial-Value Problem</strong></summary>

Solve:

$$
u'+\frac{2}{t+1}u=(t+1)^2,
\qquad
u(0)=\frac65.
$$

### Step 1: State the working interval

The coefficient $2/(t+1)$ is undefined at $t=-1$.

The initial point $t=0$ lies in:

$$
(-1,\infty).
$$

We therefore solve on that interval.

### Step 2: Identify the coefficient functions

The equation is already normalised, with:

$$
p(t)=\frac{2}{t+1},
\qquad
q(t)=(t+1)^2.
$$

### Step 3: Construct the integrating factor

Use the integrating-factor formula:

$$
\mu(t)=e^{\int p(t)\,dt}.
$$

Substitute $p(t)=2/(t+1)$:

$$
\begin{aligned}
\mu(t)
&=e^{\int \frac{2}{t+1}\,dt} \\
&=e^{2\ln(t+1)} \\
&=(t+1)^2.
\end{aligned}
$$

The step $\ln(t+1)$ is valid because $t+1>0$ on the selected interval.

### Step 4: Multiply every term

Multiply
$u'+\frac{2}{t+1}u=(t+1)^2$
by $(t+1)^2$:

$$
(t+1)^2u'+2(t+1)u=(t+1)^4.
$$

### Step 5: Display the product derivative

Differentiate $(t+1)^2u$:

$$
\begin{aligned}
\frac{d}{dt}\left((t+1)^2u\right)
&=(t+1)^2u'+2(t+1)u.
\end{aligned}
$$

Therefore:

$$
\left((t+1)^2u\right)'=(t+1)^4.
$$

### Step 6: Integrate

Integrate with respect to $t$:

$$
(t+1)^2u
=
\int (t+1)^4\,dt+C.
$$

Evaluate the integral:

$$
(t+1)^2u=\frac{(t+1)^5}{5}+C.
$$

Divide by $(t+1)^2$:

$$
u(t)=\frac{(t+1)^3}{5}+\frac{C}{(t+1)^2}.
$$

### Step 7: Apply the initial condition

Restate the solution family before substitution:

$$
u(t)=\frac{(t+1)^3}{5}+\frac{C}{(t+1)^2}.
$$

Set $t=0$ and $u(0)=6/5$:

$$
\frac65
=
\frac{(0+1)^3}{5}
+
\frac{C}{(0+1)^2}.
$$

Simplify:

$$
\frac65=\frac15+C.
$$

Subtract $1/5$ from both sides:

$$
C=1.
$$

The initial-value solution is:

$$
\boxed{
u(t)=\frac{(t+1)^3}{5}+\frac{1}{(t+1)^2},
\qquad t\in(-1,\infty)
}.
$$

</details>

<details open>
<summary><strong>Verify The Initial-Value Solution</strong></summary>

Use:

$$
u(t)=\frac{(t+1)^3}{5}+(t+1)^{-2}.
$$

Differentiate term by term:

$$
u'(t)=\frac35(t+1)^2-2(t+1)^{-3}.
$$

Substitute $u$ and $u'$ into the original left side:

$$
\begin{aligned}
u'+\frac{2}{t+1}u
&=\left(\frac35(t+1)^2-2(t+1)^{-3}\right) \\
&\quad
+\frac{2}{t+1}
\left(\frac{(t+1)^3}{5}+(t+1)^{-2}\right) \\
&=\frac35(t+1)^2-2(t+1)^{-3} \\
&\quad
+\frac25(t+1)^2+2(t+1)^{-3} \\
&=(t+1)^2.
\end{aligned}
$$

This matches the differential equation's right side.

Now check the condition:

$$
\begin{aligned}
u(0)
&=\frac{1^3}{5}+\frac{1}{1^2} \\
&=\frac15+1 \\
&=\frac65.
\end{aligned}
$$

Both parts of the initial-value problem are satisfied.

</details>

<details open>
<summary><strong>A Definite-Integral Version</strong></summary>

For:

$$
y'+p(x)y=q(x),
\qquad
y(x_0)=y_0,
$$

choose an integrating factor $\mu$ on an interval containing $x_0$.

For the initial-value problem, multiplication by $\mu$ gives:

$$
(\mu y)'=\mu q.
$$

Integrate directly from $x_0$ to $x$:

$$
\int_{x_0}^{x}(\mu(s)y(s))'\,ds
=
\int_{x_0}^{x}\mu(s)q(s)\,ds.
$$

Apply the fundamental theorem of calculus:

$$
\mu(x)y(x)-\mu(x_0)y(x_0)
=
\int_{x_0}^{x}\mu(s)q(s)\,ds.
$$

Substitute $y(x_0)=y_0$ and solve for $y(x)$:

$$
\boxed{
y(x)
=
\frac{
\mu(x_0)y_0+
\int_{x_0}^{x}\mu(s)q(s)\,ds
}{\mu(x)}
}.
$$

This form builds the initial condition into the solution and avoids a later
constant calculation.

</details>

<details open>
<summary><strong>Why The Singular Point Cannot Be Crossed</strong></summary>

In the worked initial-value problem, the coefficient:

$$
\frac{2}{t+1}
$$

is undefined at $t=-1$.

The formula for the solution also contains:

$$
\frac{1}{(t+1)^2}.
$$

The interval containing the initial point $t=0$ therefore stops at $t=-1$.

Even if an algebraic expression happens to make sense on both sides of a
singular point, one solution interval cannot pass through a point where the
differential equation itself is undefined.

What to remember:

> choose the interval from the differential equation and initial point, not
> merely from the final formula.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

For an initial-value problem:

- choose an interval on which $p$ and $q$ are continuous
- ensure that the interval contains the initial point
- determine the constant using the complete solution family
- verify both the equation and the initial condition
- report the solution together with its interval

The definite-integral formula is an alternative that incorporates the initial
condition from the start.

</details>

---

## Block 5: Understanding The Shape Of Linear Solutions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to interpret the structure of linear solutions rather than treat
the method as algebra alone.

</details>

<details open>
<summary><strong>The Homogeneous Part</strong></summary>

The associated homogeneous linear equation is:

$$
y'+p(x)y=0.
$$

Its integrating-factor form is:

$$
(\mu y)'=0.
$$

Integrate:

$$
\mu y=C.
$$

Divide $\mu y=C$ by the nonzero integrating factor $\mu$:

$$
\boxed{y_h=\frac{C}{\mu(x)}}.
$$

This term describes how differences between solutions evolve.

If $y_1$ and $y_2$ both solve:

$$
y'+p(x)y=q(x),
$$

subtract their equations:

$$
(y_1'-y_2')+p(x)(y_1-y_2)=0.
$$

Let $d=y_1-y_2$. Then:

$$
d'+p(x)d=0.
$$

Thus the difference between any two solutions is a homogeneous solution.

The practical meaning is:

> the forcing term determines one baseline response; the homogeneous term
> records the freedom left by the initial condition.

</details>

<details open>
<summary><strong>Constant Forcing And Equilibrium</strong></summary>

Consider:

$$
y'+ay=b,
$$

where $a>0$ and $b$ are constants.

An equilibrium is a constant solution, so set $y'=0$:

$$
ay=b.
$$

Divide by $a$:

$$
y_*=\frac{b}{a}.
$$

The complete solution has the form:

$$
\boxed{
y(x)=\frac{b}{a}+Ce^{-ax}
}.
$$

The first term is the equilibrium level. The second term is the initial
deviation from that level.

Because $a>0$:

$$
e^{-ax}\longrightarrow 0
\qquad\text{as}\qquad
x\longrightarrow\infty.
$$

Therefore every solution approaches $b/a$ as $x$ increases.

</details>

<details open>
<summary><strong>A Small Behaviour Example</strong></summary>

Solve and interpret:

$$
w'+5w=20,
\qquad
w(0)=1.
$$

The equilibrium satisfies:

$$
5w_*=20,
$$

so:

$$
w_*=4.
$$

The general constant-coefficient solution is:

$$
w=4+Ce^{-5t}.
$$

Apply $w(0)=1$:

$$
1=4+Ce^0.
$$

Since $e^0=1$:

$$
C=-3.
$$

Substitute $C=-3$ into $w=4+Ce^{-5t}$ to obtain:

$$
\boxed{w(t)=4-3e^{-5t}}.
$$

At $t=0$, the state begins below equilibrium. Its derivative is:

$$
w'(t)=15e^{-5t}>0.
$$

So the solution increases toward $4$ without overshooting it.

</details>

<details open>
<summary><strong>Verification As An Error Detector</strong></summary>

Verification is especially good at finding:

- a sign error in $\int p(x)\,dx$
- failure to multiply the forcing term by $\mu$
- an incorrect product derivative
- a missing factor when differentiating the final answer
- a wrongly determined initial constant

For a proposed solution $y(x)$:

1. differentiate it explicitly
2. compute $y'+p(x)y$
3. simplify until it equals $q(x)$
4. check any supplied initial condition
5. confirm the stated interval avoids singular coefficients

The check should use the original equation, not only the transformed one.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A linear solution consists of:

- one response to the forcing term
- one homogeneous term carrying the arbitrary constant

Differences between solutions satisfy the homogeneous equation.

For $y'+ay=b$ with $a>0$, solutions approach the equilibrium $b/a$.

Verification connects the symbolic solution back to the original rate rule.

</details>

---

## Block 6: Why The Method Also Creates An Exact Equation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect the linear integrating factor with the exact-equation
ideas from the previous chapter.

The two methods are not unrelated tricks. The linear integrating factor
creates an exact differential form automatically.

</details>

<details open>
<summary><strong>Convert The Linear Equation To Differential Form</strong></summary>

Start with:

$$
y'+p(x)y=q(x).
$$

Move the forcing term to the left:

$$
y'+p(x)y-q(x)=0.
$$

Starting from $y'+p(x)y-q(x)=0$, replace $y'$ by $dy/dx$:

$$
\frac{dy}{dx}+p(x)y-q(x)=0.
$$

Multiply every term by $dx$:

$$
\bigl(p(x)y-q(x)\bigr)\,dx+dy=0.
$$

This differential form has:

$$
M(x,y)=p(x)y-q(x),
\qquad
N(x,y)=1.
$$

Its cross-partials are:

$$
M_y=p(x),
\qquad
N_x=0.
$$

The form is not generally exact unless $p(x)=0$.

</details>

<details open>
<summary><strong>Multiply By The Linear Integrating Factor</strong></summary>

Choose the linear integrating factor:

$$
\mu(x)=e^{\int p(x)\,dx}.
$$

Multiply the differential form
$\bigl(p(x)y-q(x)\bigr)\,dx+dy=0$
by $\mu(x)$:

$$
\mu(x)\bigl(p(x)y-q(x)\bigr)\,dx+\mu(x)\,dy=0.
$$

The new coefficients are:

$$
\widetilde M(x,y)=\mu(x)p(x)y-\mu(x)q(x)
$$

and:

$$
\widetilde N(x,y)=\mu(x).
$$

Differentiate $\widetilde M$ with respect to $y$:

$$
\begin{aligned}
\widetilde M_y
&=\frac{\partial}{\partial y}
\left(\mu p y-\mu q\right) \\
&=\mu p.
\end{aligned}
$$

Differentiate $\widetilde N=\mu(x)$ with respect to $x$:

$$
\widetilde N_x=\mu'.
$$

The integrating factor was designed to satisfy:

$$
\mu'=p\mu.
$$

Therefore:

$$
\widetilde M_y=\widetilde N_x.
$$

The multiplied differential form is exact.

</details>

<details open>
<summary><strong>The Potential Is The Product</strong></summary>

For the multiplied equation, the potential can be written as:

$$
\Phi(x,y)=\mu(x)y-\int \mu(x)q(x)\,dx.
$$

Differentiate with respect to $y$:

$$
\Phi_y=\mu(x)=\widetilde N.
$$

Differentiate with respect to $x$, holding $y$ constant:

$$
\begin{aligned}
\Phi_x
&=\mu'(x)y-\mu(x)q(x) \\
&=\mu(x)p(x)y-\mu(x)q(x) \\
&=\widetilde M.
\end{aligned}
$$

Thus the exact-equation solution $\Phi=C$ is:

$$
\mu(x)y-\int \mu(x)q(x)\,dx=C.
$$

Rearrange:

$$
\mu(x)y=\int \mu(x)q(x)\,dx+C.
$$

This is exactly the equation obtained from the reverse-product-rule method.

The broader interpretation is:

> multiplying by the linear integrating factor simultaneously creates a
> product derivative and an exact differential form.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

The normalised linear equation becomes:

$$
\bigl(p(x)y-q(x)\bigr)\,dx+dy=0.
$$

After multiplication by $\mu=e^{\int p\,dx}$, its cross-partials agree
because $\mu'=p\mu$.

The product-rule and exactness explanations are two views of the same
transformation.

</details>

---

## Block 7: Bernoulli Equations Become Linear

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand why one particular nonlinear pattern can be
converted into a linear equation.

We will derive the substitution and track the restrictions it introduces.

</details>

<details open>
<summary><strong>The Bernoulli Pattern</strong></summary>

A Bernoulli equation has the form:

$$
\boxed{
y'+p(x)y=q(x)y^n
}
$$

where $n$ is a fixed real number.

The genuinely nonlinear cases have:

$$
n\neq 0
\qquad\text{and}\qquad
n\neq 1.
$$

If $n=0$, then $y^n=1$, so the equation is already linear:

$$
y'+p(x)y=q(x).
$$

If $n=1$, then the right side is another multiple of $y$:

$$
y'+\bigl(p(x)-q(x)\bigr)y=0.
$$

For $n\neq0,1$, the term $y^n$ makes the original equation nonlinear.

</details>

<details open>
<summary><strong>Why The Power Substitution Is Chosen</strong></summary>

Start with:

$$
y'+p(x)y=q(x)y^n.
$$

Where the required powers are defined and $y\neq 0$, multiply every term by
$y^{-n}$:

$$
y^{-n}y'+p(x)y^{1-n}=q(x).
$$

The second unknown-dependent expression is now $y^{1-n}$.

That suggests defining a new unknown:

$$
\boxed{v=y^{1-n}}.
$$

For $v=y^{1-n}$, differentiate using the chain rule:

$$
v'=(1-n)y^{-n}y'.
$$

Solve this derivative relation for $y^{-n}y'$ by dividing by $1-n$:

$$
y^{-n}y'=\frac{v'}{1-n}.
$$

Also, directly from the substitution:

$$
y^{1-n}=v.
$$

Substitute both expressions into
$y^{-n}y'+p(x)y^{1-n}=q(x)$:

$$
\frac{v'}{1-n}+p(x)v=q(x).
$$

Multiply every term by $1-n$:

$$
\boxed{
v'+(1-n)p(x)v=(1-n)q(x)
}.
$$

This is linear in the new unknown $v(x)$.

</details>

<details open>
<summary><strong>What The Substitution Achieves</strong></summary>

The substitution:

$$
v=y^{1-n}
$$

is not a guess chosen from nowhere.

Multiplication by $y^{-n}$ creates the two expressions:

$$
y^{-n}y'
\qquad\text{and}\qquad
y^{1-n}.
$$

Those are, up to the constant factor $1-n$, the derivative and value of the
same new function $v$.

In everyday terms:

> the power is chosen so that both nonlinear-looking pieces can be renamed
> using one new unknown and its derivative.

</details>

<details open>
<summary><strong>A Bernoulli Workflow</strong></summary>

For:

$$
y'+p(x)y=q(x)y^n,
$$

use the following sequence.

1. Confirm that $n$ is fixed and that the equation has only the Bernoulli
   nonlinear power.
2. Check whether $y=0$ is a solution before dividing by a power of $y$.
3. Define $v=y^{1-n}$.
4. Differentiate the substitution explicitly.
5. Transform the equation into:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

6. Solve the linear equation for $v$ with an integrating factor.
7. Replace $v$ by $y^{1-n}$ and solve for $y$ where appropriate.
8. Restore excluded solutions and state branch or domain restrictions.
9. Verify in the original Bernoulli equation.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

A Bernoulli equation:

$$
y'+p(x)y=q(x)y^n
$$

becomes linear under:

$$
v=y^{1-n}.
$$

The transformed equation is:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

The substitution may exclude $y=0$ or introduce power restrictions, so those
cases must be handled separately.

</details>

---

## Block 8: A Complete Bernoulli Example

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to carry one Bernoulli equation through every stage: protecting
an excluded solution, transforming the unknown, solving the linear equation,
returning to the original variable, and verifying the result.

</details>

<details open>
<summary><strong>The Problem And The Excluded Solution</strong></summary>

Solve:

$$
y'+t^2y=3t^2y^2.
$$

The equation $y'+t^2y=3t^2y^2$ matches the Bernoulli pattern with:

$$
p(t)=t^2,
\qquad
q(t)=3t^2,
\qquad
n=2.
$$

Before dividing by a power of $y$, test $y=0$ in the original equation.

If $y=0$, then $y'=0$, so:

$$
0+t^2(0)=3t^2(0)^2.
$$

Both sides equal zero. Therefore:

$$
\boxed{y(t)=0}
$$

is a solution that must be retained separately.

</details>

<details open>
<summary><strong>Step 1: Transform The Nonzero Branches</strong></summary>

For $n=2$, the Bernoulli substitution is:

$$
v=y^{1-n}=y^{-1}.
$$

Differentiate $v=y^{-1}$:

$$
v'=-y^{-2}y'.
$$

For nonzero $y$, multiply the original equation
$y'+t^2y=3t^2y^2$
by $y^{-2}$:

$$
y^{-2}y'+t^2y^{-1}=3t^2.
$$

In
$y^{-2}y'+t^2y^{-1}=3t^2$, use:

$$
y^{-2}y'=-v'
\qquad\text{and}\qquad
y^{-1}=v.
$$

Substitute these expressions:

$$
-v'+t^2v=3t^2.
$$

Multiply every term by $-1$:

$$
\boxed{v'-t^2v=-3t^2}.
$$

The nonlinear equation in $y$ has become a linear equation in $v$.

</details>

<details open>
<summary><strong>Step 2: Solve The Linear Equation In $v$</strong></summary>

Start from the transformed equation:

$$
v'-t^2v=-3t^2.
$$

Its coefficient functions are:

$$
P(t)=-t^2,
\qquad
Q(t)=-3t^2.
$$

The capital letters distinguish the transformed coefficients from those in
the original equation.

Construct the integrating factor:

$$
\begin{aligned}
\mu(t)
&=e^{\int -t^2\,dt} \\
&=e^{-t^3/3}.
\end{aligned}
$$

Multiply every term in $v'-t^2v=-3t^2$ by $e^{-t^3/3}$:

$$
e^{-t^3/3}v'
-t^2e^{-t^3/3}v
=
-3t^2e^{-t^3/3}.
$$

Differentiate the integrating factor:

$$
\frac{d}{dt}e^{-t^3/3}
=
-t^2e^{-t^3/3}.
$$

Therefore the transformed left side is the product derivative:

$$
\left(e^{-t^3/3}v\right)'
=
-3t^2e^{-t^3/3}.
$$

Integrate both sides:

$$
e^{-t^3/3}v
=
\int -3t^2e^{-t^3/3}\,dt+C.
$$

For the integral, let:

$$
w=-\frac13t^3,
\qquad
dw=-t^2\,dt.
$$

Then $-3t^2\,dt=3\,dw$, so:

$$
\begin{aligned}
\int -3t^2e^{-t^3/3}\,dt
&=3\int e^w\,dw \\
&=3e^w \\
&=3e^{-t^3/3}.
\end{aligned}
$$

Thus:

$$
e^{-t^3/3}v
=
3e^{-t^3/3}+C.
$$

Starting from
$e^{-t^3/3}v=3e^{-t^3/3}+C$, multiply every term by $e^{t^3/3}$:

$$
\boxed{
v=3+Ce^{t^3/3}
}.
$$

</details>

<details open>
<summary><strong>Step 3: Return To $y$</strong></summary>

The substitution was:

$$
v=y^{-1}=\frac{1}{y}.
$$

The transformed solution is:

$$
v=3+Ce^{t^3/3}.
$$

Set these expressions equal:

$$
\frac{1}{y}
=
3+Ce^{t^3/3}.
$$

Take the reciprocal where the denominator is nonzero:

$$
\boxed{
y(t)=\frac{1}{3+Ce^{t^3/3}}
}.
$$

These are the nonzero solution branches. The previously protected solution:

$$
y(t)=0
$$

must be listed separately.

For a fixed value of $C$, the solution
$y(t)=1/(3+Ce^{t^3/3})$
is valid only on intervals where:

$$
3+Ce^{t^3/3}\neq 0.
$$

</details>

<details open>
<summary><strong>Step 4: Apply An Initial Condition</strong></summary>

Now impose:

$$
y(0)=\frac14.
$$

Restate the nonzero family:

$$
y(t)=\frac{1}{3+Ce^{t^3/3}}.
$$

Set $t=0$ and $y(0)=1/4$:

$$
\frac14
=
\frac{1}{3+Ce^0}.
$$

Since $e^0=1$:

$$
\frac14
=
\frac{1}{3+C}.
$$

Take reciprocals of both nonzero sides:

$$
4=3+C.
$$

Starting from $4=3+C$, subtract $3$ from both sides:

$$
C=1.
$$

Therefore the initial-value solution is:

$$
\boxed{
y(t)=\frac{1}{3+e^{t^3/3}}
}.
$$

Its denominator is positive for every real $t$, so this solution is defined
on $(-\infty,\infty)$.

</details>

<details open>
<summary><strong>Step 5: Verify The Bernoulli Solution</strong></summary>

Let:

$$
D(t)=3+e^{t^3/3}.
$$

Then the initial-value solution is:

$$
y=D^{-1}.
$$

Differentiate $D$:

$$
D'=t^2e^{t^3/3}.
$$

Differentiate $y=D^{-1}$ using the chain rule:

$$
y'=-D^{-2}D'
=
-\frac{t^2e^{t^3/3}}{D^2}.
$$

With
$D=3+e^{t^3/3}$,
$y=1/D$, and
$y'=-t^2e^{t^3/3}/D^2$,
substitute into the original left side:

$$
\begin{aligned}
y'+t^2y
&=-\frac{t^2e^{t^3/3}}{D^2}+\frac{t^2}{D} \\
&=\frac{-t^2e^{t^3/3}+t^2D}{D^2} \\
&=\frac{t^2\left(D-e^{t^3/3}\right)}{D^2}.
\end{aligned}
$$

Since $D=3+e^{t^3/3}$:

$$
D-e^{t^3/3}=3.
$$

Therefore:

$$
y'+t^2y
=
\frac{t^2(3)}{D^2}
=
\frac{3t^2}{D^2}.
$$

The original right side is:

$$
3t^2y^2
=
3t^2\left(\frac1D\right)^2
=
\frac{3t^2}{D^2}.
$$

Both sides agree, so the differential equation is satisfied. Also:

$$
y(0)=\frac{1}{3+1}=\frac14.
$$

The initial condition is satisfied as well.

</details>

<details open>
<summary><strong>Fractional Powers Need Extra Care</strong></summary>

If $1-n$ is fractional, the substitution:

$$
v=y^{1-n}
$$

may require a sign restriction or a branch choice.

For example, if $v=y^{1/2}$, a real-valued treatment requires $y\geq0$.

When returning from $v$ to $y$, an operation such as squaring may introduce
candidate branches that must be checked in the original equation.

The safe routine is:

- state where the substitution is real and differentiable
- record values excluded by division
- solve for the transformed variable
- return to $y$ with explicit branch conditions
- verify each retained branch

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

For the example $y'+t^2y=3t^2y^2$:

- $y=0$ is a separate solution
- $v=y^{-1}$ transforms the nonzero branches
- the transformed equation is $v'-t^2v=-3t^2$
- an integrating factor solves the linear equation in $v$
- returning to $y$ gives

$$
y=\frac{1}{3+Ce^{t^3/3}}
$$

where the denominator is nonzero.

The transformation is not complete until excluded solutions and domains have
been restored.

</details>

---

## Block 9: Method Selection And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide when the linear method is appropriate and to recognise
the errors most likely to derail it.

</details>

<details open>
<summary><strong>A Method-Selection Checklist</strong></summary>

Given a first-order equation, ask:

1. Can it be normalised as $y'+p(x)y=q(x)$?
2. If not linear, does it fit $y'+p(x)y=q(x)y^n$ with one fixed power?
3. Is it also separable, making a shorter route available?
4. Is it already exact in differential form?
5. Does division remove a possible constant solution?
6. On which intervals are all coefficients and substitutions valid?

More than one method may apply.

For example:

$$
y'=-2xy
$$

is both linear and separable.

By contrast:

$$
y'+xy=x^2
$$

is linear but not ordinarily separable because the slope contains an additive
forcing term.

</details>

<details open>
<summary><strong>Common Mistake: Choosing $p$ Before Normalising</strong></summary>

Consider:

$$
x y'+(x+1)y=e^x,
\qquad x>0.
$$

It is incorrect to use $p(x)=x+1$ because the coefficient of $y'$ is not one.

Divide every term by $x$:

$$
y'+\left(1+\frac1x\right)y=\frac{e^x}{x}.
$$

Now:

$$
p(x)=1+\frac1x.
$$

Therefore:

$$
\begin{aligned}
\mu(x)
&=e^{\int (1+1/x)\,dx} \\
&=e^{x+\ln x} \\
&=xe^x,
\end{aligned}
$$

where $x>0$.

</details>

<details open>
<summary><strong>Common Mistake: Multiplying Only The Left Side</strong></summary>

Starting from:

$$
y'+p(x)y=q(x),
$$

For $y'+p(x)y=q(x)$, multiplying every term by $\mu$ produces:

$$
\mu y'+\mu p y=\mu q.
$$

Writing:

$$
\mu y'+\mu p y=q
$$

changes the equation unless $\mu=1$.

The forcing term must be multiplied along with every other term.

</details>

<details open>
<summary><strong>Common Mistake: Losing The Product Rule</strong></summary>

The transformed equation:

$$
\mu y'+\mu' y=\mu q
$$

must be rewritten as:

$$
(\mu y)'=\mu q.
$$

It is generally incorrect to integrate the two left-side terms independently
as though $y$ were constant.

Always display the product derivative before integrating.

</details>

<details open>
<summary><strong>Common Mistake: Keeping A Constant Inside $\mu$</strong></summary>

Suppose:

$$
\int p(x)\,dx=P(x)+K.
$$

From $\int p(x)\,dx=P(x)+K$, exponentiation gives:

$$
e^{P(x)+K}=e^K e^{P(x)}.
$$

The factor $e^K$ is a nonzero constant multiplier. It does not provide a new
integrating factor in any meaningful sense, so we choose:

$$
\mu=e^{P(x)}.
$$

The arbitrary solution constant appears later, after integrating the product
equation.

</details>

<details open>
<summary><strong>Common Mistake: Forgetting The Bernoulli Zero Solution</strong></summary>

Transforming a Bernoulli equation often requires multiplication by $y^{-n}$.

That operation is invalid at $y=0$.

Before dividing, substitute $y=0$ into the original equation. If both sides
agree, record it as a separate solution.

Do not expect the transformed family to recover a branch that the
transformation excluded at its first step.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

Before calculating:

- normalise
- identify the unknown and independent variable
- choose every applicable classification
- record restrictions

During the calculation:

- multiply every term
- show the product derivative
- protect excluded solutions

After calculating:

- return to the original unknown
- apply conditions locally
- verify in the original equation
- state the interval

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Normalise And Identify

For $x\neq-2$, put the equation into standard linear form and identify
$p(x)$ and $q(x)$:

$$
(x+2)y'-3y=x.
$$

### Problem 2: Construct An Integrating Factor

Find an integrating factor for:

$$
y'+4x^3y=8x^3.
$$

Check that your factor satisfies $\mu'=p\mu$.

### Problem 3: Solve A Linear Equation

Solve:

$$
y'+4x^3y=8x^3.
$$

### Problem 4: Reveal An Existing Product

Solve:

$$
(1+x^2)y'+2xy=6x.
$$

### Problem 5: Solve An Initial-Value Problem

On $x>-1$, solve:

$$
y'+\frac{2}{x+1}y=3(x+1),
\qquad
y(0)=\frac74.
$$

### Problem 6: Verify A Proposed Solution

Verify directly that:

$$
y=2+5e^{-x^4}
$$

solves:

$$
y'+4x^3y=8x^3.
$$

### Problem 7: Interpret A Constant-Coefficient Solution

Solve and describe the long-term behaviour of:

$$
z'+5z=20,
\qquad
z(0)=1.
$$

### Problem 8: Transform A Bernoulli Equation

On $x>0$, transform the equation below into a linear equation without solving
the transformed equation:

$$
y'-\frac{2}{x}y=x^2y^4.
$$

State the substitution and identify any solution excluded by it.

### Problem 9: Solve A Bernoulli Equation

Find all solution families of:

$$
y'+t^2y=3t^2y^2.
$$

### Problem 10: Diagnose An Incorrect Integrating Factor

For $x>0$, a student claims that an integrating factor for:

$$
x y'+(x+1)y=e^x
$$

is:

$$
e^{x^2/2+x}.
$$

Explain the error and find the correct integrating factor.

### Problem 11: Connect Linearity And Exactness

For:

$$
y'+2xy=\cos x,
$$

find the linear integrating factor. Convert the multiplied equation to
differential form and verify that it is exact.

</details>

<details open>
<summary><strong>Practice Answers</strong></summary>

### Answer 1

Start from:

$$
(x+2)y'-3y=x.
$$

For $x\neq-2$, divide every term by $x+2$:

$$
\frac{(x+2)y'}{x+2}
-
\frac{3y}{x+2}
=
\frac{x}{x+2}.
$$

Therefore the standard form is:

$$
\boxed{
y'-\frac{3}{x+2}y=\frac{x}{x+2}
}.
$$

Comparing with $y'+p(x)y=q(x)$ gives:

$$
p(x)=-\frac{3}{x+2},
\qquad
q(x)=\frac{x}{x+2}.
$$

The equation must be considered on an interval lying entirely on one side of
$x=-2$.

### Answer 2

For:

$$
y'+4x^3y=8x^3,
$$

the coefficient is:

$$
p(x)=4x^3.
$$

For $p(x)=4x^3$, substitute into the integrating-factor formula:

$$
\begin{aligned}
\mu(x)
&=e^{\int 4x^3\,dx} \\
&=e^{x^4}.
\end{aligned}
$$

Differentiate the factor:

$$
\mu'(x)=4x^3e^{x^4}.
$$

Also:

$$
p(x)\mu(x)=4x^3e^{x^4}.
$$

Thus $\mu'=p\mu$, as required.

### Answer 3

Start from:

$$
y'+4x^3y=8x^3.
$$

From $p(x)=4x^3$, the integrating factor is:

$$
\mu=e^{\int4x^3\,dx}=e^{x^4}.
$$

Multiply every term by $e^{x^4}$:

$$
e^{x^4}y'+4x^3e^{x^4}y=8x^3e^{x^4}.
$$

The derivative of $e^{x^4}$ is $4x^3e^{x^4}$, so the left side is:

$$
\left(e^{x^4}y\right)'=8x^3e^{x^4}.
$$

Starting from
$(e^{x^4}y)'=8x^3e^{x^4}$, integrate with respect to $x$:

$$
e^{x^4}y=\int8x^3e^{x^4}\,dx+C.
$$

Let $w=x^4$, so $dw=4x^3\,dx$. Then:

$$
\begin{aligned}
\int8x^3e^{x^4}\,dx
&=2\int e^w\,dw \\
&=2e^{x^4}.
\end{aligned}
$$

Therefore:

$$
e^{x^4}y=2e^{x^4}+C.
$$

Divide by $e^{x^4}$:

$$
\boxed{y=2+Ce^{-x^4}}.
$$

### Answer 4

Start from:

$$
(1+x^2)y'+2xy=6x.
$$

Differentiate the product $(1+x^2)y$:

$$
\begin{aligned}
\frac{d}{dx}\left((1+x^2)y\right)
&=(1+x^2)y'+2xy.
\end{aligned}
$$

Therefore the differential equation can be rewritten as:

$$
\left((1+x^2)y\right)'=6x.
$$

Starting from
$\left((1+x^2)y\right)'=6x$, integrate both sides:

$$
(1+x^2)y=3x^2+C.
$$

Since $1+x^2>0$, divide to obtain:

$$
\boxed{
y=\frac{3x^2+C}{1+x^2}
}.
$$

### Answer 5

On $x>-1$, consider:

$$
y'+\frac{2}{x+1}y=3(x+1),
\qquad
y(0)=\frac74.
$$

The integrating factor is:

$$
\begin{aligned}
\mu(x)
&=e^{\int \frac{2}{x+1}\,dx} \\
&=e^{2\ln(x+1)} \\
&=(x+1)^2.
\end{aligned}
$$

Multiply every term by $(x+1)^2$:

$$
(x+1)^2y'+2(x+1)y=3(x+1)^3.
$$

The left side is the derivative of $(x+1)^2y$:

$$
\left((x+1)^2y\right)'=3(x+1)^3.
$$

Starting from
$\left((x+1)^2y\right)'=3(x+1)^3$, integrate with respect to $x$:

$$
(x+1)^2y
=
\frac34(x+1)^4+C.
$$

Divide by $(x+1)^2$:

$$
y=\frac34(x+1)^2+\frac{C}{(x+1)^2}.
$$

Apply $x=0$ and $y(0)=7/4$:

$$
\frac74=\frac34+C.
$$

Subtract $3/4$:

$$
C=1.
$$

Therefore:

$$
\boxed{
y(x)=\frac34(x+1)^2+\frac{1}{(x+1)^2},
\qquad x\in(-1,\infty)
}.
$$

### Answer 6

Use the proposed function:

$$
y=2+5e^{-x^4}.
$$

Differentiate:

$$
y'=-20x^3e^{-x^4}.
$$

Substitute into the left side of
$y'+4x^3y=8x^3$:

$$
\begin{aligned}
y'+4x^3y
&=-20x^3e^{-x^4}
+4x^3\left(2+5e^{-x^4}\right) \\
&=-20x^3e^{-x^4}+8x^3+20x^3e^{-x^4} \\
&=8x^3.
\end{aligned}
$$

This equals the right side, so the proposed function is a solution for every
real $x$.

### Answer 7

For:

$$
z'+5z=20,
$$

the equilibrium is found by setting $z'=0$:

$$
5z_*=20,
\qquad
z_*=4.
$$

The solution family is:

$$
z=4+Ce^{-5t}.
$$

Apply $z(0)=1$:

$$
1=4+C,
\qquad
C=-3.
$$

Therefore:

$$
\boxed{z(t)=4-3e^{-5t}}.
$$

Because $e^{-5t}\to0$ as $t\to\infty$:

$$
z(t)\longrightarrow4.
$$

Also $z'=15e^{-5t}>0$, so the solution approaches $4$ from below.

### Answer 8

On $x>0$, start from:

$$
y'-\frac{2}{x}y=x^2y^4.
$$

This is Bernoulli with:

$$
p(x)=-\frac2x,
\qquad
q(x)=x^2,
\qquad
n=4.
$$

Before dividing by a power of $y$, check $y=0$. Substitution into the
original equation gives $0=0$, so $y=0$ is a solution to retain separately.

For nonzero branches, use:

$$
v=y^{1-n}=y^{-3}.
$$

The general Bernoulli transformation is:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

Substitute $1-n=-3$, $p(x)=-2/x$, and $q(x)=x^2$:

$$
v'+(-3)\left(-\frac2x\right)v=(-3)x^2.
$$

Simplify
$v'+(-3)(-2/x)v=(-3)x^2$:

$$
\boxed{
v'+\frac6xv=-3x^2
}.
$$

This is linear in $v$. The problem asked only for the transformation, so no
further solution is required.

### Answer 9

First test $y=0$ in:

$$
y'+t^2y=3t^2y^2.
$$

Both sides are zero, so:

$$
y=0
$$

is one solution.

For nonzero solutions, let:

$$
v=y^{-1}.
$$

Differentiate the substitution:

$$
v'=-y^{-2}y'.
$$

Multiply the original equation by $y^{-2}$:

$$
y^{-2}y'+t^2y^{-1}=3t^2.
$$

Substitute $y^{-2}y'=-v'$ and $y^{-1}=v$:

$$
-v'+t^2v=3t^2.
$$

Multiply every term by $-1$:

$$
v'-t^2v=-3t^2.
$$

Its integrating factor is:

$$
\mu=e^{-t^3/3}.
$$

Multiplication produces:

$$
\left(e^{-t^3/3}v\right)'
=
-3t^2e^{-t^3/3}.
$$

Integrating gives:

$$
e^{-t^3/3}v
=
3e^{-t^3/3}+C.
$$

Multiply by $e^{t^3/3}$:

$$
v=3+Ce^{t^3/3}.
$$

Return to $v=1/y$:

$$
\boxed{
y=\frac{1}{3+Ce^{t^3/3}}
}
$$

The nonzero family
$y=1/(3+Ce^{t^3/3})$
is valid on intervals where its denominator is nonzero. It must be listed
together with the separate solution:

$$
\boxed{y=0}.
$$

### Answer 10

The equation is:

$$
x y'+(x+1)y=e^x,
\qquad x>0.
$$

The student's factor was calculated before normalising the equation.

Divide every term by $x$:

$$
y'+\left(1+\frac1x\right)y=\frac{e^x}{x}.
$$

The correct coefficient is:

$$
p(x)=1+\frac1x.
$$

Therefore:

$$
\begin{aligned}
\mu(x)
&=e^{\int(1+1/x)\,dx} \\
&=e^{x+\ln x} \\
&=xe^x,
\end{aligned}
$$

where $x>0$.

For the normalised equation
$y'+(1+1/x)y=e^x/x$, the correct integrating factor is:

$$
\boxed{\mu(x)=xe^x}.
$$

### Answer 11

Start from:

$$
y'+2xy=\cos x.
$$

Here $p(x)=2x$, so:

$$
\mu(x)=e^{\int2x\,dx}=e^{x^2}.
$$

Multiply every term by $e^{x^2}$:

$$
e^{x^2}y'+2xe^{x^2}y=e^{x^2}\cos x.
$$

Move the right side to the left and replace $y'$ by $dy/dx$:

$$
e^{x^2}\frac{dy}{dx}
+2xe^{x^2}y
-e^{x^2}\cos x
=0.
$$

Multiply by $dx$:

$$
\left(2xe^{x^2}y-e^{x^2}\cos x\right)\,dx
+e^{x^2}\,dy
=0.
$$

Identify:

$$
M(x,y)=2xe^{x^2}y-e^{x^2}\cos x,
\qquad
N(x,y)=e^{x^2}.
$$

For
$M=2xe^{x^2}y-e^{x^2}\cos x$, differentiate with respect to $y$:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}
\left(2xe^{x^2}y-e^{x^2}\cos x\right) \\
&=2xe^{x^2}.
\end{aligned}
$$

Differentiate $N=e^{x^2}$ with respect to $x$:

$$
\begin{aligned}
N_x
&=\frac{d}{dx}e^{x^2} \\
&=2xe^{x^2}.
\end{aligned}
$$

Since $M_y=N_x$, the multiplied differential form is exact on the plane.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

A first-order linear equation is solved by deliberately creating a product
derivative.

The essential chain is:

$$
\begin{aligned}
y'+p(x)y=q(x)
&\quad\Longrightarrow\quad
\mu=e^{\int p(x)\,dx} \\
&\quad\Longrightarrow\quad
(\mu y)'=\mu q \\
&\quad\Longrightarrow\quad
\mu y=\int\mu q\,dx+C.
\end{aligned}
$$

For a Bernoulli equation, the power substitution first creates a new linear
unknown, after which the same integrating-factor method applies.

The chapter's final lesson is:

> do not treat the integrating factor as a formula to remember in isolation;
> treat it as the function that makes the product rule fit the equation.

</details>
