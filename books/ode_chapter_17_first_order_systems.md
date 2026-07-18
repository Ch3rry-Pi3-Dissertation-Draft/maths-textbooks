# Reduction To First-Order Systems

Earlier chapters treated higher-order differential equations and systems as
related subjects. This chapter makes their connection explicit: every linear
differential equation of order $n$ can be rewritten as a system of $n$
first-order equations.

The conversion does not approximate the original problem. It repackages the
same unknown function and its derivatives into a vector called the **state**.

The main questions are:

- why does an $n$th-order equation need $n$ state variables?
- how should those variables be chosen?
- how is the highest derivative isolated without changing signs incorrectly?
- where do the coefficient matrix and forcing vector come from?
- how are initial conditions transferred into an initial state vector?
- how are coupled equations handled when their orders differ?
- how can the matrix system be checked against the original equations?
- when can Chapter 16's matrix exponential solve the converted system?

All worked examples and exercises are independently constructed. The reference
text is used only as a map of the mathematical topics.

---

## Block 1: From Derivative Memory To A State Vector

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand why a higher-order equation can be represented by
several first-order equations without losing information.

</details>

<details open>
<summary><strong>What A Higher-Order Equation Must Remember</strong></summary>

Consider a second-order equation for an unknown function $y(t)$. To predict
how the solution changes, it is generally not enough to know only $y(t)$. We
also need its current rate $y'(t)$.

For a third-order equation, the required current information is:

$$
y(t),\qquad y'(t),\qquad y''(t).
$$

For an $n$th-order equation, the corresponding list is:

$$
y(t),\quad y'(t),\quad y''(t),\quad\ldots,\quad y^{(n-1)}(t).
$$

The key intuition:

> an $n$th-order scalar equation stores its present state in $n$ quantities:
> the function and its first $n-1$ derivatives.

</details>

<details open>
<summary><strong>Building The State Vector</strong></summary>

For a third-order equation, define:

$$
x_1(t)=y(t),\qquad
x_2(t)=y'(t),\qquad
x_3(t)=y''(t).
$$

Collect the three derivative levels into one column vector:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
x_1(t)\\
x_2(t)\\
x_3(t)
\end{bmatrix}
=
\begin{bmatrix}
y(t)\\
y'(t)\\
y''(t)
\end{bmatrix}.
$$

This vector is the **state vector**. Bold $\mathbf{x}$ denotes the whole
vector; $x_1,x_2,x_3$ denote its scalar components.

</details>

<details open>
<summary><strong>The Derivative Chain</strong></summary>

Differentiate each state definition.

From $x_1=y$:

$$
x_1'=y'=x_2.
$$

From $x_2=y'$:

$$
x_2'=y''=x_3.
$$

From $x_3=y''$:

$$
x_3'=y'''.
$$

The first two equations merely pass information along the derivative chain.
The original differential equation is used only when replacing the final
quantity $y'''$.

A useful interpretation:

> most rows of the matrix system record definitions; the final row contains
> the actual dynamics supplied by the original equation.

</details>

<details open>
<summary><strong>Why The Conversion Is Equivalent</strong></summary>

Suppose $y(t)$ solves the original third-order equation. Defining:

$$
x_1=y,\qquad x_2=y',\qquad x_3=y''
$$

automatically makes $x_1'=x_2$ and $x_2'=x_3$. The original equation then
determines $x_3'=y'''$. Therefore $y$ produces a solution of the first-order
system.

Conversely, suppose a system solution satisfies:

$$
x_1'=x_2,\qquad x_2'=x_3.
$$

Set $y=x_1$. The first relation gives $y'=x_2$. Differentiate that relation:

$$
y''=x_2'=x_3.
$$

