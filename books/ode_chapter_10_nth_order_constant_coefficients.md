# Solving Higher-Order Constant-Coefficient Homogeneous Equations

Chapter 9 developed the characteristic-equation method for second-order
homogeneous equations. This chapter extends the same idea to any finite order.

We study equations of the form:

$$
a_ny^{(n)}+a_{n-1}y^{(n-1)}+\cdots+a_1y'+a_0y=0,
\qquad a_n\neq0,
$$

where all coefficients are real constants.

The central questions are:

- how does the exponential trial function work at order $n$?
- why must an $n$th-order solution contain $n$ independent directions?
- what does root multiplicity contribute to the basis?
- how are repeated complex roots converted into real functions?
- how can a complicated root list be organised without losing a solution?
- how do $n$ initial conditions determine $n$ constants?
- when do known solutions reveal only part of an equation?

The chapter's organising idea is:

> treat every characteristic root as an instruction for building basis
> functions, then count those functions until the differential equation's
> order has been matched.

All examples, data, and exercises are independently constructed. The reference
text is used only to identify the mathematical topics.

---

## Block 1: Extending The Characteristic Equation To Order $n$

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the characteristic polynomial for an $n$th-order
constant-coefficient homogeneous equation and make the notation readable.

</details>
<details open>
<summary><strong>Reading The Higher-Order Notation</strong></summary>

The general equation is:

$$
a_ny^{(n)}+a_{n-1}y^{(n-1)}+\cdots+a_1y'+a_0y=0.
$$

Here:

- $x$ is the independent variable
- $y=y(x)$ is the unknown function
- $y^{(k)}$ is the $k$th derivative, not the $k$th power of $y$
- $a_0,a_1,\ldots,a_n$ are real constants
- $a_n\neq0$ ensures that the equation really has order $n$

For example:

$$
y^{(5)}-4y'''+7y'-2y=0
$$

is fifth-order because its highest derivative is $y^{(5)}$.

The missing $y^{(4)}$ and $y''$ terms have coefficient zero:

$$
y^{(5)}+0y^{(4)}-4y'''+0y''+7y'-2y=0.
$$

Making zero coefficients visible prevents terms from being assigned to the
wrong power in the characteristic polynomial.

</details>

<details open>
<summary><strong>The Exponential Trial At Any Order</strong></summary>

Use:

$$
y=e^{rx},
$$

where $r$ is a constant to be determined.

Successive derivatives preserve the exponential factor:

$$
\begin{aligned}
y'&=re^{rx}, \\
y''&=r^2e^{rx}, \\
y'''&=r^3e^{rx}, \\
&\ \vdots \\
y^{(n)}&=r^ne^{rx}.
\end{aligned}
$$

The general pattern is:

$$
\boxed{y^{(k)}=r^ke^{rx}}.
$$

Every derivative contains the same nonzero factor $e^{rx}$. Only the power of
$r$ changes.

</details>

<details open>
<summary><strong>Deriving The Degree-$n$ Polynomial</strong></summary>

Start from:

$$
a_ny^{(n)}+a_{n-1}y^{(n-1)}+\cdots+a_1y'+a_0y=0.
$$

For $y=e^{rx}$, use $y^{(k)}=r^ke^{rx}$. Substitution gives:

$$
a_nr^ne^{rx}
+a_{n-1}r^{n-1}e^{rx}
+\cdots
+a_1re^{rx}
+a_0e^{rx}=0.
$$

Factor out the common exponential:

$$
e^{rx}
\left(a_nr^n+a_{n-1}r^{n-1}+\cdots+a_1r+a_0\right)=0.
$$

Since $e^{rx}\neq0$, the polynomial factor must be zero:

$$
\boxed{
a_nr^n+a_{n-1}r^{n-1}+\cdots+a_1r+a_0=0
}.
$$

This is the **characteristic equation**. Its left side is the
**characteristic polynomial**.

</details>

<details open>
<summary><strong>A Fifth-Order Translation Example</strong></summary>

Consider:

$$
2y^{(5)}-3y^{(4)}+7y''-11y=0.
$$

Write all derivative orders, including the missing ones:

$$
2y^{(5)}-3y^{(4)}+0y'''+7y''+0y'-11y=0.
$$

Replace each derivative order by the matching power of $r$:

$$
\boxed{
2r^5-3r^4+0r^3+7r^2+0r-11=0
}.
$$

Omitting the zero terms gives:

$$
2r^5-3r^4+7r^2-11=0.
$$

The order of the ODE matches the degree of the characteristic polynomial.

</details>

<details open>
<summary><strong>The Scope Check Still Matters</strong></summary>

The method applies directly only when the equation is linear, homogeneous, and
constant-coefficient.

For example:

