```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 4}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Separable First-Order Equations}
```
# Chapter 4 - Separable First-Order Equations

This chapter turns the separable classification from Chapter 3 into a complete
solution method.

A separable equation allows the dependence on the independent variable and
the unknown function to be disentangled. Once that structure is exposed, the
differential equation becomes an integration problem.

We will learn how to:

-   recognise and separate the variables safely
-   understand separation through the chain rule
-   retain equilibrium solutions that division may remove
-   solve initial-value problems with constants or definite integrals
-   distinguish implicit and explicit answers
-   choose the correct branch and interval of validity
-   reduce first-order homogeneous equations to separable equations
-   verify a result after all algebraic rearrangements are complete

The central warning is just as important as the method:

> separation is powerful because it uses division, and division is exactly
> where solutions and domain restrictions can be lost.

```{=latex}
\Needspace{12\baselineskip}
```
## Why Separation Works {#block-1-why-separation-works}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to understand separation as a consequence of the chain rule, not
as a mysterious movement of symbols.

This viewpoint makes the method easier to remember and safer to use.

```{=latex}
\Needspace{12\baselineskip}
```
### The Separable Pattern {#the-separable-pattern-2}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation is separable when it can be written as:

$$
\boxed{y'=g(x)h(y)}
$$

Here:

-   $x$ is the independent variable
-   $y=y(x)$ is the unknown function
-   $g(x)$ depends only on $x$
-   $h(y)$ depends only on $y$

```{=latex}
\Needspace{10\baselineskip}
```
Where $h(y)\neq 0$, divide by $h(y)$:

$$
\frac{1}{h(y)}\frac{dy}{dx}=g(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then write:

$$
\boxed{\frac{1}{h(y)}\,dy=g(x)\,dx}
$$

The left side depends only on $y$, and the right side depends only on $x$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Chain-Rule Explanation {#the-chain-rule-explanation-3}

```{=latex}
\Needspace{10\baselineskip}
```
Choose an antiderivative $H$ satisfying:

$$
H'(y)=\frac{1}{h(y)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
By the chain rule:

$$
\frac{d}{dx}H(y(x))
=
H'(y(x))y'(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $H'(y)=1/h(y)$ into the chain-rule expression:

$$
\frac{d}{dx}H(y(x))
=
\frac{1}{h(y)}y'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using the differential equation $y'=g(x)h(y)$ gives:

$$
\frac{d}{dx}H(y(x))=g(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $G'(x)=g(x)$, integrate with respect to $x$:

$$
H(y(x))=G(x)+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently:

$$
\boxed{\int\frac{1}{h(y)}\,dy
=
\int g(x)\,dx+C}
$$

The key intuition:

> separation searches for a new quantity $H(y(x))$ whose derivative depends
> only on $x$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Differential-Form Version {#the-differential-form-version-4}

```{=latex}
\Needspace{10\baselineskip}
```
A separable equation may instead be presented as:

$$
A(x)\,dx+B(y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate each one-variable term:

$$
\int A(x)\,dx+\int B(y)\,dy=C
$$

This form is already separated. No additional division is required.

```{=latex}
\Needspace{10\baselineskip}
```
The two common descriptions are related. From:

$$
y'=g(x)h(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
we can write, where $h(y)\neq 0$:

$$
-g(x)\,dx+\frac{1}{h(y)}\,dy=0
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A First Worked Example {#a-first-worked-example-5}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=2xe^{-y}
$$

#### Step 1: Identify the product

```{=latex}
\Needspace{10\baselineskip}
```
The right side is:

$$
g(x)h(y)=2x\,e^{-y}
$$

#### Step 2: Separate

```{=latex}
\Needspace{10\baselineskip}
```
Write $y'=dy/dx$ in the original equation:

$$
\frac{dy}{dx}=2xe^{-y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply both sides by $e^y\,dx$. On the right, $e^ye^{-y}=1$, so:

$$
e^y\,dy=2x\,dx
$$

#### Step 3: Integrate

$$
\int e^y\,dy=\int 2x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
e^y=x^2+C
$$

#### Step 4: Solve explicitly where possible

```{=latex}
\Needspace{10\baselineskip}
```
Take the natural logarithm:

$$
\boxed{y=\ln(x^2+C)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
This explicit form requires:

$$
x^2+C>0
$$

#### Step 5: Verify

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y'=\frac{2x}{x^2+C}
$$

```{=latex}
\Needspace{10\baselineskip}
```
From the proposed solution:

$$
e^{-y}=\frac{1}{x^2+C}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
2xe^{-y}=\frac{2x}{x^2+C}=y'
$$

The equation is satisfied on every interval where $x^2+C>0$.

```{=latex}
\Needspace{12\baselineskip}
```
### One Constant Is Enough {#one-constant-is-enough-6}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose separate integration produces:

$$
H(y)+C_1=G(x)+C_2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
H(y)=G(x)+(C_2-C_1)
$$

```{=latex}
\Needspace{10\baselineskip}
```
The difference of two arbitrary constants is another arbitrary constant.
Write:

$$
C=C_2-C_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and obtain:

$$
H(y)=G(x)+C
$$

There is no need to carry two unrelated integration constants through the
calculation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=g(x)h(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
the non-equilibrium part of the solution satisfies:

$$
\int\frac{1}{h(y)}\,dy
=
\int g(x)\,dx+C
$$

This formula follows from the chain rule. It is valid on regions where the
division by $h(y)$ is permitted.

```{=latex}
\Needspace{12\baselineskip}
```
## A Reliable Solution Workflow {#block-2-a-reliable-solution-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to build a method that works consistently across straightforward
and disguised separable equations.

```{=latex}
\Needspace{12\baselineskip}
```
### The Seven-Step Method {#the-seven-step-method-9}

Use this workflow.

#### Step 1: Isolate the derivative if useful

```{=latex}
\Needspace{10\baselineskip}
```
Try to expose:

$$
y'=g(x)h(y)
$$

#### Step 2: Find equilibrium candidates

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
h(y)=0
$$

Each root may give a constant solution.

#### Step 3: State every division restriction

Before dividing by $h(y)$ or another expression, record where it vanishes.

#### Step 4: Separate the variables

Write one side using only $y$ and $dy$, and the other using only $x$ and
$dx$.

#### Step 5: Integrate both sides

Use one arbitrary constant.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply conditions and choose a branch

If an initial value is given, it determines the constant and may determine a
sign or inverse-function branch.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Verify and state the interval

Substitute into the original equation, not merely the separated equation.
State an interval on which the formula and differential equation are both
defined.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: A Solution That Stays Implicit {#example-a-solution-that-stays-implicit-10}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
(1+y^2)y'=2x-1
$$

#### Separate

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y'$ by $dy/dx$:

$$
(1+y^2)\frac{dy}{dx}=2x-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then multiply by $dx$:

$$
(1+y^2)\,dy=(2x-1)\,dx
$$

#### Integrate

$$
\int(1+y^2)\,dy
=
\int(2x-1)\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating these two antiderivatives gives:

$$
y+\frac{y^3}{3}=x^2-x+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
The implicit solution is:

$$
\boxed{y+\frac{y^3}{3}=x^2-x+C}
$$

There is no mathematical requirement to force this cubic relation into a
long explicit formula.

```{=latex}
\Needspace{10\baselineskip}
```
In fact, the function:

$$
L(y)=y+\frac{y^3}{3}
$$

```{=latex}
\Needspace{10\baselineskip}
```
has derivative:

$$
L'(y)=1+y^2>0
$$

so $L$ is strictly increasing and the implicit equation determines one real
value of $y$ for every real right-hand side.

What this tells us:

> an implicit answer can describe the solution completely, even when solving
> algebraically for $y$ would be inconvenient.

```{=latex}
\Needspace{12\baselineskip}
```
### Verification By Implicit Differentiation {#verification-by-implicit-differentiation-11}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y+\frac{y^3}{3}=x^2-x+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate both sides with respect to $x$:

$$
y'+y^2y'=2x-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $y'$:

$$
(1+y^2)y'=2x-1
$$

This is the original equation.

The constant disappears under differentiation, as expected.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: Separation Hidden By A Quotient {#example-separation-hidden-by-a-quotient-12}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=\frac{1+x^2}{2+\cos y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The denominator depends only on $y$, so multiply it across:

$$
(2+\cos y)y'=1+x^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use $y'\,dx=dy$:

$$
(2+\cos y)\,dy=(1+x^2)\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int(2+\cos y)\,dy
=
\int(1+x^2)\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating both antiderivatives gives:

$$
2y+\sin y=x+\frac{x^3}{3}+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{2y+\sin y=x+\frac{x^3}{3}+C}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
2+\cos y\geq 1
$$

the original denominator never vanishes for real $y$. The left side is also
strictly increasing as a function of $y$, so the implicit relation selects a
unique real $y$ for each real $x$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Nonseparable Near Miss {#a-nonseparable-near-miss-13}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=x^2+y^2
$$

The right side is a sum of an $x$-term and a $y$-term.

```{=latex}
\Needspace{10\baselineskip}
```
For the near miss $y'=x^2+y^2$, writing:

$$
\frac{dy}{x^2+y^2}=dx
$$

does not separate the variables because the left side still contains $x$ and
$y$.

```{=latex}
\Needspace{10\baselineskip}
```
By contrast:

$$
y'=x^2y^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
is separable because the right side is a product:

$$
y^{-2}\,dy=x^2\,dx
$$

The practical test is not whether $dy$ and $dx$ appear on different sides.
Each side must contain only its own variable.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-14}

Separate, integrate, apply conditions, choose a branch, verify, and state the
interval.

An implicit solution is often the natural final answer. Its validity can be
checked directly by implicit differentiation.

```{=latex}
\Needspace{12\baselineskip}
```
## Equilibrium Solutions And Lost Cases {#block-3-equilibrium-solutions-and-lost-cases}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-15}

The goal is to prevent division from silently removing constant solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### Find Zeros Before Dividing {#find-zeros-before-dividing-16}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=g(x)h(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the equation $y'=g(x)h(y)$, suppose $a$ satisfies:

$$
h(a)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $h(a)=0$, consider the constant function:

$$
y(x)=a
$$

```{=latex}
\Needspace{10\baselineskip}
```
This function has:

$$
y'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the constant function $y=a$, the right side is:

$$
g(x)h(a)=0
$$

Therefore $y=a$ is a solution wherever the equation is defined.

But separation divides by $h(y)$, so this solution disappears from the
separated equation.

The safe order is:

1.  solve $h(y)=0$
2.  record the constant solutions
3.  divide only for the remaining nonconstant branches

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example With Two Equilibria {#worked-example-with-two-equilibria-17}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=e^{-x}(y+1)(3-y)
$$

#### Step 1: Find equilibrium solutions

```{=latex}
\Needspace{10\baselineskip}
```
The $y$-factor vanishes when:

$$
y=-1
\qquad\text{or}\qquad
y=3
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus two constant solutions are:

$$
\boxed{y=-1}
\qquad\text{and}\qquad
\boxed{y=3}
$$

#### Step 2: Separate the nonconstant branches

```{=latex}
\Needspace{10\baselineskip}
```
For $y\neq -1,3$:

$$
\frac{1}{(y+1)(3-y)}\,dy=e^{-x}\,dx
$$

#### Step 3: Decompose the left side

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
\frac{1}{(y+1)(3-y)}
=
\frac{A}{y+1}+\frac{B}{3-y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
1=A(3-y)+B(y+1)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $y=-1$. The term containing $B$ vanishes, leaving:

$$
1=A(4),
\qquad
A=\frac14
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $y=3$. The term containing $A$ vanishes, leaving:

$$
1=B(4),
\qquad
B=\frac14
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=B=1/4$ into the partial-fraction decomposition:

$$
\frac{1}{(y+1)(3-y)}
=
\frac{1}{4}\frac{1}{y+1}
+
\frac{1}{4}\frac{1}{3-y}
$$

#### Step 4: Integrate carefully

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the partial-fraction decomposition into the separated equation:

$$
\left(
\frac{1}{4}\frac{1}{y+1}
+
\frac{1}{4}\frac{1}{3-y}
\right)dy
=
e^{-x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides:

$$
\frac14\int\frac{1}{y+1}\,dy
+
\frac14\int\frac{1}{3-y}\,dy
=
\int e^{-x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because:

$$
\int\frac{1}{3-y}\,dy=-\ln|3-y|
$$

```{=latex}
\Needspace{10\baselineskip}
```
and $\int e^{-x}\,dx=-e^{-x}$, we obtain:

$$
\frac{1}{4}\ln|y+1|
-
\frac{1}{4}\ln|3-y|
=
-e^{-x}+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $4$:

$$
\ln|y+1|-\ln|3-y|=-4e^{-x}+C_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $C_1=4C$ is still an arbitrary constant. Combine the logarithms, then
rename $C_1$ as $C$:

$$
\boxed{\ln\left|\frac{y+1}{3-y}\right|
=
-4e^{-x}+C}
$$

This relation describes the nonconstant solutions. The two equilibrium
solutions must be listed alongside it.

```{=latex}
\Needspace{12\baselineskip}
```
### Can A Solution Cross An Equilibrium? {#can-a-solution-cross-an-equilibrium-18}

For many smooth equations, a solution cannot cross an equilibrium curve.

```{=latex}
\Needspace{10\baselineskip}
```
For the equation just considered,

$$
y'=e^{-x}(y+1)(3-y),
$$

```{=latex}
\Needspace{10\baselineskip}
```
define the right-side function by:

$$
f(x,y)=e^{-x}(y+1)(3-y)
$$

This function has a continuous derivative with respect to $y$. Local uniqueness therefore
holds.

If a nonconstant solution reached $y=3$ at some point, it would share an
initial value with the constant solution $y=3$. Uniqueness would force the two
solutions to agree locally, contradicting the supposed crossing.

So the horizontal equilibrium levels separate the solution family into
regions.

> equilibrium solutions are not merely discarded edge cases; they can form
> barriers that organise the behaviour of all other solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### When Uniqueness Fails {#when-uniqueness-fails-19}

Separable equations can also reveal why hypotheses matter.

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=3y^{2/3}
$$

The constant function $y=0$ is a solution.

```{=latex}
\Needspace{10\baselineskip}
```
For $y\neq 0$, separate:

$$
y^{-2/3}\,dy=3\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrating gives:

$$
3y^{1/3}=3x+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $3$:

$$
y^{1/3}=x+\frac{C}{3}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $C/3$ is another arbitrary constant, write it as $-C_1$:

$$
y^{1/3}=x-C_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cube both sides:

$$
y=(x-C_1)^3
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now fix a number $a$ and define:

$$
y(x)=
\begin{cases}
0, & x\leq a,\\
(x-a)^3, & x>a.
\end{cases}
$$

This function is differentiable at $x=a$ and satisfies the equation. It waits
at the equilibrium and then leaves it.

The derivative of $3y^{2/3}$ with respect to $y$ is not well behaved at
$y=0$, so the usual local uniqueness condition fails there.

The useful lesson is:

> constant solutions must be checked directly, and uniqueness should not be
> assumed when the right side is not sufficiently regular in the dependent
> variable.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-20}

```{=latex}
\Needspace{10\baselineskip}
```
Zeros of $h(y)$ produce equilibrium candidates for:

$$
y'=g(x)h(y)
$$

Record them before dividing by $h(y)$. Under ordinary uniqueness conditions,
equilibrium curves cannot be crossed. Without those conditions, several
solutions may pass through the same initial point.

```{=latex}
\Needspace{12\baselineskip}
```
## Initial-Value Problems {#block-4-initial-value-problems}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-21}

The goal is to use an initial condition efficiently and to understand how it
selects one member of a solution family.

```{=latex}
\Needspace{12\baselineskip}
```
### The Constant-Then-Condition Method {#the-constant-then-condition-method-22}

```{=latex}
\Needspace{10\baselineskip}
```
For an initial-value problem:

$$
y'=g(x)h(y),
\qquad
y(x_0)=y_0
$$

one approach is:

1.  separate and integrate
2.  obtain $H(y)=G(x)+C$
3.  substitute $(x_0,y_0)$
4.  solve for $C$

This is familiar and usually effective.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definite-Integral Form {#the-definite-integral-form-23}

There is an alternative that builds the initial condition into the equation.

```{=latex}
\Needspace{10\baselineskip}
```
Assume the solution remains in a region where $h(y)\neq 0$. From:

$$
\frac{1}{h(y)}\,dy=g(x)\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
integrate from the initial point to the current point:

$$
\boxed{
\int_{y_0}^{y(x)}\frac{1}{h(u)}\,du
=
\int_{x_0}^{x}g(s)\,ds
}
$$

The symbols $u$ and $s$ are dummy integration variables. They prevent the
upper limits $y(x)$ and $x$ from being confused with the variables inside the
integrals.

At $x=x_0$, both integrals are zero, so the initial condition is automatically
encoded.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Initial-Value Problem {#worked-initial-value-problem-24}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=\frac{1+x^2}{2+\cos y},
\qquad
y(0)=\frac{\pi}{2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the equation by $(2+\cos y)\,dx$. Since this factor is always
positive, the operation introduces no excluded real values:

$$
(2+\cos y)\,dy=(1+x^2)\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use definite integrals:

$$
\int_{\pi/2}^{y(x)}(2+\cos u)\,du
=
\int_0^x(1+s^2)\,ds
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the left side:

$$
\begin{aligned}
\int_{\pi/2}^{y}(2+\cos u)\,du
&=
\left[2u+\sin u\right]_{\pi/2}^{y}\\
&=
2y+\sin y-(\pi+1)
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the right side:

$$
\int_0^x(1+s^2)\,ds
=
x+\frac{x^3}{3}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the solution is determined implicitly by:

$$
\boxed{
2y+\sin y-(\pi+1)
=
x+\frac{x^3}{3}
}
$$

Check the initial condition by setting $x=0$ and $y=\pi/2$. Both sides are
zero.

Because $2+\cos y$ is always positive, the left side is strictly increasing
in $y$. The implicit relation therefore selects one real branch without any
sign ambiguity.

```{=latex}
\Needspace{12\baselineskip}
```
### An Initial Value At An Equilibrium {#an-initial-value-at-an-equilibrium-25}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=x^2y(2-y),
\qquad
y(1)=0
$$

If we immediately divide by $y(2-y)$, the initial value $y=0$ is excluded.

Instead, test the equilibrium first.

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y(x)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have:

$$
y'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
x^2y(2-y)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial condition is also satisfied. Thus:

$$
\boxed{y(x)=0}
$$

is the solution of the initial-value problem. Because the right side is
smooth in $y$, local uniqueness rules out a second branch through $(1,0)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Branch Selection {#branch-selection-26}

An implicit relation can represent more than one branch.

```{=latex}
\Needspace{10\baselineskip}
```
Suppose integration gives:

$$
(y-1)^2=R(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving explicitly gives:

$$
y=1+\sqrt{R(x)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
or:

$$
y=1-\sqrt{R(x)}
$$

An initial condition determines which sign is compatible with $y_0$.

The sign is not a free choice at every point. A differentiable solution must
remain on a consistent branch until the equation or uniqueness conditions
allow otherwise.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-27}

```{=latex}
\Needspace{10\baselineskip}
```
An initial condition may be applied after indefinite integration or built in
through definite integrals:

$$
\int_{y_0}^{y(x)}\frac{du}{h(u)}
=
\int_{x_0}^{x}g(s)\,ds
$$

Check equilibrium initial values before dividing. Use the initial value to
select constants, signs, and branches.

```{=latex}
\Needspace{12\baselineskip}
```
## Domains, Singularities, And Maximal Intervals {#block-5-domains-singularities-and-maximal-intervals}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-28}

The goal is to treat a solution as a formula together with an interval on
which that formula actually solves the equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Why A Formula Is Not The Whole Answer {#why-a-formula-is-not-the-whole-answer-29}

A proposed solution may fail where:

-   the original differential equation is undefined
-   a denominator in the solution vanishes
-   a logarithm receives a nonpositive argument
-   an even root receives a negative argument
-   an inverse-function branch changes
-   the solution becomes unbounded

For an initial-value problem, we want the largest connected interval
containing the initial point on which the solution remains valid. This is the
**maximal interval of existence** for that branch.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: Finite-Time Blow-Up {#worked-example-finite-time-blow-up-30}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
u'=3su^2,
\qquad
u(0)=2
$$

#### Check the equilibrium

The value $u=0$ is a constant solution, but it does not satisfy the initial
condition.

#### Separate the nonzero branch

$$
u^{-2}\,du=3s\,ds
$$

#### Integrate

$$
-\frac{1}{u}=\frac{3}{2}s^2+C
$$

#### Apply the initial condition

```{=latex}
\Needspace{10\baselineskip}
```
At $s=0$ and $u=2$:

$$
-\frac{1}{2}=C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=-1/2$ into the integrated relation:

$$
-\frac{1}{u}=\frac{3}{2}s^2-\frac{1}{2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $u$:

$$
-\frac{1}{u}=\frac{3s^2-1}{2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $-1$:

$$
\frac{1}{u}=\frac{1-3s^2}{2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take reciprocals where $1-3s^2\neq 0$:

$$
\boxed{u(s)=\frac{2}{1-3s^2}}
$$

#### Find the maximal interval

```{=latex}
\Needspace{10\baselineskip}
```
The denominator vanishes when:

$$
1-3s^2=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
s=\pm\frac{1}{\sqrt{3}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The largest interval containing the initial point $s=0$ is:

$$
\boxed{
-\frac{1}{\sqrt{3}}<s<\frac{1}{\sqrt{3}}
}
$$

The differential equation itself is smooth everywhere, but this particular
solution becomes unbounded at finite values of $s$.

```{=latex}
\Needspace{12\baselineskip}
```
### Logarithms Carry Interval Information {#logarithms-carry-interval-information-31}

```{=latex}
\Needspace{10\baselineskip}
```
When integration produces:

$$
\ln|y-a|=G(x)+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
the absolute value indicates two possible regions:

$$
y>a
$$

```{=latex}
\Needspace{10\baselineskip}
```
or:

$$
y<a
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiating gives:

$$
|y-a|=e^{G(x)+C}=e^C e^{G(x)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $K=e^C$, so $K>0$:

$$
|y-a|=Ke^{G(x)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The absolute value permits either sign. Absorb that sign into a nonzero
constant $C_1$:

$$
y-a=C_1e^{G(x)}
$$

The case $C_1=0$ corresponds to the equilibrium $y=a$ if that solution is
valid. Whether it was present in the separated derivation must be checked
against the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Inverse Trigonometric Functions Need Branch Care {#inverse-trigonometric-functions-need-branch-care-32}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
q'=(1+q^2)\cos x,
\qquad
q(0)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $1+q^2$ and use $q'\,dx=dq$ to separate:

$$
\frac{1}{1+q^2}\,dq=\cos x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\arctan q=\sin x+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the initial condition to the implicit relation:

$$
\arctan(0)=\sin(0)+C,
\qquad
0=0+C,
\qquad
C=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=0$ and apply tangent to both sides:

$$
\boxed{q(x)=\tan(\sin x)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the proposed solution $q(x)=\tan(\sin x)$, since:

$$
-1\leq\sin x\leq 1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
[-1,1]\subset\left(-\frac{\pi}{2},\frac{\pi}{2}\right)
$$

the tangent never reaches a pole. This solution is defined for every real
$x$.

The interval conclusion comes from examining the range of the inner function,
not merely from writing down a tangent.

```{=latex}
\Needspace{12\baselineskip}
```
### Implicit Solutions Also Have Domains {#implicit-solutions-also-have-domains-33}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a solution is left as:

$$
F(x,y)=C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Implicit differentiation gives:

$$
F_x+F_y y'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
y'=-\frac{F_x}{F_y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The curve can be represented locally as a differentiable function $y(x)$
only where:

$$
F_y\neq 0
$$

Thus an implicit formula does not eliminate domain questions. It changes the
way those questions are inspected.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-34}

A solution consists of a formula or implicit relation together with a valid
interval.

For an initial-value problem, choose the largest connected interval containing
the initial point that avoids singularities, invalid branches, and points
where the solution ceases to satisfy the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
## First-Order Homogeneous Equations Become Separable {#block-6-first-order-homogeneous-equations-become-separable}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-35}

The goal is to solve the scale-homogeneous equations classified in Chapter 3
by converting them into separable equations.

```{=latex}
\Needspace{12\baselineskip}
```
### The Substitution {#the-substitution-36}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
y'=H\!\left(\frac{y}{x}\right)
$$

on a region where $x\neq 0$.

```{=latex}
\Needspace{10\baselineskip}
```
For $y'=H(y/x)$, set:

$$
v=\frac{y}{x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
y=xv
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $v=v(x)$ and $y=xv$, differentiate with the product rule:

$$
y'=v+xv'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the equation:

$$
v+xv'=H(v)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $v$ from both sides:

$$
xv'=H(v)-v
$$

```{=latex}
\Needspace{10\baselineskip}
```
Where $H(v)-v\neq 0$, separate:

$$
\boxed{
\frac{1}{H(v)-v}\,dv=\frac{1}{x}\,dx
}
$$

After integration, replace $v$ by $y/x$.

```{=latex}
\Needspace{12\baselineskip}
```
### Special Ratio Solutions {#special-ratio-solutions-37}

```{=latex}
\Needspace{10\baselineskip}
```
Before dividing by $H(v)-v$, solve:

$$
H(v)=v
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $v=m$ is a root of $H(v)=v$, then $v'=0$ and:

$$
v=\frac{y}{x}=m
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $v=y/x=m$, multiply by $x$ to obtain the straight-line candidate:

$$
\boxed{y=mx}
$$

These are the homogeneous-equation analogue of equilibrium solutions. They
can be lost during separation in the transformed variable.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Homogeneous Example {#worked-homogeneous-example-38}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=\frac{y}{x}+1+\left(\frac{y}{x}\right)^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
The slope depends only on $y/x$, so use:

$$
v=\frac{y}{x},
\qquad
y'=v+xv'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
v+xv'=v+1+v^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $v$ from both sides:

$$
xv'=1+v^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $xv'=1+v^2$, divide by $1+v^2$ and by $x$ to separate:

$$
\frac{1}{1+v^2}\,dv=\frac{1}{x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the separated equation:

$$
\int\frac{1}{1+v^2}\,dv
=
\int\frac{1}{x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating the antiderivatives gives:

$$
\arctan v=\ln|x|+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply tangent to both sides on a branch where the expression is defined:

$$
v=\tan(\ln|x|+C)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Back-substitute $v=y/x$:

$$
\frac{y}{x}=\tan(\ln|x|+C)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $x$:

$$
\boxed{y=x\tan(\ln|x|+C)}
$$

This family is valid on intervals that:

-   do not cross $x=0$
-   do not contain a point where $\ln|x|+C$ is an odd multiple of $\pi/2$

```{=latex}
\Needspace{10\baselineskip}
```
There are no real special-ratio solutions here because:

$$
1+v^2\neq 0
$$

for real $v$.

```{=latex}
\Needspace{12\baselineskip}
```
### Homogeneous Differential Form {#homogeneous-differential-form-39}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $M$ and $N$ are homogeneous functions of the same degree $k$:

$$
M(\lambda x,\lambda y)=\lambda^kM(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
N(\lambda x,\lambda y)=\lambda^kN(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Where $N\neq 0$, the slope is:

$$
y'=-\frac{M(x,y)}{N(x,y)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Under common scaling, the factors $\lambda^k$ cancel:

$$
-\frac{M(\lambda x,\lambda y)}{N(\lambda x,\lambda y)}
=
-\frac{M(x,y)}{N(x,y)}
$$

Thus the slope is degree zero and can be expressed as a function of $y/x$ on
an appropriate region.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-40}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=H(y/x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y'=H(y/x)$, use:

$$
y=xv,
\qquad
y'=v+xv'
$$

The transformed equation is separable. Check $H(v)=v$ before dividing, then
back-substitute $v=y/x$ and respect the restriction $x\neq 0$.

```{=latex}
\Needspace{12\baselineskip}
```
## Choosing The Reciprocal Homogeneous Substitution {#block-7-choosing-the-reciprocal-homogeneous-substitution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-41}

The goal is to recognise when treating $x$ as a function of $y$ makes a
homogeneous equation simpler.

```{=latex}
\Needspace{12\baselineskip}
```
### The Reciprocal View {#the-reciprocal-view-42}

```{=latex}
\Needspace{10\baselineskip}
```
If $y'\neq 0$, then locally:

$$
\frac{dx}{dy}=\frac{1}{dy/dx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For an equation whose reciprocal slope depends naturally on $x/y$, set:

$$
u=\frac{x}{y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
x=yu
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $y$:

$$
\frac{dx}{dy}=u+y\frac{du}{dy}
$$

The resulting equation may separate more cleanly than the $v=y/x$
substitution.

This is an alternative route, not a new class of equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Reciprocal Example {#worked-reciprocal-example-43}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\frac{dy}{dx}=\frac{y}{2y-x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
On a branch where taking the reciprocal is valid, invert the original slope:

$$
\frac{dx}{dy}=\frac{2y-x}{y}=2-\frac{x}{y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
u=\frac{x}{y},
\qquad
x=yu
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\frac{dx}{dy}=u+y\frac{du}{dy}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
u+y\frac{du}{dy}=2-u
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y\frac{du}{dy}=2(1-u)
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u\neq 1$, separate:

$$
\frac{1}{1-u}\,du=2\frac{1}{y}\,dy
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the separated equation:

$$
\int\frac{1}{1-u}\,du
=
2\int\frac{1}{y}\,dy
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating the antiderivatives gives:

$$
-\ln|1-u|=2\ln|y|+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$-\ln|1-u|=2\ln|y|+C$, move the logarithmic term involving $y$ to the
left and absorb the changed sign of the arbitrary constant into $C_1$:

$$
\ln|1-u|+2\ln|y|=C_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $2\ln|y|=\ln(y^2)$ for $y\neq 0$, combine the logarithms:

$$
\ln\left|(1-u)y^2\right|=C_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiate:

$$
\left|(1-u)y^2\right|=e^{C_1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Absorb the possible sign and the positive factor $e^{C_1}$ into one nonzero
constant $C$. This gives:

$$
(1-u)y^2=C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Back-substitute $u=x/y$:

$$
\left(1-\frac{x}{y}\right)y^2=C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute $y^2$ using $y\neq 0$ on the transformed branch:

$$
y^2-\frac{x}{y}y^2=C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $(x/y)y^2=xy$, this becomes:

$$
\boxed{y^2-xy=C}
$$

#### Check the excluded cases

```{=latex}
\Needspace{10\baselineskip}
```
The substitution $u=x/y$ assumed $y\neq 0$. In the original equation,
$y=0$ gives $y'=0$ wherever $x\neq 0$, so:

$$
\boxed{y=0}
$$

is a solution on intervals that do not contain the origin.

```{=latex}
\Needspace{10\baselineskip}
```
The value $u=1$ corresponds to:

$$
x=y
$$

or $y=x$. This is also a solution wherever $x\neq 0$.

```{=latex}
\Needspace{10\baselineskip}
```
When $C=0$, the implicit relation factors as:

$$
y(y-x)=0
$$

so it contains both lines. They should be understood as separate solution
branches rather than one branch switching lines at the origin, where the
original equation is undefined.

#### Verify

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
2yy'-(y+xy')=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
(2y-x)y'=y
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y'=\frac{y}{2y-x}
$$

where the denominator is nonzero.

```{=latex}
\Needspace{12\baselineskip}
```
### How To Choose {#how-to-choose-44}

Prefer $v=y/x$ when the original slope is already simple as a function of
$y/x$.

Consider $u=x/y$ when:

-   the reciprocal slope is simpler
-   the equation naturally contains repeated $x/y$ expressions
-   solving for $dx/dy$ removes a complicated quotient

Both substitutions encode the same scale-invariant geometry. The best choice
is the one that makes the transformed equation easiest to separate and
integrate.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-45}

The standard homogeneous substitution is $y=xv$, but the reciprocal form
$x=yu$ may be more efficient.

Whichever route is used, differentiate the product correctly, check any
divided cases, back-substitute, and verify in the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
## A Complete Problem-Solving Checklist {#block-8-a-complete-problem-solving-checklist}

```{=latex}
\Needspace{12\baselineskip}
```
### Before Calculating {#before-calculating-46}

Ask:

1.  Is the equation truly separable?
2.  Which factors depend only on the independent variable?
3.  Which factors depend only on the unknown function?
4.  Which expressions could become zero?
5.  Are there equilibrium or special-ratio solutions?

```{=latex}
\Needspace{12\baselineskip}
```
### During The Calculation {#during-the-calculation-47}

Check that:

1.  each side contains only one variable after separation
2.  every division restriction is recorded
3.  antiderivatives include the correct signs and absolute values
4.  only one arbitrary constant is retained
5.  substitutions are differentiated with the chain or product rule

```{=latex}
\Needspace{12\baselineskip}
```
### After Integrating {#after-integrating-48}

Decide:

1.  whether implicit form is already complete
2.  whether solving explicitly introduces several branches
3.  which branch satisfies the initial condition
4.  where the formula and original equation are defined
5.  what the maximal interval containing the initial point is
6.  whether all excluded constant or ratio solutions have been restored
7.  whether differentiation reproduces the original equation

```{=latex}
\Needspace{12\baselineskip}
```
### When Exact Algebra Is Not Available {#when-exact-algebra-is-not-available-49}

```{=latex}
\Needspace{10\baselineskip}
```
Separation may lead to an integral with no elementary antiderivative:

$$
\int\frac{1}{h(y)}\,dy
=
\int g(x)\,dx+C
$$

This does not make the method useless.

The integral relation may still:

-   define the solution implicitly
-   support numerical quadrature
-   reveal monotonicity
-   identify equilibria and barriers
-   provide a starting point for approximation

Similarly, an antiderivative may be available while algebraic inversion is
not. Exact mathematics does not require every final answer to be written as
$y=$ followed by elementary functions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-50}

The separation method is more than integrating two expressions. A complete
solution accounts for excluded cases, constants, branches, domains, and
verification.

> the safest separable solution is the one whose algebra, missing cases, and
> interval have all been checked against the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
## Original Practice Set {#block-9-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-51}

#### Problem 1: Recognise The Structure

```{=latex}
\Needspace{10\baselineskip}
```
Determine which equations are separable as written or after straightforward
algebra.

$$
\begin{aligned}
\text{(a)}\quad &y'=\frac{1+x^2}{2+y^2},\\
\text{(b)}\quad &y'=x+y,\\
\text{(c)}\quad &y'=x(y+1),\\
\text{(d)}\quad &y'=\sin(xy).
\end{aligned}
$$

#### Problem 2: Find An Implicit Family

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
(1+y^2)y'=4x
$$

and leave the answer in a natural implicit form.

#### Problem 3: Find An Explicit Family

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=-2te^{-y}
$$

and state the restriction required by the explicit logarithmic form.

#### Problem 4: Retain Every Equilibrium

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=(1+x^2)y(y+4)
$$

identify all constant solutions and write the separated equation for the
remaining branches. You do not need to complete the partial-fraction
integration.

#### Problem 5: Solve An Initial-Value Problem Implicitly

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
(1+q^2)q'=e^x,
\qquad
q(0)=0
$$

in implicit form.

#### Problem 6: Use Definite Integrals

```{=latex}
\Needspace{10\baselineskip}
```
Write a definite-integral equation for the solution of:

$$
r'=(2+t^2)(1+r^2),
\qquad
r(1)=-1
$$

Do not evaluate the integrals.

#### Problem 7: Find A Maximal Interval

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
u'=2xu^2,
\qquad
u(0)=1
$$

and find the maximal interval containing $0$.

#### Problem 8: Verify An Implicit Solution

```{=latex}
\Needspace{10\baselineskip}
```
Show by implicit differentiation that the relation
$e^y+y=x^3+C$ satisfies the differential equation:

$$
(e^y+1)y'=3x^2
$$

#### Problem 9: Detect A Homogeneous Equation

```{=latex}
\Needspace{10\baselineskip}
```
Determine whether:

$$
y'=2+\frac{y}{x}-\left(\frac{y}{x}\right)^2
$$

is first-order homogeneous, and state the substitution that reduces it to a
separable equation.

#### Problem 10: Solve A Homogeneous Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'=\frac{y}{x}+\left(\frac{y}{x}\right)^2
$$

including any special-ratio solution lost during separation.

#### Problem 11: Use The Reciprocal Substitution

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\frac{dy}{dx}=\frac{y}{3y-2x},
$$

rewrite the equation using $u=x/y$ and obtain the transformed differential
equation for $u(y)$. You do not need to integrate it.

#### Problem 12: Diagnose An Incomplete Answer

```{=latex}
\Needspace{10\baselineskip}
```
For $y'=x(y-2)$, a calculation ends with:

$$
\ln|y-2|=\frac{x^2}{2}+C
$$

What solution has been omitted? How can the nonconstant family be rewritten
so that the omitted solution is naturally restored?

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Answers {#practice-answers-52}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Equation (a) is separable:

$$
(2+y^2)\,dy=(1+x^2)\,dx
$$

Equation (b) is not separable by the standard test because $x+y$ is an
additive mixture of the variables.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (c) is separable:

$$
\frac{1}{y+1}\,dy=x\,dx
$$

for $y\neq -1$. The constant solution $y=-1$ must be checked separately.

For $y=-1$, the left side is $y'=0$, while the original right side is
$x(-1+1)=0$. Hence $y=-1$ is indeed a solution.

Equation (d) is not ordinarily separable because $x$ and $y$ occur together
inside one sine function.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y'$ by $dy/dx$ in the given equation:

$$
(1+y^2)\frac{dy}{dx}=4x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $(1+y^2)dy/dx=4x$, multiply by $dx$ to separate:

$$
(1+y^2)\,dy=4x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int(1+y^2)\,dy=\int4x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating $\int(1+y^2)\,dy$ and $\int4x\,dx$ gives:

$$
\boxed{y+\frac{y^3}{3}=2x^2+C}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'=-2te^{-y}$, write $y'=dy/dt$ and multiply by
$e^y\,dt$:

$$
e^y\,dy=-2t\,dt
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int e^y\,dy=\int -2t\,dt
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^y=-t^2+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the natural logarithm of both sides. This requires $C-t^2>0$ and gives:

$$
\boxed{y=\ln(C-t^2)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The logarithmic formula is valid on any interval satisfying:

$$
C-t^2>0
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The roots of the $y$-factor are:

$$
y=0
\qquad\text{and}\qquad
y=-4
$$

Both give constant solutions.

Indeed, for either $y=0$ or $y=-4$, we have $y'=0$ and
$(1+x^2)y(y+4)=0$, so the original equation becomes $0=0$.

```{=latex}
\Needspace{10\baselineskip}
```
For the remaining branches, $y\neq0,-4$. Divide the original equation by
$y(y+4)$ and multiply by $dx$:

$$
\boxed{
\frac{1}{y(y+4)}\,dy=(1+x^2)\,dx
}
$$

with $y\neq 0,-4$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Replace $q'$ by $dq/dx$ and multiply by $dx$:

$$
(1+q^2)\,dq=e^x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int(1+q^2)\,dq=\int e^x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating the two antiderivatives gives:

$$
q+\frac{q^3}{3}=e^x+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $q(0)=0$ to
$q+q^3/3=e^x+C$:

$$
0+\frac{0^3}{3}=e^0+C=1+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$ from both sides to obtain $C=-1$. Substituting this value into
the implicit family gives:

$$
\boxed{q+\frac{q^3}{3}=e^x-1}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Write $r'=dr/dt$ and divide by $1+r^2$. This division is always valid for
real $r$ because $1+r^2>0$:

$$
\frac{1}{1+r^2}\,dr=(2+t^2)\,dt
$$

```{=latex}
\Needspace{10\baselineskip}
```
The definite-integral equation is:

$$
\boxed{
\int_{-1}^{r(t)}\frac{1}{1+v^2}\,dv
=
\int_1^t(2+s^2)\,ds
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium $u=0$ does not satisfy the initial condition. For $u\neq 0$:

$$
u^{-2}\,du=2x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the separated equation:

$$
\int u^{-2}\,du=\int2x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluating $\int u^{-2}\,du$ and $\int2x\,dx$ gives:

$$
-\frac{1}{u}=x^2+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $u(0)=1$:

$$
-\frac{1}{1}=0^2+C,
\qquad
C=-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=-1$ into the implicit relation:

$$
-\frac{1}{u}=x^2-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $-1/u=x^2-1$, multiply by $-1$ and take reciprocals where
$1-x^2\neq0$:

$$
\frac{1}{u}=1-x^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{u=\frac{1}{1-x^2}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The singularities are at $x=\pm1$, so the maximal interval containing $0$
is:

$$
\boxed{-1<x<1}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
\frac{d}{dx}(e^y+y)
=
e^y y'+y'
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{d}{dx}(x^3+C)=3x^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
(e^y+1)y'=3x^2
$$

which is the required equation.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The right side depends only on $y/x$:

$$
H(v)=2+v-v^2
$$

so the equation is first-order homogeneous on a region with $x\neq 0$.

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\boxed{v=\frac{y}{x},\qquad y=xv}
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y'=v+xv'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y'=v+xv'$ and $y/x=v$ into the original equation:

$$
v+xv'=2+v-v^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $v$ from both sides:

$$
xv'=2-v^2
$$

which is separable.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
v=\frac{y}{x},
\qquad
y'=v+xv'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
v+xv'=v+v^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $v+xv'=v+v^2$, subtract $v$ from both sides:

$$
xv'=v^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
The special value $v=0$ gives:

$$
\frac{y}{x}=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The special value $v=0$ gave $y/x=0$. Since $x\neq0$ on the region under
consideration, this means:

$$
\boxed{y=0}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $v\neq 0$:

$$
v^{-2}\,dv=\frac{1}{x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int v^{-2}\,dv=\int\frac{1}{x}\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
-\frac{1}{v}=\ln|x|+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $-1$ and take reciprocals, requiring
$\ln|x|+C\neq0$:

$$
v=-\frac{1}{\ln|x|+C}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now replace $v$ by $y/x$:

$$
\frac{y}{x}=-\frac{1}{\ln|x|+C}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$y/x=-1/(\ln|x|+C)$, multiply both sides by $x$:

$$
\boxed{
y=-\frac{x}{\ln|x|+C}
}
$$

on intervals where $x\neq 0$ and $\ln|x|+C\neq 0$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Take the reciprocal:

$$
\frac{dx}{dy}=3-2\frac{x}{y}
$$

This reciprocal form is used on a branch where the required denominators are
nonzero. In particular, it excludes the line $y=0$ during this calculation.
Direct substitution into the original equation shows that $y=0$ is also a
solution on intervals where $x\neq0$. The problem asks only for the
transformed nonzero branch.

```{=latex}
\Needspace{10\baselineskip}
```
Set:

$$
u=\frac{x}{y},
\qquad
x=yu
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\frac{dx}{dy}=u+y\frac{du}{dy}
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
u+y\frac{du}{dy}=3-2u
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y\frac{du}{dy}=3(1-u)
}
$$

which is separable.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Division by $y-2$ omitted the equilibrium solution:

$$
\boxed{y=2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Start from the given nonconstant relation:

$$
\ln|y-2|=\frac{x^2}{2}+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiate both sides:

$$
|y-2|=e^{x^2/2+C}=e^C e^{x^2/2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $K=e^C>0$:

$$
|y-2|=Ke^{x^2/2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Absorb the sign permitted by the absolute value into a nonzero constant
$A$:

$$
y-2=Ae^{x^2/2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
so the nonconstant family is:

$$
y=2+Ae^{x^2/2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Allowing $A=0$ restores the equilibrium, giving the unified family:

$$
\boxed{y=2+Ae^{x^2/2}}
$$

for arbitrary real $A$.

```{=latex}
\Needspace{12\baselineskip}
```
### Final Takeaway {#final-takeaway-53}

Separable equations turn a differential relationship into two one-variable
integrals.

```{=latex}
\Needspace{10\baselineskip}
```
The method is conceptually simple:

$$
y'=g(x)h(y)
\quad\Longrightarrow\quad
\frac{dy}{h(y)}=g(x)\,dx
$$

but a complete solution requires more than integration.

We must preserve equilibria, apply conditions, choose branches, respect
domains, identify maximal intervals, and verify the result in the original
equation.

The main lesson is:

> separate the variables, but keep the full solution problem connected.
