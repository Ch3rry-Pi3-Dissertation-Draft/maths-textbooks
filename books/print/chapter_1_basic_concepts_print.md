```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 1}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Basic Concepts}
```
# Chapter 1 - Basic Concepts

This chapter develops the basic language needed to read an ordinary
differential equation before trying to solve it.

The emphasis is on interpretation.

We want to be able to look at an equation and answer:

-   what quantity is unknown?
-   what variable does it depend on?
-   which rates of change are involved?
-   what would a solution have to do?
-   how do extra conditions narrow the possibilities?
-   where is a proposed solution actually valid?

The central idea is:

```{=latex}
\Needspace{8\baselineskip}
```
> a differential equation describes a relationship between a changing
> quantity and one or more of its rates of change.

This chapter is organised around that idea rather than around a catalogue of
notation.

```{=latex}
\Needspace{12\baselineskip}
```
## What Is A Differential Equation? {#block-1-state-input-and-rate-of-change}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal of this block is to understand what kind of object a differential
equation asks us to find.

```{=latex}
\Needspace{10\baselineskip}
```
An algebraic equation usually asks for one or more numbers. For example,
consider the algebraic equation:

$$
7a-4=24
$$

asks for a number $a$.

```{=latex}
\Needspace{10\baselineskip}
```
A differential equation asks for a function. For example, consider:

$$
\frac{dr}{ds}=3s^2-4
$$

asks for a function $r=r(s)$ whose rate of change is $3s^2-4$.

The unknown is not the input $s$.

The unknown is the entire function $r(s)$.

```{=latex}
\Needspace{12\baselineskip}
```
**In everyday terms:**

```{=latex}
\Needspace{8\baselineskip}
```
> instead of finding one missing value, we are finding a rule whose changes
> behave in the required way.

```{=latex}
\Needspace{12\baselineskip}
```
### The State-And-Rate View {#the-state-and-rate-view-2}

It is useful to think of a function as a **state** and its derivative as a
**rate**.

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
h=h(t)
$$

records the height of liquid in a tank at time $t$.

```{=latex}
\Needspace{10\baselineskip}
```
For $h=h(t)$, its derivative is:

$$
h'(t)
$$

records how quickly the height is changing.

```{=latex}
\Needspace{10\baselineskip}
```
An equation such as:

$$
h'(t)=2-0.3h(t)
$$

relates the current state $h(t)$ to its current rate $h'(t)$.

The term $2$ can be interpreted as a constant contribution increasing the
height.

The term $-0.3h(t)$ becomes more negative as the height increases.

Even before solving, the equation tells us something qualitative:

-   when $h$ is small, the height tends to increase
-   when $h$ is large, the negative term becomes stronger
-   when $2-0.3h=0$, the height has zero instantaneous rate of change

```{=latex}
\Needspace{10\baselineskip}
```
The zero-rate state is found from:

$$
2-0.3h=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $0.3h$ to both sides:

$$
2=0.3h
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $2=0.3h$, divide both sides by $0.3$:

$$
\begin{aligned}
h
&=\frac{2}{0.3} \\
&=\frac{20}{3}.
\end{aligned}
$$

At this height, substituting back gives $2-0.3(20/3)=0$, so the model
predicts no instantaneous change.

This illustrates an important habit:

```{=latex}
\Needspace{8\baselineskip}
```
> read what the equation says about change before searching for a formula.

```{=latex}
\Needspace{12\baselineskip}
```
### A Working Definition {#a-working-definition-3}

A **differential equation** specifies a relationship involving:

-   an unknown function
-   one or more derivatives of that function
-   possibly the independent variable and known functions of it

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
q''(t)+5q'(t)-2q(t)=\cos t
$$

contains:

-   the unknown state $q(t)$
-   the first rate $q'(t)$
-   the second rate $q''(t)$
-   the known input $\cos t$

The equation asks for functions $q(t)$ that make this relationship true.

```{=latex}
\Needspace{12\baselineskip}
```
**The key intuition:**

```{=latex}
\Needspace{8\baselineskip}
```
> the equation is a constraint on a function and its behaviour under
> differentiation.

