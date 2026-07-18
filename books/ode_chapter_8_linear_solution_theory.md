# Understanding The Structure Of Linear ODE Solutions

This chapter studies what can be known about solutions of linear ordinary
differential equations before a specific solution method is chosen.

The emphasis is structural. We will ask why homogeneous solutions can be
combined, how many independent solutions are needed, what the Wronskian
actually tests, and why one particular forced response generates an entire
nonhomogeneous family.

The central questions are:

- what makes an equation linear at order $n$?
- what do existence and uniqueness guarantee?
- why does an $n$th-order homogeneous equation require $n$ independent
  solution directions?
- how can linear independence be tested directly or with a Wronskian?
- why is a nonhomogeneous solution always “complementary part plus one
  particular part”?

The chapter's organising idea is:

> linearity makes the solution set predictable: homogeneous solutions form a
> space of reusable directions, and forcing shifts that space to a new family.

All examples, data, and exercises are independently constructed. The reference
text is used only to identify the mathematical topics.

---

## Block 1: Recognising A Linear Equation Of Any Order

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognise an $n$th-order linear differential equation and
separate four ideas that are often confused:

- order
- linearity
- homogeneity
- constant or variable coefficients

> these labels answer different questions, so an equation may carry several
> of them at once.

</details>

<details open>
<summary><strong>The General Linear Pattern</strong></summary>

An $n$th-order linear ordinary differential equation has the form:

$$
\boxed{
b_n(x)y^{(n)}
+b_{n-1}(x)y^{(n-1)}
+\cdots
+b_1(x)y'
+b_0(x)y
=g(x)
}
$$

where:

- $y=y(x)$ is the unknown function
- $y^{(k)}$ is its $k$th derivative
- each coefficient $b_k(x)$ depends only on $x$
- the forcing term $g(x)$ also depends only on $x$
- the leading coefficient $b_n(x)$ is not identically zero

Linearity concerns how the unknown function and its derivatives appear.

They may:

- be added
- be multiplied by functions of $x$
- appear to the first power

They may not:

- multiply one another
- appear inside nonlinear functions
- the unknown and its derivatives may not be raised to nonlinear powers
- occur in a coefficient that depends on $y$

The practical meaning is:

> the coefficient functions may be complicated in $x$; the equation is
> linear only if its dependence on $y,y',\ldots,y^{(n)}$ is linear.

</details>

<details open>
<summary><strong>Order And Linearity Are Separate</strong></summary>

The **order** is the highest derivative appearing in the equation.

Consider:

$$
(1+x^2)y'''-e^x y'+4y=\sin x.
$$

The highest derivative is $y'''$, so the equation is third-order.

It is also linear because:

- $y'''$, $y'$, and $y$ appear only to the first power
- their coefficients $1+x^2$, $-e^x$, and $4$ depend only on $x$
- the forcing $\sin x$ does not depend on $y$

By contrast:

$$
y''+yy'=0
$$

is second-order but nonlinear because $y$ multiplies $y'$.

A second nonlinear example is:

$$
y''+\sin(y)=x
$$

is also second-order and nonlinear because the unknown appears inside
$\sin(y)$.

</details>

<details open>
<summary><strong>Homogeneous And Nonhomogeneous</strong></summary>

A linear equation is **homogeneous** when its forcing term is zero:

$$
\boxed{
b_ny^{(n)}+\cdots+b_1y'+b_0y=0
}.
$$

It is **nonhomogeneous** when the forcing term is not identically zero:

$$
\boxed{
b_ny^{(n)}+\cdots+b_1y'+b_0y=g(x),
\qquad g\not\equiv0
}.
$$

For example:

$$
x^2y''-3xy'+2y=0
$$

is homogeneous, whereas:

$$
x^2y''-3xy'+2y=\ln x
$$

is nonhomogeneous on $x>0$.

Here **homogeneous** does not mean the first-order substitution pattern from
Chapter 4. In this chapter, it means that a linear operator sends $y$ to zero.

</details>

<details open>
<summary><strong>Constant And Variable Coefficients</strong></summary>

The constant-coefficient equation:

$$
2y'''-5y'+7y=e^x
$$

has constant coefficients because $2$, $0$, $-5$, and $7$ are constants.

The variable-coefficient equation:

$$
(1+x^2)y''+xy'-4y=0
$$

has variable coefficients because $1+x^2$ and $x$ vary with the independent
variable.

Both equations are linear. Constant coefficients describe a special class of
linear equations; they do not define linearity itself.

</details>

<details open>
<summary><strong>Normal Form And The Working Interval</strong></summary>

If $b_n(x)\neq0$ on an interval $I$, divide every term by $b_n(x)$:

$$
y^{(n)}
+a_{n-1}(x)y^{(n-1)}
+\cdots
+a_1(x)y'
+a_0(x)y
=f(x),
$$

where:

$$
a_k(x)=\frac{b_k(x)}{b_n(x)},
\qquad
f(x)=\frac{g(x)}{b_n(x)}.
$$

This is the **normal form**.

The division matters because it may split the real line into separate working
intervals.

For example, start from:

$$
(x-2)y''+(x+1)y'-y=e^x.
$$

The leading coefficient is $x-2$. It vanishes at $x=2$.

For $x\neq2$, divide every term by $x-2$:

$$
\boxed{
y''
+\frac{x+1}{x-2}y'
-\frac1{x-2}y
=\frac{e^x}{x-2}
}.
$$

The natural intervals are:

$$
(-\infty,2)
\qquad\text{and}\qquad
(2,\infty).
$$

The equation cannot be treated as one regular normal-form problem across
$x=2$.

</details>

<details open>
<summary><strong>A Classification Workflow</strong></summary>

Given an equation, ask the following questions in order.

### Step 1: What is the highest derivative?

This determines the order.

### Step 2: How does the unknown appear?

Check $y,y',\ldots,y^{(n)}$ for products, powers, or nonlinear functions.

### Step 3: Is the forcing zero?

This distinguishes homogeneous from nonhomogeneous linear equations.

### Step 4: Do the coefficients vary with $x$?

This distinguishes constant from variable coefficients.

### Step 5: Where is the leading coefficient nonzero?

This determines the intervals on which normal form and the standard theory
apply.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

An $n$th-order equation is linear when it can be written as:

$$
b_n(x)y^{(n)}+\cdots+b_0(x)y=g(x).
$$

Classify order, linearity, homogeneity, and coefficient type separately. Before
using the theory, identify an interval on which the leading coefficient does
not vanish.

</details>

---

## Block 2: The Linear Differential Operator

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to package the left side of a linear differential equation into an
operator and use its linearity to explain the structure of the solution set.

> the operator notation is useful because it exposes which algebraic steps are
> valid for every linear equation, regardless of order.

</details>

<details open>
<summary><strong>Defining The Operator</strong></summary>

On an interval where the equation is in normal form, define:

$$
\boxed{
L[y]
=
y^{(n)}
+a_{n-1}(x)y^{(n-1)}
+\cdots
+a_1(x)y'
+a_0(x)y
}.
$$

The differential equation becomes:

$$
L[y]=f(x).
$$

The associated homogeneous equation is:

$$
L[y]=0.
$$

The same operator $L$ appears in both equations. Only the right side changes.

</details>

<details open>
<summary><strong>What Operator Linearity Means</strong></summary>

The operator $L$ is linear if, for any sufficiently differentiable functions
$u$ and $v$ and constants $\alpha$ and $\beta$:

$$
\boxed{
L[\alpha u+\beta v]
=
\alpha L[u]+\beta L[v]
}.
$$

The coefficients $\alpha$ and $\beta$ must be constants. If they were
functions of $x$, differentiating their products would create extra terms.

Linearity follows from two facts:

$$
(\alpha u+\beta v)^{(k)}
=
\alpha u^{(k)}+\beta v^{(k)}
$$

for constant $\alpha,\beta$, and multiplication by each coefficient
$a_k(x)$ distributes over addition.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Operator Check</strong></summary>

Consider the operator:

$$
L[y]=y''+x^2y'-3y.
$$

Here $y$ is a placeholder for whichever function is supplied to $L$. The
operator takes that input function, forms its first and second derivatives,
and combines the three resulting terms according to the displayed rule.

Choose any twice-differentiable functions $u$ and $v$, and choose any
constants $\alpha$ and $\beta$. Build a new input function:

$$
w=\alpha u+\beta v.
$$