The final system equation then becomes the original equation for $y'''$.
Thus the two descriptions contain the same solution information.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

For an $n$th-order equation, use $n$ state variables:

$$
x_1=y,\quad x_2=y',\quad\ldots,\quad x_n=y^{(n-1)}.
$$

For this $n$-component state, the first $n-1$ derivatives form the chain:

$$
x_1'=x_2,\quad x_2'=x_3,\quad\ldots,\quad x_{n-1}'=x_n.
$$

The original equation supplies the final equation for $x_n'=y^{(n)}$.

</details>

---

## Block 2: A Complete Second-Order Conversion

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to convert one second-order initial-value problem slowly enough
that every matrix entry can be traced back to a visible scalar equation.

</details>

<details open>
<summary><strong>The Problem</strong></summary>

Convert:

$$
2y''-3y'+8y=4\cos t,
$$

with:

$$
y(0)=1,\qquad y'(0)=-2,
$$

into:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
\qquad
\mathbf{x}(0)=\mathbf{c}.
$$

Here $A$ is the coefficient matrix, $\mathbf{f}(t)$ is the forcing vector, and
$\mathbf{c}$ is the initial state.

</details>

<details open>
<summary><strong>Step 1: Isolate The Highest Derivative</strong></summary>

Start from:

$$
2y''-3y'+8y=4\cos t.
$$

Move the $y'$ and $y$ terms to the right side:

$$
2y''=3y'-8y+4\cos t.
$$

Divide every term by $2$:

$$
\boxed{
y''=-4y+\frac32y'+2\cos t
}.
$$

Writing $-4y$ before $\frac32y'$ anticipates the state order $y,y'$.

</details>

<details open>
<summary><strong>Step 2: Define The State Variables</strong></summary>

The equation is second order, so define:

$$
x_1=y,\qquad x_2=y'.
$$

The state vector is:

$$
\mathbf{x}
=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}
=
\begin{bmatrix}
y\\
y'
\end{bmatrix}.
$$

</details>

<details open>
<summary><strong>Step 3: Differentiate The State Definitions</strong></summary>

Differentiate $x_1=y$:

$$
x_1'=y'.
$$

Because $x_2=y'$:

$$
\boxed{x_1'=x_2}.
$$

Differentiate $x_2=y'$:

$$
x_2'=y''.
$$

Use the isolated formula:

$$
y''=-4y+\frac32y'+2\cos t.
$$

Replace $y$ by $x_1$ and $y'$ by $x_2$:

$$
\boxed{
x_2'=-4x_1+\frac32x_2+2\cos t
}.
$$

</details>

<details open>
<summary><strong>Step 4: Stack The Scalar Equations</strong></summary>

The two first-order equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-4x_1+\frac32x_2+2\cos t.
\end{aligned}
$$

Separate state-dependent terms from the forcing:

$$
\begin{bmatrix}
x_1'\\
x_2'
\end{bmatrix}
=
\begin{bmatrix}
0x_1+1x_2\\
-4x_1+\frac32x_2
\end{bmatrix}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}.
$$

The coefficient of $x_1$ forms column $1$, and the coefficient of $x_2$ forms
column $2$. Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&\frac32
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Step 5: Convert The Initial Conditions</strong></summary>

The state ordering is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
y(t)\\
y'(t)
\end{bmatrix}.
$$

Evaluate at $t=0$:

$$
\mathbf{x}(0)
=
\begin{bmatrix}
y(0)\\
y'(0)
\end{bmatrix}.
$$

Substitute $y(0)=1$ and $y'(0)=-2$:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
1\\
-2
\end{bmatrix}
}.
$$

The initial values are not coefficients in $A$; they form a separate vector.

</details>

<details open>
<summary><strong>Verify The Conversion Row By Row</strong></summary>

Start from the proposed matrix system:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-4&\frac32
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
2\cos t
\end{bmatrix}.
$$

Replace $\mathbf{x}$ by $[x_1,x_2]^{\mathsf T}$ and multiply row by row:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0=x_2,\\
x_2'&=-4x_1+\frac32x_2+2\cos t.
\end{aligned}
$$

Restore $x_1=y$, $x_2=y'$, and $x_2'=y''$ in the second row:

$$
y''=-4y+\frac32y'+2\cos t.
$$

Multiply every term by $2$:

$$
2y''=-8y+3y'+4\cos t.
$$

Move the $y$ and $y'$ terms to the left:

$$
2y''-3y'+8y=4\cos t.
$$

This is the original differential equation, so the conversion is correct.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

For a second-order equation:

1. isolate $y''$
2. define $x_1=y$ and $x_2=y'$
3. use $x_1'=x_2$
4. replace $y$ and $y'$ in the isolated formula to obtain $x_2'$
5. read the matrix coefficients from the two scalar equations
6. place $y(t_0)$ and $y'(t_0)$ into the initial vector in state order

The matrix is assembled from coefficients, not guessed from the original
equation.

</details>

---

## Block 3: The General Nth-Order Companion Form

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to extend the second-order construction to a linear equation of
any order and understand the pattern in its coefficient matrix.

</details>

<details open>
<summary><strong>Normalize The Differential Equation First</strong></summary>

Consider:

$$
b_n(t)y^{(n)}+b_{n-1}(t)y^{(n-1)}+\cdots+b_1(t)y'+b_0(t)y=g(t),
$$

on an interval where:

$$
b_n(t)\ne0.
$$

Divide every term by $b_n(t)$. Define:

$$
p_j(t)=\frac{b_j(t)}{b_n(t)},
\qquad
q(t)=\frac{g(t)}{b_n(t)}.
$$

The normalized equation is:

$$
y^{(n)}+p_{n-1}(t)y^{(n-1)}+\cdots+p_1(t)y'+p_0(t)y=q(t).
$$

Isolate the highest derivative:

$$
\boxed{
y^{(n)}
=
-p_0(t)y-p_1(t)y'-\cdots-p_{n-1}(t)y^{(n-1)}+q(t)
}.
$$

Every coefficient moved from the left side changes sign.

</details>

<details open>
<summary><strong>Define The Derivative-Chain State</strong></summary>

Use:

$$
x_1=y,\quad
x_2=y',\quad
x_3=y'',\quad\ldots,\quad
x_n=y^{(n-1)}.
$$

Differentiating the first $n-1$ definitions gives:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
&\ \vdots\\
x_{n-1}'&=x_n.
\end{aligned}
$$

For the final component:

$$
x_n'=y^{(n)}.
$$

Substitute the isolated highest derivative and replace each derivative by its
state component:

$$
\boxed{
x_n'
=
-p_0(t)x_1-p_1(t)x_2-\cdots-p_{n-1}(t)x_n+q(t)
}.
$$

</details>

<details open>
<summary><strong>The Companion Matrix</strong></summary>

Collect the state components into:

$$
\mathbf{x}
=
\begin{bmatrix}
x_1\\x_2\\x_3\\\vdots\\x_n
\end{bmatrix}.
$$

The system is:

$$
\boxed{\mathbf{x}'=A(t)\mathbf{x}+\mathbf{f}(t)},
$$

where:

$$
A(t)
=
\begin{bmatrix}
0&1&0&\cdots&0\\
0&0&1&\cdots&0\\
\vdots&\vdots&\vdots&\ddots&\vdots\\
0&0&0&\cdots&1\\
-p_0(t)&-p_1(t)&-p_2(t)&\cdots&-p_{n-1}(t)
\end{bmatrix}
$$

and:

$$
\mathbf{f}(t)
=
\begin{bmatrix}
0\\0\\\vdots\\0\\q(t)
\end{bmatrix}.
$$

This arrangement is called a **companion form**. The $1$s above the main
diagonal create the derivative chain. The final row comes from the isolated
formula for $y^{(n)}$.

</details>

<details open>
<summary><strong>Why The Forcing Appears Only In The Last Row</strong></summary>

The equations:

$$
x_1'=x_2,\quad x_2'=x_3,\quad\ldots,\quad x_{n-1}'=x_n
$$

are definitions. They do not use the forcing $q(t)$.

In this derivative-chain construction, only the final equation:

$$
x_n'=y^{(n)}
$$

uses the original differential equation. Since $q(t)$ appears in the formula
for $y^{(n)}$, it enters only the final component of $\mathbf{f}(t)$.

</details>

<details open>
<summary><strong>Initial Data In State Order</strong></summary>

Suppose the scalar problem provides:

$$
y(t_0)=c_0,\quad
y'(t_0)=c_1,\quad\ldots,\quad
y^{(n-1)}(t_0)=c_{n-1}.
$$

The state definition gives:

$$
\mathbf{x}(t_0)
=
\begin{bmatrix}
y(t_0)\\
y'(t_0)\\
\vdots\\
y^{(n-1)}(t_0)
\end{bmatrix}.
$$

Substitute the prescribed values:

$$
\boxed{
\mathbf{x}(t_0)
=
\begin{bmatrix}
c_0\\c_1\\\vdots\\c_{n-1}
\end{bmatrix}
}.
$$

The order of the entries must match the order chosen in $\mathbf{x}$.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

After normalizing the scalar equation, the companion matrix has:

- $1$s immediately above the main diagonal
- zeros elsewhere in the first $n-1$ rows
- negated normalized coefficients in the final row
- the normalized forcing in the final entry of $\mathbf{f}(t)$

The construction is a compressed record of the scalar derivative chain.

</details>

---

## Block 4: Variable Coefficients And A Third-Order Example

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to show that the conversion works when coefficients depend on
$t$, and to make every entry of a $3\times3$ system traceable.

</details>

<details open>
<summary><strong>The Initial-Value Problem</strong></summary>

Convert:

$$
u'''+2t\,u''-(t+1)u'+5u=e^{-t},
$$