$$
(1+x)y'''+2y=0
$$

has a variable coefficient.

The equation:

$$
y^{(4)}+y^2=0
$$

is nonlinear because of $y^2$.

The equation:

$$
y^{(4)}-3y''=e^x
$$

is nonhomogeneous. This chapter can solve its associated homogeneous equation,
but a particular solution is still needed for the complete forced problem.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

For:

$$
a_ny^{(n)}+\cdots+a_1y'+a_0y=0,
$$

For the equation $a_ny^{(n)}+\cdots+a_1y'+a_0y=0$, the trial $y=e^{rx}$
produces:

$$
\boxed{a_nr^n+\cdots+a_1r+a_0=0}.
$$

Derivative order becomes polynomial power. Zero coefficients should be tracked
even when their terms are not written.

</details>

---

## Block 2: Roots, Multiplicity, And The Basis Count

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to connect polynomial degree to the number of functions required
in the general solution.

> an $n$th-degree characteristic polynomial supplies $n$ roots when
> multiplicity is counted, and those roots must produce $n$ independent real
> basis functions.

</details>

<details open>
<summary><strong>Roots Counted With Multiplicity</strong></summary>

A degree-$n$ polynomial has $n$ complex roots when repeated roots are counted
according to multiplicity.

For example:

$$
p(r)=(r-2)^3(r+5)(r^2+4).
$$

The factors give:

$$
\begin{aligned}
r=2 &\quad\text{with multiplicity }3, \\
r=-5 &\quad\text{with multiplicity }1, \\
r=2i &\quad\text{with multiplicity }1, \\
r=-2i &\quad\text{with multiplicity }1.
\end{aligned}
$$

Count the multiplicities:

$$
3+1+1+1=6.
$$

The polynomial is sixth-degree, so the count agrees.

</details>

<details open>
<summary><strong>The Root Ledger</strong></summary>

A **root ledger** records what each root contributes.

For $p(r)=(r-2)^3(r+5)(r^2+4)$:

$$
\begin{array}{c|c|c}
\text{Root or pair} & \text{Multiplicity} & \text{Number of real modes} \\
\hline
2 & 3 & 3 \\
-5 & 1 & 1 \\
\pm2i & 1 & 2
\end{array}
$$

The total is:

$$
3+1+2=6.
$$

The practical meaning is:

> do not stop when the roots have been found; translate every root and count
> every resulting basis function.

</details>

<details open>
<summary><strong>Distinct Real Roots</strong></summary>

If the roots $r_1,\ldots,r_n$ are real and distinct, each contributes one
exponential. The general solution is:

$$
\boxed{
y=c_1e^{r_1x}+c_2e^{r_2x}+\cdots+c_ne^{r_nx}
}.
$$

There are $n$ arbitrary constants because the $n$ exponentials are linearly
independent.

</details>

<details open>
<summary><strong>Repeated Real Roots</strong></summary>

If $r=\rho$ has multiplicity $s$, it contributes:

$$
\boxed{
e^{\rho x},
xe^{\rho x},
x^2e^{\rho x},
\ldots,
x^{s-1}e^{\rho x}
}.
$$

For example, $r=-3$ with multiplicity $4$ contributes:

$$
e^{-3x},
xe^{-3x},
x^2e^{-3x},
x^3e^{-3x}.
$$

The powers begin at $0$ and stop at one less than the multiplicity.

</details>

<details open>
<summary><strong>Complex-Conjugate Pairs</strong></summary>

For real coefficients, $\alpha+i\beta$ is accompanied by
$\alpha-i\beta$.

A simple pair contributes:

$$
\boxed{
e^{\alpha x}\cos(\beta x),
\qquad
e^{\alpha x}\sin(\beta x)
}.
$$

If the pair has multiplicity $s$, multiply both modes by:

$$
1,x,x^2,\ldots,x^{s-1}.
$$

Thus a conjugate pair of multiplicity $s$ contributes $2s$ real functions.

</details>

<details open>
<summary><strong>A Complete Formula Map</strong></summary>

Each root instruction can be summarised as:

$$
\boxed{
\begin{array}{c|c}
\text{Root information} & \text{Real basis contribution} \\
\hline
r=\rho,\text{ multiplicity }s
&x^je^{\rho x},\quad j=0,\ldots,s-1 \\
\\
r=\alpha\pm i\beta,\text{ multiplicity }s
&x^je^{\alpha x}\cos(\beta x),\quad j=0,\ldots,s-1 \\
&x^je^{\alpha x}\sin(\beta x),\quad j=0,\ldots,s-1
\end{array}
}.
$$

After using the map, count the basis functions. Their number must equal the
order of the differential equation.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Root multiplicity determines how many powers of $x$ accompany a mode.

The completion check is:

$$
\boxed{
\text{number of independent real basis functions}=n
}.
$$

</details>


---

## Block 3: Factoring Higher-Degree Characteristic Polynomials

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to factor common polynomial patterns without hiding the algebra.
The root-to-solution rules become useful only after the roots are found.

</details>

<details open>
<summary><strong>Start With The Easiest Structure</strong></summary>

Before trying a general formula, check for:

- a common factor $r$
- grouping
- a polynomial in $r^2$
- an obvious integer root
- a known factor supplied by the problem
- a perfect power such as $(r-\rho)^s$

High-degree polynomials do not always factor neatly by hand. When exact
factorisation is unavailable, numerical roots may be needed. The root-to-basis
rules remain the same.

</details>

<details open>
<summary><strong>Worked Cubic With Three Distinct Roots</strong></summary>

Solve:

$$
y'''-3y''-6y'+8y=0.
$$

### Step 1: Write the characteristic equation

The derivative coefficients give:

$$
r^3-3r^2-6r+8=0.
$$

### Step 2: Find one root

Test $r=1$:

$$
\begin{aligned}
p(1)
&=1^3-3(1)^2-6(1)+8 \\
&=1-3-6+8 \\
&=0.
\end{aligned}
$$

Therefore $r=1$ is a root and $(r-1)$ is a factor.

### Step 3: Expose the remaining quadratic

The cubic factors as:

$$
r^3-3r^2-6r+8=(r-1)(r^2-2r-8).
$$

Check by expansion:

$$
\begin{aligned}
(r-1)(r^2-2r-8)
&=r^3-2r^2-8r-r^2+2r+8 \\
&=r^3-3r^2-6r+8.
\end{aligned}
$$

### Step 4: Factor the quadratic

The remaining quadratic factors as:

$$
r^2-2r-8=(r-4)(r+2).
$$

Combining the factors $(r-1)$, $(r-4)$, and $(r+2)$ gives:

$$
(r-1)(r-4)(r+2)=0.
$$

### Step 5: List and classify the roots

Set each factor equal to zero:

$$
r_1=1,
\qquad
r_2=4,
\qquad
r_3=-2.
$$

All three roots are real and distinct.

### Step 6: Build and count the solution

Each root contributes one exponential:

$$
\boxed{
y=c_1e^x+c_2e^{4x}+c_3e^{-2x}
}.
$$

The equation is third-order and the family contains three independent modes.

</details>

<details open>
<summary><strong>Worked Fourth-Order Equation In $r^2$</strong></summary>

Solve:

$$
y^{(4)}-13y''+36y=0.
$$

### Step 1: Write the characteristic equation

