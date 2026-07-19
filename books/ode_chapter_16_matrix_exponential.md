# The Matrix Exponential

Chapter 15 introduced matrix multiplication, powers, eigenvalues, and the
Cayley-Hamilton theorem. This chapter combines those ideas to define and
compute the matrix exponential:

$$
e^{At}.
$$

The notation resembles an ordinary exponential, but the exponent contains a
matrix. That makes factor order and matrix powers essential.

The main questions are:

- what does $e^{At}$ mean?
- why does its defining series converge?
- why is $\dfrac{d}{dt}e^{At}=Ae^{At}$?
- how does $e^{At}$ solve $\mathbf{x}'=A\mathbf{x}$?
- when does the infinite series stop after finitely many terms?
- how does Cayley-Hamilton reduce the exponential to a matrix polynomial?
- what changes when eigenvalues repeat?
- how do complex eigenvalues produce real sine and cosine entries?
- which familiar exponential laws remain valid for matrices?

---

## Block 1: Defining An Exponential Of A Matrix

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to give $e^{At}$ a precise meaning and to connect its notation to
the familiar scalar exponential series.

</details>

<details open>
<summary><strong>Recall The Scalar Series</strong></summary>

For a scalar $z$:

$$
e^z
=
1+z+\frac{z^2}{2!}+\frac{z^3}{3!}+\cdots.
$$

Set $z=at$:

$$
e^{at}
=
1+at+\frac{a^2t^2}{2!}+\frac{a^3t^3}{3!}+\cdots.
$$

The matrix exponential uses the same coefficient pattern, but scalar powers
$a^k$ are replaced by matrix powers $A^k$.

</details>

<details open>
<summary><strong>The Definition</strong></summary>

Let $A$ be a constant $n\times n$ matrix. Define:

$$
\boxed{
e^{At}
=
\sum_{k=0}^{\infty}\frac{A^kt^k}{k!}
}.
$$

Writing the first terms:

$$
\boxed{
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots
}.
$$

The term for $k=0$ is:

$$
\frac{A^0t^0}{0!}=I,
$$

because:

$$
A^0=I,
\qquad
t^0=1,
\qquad
0!=1.
$$

</details>

<details open>
<summary><strong>Why The Matrix Must Be Square</strong></summary>

The series contains:

$$
A^2,\quad A^3,\quad A^4,\quad\ldots
$$

These ordinary matrix powers require the product $AA$ to be defined and to
have the same dimensions as $A$. That happens when $A$ is square.

Every term in the series is then $n\times n$, so the terms can be added.

</details>

<details open>
<summary><strong>Convergence Without Hidden Mystery</strong></summary>

Choose any standard matrix norm $\lVert\cdot\rVert$ satisfying:

$$
\lVert AB\rVert\leq\lVert A\rVert\lVert B\rVert.
$$

Then:

$$
\left\lVert\frac{A^kt^k}{k!}\right\rVert
\leq
\frac{\lVert A\rVert^k|t|^k}{k!}.
$$

The scalar comparison series is:

$$
\sum_{k=0}^{\infty}
\frac{(\lVert A\rVert|t|)^k}{k!}
=
e^{\lVert A\rVert|t|},
$$

which converges for every finite $t$.

Therefore the matrix series also converges for every finite $t$.

The key intuition:

> the factorial in the denominator grows quickly enough to control the matrix
> powers, just as it controls powers in the ordinary exponential series.

</details>

<details open>
<summary><strong>Two Immediate Values</strong></summary>

Set $t=0$ in the series:

$$
\begin{aligned}
e^{A0}
&=
I+A(0)+\frac{A^2(0)^2}{2!}+\cdots\\
&=I.
\end{aligned}
$$

Thus:

$$
\boxed{e^{A0}=I}.
$$

If $A=0$, then every positive power of $A$ is zero:

$$
0^k=0
\qquad
\text{for }k\geq1.
$$

Because every positive-power term vanishes, the zero-matrix exponential is:

$$
\boxed{e^{0t}=I}.
$$

The matrix identity $I$, not the scalar $1$, is the constant term.

</details>

<details open>
<summary><strong>Not An Entrywise Exponential</strong></summary>

For:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
$$

the notation $e^{At}$ does not generally mean:

$$
\begin{bmatrix}
e^{at}&e^{bt}\\
e^{ct}&e^{dt}
\end{bmatrix}.
$$

The correct definition uses the matrix products $A^2,A^3,\ldots$. Those
products mix rows and columns, so one entry of $e^{At}$ can depend on several
entries of $A$.

Entrywise exponentiation is a different operation.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

For a constant square matrix $A$:

$$
\boxed{
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots
}.
$$

The series converges for every finite $t$, begins at $I$, and uses matrix
powers rather than entrywise powers.

</details>

---

## Block 2: Why The Matrix Exponential Solves A System

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to prove the derivative identity for $e^{At}$ and use it to solve
a constant-coefficient matrix differential equation.

</details>

<details open>
<summary><strong>Differentiate The Series Term By Term</strong></summary>

Start from:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots.
$$

Differentiate with respect to $t$. The matrix $A$ is constant:

$$
\begin{aligned}
\frac{d}{dt}e^{At}
&=
0+A+\frac{2A^2t}{2!}
+\frac{3A^3t^2}{3!}+\cdots\\
&=
A+A^2t+\frac{A^3t^2}{2!}+\cdots.
\end{aligned}
$$

Factor $A$ on the left:

$$
\begin{aligned}
\frac{d}{dt}e^{At}
&=
A\left(
I+At+\frac{A^2t^2}{2!}+\cdots
\right)\\
&=Ae^{At}.
\end{aligned}
$$

Therefore:

$$
\boxed{\frac{d}{dt}e^{At}=Ae^{At}}.
$$

</details>

<details open>
<summary><strong>Why The Matrix Can Also Appear On The Right</strong></summary>

Every term in $e^{At}$ is a scalar multiple of a power of $A$. Powers of the
same matrix commute:

$$
AA^k=A^{k+1}=A^kA.
$$

Therefore:

$$
Ae^{At}=e^{At}A.
$$

The derivative may also be written:

$$
\boxed{\frac{d}{dt}e^{At}=e^{At}A}.
$$

This does not mean that $A$ commutes with every matrix. It commutes here
because $e^{At}$ is built entirely from powers of $A$.

</details>

<details open>
<summary><strong>Solving The Initial-Value Problem</strong></summary>

Consider:

$$
\mathbf{x}'(t)=A\mathbf{x}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{c}.
$$

Propose:

$$
\boxed{
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
}.
$$

For $\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}$, differentiate using the matrix
exponential derivative:

$$
\begin{aligned}
\mathbf{x}'(t)
&=
\frac{d}{dt}
\left[e^{A(t-t_0)}\right]\mathbf{c}\\
&=
Ae^{A(t-t_0)}\mathbf{c}\\
&=A\mathbf{x}(t).
\end{aligned}
$$

Now check the initial value. Set $t=t_0$:

$$
\begin{aligned}
\mathbf{x}(t_0)
&=
e^{A(t_0-t_0)}\mathbf{c}\\
&=e^{A0}\mathbf{c}\\
&=I\mathbf{c}\\
&=\mathbf{c}.
\end{aligned}
$$

The proposed formula satisfies both the differential equation and the initial
condition.

</details>

<details open>
<summary><strong>The Columns Are Individual Solutions</strong></summary>

Write:

$$
e^{At}
=
\begin{bmatrix}
\vert&\vert&&\vert\\
\mathbf{x}_1(t)&\mathbf{x}_2(t)&\cdots&\mathbf{x}_n(t)\\
\vert&\vert&&\vert
\end{bmatrix}.
$$

Since:

$$
\frac{d}{dt}e^{At}=Ae^{At},
$$

Because $(e^{At})'=Ae^{At}$, equality of corresponding columns gives:

$$
\mathbf{x}_j'(t)=A\mathbf{x}_j(t)
$$

for each $j$.

At $t=0$:

$$
e^{A0}=I.
$$

Therefore the $j$th column starts from the $j$th standard basis vector.

What this tells us:

> one matrix $e^{At}$ packages a complete set of specially normalized
> solutions of the system.

</details>

<details open>
<summary><strong>A Diagonal System Example</strong></summary>

Let:

$$
D=
\begin{bmatrix}
2&0\\
0&-3
\end{bmatrix}
$$

and solve:

$$
\mathbf{x}'=D\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
4\\
-1
\end{bmatrix}.
$$

