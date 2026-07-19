```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 16}}
\fancyhead[R]{\sffamily\small\color{BodyInk}The Matrix Exponential}
```
# Chapter 16 - The Matrix Exponential

```{=latex}
\Needspace{10\baselineskip}
```
Chapter 15 introduced matrix multiplication, powers, eigenvalues, and the
Cayley-Hamilton theorem. This chapter combines those ideas to define and
compute the matrix exponential:

$$
e^{At}.
$$

The notation resembles an ordinary exponential, but the exponent contains a
matrix. That makes factor order and matrix powers essential.

The main questions are:

-   what does $e^{At}$ mean?
-   why does its defining series converge?
-   why is $\dfrac{d}{dt}e^{At}=Ae^{At}$?
-   how does $e^{At}$ solve $\mathbf{x}'=A\mathbf{x}$?
-   when does the infinite series stop after finitely many terms?
-   how does Cayley-Hamilton reduce the exponential to a matrix polynomial?
-   what changes when eigenvalues repeat?
-   how do complex eigenvalues produce real sine and cosine entries?
-   which familiar exponential laws remain valid for matrices?

```{=latex}
\Needspace{20\baselineskip}
```
## Defining An Exponential Of A Matrix {#block-1-defining-an-exponential-of-a-matrix}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to give $e^{At}$ a precise meaning and to connect its notation to
the familiar scalar exponential series.

```{=latex}
\Needspace{12\baselineskip}
```
### Recall The Scalar Series {#recall-the-scalar-series-2}

```{=latex}
\Needspace{10\baselineskip}
```
For a scalar $z$:

$$
e^z
=
1+z+\frac{z^2}{2!}+\frac{z^3}{3!}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $z=at$:

$$
e^{at}
=
1+at+\frac{a^2t^2}{2!}+\frac{a^3t^3}{3!}+\cdots.
$$