```{=latex}
\Needspace{12\baselineskip}
```
### One Equation Can Describe Many Functions {#one-equation-can-describe-many-functions-4}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
r'(s)=3s^2-4
$$

```{=latex}
\Needspace{10\baselineskip}
```
One function with this derivative is:

$$
r(s)=s^3-4s
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate to verify:

$$
\frac{d}{ds}\left(s^3-4s\right)=3s^2-4
$$

But adding a constant does not change the derivative.

```{=latex}
\Needspace{10\baselineskip}
```
To see this directly, differentiate the whole family:

$$
\begin{aligned}
\frac{d}{ds}\left(s^3-4s+C\right)
&=3s^2-4+\frac{dC}{ds} \\
&=3s^2-4+0 \\
&=3s^2-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since
$d(s^3-4s+C)/ds=3s^2-4$, every function of the form:

$$
r(s)=s^3-4s+C
$$

has the required rate of change.

```{=latex}
\Needspace{10\baselineskip}
```
One concrete member of this family is:

$$
r_1(s)=s^3-4s+2
$$

```{=latex}
\Needspace{10\baselineskip}
```
A second member of the same family is:

$$
r_2(s)=s^3-4s-11
$$

both satisfy the same differential equation.

Their graphs have the same shape but different vertical positions.

```{=latex}
\Needspace{12\baselineskip}
```
**Another way to see it:**

```{=latex}
\Needspace{8\baselineskip}
```
> the derivative controls how the graph changes, but it may not determine its
> absolute vertical position.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-5}

A differential equation asks for an unknown function, not merely an unknown
number.

The function describes a state, while its derivatives describe rates of
change.

```{=latex}
\Needspace{10\baselineskip}
```
An equation can connect:

$$
\text{input},
\quad
\text{state},
\quad
\text{first rate},
\quad
\text{higher rates}
$$

The same rate information may be shared by an entire family of functions.

```{=latex}
\Needspace{12\baselineskip}
```
## The Anatomy Of A Differential Equation {#block-2-the-anatomy-of-a-differential-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-6}

The goal of this block is to extract four pieces of information from an
equation:

1.  the unknown function
2.  the independent variable or variables
3.  whether the equation is ordinary or partial
4.  the order of the equation