For $D=\operatorname{diag}(2,-3)$, the powers remain diagonal:

$$
D^k=
\begin{bmatrix}
2^k&0\\
0&(-3)^k
\end{bmatrix}.
$$

Substitute these powers into the defining series:

$$
\begin{aligned}
e^{Dt}
&=
\begin{bmatrix}
\displaystyle\sum_{k=0}^{\infty}\frac{2^kt^k}{k!}&0\\
0&\displaystyle\sum_{k=0}^{\infty}\frac{(-3)^kt^k}{k!}
\end{bmatrix}\\
&=
\begin{bmatrix}
e^{2t}&0\\
0&e^{-3t}
\end{bmatrix}.
\end{aligned}
$$

Use $\mathbf{x}(t)=e^{Dt}\mathbf{x}(0)$:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\begin{bmatrix}
e^{2t}&0\\
0&e^{-3t}
\end{bmatrix}
\begin{bmatrix}
4\\
-1
\end{bmatrix}\\
&=
\begin{bmatrix}
4e^{2t}\\
-e^{-3t}
\end{bmatrix}.
\end{aligned}
$$

The solution is:

$$
\boxed{
\mathbf{x}(t)=
\begin{bmatrix}
4e^{2t}\\
-e^{-3t}
\end{bmatrix}
}.
$$

The first component grows, while the second decays.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

The matrix exponential satisfies:

$$
\boxed{
\frac{d}{dt}e^{At}
=
Ae^{At}
=
e^{At}A
}
$$

and:

$$
e^{A0}=I.
$$

Therefore:

$$
\boxed{
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
}
$$

solves $\mathbf{x}'=A\mathbf{x}$ with
$\mathbf{x}(t_0)=\mathbf{c}$.

</details>

---

## Block 3: Diagonal And Nilpotent Shortcuts

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to recognize matrices for which the exponential can be read from
the series without solving an interpolation problem.

</details>

<details open>
<summary><strong>Diagonal Matrices</strong></summary>

For:

$$
D=
\begin{bmatrix}
d_1&0&\cdots&0\\
0&d_2&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&d_n
\end{bmatrix},
$$

For $D=\operatorname{diag}(d_1,\ldots,d_n)$, every power is:

$$
D^k=
\begin{bmatrix}
d_1^k&0&\cdots&0\\
0&d_2^k&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&d_n^k
\end{bmatrix}.
$$

Substituting into the exponential series gives:

$$
\boxed{
e^{Dt}
=
\begin{bmatrix}
e^{d_1t}&0&\cdots&0\\
0&e^{d_2t}&\cdots&0\\
\vdots&\vdots&\ddots&\vdots\\
0&0&\cdots&e^{d_nt}
\end{bmatrix}
}.
$$

Only diagonal matrices permit this simple entrywise-looking rule.

</details>

<details open>
<summary><strong>Nilpotent Matrices</strong></summary>

A matrix $N$ is **nilpotent** if some positive power equals zero.

The defining condition is:

$$
N^r=0,
$$

Once $N^r=0$, every higher power also vanishes:

$$
N^{r+1}=N^rN=0,
\qquad
N^{r+2}=0,
\quad\ldots
$$

The exponential series stops:

$$
\boxed{
e^{Nt}
=
I+Nt+\frac{N^2t^2}{2!}
+\cdots+
\frac{N^{r-1}t^{r-1}}{(r-1)!}
}.
$$

The infinite series has become a finite matrix polynomial.

</details>

<details open>
<summary><strong>A Nilpotent Example</strong></summary>

Let:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}.
$$

Calculate $N^2$:

$$
\begin{aligned}
N^2
&=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
0(0)+2(0)&0(2)+2(0)\\
0(0)+0(0)&0(2)+0(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
0&0\\
0&0
\end{bmatrix}.
\end{aligned}
$$

Since $N^2=0$, every term from the quadratic term onward vanishes:

$$
\begin{aligned}
e^{Nt}
&=
I+Nt+\frac{N^2t^2}{2!}+\cdots\\
&=I+Nt.
\end{aligned}
$$

Substitute $I$ and $N$:

$$
\begin{aligned}
e^{Nt}
&=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
+t
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}.
\end{aligned}
$$

The nilpotent exponential is:

$$
\boxed{
e^{Nt}
=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>A Scalar Shift Of A Nilpotent Matrix</strong></summary>

Consider:

$$
A=
\begin{bmatrix}
4&2\\
0&4
\end{bmatrix}.
$$

Separate the scalar part:

$$
A=4I+N,
$$

where:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
$$

and $N^2=0$.

The matrices $4I$ and $N$ commute. For commuting matrices, the exponential of
a sum splits into a product:

$$
e^{(4I+N)t}=e^{4It}e^{Nt}.
$$

This exponential law will be justified in Block 7.

For the commuting split $A=4I+N$, the two exponential factors are:

$$
e^{4It}=e^{4t}I
$$

and:

$$
e^{Nt}=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix},
$$

we obtain:

$$
\boxed{
e^{At}
=
e^{4t}
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Verify The Shifted Formula</strong></summary>

Let:

$$
E(t)=
e^{4t}
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}.
$$

Differentiate using the scalar product rule:

$$
\begin{aligned}
E'(t)
&=
4e^{4t}
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
+
e^{4t}
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}\\
&=
e^{4t}
\begin{bmatrix}
4&8t+2\\
0&4
\end{bmatrix}.
\end{aligned}
$$

Recall the candidate:

$$
E(t)=e^{4t}\begin{bmatrix}1&2t\\0&1\end{bmatrix}.
$$

Now calculate $AE(t)$:

$$
\begin{aligned}
AE(t)
&=
\begin{bmatrix}
4&2\\
0&4
\end{bmatrix}
e^{4t}
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}\\
&=
e^{4t}
\begin{bmatrix}
4&8t+2\\
0&4
\end{bmatrix}.
\end{aligned}
$$

The derivative and matrix product agree:

$$
E'(t)=AE(t).
$$

At $t=0$:

$$
E(0)=I.
$$

These two checks confirm that $E(t)=e^{At}$.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

For a diagonal matrix, exponentiate the diagonal entries. For a nilpotent
matrix $N$ with $N^r=0$, the defining series stops after the term containing
$N^{r-1}$.

When a matrix has the scalar-plus-nilpotent form:

$$
A=\alpha I+N,
$$

Because $\alpha I$ commutes with $N$, a matrix $A=\alpha I+N$ satisfies:

$$
\boxed{e^{At}=e^{\alpha t}e^{Nt}},
$$

This turns the matrix calculation into a scalar exponential multiplied by a
finite nilpotent exponential.

</details>

---

## Block 4: Cayley-Hamilton With Distinct Eigenvalues

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to replace the infinite series for $e^{At}$ with a finite
polynomial in $A$ and calculate its coefficients from distinct eigenvalues.

</details>

<details open>
<summary><strong>Why A Finite Polynomial Is Possible</strong></summary>

Let $A$ be $n\times n$, with characteristic polynomial:

$$
p_A(\lambda)
=
\lambda^n+c_{n-1}\lambda^{n-1}+\cdots+c_0.
$$

Cayley-Hamilton gives:

$$
p_A(A)=0.
$$

Therefore $A^n$ can be written using lower powers:

$$
A^n
=
-c_{n-1}A^{n-1}-\cdots-c_0I.
$$

Multiplying this identity by further powers of $A$ reduces
$A^{n+1},A^{n+2},\ldots$ as well.

Consequently, the matrix exponential can be written in the form:

$$
\boxed{
e^{At}
=
a_0(t)I+a_1(t)A+\cdots+a_{n-1}(t)A^{n-1}
}.
$$

The functions $a_0,\ldots,a_{n-1}$ depend on $t$ and on the matrix $A$.

</details>

<details open>
<summary><strong>The Interpolating Polynomial</strong></summary>

Introduce the scalar polynomial:

$$
r_t(\lambda)
=
a_0(t)+a_1(t)\lambda+\cdots+a_{n-1}(t)\lambda^{n-1}.
$$

The subscript $t$ reminds us that $t$ is held fixed while $\lambda$ is the
polynomial variable.

For every distinct eigenvalue $\lambda_j$ of $A$, require:

$$
\boxed{
r_t(\lambda_j)=e^{\lambda_jt}
}.
$$

Once the scalar coefficient functions have been found, replace $\lambda$ by
$A$:

$$
e^{At}=r_t(A).
$$

This separates the calculation into two stages:

1. solve a scalar interpolation problem;
2. evaluate the resulting polynomial at the matrix.

</details>

<details open>
<summary><strong>A Complete Distinct-Eigenvalue Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
2&1\\
3&4
\end{bmatrix}.
$$

We will find $e^{At}$ without finding eigenvectors.

For the matrix:

$$
A=\begin{bmatrix}2&1\\3&4\end{bmatrix},
$$

construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-2&-1\\
-3&\lambda-4
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
(\lambda-2)(\lambda-4)-(-1)(-3)\\
&=
(\lambda-2)(\lambda-4)-3.
\end{aligned}
$$

Expand:

$$
\begin{aligned}
p_A(\lambda)
&=
\lambda^2-6\lambda+8-3\\
&=
\lambda^2-6\lambda+5.
\end{aligned}
$$

Factor:

$$
p_A(\lambda)
=
(\lambda-1)(\lambda-5).
$$

Therefore the two distinct eigenvalues are:

$$
\boxed{\lambda_1=1,\qquad\lambda_2=5}.
$$

</details>

<details open>
<summary><strong>Build The Coefficient Equations</strong></summary>

Because $A$ is $2\times2$, use a polynomial of degree at most $1$:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

The coefficient functions depend on $t$, but the shorter notation
$a_0,a_1$ will be used inside this calculation.

For the distinct eigenvalues $1$ and $5$, begin at $\lambda_1=1$ and impose:

$$
r_t(1)=e^t.
$$

Substitute $\lambda=1$ into $a_0+a_1\lambda$:

$$
a_0+a_1=e^t.
$$

At $\lambda_2=5$, impose:

$$
r_t(5)=e^{5t}.
$$

Substitute $\lambda=5$:

$$
a_0+5a_1=e^{5t}.
$$

Thus the coefficient system is:

$$
\begin{aligned}
a_0+a_1&=e^t,\\
a_0+5a_1&=e^{5t}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Solve The Coefficient System</strong></summary>

Subtract the first equation from the second:

$$
(a_0+5a_1)-(a_0+a_1)=e^{5t}-e^t.
$$

The $a_0$ terms cancel:

$$
4a_1=e^{5t}-e^t.
$$

From $4a_1=e^{5t}-e^t$, divide by $4$:

$$
\boxed{
a_1=\frac{e^{5t}-e^t}{4}
}.
$$

Return to:

$$
a_0+a_1=e^t.
$$

Subtract $a_1$:

$$
a_0=e^t-a_1.
$$

Insert the calculated $a_1$:

$$
\begin{aligned}
a_0
&=
e^t-\frac{e^{5t}-e^t}{4}\\
&=
\frac{4e^t-e^{5t}+e^t}{4}\\
&=
\frac{5e^t-e^{5t}}{4}.
\end{aligned}
$$

Therefore:

$$
\boxed{
a_0=\frac{5e^t-e^{5t}}{4}
}.
$$

</details>

<details open>
<summary><strong>Evaluate The Polynomial At The Matrix</strong></summary>

The reduced exponential is:

$$
e^{At}=a_0I+a_1A.
$$

Substitute $a_0$, $a_1$, $I$, and $A$:

$$
\begin{aligned}
e^{At}
&=
\frac{5e^t-e^{5t}}{4}
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}\\
&\quad+
\frac{e^{5t}-e^t}{4}
\begin{bmatrix}
2&1\\
3&4
\end{bmatrix}.
\end{aligned}
$$

Calculate each entry. The row $1$, column $1$ entry is:

$$
\begin{aligned}
a_0+2a_1
&=
\frac{5e^t-e^{5t}}{4}
+
\frac{2e^{5t}-2e^t}{4}\\
&=
\frac{3e^t+e^{5t}}{4}.
\end{aligned}
$$

The row $1$, column $2$ entry is:

$$
a_1=\frac{e^{5t}-e^t}{4}.
$$

The row $2$, column $1$ entry is:

$$
3a_1=\frac{3e^{5t}-3e^t}{4}.
$$

The row $2$, column $2$ entry is:

$$
\begin{aligned}
a_0+4a_1
&=
\frac{5e^t-e^{5t}}{4}
+
\frac{4e^{5t}-4e^t}{4}\\
&=
\frac{e^t+3e^{5t}}{4}.
\end{aligned}
$$

Place the entries into the matrix:

$$
\boxed{
e^{At}
=
\frac14
\begin{bmatrix}
3e^t+e^{5t}&e^{5t}-e^t\\
3e^{5t}-3e^t&e^t+3e^{5t}
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Use The Result In An Initial-Value Problem</strong></summary>

Solve:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
1\\
0
\end{bmatrix},
$$

where:

$$
A=
\begin{bmatrix}
2&1\\
3&4
\end{bmatrix}.
$$

Use the matrix-exponential solution formula:

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0).
$$

Substitute the calculated exponential:

$$
\begin{aligned}
\mathbf{x}(t)
&=
\frac14
\begin{bmatrix}
3e^t+e^{5t}&e^{5t}-e^t\\
3e^{5t}-3e^t&e^t+3e^{5t}
\end{bmatrix}
\begin{bmatrix}
1\\
0
\end{bmatrix}\\
&=
\frac14
\begin{bmatrix}
3e^t+e^{5t}\\
3e^{5t}-3e^t
\end{bmatrix}.
\end{aligned}
$$

The solution selected by the initial vector is:

$$
\boxed{
\mathbf{x}(t)
=
\frac14
\begin{bmatrix}
3e^t+e^{5t}\\
3e^{5t}-3e^t
\end{bmatrix}
}.
$$

Setting $t=0$ gives:

$$
\mathbf{x}(0)
=
\frac14
\begin{bmatrix}
4\\
0
\end{bmatrix}
=
\begin{bmatrix}
1\\
0
\end{bmatrix},
$$

so the initial condition is satisfied.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Cayley-Hamilton reduces $e^{At}$ to a polynomial of degree at most $n-1$ in an
$n\times n$ matrix.

For distinct eigenvalues, build:

$$
r_t(\lambda)
=
a_0+a_1\lambda+\cdots+a_{n-1}\lambda^{n-1}
$$

For each distinct eigenvalue $\lambda_j$, impose:

$$
r_t(\lambda_j)=e^{\lambda_jt}.
$$

Solve for the scalar coefficient functions, then calculate:

$$
\boxed{e^{At}=r_t(A)}.
$$

</details>

---

## Block 5: Repeated Eigenvalues And Derivative Conditions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to explain why a repeated eigenvalue supplies more than one
coefficient equation and to keep the differentiation variable explicit.

</details>

<details open>
<summary><strong>Why Repeating The Same Value Is Not Enough</strong></summary>

Suppose a $2\times2$ matrix has only one eigenvalue $\lambda_0$, repeated
twice. The reduced polynomial is:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

The value condition:

$$
r_t(\lambda_0)=e^{\lambda_0t}
$$

provides only one equation for two unknown coefficient functions.

Writing that same equation twice adds no information. A second, independent
condition is needed.

</details>

<details open>
<summary><strong>The Derivative-Matching Rule</strong></summary>

If $\lambda_0$ is an eigenvalue of algebraic multiplicity $m$, match the first
$m$ pieces of derivative data:

$$
\boxed{
\frac{\partial^q r_t}{\partial\lambda^q}(\lambda_0)
=
\frac{\partial^q}{\partial\lambda^q}
e^{\lambda t}\bigg|_{\lambda=\lambda_0},
\qquad
q=0,1,\ldots,m-1
}.
$$

The differentiation is with respect to $\lambda$. During this operation, $t$
is treated as a constant.

For the exponential:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t},
$$

Differentiating once more gives:

$$
\frac{\partial^2}{\partial\lambda^2}e^{\lambda t}
=
t^2e^{\lambda t}.
$$

A repeated eigenvalue of multiplicity $2$ requires value and first-derivative
matching. Multiplicity $3$ requires value, first derivative, and second
derivative.

</details>

<details open>
<summary><strong>A Complete Repeated-Eigenvalue Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
3&1\\
-1&1
\end{bmatrix}.
$$

Construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-3&-1\\
1&\lambda-1
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
(\lambda-3)(\lambda-1)-(-1)(1)\\
&=
(\lambda-3)(\lambda-1)+1.
\end{aligned}
$$

Expanding $p_A(\lambda)=(\lambda-3)(\lambda-1)+1$ gives:

$$
\begin{aligned}
p_A(\lambda)
&=
\lambda^2-4\lambda+3+1\\
&=
\lambda^2-4\lambda+4\\
&=
(\lambda-2)^2.
\end{aligned}
$$

Thus $\lambda=2$ has algebraic multiplicity $2$.

</details>

<details open>
<summary><strong>Build Both Coefficient Conditions</strong></summary>

For a $2\times2$ matrix, use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

First match values at $\lambda=2$:

$$
r_t(2)=e^{2t}.
$$

Substitute $\lambda=2$:

$$
a_0+2a_1=e^{2t}.
$$

Now differentiate with respect to $\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1.
$$

Differentiate the target function with respect to $\lambda$:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t}.
$$

Since $\partial r_t/\partial\lambda=a_1$ and
$\partial e^{\lambda t}/\partial\lambda=te^{\lambda t}$, evaluation at
$\lambda=2$ gives:

$$
a_1=te^{2t}.
$$

The two independent equations are therefore:

$$
\begin{aligned}
a_0+2a_1&=e^{2t},\\
a_1&=te^{2t}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Solve And Evaluate At The Matrix</strong></summary>

The second equation already gives:

$$
a_1=te^{2t}.
$$

Substitute this into the first equation:

$$
a_0+2te^{2t}=e^{2t}.
$$

Subtract $2te^{2t}$:

$$
\begin{aligned}
a_0
&=
e^{2t}-2te^{2t}\\
&=
e^{2t}(1-2t).
\end{aligned}
$$

Therefore:

$$
e^{At}=a_0I+a_1A.
$$

Insert $a_0=e^{2t}(1-2t)$ and $a_1=te^{2t}$:

$$
\begin{aligned}
e^{At}
&=
e^{2t}(1-2t)I+te^{2t}A\\
&=
e^{2t}\left[(1-2t)I+tA\right].
\end{aligned}
$$

Now substitute $I$ and $A$:

$$
\begin{aligned}
(1-2t)I+tA
&=
(1-2t)
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
+
t
\begin{bmatrix}
3&1\\
-1&1
\end{bmatrix}\\
&=
\begin{bmatrix}
1-2t+3t&t\\
-t&1-2t+t
\end{bmatrix}\\
&=
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}.
\end{aligned}
$$

Hence:

$$
\boxed{
e^{At}
=
e^{2t}
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Verify The Repeated-Eigenvalue Formula</strong></summary>

Let:

$$
E(t)
=
e^{2t}
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}.
$$

At $t=0$:

$$
E(0)
=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
=
I.
$$

Differentiate. Let:

$$
M(t)=
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}.
$$

Then:

$$
M'(t)=
\begin{bmatrix}
1&1\\
-1&-1
\end{bmatrix}.
$$

Use the product rule:

$$
E'(t)=e^{2t}[2M(t)+M'(t)].
$$

Calculate the bracket:

$$
\begin{aligned}
2M+M'
&=
2
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}
+
\begin{bmatrix}
1&1\\
-1&-1
\end{bmatrix}\\
&=
\begin{bmatrix}
3+2t&1+2t\\
-1-2t&1-2t
\end{bmatrix}.
\end{aligned}
$$

Now calculate $AM(t)$:

$$
\begin{aligned}
AM
&=
\begin{bmatrix}
3&1\\
-1&1
\end{bmatrix}
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}\\
&=
\begin{bmatrix}
3+2t&1+2t\\
-1-2t&1-2t
\end{bmatrix}.
\end{aligned}
$$

Because the differentiated matrix and $AM(t)$ agree:

$$
E'(t)=e^{2t}AM(t)=AE(t).
$$

Together with $E(0)=I$, this verifies the exponential.

</details>

<details open>
<summary><strong>Do Not Differentiate With Respect To The Wrong Variable</strong></summary>

The interpolation polynomial is:

$$
r_t(\lambda)=a_0(t)+a_1(t)\lambda.
$$

When repeated-eigenvalue conditions are formed, differentiate with respect to
$\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1(t).
$$

Differentiating with respect to $t$ would instead give:

$$
\frac{\partial r_t}{\partial t}
=
a_0'(t)+a_1'(t)\lambda,
$$

which is a different expression and does not provide the required Hermite
interpolation condition.

What to remember:

> hold $t$ fixed, differentiate in $\lambda$, and only then substitute the
> repeated eigenvalue.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

For an eigenvalue $\lambda_0$ of multiplicity $m$, match:

$$
r_t^{(q)}(\lambda_0)
=
\frac{\partial^q}{\partial\lambda^q}
e^{\lambda t}\bigg|_{\lambda=\lambda_0},
\qquad
q=0,\ldots,m-1.
$$

These are derivatives with respect to $\lambda$, not $t$. They provide the
additional independent equations needed to determine the polynomial
coefficients.

</details>

---

## Block 6: Complex Eigenvalues And Real Rotation Matrices

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see how a real matrix with complex eigenvalues can have a
completely real matrix exponential built from sine and cosine.

</details>

<details open>
<summary><strong>A Matrix Whose Square Is Negative</strong></summary>

Let:

$$
J=
\begin{bmatrix}
0&-2\\
2&0
\end{bmatrix}.
$$

Calculate $J^2$:

$$
\begin{aligned}
J^2
&=
\begin{bmatrix}
0&-2\\
2&0
\end{bmatrix}
\begin{bmatrix}
0&-2\\
2&0
\end{bmatrix}\\
&=
\begin{bmatrix}
-4&0\\
0&-4
\end{bmatrix}\\
&=-4I.
\end{aligned}
$$

The identity $J^2=-4I$ plays the same role as:

$$
i^2=-1
$$

in the scalar exponential.

</details>

<details open>
<summary><strong>Separate Even And Odd Powers</strong></summary>

Start from:

$$
e^{Jt}
=
I+Jt+\frac{J^2t^2}{2!}
+\frac{J^3t^3}{3!}+\cdots.
$$

Since $J^2=-4I$:

$$
J^{2m}=(-4)^mI
$$

and:

$$
J^{2m+1}=(-4)^mJ.
$$

Group the even powers:

$$
\begin{aligned}
\sum_{m=0}^{\infty}
\frac{J^{2m}t^{2m}}{(2m)!}
&=
I
\sum_{m=0}^{\infty}
\frac{(-4)^mt^{2m}}{(2m)!}\\
&=
I
\sum_{m=0}^{\infty}
\frac{(-1)^m(2t)^{2m}}{(2m)!}\\
&=I\cos(2t).
\end{aligned}
$$

The remaining odd-power terms are:

$$
\begin{aligned}
\sum_{m=0}^{\infty}
\frac{J^{2m+1}t^{2m+1}}{(2m+1)!}
&=
J
\sum_{m=0}^{\infty}
\frac{(-4)^mt^{2m+1}}{(2m+1)!}\\
&=
\frac{J}{2}
\sum_{m=0}^{\infty}
\frac{(-1)^m(2t)^{2m+1}}{(2m+1)!}\\
&=
\frac{J}{2}\sin(2t).
\end{aligned}
$$

Add the even and odd parts:

$$
\boxed{
e^{Jt}
=
I\cos(2t)+\frac{J}{2}\sin(2t)
}.
$$

</details>

<details open>
<summary><strong>Write The Real Matrix Explicitly</strong></summary>

Substitute:

$$
I=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
$$

and:

$$
\frac{J}{2}
=
\begin{bmatrix}
0&-1\\
1&0
\end{bmatrix}.
$$

Then:

$$
\begin{aligned}
e^{Jt}
&=
\begin{bmatrix}
\cos(2t)&0\\
0&\cos(2t)
\end{bmatrix}
+
\begin{bmatrix}
0&-\sin(2t)\\
\sin(2t)&0
\end{bmatrix}\\
&=
\begin{bmatrix}
\cos(2t)&-\sin(2t)\\
\sin(2t)&\cos(2t)
\end{bmatrix}.
\end{aligned}
$$

Combining the even and odd series gives the real matrix:

$$
\boxed{
e^{Jt}
=
\begin{bmatrix}
\cos(2t)&-\sin(2t)\\
\sin(2t)&\cos(2t)
\end{bmatrix}
}.
$$

This matrix rotates vectors through angle $2t$.

</details>

<details open>
<summary><strong>Where The Complex Eigenvalues Appear</strong></summary>

Construct:

$$
\lambda I-J
=
\begin{bmatrix}
\lambda&2\\
-2&\lambda
\end{bmatrix}.
$$

Its determinant is:

$$
\begin{aligned}
p_J(\lambda)
&=
\lambda^2-2(-2)\\
&=
\lambda^2+4.
\end{aligned}
$$

Set the polynomial equal to zero:

$$
\lambda^2+4=0.
$$

Thus:

$$
\lambda=\pm2i.
$$

The eigenvalues are complex, but the sine and cosine terms combine into a real
matrix exponential because $J$ itself is real.

</details>

<details open>
<summary><strong>Decay Combined With Rotation</strong></summary>

Let:

$$
A=-I+J
=
\begin{bmatrix}
-1&-2\\
2&-1
\end{bmatrix}.
$$

The matrices $-I$ and $J$ commute, so:

$$
e^{At}
=
e^{-tI}e^{Jt}.
$$

Since $e^{-tI}=e^{-t}I$:

$$
\boxed{
e^{At}
=
e^{-t}
\begin{bmatrix}
\cos(2t)&-\sin(2t)\\
\sin(2t)&\cos(2t)
\end{bmatrix}
}.
$$

The factor $e^{-t}$ shrinks lengths, while the sine-cosine matrix rotates.

</details>

<details open>
<summary><strong>A Complete Initial-Value Example</strong></summary>

Solve:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(0)=
\begin{bmatrix}
3\\
0
\end{bmatrix},
$$

where:

$$
A=
\begin{bmatrix}
-1&-2\\
2&-1
\end{bmatrix}.
$$

The initial vector is:

$$
\mathbf{x}(0)=\begin{bmatrix}3\\0\end{bmatrix}.
$$

Use:

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0).
$$

Substitute the exponential:

$$
\begin{aligned}
\mathbf{x}(t)
&=
e^{-t}
\begin{bmatrix}
\cos(2t)&-\sin(2t)\\
\sin(2t)&\cos(2t)
\end{bmatrix}
\begin{bmatrix}
3\\
0
\end{bmatrix}\\
&=
3e^{-t}
\begin{bmatrix}
\cos(2t)\\
\sin(2t)
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
\mathbf{x}(t)
=
3e^{-t}
\begin{bmatrix}
\cos(2t)\\
\sin(2t)
\end{bmatrix}
}.
$$

The solution rotates counterclockwise while approaching the origin.

</details>

<details open>
<summary><strong>A General Two-By-Two Pattern</strong></summary>

Suppose:

$$
A=\alpha I+K
$$

For this pattern, assume also that:

$$
K^2=-\beta^2I,
\qquad
\beta>0.
$$

For $A=\alpha I+K$, the matrix $\alpha I$ commutes with $K$, so:

$$
e^{At}=e^{\alpha t}e^{Kt}.
$$

The same even-odd series argument gives:

$$
\boxed{
e^{At}
=
e^{\alpha t}
\left[
I\cos(\beta t)
+
\frac{K}{\beta}\sin(\beta t)
\right]
}.
$$

The scalar $\alpha$ controls exponential growth or decay. The scalar $\beta$
controls the rotation frequency.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

A real matrix can have complex eigenvalues and still have a real exponential.
When $J^2=-\beta^2I$:

$$
\boxed{
e^{Jt}
=
I\cos(\beta t)
+
\frac{J}{\beta}\sin(\beta t)
}.
$$

A scalar shift $\alpha I$ contributes the factor $e^{\alpha t}$.

</details>

---

## Block 7: Exponential Laws, Workflow, And Common Mistakes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to identify which scalar exponential laws remain valid, state the
required commutativity condition, and organize the available computation
methods.

</details>

<details open>
<summary><strong>The Same-Matrix Addition Law</strong></summary>

The matrices $At$ and $As$ commute because both are scalar multiples of $A$.
Therefore:

$$
\boxed{
e^{At}e^{As}=e^{A(t+s)}
}.
$$

The order can also be reversed:

$$
e^{As}e^{At}=e^{A(t+s)}.
$$

This is the matrix version of the scalar law $e^{at}e^{as}=e^{a(t+s)}$.

</details>

<details open>
<summary><strong>The Inverse Of A Matrix Exponential</strong></summary>

Set $s=-t$ in the same-matrix addition law:

$$
e^{At}e^{-At}=e^{A(t-t)}.
$$

Simplify the exponent:

$$
e^{At}e^{-At}=e^{A0}.
$$

Since $e^{A0}=I$:

$$
e^{At}e^{-At}=I.
$$

Similarly:

$$
e^{-At}e^{At}=I.
$$

Therefore $e^{At}$ is always invertible, with:

$$
\boxed{
\left(e^{At}\right)^{-1}=e^{-At}
}.
$$

A matrix $A$ may itself be noninvertible, but its exponential is still
invertible.

</details>

<details open>
<summary><strong>When The Exponential Of A Sum Splits</strong></summary>

If two square matrices satisfy:

$$
AB=BA,
$$

then:

$$
\boxed{
e^{(A+B)t}=e^{At}e^{Bt}=e^{Bt}e^{At}
}.
$$

The commutativity condition is essential. It permits the binomial expansion of
$(A+B)^k$ to be collected in the same way as for scalars.

A scalar multiple of the identity commutes with every matrix. This justifies:

$$
e^{(\alpha I+N)t}
=
e^{\alpha t}e^{Nt}.
$$

</details>

<details open>
<summary><strong>Where Noncommutativity First Appears</strong></summary>

Compare the series through order $t^2$.

First:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2}+\cdots
$$

and:

$$
e^{Bt}
=
I+Bt+\frac{B^2t^2}{2}+\cdots.
$$

Multiply while preserving order:

$$
\begin{aligned}
e^{At}e^{Bt}
&=
I+(A+B)t\\
&\quad+
\left(
\frac{A^2}{2}+AB+\frac{B^2}{2}
\right)t^2
+\cdots.
\end{aligned}
$$

Now expand the exponential of the sum:

$$
\begin{aligned}
e^{(A+B)t}
&=
I+(A+B)t+\frac{(A+B)^2t^2}{2}+\cdots\\
&=
I+(A+B)t\\
&\quad+
\left(
\frac{A^2}{2}
+\frac{AB}{2}
+\frac{BA}{2}
+\frac{B^2}{2}
\right)t^2
+\cdots.
\end{aligned}
$$

The quadratic coefficients agree when:

$$
AB=BA.
$$

If $AB\ne BA$, the two series generally differ beginning at order $t^2$.

</details>

<details open>
<summary><strong>A Concrete Noncommuting Pair</strong></summary>

Let:

$$
A=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
0&0\\
1&0
\end{bmatrix}.
$$

Calculate $AB$:

$$
AB=
\begin{bmatrix}
1&0\\
0&0
\end{bmatrix}.
$$

Calculate $BA$:

$$
BA=
\begin{bmatrix}
0&0\\
0&1
\end{bmatrix}.
$$

Therefore:

$$
AB\ne BA.
$$

For this pair, one must not replace $e^{(A+B)t}$ by $e^{At}e^{Bt}$.

</details>

<details open>
<summary><strong>Transpose And Exponential</strong></summary>

Transposition commutes with sums and satisfies:

$$
(A^k)^{\mathsf T}=(A^{\mathsf T})^k.
$$

Transpose the defining series term by term:

$$
\begin{aligned}
\left(e^{At}\right)^{\mathsf T}
&=
\left(
I+At+\frac{A^2t^2}{2!}+\cdots
\right)^{\mathsf T}\\
&=
I+A^{\mathsf T}t
+\frac{(A^{\mathsf T})^2t^2}{2!}
+\cdots.
\end{aligned}
$$

The transposed series is the defining series for $e^{A^{\mathsf T}t}$, so:

$$
\boxed{
\left(e^{At}\right)^{\mathsf T}
=
e^{A^{\mathsf T}t}
}.
$$

</details>

<details open>
<summary><strong>A Reliable Computation Workflow</strong></summary>

### Step 1: Confirm that $A$ is square and constant

This chapter's formulas assume a constant square matrix.

### Step 2: Look for an immediate structure

Check whether $A$ is diagonal, nilpotent, or of the form $\alpha I+N$.

### Step 3: Calculate the characteristic polynomial

Find the eigenvalues and their algebraic multiplicities.

### Step 4: Choose the reduced polynomial

For $n\times n$:

$$
r_t(\lambda)
=
a_0+a_1\lambda+\cdots+a_{n-1}\lambda^{n-1}.
$$

### Step 5: Build the interpolation conditions

For distinct eigenvalues, match values. For a repeated eigenvalue, also match
the required derivatives with respect to $\lambda$.