The missing $y'''$ and $y'$ terms have coefficient zero:

$$
r^4-13r^2+36=0.
$$

### Step 2: Use a temporary variable

Only even powers appear. Let:

$$
z=r^2.
$$

With $z=r^2$, we also have $r^4=z^2$, so:

$$
z^2-13z+36=0.
$$

### Step 3: Factor the quadratic in $z$

Find two numbers that multiply to $36$ and add to $-13$:

$$
z^2-13z+36=(z-4)(z-9).
$$

Therefore:

$$
(z-4)(z-9)=0.
$$

### Step 4: Return from $z$ to $r$

Since $z=r^2$:

$$
r^2=4
\qquad\text{or}\qquad
r^2=9.
$$

Solve both equations:

$$
r=\pm2
\qquad\text{or}\qquad
r=\pm3.
$$

### Step 5: Build and count the solution

The four roots are distinct and real. Therefore:

$$
\boxed{
y=c_1e^{2x}+c_2e^{-2x}+c_3e^{3x}+c_4e^{-3x}
}.
$$

Four roots produce four modes for the fourth-order equation.

</details>

<details open>
<summary><strong>A Common Factor $r$</strong></summary>

Consider:

$$
y^{(5)}+4y'''=0.
$$

The characteristic equation is:

$$
r^5+4r^3=0.
$$

Factor out $r^3$:

$$
r^3(r^2+4)=0.
$$

The factor $r^3$ gives $r=0$ with multiplicity $3$. The factor $r^2+4$
gives $r=\pm2i$.

The root ledger is:

$$
\begin{array}{c|c|c}
\text{Root or pair} & \text{Multiplicity} & \text{Real modes} \\
\hline
0 & 3 & 1,x,x^2 \\
\pm2i & 1 & \cos(2x),\sin(2x)
\end{array}
$$

Therefore:

$$
\boxed{
y=c_1+c_2x+c_3x^2+c_4\cos(2x)+c_5\sin(2x)
}.
$$

The ledger contains $3+2=5$ real modes, matching the fifth-order equation.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Factor before translating roots into functions. Useful structures include a
common power of $r$, a polynomial in $r^2$, and a known linear factor.

After factorisation:

1. list every root
2. record every multiplicity
3. convert roots to real basis functions
4. count the basis functions against the ODE order

</details>

---

## Block 4: Why Multiplicity Produces Powers Of $x$

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the repeated-root rule for any multiplicity.

> every repeated factor $(r-\rho)$ removes one derivative from a multiplier;
> repeating the factor $s$ times leaves a polynomial multiplier of degree at
> most $s-1$.

</details>

<details open>
<summary><strong>Introduce The Differential Operator $D$</strong></summary>

Let:

$$
D=\frac{d}{dx}.
$$

Then:

$$
Dy=y',
\qquad
D^2y=y'',
\qquad
D^ky=y^{(k)}.
$$

A characteristic factor $(r-\rho)$ corresponds to the differential operator:

$$
(D-\rho).
$$

For example, $(r-\rho)^3$ corresponds to $(D-\rho)^3$.

</details>

<details open>
<summary><strong>The Key Cancellation Identity</strong></summary>

Let:

$$
y=e^{\rho x}v(x),
$$

where $v(x)$ is an unknown multiplier.

Differentiate using the product rule:

$$
\begin{aligned}
Dy
&=\frac{d}{dx}\left(e^{\rho x}v\right) \\
&=\rho e^{\rho x}v+e^{\rho x}v'.
\end{aligned}
$$

Now apply $(D-\rho)$:

$$
\begin{aligned}
(D-\rho)y
&=Dy-\rho y \\
&=\left(\rho e^{\rho x}v+e^{\rho x}v'\right)
-\rho e^{\rho x}v.
\end{aligned}
$$

The two terms containing $\rho e^{\rho x}v$ cancel:

$$
\boxed{
(D-\rho)\left(e^{\rho x}v\right)=e^{\rho x}v'
}.
$$

Applying $(D-\rho)$ removes the exponential's own derivative contribution and
differentiates only the multiplier $v$.

</details>

<details open>
<summary><strong>Repeat The Operator $s$ Times</strong></summary>

Apply the identity once:

$$
(D-\rho)\left(e^{\rho x}v\right)=e^{\rho x}v'.
$$

Apply $(D-\rho)$ a second time:

$$
(D-\rho)^2\left(e^{\rho x}v\right)=e^{\rho x}v''.
$$

Continuing the pattern gives:

$$
\boxed{
(D-\rho)^s\left(e^{\rho x}v\right)=e^{\rho x}v^{(s)}
}.
$$

If $(r-\rho)^s$ is the entire characteristic polynomial for this part of the
equation, then:

$$
(D-\rho)^sy=0.
$$

Substitute $y=e^{\rho x}v$:

$$
e^{\rho x}v^{(s)}=0.
$$

Since the exponential is nonzero:

$$
v^{(s)}=0.
$$

</details>

<details open>
<summary><strong>Solving $v^{(s)}=0$</strong></summary>

If the $s$th derivative of $v$ is zero, then $v$ is a polynomial of degree at
most $s-1$:

$$
v(x)=c_1+c_2x+c_3x^2+\cdots+c_sx^{s-1}.
$$

Substitute this into $y=e^{\rho x}v$:

$$
\boxed{
y=e^{\rho x}
\left(c_1+c_2x+c_3x^2+\cdots+c_sx^{s-1}\right)
}.
$$

Equivalently:

$$
y=c_1e^{\rho x}
+c_2xe^{\rho x}
+\cdots
+c_sx^{s-1}e^{\rho x}.
$$

This proves the repeated-root rule.

</details>

<details open>
<summary><strong>Worked Fifth-Order Repeated-Root Example</strong></summary>

Solve the equation whose characteristic polynomial is:

$$
p(r)=(r-2)^3(r+3)^2.
$$

### Step 1: Record the roots and multiplicities

The factor $(r-2)^3$ gives:

$$
r=2
\qquad\text{with multiplicity }3.
$$

The factor $(r+3)^2$ gives:

$$
r=-3
\qquad\text{with multiplicity }2.
$$

### Step 2: Build the chain for $r=2$

Multiplicity $3$ requires powers $x^0,x^1,x^2$:

$$
e^{2x},
\qquad
xe^{2x},
\qquad
x^2e^{2x}.
$$

### Step 3: Build the chain for $r=-3$

Multiplicity $2$ requires powers $x^0,x^1$:

$$
e^{-3x},
\qquad
xe^{-3x}.
$$

### Step 4: Combine and count

The general solution is:

$$
\boxed{
y=e^{2x}(c_1+c_2x+c_3x^2)
+e^{-3x}(c_4+c_5x)
}.
$$

The first root contributes $3$ modes and the second contributes $2$:

$$
3+2=5.
$$

The basis count matches the fifth-degree characteristic polynomial.

</details>

<details open>
<summary><strong>Expanded Differential Equation For The Example</strong></summary>

To recover the differential equation, expand:

$$
(r-2)^3(r+3)^2.
$$

First calculate each power:

$$
\begin{aligned}
(r-2)^3&=r^3-6r^2+12r-8, \\
(r+3)^2&=r^2+6r+9.
\end{aligned}
$$

Multiply the polynomials:

$$
\begin{aligned}
(r-2)^3(r+3)^2
&=(r^3-6r^2+12r-8)(r^2+6r+9).
\end{aligned}
$$

Distribute each term from the first polynomial:

$$
\begin{aligned}
(r-2)^3(r+3)^2
&=(r^5+6r^4+9r^3) \\
&\quad+(-6r^4-36r^3-54r^2) \\
&\quad+(12r^3+72r^2+108r) \\
&\quad+(-8r^2-48r-72).
\end{aligned}
$$

Now combine equal powers of $r$:

$$
\begin{aligned}
(r-2)^3(r+3)^2
&=r^5+(6-6)r^4 \\
&\quad+(9-36+12)r^3 \\
&\quad+(-54+72-8)r^2 \\
&\quad+(108-48)r-72 \\
&=r^5-15r^3+10r^2+60r-72.
\end{aligned}
$$

The absent $r^4$ coefficient is zero. Therefore the associated equation is:

$$
\boxed{
y^{(5)}-15y'''+10y''+60y'-72y=0
}.
$$

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

The identity:

$$
(D-\rho)^s(e^{\rho x}v)=e^{\rho x}v^{(s)}
$$

Because $(D-\rho)^s(e^{\rho x}v)=e^{\rho x}v^{(s)}$, a repeated-root equation
reduces to $v^{(s)}=0$. Therefore $v$ is a polynomial
of degree at most $s-1$, which creates the chain:

$$
e^{\rho x},xe^{\rho x},\ldots,x^{s-1}e^{\rho x}.
$$

</details>

---

## Block 5: Mixed Real And Complex Root Structures

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to combine several root types in one solution without missing a
conjugate partner or a multiplicity factor.

</details>

<details open>
<summary><strong>A Five-Step Translation Method</strong></summary>

For a factored characteristic polynomial:

1. list every real root and its multiplicity
2. list every complex-conjugate pair and its multiplicity
3. write the real basis contribution from each ledger row
4. attach separate arbitrary constants
5. count the total number of real modes

Keep the root ledger visible until the basis count is complete.

</details>

<details open>
<summary><strong>Complete Mixed-Root Example</strong></summary>

Suppose a fifth-order equation has characteristic polynomial:

$$
p(r)=(r-2)\left((r+1)^2+4\right)^2.
$$

### Step 1: Read the real root

The factor $(r-2)$ gives:

$$
r=2
\qquad\text{with multiplicity }1.
$$

It contributes:

$$
e^{2x}.
$$

### Step 2: Read the complex pair

Set the quadratic factor equal to zero:

$$
(r+1)^2+4=0.
$$

Subtract $4$:

$$
(r+1)^2=-4.
$$

Take square roots:

$$
r+1=\pm2i.
$$

Subtract $1$:

$$
r=-1\pm2i.
$$

Because the quadratic factor is squared, the conjugate pair has multiplicity
$2$.

### Step 3: Build the complex real basis

For $\alpha=-1$, $\beta=2$, and multiplicity $2$, use powers $1$ and $x$ on
both trigonometric modes:

$$
\begin{aligned}
&e^{-x}\cos(2x), \\
&e^{-x}\sin(2x), \\
&xe^{-x}\cos(2x), \\
&xe^{-x}\sin(2x).
\end{aligned}
$$

### Step 4: Combine the full family

Group the cosine and sine chains cleanly:

$$
\boxed{
\begin{aligned}
y
&=c_1e^{2x} \\
&\quad+e^{-x}
\left[(c_2+c_3x)\cos(2x)+(c_4+c_5x)\sin(2x)\right].
\end{aligned}
}.
$$

### Step 5: Count the modes

The real root contributes $1$ mode. The repeated conjugate pair contributes
$2\times2=4$ modes:

$$
1+4=5.
$$

The count matches the fifth-order equation.

</details>

<details open>
<summary><strong>Why The Sine Partner Cannot Be Omitted</strong></summary>

Suppose a real-coefficient equation has the solution:

$$
e^{3x}\cos(5x).
$$

This mode comes from roots:

$$
r=3\pm5i.
$$

The same conjugate pair necessarily supplies:

$$
e^{3x}\sin(5x).
$$

One trigonometric function alone does not represent the complete real basis for
a conjugate pair.

</details>

<details open>
<summary><strong>Repeated Complex Pair Checklist</strong></summary>

If $\alpha\pm i\beta$ has multiplicity $s$, check all four ingredients:

1. exponential envelope $e^{\alpha x}$
2. frequency $\beta$ inside sine and cosine
3. both sine and cosine families
4. powers $x^0$ through $x^{s-1}$ on both families

Missing any one ingredient produces an incomplete solution space.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A simple real root contributes one mode. A real root of multiplicity $s$
contributes $s$ modes. A conjugate pair of multiplicity $s$ contributes $2s$
real modes.

The sum of all ledger contributions must equal the equation's order.

</details>

---

## Block 6: Higher-Order Initial-Value Problems

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to apply $n$ initial conditions to an $n$th-order solution family
without skipping derivative or substitution steps.

</details>

<details open>
<summary><strong>How Many Conditions Are Needed?</strong></summary>

For a regular $n$th-order equation, an initial-value problem normally supplies:

$$
y(x_0),y'(x_0),\ldots,y^{(n-1)}(x_0).
$$

These $n$ values determine the $n$ constants in the general homogeneous
solution.

For a fourth-order equation, expect:

$$
y(x_0),
\quad y'(x_0),
\quad y''(x_0),
\quad y'''(x_0).
$$

Initial data stop one derivative below the equation's order.

</details>

<details open>
<summary><strong>A Complete Fourth-Order Initial-Value Problem</strong></summary>

Solve:

$$
y^{(4)}+4y''=0,
$$

subject to:

$$
y(0)=6,
\qquad
y'(0)=-1,
\qquad
y''(0)=-16,
\qquad
y'''(0)=-8.
$$

### Step 1: Write and factor the characteristic equation

The characteristic equation is:

$$
r^4+4r^2=0.
$$

Factor out $r^2$:

$$
r^2(r^2+4)=0.
$$

### Step 2: Build the root ledger

The factor $r^2$ gives $r=0$ with multiplicity $2$. It contributes:

$$
1,
\qquad
x.
$$

The factor $r^2+4$ gives $r=\pm2i$. It contributes:

$$
\cos(2x),
\qquad
\sin(2x).
$$

The ledger contains $2+2=4$ modes.

### Step 3: Write the complete general solution

Attach one constant to each mode:

$$
\boxed{
y=c_1+c_2x+c_3\cos(2x)+c_4\sin(2x)
}.
$$

### Step 4: Differentiate three times

Differentiate once:

$$
y'=c_2-2c_3\sin(2x)+2c_4\cos(2x).
$$

Differentiate again:

$$
y''=-4c_3\cos(2x)-4c_4\sin(2x).
$$

Differentiate a third time:

$$
y'''=8c_3\sin(2x)-8c_4\cos(2x).
$$

Each initial condition now has a matching formula.

### Step 5: Apply $y(0)=6$

Substitute $x=0$ into the function formula:

$$
6=c_1+c_2(0)+c_3\cos0+c_4\sin0.
$$

In $6=c_1+c_2(0)+c_3\cos0+c_4\sin0$, use $\cos0=1$ and $\sin0=0$:

$$
c_1+c_3=6.
$$

### Step 6: Apply $y'(0)=-1$

Substitute $x=0$ into the first-derivative formula:

$$
-1=c_2-2c_3\sin0+2c_4\cos0.
$$

Therefore:

$$
c_2+2c_4=-1.
$$

### Step 7: Apply $y''(0)=-16$

Substitute $x=0$ into the second-derivative formula:

$$
-16=-4c_3\cos0-4c_4\sin0.
$$

Therefore:

$$
-4c_3=-16.
$$

Divide by $-4$:

$$
c_3=4.
$$

### Step 8: Apply $y'''(0)=-8$

Substitute $x=0$ into the third-derivative formula:

$$
-8=8c_3\sin0-8c_4\cos0.
$$

Using $\sin0=0$ and $\cos0=1$ in this equation gives:

$$
-8c_4=-8.
$$

Divide by $-8$:

$$
c_4=1.
$$

### Step 9: Recover $c_1$ and $c_2$

Use $c_1+c_3=6$ with $c_3=4$:

$$
c_1+4=6.
$$

Subtract $4$:

$$
c_1=2.
$$

Use $c_2+2c_4=-1$ with $c_4=1$:

$$
c_2+2=-1.
$$

Subtract $2$:

$$
c_2=-3.
$$

### Step 10: Write the selected solution

Insert all four constants:

$$
\boxed{
y(x)=2-3x+4\cos(2x)+\sin(2x)
}.
$$

</details>

<details open>
<summary><strong>Verifying The Fourth-Order Solution</strong></summary>

For:

$$
y=2-3x+4\cos(2x)+\sin(2x),
$$

the derivatives are:

$$
\begin{aligned}
y'&=-3-8\sin(2x)+2\cos(2x), \\
y''&=-16\cos(2x)-4\sin(2x), \\
y'''&=32\sin(2x)-8\cos(2x), \\
y^{(4)}&=64\cos(2x)+16\sin(2x).
\end{aligned}
$$

Substitute $y''$ and $y^{(4)}$ into the ODE:

$$
\begin{aligned}
y^{(4)}+4y''
&=64\cos(2x)+16\sin(2x) \\
&\quad+4\left(-16\cos(2x)-4\sin(2x)\right) \\
&=0.
\end{aligned}
$$

Check the initial values:

$$
\begin{aligned}
y(0)&=2+4=6, \\
y'(0)&=-3+2=-1, \\
y''(0)&=-16, \\
y'''(0)&=-8.
\end{aligned}
$$

The function satisfies the equation and all four initial conditions.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An $n$th-order family has $n$ constants. Differentiate the complete family up
to order $n-1$, then apply one initial condition to its matching formula.

Keep every constant equation visible until the full system has been solved.

</details>

---

## Block 7: Reconstructing Equations And Using Known Solutions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to work backward from roots or known solution forms to a
characteristic polynomial, a differential equation, or a guaranteed partial
basis.

</details>

<details open>
<summary><strong>From Roots To A Differential Equation</strong></summary>

Construct a monic fourth-order equation with:

$$
r=-2
\quad\text{of multiplicity }2,
$$

and the conjugate pair:

$$
r=1\pm2i.
$$

### Step 1: Build the real-root factor

The repeated root $-2$ gives:

$$
(r+2)^2.
$$

### Step 2: Build the quadratic for the conjugate pair

For roots $\alpha\pm i\beta$, the real quadratic is:

$$
(r-\alpha)^2+\beta^2.
$$

Use $\alpha=1$ and $\beta=2$:

$$
(r-1)^2+4.
$$

Expand:

$$
\begin{aligned}
(r-1)^2+4
&=r^2-2r+1+4 \\
&=r^2-2r+5.
\end{aligned}
$$

### Step 3: Multiply the factors

The characteristic polynomial is:

$$
(r+2)^2(r^2-2r+5).
$$

First expand the repeated factor:

$$
(r+2)^2=r^2+4r+4.
$$

Now multiply:

$$
\begin{aligned}
(r^2+4r+4)(r^2-2r+5)
&=(r^4-2r^3+5r^2) \\
&\quad+(4r^3-8r^2+20r) \\
&\quad+(4r^2-8r+20).
\end{aligned}
$$

Combine equal powers:

$$
\begin{aligned}
(r^2+4r+4)(r^2-2r+5)
&=r^4+(-2+4)r^3 \\
&\quad+(5-8+4)r^2 \\
&\quad+(20-8)r+20 \\
&=r^4+2r^3+r^2+12r+20.
\end{aligned}
$$

### Step 4: Translate powers into derivatives

The associated differential equation is:

$$
\boxed{
y^{(4)}+2y'''+y''+12y'+20y=0
}.
$$

### Step 5: Write the general solution

The repeated real root contributes $e^{-2x}$ and $xe^{-2x}$. The conjugate
pair contributes $e^x\cos(2x)$ and $e^x\sin(2x)$. Therefore:

$$
\boxed{
y=e^{-2x}(c_1+c_2x)
+e^x\left(c_3\cos(2x)+c_4\sin(2x)\right)
}.
$$

</details>

<details open>
<summary><strong>What A Weighted Exponential Reveals</strong></summary>

Suppose a constant-coefficient homogeneous equation has the solution:

$$
x^2e^{3x}.
$$

The factor $x^2$ shows that $r=3$ has multiplicity at least $3$.

Therefore the equation must also admit:

$$
e^{3x}
\qquad\text{and}\qquad
xe^{3x}.
$$

The guaranteed chain is:

$$
e^{3x},
\qquad
xe^{3x},
\qquad
x^2e^{3x}.
$$

If the equation is exactly third-order, this chain is complete. If the
equation has higher order, additional roots remain unknown.

</details>

<details open>
<summary><strong>What A Weighted Trigonometric Solution Reveals</strong></summary>

Suppose a real-coefficient equation has the solution:

$$
xe^{-x}\cos(4x).
$$

The exponential and frequency reveal:

$$
r=-1\pm4i.
$$

The factor $x$ shows that the pair has multiplicity at least $2$.

Therefore the equation must admit:

$$
\begin{aligned}
&e^{-x}\cos(4x), \\
&e^{-x}\sin(4x), \\
&xe^{-x}\cos(4x), \\
&xe^{-x}\sin(4x).
\end{aligned}
$$

These four modes form a complete basis only if the equation is fourth-order.

</details>

<details open>
<summary><strong>Recognising Insufficient Information</strong></summary>

Suppose an eighth-order equation is known to have:

$$
xe^{-x}\cos(4x)
$$

as a solution.

This guarantees the four-mode chain from the previous section. An eighth-order
equation, however, needs eight independent modes.

For an eighth-order equation with four guaranteed modes, the number still
missing is:

$$
8-4=4.
$$

Without more information, the remaining roots cannot be determined uniquely.
State the partial basis and identify the missing dimension rather than
inventing additional modes.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

Roots determine polynomial factors, and polynomial factors determine the
differential equation. Weighted modes reveal minimum root multiplicities.

Compare the guaranteed basis count with the stated order before claiming that
a general solution is complete.

</details>

---

## Block 8: A Reliable Higher-Order Workflow And Common Mistakes

<details open>
<summary><strong>The Complete Workflow</strong></summary>

### Step 1: Classify the equation

Confirm that it is linear, homogeneous, and constant-coefficient. Record its
order $n$.

### Step 2: Write the characteristic polynomial

Map $y^{(k)}$ to $r^k$, preserving coefficients and zero gaps.

### Step 3: Factor or approximate the polynomial

Use common factors, grouping, substitutions such as $z=r^2$, known roots, or
numerical root methods when needed.

### Step 4: Build a root ledger

Record every real root, conjugate pair, and multiplicity.

### Step 5: Translate each ledger row

Use the appropriate real basis rule, including every required power of $x$.

### Step 6: Count the modes

The total must equal $n$.

### Step 7: Apply conditions

Differentiate the complete family as many times as needed, then apply one
condition at a time.

### Step 8: Verify

Check the ODE, all conditions, and the final basis count.

</details>

<details open>
<summary><strong>Common Mistake: Confusing Order And Degree</strong></summary>

For:

$$
3y^{(6)}-2y''+y=0,
$$

the characteristic equation is:

$$
3r^6-2r^2+1=0.
$$

It is sixth-degree, not quadratic merely because only three terms are visible.

</details>

<details open>
<summary><strong>Common Mistake: Ignoring Multiplicity</strong></summary>

The factor $(r-4)^3$ contributes:

$$
e^{4x},
\qquad
xe^{4x},
\qquad
x^2e^{4x}.
$$

Writing fewer than three modes loses dimensions from the solution space.

</details>

<details open>
<summary><strong>Common Mistake: Counting A Complex Pair As One Mode</strong></summary>

The pair $2\pm3i$ contributes:

$$
e^{2x}\cos(3x)
\qquad\text{and}\qquad
e^{2x}\sin(3x).
$$

If the pair has multiplicity $2$, it contributes four functions because both
trigonometric modes also receive a factor of $x$.

</details>

<details open>
<summary><strong>Common Mistake: Stopping Before The Count Reaches $n$</strong></summary>

Finding several valid solutions does not prove that the family is complete.

For a sixth-order equation, a proposed family with only five independent
functions is missing one direction, even if every displayed function solves
the ODE.

</details>

<details open>
<summary><strong>Common Mistake: Expanding Too Early</strong></summary>

The factored polynomial:

$$
(r+1)^3\left((r-2)^2+9\right)
$$

already displays all roots and multiplicities. Expanding it before building
the ledger creates extra algebra and hides the structure.

Expand only when the differential equation itself is requested.

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

The dependable chain is:

$$
\boxed{
\text{ODE order}
\longrightarrow
\text{characteristic polynomial}
\longrightarrow
\text{root ledger}
\longrightarrow
\text{real basis}
\longrightarrow
\text{mode count}
\longrightarrow
\text{conditions}
}.
$$

The mode count is the central safeguard against incomplete higher-order
solutions.

</details>

---

## Block 9: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Translate Derivatives Into Powers

Write the characteristic equation for:

$$
3y^{(6)}-2y^{(4)}+7y'-5y=0.
$$

Include the zero-coefficient terms before giving the shortened polynomial.

### Problem 2: Solve A Cubic With Distinct Roots

Find the general solution of:

$$
y'''+2y''-5y'-6y=0.
$$

### Problem 3: Solve A Biquadratic Equation

Find the general real solution of:

$$
y^{(4)}+5y''+4y=0.
$$

### Problem 4: Translate Repeated Real Roots

A fourth-order equation has:

$$
p(r)=(r+1)^3(r-4).
$$

Write its general solution and verify the mode count.

### Problem 5: Combine Repeated Real And Complex Roots

A fourth-order equation has:

$$
p(r)=(r+2)^2(r^2+6r+13).
$$

Write its general real solution.

### Problem 6: Handle A Repeated Complex Pair

A fourth-order equation has:

$$
p(r)=\left((r-1)^2+9\right)^2.
$$

Write its general real solution.

### Problem 7: Keep A Repeated Zero Root

Find the general solution of:

$$
y^{(5)}+9y'''=0.
$$

### Problem 8: Solve A Third-Order Initial-Value Problem

Solve:

$$
y'''-4y'=0,
$$

subject to:

$$
y(0)=3,
\qquad
y'(0)=2,
\qquad
y''(0)=8.
$$

### Problem 9: Construct An Equation From Roots

Construct the monic fourth-order differential equation with:

$$
r=0
\quad\text{of multiplicity }2,
$$

and:

$$
r=-1\pm2i.
$$

Also write its general solution.

### Problem 10: Infer A Complete Basis From One Weighted Exponential

A fourth-order real constant-coefficient homogeneous equation has
$x^3e^{-5x}$ as a solution. Determine its general solution and characteristic
polynomial.

### Problem 11: Infer A Basis From One Weighted Trigonometric Mode

A sixth-order real constant-coefficient homogeneous equation has:

$$
x^2e^x\sin(3x)
$$

as a solution. Determine its general real solution.

### Problem 12: Recognise Missing Information

A seventh-order real constant-coefficient homogeneous equation has
$x^2e^x\sin(3x)$ as a solution. State everything that is guaranteed and
explain why the full general solution cannot be determined.

### Problem 13: Build A Root Ledger

For:

$$
p(r)=r^2(r-5)^2\left((r+2)^2+1\right),
$$

build a root ledger, write the general real solution, and verify the order.

</details>

<details open>
<summary><strong>Worked Answers: Problems 1 To 7</strong></summary>

### Answer 1

Start from:

$$
3y^{(6)}-2y^{(4)}+7y'-5y=0.
$$

Display every derivative order:

$$
3y^{(6)}+0y^{(5)}-2y^{(4)}+0y'''+0y''+7y'-5y=0.
$$

Replace $y^{(k)}$ by $r^k$:

$$
3r^6+0r^5-2r^4+0r^3+0r^2+7r-5=0.
$$

Removing the zero-coefficient terms from the Answer 1 polynomial gives:

$$
\boxed{3r^6-2r^4+7r-5=0}.
$$

### Answer 2

The characteristic equation for
$y'''+2y''-5y'-6y=0$ is:

$$
r^3+2r^2-5r-6=0.
$$

Factor by grouping:

$$
\begin{aligned}
r^3+2r^2-5r-6
&=(r+1)(r^2+r-6) \\
&=(r+1)(r-2)(r+3).
\end{aligned}
$$

The roots are:

$$
r=-1,
\qquad
r=2,
\qquad
r=-3.
$$

They are distinct and real, so:

$$
\boxed{
y=c_1e^{-x}+c_2e^{2x}+c_3e^{-3x}
}.
$$

### Answer 3

The characteristic equation is:

$$
r^4+5r^2+4=0.
$$

Let $z=r^2$:

$$
z^2+5z+4=0.
$$

The equation $z^2+5z+4=0$ factors as:

$$
(z+1)(z+4)=0.
$$

Thus:

$$
r^2=-1
\qquad\text{or}\qquad
r^2=-4.
$$

The roots are:

$$
r=\pm i,
\qquad
r=\pm2i.
$$

Each simple conjugate pair contributes sine and cosine modes:

$$
\boxed{
y=c_1\cos x+c_2\sin x+c_3\cos(2x)+c_4\sin(2x)
}.
$$

### Answer 4

The polynomial is:

$$
p(r)=(r+1)^3(r-4).
$$

The root $r=-1$ has multiplicity $3$, so it contributes:

$$
e^{-x},
\qquad
xe^{-x},
\qquad
x^2e^{-x}.
$$

The simple root $r=4$ contributes $e^{4x}$. Therefore:

$$
\boxed{
y=e^{-x}(c_1+c_2x+c_3x^2)+c_4e^{4x}
}.
$$

The count is $3+1=4$, matching the fourth-order equation.

### Answer 5

The polynomial is:

$$
p(r)=(r+2)^2(r^2+6r+13).
$$

The repeated real root is:

$$
r=-2
\qquad\text{with multiplicity }2.
$$

It contributes $e^{-2x}$ and $xe^{-2x}$.

Complete the square in the quadratic:

$$
\begin{aligned}
r^2+6r+13
&=(r+3)^2+4.
\end{aligned}
$$

Thus the complex roots are:

$$
r=-3\pm2i.
$$

They contribute $e^{-3x}\cos(2x)$ and $e^{-3x}\sin(2x)$. Therefore:

$$
\boxed{
y=e^{-2x}(c_1+c_2x)
+e^{-3x}\left(c_3\cos(2x)+c_4\sin(2x)\right)
}.
$$

### Answer 6

The polynomial is:

$$
p(r)=\left((r-1)^2+9\right)^2.
$$

The roots are:

$$
r=1\pm3i.
$$

For roots $r=1\pm3i$, the squared quadratic means the conjugate pair has
multiplicity $2$.
Therefore both cosine and sine modes receive powers $1$ and $x$:

$$
\boxed{
y=e^x
\left[(c_1+c_2x)\cos(3x)+(c_3+c_4x)\sin(3x)\right]
}.
$$

The pair contributes $2\times2=4$ real modes.

### Answer 7

The characteristic equation for $y^{(5)}+9y'''=0$ is:

$$
r^5+9r^3=0.
$$

Factor out $r^3$:

$$
r^3(r^2+9)=0.
$$

The root $r=0$ has multiplicity $3$, contributing:

$$
1,x,x^2.
$$

The roots $r=\pm3i$ contribute:

$$
\cos(3x),\sin(3x).
$$

Therefore:

$$
\boxed{
y=c_1+c_2x+c_3x^2+c_4\cos(3x)+c_5\sin(3x)
}.
$$

</details>

<details open>
<summary><strong>Worked Answers: Problems 8 To 13</strong></summary>

### Answer 8

The characteristic equation for $y'''-4y'=0$ is:

$$
r^3-4r=0.
$$

Factor:

$$
r(r-2)(r+2)=0.
$$

The roots are $0,2,-2$, so:

$$
y=c_1+c_2e^{2x}+c_3e^{-2x}.
$$

Differentiate twice:

$$
\begin{aligned}
y'&=2c_2e^{2x}-2c_3e^{-2x}, \\
y''&=4c_2e^{2x}+4c_3e^{-2x}.
\end{aligned}
$$

Apply $y(0)=3$:

$$
c_1+c_2+c_3=3.
$$

Apply $y'(0)=2$:

$$
2c_2-2c_3=2.
$$

Divide by $2$:

$$
c_2-c_3=1.
$$

Apply $y''(0)=8$:

$$
4c_2+4c_3=8.
$$

Divide by $4$:

$$
c_2+c_3=2.
$$

Add $c_2-c_3=1$ and $c_2+c_3=2$:

$$
2c_2=3.
$$

Therefore:

$$
c_2=\frac32.
$$

Substitute $c_2=3/2$ into $c_2+c_3=2$:

$$
\frac32+c_3=2.
$$

Subtract $3/2$:

$$
c_3=\frac12.
$$

Use $c_1+c_2+c_3=3$:

$$
c_1+\frac32+\frac12=3.
$$

Subtracting $3/2+1/2=2$ from both sides gives:

$$
c_1=1.
$$

The selected solution is:

$$
\boxed{
y(x)=1+\frac32e^{2x}+\frac12e^{-2x}
}.
$$

### Answer 9

The roots are $r=0$ of multiplicity $2$ and $r=-1\pm2i$.

The repeated zero root gives the factor:

$$
r^2.
$$

The conjugate pair gives:

$$
(r+1)^2+4=r^2+2r+5.
$$

Multiply the factors:

$$
\begin{aligned}
r^2(r^2+2r+5)
&=r^4+2r^3+5r^2.
\end{aligned}
$$

Therefore the monic differential equation is:

$$
\boxed{
y^{(4)}+2y'''+5y''=0
}.
$$

The repeated zero root contributes $1$ and $x$. The conjugate pair contributes
$e^{-x}\cos(2x)$ and $e^{-x}\sin(2x)$. Thus:

$$
\boxed{
y=c_1+c_2x
+e^{-x}\left(c_3\cos(2x)+c_4\sin(2x)\right)
}.
$$

### Answer 10

The known solution is:

$$
x^3e^{-5x}.
$$

The exponential gives root $r=-5$. The factor $x^3$ shows that this root has
multiplicity at least $4$.

Because the equation is exactly fourth-order, the multiplicity is exactly $4$.
The characteristic polynomial is:

$$
\boxed{p(r)=(r+5)^4}.
$$

The four-mode chain is:

$$
e^{-5x},
\qquad
xe^{-5x},
\qquad
x^2e^{-5x},
\qquad
x^3e^{-5x}.
$$

Therefore:

$$
\boxed{
y=e^{-5x}(c_1+c_2x+c_3x^2+c_4x^3)
}.
$$

### Answer 11

The known mode is:

$$
x^2e^x\sin(3x).
$$

The exponential and frequency give the conjugate roots:

$$
r=1\pm3i.
$$

The factor $x^2$ shows that the pair has multiplicity at least $3$. A
sixth-order equation has room for exactly three copies of the pair because:

$$
2\times3=6.
$$

Use powers $1,x,x^2$ on both trigonometric modes:

$$
\boxed{
y=e^x
\left[
(c_1+c_2x+c_3x^2)\cos(3x)
+(c_4+c_5x+c_6x^2)\sin(3x)
\right]
}.
$$

### Answer 12

The mode $x^2e^x\sin(3x)$ guarantees the conjugate roots
$1\pm3i$ with multiplicity $3$. Therefore six real modes are guaranteed:

$$
\begin{aligned}
&e^x\cos(3x),
&&xe^x\cos(3x),
&&x^2e^x\cos(3x), \\
&e^x\sin(3x),
&&xe^x\sin(3x),
&&x^2e^x\sin(3x).
\end{aligned}
$$

The equation is seventh-order, so one mode is still missing:

$$
7-6=1.
$$

With real coefficients, the remaining unpaired root must be real. Call it
$r=\lambda$. The most that can be stated is:

$$
\begin{aligned}
y
&=e^x
\left[
(c_1+c_2x+c_3x^2)\cos(3x)
+(c_4+c_5x+c_6x^2)\sin(3x)
\right] \\
&\quad+c_7e^{\lambda x},
\end{aligned}
$$

where the value of $\lambda$ is unknown. The full general solution cannot be
determined without additional information.

### Answer 13

The polynomial is:

$$
p(r)=r^2(r-5)^2\left((r+2)^2+1\right).
$$

The root ledger is:

$$
\begin{array}{c|c|c}
\text{Root or pair} & \text{Multiplicity} & \text{Real modes} \\
\hline
0 & 2 & 1,x \\
5 & 2 & e^{5x},xe^{5x} \\
-2\pm i & 1 & e^{-2x}\cos x,e^{-2x}\sin x
\end{array}
$$

Attach separate constants:

$$
\boxed{
y=c_1+c_2x
+e^{5x}(c_3+c_4x)
+e^{-2x}(c_5\cos x+c_6\sin x)
}.
$$

The degree is:

$$
2+2+2=6.
$$

The six basis functions match a sixth-order differential equation.

</details>

<details open>
<summary><strong>Chapter 10 Final Summary</strong></summary>

For:

$$
a_ny^{(n)}+\cdots+a_1y'+a_0y=0,
$$

the characteristic equation is:

$$
a_nr^n+\cdots+a_1r+a_0=0.
$$

A real root $\rho$ of multiplicity $s$ contributes:

$$
e^{\rho x},xe^{\rho x},\ldots,x^{s-1}e^{\rho x}.
$$

A conjugate pair $\alpha\pm i\beta$ of multiplicity $s$ contributes both the
cosine and sine chains with powers $x^0$ through $x^{s-1}$.

The chapter's final lesson is:

> list every root, preserve every multiplicity, pair every complex root with
> its conjugate, and count the resulting real modes against the equation's
> order before calling the solution complete.

</details>