The question is whether applying $L$ once to the combined input $w$ gives the
same result as applying $L$ to $u$ and $v$ separately and then combining the
outputs. In symbols, we want to verify:

$$
L[w]
=
\alpha L[u]+\beta L[v].
$$

### Step 1: Apply The Operator Rule To $w$

Replace the placeholder $y$ in the operator definition by $w$:

$$
L[w]=w''+x^2w'-3w.
$$

### Step 2: Differentiate The Combined Input

Because $w=\alpha u+\beta v$ and $\alpha,\beta$ are constants:

$$
\begin{aligned}
w'&=\alpha u'+\beta v', \\
w''&=\alpha u''+\beta v''.
\end{aligned}
$$

### Step 3: Substitute All Three Expressions

Use the formulas for $w$, $w'$, and $w''$ in
$L[w]=w''+x^2w'-3w$:

$$
\begin{aligned}
L[w]
&=\alpha u''+\beta v''
+x^2(\alpha u'+\beta v')
-3(\alpha u+\beta v) \\
&=\alpha u''+\beta v''
+\alpha x^2u'+\beta x^2v'
-3\alpha u-3\beta v.
\end{aligned}
$$

### Step 4: Group The $u$-Terms And $v$-Terms

$$
\begin{aligned}
L[w]
&=\alpha(u''+x^2u'-3u)
+\beta(v''+x^2v'-3v).
\end{aligned}
$$

### Step 5: Recognise The Two Operator Outputs

Applying the original operator rule separately to $u$ and $v$ gives:

$$
L[u]=u''+x^2u'-3u,
\qquad
L[v]=v''+x^2v'-3v.
$$

Therefore the grouped expressions in the previous line are exactly $L[u]$
and $L[v]$:

$$
\begin{aligned}
L[w]
&=\alpha L[u]+\beta L[v].
\end{aligned}
$$

Finally, because $w=\alpha u+\beta v$:

$$
\boxed{
L[\alpha u+\beta v]
=\alpha L[u]+\beta L[v]
}.
$$

This proves that the operator is linear. Every symbol in the final identity
now refers either to one of the two chosen input functions or to one of their
constant multipliers.

</details>

<details open>
<summary><strong>Why A Nonlinear Operator Fails</strong></summary>

Consider instead:

$$
N[y]=y''+y^2.
$$

Apply the nonlinear operator $N[y]=y''+y^2$ to $u+v$:

$$
N[u+v]=(u+v)''+(u+v)^2.
$$

Expand both terms:

$$
N[u+v]
=u''+v''+u^2+2uv+v^2.
$$

But:

$$
N[u]+N[v]
=u''+u^2+v''+v^2.
$$

The extra term $2uv$ means:

$$
N[u+v]\neq N[u]+N[v]
$$

in general. Superposition cannot be assumed for nonlinear equations.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Writing a linear equation as $L[y]=f$ makes the key identity visible:

$$
L[\alpha u+\beta v]
=
\alpha L[u]+\beta L[v].
$$

This identity will explain superposition, complementary solutions, and the
form of every nonhomogeneous solution.

</details>

---

## Block 3: Existence, Uniqueness, And Initial Data

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what the standard existence-and-uniqueness theorem
guarantees for a regular $n$th-order linear initial-value problem.

The theorem does not provide a formula. It tells us whether the initial data
select exactly one solution on a stated interval.

</details>

<details open>
<summary><strong>The Initial Data For An $n$th-Order Equation</strong></summary>

For an $n$th-order equation, the standard initial conditions prescribe the
function and its first $n-1$ derivatives at one point $x_0$:

$$
\boxed{
\begin{aligned}
y(x_0)&=\gamma_0, \\
y'(x_0)&=\gamma_1, \\
&\ \vdots \\
y^{(n-1)}(x_0)&=\gamma_{n-1}.
\end{aligned}
}
$$

There are $n$ pieces of initial data.

For a second-order equation, these are:

$$
y(x_0)=\gamma_0,
\qquad
y'(x_0)=\gamma_1.
$$

For a third-order equation, one also specifies $y''(x_0)$.

The number of initial conditions matches the number of arbitrary constants in
a general solution.

</details>

<details open>
<summary><strong>The Existence-And-Uniqueness Statement</strong></summary>

Consider the normal-form equation:

$$
y^{(n)}
+a_{n-1}(x)y^{(n-1)}
+\cdots
+a_0(x)y
=f(x).
$$

Suppose:

- $a_0,\ldots,a_{n-1}$ are continuous on an interval $I$
- $f$ is continuous on $I$
- the initial point $x_0$ lies in $I$

Then, for any prescribed values
$\gamma_0,\ldots,\gamma_{n-1}$, the initial-value problem has exactly one
solution on $I$.

The theorem contains two promises:

1. **existence:** at least one solution satisfies the equation and data
2. **uniqueness:** no second, different solution satisfies the same equation
   and data on that interval

The interval is part of the conclusion. Continuity must hold throughout it.

</details>

<details open>
<summary><strong>Worked Interval Example</strong></summary>

Consider:

$$
(x-2)y''+(x+1)y'-y=e^x.
$$

Suppose the initial conditions are prescribed at $x_0=3$.

### Step 1: Put the equation in normal form

For $x\neq2$, divide every term by $x-2$:

$$
y''
+\frac{x+1}{x-2}y'
-\frac1{x-2}y
=\frac{e^x}{x-2}.
$$

### Step 2: Identify where the coefficients are continuous

The coefficient and forcing functions are:

$$
a_1(x)=\frac{x+1}{x-2},
\qquad
a_0(x)=-\frac1{x-2},
\qquad
f(x)=\frac{e^x}{x-2}.
$$

All three are continuous on:

$$
(-\infty,2)
\qquad\text{and}\qquad
(2,\infty).
$$

### Step 3: Choose the interval containing the initial point

Since $x_0=3$, the relevant interval is:

$$
(2,\infty).
$$

### Step 4: State the theorem's conclusion

For any prescribed values $y(3)=\gamma_0$ and $y'(3)=\gamma_1$, there is
exactly one solution on:

$$
\boxed{(2,\infty)}.
$$

The theorem does not guarantee continuation through $x=2$ because the leading
coefficient vanishes there and the normal-form coefficients are singular.

</details>

<details open>
<summary><strong>What Happens If The Initial Point Is Singular?</strong></summary>

For:

$$
(x-2)y''+(x+1)y'-y=e^x,
$$

the point $x=2$ is singular because the coefficient of $y''$ is zero.

If initial data are prescribed at $x_0=2$, the standard theorem does not
apply. This does **not** automatically mean that no solution exists or that
solutions are nonunique.

It means only:

> the theorem's hypotheses fail, so the theorem makes no promise at that
> point; the problem requires separate analysis.

</details>

<details open>
<summary><strong>Uniqueness And The Zero Solution</strong></summary>

Every homogeneous linear equation has the zero solution:

$$
y(x)=0.
$$

Its derivatives are also zero, so $L[0]=0$.

Now consider a regular homogeneous $n$th-order equation with zero initial
data:

$$
y(x_0)=y'(x_0)=\cdots=y^{(n-1)}(x_0)=0.
$$

For the zero initial data above, the zero function satisfies both the equation
and the data. Uniqueness then implies:

$$
\boxed{y(x)\equiv0}
$$

is the only solution of that initial-value problem.

This fact will later help prove that a fundamental set of solutions is
independent.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

For a regular $n$th-order linear equation, $n$ initial values at one point
select exactly one solution on any interval where the normal-form coefficients
and forcing are continuous.

The theorem gives certainty about existence and uniqueness, but it must not be
applied across a singular point.

</details>

---

## Block 4: Superposition And The Homogeneous Solution Space

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand why constant linear combinations of homogeneous
solutions are again solutions and why an $n$th-order equation needs $n$
independent solution directions.

> superposition does not merely produce more solutions; it reveals the shape
> of the entire homogeneous solution set.

</details>

<details open>
<summary><strong>The Superposition Principle</strong></summary>

Suppose $y_1$ and $y_2$ solve the same homogeneous linear equation:

$$
L[y_1]=0,
\qquad
L[y_2]=0.
$$

Let $c_1$ and $c_2$ be constants. Operator linearity gives:

$$
L[c_1y_1+c_2y_2]
=c_1L[y_1]+c_2L[y_2].
$$

Substitute $L[y_1]=0$ and $L[y_2]=0$:

$$
\begin{aligned}
L[c_1y_1+c_2y_2]
&=c_1(0)+c_2(0) \\
&=0.
\end{aligned}
$$

Therefore:

$$
\boxed{
y=c_1y_1+c_2y_2
}
$$

is also a homogeneous solution.

The same argument works for any finite collection:

$$
L\left[\sum_{k=1}^{m}c_ky_k\right]
=
\sum_{k=1}^{m}c_kL[y_k]
=0.
$$

</details>

<details open>
<summary><strong>Why The Right Side Must Be Zero</strong></summary>

Suppose instead that $y_1$ and $y_2$ both solve:

$$
L[y]=f(x).
$$

For two solutions of $L[y]=f$, the operator values are:

$$
L[y_1]=f,
\qquad
L[y_2]=f.
$$

For constants $c_1,c_2$:

$$
\begin{aligned}
L[c_1y_1+c_2y_2]
&=c_1L[y_1]+c_2L[y_2] \\
&=(c_1+c_2)f.
\end{aligned}
$$

This equals $f$ only when:

$$
c_1+c_2=1
$$

or when $f=0$.

So arbitrary superposition belongs to the homogeneous equation. The
nonhomogeneous case has a related but different structure, developed later.

</details>

<details open>
<summary><strong>Running Example: Two Oscillatory Solutions</strong></summary>

Consider the homogeneous equation:

$$
y''+4y=0.
$$

Two proposed solutions are:

$$
y_1(x)=\cos(2x),
\qquad
y_2(x)=\sin(2x).
$$

Verify $y_1$ first. Differentiate twice:

$$
\begin{aligned}
y_1'(x)&=-2\sin(2x), \\
y_1''(x)&=-4\cos(2x).
\end{aligned}
$$

Substitute $y_1$ and $y_1''$ into $y''+4y$:

$$
\begin{aligned}
y_1''+4y_1
&=-4\cos(2x)+4\cos(2x) \\
&=0.
\end{aligned}
$$

Now verify $y_2$. Differentiate twice:

$$
\begin{aligned}
y_2'(x)&=2\cos(2x), \\
y_2''(x)&=-4\sin(2x).
\end{aligned}
$$

Substitute $y_2$ and $y_2''$:

$$
\begin{aligned}
y_2''+4y_2
&=-4\sin(2x)+4\sin(2x) \\
&=0.
\end{aligned}
$$

Therefore superposition guarantees that:

$$
\boxed{
y=c_1\cos(2x)+c_2\sin(2x)
}
$$

is a solution for every pair of constants $c_1,c_2$.

We will shortly verify that the two functions are independent. Once that is
known, this family is the general solution.

</details>

<details open>
<summary><strong>The Solution Set Behaves Like A Vector Space</strong></summary>

The solutions of $L[y]=0$ have two closure properties:

1. adding two solutions gives another solution
2. multiplying a solution by a constant gives another solution

The zero function is also a solution.

These are the defining algebraic behaviours of a vector space. The “vectors”
are functions rather than arrows or coordinate lists.

In this viewpoint:

- a solution such as $y_1$ is one direction
- constants scale that direction
- sums combine directions
- an independent set contains no redundant direction
- a basis is a smallest complete set of directions

This language will make the role of the Wronskian more natural.

</details>

<details open>
<summary><strong>Why The Order Predicts The Number Of Directions</strong></summary>

A regular $n$th-order homogeneous linear equation has an $n$-dimensional
solution space.

That means there exist $n$ linearly independent solutions:

$$
y_1,y_2,\ldots,y_n,
$$

and every homogeneous solution can be written uniquely as:

$$
\boxed{
y_h=c_1y_1+c_2y_2+\cdots+c_ny_n
}.
$$

The $n$ constants correspond to the $n$ initial values:

$$
y(x_0),y'(x_0),\ldots,y^{(n-1)}(x_0).
$$

The connection is not accidental. Initial data provide $n$ coordinates that
identify one point in the $n$-dimensional solution space.

</details>

<details open>
<summary><strong>A Third-Order Illustration</strong></summary>

Consider:

$$
y'''-y'=0.
$$

Three solutions are:

$$
y_1=1,
\qquad
y_2=e^x,
\qquad
y_3=e^{-x}.
$$

Verify each solution.

For $y_1=1$:

$$
y_1'=0,
\qquad
y_1'''=0,
$$

For $y_1=1$, substitution gives:

$$
y_1'''-y_1'=0-0=0.
$$

For $y_2=e^x$:

$$
y_2'=e^x,
\qquad
y_2'''=e^x,
$$

For $y_2=e^x$, substitution gives:

$$
y_2'''-y_2'=e^x-e^x=0.
$$

For $y_3=e^{-x}$:

$$
y_3'=-e^{-x},
\qquad
y_3'''=-e^{-x},
$$

For $y_3=e^{-x}$, substitution gives:

$$
y_3'''-y_3'=-e^{-x}-(-e^{-x})=0.
$$

Once independence is established, the general solution is:

$$
\boxed{
y_h=c_1+c_2e^x+c_3e^{-x}
}.
$$

Three genuinely different solution directions are needed because the equation
is third-order.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

For a homogeneous linear equation:

$$
L[y]=0,
$$

constant linear combinations of solutions remain solutions. A regular
$n$th-order equation has $n$ independent solution directions, and their linear
combination gives the full homogeneous family.

</details>

---

## Block 5: Linear Independence Without A Determinant

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide whether a collection of functions supplies genuinely
different directions or contains redundancy.

We begin with the definition because the Wronskian is a test derived from this
idea, not a replacement for understanding it.

</details>

<details open>
<summary><strong>The Definition</strong></summary>

Functions $y_1,\ldots,y_m$ are **linearly dependent** on an interval $I$ if
there are constants $c_1,\ldots,c_m$, not all zero, such that:

$$
\boxed{
c_1y_1(x)+\cdots+c_my_m(x)=0
\quad\text{for every }x\in I
}.
$$

They are **linearly independent** on $I$ if the only constants that make this
identity true are:

$$
c_1=c_2=\cdots=c_m=0.
$$

The phrase “for every $x$ in the interval” is essential. An equation that
holds at one or two points does not establish dependence.

</details>

<details open>
<summary><strong>A Dependent Set With An Explicit Relation</strong></summary>

Consider:

$$
y_1=1+x,
\qquad
y_2=2-x,
\qquad
y_3=3.
$$

For $y_1=1+x$ and $y_2=2-x$, add the first two functions:

$$
\begin{aligned}
y_1+y_2
&=(1+x)+(2-x) \\
&=3 \\
&=y_3.
\end{aligned}
$$

Move every term to the left:

$$
y_1+y_2-y_3=0.
$$

Thus the constants:

$$
c_1=1,
\qquad
c_2=1,
\qquad
c_3=-1
$$

are not all zero and satisfy the required identity for every $x$. Therefore
the set is linearly dependent.

The third function adds no new direction; it is already a combination of the
first two.

</details>

<details open>
<summary><strong>An Independent Polynomial Set</strong></summary>

Consider the functions:

$$
1,
\qquad
x,
\qquad
x^2.
$$

Begin with the dependence equation:

$$
c_1+c_2x+c_3x^2=0
$$

for every $x$ in an interval.

In $c_1+c_2x+c_3x^2=0$, the left side is a polynomial. A polynomial that is
zero throughout an interval must have every coefficient equal to zero.
Therefore:

$$
c_1=0,
\qquad
c_2=0,
\qquad
c_3=0.
$$

Only the trivial constants work, so:

$$
\boxed{\{1,x,x^2\}\text{ is linearly independent}.}
$$

</details>

<details open>
<summary><strong>A Direct Test For Two Functions</strong></summary>

For two functions $y_1$ and $y_2$, dependence means one is a constant multiple
of the other on the whole interval.

Suppose:

$$
c_1y_1+c_2y_2=0
$$

with $c_2\neq0$. Rearranging gives:

$$
y_2=-\frac{c_1}{c_2}y_1.
$$

The ratio is a constant.

For example, $e^{3x}$ and $7e^{3x}$ are dependent because:

$$
7e^{3x}-7e^{3x}=0
$$

The dependence relation for $e^{3x}$ and $7e^{3x}$ can be written as:

$$
-7(e^{3x})+1(7e^{3x})=0.
$$

By contrast, $e^{3x}$ and $e^{-x}$ are not constant multiples on any interval
of positive length.

</details>

<details open>
<summary><strong>Independence Depends On The Interval</strong></summary>

Consider:

$$
y_1(x)=x,
\qquad
y_2(x)=|x|.
$$

On the interval $(0,\infty)$:

$$
|x|=x,
$$

so the functions are dependent.

On an interval containing both positive and negative values, suppose:

$$
c_1x+c_2|x|=0
$$

for every $x$.

For $x>0$, $|x|=x$, so:

$$
(c_1+c_2)x=0,
$$

For $x>0$, the identity $(c_1+c_2)x=0$ gives:

$$
c_1+c_2=0.
$$

For $x<0$, $|x|=-x$, so:

$$
(c_1-c_2)x=0,
$$

For $x<0$, the identity $(c_1-c_2)x=0$ gives:

$$
c_1-c_2=0.
$$

Solve the two constant equations:

$$
\begin{aligned}
c_1+c_2&=0, \\
c_1-c_2&=0.
\end{aligned}
$$

Adding them gives $2c_1=0$, so $c_1=0$, and then $c_2=0$. Therefore the
functions are independent on an interval containing values of both signs.

</details>

<details open>
<summary><strong>Why The Number Of Functions Is Not Enough</strong></summary>

A second-order equation needs two independent solutions, not merely two
listed solutions.

Suppose $y_1=e^x$ solves a second-order homogeneous equation. Then:

$$
y_2=5e^x
$$

is also a solution by constant scaling.

But:

$$
y_2=5y_1,
$$

Because $y_2=5y_1$ for $y_1=e^x$, the pair is dependent. Its linear
combinations reduce to:

$$
\begin{aligned}
c_1y_1+c_2y_2
&=c_1e^x+5c_2e^x \\
&=(c_1+5c_2)e^x.
\end{aligned}
$$

There is still only one effective constant and one direction.

What to remember:

> a list reaches the correct length only when none of its functions can be
> recreated from the others using constant coefficients.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Linear dependence is the existence of a nontrivial constant identity:

$$
c_1y_1+\cdots+c_my_m=0.
$$

Linear independence means that only the all-zero constants work. The identity
must hold throughout the stated interval.

</details>

---

## Block 6: The Wronskian As An Independence Test

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand how function values and derivative values can be
assembled into a determinant that tests linear independence.

The Wronskian is powerful, but its zero case must be interpreted with care.

</details>

<details open>
<summary><strong>The Two-Function Wronskian</strong></summary>

For two differentiable functions $y_1$ and $y_2$, their Wronskian is:

$$
\boxed{
W[y_1,y_2](x)
=
\begin{vmatrix}
y_1 & y_2 \\
y_1' & y_2'
\end{vmatrix}
=
y_1y_2'-y_2y_1'
}.
$$

The columns contain the value and first derivative of each function at the
same point.

If the two functions were constant multiples, their columns would be constant
multiples as well, forcing the determinant to be zero.

</details>

<details open>
<summary><strong>Worked Two-Function Calculation</strong></summary>

Find the Wronskian of:

$$
y_1=e^{2x},
\qquad
y_2=e^{-x}.
$$

First calculate the derivatives:

$$
y_1'=2e^{2x},
\qquad
y_2'=-e^{-x}.
$$

For $y_1=e^{2x}$ and $y_2=e^{-x}$, insert
$y_1'=2e^{2x}$ and $y_2'=-e^{-x}$ into the determinant:

$$
W[y_1,y_2]
=
\begin{vmatrix}
e^{2x} & e^{-x} \\
2e^{2x} & -e^{-x}
\end{vmatrix}.
$$

Expand the $2\times2$ determinant:

$$
\begin{aligned}
W[y_1,y_2]
&=e^{2x}(-e^{-x})-e^{-x}(2e^{2x}) \\
&=-e^x-2e^x \\
&=-3e^x.
\end{aligned}
$$

Since $e^x>0$ for every real $x$:

$$
W[y_1,y_2](x)\neq0
$$

for every real $x$. Therefore $e^{2x}$ and $e^{-x}$ are linearly independent
on every real interval.

</details>

<details open>
<summary><strong>The Wronskian For Three Functions</strong></summary>

For three twice-differentiable functions:

$$
\boxed{
W[y_1,y_2,y_3](x)
=
\begin{vmatrix}
y_1 & y_2 & y_3 \\
y_1' & y_2' & y_3' \\
y_1'' & y_2'' & y_3''
\end{vmatrix}
}.
$$

For $n$ functions, continue through derivatives of order $n-1$.

The rows track derivative order. The columns track the individual functions.

</details>

<details open>
<summary><strong>Worked Three-Function Calculation</strong></summary>

Consider:

$$
y_1=1,
\qquad
y_2=x,
\qquad
y_3=e^x.
$$

Their first two derivatives are:

$$
\begin{array}{c|ccc}
&y_1&y_2&y_3 \\
\hline
\text{function}&1&x&e^x \\
\text{first derivative}&0&1&e^x \\
\text{second derivative}&0&0&e^x
\end{array}
$$

Build the Wronskian:

$$
W[1,x,e^x]
=
\begin{vmatrix}
1 & x & e^x \\
0 & 1 & e^x \\
0 & 0 & e^x
\end{vmatrix}.
$$

For this Wronskian, the upper-triangular diagonal entries are $1$, $1$, and
$e^x$. Therefore its determinant is their product:

$$
\begin{aligned}
W[1,x,e^x]
&=(1)(1)(e^x) \\
&=e^x.
\end{aligned}
$$

Since $e^x\neq0$, the three functions are linearly independent on every real
interval.

</details>

<details open>
<summary><strong>Why One Nonzero Value Is Enough</strong></summary>

Suppose the functions were dependent:

$$
c_1y_1+\cdots+c_ny_n=0
$$

with constants not all zero.

Differentiate this identity $n-1$ times. At a point $x_0$, the constants must
satisfy the homogeneous linear system:

$$
\begin{pmatrix}
y_1(x_0) & \cdots & y_n(x_0) \\
y_1'(x_0) & \cdots & y_n'(x_0) \\
\vdots & & \vdots \\
y_1^{(n-1)}(x_0) & \cdots & y_n^{(n-1)}(x_0)
\end{pmatrix}
\begin{pmatrix}
c_1\\
c_2\\
\vdots\\
c_n
\end{pmatrix}
=
\begin{pmatrix}
0\\
0\\
\vdots\\
0
\end{pmatrix}.
$$

The determinant of the coefficient matrix is the Wronskian $W(x_0)$.

If $W(x_0)\neq0$, the matrix is invertible, so the only solution is:

$$
c_1=\cdots=c_n=0.
$$

Therefore a nonzero Wronskian at even one point proves independence on the
interval.

</details>

<details open>
<summary><strong>What A Zero Wronskian Does Not Always Prove</strong></summary>

For arbitrary functions, an identically zero Wronskian does not by itself
prove dependence.

Consider on $(-1,1)$:

$$
f(x)=x^2,
\qquad
g(x)=x|x|.
$$

For $x>0$, $g=x^2$, while for $x<0$, $g=-x^2$. No single constant $C$ makes
$g=Cf$ throughout $(-1,1)$, so the pair is independent there.

Now compute the Wronskian away from $x=0$.

For $f=x^2$ and $g=x|x|$, when $x>0$:

$$
g=x^2,
\qquad
g'=2x,
$$

so:

$$
W[f,g]=x^2(2x)-x^2(2x)=0.
$$

For $x<0$:

$$
g=-x^2,
\qquad
g'=-2x,
$$

so:

$$
\begin{aligned}
W[f,g]
&=x^2(-2x)-(-x^2)(2x) \\
&=0.
\end{aligned}
$$

At $x=0$, all function and first-derivative values are zero, so $W(0)=0$ as
well.

Thus the Wronskian is identically zero even though the functions are
independent on $(-1,1)$.

The missing hypothesis is important: these functions are not both solutions
of one regular second-order homogeneous linear equation on an interval
containing $0$.

</details>

<details open>
<summary><strong>Why Solutions Of One Regular Equation Behave Better</strong></summary>

Let $y_1$ and $y_2$ solve the same regular second-order homogeneous equation:

$$
y''+p(x)y'+q(x)y=0,
$$

where $p$ and $q$ are continuous on an interval $I$.

For two solutions $y_1,y_2$ of $y''+py'+qy=0$, their Wronskian is:

$$
W=y_1y_2'-y_2y_1'.
$$

Differentiate it:

$$
\begin{aligned}
W'
&=y_1'y_2'+y_1y_2''-y_2'y_1'-y_2y_1'' \\
&=y_1y_2''-y_2y_1''.
\end{aligned}
$$

Because each function solves the differential equation:

$$
y_i''=-p(x)y_i'-q(x)y_i.
$$

Substitute the two second derivatives:

$$
\begin{aligned}
W'
&=y_1(-py_2'-qy_2)-y_2(-py_1'-qy_1) \\
&=-py_1y_2'-qy_1y_2+py_2y_1'+qy_2y_1 \\
&=-p(y_1y_2'-y_2y_1') \\
&=-pW.
\end{aligned}
$$

So the Wronskian itself satisfies:

$$
W'=-pW.
$$

Solving this first-order equation gives Abel's identity:

$$
\boxed{
W(x)=W(x_0)
\exp\left(-\int_{x_0}^{x}p(s)\,ds\right)
}.
$$

The exponential factor is never zero. Therefore:

- if $W(x_0)\neq0$ at one point, then $W(x)\neq0$ everywhere on $I$
- if $W(x_0)=0$ at one point, then $W(x)=0$ everywhere on $I$

For solutions of the same regular equation, the Wronskian cannot vanish at an
isolated point and then recover.

</details>

<details open>
<summary><strong>A Wronskian Decision Rule</strong></summary>

For functions $y_1,\ldots,y_n$ on an interval:

1. If $W(x_0)\neq0$ at any point, the functions are independent.
2. If $W\equiv0$ and the functions are known solutions of the same regular
   $n$th-order homogeneous linear equation, they are dependent.
3. If $W\equiv0$ for arbitrary functions, the test is inconclusive; return to
   the direct definition.

This is the safe way to use the Wronskian without claiming more than it proves.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

The Wronskian packages function values and derivatives into a determinant.

$$
W(x_0)\neq0
\quad\Longrightarrow\quad
\text{linear independence}.
$$

A zero Wronskian proves dependence only with additional structure, most
importantly when the functions solve the same regular homogeneous linear
equation.

</details>

---

## Block 7: Fundamental Sets And Initial Conditions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn a set of known solutions into the general homogeneous
solution and then use initial conditions to determine its constants.

> a fundamental set is not just a collection of solutions; it is a complete,
> nonredundant coordinate system for the solution space.

</details>

<details open>
<summary><strong>What A Fundamental Set Is</strong></summary>

For a regular $n$th-order homogeneous equation, a **fundamental set of
solutions** on an interval $I$ is a collection:

$$
\{y_1,y_2,\ldots,y_n\}
$$

such that:

1. every $y_k$ solves the equation on $I$
2. the $n$ functions are linearly independent on $I$

The general homogeneous solution is then:

$$
\boxed{
y_h=c_1y_1+c_2y_2+\cdots+c_ny_n
}.
$$

Both requirements matter. A set of independent functions is not useful unless
the functions solve the equation, and a set of solutions is not fundamental
if it contains redundancy.

</details>

<details open>
<summary><strong>Completing The Oscillatory Example</strong></summary>

Return to:

$$
y''+4y=0.
$$

We already verified that:

$$
y_1=\cos(2x),
\qquad
y_2=\sin(2x)
$$

are solutions.

Their derivatives are:

$$
y_1'=-2\sin(2x),
\qquad
y_2'=2\cos(2x).
$$

Build the Wronskian:

$$
W[y_1,y_2]
=
\begin{vmatrix}
\cos(2x) & \sin(2x) \\
-2\sin(2x) & 2\cos(2x)
\end{vmatrix}.
$$

Expand the determinant:

$$
\begin{aligned}
W[y_1,y_2]
&=2\cos^2(2x)+2\sin^2(2x) \\
&=2\left(\cos^2(2x)+\sin^2(2x)\right) \\
&=2.
\end{aligned}
$$

Since $W=2\neq0$, the functions are linearly independent. They form a
fundamental set, so the general solution is:

$$
\boxed{
y_h=c_1\cos(2x)+c_2\sin(2x)
}.
$$

</details>

<details open>
<summary><strong>Worked Initial-Value Problem</strong></summary>

Solve:

$$
y''+4y=0,
\qquad
y(0)=3,
\qquad
y'(0)=-4.
$$

### Step 1: Restate the general solution

The fundamental set gives:

$$
y(x)=c_1\cos(2x)+c_2\sin(2x).
$$

### Step 2: Differentiate before applying derivative data

Differentiate the complete family:

$$
y'(x)
=-2c_1\sin(2x)+2c_2\cos(2x).
$$

### Step 3: Apply $y(0)=3$

Substitute $x=0$ into the complete function formula:

$$
3=c_1\cos0+c_2\sin0.
$$

Use $\cos0=1$ and $\sin0=0$:

$$
3=c_1.
$$

Therefore:

$$
c_1=3.
$$

### Step 4: Apply $y'(0)=-4$

Substitute $x=0$ into the derivative formula:

$$
-4=-2c_1\sin0+2c_2\cos0.
$$

Use $\sin0=0$ and $\cos0=1$:

$$
-4=2c_2.
$$

Divide by $2$:

$$
c_2=-2.
$$

### Step 5: Write and verify the selected solution

Insert $c_1=3$ and $c_2=-2$ into the general family:

$$
\boxed{
y(x)=3\cos(2x)-2\sin(2x)
}.
$$

Differentiate twice:

$$
\begin{aligned}
y'(x)&=-6\sin(2x)-4\cos(2x), \\
y''(x)&=-12\cos(2x)+8\sin(2x).
\end{aligned}
$$

Substitute into the equation:

$$
\begin{aligned}
y''+4y
&=\left(-12\cos(2x)+8\sin(2x)\right) \\
&\quad+4\left(3\cos(2x)-2\sin(2x)\right) \\
&=0.
\end{aligned}
$$

The initial values are also visible:

$$
y(0)=3,
\qquad
y'(0)=-4.
$$

</details>

<details open>
<summary><strong>The Wronskian Is Also An Initial-Data Determinant</strong></summary>

For a second-order family:

$$
y=c_1y_1+c_2y_2,
$$

the initial conditions at $x_0$ give:

$$
\begin{aligned}
c_1y_1(x_0)+c_2y_2(x_0)&=\gamma_0, \\
c_1y_1'(x_0)+c_2y_2'(x_0)&=\gamma_1.
\end{aligned}
$$

Write this as a matrix system:

$$
\begin{pmatrix}
y_1(x_0) & y_2(x_0) \\
y_1'(x_0) & y_2'(x_0)
\end{pmatrix}
\begin{pmatrix}
c_1\\
c_2
\end{pmatrix}
=
\begin{pmatrix}
\gamma_0\\
\gamma_1
\end{pmatrix}.
$$

The determinant of the coefficient matrix is:

$$
W[y_1,y_2](x_0).
$$

If the Wronskian is nonzero, the matrix is invertible, so every pair of initial
values determines one and only one pair of constants.

This links three ideas:

$$
\boxed{
\text{nonzero Wronskian}
\Longleftrightarrow
\text{independent solution directions}
\Longleftrightarrow
\text{unique coordinates from initial data}
}.
$$

</details>

<details open>
<summary><strong>Checking The Third-Order Fundamental Set</strong></summary>

For:

$$
y'''-y'=0,
$$

we verified the solutions:

$$
1,
\qquad
e^x,
\qquad
e^{-x}.
$$

Their Wronskian is:

$$
W[1,e^x,e^{-x}]
=
\begin{vmatrix}
1 & e^x & e^{-x} \\
0 & e^x & -e^{-x} \\
0 & e^x & e^{-x}
\end{vmatrix}.
$$

Expand along the first column:

$$
\begin{aligned}
W[1,e^x,e^{-x}]
&=1
\begin{vmatrix}
e^x & -e^{-x} \\
e^x & e^{-x}
\end{vmatrix} \\
&=e^x e^{-x}-(-e^{-x})e^x \\
&=1+1 \\
&=2.
\end{aligned}
$$

The Wronskian is nonzero, so the three solutions form a fundamental set. The
general solution is therefore:

$$
\boxed{
y_h=c_1+c_2e^x+c_3e^{-x}
}.
$$

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

A fundamental set for an $n$th-order homogeneous equation contains exactly
$n$ independent solutions. Their Wronskian is nonzero on the regular interval,
and their linear combination represents every homogeneous solution.

Initial data determine the coefficients because the same Wronskian matrix is
invertible.

</details>

---

## Block 8: The Structure Of Nonhomogeneous Solutions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to prove the general form of solutions to:

$$
L[y]=f(x)
$$

and understand the different roles of the complementary solution and a
particular solution.

> forcing chooses the location of the solution family; homogeneous solutions
> describe every direction in which one forced solution may be adjusted.

</details>

<details open>
<summary><strong>Associated Homogeneous And Particular Solutions</strong></summary>

For the nonhomogeneous equation:

$$
L[y]=f(x),
$$

For $L[y]=f(x)$, the forcing is $f(x)$ and the **associated homogeneous
equation** is:

$$
L[y]=0.
$$

Let $y_h$ denote the general solution of the homogeneous equation.

A **particular solution** $y_p$ is one specific function satisfying:

$$
L[y_p]=f(x).
$$

It contains no arbitrary constants when we use it as the chosen representative
of the forced response.

</details>

<details open>
<summary><strong>Why $y_h+y_p$ Is A Solution</strong></summary>

Suppose:

$$
L[y_h]=0
$$

and:

$$
L[y_p]=f.
$$

Apply the linear operator to their sum:

$$
\begin{aligned}
L[y_h+y_p]
&=L[y_h]+L[y_p] \\
&=0+f \\
&=f.
\end{aligned}
$$

Since $L[y_h+y_p]=0+f=f$, every function of the form:

$$
y=y_h+y_p
$$

solves the nonhomogeneous equation.

</details>

<details open>
<summary><strong>Why This Form Gives Every Solution</strong></summary>

It remains to show that no nonhomogeneous solutions are missing.

Let $y$ be any solution of:

$$
L[y]=f,
$$

and let $y_p$ be one chosen particular solution:

$$
L[y_p]=f.
$$

Define their difference:

$$
z=y-y_p.
$$

Apply $L$ to $z$:

$$
\begin{aligned}
L[z]
&=L[y-y_p] \\
&=L[y]-L[y_p] \\
&=f-f \\
&=0.
\end{aligned}
$$

Because $L[z]=0$ for $z=y-y_p$, the difference is a homogeneous solution and:

$$
y=z+y_p.
$$

Rename the arbitrary homogeneous solution $z$ as $y_h$:

$$
\boxed{
y=y_h+y_p
}.
$$

This proves both that the formula works and that it captures every solution.

</details>

<details open>
<summary><strong>Complete Nonhomogeneous Example</strong></summary>

Consider:

$$
y''-9y=18x.
$$

We are given that the associated homogeneous equation has independent
solutions:

$$
e^{3x}
\qquad\text{and}\qquad
e^{-3x}.
$$

Find the general solution and then solve the initial-value problem:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

### Step 1: Build the complementary solution

The associated homogeneous equation is:

$$
y''-9y=0.
$$

For $y''-9y=0$, the known independent solutions $e^{3x}$ and $e^{-3x}$ give:

$$
y_h=c_1e^{3x}+c_2e^{-3x}.
$$

### Step 2: Verify a particular solution

Try the proposed function:

$$
y_p=-2x.
$$

Its derivatives are:

$$
y_p'=-2,
\qquad
y_p''=0.
$$

Substitute into the left side $y''-9y$:

$$
\begin{aligned}
y_p''-9y_p
&=0-9(-2x) \\
&=18x.
\end{aligned}
$$

Therefore $y_p=-2x$ is a particular solution.

### Step 3: Write the general nonhomogeneous solution

Combine the complementary and particular parts:

$$
\boxed{
y=c_1e^{3x}+c_2e^{-3x}-2x
}.
$$

### Step 4: Differentiate the complete family

Differentiate before applying the derivative condition:

$$
y'=3c_1e^{3x}-3c_2e^{-3x}-2.
$$

### Step 5: Apply $y(0)=1$

Substitute $x=0$ into the complete solution:

$$
1=c_1e^0+c_2e^0-2(0).
$$

Therefore:

$$
c_1+c_2=1.
$$

### Step 6: Apply $y'(0)=0$

Substitute $x=0$ into the derivative formula:

$$
0=3c_1e^0-3c_2e^0-2.
$$

Therefore:

$$
3c_1-3c_2=2.
$$

### Step 7: Solve the constant system visibly

The two equations are:

$$
\begin{aligned}
c_1+c_2&=1, \\
3c_1-3c_2&=2.
\end{aligned}
$$

Divide the second equation by $3$:

$$
c_1-c_2=\frac23.
$$

Now add $c_1+c_2=1$ and $c_1-c_2=2/3$:

$$
2c_1=\frac53.
$$

From $2c_1=5/3$, divide by $2$:

$$
c_1=\frac56.
$$

Substitute $c_1=5/6$ into $c_1+c_2=1$:

$$
\frac56+c_2=1.
$$

Subtract $5/6$:

$$
c_2=\frac16.
$$

The selected solution is:

$$
\boxed{
y(x)=\frac56e^{3x}+\frac16e^{-3x}-2x
}.
$$

</details>

<details open>
<summary><strong>Particular Solutions Are Not Unique</strong></summary>

For:

$$
y''-9y=18x,
$$

we found the particular solution:

$$
y_p=-2x.
$$

Since $e^{3x}$ solves the homogeneous equation, consider:

$$
\widetilde y_p=-2x+e^{3x}.
$$

Apply the operator $L[y]=y''-9y$:

$$
\begin{aligned}
L[\widetilde y_p]
&=L[-2x+e^{3x}] \\
&=L[-2x]+L[e^{3x}] \\
&=18x+0 \\
&=18x.
\end{aligned}
$$

Thus $\widetilde y_p$ is also a particular solution.

This does not produce a different general family:

$$
\begin{aligned}
y_h+\widetilde y_p
&=(c_1e^{3x}+c_2e^{-3x})+(-2x+e^{3x}) \\
&=(c_1+1)e^{3x}+c_2e^{-3x}-2x.
\end{aligned}
$$

Since $c_1+1$ is still an arbitrary constant, the same family results.

</details>

<details open>
<summary><strong>The Geometry Of A Shifted Solution Space</strong></summary>

The homogeneous solutions form a vector space because they contain zero and
are closed under addition and constant scaling.

The nonhomogeneous solutions usually do not contain zero because:

$$
L[0]=0\neq f.
$$

Instead, the complete nonhomogeneous set is:

$$
y_p+\{\text{all homogeneous solutions}\}.
$$

It is a shifted copy of the homogeneous solution space. In linear algebra,
this is called an **affine space**.

Another way to see it:

> any two forced solutions differ only by a homogeneous solution, so the
> homogeneous family measures every allowable adjustment that leaves the
> forcing unchanged.

</details>

<details open>
<summary><strong>Superposing Different Forcing Terms</strong></summary>

Suppose:

$$
L[u]=f_1
$$

and:

$$
L[v]=f_2.
$$

Then operator linearity gives:

$$
\begin{aligned}
L[u+v]
&=L[u]+L[v] \\
&=f_1+f_2.
\end{aligned}
$$

More generally:

$$
L[\alpha u+\beta v]
=\alpha f_1+\beta f_2.
$$

This means a complicated forcing can sometimes be split into simpler pieces,
with the corresponding particular responses added afterward.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

For:

$$
L[y]=f,
$$

choose one particular solution $y_p$ and find the general homogeneous solution
$y_h$. Then:

$$
\boxed{y=y_h+y_p}
$$

is the complete nonhomogeneous family. Particular solutions are not unique,
but any two differ by a homogeneous solution.

</details>

---

## Block 9: A Reliable Theory Workflow And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to decide which theorem or structural result applies without
skipping its hypotheses.

This chapter is less about mechanical solving and more about making logically
complete conclusions from the information given.

</details>

<details open>
<summary><strong>A Theory-First Workflow</strong></summary>

### Step 1: Classify the equation

State its order, linearity, homogeneity, and coefficient type.

### Step 2: Identify a regular interval

Check the leading coefficient and continuity of the normal-form coefficients.

### Step 3: Define the operator

Write the equation as $L[y]=f$ and its associated homogeneous equation as
$L[y]=0$.

### Step 4: Verify every proposed solution

Differentiate and substitute into the relevant equation.

### Step 5: Test independence

Use the direct definition or the Wronskian with the correct hypotheses.

### Step 6: Build the general family

Use a fundamental homogeneous set, then add one particular solution if the
equation is forced.

### Step 7: Apply initial data

Differentiate the complete family as needed, display the resulting constant
system, and solve it visibly.

### Step 8: State the interval and conclusion

Say exactly what is known: a solution, a general solution, independence, or a
uniqueness guarantee.

</details>

<details open>
<summary><strong>Common Mistake: Confusing Homogeneous With Nonlinear</strong></summary>

The equation:

$$
y''+xy'-4y=0
$$

is linear and homogeneous.

The equation:

$$
y''+y^2=0
$$

has a zero right side but is nonlinear. In this chapter, the homogeneous
solution-space theory applies only to linear equations.

</details>

<details open>
<summary><strong>Common Mistake: Treating Any Two Solutions As A Basis</strong></summary>

For a second-order equation, two solutions form a fundamental set only if they
are independent.

The pair:

$$
e^x,
\qquad
4e^x
$$

contains one direction twice. Its Wronskian is zero, and no choice of two
constants can create a second independent shape.

</details>

<details open>
<summary><strong>Common Mistake: Using Variable Multipliers In Superposition</strong></summary>

If $y_1$ and $y_2$ solve a homogeneous linear equation, then:

$$
c_1y_1+c_2y_2
$$

is a solution for constants $c_1,c_2$.

The expression:

$$
u(x)y_1+v(x)y_2
$$

does not follow from ordinary superposition because differentiating it creates
product-rule terms involving $u'$ and $v'$.

Variable coefficients are used deliberately in methods such as variation of
parameters, but they must satisfy additional equations.

</details>

<details open>
<summary><strong>Common Mistake: Reading Too Much From $W=0$</strong></summary>

For arbitrary functions:

$$
W\equiv0
$$

does not always prove dependence.

Before drawing that conclusion, ask whether the functions are known solutions
of the same regular homogeneous linear equation on the interval. If not, use
the direct constant-combination definition.

</details>

<details open>
<summary><strong>Common Mistake: Adding Two Particular Solutions</strong></summary>

If $L[y_{p1}]=f$ and $L[y_{p2}]=f$, then:

$$
L[y_{p1}+y_{p2}]=2f,
$$

not $f$.

To generate another solution for the same forcing, add a homogeneous solution:

$$
L[y_p+y_h]=f+0=f.
$$

</details>

<details open>
<summary><strong>Common Mistake: Omitting The Interval</strong></summary>

Existence, uniqueness, and independence are interval statements.

If a leading coefficient vanishes or a normal-form coefficient is
discontinuous, the theorem may apply on separate intervals but not across the
singular point.

Write the interval beside the final conclusion.

</details>

<details open>
<summary><strong>Chapter Method Summary</strong></summary>

The chapter's structural chain is:

$$
\begin{aligned}
&\text{linear operator} \\
&\Longrightarrow \text{superposition for }L[y]=0 \\
&\Longrightarrow \text{homogeneous solution space} \\
&\Longrightarrow \text{independent fundamental set} \\
&\Longrightarrow y_h=c_1y_1+\cdots+c_ny_n \\
&\Longrightarrow y=y_h+y_p\text{ for }L[y]=f.
\end{aligned}
$$

The central lesson is:

> verify the operator, interval, and independence before calling a linear
> combination the general solution.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Classify Linear Equations

For each equation, state its order and whether it is linear. For each linear
equation, also state whether it is homogeneous and whether its coefficients are
constant or variable.

$$
\text{(a)}
\qquad
(1+t^2)u'''-tu'+u=0,
$$

$$
\text{(b)}
\qquad
u''+uu'=\cos t,
$$

$$
\text{(c)}
\qquad
(t-1)u''+e^tu=3.
$$

For part (c), identify the maximal regular intervals.

### Problem 2: Use Operator Linearity

Suppose $L$ is linear and:

$$
L[u]=x,
\qquad
L[v]=e^x.
$$

Find:

$$
L[2u-3v].
$$

### Problem 3: Apply Existence And Uniqueness

Consider:

$$
(x+4)y''+(\sin x)y'+y=x^2.
$$

For initial conditions prescribed at $x_0=0$, state the largest interval on
which the standard linear existence-and-uniqueness theorem guarantees one
solution. Explain what the theorem says if the initial point is $x_0=-4$.

### Problem 4: Verify Superposition

Verify that:

$$
y_1=\cos(5x),
\qquad
y_2=\sin(5x)
$$

solve:

$$
y''+25y=0.
$$

Then explain why $4y_1-3y_2$ is also a solution.

### Problem 5: Prove Dependence Directly

Show that the set:

$$
\{2+x,\ 1-2x,\ 5\}
$$

is linearly dependent by displaying constants, not all zero, that produce the
zero function.

### Problem 6: Prove Independence Directly

Use the direct definition and differentiation to show that:

$$
\{1+x,\ e^x\}
$$

is linearly independent on every real interval of positive length.

### Problem 7: Calculate A Two-Function Wronskian

Find the Wronskian of:

$$
y_1=e^x,
\qquad
y_2=xe^x.
$$

State the independence conclusion.

### Problem 8: Interpret A Wronskian With A Zero

Calculate the Wronskian of:

$$
1,
\qquad
x,
\qquad
x^3.
$$

The Wronskian vanishes at $x=0$. Decide whether the functions are independent
on $(-\infty,\infty)$ and explain why the zero at one point does not overturn
your conclusion.

### Problem 9: Build A Third-Order General Solution

For:

$$
y'''-4y'=0,
$$

the functions:

$$
1,
\qquad
e^{2x},
\qquad
e^{-2x}
$$

are known solutions. Calculate their Wronskian and use it to write the general
solution.

### Problem 10: Apply Initial Conditions To A Fundamental Set

Solve:

$$
y''+25y=0,
\qquad
y(0)=2,
\qquad
y'(0)=15,
$$

using the fundamental set $\{\cos(5x),\sin(5x)\}$.

### Problem 11: Add A Particular Solution

For:

$$
y''-16y=8x,
$$

the associated homogeneous equation has fundamental set:

$$
\{e^{4x},e^{-4x}\}.
$$

Verify that $y_p=-x/2$ is a particular solution and write the complete
general solution.

### Problem 12: Compare Two Particular Solutions

Let:

$$
L[y]=y''+y.
$$

Show that:

$$
y_{p1}=x^2
\qquad\text{and}\qquad
y_{p2}=x^2+\sin x
$$

solve the same nonhomogeneous equation. Identify that equation and explain why
the two particular solutions differ by a homogeneous solution.

</details>

<details open>
<summary><strong>Practice Answers</strong></summary>

### Answer 1

For part (a):

$$
(1+t^2)u'''-tu'+u=0.
$$

The highest derivative is $u'''$, so the equation is third-order. The unknown
and its derivatives appear only to the first power, with coefficients depending
only on $t$, so it is linear.

The right side is zero, so it is homogeneous. The coefficients $1+t^2$ and
$-t$ vary with $t$, so it has variable coefficients.

The complete classification for part (a) is:

$$
\boxed{\text{third-order, linear, homogeneous, variable-coefficient}.}
$$

For part (b):

$$
u''+uu'=\cos t.
$$

The highest derivative is $u''$, so it is second-order. The product $uu'$
makes it nonlinear.

Thus part (b) is:

$$
\boxed{\text{second-order and nonlinear}.}
$$

For part (c):

$$
(t-1)u''+e^tu=3.
$$

The highest derivative is $u''$, so it is second-order. The unknown and its
derivatives appear linearly. Since the forcing is $3\neq0$, it is
nonhomogeneous. Its coefficients vary with $t$.

Thus part (c) is:

$$
\boxed{\text{second-order, linear, nonhomogeneous, variable-coefficient}.}
$$

The leading coefficient $t-1$ vanishes at $t=1$. Therefore the maximal regular
intervals are:

$$
\boxed{(-\infty,1)\quad\text{and}\quad(1,\infty)}.
$$

### Answer 2

Operator linearity gives:

$$
L[2u-3v]=2L[u]-3L[v].
$$

Substitute $L[u]=x$ and $L[v]=e^x$:

$$
\begin{aligned}
L[2u-3v]
&=2(x)-3(e^x) \\
&=2x-3e^x.
\end{aligned}
$$

Therefore:

$$
\boxed{L[2u-3v]=2x-3e^x}.
$$

### Answer 3

Start from:

$$
(x+4)y''+(\sin x)y'+y=x^2.
$$

For $x\neq-4$, divide every term by $x+4$:

$$
y''
+\frac{\sin x}{x+4}y'
+\frac1{x+4}y
=\frac{x^2}{x+4}.
$$

The normal-form coefficients and forcing are continuous on:

$$
(-\infty,-4)
\qquad\text{and}\qquad
(-4,\infty).
$$

Since $x_0=0$ lies in $(-4,\infty)$, the theorem guarantees exactly one
solution on:

$$
\boxed{(-4,\infty)}.
$$

If $x_0=-4$, the leading coefficient is zero and normal form is singular. The
standard theorem makes no guarantee there. This failure of the hypotheses does
not by itself prove nonexistence or nonuniqueness.

### Answer 4

For:

$$
y_1=\cos(5x),
$$

differentiate twice:

$$
y_1'=-5\sin(5x),
\qquad
y_1''=-25\cos(5x).
$$

Substitute into $y''+25y$:

$$
y_1''+25y_1
=-25\cos(5x)+25\cos(5x)
=0.
$$

For:

$$
y_2=\sin(5x),
$$

differentiate twice:

$$
y_2'=5\cos(5x),
\qquad
y_2''=-25\sin(5x).
$$

Substitute:

$$
y_2''+25y_2
=-25\sin(5x)+25\sin(5x)
=0.
$$

Thus $L[y_1]=0$ and $L[y_2]=0$ for $L[y]=y''+25y$. By linearity:

$$
\begin{aligned}
L[4y_1-3y_2]
&=4L[y_1]-3L[y_2] \\
&=4(0)-3(0) \\
&=0.
\end{aligned}
$$

Therefore $4\cos(5x)-3\sin(5x)$ is also a solution.

### Answer 5

Let:

$$
f_1=2+x,
\qquad
f_2=1-2x,
\qquad
f_3=5.
$$

Calculate $2f_1+f_2$:

$$
\begin{aligned}
2f_1+f_2
&=2(2+x)+(1-2x) \\
&=4+2x+1-2x \\
&=5 \\
&=f_3.
\end{aligned}
$$

Therefore:

$$
2f_1+f_2-f_3=0.
$$

The constants $2,1,-1$ are not all zero, so the set is linearly dependent.

### Answer 6

Assume constants $c_1,c_2$ satisfy:

$$
c_1(1+x)+c_2e^x=0
$$

for every $x$ in a real interval of positive length.

Differentiate once:

$$
c_1+c_2e^x=0.
$$

Differentiate a second time:

$$
c_2e^x=0.
$$

The second derivative identity is $c_2e^x=0$. Since $e^x\neq0$:

$$
c_2=0.
$$

Substitute $c_2=0$ into $c_1+c_2e^x=0$:

$$
c_1=0.
$$

Only the trivial constants work. Therefore:

$$
\boxed{\{1+x,e^x\}\text{ is linearly independent}.}
$$

### Answer 7

For:

$$
y_1=e^x,
\qquad
y_2=xe^x,
$$

For $y_1=e^x$ and $y_2=xe^x$, the derivatives are:

$$
y_1'=e^x,
\qquad
y_2'=e^x+xe^x.
$$

Build and expand the Wronskian:

$$
\begin{aligned}
W[y_1,y_2]
&=
\begin{vmatrix}
e^x & xe^x \\
e^x & e^x+xe^x
\end{vmatrix} \\
&=e^x(e^x+xe^x)-xe^x(e^x) \\
&=e^{2x}+xe^{2x}-xe^{2x} \\
&=e^{2x}.
\end{aligned}
$$

Since $e^{2x}>0$ for every real $x$, the functions are linearly independent
on every real interval.

### Answer 8

For the functions $1,x,x^3$, construct the derivative table:

$$
\begin{array}{c|ccc}
&1&x&x^3 \\
\hline
\text{function}&1&x&x^3 \\
\text{first derivative}&0&1&3x^2 \\
\text{second derivative}&0&0&6x
\end{array}
$$

The Wronskian is:

$$
W[1,x,x^3]
=
\begin{vmatrix}
1 & x & x^3 \\
0 & 1 & 3x^2 \\
0 & 0 & 6x
\end{vmatrix}.
$$

This matrix is upper triangular, so:

$$
\boxed{W[1,x,x^3]=6x}.
$$

Although $W(0)=0$, we have, for example:

$$
W(1)=6\neq0.
$$

A nonzero Wronskian at one point proves independence on the interval.
Therefore $1,x,x^3$ are linearly independent on $(-\infty,\infty)$.

### Answer 9

For:

$$
y_1=1,
\qquad
y_2=e^{2x},
\qquad
y_3=e^{-2x},
$$

the first two derivatives are:

$$
\begin{array}{c|ccc}
&y_1&y_2&y_3 \\
\hline
\text{function}&1&e^{2x}&e^{-2x} \\
\text{first derivative}&0&2e^{2x}&-2e^{-2x} \\
\text{second derivative}&0&4e^{2x}&4e^{-2x}
\end{array}
$$

For $1,e^{2x},e^{-2x}$, build the Wronskian from the derivative table:

$$
W
=
\begin{vmatrix}
1 & e^{2x} & e^{-2x} \\
0 & 2e^{2x} & -2e^{-2x} \\
0 & 4e^{2x} & 4e^{-2x}
\end{vmatrix}.
$$

Expand along the first column:

$$
\begin{aligned}
W
&=
\begin{vmatrix}
2e^{2x} & -2e^{-2x} \\
4e^{2x} & 4e^{-2x}
\end{vmatrix} \\
&=(2e^{2x})(4e^{-2x})-(-2e^{-2x})(4e^{2x}) \\
&=8+8 \\
&=16.
\end{aligned}
$$

Since $W=16\neq0$, the three known solutions form a fundamental set for the
third-order equation. Therefore:

$$
\boxed{
y_h=c_1+c_2e^{2x}+c_3e^{-2x}
}.
$$

### Answer 10

The fundamental set gives the general solution:

$$
y=c_1\cos(5x)+c_2\sin(5x).
$$

Differentiate the complete family:

$$
y'=-5c_1\sin(5x)+5c_2\cos(5x).
$$

Use $y(0)=2$ in $y=c_1\cos(5x)+c_2\sin(5x)$:

$$
2=c_1\cos0+c_2\sin0=c_1.
$$

Thus:

$$
c_1=2.
$$

Use $y'(0)=15$ in the derivative formula:

$$
15=-5c_1\sin0+5c_2\cos0=5c_2.
$$

Divide by $5$:

$$
c_2=3.
$$

Therefore the selected solution is:

$$
\boxed{
y=2\cos(5x)+3\sin(5x)
}.
$$

### Answer 11

The associated homogeneous fundamental set gives:

$$
y_h=c_1e^{4x}+c_2e^{-4x}.
$$

For the proposed particular solution:

$$
y_p=-\frac12x,
$$

For $y_p=-x/2$, the derivatives are:

$$
y_p'=-\frac12,
\qquad
y_p''=0.
$$

Substitute into $y''-16y$:

$$
\begin{aligned}
y_p''-16y_p
&=0-16\left(-\frac12x\right) \\
&=8x.
\end{aligned}
$$

Thus $y_p$ is a particular solution. Add it to the complete homogeneous
family:

$$
\boxed{
y=c_1e^{4x}+c_2e^{-4x}-\frac12x
}.
$$

### Answer 12

The operator is:

$$
L[y]=y''+y.
$$

For $y_{p1}=x^2$:

$$
y_{p1}''=2.
$$

Therefore:

$$
L[y_{p1}]=2+x^2.
$$

For $y_{p2}=x^2+\sin x$:

$$
y_{p2}''=2-\sin x.
$$

Therefore:

$$
\begin{aligned}
L[y_{p2}]
&=(2-\sin x)+(x^2+\sin x) \\
&=2+x^2.
\end{aligned}
$$

Both functions solve:

$$
\boxed{y''+y=x^2+2}.
$$

Their difference is:

$$
y_{p2}-y_{p1}=\sin x.
$$

Since:

$$
(\sin x)''+\sin x=-\sin x+\sin x=0,
$$

the difference is a solution of the associated homogeneous equation.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

Linear solution theory is organised by a small number of connected ideas:

$$
\begin{aligned}
L[\alpha u+\beta v]
&=\alpha L[u]+\beta L[v], \\
L[y_h]&=0, \\
W[y_1,\ldots,y_n]\neq0
&\Longrightarrow \{y_1,\ldots,y_n\}\text{ is independent}, \\
y_h&=c_1y_1+\cdots+c_ny_n, \\
L[y]=f
&\Longrightarrow y=y_h+y_p.
\end{aligned}
$$

The chapter's final lesson is:

> the general solution is justified by three checks: every basis function
> solves the homogeneous equation, the basis functions are independent, and
> any particular term reproduces the forcing exactly.

</details>