### Step 6: Solve for every coefficient function

Keep the exponentials such as $e^{\lambda_jt}$ visible during elimination.

### Step 7: Evaluate $r_t(A)$

Replace scalar constants by multiples of $I$ and preserve matrix powers.

### Step 8: Verify the result

Check both conditions together:

$$
E(0)=I,
\qquad
E'(t)=AE(t).
$$

For an IVP, also multiply by the initial vector and check its value at the
specified initial time.

</details>

<details open>
<summary><strong>Common Mistake: Exponentiating Each Entry</strong></summary>

The matrix exponential is defined by matrix powers:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}+\cdots.
$$

Applying the scalar exponential to each entry produces a different operation
unless special structure proves otherwise.

</details>

<details open>
<summary><strong>Common Mistake: Splitting A Sum Without Checking</strong></summary>

The identity:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

requires $AB=BA$. Check the two products explicitly before using it.

</details>

<details open>
<summary><strong>Common Mistake: Forgetting The Identity Term</strong></summary>

The first series term is:

$$
A^0=I.
$$

Therefore $e^{A0}=I$. Starting the series with $At$ gives the wrong initial
value and cannot solve the normalized matrix IVP.

</details>

<details open>
<summary><strong>Common Mistake: Stopping A Series Too Early</strong></summary>

The series stops only when a power of the matrix is exactly zero.

If $N^2\ne0$ but $N^3=0$, then:

$$
e^{Nt}
=
I+Nt+\frac{N^2t^2}{2!}.
$$

Dropping the quadratic term would be incorrect.

</details>

<details open>
<summary><strong>Common Mistake: Differentiating In Time During Interpolation</strong></summary>

Repeated-eigenvalue matching differentiates:

$$
r_t(\lambda)
$$

with respect to $\lambda$, treating $t$ as constant. Differentiating the
coefficient functions with respect to $t$ answers a different question.

</details>

<details open>
<summary><strong>Common Mistake: Ignoring The Initial-Time Shift</strong></summary>

For data at $t=t_0$:

$$
\mathbf{x}(t_0)=\mathbf{c},
$$

the solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

Using $e^{At}\mathbf{c}$ works directly only when $t_0=0$.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

For one fixed matrix:

$$
e^{At}e^{As}=e^{A(t+s)}
$$

and:

$$
\left(e^{At}\right)^{-1}=e^{-At}.
$$

For two matrices:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

is guaranteed when $AB=BA$. A finished computation should satisfy
$E(0)=I$ and $E'=AE$.

</details>

<!-- print-page-break -->

## Block 8: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Build A Truncated Matrix Series

Let:

$$
A=
\begin{bmatrix}
1&-1\\
2&0
\end{bmatrix}.
$$

Calculate $A^2$ and $A^3$. Then write the matrix exponential series through
the term containing $t^3$.

### Problem 2: Exponentiate A Diagonal Matrix

Find $e^{Dt}$ for:

$$
D=
\begin{bmatrix}
-2&0&0\\
0&1&0\\
0&0&0
\end{bmatrix}.
$$

### Problem 3: Exponentiate A Three-By-Three Nilpotent Matrix

Let:

$$
N=
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}.
$$

Calculate the powers needed to find $e^{Nt}$, and then write the exponential
explicitly.

### Problem 4: Use A Scalar-Nilpotent Split

Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
-3&1\\
0&-3
\end{bmatrix}.
$$

### Problem 5: Use Distinct-Eigenvalue Interpolation

Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
1&2\\
2&4
\end{bmatrix}
$$

by reducing the exponential to $a_0(t)I+a_1(t)A$.

### Problem 6: Use A Repeated Eigenvalue

Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
0&1\\
-4&4
\end{bmatrix}.
$$

Show the repeated-eigenvalue value and derivative conditions.

### Problem 7: Use The Even-Odd Power Pattern

Let:

$$
K=
\begin{bmatrix}
0&-3\\
3&0
\end{bmatrix}.
$$

Find $e^{Kt}$ by calculating $K^2$ and separating the even and odd series
terms.

### Problem 8: Verify A Proposed Exponential

Verify that:

$$
E(t)=
e^{-2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
$$

is $e^{At}$ for:

$$
A=
\begin{bmatrix}
-2&1\\
0&-2
\end{bmatrix}.
$$

Check both $E(0)=I$ and $E'=AE$.

### Problem 9: Solve An IVP With A Nonzero Initial Time

Solve:

$$
\mathbf{x}'=
\begin{bmatrix}
-3&1\\
0&-3
\end{bmatrix}
\mathbf{x},
\qquad
\mathbf{x}(1)=
\begin{bmatrix}
2\\
-1
\end{bmatrix}.
$$

### Problem 10: Check The Semigroup And Inverse Laws

For:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix},
$$

use the explicit formula for $e^{Nt}$ to verify:

$$
e^{Nt}e^{Ns}=e^{N(t+s)}
$$

and:

$$
\left(e^{Nt}\right)^{-1}=e^{-Nt}.
$$

### Problem 11: Split A Commuting Sum

Let:

$$
A=2I,
\qquad
B=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

Verify $AB=BA$, and use the commuting-sum law to find $e^{(A+B)t}$.

### Problem 12: Diagnose Four Exponential Errors

Correct each statement.

1. For every matrix $A=[a_{ij}]$, the entries of $e^{At}$ are $e^{a_{ij}t}$.
2. For all square matrices $A$ and $B$,
   $e^{(A+B)t}=e^{At}e^{Bt}$.
3. At a repeated eigenvalue, the required extra condition is obtained by
   differentiating $r_t(\lambda)$ with respect to $t$.
4. If $\mathbf{x}(2)=\mathbf{c}$ for $\mathbf{x}'=A\mathbf{x}$, then
   $\mathbf{x}(t)=e^{At}\mathbf{c}$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

The matrix exponential begins:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots.
$$

First calculate $A^2=AA$:

$$
\begin{aligned}
A^2
&=
\begin{bmatrix}
1&-1\\
2&0
\end{bmatrix}
\begin{bmatrix}
1&-1\\
2&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1(1)+(-1)(2)&1(-1)+(-1)(0)\\
2(1)+0(2)&2(-1)+0(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
-1&-1\\
2&-2
\end{bmatrix}.
\end{aligned}
$$

Now calculate $A^3=A^2A$:

$$
\begin{aligned}
A^3
&=
\begin{bmatrix}
-1&-1\\
2&-2
\end{bmatrix}
\begin{bmatrix}
1&-1\\
2&0
\end{bmatrix}\\
&=
\begin{bmatrix}
-1(1)+(-1)(2)&-1(-1)+(-1)(0)\\
2(1)+(-2)(2)&2(-1)+(-2)(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
-3&1\\
-2&-2
\end{bmatrix}.
\end{aligned}
$$

Substitute the powers into the series through $t^3$:

$$
\begin{aligned}
e^{At}
={}&
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
+t
\begin{bmatrix}
1&-1\\
2&0
\end{bmatrix}\\
&+
\frac{t^2}{2}
\begin{bmatrix}
-1&-1\\
2&-2
\end{bmatrix}
+
\frac{t^3}{6}
\begin{bmatrix}
-3&1\\
-2&-2
\end{bmatrix}
+O(t^4).
\end{aligned}
$$

Adding $I$, $At$, $A^2t^2/2!$, and $A^3t^3/3!$ entry by entry gives:

$$
\boxed{
e^{At}
=
\begin{bmatrix}
1+t-\dfrac{t^2}{2}-\dfrac{t^3}{2}
&
-t-\dfrac{t^2}{2}+\dfrac{t^3}{6}\\[6pt]
2t+t^2-\dfrac{t^3}{3}
&
1-t^2-\dfrac{t^3}{3}
\end{bmatrix}
+O(t^4)
}.
$$

This is a truncated series, not yet the exact closed form.

### Answer 2

For a diagonal matrix:

$$
D=
\operatorname{diag}(d_1,d_2,d_3),
$$

the exponential is:

$$
e^{Dt}
=
\operatorname{diag}(e^{d_1t},e^{d_2t},e^{d_3t}).
$$

Here the diagonal entries are $-2$, $1$, and $0$. Therefore:

$$
e^{Dt}
=
\begin{bmatrix}
e^{-2t}&0&0\\
0&e^t&0\\
0&0&e^{0t}
\end{bmatrix}.
$$

Since $e^{0t}=1$:

$$
\boxed{
e^{Dt}
=
\begin{bmatrix}
e^{-2t}&0&0\\
0&e^t&0\\
0&0&1
\end{bmatrix}
}.
$$

### Answer 3

Start with:

$$
N=
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}.
$$

Calculate $N^2=NN$:

$$
\begin{aligned}
N^2
&=
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
0&0&2\\
0&0&0\\
0&0&0
\end{bmatrix}.
\end{aligned}
$$

Multiply once more:

$$
\begin{aligned}
N^3
&=
N^2N\\
&=
\begin{bmatrix}
0&0&2\\
0&0&0\\
0&0&0
\end{bmatrix}
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}\\
&=
0.
\end{aligned}
$$