These are reading skills. They do not require us to solve the equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Unknown Function And Independent Variable {#unknown-function-and-independent-variable-7}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\rho^2\frac{d^3m}{d\rho^3}
-
\rho\frac{dm}{d\rho}
+
m
=
e^{-\rho}
$$

The notation tells us that $m$ is being differentiated with respect to
$\rho$.

Therefore:

-   the unknown function is $m=m(\rho)$
-   the independent variable is $\rho$

The choice of letters is irrelevant.

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
\frac{d^2x}{d\theta^2}
+
(1+\theta^2)x
=
0
$$

Here:

-   the unknown function is $x=x(\theta)$
-   the independent variable is $\theta$

We should not assume that $x$ must be independent or that $y$ must be
dependent.

```{=latex}
\Needspace{12\baselineskip}
```
**What this tells us:**

```{=latex}
\Needspace{8\baselineskip}
```
> follow the derivative notation, not the habits attached to familiar
> letters.

```{=latex}
\Needspace{12\baselineskip}
```
### Ordinary Versus Partial {#ordinary-versus-partial-8}

An **ordinary differential equation**, or **ODE**, has an unknown function of
one independent variable.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
p''(u)+u^2p'(u)+p(u)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the unknown function:

$$
p=p(u)
$$

which depends only on $u$.

A **partial differential equation**, or **PDE**, has an unknown function of
more than one independent variable.

```{=latex}
\Needspace{10\baselineskip}
```
For example, consider the PDE:

$$
\frac{\partial v}{\partial t}
=
2\frac{\partial^2v}{\partial x^2}-v
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the unknown function:

$$
v=v(x,t)
$$

which depends on position $x$ and time $t$.

The symbols $d$ and $\partial$ help us read the notation, but the decisive
question is how many independent variables the unknown function has.

```{=latex}
\Needspace{12\baselineskip}
```
**The practical meaning:**

```{=latex}
\Needspace{8\baselineskip}
```
> one input gives an ODE; several inputs give a PDE.

```{=latex}
\Needspace{12\baselineskip}
```
### Derivative Notation {#derivative-notation-9}

```{=latex}
\Needspace{10\baselineskip}
```
If $f=f(x)$, the first derivative may be written as:

$$
f'(x)
=
\frac{df}{dx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second derivative may be written as:

$$
f''(x)
=
\frac{d^2f}{dx^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For higher derivatives, parentheses keep the notation clear:

$$
f^{(3)},
\quad
f^{(4)},
\quad
\ldots,
\quad
f^{(n)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
When time is the independent variable, dot notation is common:

$$
\dot f
=
\frac{df}{dt}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\ddot f
=
\frac{d^2f}{dt^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a position $x(t)$, the first derivative:

$$
\dot x
$$

is velocity.

```{=latex}
\Needspace{10\baselineskip}
```
The second derivative of the position is:

$$
\ddot x
$$

which is acceleration.

```{=latex}
\Needspace{12\baselineskip}
```
### Order Counts Differentiations {#order-counts-differentiations-10}

The **order** is the greatest number of differentiations applied in any term.

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\left(z^{(5)}\right)^2
+
\tau z''
+
e^z
=
1+\tau
$$

```{=latex}
\Needspace{10\baselineskip}
```
The highest derivative is:

$$
z^{(5)}
$$

so the equation is fifth order.

The square outside $z^{(5)}$ does not double the order.

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
(z')^{12}+z^3=7
$$

The highest derivative is only $z'$.

Therefore, this equation is first order, even though the derivative is raised
to the twelfth power.

```{=latex}
\Needspace{10\baselineskip}
```
Always distinguish:

$$
z^{(5)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
By contrast, the corresponding fifth power is:

$$
z^5
$$

The first is a fifth derivative. The second is a fifth power.

```{=latex}
\Needspace{12\baselineskip}
```
**Read it this way:**

```{=latex}
\Needspace{8\baselineskip}
```
> exponents measure multiplication; derivative order measures repeated
> differentiation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Four-Question Reading Routine {#a-four-question-reading-routine-11}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\eta\frac{d^4w}{d\eta^4}
+
\left(\frac{dw}{d\eta}\right)^6
-
w^2
=
\sin\eta
$$

Ask four questions.

#### 1. What is being differentiated?

The function $w$ is being differentiated.

```{=latex}
\Needspace{10\baselineskip}
```
Because $w$ is differentiated with respect to $\eta$, the unknown is:

$$
w=w(\eta)
$$

#### 2. With respect to what?

The derivatives are with respect to $\eta$.

Therefore, $\eta$ is the independent variable.

#### 3. How many independent variables are there?

There is one, so this is an ODE.

#### 4. What is the highest derivative?

```{=latex}
\Needspace{10\baselineskip}
```
The highest derivative is:

$$
\frac{d^4w}{d\eta^4}
$$

Therefore, the equation is fourth order.

The sixth power of $dw/d\eta$ does not change that conclusion.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-12}

To read a differential equation, identify:

-   the function being differentiated
-   the variable used in the differentiation
-   the number of independent variables
-   the highest derivative

Use those answers to determine the unknown function, independent variable,
ODE/PDE type, and order.

```{=latex}
\Needspace{12\baselineskip}
```
## A Solution Is An Identity {#block-3-a-solution-is-an-identity}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-13}

The goal of this block is to turn the word **solution** into a precise test.

Suppose an ODE is written in terms of an unknown function $y=y(x)$.

A proposed function is a solution on an interval $I$ when:

-   every derivative required by the equation exists on $I$
-   substitution makes the equation true for every $x\in I$

The phrase "for every" is essential.

Matching the equation at one isolated point does not establish a solution.

```{=latex}
\Needspace{12\baselineskip}
```
**The main point:**

```{=latex}
\Needspace{8\baselineskip}
```
> a solution turns the differential equation into an identity across an
> interval.

```{=latex}
\Needspace{12\baselineskip}
```
### The Verification Algorithm {#the-verification-algorithm-14}

Given a candidate function, use this sequence:

1.  Write the candidate clearly.
2.  Compute every derivative that appears in the ODE.
3.  Substitute into the original left-hand side.
4.  Simplify without skipping the cancellation.
5.  Compare with the right-hand side.
6.  Check the interval on which all expressions exist.

Verification is different from discovery.

We can confirm a function without knowing how someone found it.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: A Two-Parameter Family {#worked-example-a-two-parameter-family-15}

```{=latex}
\Needspace{10\baselineskip}
```
Test the family:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
in the equation:

$$
u''+9u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
u'(t)
=
-3A\sin(3t)+3B\cos(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate
$u'(t)=-3A\sin(3t)+3B\cos(3t)$ once more:

$$
u''(t)
=
-9A\cos(3t)-9B\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the displayed formulas for $u$ and $u''$ into the left-hand side
$u''+9u$:

$$
\begin{aligned}
u''+9u
&=
-9A\cos(3t)-9B\sin(3t) \\
&\quad+
9\left[A\cos(3t)+B\sin(3t)\right].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute the $9$:

$$
\begin{aligned}
u''+9u
&=
-9A\cos(3t)-9B\sin(3t) \\
&\quad+
9A\cos(3t)+9B\sin(3t) \\
&=
0.
\end{aligned}
$$

This is true for every real $t$ and every pair of constants $A$ and $B$.

```{=latex}
\Needspace{10\baselineskip}
```
Because $u''+9u=0$ for every $A$ and $B$, the entire family solves the ODE
on:

$$
(-\infty,\infty)
$$

```{=latex}
\Needspace{12\baselineskip}
```
**A useful interpretation:**

```{=latex}
\Needspace{8\baselineskip}
```
> the second derivative reverses the function and multiplies it by $9$, so
> adding $9u$ produces exact cancellation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: A Candidate That Fails {#worked-example-a-candidate-that-fails-16}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
v'-2v=x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Test the candidate:

$$
v(x)=x^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the candidate $v(x)=x^2$, differentiate:

$$
v'(x)=2x
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left-hand side:

$$
\begin{aligned}
v'-2v
&=
2x-2x^2.
\end{aligned}
$$

The equation requires this to equal $x$ for every $x$.

```{=latex}
\Needspace{10\baselineskip}
```
The candidate would require the identity:

$$
2x-2x^2=x
$$

is true only at selected values, not identically.

Therefore, $v=x^2$ is not a solution on an interval.

```{=latex}
\Needspace{12\baselineskip}
```
**In simple terms:**

```{=latex}
\Needspace{8\baselineskip}
```
> occasional agreement is not enough; the simplified expression must match
> the equation everywhere in the interval.

```{=latex}
\Needspace{12\baselineskip}
```
### Possible Numbers Of Solutions {#possible-numbers-of-solutions-17}

Different equations can have different-sized solution sets.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
g'=2t
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the family of solutions:

$$
g(t)=t^2+C
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
(g')^2+4g^2=0
$$

For real-valued functions, both terms are nonnegative.

```{=latex}
\Needspace{10\baselineskip}
```
For $(g')^2+4g^2=0$, both terms are nonnegative, so their sum is zero only
when:

$$
g'=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
g=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus, the only real-valued solution is:

$$
g(t)=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Indeed, this function has $g'(t)=0$, and substitution gives:

$$
(g')^2+4g^2=0^2+4(0)^2=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
(g')^2+4g^2=-2
$$

has no real-valued solution because its left-hand side cannot be negative.

The possibilities include:

-   a family of solutions
-   one solution
-   no solution

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-18}

To verify a solution, differentiate, substitute, simplify, and check the
interval.

The equation must hold as an identity, not merely at a few points.

A differential equation may have many solutions, one solution, or no solution
in the class of functions being considered.

```{=latex}
\Needspace{12\baselineskip}
```
## Solution Families And Missing Information {#block-4-solution-families-and-missing-information}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-19}

The goal of this block is to understand what arbitrary constants mean.

A **particular solution** is one specific function satisfying an ODE.

A **general solution** is a family intended to represent all solutions of the
relevant kind.

```{=latex}
\Needspace{10\baselineskip}
```
For the equation:

$$
u''+9u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
the family:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

contains two arbitrary constants.

Each choice of $A$ and $B$ produces one member of the family.

```{=latex}
\Needspace{12\baselineskip}
```
### Constants As Coordinates In A Family {#constants-as-coordinates-in-a-family-20}

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choosing:

$$
A=2,
\qquad
B=-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
produces:

$$
u(t)=2\cos(3t)-\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choosing:

$$
A=0,
\qquad
B=4
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting $A=0$ and $B=4$ produces:

$$
u(t)=4\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choosing both constants to be zero produces:

$$
u(t)=0
$$

The pair $(A,B)$ acts like a coordinate locating one function inside the
two-parameter family.

```{=latex}
\Needspace{12\baselineskip}
```
**Conceptually:**

```{=latex}
\Needspace{8\baselineskip}
```
> arbitrary constants record information that the differential equation has
> not fixed.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Order And Constants Often Match {#why-order-and-constants-often-match-21}

A first-order ODE often has a general solution containing one arbitrary
constant.

```{=latex}
\Needspace{10\baselineskip}
```
For example, consider:

$$
p'-2p=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the family:

$$
p(t)=Ce^{2t}
$$

```{=latex}
\Needspace{10\baselineskip}
```
A second-order ODE often has two arbitrary constants, as in:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

The general pattern is that an $n$th-order equation often carries $n$ pieces
of freely specifiable information.

This pattern is useful, but it is not a guarantee for every equation and every
domain.

Nonlinear equations can have singular solutions, restricted families, or
other complications.

```{=latex}
\Needspace{12\baselineskip}
```
### Do Not Lose Special Solutions {#do-not-lose-special-solutions-22}

Algebra used while solving can accidentally remove a valid case.

Suppose a step divides by the unknown function $y$.

```{=latex}
\Needspace{10\baselineskip}
```
That step assumes:

$$
y\neq 0
$$

The zero function may need to be checked separately in the original equation.

Similarly, division by $y'$, $x-a$, or another expression excludes points or
functions where that expression vanishes.

The safe rule is:

```{=latex}
\Needspace{8\baselineskip}
```
> record every nonzero assumption introduced during algebra, then test excluded
> cases in the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-23}

A general solution represents a family.

A particular solution is one member of that family.

Arbitrary constants represent information not supplied by the ODE alone.

Extra information can be used to determine those constants, but algebraic
solution methods must be checked for accidentally excluded cases.

```{=latex}
\Needspace{12\baselineskip}
```
## Conditions Act As Filters {#block-5-conditions-act-as-filters}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-24}

The goal of this block is to see initial and boundary conditions as filters on
a solution family.

The ODE produces a collection of possible functions.

Each extra condition removes members that do not have the required value or
rate at the specified input.

The surviving functions solve the complete problem.

```{=latex}
\Needspace{12\baselineskip}
```
### Initial-Value Problems {#initial-value-problems-25}

An **initial-value problem**, or **IVP**, supplies all of its conditions at one
common input value.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
u''+9u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
u(0)=2,
\qquad
u'(0)=-3
$$

is an IVP.

Both pieces of information are given at $t=0$.

The shared input does not have to be zero.

```{=latex}
\Needspace{10\baselineskip}
```
For example, the condition:

$$
p(-1)=6
$$

is an initial condition at $t=-1$.

```{=latex}
\Needspace{12\baselineskip}
```
**The takeaway:**

```{=latex}
\Needspace{8\baselineskip}
```
> an IVP gives a snapshot of the state and possibly its rates at one input.

```{=latex}
\Needspace{12\baselineskip}
```
### Boundary-Value Problems {#boundary-value-problems-26}

A **boundary-value problem**, or **BVP**, places conditions at different input
values.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
w''+w=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
w(0)=1,
\qquad
w(2)=0
$$

is a BVP.

One value is specified at the left endpoint and another at the right endpoint.

Boundary conditions are common when modelling a beam fixed at two locations,
a temperature prescribed at both ends of a rod, or a spatial profile known at
two boundaries.

```{=latex}
\Needspace{12\baselineskip}
```
**From a modelling viewpoint:**

```{=latex}
\Needspace{8\baselineskip}
```
> a BVP constrains the solution at separated inputs rather than describing one
> initial snapshot.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: One Condition Selects One Constant {#worked-example-one-condition-selects-one-constant-27}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
p'-2p=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this equation, use the known general solution:

$$
p(t)=Ce^{2t}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Impose:

$$
p(-1)=6
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=-1$ into the general solution:

$$
p(-1)=Ce^{-2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The condition requires:

$$
Ce^{-2}=6
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $e^2$:

$$
C=6e^2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=6e^2$ into $p(t)=Ce^{2t}$:

$$
\begin{aligned}
p(t)
&=
6e^2e^{2t} \\
&=
6e^{2(t+1)}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting $C=6e^2$ gives the selected solution:

$$
\boxed{p(t)=6e^{2(t+1)}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $p(t)=6e^{2(t+1)}$, check the condition at $t=-1$:

$$
p(-1)=6e^0=6
$$

```{=latex}
\Needspace{12\baselineskip}
```
**What to remember:**

```{=latex}
\Needspace{8\baselineskip}
```
> the ODE determines the exponential shape; the condition fixes its scale.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: Two Conditions Select Two Constants {#worked-example-two-conditions-select-two-constants-28}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the IVP:

$$
u''+9u=0,
\qquad
u(0)=2,
\qquad
u'(0)=-3
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the general solution:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the first condition:

$$
\begin{aligned}
u(0)
&=
A\cos(0)+B\sin(0) \\
&=
A.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the first condition requires $u(0)=2$ and the calculation gives
$u(0)=A$, we obtain:

$$
A=2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the general solution
$u(t)=A\cos(3t)+B\sin(3t)$:

$$
u'(t)
=
-3A\sin(3t)+3B\cos(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the second condition $u'(0)=-3$ to the derivative formula:

$$
\begin{aligned}
u'(0)
&=
-3A\sin(0)+3B\cos(0) \\
&=
3B.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $u'(0)=-3$:

$$
3B=-3
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
B=-1
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=2$ and $B=-1$ into the general solution:

$$
\begin{aligned}
u(t)
&=A\cos(3t)+B\sin(3t) \\
&=2\cos(3t)+(-1)\sin(3t) \\
&=2\cos(3t)-\sin(3t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
After substituting $A=2$ and $B=-1$, the IVP solution is:

$$
\boxed{u(t)=2\cos(3t)-\sin(3t)}
$$

Both the initial state and initial rate have now been used.

```{=latex}
\Needspace{12\baselineskip}
```
### Conditions Can Be Incompatible {#conditions-can-be-incompatible-29}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the family:

$$
u(t)=A\cos(3t)+B\sin(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u(t)=A\cos(3t)+B\sin(3t)$, impose the boundary conditions:

$$
u(0)=1,
\qquad
u\left(\frac{\pi}{3}\right)=4
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the first condition at $t=0$:

$$
\begin{aligned}
u(0)
&=A\cos(0)+B\sin(0) \\
&=A.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the condition requires $u(0)=1$:

$$
A=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=\pi/3$:

$$
3t=\pi
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=\pi/3$, substitute $3t=\pi$ into the family:

$$
\begin{aligned}
u\left(\frac{\pi}{3}\right)
&=
A\cos(\pi)+B\sin(\pi) \\
&=
-A.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=\pi/3$, the family gives $u(\pi/3)=-A$. Since $A=1$, every function
satisfying the first condition must have:

$$
u\left(\frac{\pi}{3}\right)=-1
$$

It can never equal $4$.

Therefore, no member of this family satisfies both boundary conditions.

```{=latex}
\Needspace{12\baselineskip}
```
**The geometric idea:**

```{=latex}
\Needspace{8\baselineskip}
```
> a condition can ask the family to do something its geometry makes
> impossible.

```{=latex}
\Needspace{12\baselineskip}
```
### Equation Solution Versus Problem Solution {#equation-solution-versus-problem-solution-30}

A function can satisfy an ODE without satisfying a particular IVP or BVP.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
u(t)=\cos(3t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
satisfies:

$$
u''+9u=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
The function $u(t)=\cos(3t)$ does not satisfy the IVP condition:

$$
u(0)=2
$$

```{=latex}
\Needspace{10\baselineskip}
```
Indeed, for $u(t)=\cos(3t)$:

$$
u(0)=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
To solve the complete problem, a function must pass every test:

$$
\text{ODE test}
+
\text{condition tests}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-31}

Conditions filter a general solution family.

An IVP places all conditions at one input.

A BVP places conditions at different inputs.

Conditions may select one function, several functions, or no function.

Always verify both the ODE and every supplied condition.

```{=latex}
\Needspace{12\baselineskip}
```
## A Formula Is Not Complete Without An Interval {#block-6-a-formula-is-not-complete-without-an-interval}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-32}

The goal of this block is to understand why a solution includes an interval of
validity.

Substitution can work algebraically while the proposed function fails to exist
at part of the claimed domain.

We must check:

-   denominators
-   logarithms
-   roots
-   inverse functions
-   every derivative required by the ODE

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: A Root Restricts The Interval {#worked-example-a-root-restricts-the-interval-33}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y(x)=\sqrt{x-1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and the ODE:

$$
2(x-1)y'-y=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x>1$:

$$
y'(x)=\frac{1}{2\sqrt{x-1}}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y=\sqrt{x-1}$ and
$y'=1/(2\sqrt{x-1})$ into the left-hand side of the ODE:

$$
\begin{aligned}
2(x-1)y'-y
&=
2(x-1)\left(\frac{1}{2\sqrt{x-1}}\right)-\sqrt{x-1} \\
&=
\frac{x-1}{\sqrt{x-1}}-\sqrt{x-1} \\
&=
\sqrt{x-1}-\sqrt{x-1} \\
&=
0.
\end{aligned}
$$

The function itself exists at $x=1$, but its derivative does not.

```{=latex}
\Needspace{10\baselineskip}
```
Therefore, it is a solution on:

$$
(1,\infty)
$$

not on an interval including $x=1$.

```{=latex}
\Needspace{12\baselineskip}
```
**In one sentence:**

```{=latex}
\Needspace{8\baselineskip}
```
> the ODE needs the derivative, so the derivative's domain matters as much as
> the function's domain.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: A Pole Splits The Real Line {#worked-example-a-pole-splits-the-real-line-34}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
z(t)=\frac{1}{t+2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
z'+z^2=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $z(t)=1/(t+2)$, differentiate:

$$
z'(t)=-\frac{1}{(t+2)^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Square the function:

$$
z^2(t)=\frac{1}{(t+2)^2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
z'+z^2
=
-\frac{1}{(t+2)^2}
+
\frac{1}{(t+2)^2}
=
0
$$

The algebra works wherever $t+2\neq 0$.

```{=latex}
\Needspace{10\baselineskip}
```
The function $z(t)=1/(t+2)$ is undefined at:

$$
t=-2
$$

```{=latex}
\Needspace{10\baselineskip}
```
This point divides the real line into two largest intervals:

$$
(-\infty,-2)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
(-2,\infty)
$$

The same formula describes a solution on either interval, but not on one
interval crossing $t=-2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Intervals Must Be Connected {#intervals-must-be-connected-35}

```{=latex}
\Needspace{10\baselineskip}
```
The set:

$$
(-\infty,-2)\cup(-2,\infty)
$$

contains every real number except $-2$.

However, it is not one interval. It has two disconnected pieces.

When stating an interval of solution, choose one connected interval on which
the function and required derivatives are defined.

This matters because many existence and uniqueness results are formulated on
intervals, not on arbitrary disconnected sets.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-36}

```{=latex}
\Needspace{10\baselineskip}
```
A complete solution statement includes both:

$$
\text{a function formula}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\text{an interval of validity}
$$

The function, all required derivatives, and the ODE must make sense throughout
that interval.

Singular points can split one formula into separate interval-based solutions.

```{=latex}
\Needspace{12\baselineskip}
```
## A Reusable Problem-Reading Workflow {#block-7-a-reusable-problem-reading-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Full Workflow {#the-full-workflow-37}

When reading an ODE problem, use this order.

#### Step 1: Identify the unknown function

Ask what is being differentiated.

#### Step 2: Identify the independent variable

Ask what variable appears in the derivative denominator or argument.

#### Step 3: Classify the equation

Count independent variables and locate the highest derivative.

#### Step 4: Separate the ODE from extra conditions

Write initial or boundary conditions on their own lines.

#### Step 5: Verify candidate functions in the original ODE

Differentiate, substitute, and simplify to an identity.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Check the interval

Find points where the function, its derivatives, or the equation becomes
undefined.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply every condition

Use conditions to determine arbitrary constants, then verify them again.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Failure Modes {#common-failure-modes-38}

#### Confusing exponent with derivative order

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
(y')^{20}+y=0
$$

is first order.

#### Letting familiar letters decide the roles

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
\frac{d^2t}{dr^2}+t=r
$$

the unknown is $t=t(r)$.

#### Checking only one input value

An ODE solution must produce an identity across an interval.

#### Forgetting derivative domains

A function can exist at an endpoint where a required derivative does not.

#### Checking the ODE but ignoring conditions

Solving the equation is only part of solving an IVP or BVP.

#### Assuming conditions are consistent

Conditions can select no member of the available family.

```{=latex}
\Needspace{12\baselineskip}
```
### Original Practice Set {#original-practice-set-39}

#### Problem 1: Read The Roles

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\xi^2\frac{d^3a}{d\xi^3}
+
\frac{da}{d\xi}
=
\xi a
$$

identify the unknown function, independent variable, type, and order.

#### Problem 2: Do Not Be Distracted By Powers

```{=latex}
\Needspace{10\baselineskip}
```
Determine the order of:

$$
\left(\frac{d^2k}{ds^2}\right)^7
+
(k')^{11}
=
s
$$

#### Problem 3: Verify A Candidate

```{=latex}
\Needspace{10\baselineskip}
```
Determine whether:

$$
f(x)=4e^{-x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
solves:

$$
f'+f=0
$$

on the real line.

#### Problem 4: Find The Valid Intervals

```{=latex}
\Needspace{10\baselineskip}
```
Find the largest real intervals on which:

$$
r(x)=\frac{1}{x-5}
$$

could be a solution of an ODE involving $r'$.

#### Problem 5: Classify Conditions

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
y(4)=2,
\qquad
y'(4)=-1
$$

as initial or boundary conditions.

#### Problem 6: Classify Different Conditions

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
y(-2)=0,
\qquad
y(3)=7
$$

as initial or boundary conditions.

#### Problem 7: Select A Family Member

```{=latex}
\Needspace{10\baselineskip}
```
Given:

$$
r(x)=C e^{-4x}
$$

use $r(0)=5$ to determine $C$.

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Set Answers {#practice-set-answers-40}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

-   unknown function: $a=a(\xi)$
-   independent variable: $\xi$
-   type: ODE
-   order: third

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

The equation is second order.

The seventh and eleventh powers do not alter derivative order.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
For the candidate $f(x)=4e^{-x}$, differentiate:

$$
f'(x)=-4e^{-x}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
f'+f
=
-4e^{-x}+4e^{-x}
=
0
$$

The exponential and its derivative exist for every real $x$, so the candidate
is a solution on $(-\infty,\infty)$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

The formula is undefined at $x=5$.

```{=latex}
\Needspace{10\baselineskip}
```
The largest possible real intervals are:

$$
(-\infty,5)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
(5,\infty)
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

They are initial conditions because both are supplied at $x=4$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

They are boundary conditions because the inputs $-2$ and $3$ are different.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$:

$$
\begin{aligned}
r(0)
&=Ce^{-4(0)} \\
&=Ce^0 \\
&=C.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $r(x)=Ce^{-4x}$, the initial condition $r(0)=5$ gives $r(0)=C$.
Therefore:

$$
C=5
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=5$ into $r(x)=Ce^{-4x}$. The selected function is:

$$
r(x)=5e^{-4x}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Final Takeaway {#final-takeaway-41}

An ordinary differential equation is a rule connecting a function of one
input to one or more of its rates of change.

Before solving, learn to read:

-   the unknown function
-   the independent variable
-   the order
-   the distinction between equation and conditions
-   the interval on which a solution could exist

A candidate solution must turn the ODE into an identity and satisfy every
extra condition.

A general solution is a family. Initial or boundary data act as filters on
that family.

The most useful habit from this chapter is:

```{=latex}
\Needspace{8\baselineskip}
```
> identify the roles, read the rates, verify the identity, apply the
> conditions, and state the interval.
