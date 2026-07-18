```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 6}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Linear First-Order Equations}
```
# Chapter 6 - Linear First-Order ODEs

This chapter develops a complete method for first-order linear differential
equations and then uses that method to solve Bernoulli equations after a
change of unknown function.

The central difficulty is not integration alone. It is recognising a product
derivative that is not yet visible.

The main questions are:

-   what makes a first-order equation linear?
-   why must the equation be normalised before choosing an integrating factor?
-   what is the integrating factor designed to create?
-   how do initial conditions and interval restrictions enter the calculation?
-   why does a Bernoulli substitution turn one controlled nonlinearity into a
    linear equation?

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's organising idea is:

```{=latex}
\Needspace{8\baselineskip}
```
> an integrating factor is chosen to manufacture one product derivative from
> the two terms on the left side of a linear equation.

Every worked example is built independently and includes the intermediate
steps needed to see that product appear.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising And Normalising The Equation {#block-1-recognising-and-normalising-the-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to recognise a first-order linear equation even when it is not
initially written in standard form.

```{=latex}
\Needspace{12\baselineskip}
```
Before using an integrating factor, we must know exactly which functions play
the roles of $p(x)$ and $q(x)$.

```{=latex}
\Needspace{8\baselineskip}
```
> normalisation is not cosmetic; it determines the integrating factor.

```{=latex}
\Needspace{12\baselineskip}
```
### The Linear Pattern {#the-linear-pattern-2}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation is linear in the unknown function $y(x)$ when it can be
written as:

$$
\boxed{y'+p(x)y=q(x)}
$$

Here:

-   $x$ is the independent variable
-   $y=y(x)$ is the unknown function
-   $y'=dy/dx$ is its derivative
-   $p(x)$ is the coefficient multiplying $y$
-   $q(x)$ is the forcing term

The word **linear** describes how the unknown function appears.

```{=latex}
\Needspace{10\baselineskip}
```
The permitted unknown-dependent terms are:

$$
y'
\qquad\text{and}\qquad
p(x)y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning is:

```{=latex}
\Needspace{8\baselineskip}
```
> the coefficients may be complicated functions of $x$, but $y$ and $y'$
> must appear only to the first power and must not multiply each other.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Coefficient Of The Derivative Must Be One {#why-the-coefficient-of-the-derivative-must-be-one-3}

```{=latex}
\Needspace{10\baselineskip}
```
An equation may first appear as:

$$
a(x)y'+b(x)y=c(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $a(x)\neq 0$ on the interval under consideration, divide **every term** by
$a(x)$:

$$
\frac{a(x)y'}{a(x)}
+
\frac{b(x)y}{a(x)}
=
\frac{c(x)}{a(x)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplifying gives:

$$
y'+\frac{b(x)}{a(x)}y=\frac{c(x)}{a(x)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
p(x)=\frac{b(x)}{a(x)},
\qquad
q(x)=\frac{c(x)}{a(x)}.
$$

This is the normalised equation.

The division also creates an interval restriction: the method applies only
where $a(x)$ is nonzero.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Recognition Example {#worked-recognition-example-4}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(1+s^2)v'+2sv=4s.
$$

The unknown function is $v=v(s)$, and the independent variable is $s$.

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $v'$ is $1+s^2$. Because:

$$
1+s^2>0
$$

```{=latex}
\Needspace{10\baselineskip}
```
for every real $s$, we may divide the entire equation by $1+s^2$:

$$
\frac{(1+s^2)v'}{1+s^2}
+
\frac{2sv}{1+s^2}
=
\frac{4s}{1+s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify each term:

$$
\boxed{
v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation now matches $v'+p(s)v=q(s)$ with:

$$
p(s)=\frac{2s}{1+s^2},
\qquad
q(s)=\frac{4s}{1+s^2}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> the equation was linear before division, but normalisation exposes the two
> functions needed by the integrating-factor method.

```{=latex}
\Needspace{12\baselineskip}
```
### Linear And Nonlinear Near Misses {#linear-and-nonlinear-near-misses-5}

Consider the equations below, all written for $u=u(t)$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
u'+t^4u=\cos t
$$

is linear. The coefficient $t^4$ may be nonlinear as a function of $t$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
u'+t^4u^2=\cos t
$$

is not linear in $u$ because the unknown appears as $u^2$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
(2+u)u'+tu=1
$$

is not linear because the coefficient of $u'$ depends on the unknown $u$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
u'+tu=t^2u^3
$$

is not linear in $u$, but it has the controlled nonlinear structure of a
Bernoulli equation. We will return to that structure later.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order linear equation can be written as:

$$
y'+p(x)y=q(x).
$$

If the coefficient of $y'$ is not one, divide every term by that coefficient
before identifying $p$ and $q$.

Record where that division is valid.

Do not classify an equation from the complexity of $p(x)$ or $q(x)$. Linearity
is determined by the way the unknown function appears.

```{=latex}
\Needspace{12\baselineskip}
```
## The Integrating Factor As A Reverse Product Rule {#block-2-the-integrating-factor-as-a-reverse-product-rule}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to derive the integrating factor rather than memorise it as an
unmotivated formula.

We will begin with the product we want and work backwards to the factor that
creates it.

```{=latex}
\Needspace{12\baselineskip}
```
### The Product We Want To Manufacture {#the-product-we-want-to-manufacture-8}

```{=latex}
\Needspace{10\baselineskip}
```
Start with the normalised linear equation:

$$
y'+p(x)y=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Suppose we multiply every term by a function $\mu(x)$:

$$
\mu y'+\mu p(x)y=\mu q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
We want the left side to become the derivative of one product:

$$
(\mu y)'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the product rule:

$$
(\mu y)'=\mu y'+\mu' y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare the two left sides:

$$
\mu y'+\mu p(x)y
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product-rule expression is:

$$
\mu y'+\mu' y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first terms already match. The second terms will match if:

$$
\mu' y=\mu p(x)y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the coefficient identity, we require:

$$
\boxed{\mu'=p(x)\mu}.
$$

This is the design condition for the integrating factor.

```{=latex}
\Needspace{12\baselineskip}
```
### Solving The Design Condition {#solving-the-design-condition-9}

```{=latex}
\Needspace{10\baselineskip}
```
The integrating factor must satisfy:

$$
\mu'=p(x)\mu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose a nonzero solution. Divide by $\mu$:

$$
\frac{\mu'}{\mu}=p(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The left side is the derivative of $\ln|\mu|$:

$$
\frac{d}{dx}\ln|\mu|=p(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $\mu'/\mu=p(x)$, integrate with respect to $x$:

$$
\ln|\mu|=\int p(x)\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiating gives a nonzero choice:

$$
\boxed{
\mu(x)=e^{\int p(x)\,dx}
}.
$$

Any nonzero constant multiplier would also work. We choose the simplest
representative because multiplying the entire transformed equation by a
constant does not change its solution set.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> the exponential is used because its derivative reproduces itself times the
> derivative of its exponent.

```{=latex}
\Needspace{12\baselineskip}
```
### Watch The Product Appear {#watch-the-product-appear-10}

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
y'+p(x)y=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
\mu=e^{\int p(x)\,dx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because this choice satisfies $\mu'=p\mu$, multiply every term by $\mu$:

$$
\mu y'+\mu p y=\mu q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In the transformed equation
$\mu y'+\mu p y=\mu q$, replace $\mu p$ by $\mu'$:

$$
\mu y'+\mu' y=\mu q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the product rule in reverse:

$$
\boxed{(\mu y)'=\mu q}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now integrate both sides with respect to $x$:

$$
\mu y=\int \mu(x)q(x)\,dx+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### What The Factor Is Actually Doing {#what-the-factor-is-actually-doing-11}

```{=latex}
\Needspace{10\baselineskip}
```
Before multiplication, the two left-side terms are:

$$
y'
\qquad\text{and}\qquad
p(x)y.
$$

They do not usually form an immediately integrable expression.

```{=latex}
\Needspace{10\baselineskip}
```
After multiplication, they become:

$$
\mu y'
\qquad\text{and}\qquad
\mu' y.
$$

Those are precisely the two pieces produced when differentiating $\mu y$.

```{=latex}
\Needspace{12\baselineskip}
```
Another way to see it:

```{=latex}
\Needspace{8\baselineskip}
```
> the integrating factor changes the packaging of the equation, not its
> underlying solutions. Two separate terms become one derivative.

```{=latex}
\Needspace{12\baselineskip}
```
### A Common Misunderstanding {#a-common-misunderstanding-12}

The integrating factor is not chosen because it makes every individual term
easy to integrate.

```{=latex}
\Needspace{10\baselineskip}
```
Its purpose is more specific:

$$
\mu y'+\mu p y
\quad\longrightarrow\quad
(\mu y)'.
$$

Trying to integrate $y'$ and $p(x)y$ separately treats $y$ as though it were
constant with respect to $x$. That is generally invalid because $y=y(x)$.

The product derivative is what makes the integration legitimate.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-13}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+p(x)y=q(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
choose:

$$
\mu=e^{\int p(x)\,dx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This choice satisfies $\mu'=p\mu$, so:

$$
\mu y'+\mu p y=(\mu y)'.
$$

The integrating factor is therefore a reverse-product-rule device.

```{=latex}
\Needspace{12\baselineskip}
```
## A Reliable Solution Workflow {#block-3-a-reliable-solution-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-14}

The goal is to turn the derivation into a dependable procedure while keeping
the reason for each step visible.

```{=latex}
\Needspace{12\baselineskip}
```
### The Seven-Step Method {#the-seven-step-method-15}

For a proposed first-order linear equation:

#### Step 1: Normalise

```{=latex}
\Needspace{10\baselineskip}
```
Put the equation into:

$$
y'+p(x)y=q(x).
$$

Record any interval restrictions introduced by division.

#### Step 2: Identify $p$ and $q$

Write them explicitly. Do not identify $p$ before normalisation.

#### Step 3: Construct the integrating factor

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mu=e^{\int p(x)\,dx}.
$$

#### Step 4: Multiply every term

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
\mu y'+\mu p y=\mu q.
$$

#### Step 5: Display the product derivative

```{=latex}
\Needspace{10\baselineskip}
```
Use $\mu'=p\mu$ to rewrite the equation as:

$$
(\mu y)'=\mu q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Integrate and isolate the unknown

Integrate both sides, include one arbitrary constant, and divide by $\mu$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply conditions and verify

If an initial condition is supplied, use it to determine the constant. Then
substitute the result into the original differential equation and state the
interval of validity.

```{=latex}
\Needspace{12\baselineskip}
```
### Complete Worked Example {#complete-worked-example-16}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'+3x^2y=6x^2.
$$

#### Step 1: Read the normalised equation

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $y'$ is already one. Therefore:

$$
p(x)=3x^2,
\qquad
q(x)=6x^2.
$$

Both functions are continuous for every real $x$.

#### Step 2: Construct the integrating factor

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
\mu=e^{\int p(x)\,dx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $p(x)=3x^2$:

$$
\begin{aligned}
\mu(x)
&=e^{\int 3x^2\,dx} \\
&=e^{x^3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\mu=e^{x^3}$, check the design condition:

$$
\mu'(x)=3x^2e^{x^3}=p(x)\mu(x).
$$

#### Step 3: Multiply every term

```{=latex}
\Needspace{10\baselineskip}
```
Multiply
$y'+3x^2y=6x^2$
by $e^{x^3}$:

$$
e^{x^3}y'+3x^2e^{x^3}y=6x^2e^{x^3}.
$$

#### Step 4: Recognise the product derivative

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the product $e^{x^3}y$:

$$
\begin{aligned}
\frac{d}{dx}\left(e^{x^3}y\right)
&=e^{x^3}y'+\left(3x^2e^{x^3}\right)y \\
&=e^{x^3}y'+3x^2e^{x^3}y.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is exactly the transformed left side. Therefore:

$$
\left(e^{x^3}y\right)'=6x^2e^{x^3}.
$$

#### Step 5: Integrate

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides with respect to $x$:

$$
e^{x^3}y=\int 6x^2e^{x^3}\,dx+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the integral, let:

$$
w=x^3,
\qquad
dw=3x^2\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $6x^2\,dx=2\,dw$, so:

$$
\begin{aligned}
\int 6x^2e^{x^3}\,dx
&=2\int e^w\,dw \\
&=2e^w \\
&=2e^{x^3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
After evaluating the integral, the product equation becomes:

$$
e^{x^3}y=2e^{x^3}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Isolate $y$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $e^{x^3}$, which is nonzero for every real $x$:

$$
\boxed{y=2+Ce^{-x^3}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Verify

```{=latex}
\Needspace{10\baselineskip}
```
Start from the proposed family:

$$
y=2+Ce^{-x^3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-3Cx^2e^{-x^3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The qualitative interpretation is also visible:

```{=latex}
\Needspace{8\baselineskip}
```
> every solution is a deviation from the constant level $y=2$, and that
> deviation is multiplied by $e^{-x^3}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example Starting Outside Standard Form {#worked-example-starting-outside-standard-form-17}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
(1+s^2)v'+2sv=4s.
$$

#### Step 1: Normalise

```{=latex}
\Needspace{10\baselineskip}
```
Because $1+s^2>0$ for every real $s$, divide every term by $1+s^2$:

$$
v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
p(s)=\frac{2s}{1+s^2},
\qquad
q(s)=\frac{4s}{1+s^2}.
$$

#### Step 2: Construct the integrating factor

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $p(s)=2s/(1+s^2)$ into the integrating-factor formula:

$$
\mu(s)
=
e^{\int \frac{2s}{1+s^2}\,ds}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $w=1+s^2$, so $dw=2s\,ds$. Then:

$$
\int \frac{2s}{1+s^2}\,ds
=
\int \frac{1}{w}\,dw
=
\ln(1+s^2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1+s^2$ is always positive:

$$
\begin{aligned}
\mu(s)
&=e^{\ln(1+s^2)} \\
&=1+s^2.
\end{aligned}
$$

#### Step 3: Multiply the normalised equation

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term in
$v'+\frac{2s}{1+s^2}v=\frac{4s}{1+s^2}$
by $1+s^2$:

$$
(1+s^2)v'+2sv=4s.
$$

This happens to recover the original equation.

#### Step 4: Recognise the product

```{=latex}
\Needspace{10\baselineskip}
```
Use the product rule:

$$
\begin{aligned}
\frac{d}{ds}\left((1+s^2)v\right)
&=(1+s^2)v'+2sv.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the equation is:

$$
\left((1+s^2)v\right)'=4s.
$$

#### Step 5: Integrate and solve

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides with respect to $s$:

$$
(1+s^2)v=\int 4s\,ds+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the integral:

$$
(1+s^2)v=2s^2+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $1+s^2$:

$$
\boxed{
v(s)=\frac{2s^2+C}{1+s^2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The useful observation is:

```{=latex}
\Needspace{8\baselineskip}
```
> sometimes the original left side already is a product derivative; the
> integrating-factor calculation explains how to recognise that fact.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-18}

The reliable sequence is:

1.  normalise
2.  identify $p$ and $q$
3.  compute $\mu=e^{\int p\,dx}$
4.  multiply every term
5.  rewrite the left side as $(\mu y)'$
6.  integrate and isolate $y$
7.  apply conditions, verify, and state the interval

The product derivative should always be displayed. It is the central step,
not an optional abbreviation.

```{=latex}
\Needspace{12\baselineskip}
```
## Initial Conditions And Valid Intervals {#block-4-initial-conditions-and-valid-intervals}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-19}

The goal is to solve an initial-value problem without losing track of where
the coefficient functions and integrating factor are valid.

A formula and its interval belong together.

```{=latex}
\Needspace{12\baselineskip}
```
### Complete Initial-Value Problem {#complete-initial-value-problem-20}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
u'+\frac{2}{t+1}u=(t+1)^2,
\qquad
u(0)=\frac65.
$$

#### Step 1: State the working interval

The coefficient $2/(t+1)$ is undefined at $t=-1$.

```{=latex}
\Needspace{10\baselineskip}
```
The initial point $t=0$ lies in:

$$
(-1,\infty).
$$

We therefore solve on that interval.

#### Step 2: Identify the coefficient functions

```{=latex}
\Needspace{10\baselineskip}
```
The equation is already normalised, with:

$$
p(t)=\frac{2}{t+1},
\qquad
q(t)=(t+1)^2.
$$

#### Step 3: Construct the integrating factor

```{=latex}
\Needspace{10\baselineskip}
```
Use the integrating-factor formula:

$$
\mu(t)=e^{\int p(t)\,dt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Step 4: Multiply every term

```{=latex}
\Needspace{10\baselineskip}
```
Multiply
$u'+\frac{2}{t+1}u=(t+1)^2$
by $(t+1)^2$:

$$
(t+1)^2u'+2(t+1)u=(t+1)^4.
$$

#### Step 5: Display the product derivative

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $(t+1)^2u$:

$$
\begin{aligned}
\frac{d}{dt}\left((t+1)^2u\right)
&=(t+1)^2u'+2(t+1)u.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\left((t+1)^2u\right)'=(t+1)^4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Integrate

```{=latex}
\Needspace{10\baselineskip}
```
Integrate with respect to $t$:

$$
(t+1)^2u
=
\int (t+1)^4\,dt+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the integral:

$$
(t+1)^2u=\frac{(t+1)^5}{5}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $(t+1)^2$:

$$
u(t)=\frac{(t+1)^3}{5}+\frac{C}{(t+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply the initial condition

```{=latex}
\Needspace{10\baselineskip}
```
Restate the solution family before substitution:

$$
u(t)=\frac{(t+1)^3}{5}+\frac{C}{(t+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=0$ and $u(0)=6/5$:

$$
\frac65
=
\frac{(0+1)^3}{5}
+
\frac{C}{(0+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
\frac65=\frac15+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1/5$ from both sides:

$$
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial-value solution is:

$$
\boxed{
u(t)=\frac{(t+1)^3}{5}+\frac{1}{(t+1)^2},
\qquad t\in(-1,\infty)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Initial-Value Solution {#verify-the-initial-value-solution-21}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
u(t)=\frac{(t+1)^3}{5}+(t+1)^{-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate term by term:

$$
u'(t)=\frac35(t+1)^2-2(t+1)^{-3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Definite-Integral Version {#a-definite-integral-version-22}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+p(x)y=q(x),
\qquad
y(x_0)=y_0,
$$

choose an integrating factor $\mu$ on an interval containing $x_0$.

```{=latex}
\Needspace{10\baselineskip}
```
For the initial-value problem, multiplication by $\mu$ gives:

$$
(\mu y)'=\mu q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate directly from $x_0$ to $x$:

$$
\int_{x_0}^{x}(\mu(s)y(s))'\,ds
=
\int_{x_0}^{x}\mu(s)q(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the fundamental theorem of calculus:

$$
\mu(x)y(x)-\mu(x_0)y(x_0)
=
\int_{x_0}^{x}\mu(s)q(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Singular Point Cannot Be Crossed {#why-the-singular-point-cannot-be-crossed-23}

```{=latex}
\Needspace{10\baselineskip}
```
In the worked initial-value problem, the coefficient:

$$
\frac{2}{t+1}
$$

is undefined at $t=-1$.

```{=latex}
\Needspace{10\baselineskip}
```
The formula for the solution also contains:

$$
\frac{1}{(t+1)^2}.
$$

The interval containing the initial point $t=0$ therefore stops at $t=-1$.

Even if an algebraic expression happens to make sense on both sides of a
singular point, one solution interval cannot pass through a point where the
differential equation itself is undefined.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> choose the interval from the differential equation and initial point, not
> merely from the final formula.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-24}

For an initial-value problem:

-   choose an interval on which $p$ and $q$ are continuous
-   ensure that the interval contains the initial point
-   determine the constant using the complete solution family
-   verify both the equation and the initial condition
-   report the solution together with its interval

The definite-integral formula is an alternative that incorporates the initial
condition from the start.

```{=latex}
\Needspace{12\baselineskip}
```
## Understanding The Shape Of Linear Solutions {#block-5-understanding-the-shape-of-linear-solutions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-25}

The goal is to interpret the structure of linear solutions rather than treat
the method as algebra alone.

```{=latex}
\Needspace{12\baselineskip}
```
### The Homogeneous Part {#the-homogeneous-part-26}

```{=latex}
\Needspace{10\baselineskip}
```
The associated homogeneous linear equation is:

$$
y'+p(x)y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its integrating-factor form is:

$$
(\mu y)'=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\mu y=C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide $\mu y=C$ by the nonzero integrating factor $\mu$:

$$
\boxed{y_h=\frac{C}{\mu(x)}}.
$$

This term describes how differences between solutions evolve.

```{=latex}
\Needspace{10\baselineskip}
```
If $y_1$ and $y_2$ both solve:

$$
y'+p(x)y=q(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
subtract their equations:

$$
(y_1'-y_2')+p(x)(y_1-y_2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $d=y_1-y_2$. Then:

$$
d'+p(x)d=0.
$$

Thus the difference between any two solutions is a homogeneous solution.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning is:

```{=latex}
\Needspace{8\baselineskip}
```
> the forcing term determines one baseline response; the homogeneous term
> records the freedom left by the initial condition.

```{=latex}
\Needspace{12\baselineskip}
```
### Constant Forcing And Equilibrium {#constant-forcing-and-equilibrium-27}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'+ay=b,
$$

where $a>0$ and $b$ are constants.

```{=latex}
\Needspace{10\baselineskip}
```
An equilibrium is a constant solution, so set $y'=0$:

$$
ay=b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $a$:

$$
y_*=\frac{b}{a}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution has the form:

$$
\boxed{
y(x)=\frac{b}{a}+Ce^{-ax}
}.
$$

The first term is the equilibrium level. The second term is the initial
deviation from that level.

```{=latex}
\Needspace{10\baselineskip}
```
Because $a>0$:

$$
e^{-ax}\longrightarrow 0
\qquad\text{as}\qquad
x\longrightarrow\infty.
$$

Therefore every solution approaches $b/a$ as $x$ increases.

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Behaviour Example {#a-small-behaviour-example-28}

```{=latex}
\Needspace{10\baselineskip}
```
Solve and interpret:

$$
w'+5w=20,
\qquad
w(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium satisfies:

$$
5w_*=20,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
w_*=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general constant-coefficient solution is:

$$
w=4+Ce^{-5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $w(0)=1$:

$$
1=4+Ce^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^0=1$:

$$
C=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=-3$ into $w=4+Ce^{-5t}$ to obtain:

$$
\boxed{w(t)=4-3e^{-5t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$, the state begins below equilibrium. Its derivative is:

$$
w'(t)=15e^{-5t}>0.
$$

So the solution increases toward $4$ without overshooting it.

```{=latex}
\Needspace{12\baselineskip}
```
### Verification As An Error Detector {#verification-as-an-error-detector-29}

Verification is especially good at finding:

-   a sign error in $\int p(x)\,dx$
-   failure to multiply the forcing term by $\mu$
-   an incorrect product derivative
-   a missing factor when differentiating the final answer
-   a wrongly determined initial constant

For a proposed solution $y(x)$:

1.  differentiate it explicitly
2.  compute $y'+p(x)y$
3.  simplify until it equals $q(x)$
4.  check any supplied initial condition
5.  confirm the stated interval avoids singular coefficients

The check should use the original equation, not only the transformed one.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-30}

A linear solution consists of:

-   one response to the forcing term
-   one homogeneous term carrying the arbitrary constant

Differences between solutions satisfy the homogeneous equation.

For $y'+ay=b$ with $a>0$, solutions approach the equilibrium $b/a$.

Verification connects the symbolic solution back to the original rate rule.

```{=latex}
\Needspace{12\baselineskip}
```
## Why The Method Also Creates An Exact Equation {#block-6-why-the-method-also-creates-an-exact-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-31}

The goal is to connect the linear integrating factor with the exact-equation
ideas from the previous chapter.

The two methods are not unrelated tricks. The linear integrating factor
creates an exact differential form automatically.

```{=latex}
\Needspace{12\baselineskip}
```
### Convert The Linear Equation To Differential Form {#convert-the-linear-equation-to-differential-form-32}

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
y'+p(x)y=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the forcing term to the left:

$$
y'+p(x)y-q(x)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'+p(x)y-q(x)=0$, replace $y'$ by $dy/dx$:

$$
\frac{dy}{dx}+p(x)y-q(x)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $dx$:

$$
\bigl(p(x)y-q(x)\bigr)\,dx+dy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This differential form has:

$$
M(x,y)=p(x)y-q(x),
\qquad
N(x,y)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its cross-partials are:

$$
M_y=p(x),
\qquad
N_x=0.
$$

The form is not generally exact unless $p(x)=0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Multiply By The Linear Integrating Factor {#multiply-by-the-linear-integrating-factor-33}

```{=latex}
\Needspace{10\baselineskip}
```
Choose the linear integrating factor:

$$
\mu(x)=e^{\int p(x)\,dx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the differential form
$\bigl(p(x)y-q(x)\bigr)\,dx+dy=0$
by $\mu(x)$:

$$
\mu(x)\bigl(p(x)y-q(x)\bigr)\,dx+\mu(x)\,dy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The new coefficients are:

$$
\widetilde M(x,y)=\mu(x)p(x)y-\mu(x)q(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\widetilde N(x,y)=\mu(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $\widetilde M$ with respect to $y$:

$$
\begin{aligned}
\widetilde M_y
&=\frac{\partial}{\partial y}
\left(\mu p y-\mu q\right) \\
&=\mu p.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $\widetilde N=\mu(x)$ with respect to $x$:

$$
\widetilde N_x=\mu'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The integrating factor was designed to satisfy:

$$
\mu'=p\mu.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\widetilde M_y=\widetilde N_x.
$$

The multiplied differential form is exact.

```{=latex}
\Needspace{12\baselineskip}
```
### The Potential Is The Product {#the-potential-is-the-product-34}

```{=latex}
\Needspace{10\baselineskip}
```
For the multiplied equation, the potential can be written as:

$$
\Phi(x,y)=\mu(x)y-\int \mu(x)q(x)\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $y$:

$$
\Phi_y=\mu(x)=\widetilde N.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $x$, holding $y$ constant:

$$
\begin{aligned}
\Phi_x
&=\mu'(x)y-\mu(x)q(x) \\
&=\mu(x)p(x)y-\mu(x)q(x) \\
&=\widetilde M.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the exact-equation solution $\Phi=C$ is:

$$
\mu(x)y-\int \mu(x)q(x)\,dx=C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
\mu(x)y=\int \mu(x)q(x)\,dx+C.
$$

This is exactly the equation obtained from the reverse-product-rule method.

```{=latex}
\Needspace{12\baselineskip}
```
The broader interpretation is:

```{=latex}
\Needspace{8\baselineskip}
```
> multiplying by the linear integrating factor simultaneously creates a
> product derivative and an exact differential form.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-35}

```{=latex}
\Needspace{10\baselineskip}
```
The normalised linear equation becomes:

$$
\bigl(p(x)y-q(x)\bigr)\,dx+dy=0.
$$

After multiplication by $\mu=e^{\int p\,dx}$, its cross-partials agree
because $\mu'=p\mu$.

The product-rule and exactness explanations are two views of the same
transformation.

```{=latex}
\Needspace{12\baselineskip}
```
## Bernoulli Equations Become Linear {#block-7-bernoulli-equations-become-linear}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-36}

The goal is to understand why one particular nonlinear pattern can be
converted into a linear equation.

We will derive the substitution and track the restrictions it introduces.

```{=latex}
\Needspace{12\baselineskip}
```
### The Bernoulli Pattern {#the-bernoulli-pattern-37}

```{=latex}
\Needspace{10\baselineskip}
```
A Bernoulli equation has the form:

$$
\boxed{
y'+p(x)y=q(x)y^n
}
$$

where $n$ is a fixed real number.

```{=latex}
\Needspace{10\baselineskip}
```
The genuinely nonlinear cases have:

$$
n\neq 0
\qquad\text{and}\qquad
n\neq 1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $n=0$, then $y^n=1$, so the equation is already linear:

$$
y'+p(x)y=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $n=1$, then the right side is another multiple of $y$:

$$
y'+\bigl(p(x)-q(x)\bigr)y=0.
$$

For $n\neq0,1$, the term $y^n$ makes the original equation nonlinear.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Power Substitution Is Chosen {#why-the-power-substitution-is-chosen-38}

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
y'+p(x)y=q(x)y^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Where the required powers are defined and $y\neq 0$, multiply every term by
$y^{-n}$:

$$
y^{-n}y'+p(x)y^{1-n}=q(x).
$$

The second unknown-dependent expression is now $y^{1-n}$.

```{=latex}
\Needspace{10\baselineskip}
```
That suggests defining a new unknown:

$$
\boxed{v=y^{1-n}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $v=y^{1-n}$, differentiate using the chain rule:

$$
v'=(1-n)y^{-n}y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve this derivative relation for $y^{-n}y'$ by dividing by $1-n$:

$$
y^{-n}y'=\frac{v'}{1-n}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also, directly from the substitution:

$$
y^{1-n}=v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both expressions into
$y^{-n}y'+p(x)y^{1-n}=q(x)$:

$$
\frac{v'}{1-n}+p(x)v=q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $1-n$:

$$
\boxed{
v'+(1-n)p(x)v=(1-n)q(x)
}.
$$

This is linear in the new unknown $v(x)$.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Substitution Achieves {#what-the-substitution-achieves-39}

```{=latex}
\Needspace{10\baselineskip}
```
The substitution:

$$
v=y^{1-n}
$$

is not a guess chosen from nowhere.

```{=latex}
\Needspace{10\baselineskip}
```
Multiplication by $y^{-n}$ creates the two expressions:

$$
y^{-n}y'
\qquad\text{and}\qquad
y^{1-n}.
$$

Those are, up to the constant factor $1-n$, the derivative and value of the
same new function $v$.

```{=latex}
\Needspace{12\baselineskip}
```
In everyday terms:

```{=latex}
\Needspace{8\baselineskip}
```
> the power is chosen so that both nonlinear-looking pieces can be renamed
> using one new unknown and its derivative.

```{=latex}
\Needspace{12\baselineskip}
```
### A Bernoulli Workflow {#a-bernoulli-workflow-40}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+p(x)y=q(x)y^n,
$$

use the following sequence.

1.  Confirm that $n$ is fixed and that the equation has only the Bernoulli
    nonlinear power.
2.  Check whether $y=0$ is a solution before dividing by a power of $y$.
3.  Define $v=y^{1-n}$.
4.  Differentiate the substitution explicitly.
5.  Transform the equation into:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

6.  Solve the linear equation for $v$ with an integrating factor.
7.  Replace $v$ by $y^{1-n}$ and solve for $y$ where appropriate.
8.  Restore excluded solutions and state branch or domain restrictions.
9.  Verify in the original Bernoulli equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-41}

```{=latex}
\Needspace{10\baselineskip}
```
A Bernoulli equation:

$$
y'+p(x)y=q(x)y^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
becomes linear under:

$$
v=y^{1-n}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed equation is:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

The substitution may exclude $y=0$ or introduce power restrictions, so those
cases must be handled separately.

```{=latex}
\Needspace{12\baselineskip}
```
## A Complete Bernoulli Example {#block-8-a-complete-bernoulli-example}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-42}

The goal is to carry one Bernoulli equation through every stage: protecting
an excluded solution, transforming the unknown, solving the linear equation,
returning to the original variable, and verifying the result.

```{=latex}
\Needspace{12\baselineskip}
```
### The Problem And The Excluded Solution {#the-problem-and-the-excluded-solution-43}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'+t^2y=3t^2y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y'+t^2y=3t^2y^2$ matches the Bernoulli pattern with:

$$
p(t)=t^2,
\qquad
q(t)=3t^2,
\qquad
n=2.
$$

Before dividing by a power of $y$, test $y=0$ in the original equation.

```{=latex}
\Needspace{10\baselineskip}
```
If $y=0$, then $y'=0$, so:

$$
0+t^2(0)=3t^2(0)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both sides equal zero. Therefore:

$$
\boxed{y(t)=0}
$$

is a solution that must be retained separately.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 1: Transform The Nonzero Branches {#step-1-transform-the-nonzero-branches-44}

```{=latex}
\Needspace{10\baselineskip}
```
For $n=2$, the Bernoulli substitution is:

$$
v=y^{1-n}=y^{-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $v=y^{-1}$:

$$
v'=-y^{-2}y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For nonzero $y$, multiply the original equation
$y'+t^2y=3t^2y^2$
by $y^{-2}$:

$$
y^{-2}y'+t^2y^{-1}=3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In
$y^{-2}y'+t^2y^{-1}=3t^2$, use:

$$
y^{-2}y'=-v'
\qquad\text{and}\qquad
y^{-1}=v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these expressions:

$$
-v'+t^2v=3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $-1$:

$$
\boxed{v'-t^2v=-3t^2}.
$$

The nonlinear equation in $y$ has become a linear equation in $v$.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 2: Solve The Linear Equation In $v$ {#step-2-solve-the-linear-equation-in-v-45}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the transformed equation:

$$
v'-t^2v=-3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its coefficient functions are:

$$
P(t)=-t^2,
\qquad
Q(t)=-3t^2.
$$

The capital letters distinguish the transformed coefficients from those in
the original equation.

```{=latex}
\Needspace{10\baselineskip}
```
Construct the integrating factor:

$$
\begin{aligned}
\mu(t)
&=e^{\int -t^2\,dt} \\
&=e^{-t^3/3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term in $v'-t^2v=-3t^2$ by $e^{-t^3/3}$:

$$
e^{-t^3/3}v'
-t^2e^{-t^3/3}v
=
-3t^2e^{-t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the integrating factor:

$$
\frac{d}{dt}e^{-t^3/3}
=
-t^2e^{-t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the transformed left side is the product derivative:

$$
\left(e^{-t^3/3}v\right)'
=
-3t^2e^{-t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides:

$$
e^{-t^3/3}v
=
\int -3t^2e^{-t^3/3}\,dt+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the integral, let:

$$
w=-\frac13t^3,
\qquad
dw=-t^2\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $-3t^2\,dt=3\,dw$, so:

$$
\begin{aligned}
\int -3t^2e^{-t^3/3}\,dt
&=3\int e^w\,dw \\
&=3e^w \\
&=3e^{-t^3/3}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
e^{-t^3/3}v
=
3e^{-t^3/3}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$e^{-t^3/3}v=3e^{-t^3/3}+C$, multiply every term by $e^{t^3/3}$:

$$
\boxed{
v=3+Ce^{t^3/3}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 3: Return To $y$ {#step-3-return-to-y-46}

```{=latex}
\Needspace{10\baselineskip}
```
The substitution was:

$$
v=y^{-1}=\frac{1}{y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed solution is:

$$
v=3+Ce^{t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set these expressions equal:

$$
\frac{1}{y}
=
3+Ce^{t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the reciprocal where the denominator is nonzero:

$$
\boxed{
y(t)=\frac{1}{3+Ce^{t^3/3}}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
These are the nonzero solution branches. The previously protected solution:

$$
y(t)=0
$$

must be listed separately.

```{=latex}
\Needspace{10\baselineskip}
```
For a fixed value of $C$, the solution
$y(t)=1/(3+Ce^{t^3/3})$
is valid only on intervals where:

$$
3+Ce^{t^3/3}\neq 0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Step 4: Apply An Initial Condition {#step-4-apply-an-initial-condition-47}

```{=latex}
\Needspace{10\baselineskip}
```
Now impose:

$$
y(0)=\frac14.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Restate the nonzero family:

$$
y(t)=\frac{1}{3+Ce^{t^3/3}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=0$ and $y(0)=1/4$:

$$
\frac14
=
\frac{1}{3+Ce^0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^0=1$:

$$
\frac14
=
\frac{1}{3+C}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take reciprocals of both nonzero sides:

$$
4=3+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $4=3+C$, subtract $3$ from both sides:

$$
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the initial-value solution is:

$$
\boxed{
y(t)=\frac{1}{3+e^{t^3/3}}
}.
$$

Its denominator is positive for every real $t$, so this solution is defined
on $(-\infty,\infty)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Step 5: Verify The Bernoulli Solution {#step-5-verify-the-bernoulli-solution-48}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
D(t)=3+e^{t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then the initial-value solution is:

$$
y=D^{-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $D$:

$$
D'=t^2e^{t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $y=D^{-1}$ using the chain rule:

$$
y'=-D^{-2}D'
=
-\frac{t^2e^{t^3/3}}{D^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since $D=3+e^{t^3/3}$:

$$
D-e^{t^3/3}=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y'+t^2y
=
\frac{t^2(3)}{D^2}
=
\frac{3t^2}{D^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The original right side is:

$$
3t^2y^2
=
3t^2\left(\frac1D\right)^2
=
\frac{3t^2}{D^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both sides agree, so the differential equation is satisfied. Also:

$$
y(0)=\frac{1}{3+1}=\frac14.
$$

The initial condition is satisfied as well.

```{=latex}
\Needspace{12\baselineskip}
```
### Fractional Powers Need Extra Care {#fractional-powers-need-extra-care-49}

```{=latex}
\Needspace{10\baselineskip}
```
If $1-n$ is fractional, the substitution:

$$
v=y^{1-n}
$$

may require a sign restriction or a branch choice.

For example, if $v=y^{1/2}$, a real-valued treatment requires $y\geq0$.

When returning from $v$ to $y$, an operation such as squaring may introduce
candidate branches that must be checked in the original equation.

The safe routine is:

-   state where the substitution is real and differentiable
-   record values excluded by division
-   solve for the transformed variable
-   return to $y$ with explicit branch conditions
-   verify each retained branch

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-50}

For the example $y'+t^2y=3t^2y^2$:

-   $y=0$ is a separate solution
-   $v=y^{-1}$ transforms the nonzero branches
-   the transformed equation is $v'-t^2v=-3t^2$
-   an integrating factor solves the linear equation in $v$
-   returning to $y$ gives

$$
y=\frac{1}{3+Ce^{t^3/3}}
$$

where the denominator is nonzero.

The transformation is not complete until excluded solutions and domains have
been restored.

```{=latex}
\Needspace{12\baselineskip}
```
## Method Selection And Common Mistakes {#block-9-method-selection-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-51}

The goal is to decide when the linear method is appropriate and to recognise
the errors most likely to derail it.

```{=latex}
\Needspace{12\baselineskip}
```
### A Method-Selection Checklist {#a-method-selection-checklist-52}

Given a first-order equation, ask:

1.  Can it be normalised as $y'+p(x)y=q(x)$?
2.  If not linear, does it fit $y'+p(x)y=q(x)y^n$ with one fixed power?
3.  Is it also separable, making a shorter route available?
4.  Is it already exact in differential form?
5.  Does division remove a possible constant solution?
6.  On which intervals are all coefficients and substitutions valid?

More than one method may apply.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
y'=-2xy
$$

is both linear and separable.

```{=latex}
\Needspace{10\baselineskip}
```
By contrast:

$$
y'+xy=x^2
$$

is linear but not ordinarily separable because the slope contains an additive
forcing term.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Choosing $p$ Before Normalising {#common-mistake-choosing-p-before-normalising-53}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
x y'+(x+1)y=e^x,
\qquad x>0.
$$

It is incorrect to use $p(x)=x+1$ because the coefficient of $y'$ is not one.

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $x$:

$$
y'+\left(1+\frac1x\right)y=\frac{e^x}{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now:

$$
p(x)=1+\frac1x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Multiplying Only The Left Side {#common-mistake-multiplying-only-the-left-side-54}

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
y'+p(x)y=q(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y'+p(x)y=q(x)$, multiplying every term by $\mu$ produces:

$$
\mu y'+\mu p y=\mu q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Writing:

$$
\mu y'+\mu p y=q
$$

changes the equation unless $\mu=1$.

The forcing term must be multiplied along with every other term.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing The Product Rule {#common-mistake-losing-the-product-rule-55}

```{=latex}
\Needspace{10\baselineskip}
```
The transformed equation:

$$
\mu y'+\mu' y=\mu q
$$

```{=latex}
\Needspace{10\baselineskip}
```
must be rewritten as:

$$
(\mu y)'=\mu q.
$$

It is generally incorrect to integrate the two left-side terms independently
as though $y$ were constant.

Always display the product derivative before integrating.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Keeping A Constant Inside $\mu$ {#common-mistake-keeping-a-constant-inside-mu-56}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
\int p(x)\,dx=P(x)+K.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $\int p(x)\,dx=P(x)+K$, exponentiation gives:

$$
e^{P(x)+K}=e^K e^{P(x)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factor $e^K$ is a nonzero constant multiplier. It does not provide a new
integrating factor in any meaningful sense, so we choose:

$$
\mu=e^{P(x)}.
$$

The arbitrary solution constant appears later, after integrating the product
equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting The Bernoulli Zero Solution {#common-mistake-forgetting-the-bernoulli-zero-solution-57}

Transforming a Bernoulli equation often requires multiplication by $y^{-n}$.

That operation is invalid at $y=0$.

Before dividing, substitute $y=0$ into the original equation. If both sides
agree, record it as a separate solution.

Do not expect the transformed family to recover a branch that the
transformation excluded at its first step.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-58}

Before calculating:

-   normalise
-   identify the unknown and independent variable
-   choose every applicable classification
-   record restrictions

During the calculation:

-   multiply every term
-   show the product derivative
-   protect excluded solutions

After calculating:

-   return to the original unknown
-   apply conditions locally
-   verify in the original equation
-   state the interval

```{=latex}
\Needspace{12\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-59}

#### Problem 1: Normalise And Identify

```{=latex}
\Needspace{10\baselineskip}
```
For $x\neq-2$, put the equation into standard linear form and identify
$p(x)$ and $q(x)$:

$$
(x+2)y'-3y=x.
$$

#### Problem 2: Construct An Integrating Factor

```{=latex}
\Needspace{10\baselineskip}
```
Find an integrating factor for:

$$
y'+4x^3y=8x^3.
$$

Check that your factor satisfies $\mu'=p\mu$.

#### Problem 3: Solve A Linear Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'+4x^3y=8x^3.
$$

#### Problem 4: Reveal An Existing Product

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
(1+x^2)y'+2xy=6x.
$$

#### Problem 5: Solve An Initial-Value Problem

```{=latex}
\Needspace{10\baselineskip}
```
On $x>-1$, solve:

$$
y'+\frac{2}{x+1}y=3(x+1),
\qquad
y(0)=\frac74.
$$

#### Problem 6: Verify A Proposed Solution

```{=latex}
\Needspace{10\baselineskip}
```
Verify directly that:

$$
y=2+5e^{-x^4}
$$

```{=latex}
\Needspace{10\baselineskip}
```
solves:

$$
y'+4x^3y=8x^3.
$$

#### Problem 7: Interpret A Constant-Coefficient Solution

```{=latex}
\Needspace{10\baselineskip}
```
Solve and describe the long-term behaviour of:

$$
z'+5z=20,
\qquad
z(0)=1.
$$

#### Problem 8: Transform A Bernoulli Equation

```{=latex}
\Needspace{10\baselineskip}
```
On $x>0$, transform the equation below into a linear equation without solving
the transformed equation:

$$
y'-\frac{2}{x}y=x^2y^4.
$$

State the substitution and identify any solution excluded by it.

#### Problem 9: Solve A Bernoulli Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find all solution families of:

$$
y'+t^2y=3t^2y^2.
$$

#### Problem 10: Diagnose An Incorrect Integrating Factor

```{=latex}
\Needspace{10\baselineskip}
```
For $x>0$, a student claims that an integrating factor for:

$$
x y'+(x+1)y=e^x
$$

```{=latex}
\Needspace{10\baselineskip}
```
is:

$$
e^{x^2/2+x}.
$$

Explain the error and find the correct integrating factor.

#### Problem 11: Connect Linearity And Exactness

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+2xy=\cos x,
$$

find the linear integrating factor. Convert the multiplied equation to
differential form and verify that it is exact.

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Answers {#practice-answers-60}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
(x+2)y'-3y=x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x\neq-2$, divide every term by $x+2$:

$$
\frac{(x+2)y'}{x+2}
-
\frac{3y}{x+2}
=
\frac{x}{x+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the standard form is:

$$
\boxed{
y'-\frac{3}{x+2}y=\frac{x}{x+2}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Comparing with $y'+p(x)y=q(x)$ gives:

$$
p(x)=-\frac{3}{x+2},
\qquad
q(x)=\frac{x}{x+2}.
$$

The equation must be considered on an interval lying entirely on one side of
$x=-2$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+4x^3y=8x^3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the coefficient is:

$$
p(x)=4x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $p(x)=4x^3$, substitute into the integrating-factor formula:

$$
\begin{aligned}
\mu(x)
&=e^{\int 4x^3\,dx} \\
&=e^{x^4}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the factor:

$$
\mu'(x)=4x^3e^{x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also:

$$
p(x)\mu(x)=4x^3e^{x^4}.
$$

Thus $\mu'=p\mu$, as required.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y'+4x^3y=8x^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $p(x)=4x^3$, the integrating factor is:

$$
\mu=e^{\int4x^3\,dx}=e^{x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $e^{x^4}$:

$$
e^{x^4}y'+4x^3e^{x^4}y=8x^3e^{x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivative of $e^{x^4}$ is $4x^3e^{x^4}$, so the left side is:

$$
\left(e^{x^4}y\right)'=8x^3e^{x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$(e^{x^4}y)'=8x^3e^{x^4}$, integrate with respect to $x$:

$$
e^{x^4}y=\int8x^3e^{x^4}\,dx+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $w=x^4$, so $dw=4x^3\,dx$. Then:

$$
\begin{aligned}
\int8x^3e^{x^4}\,dx
&=2\int e^w\,dw \\
&=2e^{x^4}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^{x^4}y=2e^{x^4}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $e^{x^4}$:

$$
\boxed{y=2+Ce^{-x^4}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
(1+x^2)y'+2xy=6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the product $(1+x^2)y$:

$$
\begin{aligned}
\frac{d}{dx}\left((1+x^2)y\right)
&=(1+x^2)y'+2xy.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the differential equation can be rewritten as:

$$
\left((1+x^2)y\right)'=6x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$\left((1+x^2)y\right)'=6x$, integrate both sides:

$$
(1+x^2)y=3x^2+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1+x^2>0$, divide to obtain:

$$
\boxed{
y=\frac{3x^2+C}{1+x^2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
On $x>-1$, consider:

$$
y'+\frac{2}{x+1}y=3(x+1),
\qquad
y(0)=\frac74.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The integrating factor is:

$$
\begin{aligned}
\mu(x)
&=e^{\int \frac{2}{x+1}\,dx} \\
&=e^{2\ln(x+1)} \\
&=(x+1)^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $(x+1)^2$:

$$
(x+1)^2y'+2(x+1)y=3(x+1)^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The left side is the derivative of $(x+1)^2y$:

$$
\left((x+1)^2y\right)'=3(x+1)^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$\left((x+1)^2y\right)'=3(x+1)^3$, integrate with respect to $x$:

$$
(x+1)^2y
=
\frac34(x+1)^4+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $(x+1)^2$:

$$
y=\frac34(x+1)^2+\frac{C}{(x+1)^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x=0$ and $y(0)=7/4$:

$$
\frac74=\frac34+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $3/4$:

$$
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y(x)=\frac34(x+1)^2+\frac{1}{(x+1)^2},
\qquad x\in(-1,\infty)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Use the proposed function:

$$
y=2+5e^{-x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=-20x^3e^{-x^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
z'+5z=20,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the equilibrium is found by setting $z'=0$:

$$
5z_*=20,
\qquad
z_*=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution family is:

$$
z=4+Ce^{-5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $z(0)=1$:

$$
1=4+C,
\qquad
C=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{z(t)=4-3e^{-5t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $e^{-5t}\to0$ as $t\to\infty$:

$$
z(t)\longrightarrow4.
$$

Also $z'=15e^{-5t}>0$, so the solution approaches $4$ from below.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
On $x>0$, start from:

$$
y'-\frac{2}{x}y=x^2y^4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For nonzero branches, use:

$$
v=y^{1-n}=y^{-3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general Bernoulli transformation is:

$$
v'+(1-n)p(x)v=(1-n)q(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $1-n=-3$, $p(x)=-2/x$, and $q(x)=x^2$:

$$
v'+(-3)\left(-\frac2x\right)v=(-3)x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify
$v'+(-3)(-2/x)v=(-3)x^2$:

$$
\boxed{
v'+\frac6xv=-3x^2
}.
$$

This is linear in $v$. The problem asked only for the transformation, so no
further solution is required.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
First test $y=0$ in:

$$
y'+t^2y=3t^2y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both sides are zero, so:

$$
y=0
$$

is one solution.

```{=latex}
\Needspace{10\baselineskip}
```
For nonzero solutions, let:

$$
v=y^{-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the substitution:

$$
v'=-y^{-2}y'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the original equation by $y^{-2}$:

$$
y^{-2}y'+t^2y^{-1}=3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y^{-2}y'=-v'$ and $y^{-1}=v$:

$$
-v'+t^2v=3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $-1$:

$$
v'-t^2v=-3t^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its integrating factor is:

$$
\mu=e^{-t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiplication produces:

$$
\left(e^{-t^3/3}v\right)'
=
-3t^2e^{-t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrating gives:

$$
e^{-t^3/3}v
=
3e^{-t^3/3}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $e^{t^3/3}$:

$$
v=3+Ce^{t^3/3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $v=1/y$:

$$
\boxed{
y=\frac{1}{3+Ce^{t^3/3}}
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The nonzero family
$y=1/(3+Ce^{t^3/3})$
is valid on intervals where its denominator is nonzero. It must be listed
together with the separate solution:

$$
\boxed{y=0}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The equation is:

$$
x y'+(x+1)y=e^x,
\qquad x>0.
$$

The student's factor was calculated before normalising the equation.

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $x$:

$$
y'+\left(1+\frac1x\right)y=\frac{e^x}{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The correct coefficient is:

$$
p(x)=1+\frac1x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the normalised equation
$y'+(1+1/x)y=e^x/x$, the correct integrating factor is:

$$
\boxed{\mu(x)=xe^x}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y'+2xy=\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $p(x)=2x$, so:

$$
\mu(x)=e^{\int2x\,dx}=e^{x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $e^{x^2}$:

$$
e^{x^2}y'+2xe^{x^2}y=e^{x^2}\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the right side to the left and replace $y'$ by $dy/dx$:

$$
e^{x^2}\frac{dy}{dx}
+2xe^{x^2}y
-e^{x^2}\cos x
=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $dx$:

$$
\left(2xe^{x^2}y-e^{x^2}\cos x\right)\,dx
+e^{x^2}\,dy
=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Identify:

$$
M(x,y)=2xe^{x^2}y-e^{x^2}\cos x,
\qquad
N(x,y)=e^{x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $N=e^{x^2}$ with respect to $x$:

$$
\begin{aligned}
N_x
&=\frac{d}{dx}e^{x^2} \\
&=2xe^{x^2}.
\end{aligned}
$$

Since $M_y=N_x$, the multiplied differential form is exact on the plane.

```{=latex}
\Needspace{12\baselineskip}
```
### Final Takeaway {#final-takeaway-61}

A first-order linear equation is solved by deliberately creating a product
derivative.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's final lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> do not treat the integrating factor as a formula to remember in isolation;
> treat it as the function that makes the product rule fit the equation.