Since $N^3=0$, the exponential stops after the $N^2$ term:

$$
e^{Nt}
=
I+Nt+\frac{N^2t^2}{2}.
$$

Since $N^3=0$, write each surviving term:

$$
I=
\begin{bmatrix}
1&0&0\\
0&1&0\\
0&0&1
\end{bmatrix},
$$

$$
Nt=
\begin{bmatrix}
0&t&0\\
0&0&2t\\
0&0&0
\end{bmatrix},
$$

and:

$$
\frac{N^2t^2}{2}
=
\begin{bmatrix}
0&0&t^2\\
0&0&0\\
0&0&0
\end{bmatrix}.
$$

Add corresponding entries:

$$
\boxed{
e^{Nt}
=
\begin{bmatrix}
1&t&t^2\\
0&1&2t\\
0&0&1
\end{bmatrix}
}.
$$

### Answer 4

Separate $A$ into a scalar part and a nilpotent part:

$$
A=-3I+N,
$$

where:

$$
N=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

The nilpotent part is:

$$
N=\begin{bmatrix}0&1\\0&0\end{bmatrix}.
$$

Calculate:

$$
N^2=0.
$$

Therefore:

$$
e^{Nt}=I+Nt.
$$

Substitute $I$ and $N$:

$$
\begin{aligned}
e^{Nt}
&=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
+t
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
\end{aligned}
$$

Because $-3I$ commutes with $N$:

$$
e^{At}=e^{-3t}e^{Nt}.
$$

Hence:

$$
\boxed{
e^{At}
=
e^{-3t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
}.
$$

</details>
<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

For:

$$
A=
\begin{bmatrix}
1&2\\
2&4
\end{bmatrix},
$$

construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-1&-2\\
-2&\lambda-4
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
(\lambda-1)(\lambda-4)-(-2)(-2)\\
&=
(\lambda-1)(\lambda-4)-4.
\end{aligned}
$$

Expand:

$$
\begin{aligned}
p_A(\lambda)
&=
\lambda^2-5\lambda+4-4\\
&=
\lambda^2-5\lambda\\
&=
\lambda(\lambda-5).
\end{aligned}
$$

The eigenvalues are:

$$
\lambda_1=0,
\qquad
\lambda_2=5.
$$

Use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

For the eigenvalues $0$ and $5$, first impose the condition at $\lambda=0$:

$$
r_t(0)=e^{0t}=1.
$$

Substitute $\lambda=0$:

$$
a_0=1.
$$

At $\lambda=5$:

$$
r_t(5)=e^{5t}.
$$

Substitute $\lambda=5$:

$$
a_0+5a_1=e^{5t}.
$$

Use $a_0=1$:

$$
1+5a_1=e^{5t}.
$$

Subtract $1$:

$$
5a_1=e^{5t}-1.
$$

Divide by $5$:

$$
a_1=\frac{e^{5t}-1}{5}.
$$

The reduced polynomial evaluated at $A$ is:

$$
e^{At}=I+\frac{e^{5t}-1}{5}A.
$$

Insert $I$ and $A$:

$$
\begin{aligned}
e^{At}
&=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
+
\frac{e^{5t}-1}{5}
\begin{bmatrix}
1&2\\
2&4
\end{bmatrix}\\
&=
\frac15
\begin{bmatrix}
4+e^{5t}&2e^{5t}-2\\
2e^{5t}-2&1+4e^{5t}
\end{bmatrix}.
\end{aligned}
$$

Hence:

$$
\boxed{
e^{At}
=
\frac15
\begin{bmatrix}
4+e^{5t}&2e^{5t}-2\\
2e^{5t}-2&1+4e^{5t}
\end{bmatrix}
}.
$$

### Answer 6

Construct the characteristic polynomial for:

$$
A=
\begin{bmatrix}
0&1\\
-4&4
\end{bmatrix}.
$$

First:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda&-1\\
4&\lambda-4
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
\lambda(\lambda-4)-(-1)(4)\\
&=
\lambda^2-4\lambda+4\\
&=
(\lambda-2)^2.
\end{aligned}
$$

Thus $\lambda=2$ has multiplicity $2$.

For this repeated eigenvalue, use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

The value condition is:

$$
r_t(2)=e^{2t}.
$$

Substitute $\lambda=2$:

$$
a_0+2a_1=e^{2t}.
$$

For the derivative condition, differentiate with respect to $\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1
$$

and:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t}.
$$

Evaluate at $\lambda=2$:

$$
a_1=te^{2t}.
$$

Substitute this into the value equation:

$$
a_0+2te^{2t}=e^{2t}.
$$

The remaining coefficient is:

$$
a_0=e^{2t}(1-2t).
$$

Now evaluate the polynomial at $A$:

$$
\begin{aligned}
e^{At}
&=
a_0I+a_1A\\
&=
e^{2t}(1-2t)I+te^{2t}A\\
&=
e^{2t}\left[(1-2t)I+tA\right].
\end{aligned}
$$

Substitute the matrices:

$$
\begin{aligned}
(1-2t)I+tA
&=
\begin{bmatrix}
1-2t&0\\
0&1-2t
\end{bmatrix}
+
\begin{bmatrix}
0&t\\
-4t&4t
\end{bmatrix}\\
&=
\begin{bmatrix}
1-2t&t\\
-4t&1+2t
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
e^{At}
=
e^{2t}
\begin{bmatrix}
1-2t&t\\
-4t&1+2t
\end{bmatrix}
}.
$$

### Answer 7

Calculate $K^2$:

$$
\begin{aligned}
K^2
&=
\begin{bmatrix}
0&-3\\
3&0
\end{bmatrix}
\begin{bmatrix}
0&-3\\
3&0
\end{bmatrix}\\
&=
\begin{bmatrix}
-9&0\\
0&-9
\end{bmatrix}\\
&=-9I.
\end{aligned}
$$

From $K^2=-9I$, the resulting even-odd power pattern is:

$$
K^{2m}=(-9)^mI
$$

and:

$$
K^{2m+1}=(-9)^mK.
$$

The even terms in the exponential series give:

$$
\begin{aligned}
\sum_{m=0}^{\infty}
\frac{K^{2m}t^{2m}}{(2m)!}
&=
I
\sum_{m=0}^{\infty}
\frac{(-1)^m(3t)^{2m}}{(2m)!}\\
&=
I\cos(3t).
\end{aligned}
$$

The odd terms give:

$$
\begin{aligned}
\sum_{m=0}^{\infty}
\frac{K^{2m+1}t^{2m+1}}{(2m+1)!}
&=
\frac{K}{3}
\sum_{m=0}^{\infty}
\frac{(-1)^m(3t)^{2m+1}}{(2m+1)!}\\
&=
\frac{K}{3}\sin(3t).
\end{aligned}
$$

Therefore:

$$
e^{Kt}
=
I\cos(3t)+\frac{K}{3}\sin(3t).
$$

Since:

$$
\frac{K}{3}
=
\begin{bmatrix}
0&-1\\
1&0
\end{bmatrix},
$$

Combining the even and odd sums, the exponential is:

$$
\boxed{
e^{Kt}
=
\begin{bmatrix}
\cos(3t)&-\sin(3t)\\
\sin(3t)&\cos(3t)
\end{bmatrix}
}.
$$

### Answer 8

The proposed matrix is:

$$
E(t)=
e^{-2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

First set $t=0$:

$$
\begin{aligned}
E(0)
&=
e^0
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}\\
&=I.
\end{aligned}
$$

Now differentiate. Let:

$$
M(t)=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

Then:

$$
M'(t)=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

Use the product rule:

$$
\begin{aligned}
E'(t)
&=
-2e^{-2t}M(t)+e^{-2t}M'(t)\\
&=
e^{-2t}\left[-2M(t)+M'(t)\right].
\end{aligned}
$$

For the proposed $E(t)=e^{-2t}M(t)$, calculate the product-rule bracket:

$$
\begin{aligned}
-2M+M'
&=
-2
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
+
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
-2&1-2t\\
0&-2
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
E'(t)
=
e^{-2t}
\begin{bmatrix}
-2&1-2t\\
0&-2
\end{bmatrix}.
$$

Now calculate $AE(t)$:

$$
\begin{aligned}
AE(t)
&=
\begin{bmatrix}
-2&1\\
0&-2
\end{bmatrix}
e^{-2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}\\
&=
e^{-2t}
\begin{bmatrix}
-2&1-2t\\
0&-2
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
E'(t)=AE(t).
$$

Together, $E(0)=I$ and $E'=AE$ verify:

$$
\boxed{E(t)=e^{At}}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

For:

$$
A=
\begin{bmatrix}
-3&1\\
0&-3
\end{bmatrix},
$$

write:

$$
A=-3I+N,
\qquad
N=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

Since $N^2=0$:

$$
e^{N\tau}
=
I+N\tau
=
\begin{bmatrix}
1&\tau\\
0&1
\end{bmatrix}.
$$

Therefore, for any time interval $\tau$:

$$
e^{A\tau}
=
e^{-3\tau}
\begin{bmatrix}
1&\tau\\
0&1
\end{bmatrix}.
$$

The initial time is $t_0=1$, so use:

$$
\tau=t-1.
$$

The IVP solution is:

$$
\mathbf{x}(t)=e^{A(t-1)}\mathbf{x}(1).
$$

Substitute the exponential and initial vector:

$$
\begin{aligned}
\mathbf{x}(t)
&=
e^{-3(t-1)}
\begin{bmatrix}
1&t-1\\
0&1
\end{bmatrix}
\begin{bmatrix}
2\\
-1
\end{bmatrix}\\
&=
e^{-3(t-1)}
\begin{bmatrix}
2-(t-1)\\
-1
\end{bmatrix}\\
&=
e^{-3(t-1)}
\begin{bmatrix}
3-t\\
-1
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
\mathbf{x}(t)
=
e^{-3(t-1)}
\begin{bmatrix}
3-t\\
-1
\end{bmatrix}
}.
$$

Check the initial time:

$$
\begin{aligned}
\mathbf{x}(1)
&=
e^0
\begin{bmatrix}
2\\
-1
\end{bmatrix}\\
&=
\begin{bmatrix}
2\\
-1
\end{bmatrix}.
\end{aligned}
$$

### Answer 10

For:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix},
$$

we have $N^2=0$. Therefore:

$$
e^{Nt}
=
I+Nt
=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}.
$$

The same nilpotent formula evaluated at time $s$ gives:

$$
e^{Ns}
=
\begin{bmatrix}
1&2s\\
0&1
\end{bmatrix}.
$$

Multiply:

$$
\begin{aligned}
e^{Nt}e^{Ns}
&=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
\begin{bmatrix}
1&2s\\
0&1
\end{bmatrix}\\
&=
\begin{bmatrix}
1&2s+2t\\
0&1
\end{bmatrix}\\
&=
\begin{bmatrix}
1&2(t+s)\\
0&1
\end{bmatrix}.
\end{aligned}
$$

But:

$$
e^{N(t+s)}
=
\begin{bmatrix}
1&2(t+s)\\
0&1
\end{bmatrix}.
$$

Hence:

$$
\boxed{e^{Nt}e^{Ns}=e^{N(t+s)}}.
$$

For the inverse, replace $t$ by $-t$:

$$
e^{-Nt}
=
\begin{bmatrix}
1&-2t\\
0&1
\end{bmatrix}.
$$

To verify the inverse relation, multiply:

$$
\begin{aligned}
e^{Nt}e^{-Nt}
&=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}
\begin{bmatrix}
1&-2t\\
0&1
\end{bmatrix}\\
&=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}\\
&=I.
\end{aligned}
$$

Therefore:

$$
\boxed{
\left(e^{Nt}\right)^{-1}=e^{-Nt}
}.
$$

### Answer 11

The matrices are:

$$
A=
\begin{bmatrix}
2&0\\
0&2
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

Calculate $AB$:

$$
\begin{aligned}
AB
&=
\begin{bmatrix}
2&0\\
0&2
\end{bmatrix}
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}\\
&=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}.
\end{aligned}
$$

Calculate $BA$:

$$
\begin{aligned}
BA
&=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}
\begin{bmatrix}
2&0\\
0&2
\end{bmatrix}\\
&=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}.
\end{aligned}
$$

The two calculated products are equal:

$$
AB=BA.
$$

The commuting-sum law applies:

$$
e^{(A+B)t}=e^{At}e^{Bt}.
$$

Since $A=2I$:

$$
e^{At}=e^{2t}I.
$$

Also $B^2=0$, so:

$$
e^{Bt}=I+Bt
=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

Multiply:

$$
\begin{aligned}
e^{(A+B)t}
&=
e^{2t}I
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}\\
&=
e^{2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
e^{(A+B)t}
=
e^{2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
}.
$$

### Answer 12

#### Statement 1

The matrix exponential is not generally calculated entry by entry. Its
definition is:

$$
\boxed{
e^{At}
=
I+At+\frac{A^2t^2}{2!}+\cdots
}.
$$

The powers are matrix products. Entrywise exponentiation is valid only when a
special structure, such as a diagonal matrix, justifies it.

#### Statement 2

The splitting law requires commutativity.

The corrected statement is:

$$
\boxed{
AB=BA
\quad\Longrightarrow\quad
e^{(A+B)t}=e^{At}e^{Bt}
}.
$$

Without $AB=BA$, the products $AB$ and $BA$ appear differently in the
quadratic series terms.

#### Statement 3

At a repeated eigenvalue, the interpolation variable is $\lambda$. Hold $t$
fixed and differentiate with respect to $\lambda$:

$$
\boxed{
\frac{\partial^q r_t}{\partial\lambda^q}(\lambda_0)
=
\frac{\partial^q}{\partial\lambda^q}
e^{\lambda t}\bigg|_{\lambda=\lambda_0}
}.
$$

Differentiating with respect to $t$ does not provide the required matching
condition.

#### Statement 4

The initial time is $t_0=2$. The time interval in the matrix exponential must
therefore be $t-2$.

The corrected solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-2)}\mathbf{c}
}.
$$

Indeed, setting $t=2$ gives:

$$
\mathbf{x}(2)=e^{A0}\mathbf{c}=I\mathbf{c}=\mathbf{c}.
$$

</details>

<details open>
<summary><strong>Chapter 16 Final Summary</strong></summary>

For a constant square matrix $A$:

$$
\boxed{
e^{At}
=
\sum_{k=0}^{\infty}\frac{A^kt^k}{k!}
}.
$$

It satisfies:

$$
\boxed{
e^{A0}=I,
\qquad
\frac{d}{dt}e^{At}=Ae^{At}=e^{At}A
}.
$$

Therefore the constant-coefficient IVP:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(t_0)=\mathbf{c}
$$

has the solution:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

Easy structures should be checked first:

- diagonal matrices exponentiate along the diagonal
- if $N^r=0$, the series for $e^{Nt}$ stops after $N^{r-1}$
- if $A=\alpha I+N$, then $e^{At}=e^{\alpha t}e^{Nt}$

Cayley-Hamilton reduces the exponential to:

$$
e^{At}
=
a_0(t)I+a_1(t)A+\cdots+a_{n-1}(t)A^{n-1}.
$$

For distinct eigenvalues, match:

$$
r_t(\lambda_j)=e^{\lambda_jt}.
$$

For an eigenvalue of multiplicity $m$, also match derivatives with respect to
$\lambda$ through order $m-1$.

Complex eigenvalues can produce real sine-cosine matrices. If
$K^2=-\beta^2I$, then:

$$
e^{Kt}
=
I\cos(\beta t)+\frac{K}{\beta}\sin(\beta t).
$$

The core exponential laws are:

$$
e^{At}e^{As}=e^{A(t+s)},
\qquad
\left(e^{At}\right)^{-1}=e^{-At}.
$$

For two different matrices, the split:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

is guaranteed when $AB=BA$.

The chapter's central lesson is:

> treat $e^{At}$ as a matrix function built from matrix powers: exploit
> structure first, preserve factor order, match repeated eigenvalues in
> $\lambda$, and verify every final formula with $E(0)=I$ and $E'=AE$.

</details>