with:

$$
u(1)=2,\qquad u'(1)=0,\qquad u''(1)=-1.
$$

The leading coefficient is already $1$, so no division is required.

</details>

<details open>
<summary><strong>Step 1: Isolate The Third Derivative</strong></summary>

Start from:

$$
u'''+2t\,u''-(t+1)u'+5u=e^{-t}.
$$

Move every term except $u'''$ to the right. Each moved term changes sign:

$$
\boxed{
u'''=-5u+(t+1)u'-2t\,u''+e^{-t}
}.
$$

The coefficient of $u'$ becomes positive because its original coefficient was
$-(t+1)$.

</details>

<details open>
<summary><strong>Step 2: Build The Three State Equations</strong></summary>

Define:

$$
x_1=u,\qquad x_2=u',\qquad x_3=u''.
$$

Differentiate $x_1=u$ and use $x_2=u'$:

$$
x_1'=u'=x_2.
$$

Differentiate $x_2=u'$ and use $x_3=u''$:

$$
x_2'=u''=x_3.
$$

Differentiate $x_3=u''$:

$$
x_3'=u'''.
$$

Substitute the isolated formula for $u'''$:

$$
x_3'=-5u+(t+1)u'-2t\,u''+e^{-t}.
$$

Replace $u,u',u''$ by $x_1,x_2,x_3$:

$$
\boxed{
x_3'=-5x_1+(t+1)x_2-2t\,x_3+e^{-t}
}.
$$

</details>

<details open>
<summary><strong>Step 3: Assemble The Matrix System</strong></summary>

Write the scalar equations with all state coefficients visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3,\\
x_2'&=0x_1+0x_2+1x_3,\\
x_3'&=-5x_1+(t+1)x_2-2t\,x_3+e^{-t}.
\end{aligned}
$$

Reading the coefficient of $x_1,x_2,x_3$ across each row gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&0&1\\
-5&t+1&-2t
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
0\\
e^{-t}
\end{bmatrix}
}.
$$

Because two entries depend on $t$, this is a variable-coefficient matrix
system.

</details>

<details open>
<summary><strong>Step 4: Assemble The Initial State</strong></summary>

The state vector is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
u(t)\\u'(t)\\u''(t)
\end{bmatrix}.
$$

Evaluate at the prescribed initial time $t_0=1$:

$$
\mathbf{x}(1)
=
\begin{bmatrix}
u(1)\\u'(1)\\u''(1)
\end{bmatrix}.
$$

Substitute the three initial values:

$$
\boxed{
\mathbf{x}(1)
=
\begin{bmatrix}
2\\0\\-1
\end{bmatrix}
}.
$$

The initial time remains $1$; converting to a system does not shift it to
zero.

</details>

<details open>
<summary><strong>A Leading Coefficient That Can Vanish</strong></summary>

Consider:

$$
t^2y''+3ty'-2y=\ln t.
$$

To isolate $y''$, divide by $t^2$:

$$
y''
=
-\frac{3}{t}y'
+\frac{2}{t^2}y
+\frac{\ln t}{t^2}.
$$

This normalization requires $t\ne0$. The forcing $\ln t$ additionally requires
$t>0$ for real-valued solutions. Therefore the converted system is considered
on an interval contained in:

$$
\boxed{t>0}.
$$

The practical meaning:

> dividing by the leading coefficient can reveal interval restrictions that
> must accompany the matrix system.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Variable coefficients become entries of $A(t)$. A nonzero forcing becomes an
entry of $\mathbf{f}(t)$. Neither feature changes the derivative-chain rows.

Before dividing by a leading coefficient, identify where it is nonzero and
retain that interval information in the converted problem.

</details>


---

## Block 5: Coupled Equations Of Different Orders

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to create one state variable for every required derivative across
several unknown functions and preserve all cross-coupling terms.

</details>

<details open>
<summary><strong>How Many State Variables Are Needed?</strong></summary>

Suppose one equation is second order in $u(t)$ and another is first order in
$v(t)$. The state must remember:

$$
u,\qquad u',\qquad v.
$$

Therefore three state variables are needed.

More generally, add the orders of the unknown functions. A third-order equation
in $u$ coupled to a second-order equation in $v$ normally needs:

$$
3+2=5
$$

state variables.

</details>

<details open>
<summary><strong>A Mixed-Order Coupled Problem</strong></summary>

Convert:

$$
\begin{aligned}
u''+2u'-v&=\sin t,\\
v'+3v-4u&=t,
\end{aligned}
$$

with:

$$
u(0)=1,\qquad u'(0)=0,\qquad v(0)=-2.
$$

Use the state ordering:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v.
$$

</details>

<details open>
<summary><strong>Step 1: Isolate The Needed Derivatives</strong></summary>

From the first equation:

$$
u''+2u'-v=\sin t.
$$

Move $2u'$ and $-v$ to the right:

$$
\boxed{u''=-2u'+v+\sin t}.
$$

From the second equation:

$$
v'+3v-4u=t.
$$

In $v'+3v-4u=t$, move $3v$ and $-4u$ to the right:

$$
\boxed{v'=4u-3v+t}.
$$

Both isolated formulas are needed because they supply derivatives of state
components.

</details>

<details open>
<summary><strong>Step 2: Translate Each Derivative Into State Variables</strong></summary>

Differentiate $x_1=u$:

$$
x_1'=u'=x_2.
$$

Differentiate $x_2=u'$ and use the isolated formula for $u''$:

$$
\begin{aligned}
x_2'
&=u''\\
&=-2u'+v+\sin t\\
&=-2x_2+x_3+\sin t.
\end{aligned}
$$

Differentiate $x_3=v$ and use the isolated formula for $v'$:

$$
\begin{aligned}
x_3'
&=v'\\
&=4u-3v+t\\
&=4x_1-3x_3+t.
\end{aligned}
$$

Every original unknown has now been replaced by a state component.

</details>

<details open>
<summary><strong>Step 3: Read Off The Matrix And Forcing</strong></summary>

Make all zero coefficients visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3+0,\\
x_2'&=0x_1-2x_2+1x_3+\sin t,\\
x_3'&=4x_1+0x_2-3x_3+t.
\end{aligned}
$$

Reading across the rows gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&-2&1\\
4&0&-3
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\
\sin t\\
t
\end{bmatrix}
}.
$$

The cross-coupling term $v$ creates the entry $1$ in row $2$, column $3$.
The cross-coupling term $4u$ creates the entry $4$ in row $3$, column $1$.

</details>

<details open>
<summary><strong>Step 4: Convert The Initial Data</strong></summary>

The selected state ordering is:

$$
\mathbf{x}(t)
=
\begin{bmatrix}
u(t)\\u'(t)\\v(t)
\end{bmatrix}.
$$

At $t=0$:

$$
\mathbf{x}(0)
=
\begin{bmatrix}
u(0)\\u'(0)\\v(0)
\end{bmatrix}.
$$

Substitute the prescribed values:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
1\\0\\-2
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Two Second-Order Unknowns</strong></summary>

For two second-order unknowns, a useful ordering is:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v,\qquad x_4=v'.
$$

Then:

$$
x_1'=x_2,\qquad x_3'=x_4.
$$

The two original equations must be rearranged to provide formulas for:

$$
x_2'=u'',\qquad x_4'=v''.
$$

The state order need not place all unprimed functions first. What matters is
that every matrix row and every initial value follows the declared order
consistently.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

For a coupled system:

1. count the derivative levels required for each unknown
2. declare a state ordering explicitly
3. isolate every highest derivative needed by that state
4. translate each equation into state components
5. preserve cross-coupling coefficients in the correct columns
6. place all non-state terms into the forcing vector

</details>

---

## Block 6: Equivalence, Reverse Conversion, And The Solution Bridge

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to read a companion system back as a scalar equation and connect
the converted system with the matrix exponential from Chapter 16.

</details>

<details open>
<summary><strong>Recover A Scalar Equation From A System</strong></summary>

Suppose:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-6&-5
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\e^t
\end{bmatrix},
$$

where:

$$
\mathbf{x}
=
\begin{bmatrix}
y\\y'
\end{bmatrix}.
$$

Multiply the first row:

$$
y'=0y+1y'.
$$

This row confirms the state definition.

Multiply the second row. Since the second component derivative is $y''$:

$$
y''=-6y-5y'+e^t.
$$

From $y''=-6y-5y'+e^t$, move the $y$ and $y'$ terms to the left:

$$
\boxed{y''+5y'+6y=e^t}.
$$

The final row of a companion system contains the scalar equation in isolated
highest-derivative form.

</details>

<details open>
<summary><strong>Not Every Matrix System Is In Companion Form</strong></summary>

The system:

$$
\mathbf{z}'
=
\begin{bmatrix}
2&1\\
-3&4
\end{bmatrix}
\mathbf{z}
$$

is a valid first-order system, but its first row is:

$$
z_1'=2z_1+z_2,
$$

not $z_1'=z_2$. Therefore $z_2$ has not been declared to be $z_1'$.

It may still be possible to eliminate $z_2$ and obtain a second-order
equation, but the direct companion reading rule does not apply until the state
relationship is established.

</details>

<details open>
<summary><strong>The Homogeneous Constant-Coefficient Bridge</strong></summary>

If conversion produces:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(t_0)=\mathbf{c},
$$

For this constant homogeneous system, Chapter 16 gives:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

The first component of $\mathbf{x}(t)$ is the original unknown $y(t)$ when
$x_1=y$.

The conversion and the matrix exponential perform different jobs:

- conversion constructs the first-order system
- the matrix exponential solves a constant homogeneous system

</details>

<details open>
<summary><strong>The Forced Constant-Coefficient Bridge</strong></summary>

For:

$$
\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{c},
$$

with constant $A$, the solution can be written as:

$$
\boxed{
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
+
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
}.
$$

The first term carries the initial state. The integral accumulates the effect
of the forcing from $t_0$ to $t$.

</details>

<details open>
<summary><strong>Verify The Forced Formula</strong></summary>

Let:

$$
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
+
\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds.
$$

At $t=t_0$, the integral has equal limits and is zero:

$$
\begin{aligned}
\mathbf{x}(t_0)
&=e^{A0}\mathbf{c}+0\\
&=I\mathbf{c}\\
&=\mathbf{c}.
\end{aligned}
$$

Now differentiate. The first term gives:

$$
\frac{d}{dt}
\left(e^{A(t-t_0)}\mathbf{c}\right)
=
Ae^{A(t-t_0)}\mathbf{c}.
$$

For the integral, the upper-limit term is:

$$
e^{A(t-t)}\mathbf{f}(t)
=
I\mathbf{f}(t)
=
\mathbf{f}(t).
$$

Differentiating the integrand with respect to $t$ gives:

$$
\frac{\partial}{\partial t}
\left(e^{A(t-s)}\mathbf{f}(s)\right)
=
Ae^{A(t-s)}\mathbf{f}(s).
$$

Therefore:

$$
\begin{aligned}
\mathbf{x}'(t)
&=
Ae^{A(t-t_0)}\mathbf{c}
+\mathbf{f}(t)
+\int_{t_0}^{t}Ae^{A(t-s)}\mathbf{f}(s)\,ds\\
&=
A\left[
e^{A(t-t_0)}\mathbf{c}
+\int_{t_0}^{t}e^{A(t-s)}\mathbf{f}(s)\,ds
\right]
+\mathbf{f}(t)\\
&=A\mathbf{x}(t)+\mathbf{f}(t).
\end{aligned}
$$

Both the differential equation and initial condition are satisfied.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

A companion system can be read backward because its derivative-chain rows
identify each state component with a derivative of the first component.

For constant $A$, Chapter 16 supplies the solution operator. Conversion is
therefore the bridge from a higher-order scalar equation to matrix methods.

</details>

---

## Block 7: A Reliable Workflow And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to turn the conversion into a repeatable checklist and diagnose
the errors that most often make a plausible-looking matrix incorrect.

</details>

<details open>
<summary><strong>A Reliable Conversion Workflow</strong></summary>

### Step 1: Count The Required State Components

An $n$th-order scalar equation needs $n$ components. For coupled equations,
add the derivative levels needed for every unknown.

### Step 2: Declare The State Order

Write the full definition before constructing a matrix:

$$
\mathbf{x}=[x_1,x_2,\ldots,x_N]^{\mathsf T}.
$$

### Step 3: Normalize Each Highest Derivative

Divide by its leading coefficient where that coefficient is nonzero. Record
any interval restriction.

### Step 4: Isolate Every Required Highest Derivative

Move all remaining terms carefully and show their sign changes.

### Step 5: Write Scalar First-Order Equations

Do not jump directly to the matrix. First write one equation for each
component derivative.

### Step 6: Replace Original Variables By State Components

No $y'',u'$, or other undeclared derivative should remain on the right side.

### Step 7: Read Coefficients Row By Row

Use the same component order in every row. Write zeros explicitly when they
help expose the structure.

### Step 8: Separate The Forcing

Terms depending only on $t$, constants, or prescribed inputs belong in
$\mathbf{f}(t)$, not in $A(t)$.

### Step 9: Translate Initial Data In State Order

Keep the original initial time and place each value in its matching component.

### Step 10: Expand The Matrix Product To Verify

Recover the scalar equations row by row and compare them with the isolated
derivative formulas.

</details>

<details open>
<summary><strong>Common Mistake: Reading Coefficients Before Isolating</strong></summary>

From:

$$
y''+4y'-7y=h(t),
$$

the final state equation is not obtained by copying $4$ and $-7$ directly.

First isolate $y''$:

$$
y''=-4y'+7y+h(t).
$$

With $x_1=y$ and $x_2=y'$, write in state order:

$$
x_2'=7x_1-4x_2+h(t).
$$

Because $x_2'=7x_1-4x_2+h(t)$, the final matrix row is:

$$
\boxed{[\,7\quad -4\,]}.
$$

</details>

<details open>
<summary><strong>Common Mistake: Treating Forcing As A Matrix Coefficient</strong></summary>

For:

$$
x_2'=3x_1-x_2+t^2,
$$

the term $t^2$ multiplies no state variable. It therefore belongs in the
forcing vector:

$$
\begin{bmatrix}
x_1'\\x_2'
\end{bmatrix}
=
\begin{bmatrix}
0&1\\3&-1
\end{bmatrix}
\begin{bmatrix}
x_1\\x_2
\end{bmatrix}
+
\begin{bmatrix}
0\\t^2
\end{bmatrix}.
$$

</details>

<details open>
<summary><strong>Common Mistake: Losing The State Order</strong></summary>

Suppose:

$$
\mathbf{x}=
\begin{bmatrix}
u\\u'\\v
\end{bmatrix}.
$$

The initial vector must use that same order:

$$
\mathbf{x}(t_0)
=
\begin{bmatrix}
u(t_0)\\u'(t_0)\\v(t_0)
\end{bmatrix}.
$$

Writing $[u(t_0),v(t_0),u'(t_0)]^{\mathsf T}$ silently assigns values to the
wrong components.

</details>

<details open>
<summary><strong>Common Mistake: Changing The Initial Time</strong></summary>

If the scalar problem gives data at $t_0=3$, the system condition is:

$$
\mathbf{x}(3)=\mathbf{c},
$$

not $\mathbf{x}(0)=\mathbf{c}$.

For a constant homogeneous system, the matching solution formula is:

$$
\mathbf{x}(t)=e^{A(t-3)}\mathbf{c}.
$$

The shift $t-3$ is forced by the original initial time.

</details>

<details open>
<summary><strong>Common Mistake: Using The Wrong Number Of Components</strong></summary>

A fourth-order scalar equation needs four first-order state equations. Using
only $y,y',y''$ leaves no component whose derivative is $y^{(4)}$.

The correct chain is:

$$
x_1=y,\quad x_2=y',\quad x_3=y'',\quad x_4=y'''.
$$

Then $x_4'=y^{(4)}$ can be supplied by the original equation.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The most reliable habit is:

> write and verify the scalar first-order equations before compressing them
> into a matrix.

Most matrix errors are really earlier errors in normalization, signs, state
ordering, or forcing separation.

</details>


---

## Block 8: Original Practice Set

<details open>
<summary><strong>How To Use These Problems</strong></summary>

For each conversion:

1. declare the state variables
2. isolate the required highest derivative
3. write all scalar first-order equations
4. assemble $A(t)$ and $\mathbf{f}(t)$
5. translate initial data when provided
6. expand at least one matrix row as a check

The twelve problems below use equations and data created specifically for this
chapter.

</details>

<details open>
<summary><strong>Problems 1 To 4: Single Scalar Equations</strong></summary>

### Problem 1: A Forced Second-Order IVP

Convert:

$$
y''+7y'-2y=t^2,
\qquad
y(0)=3,\quad y'(0)=-1.
$$

### Problem 2: Normalize Before Reading Variable Coefficients

On an interval containing $t=1$, convert:

$$
3y''-6t\,y'+9y=\cos t,
\qquad
y(1)=0,\quad y'(1)=2.
$$

### Problem 3: A Third-Order Equation

Convert:

$$
z'''-4z''+z'+6z=e^t.
$$

### Problem 4: A Fourth-Order Equation With Missing Derivatives

Convert:

$$
w^{(4)}+2w''-w=t.
$$

</details>

<details open>
<summary><strong>Problems 5 To 8: Domains, Reversal, And Diagnosis</strong></summary>

### Problem 5: Record The Domain Restriction

Convert on an appropriate real interval:

$$
t\,y''+(1-t)y'+4y=\sqrt{t}.
$$

### Problem 6: Recover The Scalar Equation

Given:

$$
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
8&-6
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\3\sin t
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
y\\y'
\end{bmatrix},
$$

recover the scalar differential equation.

### Problem 7: Diagnose A Sign Error

A learner converts:

$$
y''-5y'+2y=0
$$

using $x_1=y,x_2=y'$ and proposes the final row $[-2,-5]$. Identify the error
and give the correct matrix.

### Problem 8: Put An Existing First-Order System In Matrix Form

Write:

$$
\begin{aligned}
u'&=2u-3v+e^{-t},\\
v'&=5u+v-4
\end{aligned}
$$

as $\mathbf{x}'=A\mathbf{x}+\mathbf{f}(t)$ using
$\mathbf{x}=[u,v]^{\mathsf T}$.

</details>

<details open>
<summary><strong>Problems 9 To 12: Coupling And The Solution Bridge</strong></summary>

### Problem 9: One Second-Order And One First-Order Unknown

Convert:

$$
\begin{aligned}
p''-p'+2q&=t,\\
q'+q-3p&=e^t,
\end{aligned}
$$

using $\mathbf{x}=[p,p',q]^{\mathsf T}$.

### Problem 10: Two Second-Order Unknowns

Convert:

$$
\begin{aligned}
u''+2u-v'&=0,\\
v''-u'+3v&=\cos t,
\end{aligned}
$$

using $\mathbf{x}=[u,u',v,v']^{\mathsf T}$.

### Problem 11: Translate Mixed Initial Data

For the state order:

$$
\mathbf{x}=[r,r',r'',s,s']^{\mathsf T},
$$

write the initial vector when:

$$
r(2)=-1,\quad r'(2)=4,\quad r''(2)=0,\quad
s(2)=3,\quad s'(2)=-2.
$$

### Problem 12: Use The Matrix-Exponential Bridge

The equation:

$$
y''-y=0,
\qquad
y(2)=3,\quad y'(2)=1
$$

is converted using $\mathbf{x}=[y,y']^{\mathsf T}$. Write the matrix IVP and
its solution in matrix-exponential form. It is not necessary to calculate the
entries of the exponential.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Start from:

$$
y''+7y'-2y=t^2.
$$

Isolate $y''$:

$$
y''=-7y'+2y+t^2.
$$

Use:

$$
x_1=y,\qquad x_2=y'.
$$

Differentiate the state definitions and substitute the isolated derivative:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=2x_1-7x_2+t^2.
\end{aligned}
$$

Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
2&-7
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\t^2
\end{bmatrix}
}.
$$

The state order is $[y,y']^{\mathsf T}$, so:

$$
\boxed{
\mathbf{x}(0)
=
\begin{bmatrix}
y(0)\\y'(0)
\end{bmatrix}
=
\begin{bmatrix}
3\\-1
\end{bmatrix}
}.
$$

### Answer 2

Start from:

$$
3y''-6t\,y'+9y=\cos t.
$$

Move the lower-derivative terms to the right:

$$
3y''=6t\,y'-9y+\cos t.
$$

Divide every term by $3$:

$$
y''=-3y+2t\,y'+\frac13\cos t.
$$

With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-3x_1+2t\,x_2+\frac13\cos t.
\end{aligned}
$$

Thus:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-3&2t
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\\frac13\cos t
\end{bmatrix}
}.
$$

At the original initial time:

$$
\boxed{
\mathbf{x}(1)
=
\begin{bmatrix}
y(1)\\y'(1)
\end{bmatrix}
=
\begin{bmatrix}
0\\2
\end{bmatrix}
}.
$$

### Answer 3

Isolate the third derivative in:

$$
z'''-4z''+z'+6z=e^t.
$$

Moving the remaining terms gives:

$$
z'''=-6z-z'+4z''+e^t.
$$

Define:

$$
x_1=z,\qquad x_2=z',\qquad x_3=z''.
$$

The scalar state equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
x_3'&=-6x_1-x_2+4x_3+e^t.
\end{aligned}
$$

Reading the coefficients in the order $x_1,x_2,x_3$ gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&0&1\\
-6&-1&4
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\e^t
\end{bmatrix}
}.
$$

### Answer 4

Start from:

$$
w^{(4)}+2w''-w=t.
$$

For $w^{(4)}+2w''-w=t$, isolate the fourth derivative:

$$
w^{(4)}=w-2w''+t.
$$

Define four components:

$$
x_1=w,\quad x_2=w',\quad x_3=w'',\quad x_4=w'''.
$$

Differentiate each definition and use the isolated equation in the final row:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
x_3'&=x_4,\\
x_4'&=x_1-2x_3+t.
\end{aligned}
$$

Make the missing coefficients visible:

$$
x_4'=1x_1+0x_2-2x_3+0x_4+t.
$$

Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0&0\\
0&0&1&0\\
0&0&0&1\\
1&0&-2&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\0\\t
\end{bmatrix}
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

The equation is:

$$
t\,y''+(1-t)y'+4y=\sqrt{t}.
$$

For real $\sqrt t$, require $t\geq0$. Isolating $y''$ also requires $t\ne0$.
Together these restrictions give:

$$
t>0.
$$

Move the lower-derivative terms:

$$
t\,y''=-(1-t)y'-4y+\sqrt t.
$$

Divide every term by $t$:

$$
y''
=
-\frac4t y
-\frac{1-t}{t}y'
+\frac{\sqrt t}{t}.
$$

With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-\frac4t x_1-\frac{1-t}{t}x_2+\frac{\sqrt t}{t}.
\end{aligned}
$$

Hence:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-\frac4t&-\frac{1-t}{t}
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\\frac{\sqrt t}{t}
\end{bmatrix},
\qquad t>0
}.
$$

