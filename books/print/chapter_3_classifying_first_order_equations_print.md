```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 3}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Classifying First-Order Equations}
```
# Chapter 3 - Classifying First-Order Equations

This chapter develops a practical way to classify first-order ordinary
differential equations before trying to solve them.

Classification matters because different structures suggest different
solution methods. A linear equation invites one method, a separable equation
another, and an exact equation another.

The important questions are:

-   which form makes the equation easiest to read?
-   is the unknown function used linearly?
-   can the two variables be separated?
-   does the equation depend only on a ratio such as $y/x$?
-   does one nonlinear power of the unknown fit the Bernoulli pattern?
-   does a differential form come from a single potential function?

```{=latex}
\Needspace{12\baselineskip}
```
The central principle is:

```{=latex}
\Needspace{8\baselineskip}
```
> classify the mathematical structure, not merely the way the equation first
> happens to be written.

An equation may belong to more than one class. Algebra can reveal a hidden
class, but division can also change the domain or discard solutions. Both
facts will be part of our classification routine.

```{=latex}
\Needspace{12\baselineskip}
```
## Put The Equation In A Useful Form {#block-1-put-the-equation-in-a-useful-form}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to move confidently between three common descriptions of a
first-order equation.

They are:

1.  an implicit equation involving $x$, $y$, and $y'$
2.  slope form, with $y'$ isolated
3.  differential form, with coefficients of $dx$ and $dy$

```{=latex}
\Needspace{12\baselineskip}
```
The same differential equation can look very different in these forms.

```{=latex}
\Needspace{8\baselineskip}
```
> changing the representation does not change the intended solution curves,
> provided every algebraic step is valid on the domain being considered.

```{=latex}
\Needspace{12\baselineskip}
```
### Three Common Representations {#three-common-representations-2}

```{=latex}
\Needspace{10\baselineskip}
```
A general first-order equation may be written implicitly as:

$$
G(x,y,y')=0
$$

Here:

-   $x$ is the independent variable
-   $y=y(x)$ is the unknown function
-   $y'=dy/dx$ is its first derivative
-   $G$ is a known expression

```{=latex}
\Needspace{10\baselineskip}
```
If the derivative can be isolated, the equation has **slope form**:

$$
\boxed{y'=F(x,y)}
$$

This form directly tells us the slope assigned at each permitted point
$(x,y)$.

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation may also be written in **differential form**:

$$
\boxed{M(x,y)\,dx+N(x,y)\,dy=0}
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $N(x,y)\neq 0$, divide by $dx$ and use $dy/dx=y'$:

$$
M(x,y)+N(x,y)y'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $M(x,y)$ from both sides:

$$
N(x,y)y'=-M(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now divide by $N(x,y)$. Therefore:

$$
\boxed{y'=-\frac{M(x,y)}{N(x,y)}}
$$

This last step is valid only where $N(x,y)$ is nonzero.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: From An Implicit Equation To Slope Form {#example-from-an-implicit-equation-to-slope-form-3}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(4+x^2)y'+3y-e^{-x}=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $(4+x^2)y'+3y-e^{-x}=0$, add $e^{-x}$ to both
sides and subtract $3y$ from both sides:

$$
(4+x^2)y'=e^{-x}-3y
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $4+x^2>0$ for every real $x$, division is valid everywhere:

$$
\boxed{y'=\frac{e^{-x}-3y}{4+x^2}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding differential form is obtained from
$y'=dy/dx$:

$$
(4+x^2)\frac{dy}{dx}+3y-e^{-x}=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $dx$:

$$
\boxed{(3y-e^{-x})\,dx+(4+x^2)\,dy=0}
$$

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> slope form highlights the local rate $y'$, while differential form presents
> the equation as a relation between changes in $x$ and $y$.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: From Differential Form To Slope Form {#example-from-differential-form-to-slope-form-4}

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
(y-2x)\,dx+(1+y^2)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
In this displayed differential form, the coefficients are:

$$
M(x,y)=y-2x,
\qquad
N(x,y)=1+y^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $1+y^2>0$ for every real $y$, we may solve for $y'$ globally:

$$
\begin{aligned}
(y-2x)+(1+y^2)y'&=0,\\
(1+y^2)y'&=2x-y,\\
y'&=\frac{2x-y}{1+y^2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{y'=\frac{2x-y}{1+y^2}}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### One Slope Form Has Many Differential Forms {#one-slope-form-has-many-differential-forms-5}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
y'=\frac{x-y}{2+y^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
One differential form is:

$$
(y-x)\,dx+(2+y^2)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiplying the entire equation by any nonzero function $\mu(x,y)$ gives
another form with the same local solution curves wherever $\mu$ is defined
and nonzero:

$$
\mu(x,y)(y-x)\,dx+\mu(x,y)(2+y^2)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the base form
$(y-x)\,dx+(2+y^2)\,dy=0$, choosing the nonzero multiplier
$\mu=e^x$ gives:

$$
e^x(y-x)\,dx+e^x(2+y^2)\,dy=0
$$

This freedom becomes important when we discuss exactness. Exactness belongs
to a particular differential form, not automatically to every equivalent
form.

```{=latex}
\Needspace{12\baselineskip}
```
### A Domain Warning {#a-domain-warning-6}

Algebraic rewriting can hide restrictions.

```{=latex}
\Needspace{10\baselineskip}
```
For example, consider:

$$
(y-1)y'=x(y-1)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Dividing by $y-1$ gives:

$$
y'=x
$$

but that division is invalid when $y=1$.

```{=latex}
\Needspace{10\baselineskip}
```
The original equation is also satisfied by the constant function:

$$
y(x)=1
$$

because both sides are then zero.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning is:

```{=latex}
\Needspace{8\baselineskip}
```
> before cancelling or dividing by an expression containing the unknown,
> check whether setting that expression to zero produces additional
> solutions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

A first-order equation may be implicit, in slope form, or in differential
form.

```{=latex}
\Needspace{10\baselineskip}
```
The most useful forms are:

$$
y'=F(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

Converting between them can expose structure. Every division must be checked
for domain restrictions and possible lost solutions.

```{=latex}
\Needspace{12\baselineskip}
```
## A Classification Workflow {#block-2-a-classification-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to replace guesswork with a repeatable inspection routine.

```{=latex}
\Needspace{12\baselineskip}
```
The routine does not solve the equation. It identifies structures that may
make the equation solvable by a standard method.

```{=latex}
\Needspace{8\baselineskip}
```
> classification is a method-selection step.

```{=latex}
\Needspace{12\baselineskip}
```
### The Recognition Checklist {#the-recognition-checklist-9}

For a first-order equation, ask the following questions.

#### 1. Can the derivative be isolated?

```{=latex}
\Needspace{10\baselineskip}
```
Try to obtain:

$$
y'=F(x,y)
$$

This form is especially useful for testing linearity, separability, and
first-order homogeneity.

#### 2. Is it linear in the unknown function?

```{=latex}
\Needspace{10\baselineskip}
```
Look for:

$$
y'+p(x)y=q(x)
$$

Only the first power of $y$ is permitted, and its coefficient may depend on
$x$ but not on $y$.

#### 3. Can all $y$-dependence be moved beside $dy$?

```{=latex}
\Needspace{10\baselineskip}
```
Look for a rearrangement such as:

$$
A(y)\,dy=B(x)\,dx
$$

This signals a separable equation.

#### 4. Does the slope depend only on a ratio?

```{=latex}
\Needspace{10\baselineskip}
```
Look for:

$$
y'=H\!\left(\frac{y}{x}\right)
$$

This is the usual first-order homogeneous pattern.

#### 5. Is there one nonlinear power of $y$?

```{=latex}
\Needspace{10\baselineskip}
```
Look for:

$$
y'+p(x)y=q(x)y^n
$$

This is the Bernoulli pattern.

#### 6. Does differential form pass the cross-partial test?

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
compare:

$$
\frac{\partial M}{\partial y}
\qquad\text{and}\qquad
\frac{\partial N}{\partial x}
$$

Matching cross-partials signal exactness under the regularity and domain
conditions discussed later in this chapter.

```{=latex}
\Needspace{12\baselineskip}
```
### Classifications Can Overlap {#classifications-can-overlap-10}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=-3xy
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y'=-3xy$ is linear because adding $3xy$ to both sides
gives:

$$
y'+3xy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
It is also separable because:

$$
\frac{1}{y}\,dy=-3x\,dx
$$

where $y\neq 0$.

The function $y=0$ must be checked separately because division by $y$ was
used.

This equation is therefore not forced into one exclusive category.

```{=latex}
\Needspace{12\baselineskip}
```
The shared linear and separable example illustrates the broader point:

```{=latex}
\Needspace{8\baselineskip}
```
> a classification describes a usable structure; one equation may contain
> several usable structures.

```{=latex}
\Needspace{12\baselineskip}
```
### Appearance Can Be Misleading {#appearance-can-be-misleading-11}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(1+x^2)y'+2xy=1
$$

At first sight it does not match the standard linear template because the
coefficient of $y'$ is not $1$.

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $1+x^2$:

$$
y'+\frac{2x}{1+x^2}y=\frac{1}{1+x^2}
$$

Now the linear structure is visible.

```{=latex}
\Needspace{10\baselineskip}
```
By contrast:

$$
(1+y^2)y'+2xy=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
becomes:

$$
y'=\frac{1-2xy}{1+y^2}
$$

The coefficient attached to the derivative depends on $y$, and the resulting
equation is not linear in $y$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-12}

First put the equation into a revealing form. Then test for linear,
separable, first-order homogeneous, Bernoulli, and exact structures.

Do not stop after finding one valid classification. Do not classify from a
single term without checking the whole equation.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising Linear Equations {#block-3-recognising-linear-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-13}

The goal is to distinguish equations that are linear in the unknown function
from equations that merely look algebraically simple.

```{=latex}
\Needspace{12\baselineskip}
```
### The Linear Pattern {#the-linear-pattern-14}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation is linear in $y$ if it can be written as:

$$
\boxed{y'+p(x)y=q(x)}
$$

The functions $p$ and $q$ may be complicated functions of $x$.

What matters is how $y$ appears.

```{=latex}
\Needspace{10\baselineskip}
```
Permitted terms include:

$$
x^2y,
\qquad
e^{-x}y,
\qquad
\frac{y}{1+x^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> coefficients may be nonlinear functions of the independent variable, but
> the unknown function and its derivative must enter to the first power and
> must not multiply each other.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: Reveal The Linear Structure {#example-reveal-the-linear-structure-15}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the equation for $u=u(t)$:

$$
(1+t^2)u'+4tu=\cos t
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1+t^2$ never vanishes, divide through by it:

$$
u'+\frac{4t}{1+t^2}u=\frac{\cos t}{1+t^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Near Misses {#near-misses-16}

Consider the following equations.

#### Equation A

$$
z'+s^3z=e^{-s}
$$

This is linear. The coefficient $s^3$ depends only on the independent
variable $s$.

#### Equation B

$$
z'+s z^3=e^{-s}
$$

This is not linear because $z$ appears to the third power.

#### Equation C

$$
z'+\sin(z)=e^{-s}
$$

This is not linear because the unknown is inside a sine function.

#### Equation D

$$
(1+z)z'+sz=0
$$

This is not linear because the derivative is multiplied by a function of the
unknown.

```{=latex}
\Needspace{10\baselineskip}
```
For Equation D, $(1+z)z'+sz=0$, isolating the derivative gives:

$$
z'=-\frac{sz}{1+z}
$$

the nonlinear dependence is clear.

```{=latex}
\Needspace{12\baselineskip}
```
### Two Meanings Of Homogeneous {#two-meanings-of-homogeneous-17}

```{=latex}
\Needspace{10\baselineskip}
```
A linear equation:

$$
y'+p(x)y=q(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
is called **homogeneous linear** when:

$$
q(x)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y'+p(x)y=0
$$

is homogeneous in the linear-equation sense.

```{=latex}
\Needspace{10\baselineskip}
```
Later we will call an equation such as:

$$
y'=H(y/x)
$$

homogeneous in the first-order scale-invariance sense.

```{=latex}
\Needspace{12\baselineskip}
```
Homogeneous linear and first-order homogeneous are different definitions
that happen to use the same word.

```{=latex}
\Needspace{8\baselineskip}
```
> whenever the word "homogeneous" appears, identify which mathematical
> context supplies its meaning.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-18}

```{=latex}
\Needspace{10\baselineskip}
```
A linear first-order equation can be written as:

$$
y'+p(x)y=q(x)
$$

The unknown and its derivative appear only to the first power. Their
coefficients depend only on the independent variable.

Nonlinear functions of $y$, powers other than one, and products such as
$yy'$ break linearity.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising Separable Equations {#block-4-recognising-separable-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-19}

The goal is to recognise when all $x$-dependence and all $y$-dependence can be
placed on opposite sides of an equation.

```{=latex}
\Needspace{12\baselineskip}
```
### The Separable Pattern {#the-separable-pattern-20}

```{=latex}
\Needspace{10\baselineskip}
```
A common separable form is:

$$
\boxed{y'=g(x)h(y)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'=g(x)h(y)$, divide by $h(y)$ and multiply by $dx$.
Where $h(y)\neq 0$, this gives:

$$
\boxed{\frac{1}{h(y)}\,dy=g(x)\,dx}
$$

The left side then depends only on $y$, while the right side depends only on
$x$.

```{=latex}
\Needspace{10\baselineskip}
```
An equivalent differential-form pattern is:

$$
A(x)\,dx+B(y)\,dy=0
$$

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> separability is about a multiplicative split between the independent and
> dependent variables after valid algebraic rearrangement.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: An Equation With Two Classifications {#example-an-equation-with-two-classifications-21}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
r'=(1+x^2)(2-r)
$$

```{=latex}
\Needspace{10\baselineskip}
```
It is separable because:

$$
\frac{1}{2-r}\,dr=(1+x^2)\,dx
$$

where $r\neq 2$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation $r'=(1+x^2)(2-r)$ is also linear. First expand its right
side:

$$
r'=2(1+x^2)-(1+x^2)r
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now add $(1+x^2)r$ to both sides:

$$
r'+(1+x^2)r=2(1+x^2)
$$

The same equation therefore supports both a separable method and a linear
method.

```{=latex}
\Needspace{10\baselineskip}
```
Separating $r'=(1+x^2)(2-r)$ required division by $2-r$, so we must
check the excluded value $r=2$. For this constant value:

$$
r'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
(1+x^2)(2-r)=0
$$

so $r(x)=2$ is a constant solution of the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Hidden Separable Structure {#a-hidden-separable-structure-22}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(1+y^2)y'=xe^x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $y'$ by $dy/dx$:

$$
(1+y^2)\frac{dy}{dx}=xe^x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from
$(1+y^2)\frac{dy}{dx}=xe^x$, multiply both sides by $dx$:

$$
\boxed{(1+y^2)\,dy=xe^x\,dx}
$$

The variables are separated even though the original equation was not
presented as a product $g(x)h(y)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Addition Usually Prevents Separation {#addition-usually-prevents-separation-23}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=x+y
$$

The right side is a sum, not a product of one function of $x$ and one function
of $y$.

```{=latex}
\Needspace{10\baselineskip}
```
For the equation $y'=x+y$, merely writing:

$$
\frac{dy}{x+y}=dx
$$

does not separate the variables because the denominator on the left still
contains both $x$ and $y$.

```{=latex}
\Needspace{10\baselineskip}
```
The equation is linear:

$$
y'-y=x
$$

but it is not separable by the ordinary separable-equation test.

```{=latex}
\Needspace{12\baselineskip}
```
A common mistake is:

```{=latex}
\Needspace{8\baselineskip}
```
> moving $dx$ and $dy$ to different sides is not enough; each side must
> depend on only one of the two variables.

```{=latex}
\Needspace{12\baselineskip}
```
### Equilibrium Solutions And Division {#equilibrium-solutions-and-division-24}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
y'=x(y-1)(y+2)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'=x(y-1)(y+2)$, divide by $(y-1)(y+2)$ and multiply
by $dx$. For nonconstant solutions away from the zeros of that factor,
this gives:

$$
\frac{1}{(y-1)(y+2)}\,dy=x\,dx
$$

```{=latex}
\Needspace{10\baselineskip}
```
The separated equation was obtained by dividing the original equation by
$(y-1)(y+2)$, so it assumes:

$$
(y-1)(y+2)\neq 0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The excluded constant values are:

$$
y=1
\qquad\text{and}\qquad
y=-2
$$

Substitution into the original equation shows that both are constant
solutions.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> when separating by dividing through a function of $y$, test its zeros in
> the original equation before continuing.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-25}

```{=latex}
\Needspace{10\baselineskip}
```
A separable equation can be arranged so that one side depends only on $y$ and
the other only on $x$:

$$
A(y)\,dy=B(x)\,dx
$$

Products often separate; sums usually do not. Division by a function of $y$
requires a separate check of its zeros.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising First-Order Homogeneous Equations {#block-5-recognising-first-order-homogeneous-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-26}

The goal is to recognise first-order equations whose slope depends only on
the ratio between the dependent and independent variables.

This meaning of homogeneous is based on scaling, not on the zero right-hand
side used in linear equations.

```{=latex}
\Needspace{12\baselineskip}
```
### The Ratio Pattern {#the-ratio-pattern-27}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order equation is homogeneous in this sense if it can be written as:

$$
\boxed{y'=H\!\left(\frac{y}{x}\right)}
$$

on a domain where the ratio is defined.

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently, if:

$$
y'=F(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
then $F$ is unchanged when $x$ and $y$ are scaled by the same nonzero factor:

$$
F(\lambda x,\lambda y)=F(x,y)
$$

where both sides are defined.

```{=latex}
\Needspace{10\baselineskip}
```
Why? The ratio does not change:

$$
\frac{\lambda y}{\lambda x}=\frac{y}{x}
$$

```{=latex}
\Needspace{12\baselineskip}
```
The geometric intuition is:

```{=latex}
\Needspace{8\baselineskip}
```
> points lying on the same ray from the origin receive the same slope.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: Reveal The Ratio {#example-reveal-the-ratio-28}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=\frac{x^2+4xy-y^2}{x^2+y^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the ratio expression obtained above, set:

$$
v=\frac{y}{x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
y'=\frac{1+4v-v^2}{1+v^2}
$$

The right side depends only on $v=y/x$. Therefore the equation is
first-order homogeneous.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Substitution Works {#why-the-substitution-works-29}

```{=latex}
\Needspace{10\baselineskip}
```
The natural substitution is:

$$
v=\frac{y}{x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
which means:

$$
y=xv
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $v$ is generally a function of $x$, use the product rule:

$$
\begin{aligned}
y'&=\frac{d}{dx}(xv),\\
y'&=v+xv'.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the original equation is $y'=H(y/x)$, substitution gives:

$$
v+xv'=H(v)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $v+xv'=H(v)$, subtract $v$ from both sides:

$$
xv'=H(v)-v
$$

This new equation is separable when the required divisions are valid.

We are not solving the equation here. We are seeing why the classification
points toward a useful substitution.

```{=latex}
\Needspace{12\baselineskip}
```
### A Quick Degree Test {#a-quick-degree-test-30}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the slope is a quotient of polynomials:

$$
y'=\frac{P(x,y)}{Q(x,y)}
$$

If every term in $P$ has the same total degree $m$, and every term in $Q$ has
that same degree $m$, their common scaling factor cancels.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
y'=\frac{3x^2+2xy}{y^2-5xy}
$$

```{=latex}
\Needspace{10\baselineskip}
```
has degree $2$ in both numerator and denominator. Dividing by $x^2$ expresses
the slope as:

$$
y'=\frac{3+2(y/x)}{(y/x)^2-5(y/x)},
$$

which is a function of $y/x$ alone.

```{=latex}
\Needspace{10\baselineskip}
```
By contrast:

$$
y'=\frac{x^2+2y}{x^2+y^2}
$$

mixes degrees in the numerator: $x^2$ has degree $2$, while $y$ has degree
$1$. The quick degree test fails, and the equation is not homogeneous by this
criterion.

```{=latex}
\Needspace{12\baselineskip}
```
### A Constant Can Break Scale Invariance {#a-constant-can-break-scale-invariance-31}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=\frac{x+y+1}{x-y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-32}

```{=latex}
\Needspace{10\baselineskip}
```
A first-order homogeneous equation has a slope that depends only on $y/x$:

$$
y'=H(y/x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
The scaling test is:

$$
F(\lambda x,\lambda y)=F(x,y)
$$

The substitution $y=xv$ changes the equation into one involving $v$ and
$v'$, usually revealing separability.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising Bernoulli Equations {#block-6-recognising-bernoulli-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-33}

The goal is to recognise a controlled form of nonlinearity that can be
converted into a linear equation.

```{=latex}
\Needspace{12\baselineskip}
```
### The Bernoulli Pattern {#the-bernoulli-pattern-34}

```{=latex}
\Needspace{10\baselineskip}
```
A Bernoulli equation can be written as:

$$
\boxed{y'+p(x)y=q(x)y^n}
$$

where $n$ is a fixed real number.

```{=latex}
\Needspace{10\baselineskip}
```
For the genuinely nonlinear Bernoulli case, we take:

$$
n\neq 0
\qquad\text{and}\qquad
n\neq 1
$$

The edge cases are already linear:

-   if $n=0$, then $y^n=1$
-   if $n=1$, the right side is another coefficient times $y$

The defining feature is one nonlinear power $y^n$ alongside the linear term
in $y$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Linearising Substitution {#the-linearising-substitution-35}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'+p(x)y=q(x)y^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the Bernoulli equation $y'+p(x)y=q(x)y^n$, the standard
substitution is:

$$
\boxed{v=y^{1-n}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
v'=(1-n)y^{-n}y'
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'+p(x)y=q(x)y^n$, multiply every term by $y^{-n}$
where that operation is valid:

$$
y^{-n}y'+p(x)y^{1-n}=q(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using:

$$
y^{-n}y'=\frac{v'}{1-n}
\qquad\text{and}\qquad
y^{1-n}=v
$$

```{=latex}
\Needspace{10\baselineskip}
```
gives:

$$
\frac{v'}{1-n}+p(x)v=q(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $1-n$:

$$
\boxed{v'+(1-n)p(x)v=(1-n)q(x)}
$$

This is linear in $v$.

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> a Bernoulli equation is nonlinear in the original unknown but linear after
> a power substitution tailored to its exponent.

```{=latex}
\Needspace{12\baselineskip}
```
### Example: Identify The Exponent {#example-identify-the-exponent-36}

```{=latex}
\Needspace{10\baselineskip}
```
Consider $a=a(t)$:

$$
a'+\frac{2}{1+t}a=(1+t)a^{-2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
1-n=1-(-2)=3
$$

```{=latex}
\Needspace{10\baselineskip}
```
use:

$$
v=a^3
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed linear equation is:

$$
v'+(1-n)p(t)v=(1-n)q(t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Examples And Near Misses {#examples-and-near-misses-37}

#### Bernoulli

$$
y'+x^2y=e^{-x}y^{5/2}
$$

There is one nonlinear power, $n=5/2$.

#### Linear, Not Genuinely Nonlinear Bernoulli

$$
y'+x^2y=e^{-x}
$$

This corresponds to the edge exponent $n=0$ and is already linear.

#### Not Bernoulli

$$
y'+x^2y=e^{-x}\sin y
$$

The nonlinear term is not a fixed power of $y$.

#### Not Bernoulli

$$
y'+xy^2=e^{-x}y^5
$$

Two different nonlinear powers appear. It does not match the required
linear-term-plus-one-power structure.

```{=latex}
\Needspace{12\baselineskip}
```
### Bernoulli Can Overlap With Separable {#bernoulli-can-overlap-with-separable-38}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=x^2y^4
$$

```{=latex}
\Needspace{10\baselineskip}
```
It is Bernoulli with:

$$
p(x)=0,
\qquad
q(x)=x^2,
\qquad
n=4
$$

```{=latex}
\Needspace{10\baselineskip}
```
The same equation $y'=x^2y^4$ is also separable:

$$
y^{-4}\,dy=x^2\,dx
$$

where $y\neq 0$.

The constant solution $y=0$ must again be checked in the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-39}

```{=latex}
\Needspace{10\baselineskip}
```
A Bernoulli equation has the form:

$$
y'+p(x)y=q(x)y^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\neq 0,1$, it is nonlinear in $y$. The substitution:

$$
v=y^{1-n}
$$

converts it into a linear equation in $v$.

One nonlinear power is permitted. An arbitrary nonlinear function or several
different powers do not fit the pattern.

```{=latex}
\Needspace{12\baselineskip}
```
## Recognising Exact Equations {#block-7-recognising-exact-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to recognise when a differential form is the total differential
of a single scalar function.

This section previews the structure. A later chapter will develop the full
solution method.

```{=latex}
\Needspace{12\baselineskip}
```
### The Potential-Function Idea {#the-potential-function-idea-41}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a function $\Phi(x,y)$ has continuous first partial derivatives. Its
total differential is:

$$
d\Phi
=
\frac{\partial\Phi}{\partial x}\,dx
+
\frac{\partial\Phi}{\partial y}\,dy
$$

```{=latex}
\Needspace{10\baselineskip}
```
A differential equation:

$$
M(x,y)\,dx+N(x,y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
is **exact** if there is a potential function $\Phi$ such that:

$$
M=\frac{\partial\Phi}{\partial x}
\qquad\text{and}\qquad
N=\frac{\partial\Phi}{\partial y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation then says:

$$
d\Phi=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrating along a solution curve gives:

$$
\Phi(x,y)=C
$$

Thus $\Phi$ remains constant along that curve.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> an exact differential equation packages two partial derivatives of one
> underlying function.

```{=latex}
\Needspace{12\baselineskip}
```
### The Cross-Partial Test {#the-cross-partial-test-42}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
M=\Phi_x
\qquad\text{and}\qquad
N=\Phi_y
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
M_y=\Phi_{xy}
\qquad\text{and}\qquad
N_x=\Phi_{yx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
When the relevant derivatives are continuous, the mixed partial derivatives
agree:

$$
\Phi_{xy}=\Phi_{yx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Example: An Exact Differential Form {#example-an-exact-differential-form-43}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(2xy+3)\,dx+(x^2+e^y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Identify:

$$
M(x,y)=2xy+3
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
N(x,y)=x^2+e^y
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate across the variables:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+3) \\
&=2x
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\begin{aligned}
N_x
&=\frac{\partial}{\partial x}(x^2+e^y) \\
&=2x
\end{aligned}
$$

The cross-partials agree, so the form is exact on the plane.

```{=latex}
\Needspace{10\baselineskip}
```
To construct a potential, begin with $\Phi_x=M=2xy+3$ and integrate
with respect to $x$:

$$
\Phi(x,y)=x^2y+3x+g(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\Phi(x,y)=x^2y+3x+g(y)$, differentiate with respect to $y$:

$$
\Phi_y=x^2+g'(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match it to $N=x^2+e^y$:

$$
x^2+g'(y)=x^2+e^y
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $x^2$ from both sides and integrate with respect to $y$:

$$
g'(y)=e^y
\qquad\Longrightarrow\qquad
g(y)=e^y
$$

```{=latex}
\Needspace{10\baselineskip}
```
An additive constant can be absorbed into the final solution constant, so
one potential function is:

$$
\Phi(x,y)=x^2y+3x+e^y
$$

```{=latex}
\Needspace{10\baselineskip}
```
because:

$$
\Phi_x=2xy+3=M
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\Phi_y=x^2+e^y=N
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Example: A Nonexact Differential Form {#example-a-nonexact-differential-form-44}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(y+\cos x)\,dx+(x^2+2y)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the proposed nonexact form
$(y+\cos x)\,dx+(x^2+2y)\,dy=0$, the coefficients are:

$$
M(x,y)=y+\cos x,
\qquad
N(x,y)=x^2+2y
$$

```{=latex}
\Needspace{10\baselineskip}
```
The cross-partials are:

$$
M_y=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
N_x=2x
$$

They are not equal throughout a two-dimensional region. Therefore the given
differential form is not exact.

```{=latex}
\Needspace{12\baselineskip}
```
### Exactness Depends On The Chosen Form {#exactness-depends-on-the-chosen-form-45}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
2xy\,dx+(x^2+1)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the original form
$2xy\,dx+(x^2+1)\,dy=0$, exactness follows because:

$$
\frac{\partial}{\partial y}(2xy)=2x
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{\partial}{\partial x}(x^2+1)=2x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the exact form
$2xy\,dx+(x^2+1)\,dy=0$
by the nonzero function $e^y$:

$$
2xye^y\,dx+(x^2+1)e^y\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
This has the same local solution curves, but its cross-partials are:

$$
\frac{\partial}{\partial y}(2xye^y)
=
2xe^y(1+y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{\partial}{\partial x}\left((x^2+1)e^y\right)
=
2xe^y
$$

These are not generally equal.

Therefore the multiplied form is not exact.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> exactness describes the displayed pair $M$ and $N$; an equivalent
> differential equation may require a different form before exactness is
> visible.

```{=latex}
\Needspace{12\baselineskip}
```
### How Separability And Exactness Are Related {#how-separability-and-exactness-are-related-46}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
y'=g(x)h(y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y'=g(x)h(y)$, and where $h(y)\neq 0$, separating the
variables gives:

$$
-g(x)\,dx+\frac{1}{h(y)}\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
In the separated form
$-g(x)\,dx+\frac{1}{h(y)}\,dy=0$, the first coefficient is:

$$
M(x,y)=-g(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
depends only on $x$, and:

$$
N(x,y)=\frac{1}{h(y)}
$$

depends only on $y$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-47}

```{=latex}
\Needspace{10\baselineskip}
```
An exact equation has differential form:

$$
M\,dx+N\,dy=0
$$

where $M$ and $N$ are partial derivatives of one potential function.

```{=latex}
\Needspace{10\baselineskip}
```
The practical test is:

$$
M_y=N_x
$$

under suitable continuity and domain conditions. Exactness depends on the
chosen differential form.

```{=latex}
\Needspace{12\baselineskip}
```
## A Mixed Classification Workshop {#block-8-a-mixed-classification-workshop}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-48}

The goal is to classify a mixed set of equations without being told which
test to use.

For each equation, we will expose the useful form and explain the decisive
feature.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 1: Linear After Normalisation {#equation-1-linear-after-normalisation-49}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(1+x^2)y'+2xy=e^{-x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 2: Separable {#equation-2-separable-50}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=x(1-y^2)
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side is a product of a function of $x$ and a function of $y$.
Divide by $1-y^2$ and multiply by $dx$. Where $y\neq\pm1$, this gives:

$$
\frac{1}{1-y^2}\,dy=x\,dx
$$

where $y\neq\pm 1$.

The constant functions $y=1$ and $y=-1$ must be checked separately and both
satisfy the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 3: First-Order Homogeneous {#equation-3-first-order-homogeneous-51}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=\frac{2x^2+xy-3y^2}{x^2+y^2}
$$

Every term in the numerator and denominator has degree $2$.

```{=latex}
\Needspace{10\baselineskip}
```
For the equation
$y'=(2x^2+xy-3y^2)/(x^2+y^2)$ and $x\neq 0$, divide the numerator
and denominator by $x^2$:

$$
y'
=
\frac{2+(y/x)-3(y/x)^2}{1+(y/x)^2}
$$

The slope depends only on $y/x$, so the equation is first-order homogeneous.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 4: Bernoulli {#equation-4-bernoulli-52}

```{=latex}
\Needspace{10\baselineskip}
```
Consider $u=u(t)$:

$$
u'+\frac{3}{t}u=t^2u^5
$$

```{=latex}
\Needspace{10\baselineskip}
```
On an interval not containing $t=0$, the equation
$u'+\frac{3}{t}u=t^2u^5$ is Bernoulli with:

$$
p(t)=\frac{3}{t},
\qquad
q(t)=t^2,
\qquad
n=5
$$

```{=latex}
\Needspace{10\baselineskip}
```
The linearising substitution is:

$$
v=u^{1-5}=u^{-4}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 5: Exact {#equation-5-exact-53}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(6xy-\sin x)\,dx+(3x^2+4y^3)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
M=6xy-\sin x,
\qquad
N=3x^2+4y^3
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the exact form
$(6xy-\sin x)\,dx+(3x^2+4y^3)\,dy=0$, one matching potential is:

$$
\Phi(x,y)=3x^2y+\cos x+y^4
$$

```{=latex}
\Needspace{10\baselineskip}
```
Verify it locally:

$$
\Phi_x=6xy-\sin x=M
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the same potential, differentiation with respect to $y$ gives:

$$
\Phi_y=3x^2+4y^3=N
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 6: Linear And Separable {#equation-6-linear-and-separable-54}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'=-4y
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y'=-4y$ is linear because adding $4y$ to both sides gives:

$$
y'+4y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y'=-4y$ is separable because dividing by $y$ and
multiplying by $dx$ gives:

$$
\frac{1}{y}\,dy=-4\,dx
$$

where $y\neq 0$.

The missing constant solution $y=0$ satisfies the original equation.

It is not first-order homogeneous in the ratio sense: the slope $-4y$
changes when $y$ is scaled.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation 7: None Of The Main Special Forms {#equation-7-none-of-the-main-special-forms-55}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y'+(x+y)y=x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
y'+xy+y^2=x
$$

It is not linear because of $y^2$.

It is not Bernoulli because the equation contains both a forcing term
independent of $y$ and the nonlinear power $y^2$ in addition to the linear
term.

```{=latex}
\Needspace{10\baselineskip}
```
It is not separable in its displayed slope form:

$$
y'=x-xy-y^2
$$

and it is not a function only of $y/x$.

Not every first-order equation belongs to one of the special classes in this
chapter.

```{=latex}
\Needspace{12\baselineskip}
```
### A Compact Decision Table {#a-compact-decision-table-56}

  -----------------------------------------------------------------------------------------
  Structure                 Form to look for        Decisive test
  ------------------------- ----------------------- ---------------------------------------
  Linear                    $y'+p(x)y=q(x)$         $y$ and $y'$ enter to the first power

  Separable                 $A(y)\,dy=B(x)\,dx$     each side contains one variable only

  First-order homogeneous   $y'=H(y/x)$             slope is unchanged by common scaling

  Bernoulli                 $y'+p(x)y=q(x)y^n$      one fixed nonlinear power of $y$

  Exact                     $M\,dx+N\,dy=0$         $M_y=N_x$ on a suitable domain
  -----------------------------------------------------------------------------------------

The table is a recognition aid, not a substitute for algebra and domain
checks.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-57}

A useful classification process is:

1.  normalise or rearrange the equation
2.  record every restriction introduced by division
3.  test all plausible structures
4.  keep every valid classification
5.  identify the substitution or method suggested by each class

The goal is not to attach a label as quickly as possible. The goal is to find
a mathematically justified route forward.

```{=latex}
\Needspace{12\baselineskip}
```
## Original Practice Set {#block-9-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-58}

#### Problem 1: Convert To Slope Form

```{=latex}
\Needspace{10\baselineskip}
```
Write the following equation in slope form and state the points at which the
conversion is valid:

$$
(s^2+4)z'-3sz=\ln(s+2)
$$

#### Problem 2: Convert From Differential Form

```{=latex}
\Needspace{10\baselineskip}
```
Write the following equation in slope form wherever possible:

$$
(x+y^2)\,dx+(2xy+1)\,dy=0
$$

#### Problem 3: Test Linearity

```{=latex}
\Needspace{10\baselineskip}
```
Determine which equations are linear in the displayed dependent variable.

$$
\begin{aligned}
\text{(a)}\quad &w'+t^2w=\tan t,\\
\text{(b)}\quad &w'+t^2w^2=\tan t,\\
\text{(c)}\quad &(1+t^2)w'+e^t w=0,\\
\text{(d)}\quad &(1+w^2)w'+tw=0.
\end{aligned}
$$

#### Problem 4: Find Every Applicable Class

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
y'=t^2(5-y)
$$

as linear, separable, first-order homogeneous, Bernoulli, or none of these.
More than one answer may apply.

#### Problem 5: Test First-Order Homogeneity

```{=latex}
\Needspace{10\baselineskip}
```
Determine whether:

$$
y'=\frac{3x^2+y^2}{xy}
$$

is first-order homogeneous. State the domain restrictions visible in the
displayed form.

#### Problem 6: Identify A Bernoulli Substitution

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
v'-2v=(1+t^2)v^{1/3}
$$

identify $p(t)$, $q(t)$, and $n$, then state the linearising substitution.

#### Problem 7: Test Exactness

```{=latex}
\Needspace{10\baselineskip}
```
Determine whether:

$$
(2xy+e^x)\,dx+(x^2+6y^2)\,dy=0
$$

is exact.

#### Problem 8: Diagnose Nonexactness

```{=latex}
\Needspace{10\baselineskip}
```
Test:

$$
(y^2+x)\,dx+(x+\sin y)\,dy=0
$$

for exactness. Identify the two cross-partials.

#### Problem 9: Protect Constant Solutions

```{=latex}
\Needspace{10\baselineskip}
```
Separate the nonconstant part of:

$$
y'=xy(y-3)
$$

and identify every constant solution that division could discard.

#### Problem 10: Distinguish Linear From Separable

```{=latex}
\Needspace{10\baselineskip}
```
Classify each equation as linear, separable, both, or neither:

$$
\begin{aligned}
\text{(a)}\quad &y'=x+y,\\
\text{(b)}\quad &y'=e^x(1+y),\\
\text{(c)}\quad &y'=x^2y^3,\\
\text{(d)}\quad &y'+\sin(y)=x.
\end{aligned}
$$

#### Problem 11: Use The Scaling Test

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
F(x,y)=\frac{x^3-2xy^2}{x^2y+y^3}
$$

evaluate $F(\lambda x,\lambda y)$ and decide whether the equation
$y'=F(x,y)$ is first-order homogeneous.

#### Problem 12: Full Classification

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Answers {#practice-answers-59}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The logarithm requires:

$$
s+2>0
$$

so $s>-2$.

```{=latex}
\Needspace{10\baselineskip}
```
Since $s^2+4>0$, isolate $z'$:

$$
\begin{aligned}
(s^2+4)z'&=3sz+\ln(s+2),\\
z'&=\frac{3sz+\ln(s+2)}{s^2+4}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{z'=\frac{3sz+\ln(s+2)}{s^2+4}},
\qquad s>-2
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Replace $dy$ by $y'\,dx$:

$$
(x+y^2)+(2xy+1)y'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $x+y^2$ from both sides:

$$
(2xy+1)y'=-(x+y^2)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Where $2xy+1\neq 0$, divide by $2xy+1$:

$$
\boxed{y'=-\frac{x+y^2}{2xy+1}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The slope formula
$y'=-(x+y^2)/(2xy+1)$ is valid where its divisor is nonzero:

$$
2xy+1\neq 0
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Equation (a) is linear:

$$
w'+t^2w=\tan t
$$

Equation (b) is not linear because of $w^2$.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (c) is linear. Divide by $1+t^2$:

$$
w'+\frac{e^t}{1+t^2}w=0
$$

Equation (d) is not linear because the coefficient of $w'$ depends on $w$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The equation is separable:

$$
\frac{1}{5-y}\,dy=t^2\,dt
$$

where $y\neq 5$.

```{=latex}
\Needspace{10\baselineskip}
```
It is also linear:

$$
y'+t^2y=5t^2
$$

The constant solution $y=5$ satisfies the original equation and was excluded
by the displayed separation.

It is not first-order homogeneous in the ratio sense. It does not require a
genuinely nonlinear Bernoulli classification.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
The displayed equation requires:

$$
x\neq 0
\qquad\text{and}\qquad
y\neq 0
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The equation already has Bernoulli form:

$$
v'+p(t)v=q(t)v^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
p(t)=-2,
\qquad
q(t)=1+t^2,
\qquad
n=\frac{1}{3}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The substitution is:

$$
\boxed{u=v^{1-n}=v^{2/3}}
$$

A new symbol such as $u$ avoids confusing the transformed variable with the
original $v$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
M(x,y)=2xy+e^x,
\qquad
N(x,y)=x^2+6y^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
The cross-partials are:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+e^x) \\
&=2x
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
M(x,y)=y^2+x,
\qquad
N(x,y)=x+\sin y
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(y^2+x) \\
&=2y
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
For nonconstant solutions away from $y=0$ and $y=3$, start from
$y'=xy(y-3)$ and replace $y'$ by $dy/dx$:

$$
\frac{dy}{dx}=xy(y-3)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $y(y-3)$ and multiply by $dx$:

$$
\boxed{\frac{1}{y(y-3)}\,dy=x\,dx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The zeros of the factor divided out give two constant candidates:

$$
y=0
\qquad\text{and}\qquad
y=3
$$

Both make the original right side zero, so both are constant solutions.

For either constant, the left side is also $y'=0$. Thus the original equation
becomes $0=0$ in both cases.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Equation (a):

$$
y'=x+y
$$

is linear but not ordinarily separable.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (b):

$$
y'=e^x(1+y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y'=e^x(1+y)$ is separable because:

$$
\frac{1}{1+y}\,dy=e^x\,dx,
\qquad y\neq -1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and it is linear after expansion and rearrangement:

$$
\begin{aligned}
y'&=e^x+e^x y,\\
y'-e^x y&=e^x.
\end{aligned}
$$

The excluded constant $y=-1$ also satisfies the original equation.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (c):

$$
y'=x^2y^3
$$

```{=latex}
\Needspace{10\baselineskip}
```
is separable but not linear because $y$ appears to the third power. Its
separable form is:

$$
y^{-3}\,dy=x^2\,dx,
\qquad y\neq 0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The same equation $y'=x^2y^3$ also fits the Bernoulli form:

$$
y'+0\cdot y=x^2y^3,
$$

so $p(x)=0$, $q(x)=x^2$, and $n=3$. The excluded value $y=0$ is a constant
solution of the original equation.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (d):

$$
y'+\sin(y)=x
$$

is neither linear nor separable by the standard tests used here.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The original denominator is:

$$
x^2y+y^3=y(x^2+y^2)
$$

Over the real plane it is nonzero precisely when $y\neq 0$. Therefore
$y'=F(x,y)$ is first-order homogeneous on its domain $y\neq 0$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Equation (a):

$$
y'+2xy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
is already linear with $p(x)=2x$ and $q(x)=0$. It is separable because:

$$
\frac{1}{y}\,dy=-2x\,dx,
\qquad y\neq 0.
$$

The excluded value $y=0$ satisfies the original equation.

```{=latex}
\Needspace{10\baselineskip}
```
Equation (b):

$$
y'=\frac{x+2y}{2x-y}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Equation (c):

$$
y'+xy=e^x y^{-3}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Equation (d):

$$
(4xy+1)\,dx+(2x^2+3y^2)\,dy=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For Equation (d), let $M=4xy+1$ and $N=2x^2+3y^2$. The first
cross-partial is:

$$
\frac{\partial}{\partial y}(4xy+1)=4x
$$

```{=latex}
\Needspace{10\baselineskip}
```
For Equation (d), differentiating the second coefficient
$N=2x^2+3y^2$ with respect to $x$ gives:

$$
\frac{\partial}{\partial x}(2x^2+3y^2)=4x
$$

The cross-partials agree, so Equation (d) is exact on the plane.

```{=latex}
\Needspace{12\baselineskip}
```
### Final Takeaway {#final-takeaway-60}

Classification is the bridge between reading an equation and choosing a
method.

The most reliable habits are:

-   rewrite the equation into a revealing form
-   distinguish the independent variable from the unknown function
-   test more than one possible class
-   justify each label from its defining pattern
-   record domain restrictions before dividing
-   check separately for solutions that cancellation could remove

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> a useful classification does more than name an equation; it reveals the
> algebraic structure that makes a solution method possible.