The matrix exponential uses the same coefficient pattern, but scalar powers
$a^k$ are replaced by matrix powers $A^k$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Definition {#the-definition-3}

```{=latex}
\Needspace{10\baselineskip}
```
Let $A$ be a constant $n\times n$ matrix. Define:

$$
\boxed{
e^{At}
=
\sum_{k=0}^{\infty}\frac{A^kt^k}{k!}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Writing the first terms:

$$
\boxed{
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The term for $k=0$ is:

$$
\frac{A^0t^0}{0!}=I,
$$

```{=latex}
\Needspace{10\baselineskip}
```
because:

$$
A^0=I,
\qquad
t^0=1,
\qquad
0!=1.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Matrix Must Be Square {#why-the-matrix-must-be-square-4}

```{=latex}
\Needspace{10\baselineskip}
```
The series contains:

$$
A^2,\quad A^3,\quad A^4,\quad\ldots
$$

These ordinary matrix powers require the product $AA$ to be defined and to
have the same dimensions as $A$. That happens when $A$ is square.

Every term in the series is then $n\times n$, so the terms can be added.

```{=latex}
\Needspace{12\baselineskip}
```
### Convergence Without Hidden Mystery {#convergence-without-hidden-mystery-5}

```{=latex}
\Needspace{10\baselineskip}
```
Choose any standard matrix norm $\lVert\cdot\rVert$ satisfying:

$$
\lVert AB\rVert\leq\lVert A\rVert\lVert B\rVert.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\left\lVert\frac{A^kt^k}{k!}\right\rVert
\leq
\frac{\lVert A\rVert^k|t|^k}{k!}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The scalar comparison series is:

$$
\sum_{k=0}^{\infty}
\frac{(\lVert A\rVert|t|)^k}{k!}
=
e^{\lVert A\rVert|t|},
$$

which converges for every finite $t$.

Therefore the matrix series also converges for every finite $t$.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> the factorial in the denominator grows quickly enough to control the matrix
> powers, just as it controls powers in the ordinary exponential series.

```{=latex}
\Needspace{12\baselineskip}
```
### Two Immediate Values {#two-immediate-values-6}

```{=latex}
\Needspace{10\baselineskip}
```
Set $t=0$ in the series:

$$
\begin{aligned}
e^{A0}
&=
I+A(0)+\frac{A^2(0)^2}{2!}+\cdots\\
&=I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{e^{A0}=I}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $A=0$, then every positive power of $A$ is zero:

$$
0^k=0
\qquad
\text{for }k\geq1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because every positive-power term vanishes, the zero-matrix exponential is:

$$
\boxed{e^{0t}=I}.
$$

The matrix identity $I$, not the scalar $1$, is the constant term.

```{=latex}
\Needspace{12\baselineskip}
```
### Not An Entrywise Exponential {#not-an-entrywise-exponential-7}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-8}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## Why The Matrix Exponential Solves A System {#block-2-why-the-matrix-exponential-solves-a-system}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-9}

The goal is to prove the derivative identity for $e^{At}$ and use it to solve
a constant-coefficient matrix differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Differentiate The Series Term By Term {#differentiate-the-series-term-by-term-10}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{\frac{d}{dt}e^{At}=Ae^{At}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Matrix Can Also Appear On The Right {#why-the-matrix-can-also-appear-on-the-right-11}

```{=latex}
\Needspace{10\baselineskip}
```
Every term in $e^{At}$ is a scalar multiple of a power of $A$. Powers of the
same matrix commute:

$$
AA^k=A^{k+1}=A^kA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
Ae^{At}=e^{At}A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivative may also be written:

$$
\boxed{\frac{d}{dt}e^{At}=e^{At}A}.
$$

This does not mean that $A$ commutes with every matrix. It commutes here
because $e^{At}$ is built entirely from powers of $A$.

```{=latex}
\Needspace{12\baselineskip}
```
### Solving The Initial-Value Problem {#solving-the-initial-value-problem-12}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\mathbf{x}'(t)=A\mathbf{x}(t),
\qquad
\mathbf{x}(t_0)=\mathbf{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Propose:

$$
\boxed{
\mathbf{x}(t)
=
e^{A(t-t_0)}\mathbf{c}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Columns Are Individual Solutions {#the-columns-are-individual-solutions-13}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\frac{d}{dt}e^{At}=Ae^{At},
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $(e^{At})'=Ae^{At}$, equality of corresponding columns gives:

$$
\mathbf{x}_j'(t)=A\mathbf{x}_j(t)
$$

for each $j$.

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
e^{A0}=I.
$$

Therefore the $j$th column starts from the $j$th standard basis vector.

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> one matrix $e^{At}$ packages a complete set of specially normalized
> solutions of the system.

```{=latex}
\Needspace{12\baselineskip}
```
### A Diagonal System Example {#a-diagonal-system-example-14}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
D=
\begin{bmatrix}
2&0\\
0&-3
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For $D=\operatorname{diag}(2,-3)$, the powers remain diagonal:

$$
D^k=
\begin{bmatrix}
2^k&0\\
0&(-3)^k
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
e^{A0}=I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## Diagonal And Nilpotent Shortcuts {#block-3-diagonal-and-nilpotent-shortcuts}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to recognize matrices for which the exponential can be read from
the series without solving an interpolation problem.

```{=latex}
\Needspace{12\baselineskip}
```
### Diagonal Matrices {#diagonal-matrices-17}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Nilpotent Matrices {#nilpotent-matrices-18}

A matrix $N$ is **nilpotent** if some positive power equals zero.

```{=latex}
\Needspace{10\baselineskip}
```
The defining condition is:

$$
N^r=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Once $N^r=0$, every higher power also vanishes:

$$
N^{r+1}=N^rN=0,
\qquad
N^{r+2}=0,
\quad\ldots
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Nilpotent Example {#a-nilpotent-example-19}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since $N^2=0$, every term from the quadratic term onward vanishes:

$$
\begin{aligned}
e^{Nt}
&=
I+Nt+\frac{N^2t^2}{2!}+\cdots\\
&=I+Nt.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Scalar Shift Of A Nilpotent Matrix {#a-scalar-shift-of-a-nilpotent-matrix-20}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
A=
\begin{bmatrix}
4&2\\
0&4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the scalar part:

$$
A=4I+N,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix}
$$

and $N^2=0$.

```{=latex}
\Needspace{10\baselineskip}
```
The matrices $4I$ and $N$ commute. For commuting matrices, the exponential of
a sum splits into a product:

$$
e^{(4I+N)t}=e^{4It}e^{Nt}.
$$

This exponential law will be justified in Block 7.

```{=latex}
\Needspace{10\baselineskip}
```
For the commuting split $A=4I+N$, the two exponential factors are:

$$
e^{4It}=e^{4t}I
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
e^{Nt}=
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Shifted Formula {#verify-the-shifted-formula-21}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
E(t)=
e^{4t}
\begin{bmatrix}
1&2t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Recall the candidate:

$$
E(t)=e^{4t}\begin{bmatrix}1&2t\\0&1\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The derivative and matrix product agree:

$$
E'(t)=AE(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
E(0)=I.
$$

These two checks confirm that $E(t)=e^{At}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-22}

For a diagonal matrix, exponentiate the diagonal entries. For a nilpotent
matrix $N$ with $N^r=0$, the defining series stops after the term containing
$N^{r-1}$.

```{=latex}
\Needspace{10\baselineskip}
```
When a matrix has the scalar-plus-nilpotent form:

$$
A=\alpha I+N,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $\alpha I$ commutes with $N$, a matrix $A=\alpha I+N$ satisfies:

$$
\boxed{e^{At}=e^{\alpha t}e^{Nt}},
$$

This turns the matrix calculation into a scalar exponential multiplied by a
finite nilpotent exponential.

```{=latex}
\Needspace{20\baselineskip}
```
## Cayley-Hamilton With Distinct Eigenvalues {#block-4-cayley-hamilton-with-distinct-eigenvalues}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-23}

The goal is to replace the infinite series for $e^{At}$ with a finite
polynomial in $A$ and calculate its coefficients from distinct eigenvalues.

```{=latex}
\Needspace{12\baselineskip}
```
### Why A Finite Polynomial Is Possible {#why-a-finite-polynomial-is-possible-24}

```{=latex}
\Needspace{10\baselineskip}
```
Let $A$ be $n\times n$, with characteristic polynomial:

$$
p_A(\lambda)
=
\lambda^n+c_{n-1}\lambda^{n-1}+\cdots+c_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cayley-Hamilton gives:

$$
p_A(A)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $A^n$ can be written using lower powers:

$$
A^n
=
-c_{n-1}A^{n-1}-\cdots-c_0I.
$$

Multiplying this identity by further powers of $A$ reduces
$A^{n+1},A^{n+2},\ldots$ as well.

```{=latex}
\Needspace{10\baselineskip}
```
Consequently, the matrix exponential can be written in the form:

$$
\boxed{
e^{At}
=
a_0(t)I+a_1(t)A+\cdots+a_{n-1}(t)A^{n-1}
}.
$$

The functions $a_0,\ldots,a_{n-1}$ depend on $t$ and on the matrix $A$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Interpolating Polynomial {#the-interpolating-polynomial-25}

```{=latex}
\Needspace{10\baselineskip}
```
Introduce the scalar polynomial:

$$
r_t(\lambda)
=
a_0(t)+a_1(t)\lambda+\cdots+a_{n-1}(t)\lambda^{n-1}.
$$

The subscript $t$ reminds us that $t$ is held fixed while $\lambda$ is the
polynomial variable.

```{=latex}
\Needspace{10\baselineskip}
```
For every distinct eigenvalue $\lambda_j$ of $A$, require:

$$
\boxed{
r_t(\lambda_j)=e^{\lambda_jt}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Once the scalar coefficient functions have been found, replace $\lambda$ by
$A$:

$$
e^{At}=r_t(A).
$$

This separates the calculation into two stages:

1.  solve a scalar interpolation problem;
2.  evaluate the resulting polynomial at the matrix.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Distinct-Eigenvalue Example {#a-complete-distinct-eigenvalue-example-26}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
2&1\\
3&4
\end{bmatrix}.
$$

We will find $e^{At}$ without finding eigenvectors.

```{=latex}
\Needspace{10\baselineskip}
```
For the matrix:

$$
A=\begin{bmatrix}2&1\\3&4\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-2&-1\\
-3&\lambda-4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
p_A(\lambda)
=
(\lambda-1)(\lambda-5).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the two distinct eigenvalues are:

$$
\boxed{\lambda_1=1,\qquad\lambda_2=5}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Coefficient Equations {#build-the-coefficient-equations-27}

```{=latex}
\Needspace{10\baselineskip}
```
Because $A$ is $2\times2$, use a polynomial of degree at most $1$:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

The coefficient functions depend on $t$, but the shorter notation
$a_0,a_1$ will be used inside this calculation.

```{=latex}
\Needspace{10\baselineskip}
```
For the distinct eigenvalues $1$ and $5$, begin at $\lambda_1=1$ and impose:

$$
r_t(1)=e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=1$ into $a_0+a_1\lambda$:

$$
a_0+a_1=e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $\lambda_2=5$, impose:

$$
r_t(5)=e^{5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=5$:

$$
a_0+5a_1=e^{5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the coefficient system is:

$$
\begin{aligned}
a_0+a_1&=e^t,\\
a_0+5a_1&=e^{5t}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Coefficient System {#solve-the-coefficient-system-28}

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the first equation from the second:

$$
(a_0+5a_1)-(a_0+a_1)=e^{5t}-e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The $a_0$ terms cancel:

$$
4a_1=e^{5t}-e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $4a_1=e^{5t}-e^t$, divide by $4$:

$$
\boxed{
a_1=\frac{e^{5t}-e^t}{4}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
a_0+a_1=e^t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $a_1$:

$$
a_0=e^t-a_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
a_0=\frac{5e^t-e^{5t}}{4}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Evaluate The Polynomial At The Matrix {#evaluate-the-polynomial-at-the-matrix-29}

```{=latex}
\Needspace{10\baselineskip}
```
The reduced exponential is:

$$
e^{At}=a_0I+a_1A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The row $1$, column $2$ entry is:

$$
a_1=\frac{e^{5t}-e^t}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The row $2$, column $1$ entry is:

$$
3a_1=\frac{3e^{5t}-3e^t}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Use The Result In An Initial-Value Problem {#use-the-result-in-an-initial-value-problem-30}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
A=
\begin{bmatrix}
2&1\\
3&4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the matrix-exponential solution formula:

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-31}

Cayley-Hamilton reduces $e^{At}$ to a polynomial of degree at most $n-1$ in an
$n\times n$ matrix.

```{=latex}
\Needspace{10\baselineskip}
```
For distinct eigenvalues, build:

$$
r_t(\lambda)
=
a_0+a_1\lambda+\cdots+a_{n-1}\lambda^{n-1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For each distinct eigenvalue $\lambda_j$, impose:

$$
r_t(\lambda_j)=e^{\lambda_jt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the scalar coefficient functions, then calculate:

$$
\boxed{e^{At}=r_t(A)}.
$$

```{=latex}
\Needspace{20\baselineskip}
```
## Repeated Eigenvalues And Derivative Conditions {#block-5-repeated-eigenvalues-and-derivative-conditions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-32}

The goal is to explain why a repeated eigenvalue supplies more than one
coefficient equation and to keep the differentiation variable explicit.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Repeating The Same Value Is Not Enough {#why-repeating-the-same-value-is-not-enough-33}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a $2\times2$ matrix has only one eigenvalue $\lambda_0$, repeated
twice. The reduced polynomial is:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The value condition:

$$
r_t(\lambda_0)=e^{\lambda_0t}
$$

provides only one equation for two unknown coefficient functions.

Writing that same equation twice adds no information. A second, independent
condition is needed.

```{=latex}
\Needspace{12\baselineskip}
```
### The Derivative-Matching Rule {#the-derivative-matching-rule-34}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the exponential:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t},
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating once more gives:

$$
\frac{\partial^2}{\partial\lambda^2}e^{\lambda t}
=
t^2e^{\lambda t}.
$$

A repeated eigenvalue of multiplicity $2$ requires value and first-derivative
matching. Multiplicity $3$ requires value, first derivative, and second
derivative.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Repeated-Eigenvalue Example {#a-complete-repeated-eigenvalue-example-35}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
3&1\\
-1&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-3&-1\\
1&\lambda-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Build Both Coefficient Conditions {#build-both-coefficient-conditions-36}

```{=latex}
\Needspace{10\baselineskip}
```
For a $2\times2$ matrix, use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First match values at $\lambda=2$:

$$
r_t(2)=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=2$:

$$
a_0+2a_1=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now differentiate with respect to $\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the target function with respect to $\lambda$:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\partial r_t/\partial\lambda=a_1$ and
$\partial e^{\lambda t}/\partial\lambda=te^{\lambda t}$, evaluation at
$\lambda=2$ gives:

$$
a_1=te^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two independent equations are therefore:

$$
\begin{aligned}
a_0+2a_1&=e^{2t},\\
a_1&=te^{2t}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Solve And Evaluate At The Matrix {#solve-and-evaluate-at-the-matrix-37}

```{=latex}
\Needspace{10\baselineskip}
```
The second equation already gives:

$$
a_1=te^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into the first equation:

$$
a_0+2te^{2t}=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^{At}=a_0I+a_1A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Repeated-Eigenvalue Formula {#verify-the-repeated-eigenvalue-formula-38}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate. Let:

$$
M(t)=
\begin{bmatrix}
1+t&t\\
-t&1-t
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
M'(t)=
\begin{bmatrix}
1&1\\
-1&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the product rule:

$$
E'(t)=e^{2t}[2M(t)+M'(t)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Because the differentiated matrix and $AM(t)$ agree:

$$
E'(t)=e^{2t}AM(t)=AE(t).
$$

Together with $E(0)=I$, this verifies the exponential.

```{=latex}
\Needspace{12\baselineskip}
```
### Do Not Differentiate With Respect To The Wrong Variable {#do-not-differentiate-with-respect-to-the-wrong-variable-39}

```{=latex}
\Needspace{10\baselineskip}
```
The interpolation polynomial is:

$$
r_t(\lambda)=a_0(t)+a_1(t)\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When repeated-eigenvalue conditions are formed, differentiate with respect to
$\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating with respect to $t$ would instead give:

$$
\frac{\partial r_t}{\partial t}
=
a_0'(t)+a_1'(t)\lambda,
$$

which is a different expression and does not provide the required Hermite
interpolation condition.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> hold $t$ fixed, differentiate in $\lambda$, and only then substitute the
> repeated eigenvalue.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-40}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## Complex Eigenvalues And Real Rotation Matrices {#block-6-complex-eigenvalues-and-real-rotation-matrices}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-41}

The goal is to see how a real matrix with complex eigenvalues can have a
completely real matrix exponential built from sine and cosine.

```{=latex}
\Needspace{12\baselineskip}
```
### A Matrix Whose Square Is Negative {#a-matrix-whose-square-is-negative-42}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
J=
\begin{bmatrix}
0&-2\\
2&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The identity $J^2=-4I$ plays the same role as:

$$
i^2=-1
$$

in the scalar exponential.

```{=latex}
\Needspace{12\baselineskip}
```
### Separate Even And Odd Powers {#separate-even-and-odd-powers-43}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
e^{Jt}
=
I+Jt+\frac{J^2t^2}{2!}
+\frac{J^3t^3}{3!}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $J^2=-4I$:

$$
J^{2m}=(-4)^mI
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
J^{2m+1}=(-4)^mJ.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Add the even and odd parts:

$$
\boxed{
e^{Jt}
=
I\cos(2t)+\frac{J}{2}\sin(2t)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Write The Real Matrix Explicitly {#write-the-real-matrix-explicitly-44}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
I=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{J}{2}
=
\begin{bmatrix}
0&-1\\
1&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Where The Complex Eigenvalues Appear {#where-the-complex-eigenvalues-appear-45}

```{=latex}
\Needspace{10\baselineskip}
```
Construct:

$$
\lambda I-J
=
\begin{bmatrix}
\lambda&2\\
-2&\lambda
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Set the polynomial equal to zero:

$$
\lambda^2+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\lambda=\pm2i.
$$

The eigenvalues are complex, but the sine and cosine terms combine into a real
matrix exponential because $J$ itself is real.

```{=latex}
\Needspace{12\baselineskip}
```
### Decay Combined With Rotation {#decay-combined-with-rotation-46}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=-I+J
=
\begin{bmatrix}
-1&-2\\
2&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrices $-I$ and $J$ commute, so:

$$
e^{At}
=
e^{-tI}e^{Jt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Initial-Value Example {#a-complete-initial-value-example-47}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
A=
\begin{bmatrix}
-1&-2\\
2&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial vector is:

$$
\mathbf{x}(0)=\begin{bmatrix}3\\0\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\mathbf{x}(t)=e^{At}\mathbf{x}(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A General Two-By-Two Pattern {#a-general-two-by-two-pattern-48}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
A=\alpha I+K
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this pattern, assume also that:

$$
K^2=-\beta^2I,
\qquad
\beta>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $A=\alpha I+K$, the matrix $\alpha I$ commutes with $K$, so:

$$
e^{At}=e^{\alpha t}e^{Kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-49}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{20\baselineskip}
```
## Exponential Laws, Workflow, And Common Mistakes {#block-7-exponential-laws-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-50}

The goal is to identify which scalar exponential laws remain valid, state the
required commutativity condition, and organize the available computation
methods.

```{=latex}
\Needspace{12\baselineskip}
```
### The Same-Matrix Addition Law {#the-same-matrix-addition-law-51}

```{=latex}
\Needspace{10\baselineskip}
```
The matrices $At$ and $As$ commute because both are scalar multiples of $A$.
Therefore:

$$
\boxed{
e^{At}e^{As}=e^{A(t+s)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The order can also be reversed:

$$
e^{As}e^{At}=e^{A(t+s)}.
$$

This is the matrix version of the scalar law $e^{at}e^{as}=e^{a(t+s)}$.

```{=latex}
\Needspace{12\baselineskip}
```
### The Inverse Of A Matrix Exponential {#the-inverse-of-a-matrix-exponential-52}

```{=latex}
\Needspace{10\baselineskip}
```
Set $s=-t$ in the same-matrix addition law:

$$
e^{At}e^{-At}=e^{A(t-t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the exponent:

$$
e^{At}e^{-At}=e^{A0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{A0}=I$:

$$
e^{At}e^{-At}=I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Similarly:

$$
e^{-At}e^{At}=I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $e^{At}$ is always invertible, with:

$$
\boxed{
\left(e^{At}\right)^{-1}=e^{-At}
}.
$$

A matrix $A$ may itself be noninvertible, but its exponential is still
invertible.

```{=latex}
\Needspace{12\baselineskip}
```
### When The Exponential Of A Sum Splits {#when-the-exponential-of-a-sum-splits-53}

```{=latex}
\Needspace{10\baselineskip}
```
If two square matrices satisfy:

$$
AB=BA,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
\boxed{
e^{(A+B)t}=e^{At}e^{Bt}=e^{Bt}e^{At}
}.
$$

The commutativity condition is essential. It permits the binomial expansion of
$(A+B)^k$ to be collected in the same way as for scalars.

```{=latex}
\Needspace{10\baselineskip}
```
A scalar multiple of the identity commutes with every matrix. This justifies:

$$
e^{(\alpha I+N)t}
=
e^{\alpha t}e^{Nt}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Where Noncommutativity First Appears {#where-noncommutativity-first-appears-54}

Compare the series through order $t^2$.

```{=latex}
\Needspace{10\baselineskip}
```
First:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2}+\cdots
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
e^{Bt}
=
I+Bt+\frac{B^2t^2}{2}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The quadratic coefficients agree when:

$$
AB=BA.
$$

If $AB\ne BA$, the two series generally differ beginning at order $t^2$.

```{=latex}
\Needspace{12\baselineskip}
```
### A Concrete Noncommuting Pair {#a-concrete-noncommuting-pair-55}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $AB$:

$$
AB=
\begin{bmatrix}
1&0\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $BA$:

$$
BA=
\begin{bmatrix}
0&0\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
AB\ne BA.
$$

For this pair, one must not replace $e^{(A+B)t}$ by $e^{At}e^{Bt}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Transpose And Exponential {#transpose-and-exponential-56}

```{=latex}
\Needspace{10\baselineskip}
```
Transposition commutes with sums and satisfies:

$$
(A^k)^{\mathsf T}=(A^{\mathsf T})^k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The transposed series is the defining series for $e^{A^{\mathsf T}t}$, so:

$$
\boxed{
\left(e^{At}\right)^{\mathsf T}
=
e^{A^{\mathsf T}t}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Computation Workflow {#a-reliable-computation-workflow-57}

#### Step 1: Confirm that $A$ is square and constant

This chapter's formulas assume a constant square matrix.

#### Step 2: Look for an immediate structure

Check whether $A$ is diagonal, nilpotent, or of the form $\alpha I+N$.

#### Step 3: Calculate the characteristic polynomial

Find the eigenvalues and their algebraic multiplicities.

#### Step 4: Choose the reduced polynomial

```{=latex}
\Needspace{10\baselineskip}
```
For $n\times n$:

$$
r_t(\lambda)
=
a_0+a_1\lambda+\cdots+a_{n-1}\lambda^{n-1}.
$$

#### Step 5: Build the interpolation conditions

For distinct eigenvalues, match values. For a repeated eigenvalue, also match
the required derivatives with respect to $\lambda$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Solve for every coefficient function

Keep the exponentials such as $e^{\lambda_jt}$ visible during elimination.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Evaluate $r_t(A)$

Replace scalar constants by multiples of $I$ and preserve matrix powers.

#### Step 8: Verify the result

```{=latex}
\Needspace{10\baselineskip}
```
Check both conditions together:

$$
E(0)=I,
\qquad
E'(t)=AE(t).
$$

For an IVP, also multiply by the initial vector and check its value at the
specified initial time.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Exponentiating Each Entry {#common-mistake-exponentiating-each-entry-58}

```{=latex}
\Needspace{10\baselineskip}
```
The matrix exponential is defined by matrix powers:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}+\cdots.
$$

Applying the scalar exponential to each entry produces a different operation
unless special structure proves otherwise.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Splitting A Sum Without Checking {#common-mistake-splitting-a-sum-without-checking-59}

```{=latex}
\Needspace{10\baselineskip}
```
The identity:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

requires $AB=BA$. Check the two products explicitly before using it.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting The Identity Term {#common-mistake-forgetting-the-identity-term-60}

```{=latex}
\Needspace{10\baselineskip}
```
The first series term is:

$$
A^0=I.
$$

Therefore $e^{A0}=I$. Starting the series with $At$ gives the wrong initial
value and cannot solve the normalized matrix IVP.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Stopping A Series Too Early {#common-mistake-stopping-a-series-too-early-61}

The series stops only when a power of the matrix is exactly zero.

```{=latex}
\Needspace{10\baselineskip}
```
If $N^2\ne0$ but $N^3=0$, then:

$$
e^{Nt}
=
I+Nt+\frac{N^2t^2}{2!}.
$$

Dropping the quadratic term would be incorrect.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Differentiating In Time During Interpolation {#common-mistake-differentiating-in-time-during-interpolation-62}

```{=latex}
\Needspace{10\baselineskip}
```
Repeated-eigenvalue matching differentiates:

$$
r_t(\lambda)
$$

with respect to $\lambda$, treating $t$ as constant. Differentiating the
coefficient functions with respect to $t$ answers a different question.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Ignoring The Initial-Time Shift {#common-mistake-ignoring-the-initial-time-shift-63}

```{=latex}
\Needspace{10\baselineskip}
```
For data at $t=t_0$:

$$
\mathbf{x}(t_0)=\mathbf{c},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

Using $e^{At}\mathbf{c}$ works directly only when $t_0=0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-64}

```{=latex}
\Needspace{10\baselineskip}
```
For one fixed matrix:

$$
e^{At}e^{As}=e^{A(t+s)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\left(e^{At}\right)^{-1}=e^{-At}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For two matrices:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

is guaranteed when $AB=BA$. A finished computation should satisfy
$E(0)=I$ and $E'=AE$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-65}

#### Problem 1: Build A Truncated Matrix Series

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 2: Exponentiate A Diagonal Matrix

```{=latex}
\Needspace{10\baselineskip}
```
Find $e^{Dt}$ for:

$$
D=
\begin{bmatrix}
-2&0&0\\
0&1&0\\
0&0&0
\end{bmatrix}.
$$

#### Problem 3: Exponentiate A Three-By-Three Nilpotent Matrix

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 4: Use A Scalar-Nilpotent Split

```{=latex}
\Needspace{10\baselineskip}
```
Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
-3&1\\
0&-3
\end{bmatrix}.
$$

#### Problem 5: Use Distinct-Eigenvalue Interpolation

```{=latex}
\Needspace{10\baselineskip}
```
Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
1&2\\
2&4
\end{bmatrix}
$$

by reducing the exponential to $a_0(t)I+a_1(t)A$.

#### Problem 6: Use A Repeated Eigenvalue

```{=latex}
\Needspace{10\baselineskip}
```
Find $e^{At}$ for:

$$
A=
\begin{bmatrix}
0&1\\
-4&4
\end{bmatrix}.
$$

Show the repeated-eigenvalue value and derivative conditions.

#### Problem 7: Use The Even-Odd Power Pattern

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 8: Verify A Proposed Exponential

```{=latex}
\Needspace{10\baselineskip}
```
Verify that:

$$
E(t)=
e^{-2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
is $e^{At}$ for:

$$
A=
\begin{bmatrix}
-2&1\\
0&-2
\end{bmatrix}.
$$

Check both $E(0)=I$ and $E'=AE$.

#### Problem 9: Solve An IVP With A Nonzero Initial Time

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 10: Check The Semigroup And Inverse Laws

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
use the explicit formula for $e^{Nt}$ to verify:

$$
e^{Nt}e^{Ns}=e^{N(t+s)}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\left(e^{Nt}\right)^{-1}=e^{-Nt}.
$$

#### Problem 11: Split A Commuting Sum

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 12: Diagnose Four Exponential Errors

Correct each statement.

1.  For every matrix $A=[a_{ij}]$, the entries of $e^{At}$ are $e^{a_{ij}t}$.
2.  For all square matrices $A$ and $B$,
    $e^{(A+B)t}=e^{At}e^{Bt}$.
3.  At a repeated eigenvalue, the required extra condition is obtained by
    differentiating $r_t(\lambda)$ with respect to $t$.
4.  If $\mathbf{x}(2)=\mathbf{c}$ for $\mathbf{x}'=A\mathbf{x}$, then
    $\mathbf{x}(t)=e^{At}\mathbf{c}$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-66}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The matrix exponential begins:

$$
e^{At}
=
I+At+\frac{A^2t^2}{2!}
+\frac{A^3t^3}{3!}+\cdots.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
For a diagonal matrix:

$$
D=
\operatorname{diag}(d_1,d_2,d_3),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the exponential is:

$$
e^{Dt}
=
\operatorname{diag}(e^{d_1t},e^{d_2t},e^{d_3t}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
N=
\begin{bmatrix}
0&1&0\\
0&0&2\\
0&0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Since $N^3=0$, the exponential stops after the $N^2$ term:

$$
e^{Nt}
=
I+Nt+\frac{N^2t^2}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $N^3=0$, write each surviving term:

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Separate $A$ into a scalar part and a nilpotent part:

$$
A=-3I+N,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
N=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The nilpotent part is:

$$
N=\begin{bmatrix}0&1\\0&0\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
N^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^{Nt}=I+Nt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Because $-3I$ commutes with $N$:

$$
e^{At}=e^{-3t}e^{Nt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-67}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
1&2\\
2&4
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
construct:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-1&-2\\
-2&\lambda-4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The eigenvalues are:

$$
\lambda_1=0,
\qquad
\lambda_2=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the eigenvalues $0$ and $5$, first impose the condition at $\lambda=0$:

$$
r_t(0)=e^{0t}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=0$:

$$
a_0=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $\lambda=5$:

$$
r_t(5)=e^{5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=5$:

$$
a_0+5a_1=e^{5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $a_0=1$:

$$
1+5a_1=e^{5t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
5a_1=e^{5t}-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5$:

$$
a_1=\frac{e^{5t}-1}{5}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The reduced polynomial evaluated at $A$ is:

$$
e^{At}=I+\frac{e^{5t}-1}{5}A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
Construct the characteristic polynomial for:

$$
A=
\begin{bmatrix}
0&1\\
-4&4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda&-1\\
4&\lambda-4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For this repeated eigenvalue, use:

$$
r_t(\lambda)=a_0+a_1\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The value condition is:

$$
r_t(2)=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\lambda=2$:

$$
a_0+2a_1=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the derivative condition, differentiate with respect to $\lambda$:

$$
\frac{\partial r_t}{\partial\lambda}=a_1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{\partial}{\partial\lambda}e^{\lambda t}
=
te^{\lambda t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate at $\lambda=2$:

$$
a_1=te^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into the value equation:

$$
a_0+2te^{2t}=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The remaining coefficient is:

$$
a_0=e^{2t}(1-2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
From $K^2=-9I$, the resulting even-odd power pattern is:

$$
K^{2m}=(-9)^mI
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
K^{2m+1}=(-9)^mK.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
e^{Kt}
=
I\cos(3t)+\frac{K}{3}\sin(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\frac{K}{3}
=
\begin{bmatrix}
0&-1\\
1&0
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
The proposed matrix is:

$$
E(t)=
e^{-2t}
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Now differentiate. Let:

$$
M(t)=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
M'(t)=
\begin{bmatrix}
0&1\\
0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
E'(t)=AE(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Together, $E(0)=I$ and $E'=AE$ verify:

$$
\boxed{E(t)=e^{At}}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-68}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
-3&1\\
0&-3
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The initial time is $t_0=1$, so use:

$$
\tau=t-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The IVP solution is:

$$
\mathbf{x}(t)=e^{A(t-1)}\mathbf{x}(1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
N=
\begin{bmatrix}
0&2\\
0&0
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The same nilpotent formula evaluated at time $s$ gives:

$$
e^{Ns}
=
\begin{bmatrix}
1&2s\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
But:

$$
e^{N(t+s)}
=
\begin{bmatrix}
1&2(t+s)\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{e^{Nt}e^{Ns}=e^{N(t+s)}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the inverse, replace $t$ by $-t$:

$$
e^{-Nt}
=
\begin{bmatrix}
1&-2t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
\left(e^{Nt}\right)^{-1}=e^{-Nt}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The two calculated products are equal:

$$
AB=BA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The commuting-sum law applies:

$$
e^{(A+B)t}=e^{At}e^{Bt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $A=2I$:

$$
e^{At}=e^{2t}I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also $B^2=0$, so:

$$
e^{Bt}=I+Bt
=
\begin{bmatrix}
1&t\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

#### Statement 1

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The corrected solution is:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-2)}\mathbf{c}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Indeed, setting $t=2$ gives:

$$
\mathbf{x}(2)=e^{A0}\mathbf{c}=I\mathbf{c}=\mathbf{c}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 16 Final Summary {#chapter-16-final-summary-69}

```{=latex}
\Needspace{10\baselineskip}
```
For a constant square matrix $A$:

$$
\boxed{
e^{At}
=
\sum_{k=0}^{\infty}\frac{A^kt^k}{k!}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It satisfies:

$$
\boxed{
e^{A0}=I,
\qquad
\frac{d}{dt}e^{At}=Ae^{At}=e^{At}A
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the constant-coefficient IVP:

$$
\mathbf{x}'=A\mathbf{x},
\qquad
\mathbf{x}(t_0)=\mathbf{c}
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the solution:

$$
\boxed{
\mathbf{x}(t)=e^{A(t-t_0)}\mathbf{c}
}.
$$

Easy structures should be checked first:

-   diagonal matrices exponentiate along the diagonal
-   if $N^r=0$, the series for $e^{Nt}$ stops after $N^{r-1}$
-   if $A=\alpha I+N$, then $e^{At}=e^{\alpha t}e^{Nt}$

```{=latex}
\Needspace{10\baselineskip}
```
Cayley-Hamilton reduces the exponential to:

$$
e^{At}
=
a_0(t)I+a_1(t)A+\cdots+a_{n-1}(t)A^{n-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For distinct eigenvalues, match:

$$
r_t(\lambda_j)=e^{\lambda_jt}.
$$

For an eigenvalue of multiplicity $m$, also match derivatives with respect to
$\lambda$ through order $m-1$.

```{=latex}
\Needspace{10\baselineskip}
```
Complex eigenvalues can produce real sine-cosine matrices. If
$K^2=-\beta^2I$, then:

$$
e^{Kt}
=
I\cos(\beta t)+\frac{K}{\beta}\sin(\beta t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The core exponential laws are:

$$
e^{At}e^{As}=e^{A(t+s)},
\qquad
\left(e^{At}\right)^{-1}=e^{-At}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For two different matrices, the split:

$$
e^{(A+B)t}=e^{At}e^{Bt}
$$

is guaranteed when $AB=BA$.

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> treat $e^{At}$ as a matrix function built from matrix powers: exploit
> structure first, preserve factor order, match repeated eigenvalues in
> $\lambda$, and verify every final formula with $E(0)=I$ and $E'=AE$.