### Answer 6

Use the declared state:

$$
\mathbf{x}=
\begin{bmatrix}
y\\y'
\end{bmatrix}.
$$

The second row of the matrix system is:

$$
y''=8y-6y'+3\sin t.
$$

Move the state-dependent terms to the left:

$$
\boxed{y''+6y'-8y=3\sin t}.
$$

The first row gives $y'=y'$, confirming the derivative-chain ordering.

### Answer 7

Start from:

$$
y''-5y'+2y=0.
$$

Isolate $y''$. The lower-order terms move right and change signs:

$$
y''=5y'-2y.
$$

Write the terms in state order $y,y'$:

$$
y''=-2y+5y'.
$$

Therefore the final row is $[-2,5]$, not $[-2,-5]$. The correct matrix is:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
-2&5
\end{bmatrix}
\mathbf{x}
}.
$$

The proposed conversion failed to change the sign of $-5y'$.

### Answer 8

Use:

$$
\mathbf{x}
=
\begin{bmatrix}
u\\v
\end{bmatrix},
\qquad
\mathbf{x}'
=
\begin{bmatrix}
u'\\v'
\end{bmatrix}.
$$

Keep state terms and forcing terms separate:

$$
\begin{aligned}
u'&=2u-3v+e^{-t},\\
v'&=5u+1v-4.
\end{aligned}
$$

Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
2&-3\\
5&1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
e^{-t}\\-4
\end{bmatrix}
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

Use the prescribed state order:

$$
x_1=p,\qquad x_2=p',\qquad x_3=q.
$$

Isolate the required derivatives. From:

$$
p''-p'+2q=t
$$

obtain:

$$
p''=p'-2q+t.
$$

From:

$$
q'+q-3p=e^t
$$

obtain:

$$
q'=3p-q+e^t.
$$

Translate the isolated formulas:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_2-2x_3+t,\\
x_3'&=3x_1-x_3+e^t.
\end{aligned}
$$

Make every state coefficient visible:

$$
\begin{aligned}
x_1'&=0x_1+1x_2+0x_3,\\
x_2'&=0x_1+1x_2-2x_3+t,\\
x_3'&=3x_1+0x_2-1x_3+e^t.
\end{aligned}
$$

Therefore:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0\\
0&1&-2\\
3&0&-1
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\t\\e^t
\end{bmatrix}
}.
$$

### Answer 10

Use:

$$
x_1=u,\qquad x_2=u',\qquad x_3=v,\qquad x_4=v'.
$$

From $u''+2u-v'=0$, isolate:

$$
u''=-2u+v'.
$$

From $v''-u'+3v=\cos t$, isolate:

$$
v''=u'-3v+\cos t.
$$

Translate all four component derivatives:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=-2x_1+x_4,\\
x_3'&=x_4,\\
x_4'&=x_2-3x_3+\cos t.
\end{aligned}
$$

Reading coefficients in the order $x_1,x_2,x_3,x_4$ gives:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1&0&0\\
-2&0&0&1\\
0&0&0&1\\
0&1&-3&0
\end{bmatrix}
\mathbf{x}
+
\begin{bmatrix}
0\\0\\0\\\cos t
\end{bmatrix}
}.
$$

For example, row $2$ expands to:

$$
x_2'=-2x_1+x_4,
$$

which restores to $u''=-2u+v'$.

### Answer 11

The declared state order is:

$$
\mathbf{x}=[r,r',r'',s,s']^{\mathsf T}.
$$

Evaluate the same ordering at $t=2$:

$$
\mathbf{x}(2)
=
\begin{bmatrix}
r(2)\\r'(2)\\r''(2)\\s(2)\\s'(2)
\end{bmatrix}.
$$

Substitute each given value in its matching position:

$$
\boxed{
\mathbf{x}(2)
=
\begin{bmatrix}
-1\\4\\0\\3\\-2
\end{bmatrix}
}.
$$

### Answer 12

Start from:

$$
y''-y=0.
$$

Isolate the second derivative:

$$
y''=y.
$$

With $x_1=y$ and $x_2=y'$:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_1.
\end{aligned}
$$

Therefore the matrix IVP is:

$$
\boxed{
\mathbf{x}'
=
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(2)
=
\begin{bmatrix}
3\\1
\end{bmatrix}
}.
$$

Let:

$$
A=
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix},
\qquad
\mathbf{c}=
\begin{bmatrix}
3\\1
\end{bmatrix}.
$$

For a constant homogeneous system with $t_0=2$, Chapter 16 gives:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-2)}\mathbf{c}
}.
$$

Substitute $A$ and $\mathbf{c}$:

$$
\boxed{
\mathbf{x}(t)
=
\exp\!\left(
\begin{bmatrix}
0&1\\1&0
\end{bmatrix}
(t-2)
\right)
\begin{bmatrix}
3\\1
\end{bmatrix}
}.
$$

The first component of $\mathbf{x}(t)$ is the original function $y(t)$.

</details>

<details open>
<summary><strong>Chapter 17 Final Summary</strong></summary>

An $n$th-order scalar equation becomes an $n$-component first-order system by
using:

$$
\boxed{
x_1=y,\quad x_2=y',\quad\ldots,\quad x_n=y^{(n-1)}
}.
$$

For the normalized equation:

$$
y^{(n)}+p_{n-1}(t)y^{(n-1)}+\cdots+p_1(t)y'+p_0(t)y=q(t),
$$

the scalar first-order equations are:

$$
\begin{aligned}
x_1'&=x_2,\\
x_2'&=x_3,\\
&\ \vdots\\
x_{n-1}'&=x_n,\\
x_n'&=-p_0x_1-p_1x_2-\cdots-p_{n-1}x_n+q.
\end{aligned}
$$

The companion matrix is:

$$
A(t)
=
\begin{bmatrix}
0&1&0&\cdots&0\\
0&0&1&\cdots&0\\
\vdots&\vdots&\vdots&\ddots&\vdots\\
0&0&0&\cdots&1\\
-p_0&-p_1&-p_2&\cdots&-p_{n-1}
\end{bmatrix}.
$$

Initial values are collected in state order:

$$
\boxed{
\mathbf{x}(t_0)
=
\begin{bmatrix}
y(t_0)\\y'(t_0)\\\vdots\\y^{(n-1)}(t_0)
\end{bmatrix}
}.
$$

For coupled equations, create enough components to represent every unknown and
every derivative level required by its order. Cross-coupling terms become
off-diagonal matrix entries.

For constant $A$, the converted homogeneous system connects directly to:

$$
\mathbf{x}'=A\mathbf{x},\quad \mathbf{x}(t_0)=\mathbf{c}
\quad\Longrightarrow\quad
\boxed{\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}}.
$$

The chapter's central lesson is:

> declare the state order, isolate each highest derivative, write the scalar
> first-order equations, and only then read off the matrix row by row.

</details>
