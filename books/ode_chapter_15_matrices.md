# Matrices For Differential Equations

The preceding chapters studied one unknown function at a time. Later chapters
will place several unknown functions into a single vector and write their
differential equations as one matrix equation.

A matrix is more than a rectangular storage box. Its dimensions determine
which operations are legal, and its multiplication rule describes how several
quantities interact.

The main questions are:

- how are rows, columns, entries, and vectors described precisely?
- when can matrices be added or multiplied?
- why is matrix multiplication based on rows and columns?
- why can changing the order of a product change the answer?
- how are powers and the identity matrix defined?
- how are matrices containing functions differentiated and integrated?
- how does a determinant produce a characteristic polynomial?
- what do eigenvalues and eigenvectors say about a matrix?
- how does the Cayley-Hamilton theorem reduce high matrix powers?

---

## Block 1: Reading Matrix Notation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to read a matrix unambiguously. Before performing an operation, the
reader should be able to state the matrix's size and locate any requested
entry.

</details>

<details open>
<summary><strong>Rows, Columns, And Dimensions</strong></summary>

A matrix is a rectangular arrangement of entries. For example:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

Matrix $A$ has:

- two horizontal rows
- three vertical columns

Its dimensions are therefore:

$$
\boxed{2\times3}.
$$

The order matters. A $2\times3$ matrix has two rows and three columns, not
three rows and two columns.

The practical meaning:

> dimensions are the first compatibility check for every matrix operation.

</details>

<details open>
<summary><strong>Entry Notation</strong></summary>

For a matrix $A$, the symbol $a_{ij}$ denotes the entry in:

$$
\text{row }i,\qquad \text{column }j.
$$

Return to:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

The entry in row $1$, column $3$ is:

$$
\boxed{a_{13}=4}.
$$

The entry in row $2$, column $1$ is:

$$
\boxed{a_{21}=0}.
$$

The first index always names the row. The second index always names the
column.

</details>

<details open>
<summary><strong>The General Form</strong></summary>

An $m\times n$ matrix has $m$ rows and $n$ columns:

$$
A=
\begin{bmatrix}
a_{11}&a_{12}&\cdots&a_{1n}\\
a_{21}&a_{22}&\cdots&a_{2n}\\
\vdots&\vdots&\ddots&\vdots\\
a_{m1}&a_{m2}&\cdots&a_{mn}
\end{bmatrix}.
$$

Here:

- $m$ counts rows
- $n$ counts columns
- $a_{ij}$ is the entry in row $i$, column $j$

If $m=n$, the matrix is **square**. A square matrix has the same number of rows
and columns.

</details>

<details open>
<summary><strong>When Two Matrices Are Equal</strong></summary>

Two matrices are equal only when both conditions hold:

1. they have the same dimensions;
2. every pair of corresponding entries is equal.

For example:

$$
\begin{bmatrix}
x+1&4\\
-2&y
\end{bmatrix}
=
\begin{bmatrix}
6&4\\
-2&3
\end{bmatrix}.
$$

Equality of the top-left entries gives:

$$
x+1=6.
$$

Subtract $1$ from both sides:

$$
x=5.
$$

Equality of the bottom-right entries gives:

$$
y=3.
$$

Therefore the matrices are equal when:

$$
\boxed{x=5,\qquad y=3}.
$$

</details>

<details open>
<summary><strong>Column Vectors And Row Vectors</strong></summary>

A matrix with one column is a **column vector**:

$$
\mathbf{x}=
\begin{bmatrix}
x_1\\
x_2\\
x_3
\end{bmatrix}.
$$

Its dimensions are $3\times1$.

A matrix with one row is a **row vector**:

$$
\mathbf{r}=
\begin{bmatrix}
r_1&r_2&r_3
\end{bmatrix}.
$$

Its dimensions are $1\times3$.

These contain the same number of entries, but they do not have the same shape:

$$
3\times1\ne1\times3.
$$

In systems of differential equations, unknowns are usually collected into a
column vector such as:

$$
\mathbf{x}(t)=
\begin{bmatrix}
x_1(t)\\
x_2(t)
\end{bmatrix}.
$$

</details>

<details open>
<summary><strong>Zero, Diagonal, And Identity Matrices</strong></summary>

A **zero matrix** has zero in every position. Its dimensions must still be
specified. For example:

$$
0_{2\times3}=
\begin{bmatrix}
0&0&0\\
0&0&0
\end{bmatrix}.
$$

A **diagonal matrix** is square and has zero away from its main diagonal:

$$
D=
\begin{bmatrix}
4&0&0\\
0&-2&0\\
0&0&7
\end{bmatrix}.
$$

The **identity matrix** has $1$ on the main diagonal and $0$ elsewhere:

$$
I_3=
\begin{bmatrix}
1&0&0\\
0&1&0\\
0&0&1
\end{bmatrix}.
$$

Its role in multiplication is similar to the role of the number $1$ in
ordinary arithmetic. That property will be verified after matrix
multiplication has been defined.

</details>

<details open>
<summary><strong>The Transpose</strong></summary>

The transpose of $A$, written $A^{\mathsf T}$, turns rows into columns.

Start with:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

The first row of $A$ becomes the first column of $A^{\mathsf T}$, and the
second row becomes the second column:

$$
A^{\mathsf T}=
\begin{bmatrix}
2&0\\
-1&3\\
4&5
\end{bmatrix}.
$$

Thus a $2\times3$ matrix becomes a $3\times2$ matrix.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

For an $m\times n$ matrix:

$$
a_{ij}
=
\text{entry in row }i\text{ and column }j.
$$

Dimensions are written as rows by columns. Vectors are one-row or one-column
matrices, square matrices have equal row and column counts, and transposition
interchanges rows with columns.

</details>

---

## Block 2: Addition And Scalar Multiplication

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to combine matrices entry by entry and to distinguish this process
from matrix multiplication.

</details>

<details open>
<summary><strong>The Size Rule For Addition</strong></summary>

Matrices can be added only when they have the same dimensions.

If:

$$
A=[a_{ij}],
\qquad
B=[b_{ij}]
$$

are both $m\times n$, then:

$$
\boxed{A+B=[a_{ij}+b_{ij}]}.
$$

Each entry is added only to the entry occupying the same position.

A $2\times3$ matrix cannot be added to a $3\times2$ matrix. Having the same
number of entries is not enough; the shapes must match.

</details>

<details open>
<summary><strong>A Complete Addition Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
-3&6&1\\
7&-2&0
\end{bmatrix}.
$$

Both matrices are $2\times3$, so $A+B$ is defined and will also be
$2\times3$.

Add corresponding entries:

$$
\begin{aligned}
A+B
&=
\begin{bmatrix}
2+(-3)&-1+6&4+1\\
0+7&3+(-2)&5+0
\end{bmatrix}\\
&=
\begin{bmatrix}
-1&5&5\\
7&1&5
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
A+B=
\begin{bmatrix}
-1&5&5\\
7&1&5
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Scalar Multiplication</strong></summary>

A scalar is a single number or scalar-valued function. Multiplying a matrix by
a scalar multiplies every entry.

Using:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix},
$$

multiply every entry by $3$:

$$
\begin{aligned}
3A
&=
\begin{bmatrix}
3(2)&3(-1)&3(4)\\
3(0)&3(3)&3(5)
\end{bmatrix}\\
&=
\begin{bmatrix}
6&-3&12\\
0&9&15
\end{bmatrix}.
\end{aligned}
$$

Scalar multiplication does not change the matrix dimensions.

</details>

<details open>
<summary><strong>A Matrix Linear Combination</strong></summary>

Continue with:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
-3&6&1\\
7&-2&0
\end{bmatrix}.
$$

Find $3A-2B$.

First calculate $3A$:

$$
3A=
\begin{bmatrix}
6&-3&12\\
0&9&15
\end{bmatrix}.
$$

Now calculate $2B$:

$$
2B=
\begin{bmatrix}
-6&12&2\\
14&-4&0
\end{bmatrix}.
$$

Subtract corresponding entries:

$$
\begin{aligned}
3A-2B
&=
\begin{bmatrix}
6-(-6)&-3-12&12-2\\
0-14&9-(-4)&15-0
\end{bmatrix}\\
&=
\begin{bmatrix}
12&-15&10\\
-14&13&15
\end{bmatrix}.
\end{aligned}
$$

The completed linear combination is:

$$
\boxed{
3A-2B=
\begin{bmatrix}
12&-15&10\\
-14&13&15
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Additive Properties</strong></summary>

For matrices of compatible dimensions:

$$
A+B=B+A
$$

and:

$$
(A+B)+C=A+(B+C).
$$

The zero matrix is the additive identity:

$$
A+0=A.
$$

The matrix $-A$ is formed by negating every entry, so:

$$
A+(-A)=0.
$$

These properties work because matrix addition is ordinary addition performed
independently in each position.

</details>

<details open>
<summary><strong>A Useful Vector Interpretation</strong></summary>

Let:

$$
\mathbf{u}=
\begin{bmatrix}
1\\
-2\\
4
\end{bmatrix},
\qquad
\mathbf{v}=
\begin{bmatrix}
3\\
5\\
-1
\end{bmatrix}.
$$

Both are $3\times1$, so $2\mathbf{u}-\mathbf{v}$ is defined.

First:

$$
2\mathbf{u}=
\begin{bmatrix}
2\\
-4\\
8
\end{bmatrix}.
$$

Then:

$$
\begin{aligned}
2\mathbf{u}-\mathbf{v}
&=
\begin{bmatrix}
2-3\\
-4-5\\
8-(-1)
\end{bmatrix}\\
&=
\begin{bmatrix}
-1\\
-9\\
9
\end{bmatrix}.
\end{aligned}
$$

What this tells us:

> vector linear combinations use the same entrywise addition and scalar
> multiplication rules as all other matrices.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Addition requires equal dimensions:

$$
A+B=[a_{ij}+b_{ij}].
$$

Scalar multiplication affects every entry:

$$
\alpha A=[\alpha a_{ij}].
$$

Both operations preserve the dimensions of the matrices involved.

</details>

---

## Block 3: Matrix Multiplication

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to make row-by-column multiplication predictable rather than
mysterious. The dimension test will be applied before any arithmetic begins.

</details>

<details open>
<summary><strong>The Inner-Dimension Test</strong></summary>

Suppose:

$$
A\text{ is }m\times n
$$

and:

$$
B\text{ is }n\times p.
$$

Then $AB$ is defined because the two inner dimensions match:

$$
(m\times\boxed{n})(\boxed{n}\times p).
$$

The product has the two outer dimensions:

$$
\boxed{AB\text{ is }m\times p}.
$$

If the inner dimensions do not match, the product is not defined.

</details>

<details open>
<summary><strong>Why Rows Meet Columns</strong></summary>

Let $A=[a_{ij}]$ be $m\times n$ and let $B=[b_{ij}]$ be $n\times p$. The entry
in row $i$, column $j$ of $AB$ is:

$$
\boxed{
(AB)_{ij}
=
\sum_{k=1}^{n}a_{ik}b_{kj}
}.
$$

This means:

1. take row $i$ from $A$;
2. take column $j$ from $B$;
3. multiply corresponding entries;
4. add those products.

The matching inner dimension ensures that the selected row and column contain
the same number of entries.

</details>

<details open>
<summary><strong>A Complete Product Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
1&2&-1\\
3&0&4
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
2&1\\
-1&5\\
3&2
\end{bmatrix}.
$$

The dimensions are:

$$
A:2\times3,
\qquad
B:3\times2.
$$

The inner dimensions match, so:

$$
AB\text{ is }2\times2.
$$

Find the row $1$, column $1$ entry:

$$
\begin{aligned}
(AB)_{11}
&=
\begin{bmatrix}
1&2&-1
\end{bmatrix}
\begin{bmatrix}
2\\
-1\\
3
\end{bmatrix}\\
&=1(2)+2(-1)+(-1)(3)\\
&=2-2-3\\
&=-3.
\end{aligned}
$$

Find the row $1$, column $2$ entry:

$$
\begin{aligned}
(AB)_{12}
&=
\begin{bmatrix}
1&2&-1
\end{bmatrix}
\begin{bmatrix}
1\\
5\\
2
\end{bmatrix}\\
&=1(1)+2(5)+(-1)(2)\\
&=1+10-2\\
&=9.
\end{aligned}
$$

Find the row $2$, column $1$ entry:

$$
\begin{aligned}
(AB)_{21}
&=
\begin{bmatrix}
3&0&4
\end{bmatrix}
\begin{bmatrix}
2\\
-1\\
3
\end{bmatrix}\\
&=3(2)+0(-1)+4(3)\\
&=6+0+12\\
&=18.
\end{aligned}
$$

Find the row $2$, column $2$ entry:

$$
\begin{aligned}
(AB)_{22}
&=
\begin{bmatrix}
3&0&4
\end{bmatrix}
\begin{bmatrix}
1\\
5\\
2
\end{bmatrix}\\
&=3(1)+0(5)+4(2)\\
&=3+0+8\\
&=11.
\end{aligned}
$$

Place each result in its matching position:

$$
\boxed{
AB=
\begin{bmatrix}
-3&9\\
18&11
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Changing The Order Changes The Problem</strong></summary>

For the same matrices:

$$
A:2\times3,
\qquad
B:3\times2,
$$

the reverse product has dimensions:

$$
(3\times2)(2\times3).
$$

Therefore $BA$ is defined, but it is $3\times3$, not $2\times2$.

Compute it row by row:

$$
\begin{aligned}
BA
&=
\begin{bmatrix}
2&1\\
-1&5\\
3&2
\end{bmatrix}
\begin{bmatrix}
1&2&-1\\
3&0&4
\end{bmatrix}\\
&=
\begin{bmatrix}
2(1)+1(3)&2(2)+1(0)&2(-1)+1(4)\\
-1(1)+5(3)&-1(2)+5(0)&-1(-1)+5(4)\\
3(1)+2(3)&3(2)+2(0)&3(-1)+2(4)
\end{bmatrix}\\
&=
\begin{bmatrix}
5&4&2\\
14&-2&21\\
9&6&5
\end{bmatrix}.
\end{aligned}
$$

Here $AB$ and $BA$ do not even have the same dimensions. In general:

$$
\boxed{AB\ne BA}.
$$

Matrix multiplication is not commutative.

</details>

<details open>
<summary><strong>Matrix Times Vector</strong></summary>

Let:

$$
M=
\begin{bmatrix}
2&-1\\
1&3
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
4\\
-2
\end{bmatrix}.
$$

The dimensions are:

$$
(2\times2)(2\times1),
$$

so $M\mathbf{x}$ is a $2\times1$ vector.

Use one row of $M$ at a time:

$$
\begin{aligned}
M\mathbf{x}
&=
\begin{bmatrix}
2(4)+(-1)(-2)\\
1(4)+3(-2)
\end{bmatrix}\\
&=
\begin{bmatrix}
8+2\\
4-6
\end{bmatrix}\\
&=
\begin{bmatrix}
10\\
-2
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
M\mathbf{x}=
\begin{bmatrix}
10\\
-2
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>The Column-Combination Interpretation</strong></summary>

The same product can be understood using the columns of $M$.

Write:

$$
M=
\begin{bmatrix}
\vert&\vert\\
\mathbf{m}_1&\mathbf{m}_2\\
\vert&\vert
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
x_1\\
x_2
\end{bmatrix}.
$$

Then:

$$
\boxed{M\mathbf{x}=x_1\mathbf{m}_1+x_2\mathbf{m}_2}.
$$

For the previous example:

$$
\mathbf{m}_1=
\begin{bmatrix}
2\\
1
\end{bmatrix},
\qquad
\mathbf{m}_2=
\begin{bmatrix}
-1\\
3
\end{bmatrix},
\qquad
x_1=4,
\qquad
x_2=-2.
$$

Substitute:

$$
\begin{aligned}
M\mathbf{x}
&=
4
\begin{bmatrix}
2\\
1
\end{bmatrix}
-2
\begin{bmatrix}
-1\\
3
\end{bmatrix}\\
&=
\begin{bmatrix}
8\\
4
\end{bmatrix}
+
\begin{bmatrix}
2\\
-6
\end{bmatrix}\\
&=
\begin{bmatrix}
10\\
-2
\end{bmatrix}.
\end{aligned}
$$

Another way to see it:

> multiplying by a matrix forms a linear combination of that matrix's
> columns, using the input vector entries as coefficients.

</details>

<details open>
<summary><strong>Associativity And Distributivity</strong></summary>

Whenever the dimensions make all products meaningful:

$$
A(BC)=(AB)C.
$$

Thus matrix multiplication is associative.

It also distributes over addition:

$$
A(B+C)=AB+AC
$$

and:

$$
(A+B)C=AC+BC.
$$

The order of factors has not been changed in any of these rules.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

The product:

$$
(m\times n)(n\times p)
$$

is defined and has dimensions:

$$
m\times p.
$$

Each product entry is a row-column dot product. Matrix multiplication is
associative and distributive, but it is not generally commutative.

</details>

---

## Block 4: Identity Matrices, Powers, And Algebraic Caution

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to define powers of square matrices and identify which familiar
algebra rules survive matrix multiplication.

</details>

<details open>
<summary><strong>The Identity Matrix In A Product</strong></summary>

For an $m\times n$ matrix $A$:

$$
I_mA=A
$$

and:

$$
AI_n=A.
$$

The identity on the left must have $m$ rows and columns. The identity on the
right must have $n$ rows and columns.

For a square $2\times2$ matrix:

$$
A=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
\qquad
I_2=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

Multiply $A$ by $I_2$:

$$
\begin{aligned}
AI_2
&=
\begin{bmatrix}
a(1)+b(0)&a(0)+b(1)\\
c(1)+d(0)&c(0)+d(1)
\end{bmatrix}\\
&=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix}\\
&=A.
\end{aligned}
$$

Multiplication by the identity leaves the matrix unchanged.

</details>

<details open>
<summary><strong>Powers Of A Square Matrix</strong></summary>

If $A$ is square and $n$ is a positive integer, define:

$$
\boxed{A^n=\underbrace{AA\cdots A}_{n\text{ factors}}}.
$$

In particular:

$$
A^2=AA,
\qquad
A^3=AAA.
$$

The zeroth power is defined by:

$$
\boxed{A^0=I}.
$$

A nonsquare matrix does not have an ordinary square $A^2$, because the inner
dimensions of $AA$ would not match.

</details>

<details open>
<summary><strong>A Complete Power Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix}.
$$

First calculate $A^2=AA$:

$$
\begin{aligned}
A^2
&=
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix}
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix}\\
&=
\begin{bmatrix}
1(1)+2(0)&1(2)+2(3)\\
0(1)+3(0)&0(2)+3(3)
\end{bmatrix}\\
&=
\begin{bmatrix}
1&8\\
0&9
\end{bmatrix}.
\end{aligned}
$$

Now use $A^3=A^2A$:

$$
\begin{aligned}
A^3
&=
\begin{bmatrix}
1&8\\
0&9
\end{bmatrix}
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix}\\
&=
\begin{bmatrix}
1(1)+8(0)&1(2)+8(3)\\
0(1)+9(0)&0(2)+9(3)
\end{bmatrix}\\
&=
\begin{bmatrix}
1&26\\
0&27
\end{bmatrix}.
\end{aligned}
$$

The resulting third power is:

$$
\boxed{
A^3=
\begin{bmatrix}
1&26\\
0&27
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Matrix Squaring Is Not Entrywise Squaring</strong></summary>

For:

$$
A=
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix},
$$

the actual matrix square is:

$$
A^2=
\begin{bmatrix}
1&8\\
0&9
\end{bmatrix}.
$$

Squaring each entry would instead give:

$$
\begin{bmatrix}
1^2&2^2\\
0^2&3^2
\end{bmatrix}
=
\begin{bmatrix}
1&4\\
0&9
\end{bmatrix},
$$

which is different.

What to remember:

> the exponent in $A^2$ means the matrix product $AA$, not entrywise
> exponentiation.

</details>

<details open>
<summary><strong>Expanding A Matrix Square</strong></summary>

Start from:

$$
(A+B)^2=(A+B)(A+B).
$$

Distribute without changing the order of any factors:

$$
\begin{aligned}
(A+B)^2
&=A(A+B)+B(A+B)\\
&=A^2+AB+BA+B^2.
\end{aligned}
$$

The correct matrix expansion is:

$$
\boxed{(A+B)^2=A^2+AB+BA+B^2}.
$$

For ordinary numbers, $AB=BA$, so the middle terms combine to $2AB$. For
matrices, that combination is valid only when $A$ and $B$ commute.

</details>

<details open>
<summary><strong>Nonzero Matrices Can Multiply To Zero</strong></summary>

Let:

$$
P=
\begin{bmatrix}
1&-1\\
1&-1
\end{bmatrix},
\qquad
Q=
\begin{bmatrix}
2&0\\
2&0
\end{bmatrix}.
$$

Neither matrix is the zero matrix. Calculate $PQ$:

$$
\begin{aligned}
PQ
&=
\begin{bmatrix}
1(2)+(-1)(2)&1(0)+(-1)(0)\\
1(2)+(-1)(2)&1(0)+(-1)(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
0&0\\
0&0
\end{bmatrix}.
\end{aligned}
$$

This calculation shows that two nonzero matrices can have a zero product:

$$
\boxed{P\ne0,\quad Q\ne0,\quad\text{but}\quad PQ=0}.
$$

This is one reason scalar cancellation habits cannot be imported blindly into
matrix algebra.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

For square matrices:

$$
A^0=I,
\qquad
A^n=\underbrace{AA\cdots A}_{n\text{ factors}}.
$$

Matrix powers use matrix multiplication. Factor order matters, $(A+B)^2$
contains both $AB$ and $BA$, and a product of nonzero matrices can equal the
zero matrix.

</details>

---

## Block 5: Matrices Whose Entries Are Functions

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to differentiate and integrate matrices entry by entry while
preserving the order of factors in product rules.

</details>

<details open>
<summary><strong>A Matrix-Valued Function</strong></summary>

A matrix may depend on the independent variable $t$. For example:

$$
A(t)=
\begin{bmatrix}
t^2&e^t\\
\sin t&3t
\end{bmatrix}.
$$

Each position contains a scalar-valued function of $t$.

The matrix has fixed dimensions $2\times2$, even though its entries change with
time.

</details>

<details open>
<summary><strong>Differentiate Entry By Entry</strong></summary>

For:

$$
A(t)=[a_{ij}(t)],
$$

define:

$$
\boxed{A'(t)=[a_{ij}'(t)]}.
$$

Using:

$$
A(t)=
\begin{bmatrix}
t^2&e^t\\
\sin t&3t
\end{bmatrix},
$$

differentiate each entry in its current position:

$$
\begin{aligned}
A'(t)
&=
\begin{bmatrix}
\dfrac{d}{dt}(t^2)&\dfrac{d}{dt}(e^t)\\
\dfrac{d}{dt}(\sin t)&\dfrac{d}{dt}(3t)
\end{bmatrix}\\
&=
\begin{bmatrix}
2t&e^t\\
\cos t&3
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
A'(t)=
\begin{bmatrix}
2t&e^t\\
\cos t&3
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Integrate Entry By Entry</strong></summary>

An indefinite matrix integral is also calculated entry by entry:

$$
\int A(t)\,dt
=
\left[\int a_{ij}(t)\,dt\right].
$$

For the same $A(t)$:

$$
\begin{aligned}
\int A(t)\,dt
&=
\begin{bmatrix}
\int t^2\,dt&\int e^t\,dt\\
\int\sin t\,dt&\int3t\,dt
\end{bmatrix}\\
&=
\begin{bmatrix}
\dfrac{t^3}{3}&e^t\\
-\cos t&\dfrac{3t^2}{2}
\end{bmatrix}
+C.
\end{aligned}
$$

Here $C$ is a constant matrix of the same dimensions:

$$
C=
\begin{bmatrix}
c_{11}&c_{12}\\
c_{21}&c_{22}
\end{bmatrix}.
$$

Each entry may require its own integration constant. Writing one scalar
constant would incorrectly force all four constants to be equal.

</details>

<details open>
<summary><strong>The Matrix Product Rule</strong></summary>

If $A(t)B(t)$ is defined for every $t$, then:

$$
\boxed{
\frac{d}{dt}[A(t)B(t)]
=
A'(t)B(t)+A(t)B'(t)
}.
$$

The order is essential. The first term is $A'B$, and the second is $AB'$.
Neither factor is moved past the other.

</details>

<details open>
<summary><strong>A Complete Product-Rule Check</strong></summary>

Let:

$$
A(t)=
\begin{bmatrix}
t&1\\
0&t^2
\end{bmatrix},
\qquad
B(t)=
\begin{bmatrix}
1&t\\
t&0
\end{bmatrix}.
$$

First multiply the matrices:

$$
\begin{aligned}
A(t)B(t)
&=
\begin{bmatrix}
t(1)+1(t)&t(t)+1(0)\\
0(1)+t^2(t)&0(t)+t^2(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
2t&t^2\\
t^3&0
\end{bmatrix}.
\end{aligned}
$$

Differentiate this product entry by entry:

$$
\frac{d}{dt}[AB]
=
\begin{bmatrix}
2&2t\\
3t^2&0
\end{bmatrix}.
$$

Now verify the product rule directly. Differentiate each factor:

$$
A'(t)=
\begin{bmatrix}
1&0\\
0&2t
\end{bmatrix},
\qquad
B'(t)=
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix}.
$$

Calculate the first product-rule term:

$$
\begin{aligned}
A'B
&=
\begin{bmatrix}
1&0\\
0&2t
\end{bmatrix}
\begin{bmatrix}
1&t\\
t&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1&t\\
2t^2&0
\end{bmatrix}.
\end{aligned}
$$

Calculate the second product-rule term:

$$
\begin{aligned}
AB'
&=
\begin{bmatrix}
t&1\\
0&t^2
\end{bmatrix}
\begin{bmatrix}
0&1\\
1&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1&t\\
t^2&0
\end{bmatrix}.
\end{aligned}
$$

Add corresponding entries:

$$
\begin{aligned}
A'B+AB'
&=
\begin{bmatrix}
1&t\\
2t^2&0
\end{bmatrix}
+
\begin{bmatrix}
1&t\\
t^2&0
\end{bmatrix}\\
&=
\begin{bmatrix}
2&2t\\
3t^2&0
\end{bmatrix}.
\end{aligned}
$$

This agrees with the derivative of the product calculated first.

</details>

<details open>
<summary><strong>A Matrix Initial-Value Calculation</strong></summary>

Suppose:

$$
X'(t)=
\begin{bmatrix}
2t&1\\
\cos t&-e^{-t}
\end{bmatrix}
$$

and:

$$
X(0)=
\begin{bmatrix}
1&-2\\
0&3
\end{bmatrix}.
$$

Integrate from $0$ to $t$:

$$
X(t)-X(0)=\int_0^tX'(s)\,ds.
$$

Calculate the integral entry by entry:

$$
\begin{aligned}
\int_0^tX'(s)\,ds
&=
\begin{bmatrix}
\int_0^t2s\,ds&\int_0^t1\,ds\\
\int_0^t\cos s\,ds&\int_0^t-e^{-s}\,ds
\end{bmatrix}\\
&=
\begin{bmatrix}
t^2&t\\
\sin t&e^{-t}-1
\end{bmatrix}.
\end{aligned}
$$

Add $X(0)$ to both sides:

$$
\begin{aligned}
X(t)
&=
\begin{bmatrix}
1&-2\\
0&3
\end{bmatrix}
+
\begin{bmatrix}
t^2&t\\
\sin t&e^{-t}-1
\end{bmatrix}\\
&=
\begin{bmatrix}
1+t^2&-2+t\\
\sin t&2+e^{-t}
\end{bmatrix}.
\end{aligned}
$$

The matrix satisfying the differential equation and initial value is:

$$
\boxed{
X(t)=
\begin{bmatrix}
1+t^2&-2+t\\
\sin t&2+e^{-t}
\end{bmatrix}
}.
$$

Check the initial value by setting $t=0$:

$$
X(0)=
\begin{bmatrix}
1&-2\\
0&3
\end{bmatrix}.
$$

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Matrix differentiation and integration are entrywise operations:

$$
A'=[a_{ij}'],
\qquad
\int A\,dt=\left[\int a_{ij}\,dt\right].
$$

The matrix product rule is:

$$
(AB)'=A'B+AB',
$$

with factor order preserved. An indefinite matrix integral requires a constant
matrix, not merely one scalar constant.

</details>

---

## Block 6: Determinants, Eigenvalues, And Eigenvectors

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to build the characteristic polynomial from a determinant and then
interpret its roots as special scaling factors of the matrix.

</details>

<details open>
<summary><strong>The Two-By-Two Determinant</strong></summary>

A determinant is a scalar associated with a square matrix.

For:

$$
M=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
$$

the determinant is:

$$
\boxed{\det(M)=ad-bc}.
$$

The products use opposite corners:

$$
\text{main-diagonal product}
-
\text{other-diagonal product}.
$$

For example, let:

$$
M=
\begin{bmatrix}
3&-2\\
5&1
\end{bmatrix}.
$$

Substitute the entries into $ad-bc$:

$$
\begin{aligned}
\det(M)
&=3(1)-(-2)(5)\\
&=3-(-10)\\
&=13.
\end{aligned}
$$

For this matrix, the determinant is:

$$
\boxed{\det(M)=13}.
$$

</details>

<details open>
<summary><strong>A Three-By-Three Determinant</strong></summary>

For:

$$
M=
\begin{bmatrix}
a&b&c\\
d&e&f\\
g&h&i
\end{bmatrix},
$$

expansion along the first row gives:

$$
\boxed{
\det(M)
=
a(ei-fh)-b(di-fg)+c(dh-eg)
}.
$$

The cofactor signs across the first row are:

$$
+,\quad-,\quad+.
$$

Consider:

$$
M=
\begin{bmatrix}
2&1&0\\
-1&3&2\\
4&0&1
\end{bmatrix}.
$$

Substitute the first-row entries and their $2\times2$ determinants:

$$
\begin{aligned}
\det(M)
&=
2[3(1)-2(0)]
-1[(-1)(1)-2(4)]\\
&\quad
+0[(-1)(0)-3(4)].
\end{aligned}
$$

Simplify each bracket:

$$
\begin{aligned}
\det(M)
&=2(3)-1(-1-8)+0\\
&=6-(-9)\\
&=15.
\end{aligned}
$$

For this matrix, the three-by-three determinant is:

$$
\boxed{\det(M)=15}.
$$

</details>

<details open>
<summary><strong>The Characteristic Polynomial</strong></summary>

Let $A$ be an $n\times n$ matrix, and let $I$ be the $n\times n$ identity
matrix.

The characteristic polynomial used in this chapter is:

$$
\boxed{p_A(\lambda)=\det(\lambda I-A)}.
$$

Here $\lambda$ is a scalar variable. The matrix $\lambda I-A$ is formed first,
and its determinant then produces an ordinary polynomial in $\lambda$.

An **eigenvalue** of $A$ is a root of that polynomial:

$$
p_A(\lambda)=0.
$$

Some books define the characteristic polynomial as $\det(A-\lambda I)$. That
convention differs by a factor $(-1)^n$ but gives the same eigenvalues. Mixing
the two conventions halfway through a calculation causes unnecessary sign
errors.

</details>

<details open>
<summary><strong>A Complete Two-By-Two Eigenvalue Example</strong></summary>

Let:

$$
A=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}.
$$

Start with the identity matrix:

$$
I=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

Multiply it by $\lambda$:

$$
\lambda I=
\begin{bmatrix}
\lambda&0\\
0&\lambda
\end{bmatrix}.
$$

Subtract $A$ entry by entry:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-4&-2\\
-1&\lambda-3
\end{bmatrix}.
$$

Now take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
\det(\lambda I-A)\\
&=(\lambda-4)(\lambda-3)-(-2)(-1).
\end{aligned}
$$

Multiply the off-diagonal entries:

$$
(-2)(-1)=2.
$$

Substituting this off-diagonal product into the determinant gives:

$$
p_A(\lambda)
=
(\lambda-4)(\lambda-3)-2.
$$

Expand the brackets:

$$
\begin{aligned}
p_A(\lambda)
&=\lambda^2-7\lambda+12-2\\
&=\lambda^2-7\lambda+10.
\end{aligned}
$$

Factor the polynomial:

$$
p_A(\lambda)
=
(\lambda-5)(\lambda-2).
$$

Set the characteristic polynomial equal to zero:

$$
(\lambda-5)(\lambda-2)=0.
$$

Hence the eigenvalues are:

$$
\boxed{\lambda_1=5,\qquad\lambda_2=2}.
$$

</details>

<details open>
<summary><strong>What An Eigenvector Adds</strong></summary>

A nonzero vector $\mathbf{v}$ is an eigenvector associated with $\lambda$ when:

$$
\boxed{A\mathbf{v}=\lambda\mathbf{v}}.
$$

The matrix may change the vector's length or direction sign, but it does not
turn the vector away from its line.

To find an eigenvector, rewrite the equation as:

$$
(A-\lambda I)\mathbf{v}=0.
$$

The requirement $\mathbf{v}\ne0$ matters. The zero vector satisfies
$A\mathbf{0}=\lambda\mathbf{0}$ for every $\lambda$, so it cannot distinguish
one eigenvalue from another.

</details>

<details open>
<summary><strong>Finding The Eigenvectors In The Example</strong></summary>

Continue with:

$$
A=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}.
$$

For $\lambda=5$:

$$
A-5I
=
\begin{bmatrix}
-1&2\\
1&-2
\end{bmatrix}.
$$

Let:

$$
\mathbf{v}=
\begin{bmatrix}
v_1\\
v_2
\end{bmatrix}.
$$

Then $(A-5I)\mathbf{v}=0$ gives:

$$
-v_1+2v_2=0.
$$

Add $v_1$ to both sides:

$$
2v_2=v_1.
$$

Choose $v_2=1$. Then $v_1=2$, so one eigenvector is:

$$
\boxed{
\mathbf{v}_1=
\begin{bmatrix}
2\\
1
\end{bmatrix}
}.
$$

Verify it locally:

$$
\begin{aligned}
A\mathbf{v}_1
&=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}
\begin{bmatrix}
2\\
1
\end{bmatrix}\\
&=
\begin{bmatrix}
+10\\
5
\end{bmatrix}\\
&=
5
\begin{bmatrix}
2\\
1
\end{bmatrix}.
\end{aligned}
$$

For $\lambda=2$:

$$
A-2I
=
\begin{bmatrix}
2&2\\
1&1
\end{bmatrix}.
$$

The equation $(A-2I)\mathbf{v}=0$ reduces to:

$$
v_1+v_2=0.
$$

Choose $v_1=1$. Then $v_2=-1$, so one eigenvector is:

$$
\boxed{
\mathbf{v}_2=
\begin{bmatrix}
1\\
-1
\end{bmatrix}
}.
$$

Verify:

$$
\begin{aligned}
A\mathbf{v}_2
&=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}
\begin{bmatrix}
1\\
-1
\end{bmatrix}\\
&=
\begin{bmatrix}
2\\
-2
\end{bmatrix}\\
&=
2
\begin{bmatrix}
1\\
-1
\end{bmatrix}.
\end{aligned}
$$

Any nonzero scalar multiple of an eigenvector is another eigenvector for the
same eigenvalue.

</details>

<details open>
<summary><strong>Why Eigenvalues Matter For Differential Equations</strong></summary>

Consider the future matrix differential equation:

$$
\mathbf{x}'=A\mathbf{x}.
$$

Suppose $A\mathbf{v}=\lambda\mathbf{v}$. Try:

$$
\mathbf{x}(t)=e^{\lambda t}\mathbf{v}.
$$

Differentiate:

$$
\mathbf{x}'(t)=\lambda e^{\lambda t}\mathbf{v}.
$$

Now multiply $\mathbf{x}$ by $A$:

$$
\begin{aligned}
A\mathbf{x}(t)
&=A\left(e^{\lambda t}\mathbf{v}\right)\\
&=e^{\lambda t}A\mathbf{v}\\
&=e^{\lambda t}\lambda\mathbf{v}\\
&=\lambda e^{\lambda t}\mathbf{v}.
\end{aligned}
$$

Both $\mathbf{x}'$ and $A\mathbf{x}$ equal
$\lambda e^{\lambda t}\mathbf{v}$. Hence the proposed function satisfies:

$$
\mathbf{x}'=A\mathbf{x}.
$$

The key intuition:

> an eigenvector supplies a fixed direction, while its eigenvalue controls the
> exponential behavior along that direction.

A later chapter will develop this method fully.

</details>

<details open>
<summary><strong>Triangular Matrices And Multiplicity</strong></summary>

For a triangular matrix, the characteristic polynomial is the product of
$\lambda$ minus the diagonal entries.

Consider:

$$
T=
\begin{bmatrix}
3&1&-2\\
0&-1&4\\
0&0&-1
\end{bmatrix}.
$$

Then:

$$
\lambda I-T
=
\begin{bmatrix}
\lambda-3&-1&2\\
0&\lambda+1&-4\\
0&0&\lambda+1
\end{bmatrix}.
$$

This is triangular, so its determinant is the product of its diagonal entries:

$$
\begin{aligned}
p_T(\lambda)
&=(\lambda-3)(\lambda+1)(\lambda+1)\\
&=(\lambda-3)(\lambda+1)^2.
\end{aligned}
$$

The factorization $p_T(\lambda)=(\lambda-3)(\lambda+1)^2$ shows that:

$$
\boxed{\lambda=3\text{ has multiplicity }1}
$$

and:

$$
\boxed{\lambda=-1\text{ has multiplicity }2}.
$$

The exponent in the characteristic polynomial gives the **algebraic
multiplicity**. It does not automatically tell us how many independent
eigenvectors belong to that eigenvalue.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Using the monic convention:

$$
p_A(\lambda)=\det(\lambda I-A).
$$

The roots of $p_A(\lambda)=0$ are the eigenvalues. An associated nonzero vector
satisfies:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

Eigenpairs matter in ODEs because they generate modes of the form
$e^{\lambda t}\mathbf{v}$.

</details>

---

## Block 7: Cayley-Hamilton And A Reliable Matrix Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to understand what it means for a matrix to satisfy its own
characteristic equation and to use that identity to reduce high powers.

</details>

<details open>
<summary><strong>Substituting A Matrix Into A Polynomial</strong></summary>

Suppose:

$$
p(\lambda)=\lambda^2-4\lambda+7.
$$

Replacing the scalar variable $\lambda$ by a square matrix $A$ gives:

$$
p(A)=A^2-4A+7I.
$$

The constant term becomes $7I$, not the scalar $7$, because every term in the
sum must be a matrix of the same dimensions.

More generally, if:

$$
p(\lambda)
=
\lambda^n+c_{n-1}\lambda^{n-1}+\cdots+c_1\lambda+c_0,
$$

then:

$$
p(A)
=
A^n+c_{n-1}A^{n-1}+\cdots+c_1A+c_0I.
$$

</details>

<details open>
<summary><strong>The Cayley-Hamilton Theorem</strong></summary>

Let $p_A(\lambda)$ be the characteristic polynomial of a square matrix $A$.
The Cayley-Hamilton theorem states:

$$
\boxed{p_A(A)=0}.
$$

The zero on the right is the zero matrix of the same dimensions as $A$.

This does not say that $p_A(\lambda)=0$ for every scalar $\lambda$. It says that
the matrix expression obtained by replacing $\lambda$ with $A$ equals the zero
matrix.

</details>

<details open>
<summary><strong>A Complete Cayley-Hamilton Verification</strong></summary>

Let:

$$
A=
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}.
$$

Construct $\lambda I-A$:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-1&-2\\
-3&\lambda
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=(\lambda-1)\lambda-(-2)(-3)\\
&=\lambda^2-\lambda-6.
\end{aligned}
$$

Therefore the characteristic equation is:

$$
\lambda^2-\lambda-6=0.
$$

Cayley-Hamilton predicts:

$$
A^2-A-6I=0.
$$

Calculate $A^2$ from the matrix product $AA$:

$$
\begin{aligned}
A^2
&=
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}\\
&=
\begin{bmatrix}
1(1)+2(3)&1(2)+2(0)\\
3(1)+0(3)&3(2)+0(0)
\end{bmatrix}\\
&=
\begin{bmatrix}
7&2\\
3&6
\end{bmatrix}.
\end{aligned}
$$

Now subtract $A$:

$$
\begin{aligned}
A^2-A
&=
\begin{bmatrix}
7&2\\
3&6
\end{bmatrix}
-
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}\\
&=
\begin{bmatrix}
6&0\\
0&6
\end{bmatrix}.
\end{aligned}
$$

Write $6I$ explicitly:

$$
6I=
\begin{bmatrix}
6&0\\
0&6
\end{bmatrix}.
$$

The two displayed matrices are equal, so:

$$
A^2-A=6I.
$$

Subtract $6I$ from both sides:

$$
\boxed{A^2-A-6I=0}.
$$

This verifies the theorem for the chosen matrix.

</details>

<details open>
<summary><strong>Reducing A High Matrix Power</strong></summary>

The verified identity is:

$$
A^2=A+6I.
$$

Use it to find $A^5$ without performing four full matrix multiplications.

Multiply the identity by $A$:

$$
A^3=A(A+6I).
$$

Distribute:

$$
A^3=A^2+6A.
$$

Replace $A^2$ by $A+6I$:

$$
\begin{aligned}
A^3
&=(A+6I)+6A\\
&=7A+6I.
\end{aligned}
$$

Multiply by $A$ again:

$$
A^4=A(7A+6I).
$$

Distribute:

$$
A^4=7A^2+6A.
$$

Replace $A^2$:

$$
\begin{aligned}
A^4
&=7(A+6I)+6A\\
&=7A+42I+6A\\
&=13A+42I.
\end{aligned}
$$

Multiply by $A$ once more:

$$
A^5=A(13A+42I).
$$

Distribute:

$$
A^5=13A^2+42A.
$$

Replace $A^2$ by $A+6I$:

$$
\begin{aligned}
A^5
&=13(A+6I)+42A\\
&=13A+78I+42A\\
&=55A+78I.
\end{aligned}
$$

Now insert:

$$
A=
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix},
\qquad
I=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

Then:

$$
\begin{aligned}
A^5
&=
55
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}
+
78
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}\\
&=
\begin{bmatrix}
55&110\\
165&0
\end{bmatrix}
+
\begin{bmatrix}
78&0\\
0&78
\end{bmatrix}\\
&=
\begin{bmatrix}
133&110\\
165&78
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
A^5=
\begin{bmatrix}
133&110\\
165&78
\end{bmatrix}
}.
$$

The theorem converts every power $A^n$ with $n\ge2$ into a linear combination
of $A$ and $I$ for this $2\times2$ example.

</details>

<details open>
<summary><strong>A Reliable Workflow</strong></summary>

### Step 1: Write dimensions beside every matrix

Do this before adding or multiplying.

### Step 2: Test compatibility

Addition needs identical dimensions. Multiplication needs matching inner
dimensions.

### Step 3: Predict the output dimensions

For $(m\times n)(n\times p)$, create an empty $m\times p$ result before doing
arithmetic.

### Step 4: Name the row and column for each product entry

This prevents accidental entrywise multiplication.

### Step 5: Preserve factor order

Never commute factors unless commutativity has been proved for those matrices.

### Step 6: For eigenvalues, construct $\lambda I-A$ explicitly

Then take the determinant and solve the resulting scalar polynomial.

### Step 7: For an eigenvector, solve $(A-\lambda I)\mathbf{v}=0$

Keep the requirement $\mathbf{v}\ne0$ visible.

### Step 8: For Cayley-Hamilton, convert constants to multiples of $I$

Then verify or reduce powers one substitution at a time.

</details>

<details open>
<summary><strong>Common Mistake: Multiplying Corresponding Entries</strong></summary>

Matrix multiplication is not usually entrywise multiplication.

For $AB$, the entry $(AB)_{ij}$ comes from:

$$
\text{row }i\text{ of }A
\quad\text{with}\quad
\text{column }j\text{ of }B.
$$

If corresponding entries are multiplied instead, a different operation has
been performed.

</details>

<details open>
<summary><strong>Common Mistake: Checking The Outer Dimensions</strong></summary>

For:

$$
(m\times n)(r\times p),
$$

the product exists only when:

$$
\boxed{n=r}.
$$

The inner dimensions must match. The outer dimensions $m$ and $p$ describe the
answer; they do not decide whether multiplication is legal.

</details>

<details open>
<summary><strong>Common Mistake: Reversing A Product</strong></summary>

From $AB$, one cannot casually move to $BA$.

Possible outcomes include:

- both products exist but have different values
- both products exist but have different interpretations
- one product exists while the other does not
- both products exist but have different dimensions

Always retest dimensions after reversing the order.

</details>

<details open>
<summary><strong>Common Mistake: Losing Constants In A Matrix Integral</strong></summary>

If:

$$
X'(t)=A(t),
$$

then an indefinite integration gives:

$$
X(t)=\int A(t)\,dt+C,
$$

where $C$ is a constant matrix. Each entry can have an independent constant.

</details>

<details open>
<summary><strong>Common Mistake: Treating An Eigenvalue As A Vector</strong></summary>

An eigenvalue $\lambda$ is a scalar. An eigenvector $\mathbf{v}$ is a nonzero
vector. They are linked by:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

The equation does not say $A\lambda=\mathbf{v}$ or
$A\mathbf{v}=\mathbf{v}$ unless $\lambda=1$.

</details>

<details open>
<summary><strong>Common Mistake: Reading Multiplicity From A Matrix Entry</strong></summary>

Algebraic multiplicity comes from the exponent of a factor in the
characteristic polynomial.

If:

$$
p_A(\lambda)=(\lambda-4)^3(\lambda+2),
$$

then $\lambda=4$ has algebraic multiplicity $3$. Repeated appearances of the
number $4$ among the matrix entries would not establish that fact.

</details>

<details open>
<summary><strong>Common Mistake: Substituting A Scalar Constant Into Cayley-Hamilton</strong></summary>

If:

$$
p_A(\lambda)=\lambda^2-5\lambda+6,
$$

then:

$$
p_A(A)=A^2-5A+6I.
$$

The final term is $6I$, because it must be a matrix. Writing
$A^2-5A+6$ tries to add a scalar directly to matrices.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

The Cayley-Hamilton theorem states:

$$
p_A(A)=0.
$$

It turns the characteristic polynomial into a matrix identity. That identity
can verify a calculation, reduce high powers, and later simplify functions of
matrices. Reliable work begins with dimensions, preserves factor order, and
keeps scalar, vector, and matrix objects distinct.

</details>

<!-- print-page-break -->

## Block 8: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Read Entries And Form A Transpose

Suppose:

$$
A=
\begin{bmatrix}
2&a&-1\\
b&4&0
\end{bmatrix}
=
\begin{bmatrix}
2&5&-1\\
-3&4&0
\end{bmatrix}.
$$

Find $a$ and $b$, state the dimensions of $A$, and write $A^{\mathsf T}$.

### Problem 2: Calculate A Linear Combination

Let:

$$
A=
\begin{bmatrix}
1&-2&3\\
4&0&-1
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
-2&5&1\\
3&-1&2
\end{bmatrix}.
$$

Find $2A-3B$.

### Problem 3: Test Product Dimensions

Suppose:

$$
A:3\times2,
\qquad
B:2\times4,
\qquad
C:4\times3.
$$

For each expression, state whether it is defined. If it is defined, state its
dimensions:

$$
AB,\qquad BA,\qquad BC,\qquad CA,\qquad AC,\qquad (AB)C.
$$

### Problem 4: Calculate A Rectangular Product

Let:

$$
P=
\begin{bmatrix}
2&-1&3\\
0&4&1
\end{bmatrix},
\qquad
Q=
\begin{bmatrix}
1&2\\
-2&0\\
3&-1
\end{bmatrix}.
$$

Find $PQ$. Show the row-column calculation for every entry.

### Problem 5: Compare Both Product Orders

Let:

$$
A=
\begin{bmatrix}
1&2\\
0&-1
\end{bmatrix},
\qquad
B=
\begin{bmatrix}
3&0\\
4&2
\end{bmatrix}.
$$

Find $AB$ and $BA$. Use the results to decide whether these matrices commute.

### Problem 6: Multiply A Matrix By A Vector

Let:

$$
M=
\begin{bmatrix}
2&1&-1\\
0&3&2
\end{bmatrix},
\qquad
\mathbf{x}=
\begin{bmatrix}
1\\
-2\\
4
\end{bmatrix}.
$$

Find $M\mathbf{x}$ by row-column multiplication. Then reproduce the result as a
linear combination of the columns of $M$.

### Problem 7: Calculate Matrix Powers

Let:

$$
A=
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}.
$$

Find $A^2$ and $A^3$. Explain briefly why squaring each entry would not produce
$A^2$.

### Problem 8: Differentiate And Integrate A Matrix

Let:

$$
A(t)=
\begin{bmatrix}
t^3&\cos t\\
e^{-t}&2t-1
\end{bmatrix}.
$$

Find:

$$
A'(t)
$$

and:

$$
\int_0^1A(t)\,dt.
$$

### Problem 9: Use The Matrix Product Rule

Let:

$$
A(t)=
\begin{bmatrix}
t&1\\
0&t
\end{bmatrix},
\qquad
B(t)=
\begin{bmatrix}
e^t&0\\
t&1
\end{bmatrix}.
$$

Use:

$$
(AB)'=A'B+AB'
$$

to find $\dfrac{d}{dt}[A(t)B(t)]$. Then check the result by multiplying $AB$
first and differentiating afterward.

### Problem 10: Find Eigenvalues And Eigenvectors

Let:

$$
C=
\begin{bmatrix}
5&2\\
2&2
\end{bmatrix}.
$$

Find the characteristic polynomial, both eigenvalues, and one eigenvector for
each eigenvalue.

### Problem 11: Read Multiplicity From A Triangular Matrix

Let:

$$
T=
\begin{bmatrix}
4&2&0\\
0&4&-1\\
0&0&-3
\end{bmatrix}.
$$

Find the characteristic polynomial and list each eigenvalue with its algebraic
multiplicity.

### Problem 12: Verify Cayley-Hamilton And Reduce A Power

Let:

$$
D=
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix}.
$$

1. Find $p_D(\lambda)=\det(\lambda I-D)$.
2. Verify $p_D(D)=0$.
3. Use the resulting matrix identity to find $D^4$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

Two matrices are equal when corresponding entries are equal.

Compare the row $1$, column $2$ entries:

$$
a=5.
$$

Compare the row $2$, column $1$ entries:

$$
b=-3.
$$

The matrix has two rows and three columns, so:

$$
\boxed{A\text{ is }2\times3}.
$$

Substitute $a=5$ and $b=-3$:

$$
A=
\begin{bmatrix}
2&5&-1\\
-3&4&0
\end{bmatrix}.
$$

To transpose $A$, turn each row into a column. The first row becomes:

$$
\begin{bmatrix}
2\\
5\\
-1
\end{bmatrix},
$$

and the second row becomes:

$$
\begin{bmatrix}
-3\\
4\\
0
\end{bmatrix}.
$$

Placing the two row vectors of $A$ into columns gives:

$$
\boxed{
A^{\mathsf T}=
\begin{bmatrix}
2&-3\\
5&4\\
-1&0
\end{bmatrix}
}.
$$

The transpose has dimensions $3\times2$.

### Answer 2

The requested expression is:

$$
2A-3B.
$$

First multiply every entry of $A$ by $2$:

$$
\begin{aligned}
2A
&=
2
\begin{bmatrix}
1&-2&3\\
4&0&-1
\end{bmatrix}\\
&=
\begin{bmatrix}
2&-4&6\\
8&0&-2
\end{bmatrix}.
\end{aligned}
$$

Now multiply every entry of $B$ by $3$:

$$
\begin{aligned}
3B
&=
3
\begin{bmatrix}
-2&5&1\\
3&-1&2
\end{bmatrix}\\
&=
\begin{bmatrix}
-6&15&3\\
9&-3&6
\end{bmatrix}.
\end{aligned}
$$

Subtract corresponding entries:

$$
\begin{aligned}
2A-3B
&=
\begin{bmatrix}
2-(-6)&-4-15&6-3\\
8-9&0-(-3)&-2-6
\end{bmatrix}\\
&=
\begin{bmatrix}
8&-19&3\\
-1&3&-8
\end{bmatrix}.
\end{aligned}
$$

The completed calculation of $2A-3B$ gives:

$$
\boxed{
2A-3B=
\begin{bmatrix}
8&-19&3\\
-1&3&-8
\end{bmatrix}
}.
$$

### Answer 3

A product:

$$
(m\times n)(r\times p)
$$

is defined only when the inner dimensions match:

$$
n=r.
$$

When it is defined, the answer has dimensions $m\times p$.

For $AB$:

$$
(3\times2)(2\times4).
$$

The inner dimensions are both $2$, so:

$$
\boxed{AB\text{ is defined and is }3\times4}.
$$

For $BA$:

$$
(2\times4)(3\times2).
$$

The inner dimensions are $4$ and $3$, so:

$$
\boxed{BA\text{ is not defined}}.
$$

For $BC$:

$$
(2\times4)(4\times3).
$$

The inner dimensions are both $4$, so:

$$
\boxed{BC\text{ is defined and is }2\times3}.
$$

For $CA$:

$$
(4\times3)(3\times2).
$$

The inner dimensions are both $3$, so:

$$
\boxed{CA\text{ is defined and is }4\times2}.
$$

For $AC$:

$$
(3\times2)(4\times3).
$$

The inner dimensions are $2$ and $4$, so:

$$
\boxed{AC\text{ is not defined}}.
$$

Finally, $AB$ has dimensions $3\times4$. Therefore:

$$
(AB)C
\quad\text{has dimensions}\quad
(3\times4)(4\times3).
$$

The inner dimensions match, so:

$$
\boxed{(AB)C\text{ is defined and is }3\times3}.
$$

### Answer 4

The dimensions are:

$$
P:2\times3,
\qquad
Q:3\times2.
$$

Therefore $PQ$ is defined and will be $2\times2$.

For row $1$, column $1$:

$$
\begin{aligned}
(PQ)_{11}
&=2(1)+(-1)(-2)+3(3)\\
&=2+2+9\\
&=13.
\end{aligned}
$$

For row $1$, column $2$:

$$
\begin{aligned}
(PQ)_{12}
&=2(2)+(-1)(0)+3(-1)\\
&=4+0-3\\
&=1.
\end{aligned}
$$

For row $2$, column $1$:

$$
\begin{aligned}
(PQ)_{21}
&=0(1)+4(-2)+1(3)\\
&=0-8+3\\
&=-5.
\end{aligned}
$$

For row $2$, column $2$:

$$
\begin{aligned}
(PQ)_{22}
&=0(2)+4(0)+1(-1)\\
&=0+0-1\\
&=-1.
\end{aligned}
$$

Place these entries in their corresponding positions:

$$
\boxed{
PQ=
\begin{bmatrix}
13&1\\
-5&-1
\end{bmatrix}
}.
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Both matrices are $2\times2$, so both $AB$ and $BA$ are defined.

Calculate $AB$:

$$
\begin{aligned}
AB
&=
\begin{bmatrix}
1&2\\
0&-1
\end{bmatrix}
\begin{bmatrix}
3&0\\
4&2
\end{bmatrix}\\
&=
\begin{bmatrix}
1(3)+2(4)&1(0)+2(2)\\
0(3)+(-1)(4)&0(0)+(-1)(2)
\end{bmatrix}\\
&=
\begin{bmatrix}
11&4\\
-4&-2
\end{bmatrix}.
\end{aligned}
$$

Now reverse the order:

$$
\begin{aligned}
BA
&=
\begin{bmatrix}
3&0\\
4&2
\end{bmatrix}
\begin{bmatrix}
1&2\\
0&-1
\end{bmatrix}\\
&=
\begin{bmatrix}
3(1)+0(0)&3(2)+0(-1)\\
4(1)+2(0)&4(2)+2(-1)
\end{bmatrix}\\
&=
\begin{bmatrix}
3&6\\
4&6
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
AB=
\begin{bmatrix}
11&4\\
-4&-2
\end{bmatrix}
\ne
\begin{bmatrix}
3&6\\
4&6
\end{bmatrix}
=BA
}.
$$

The matrices do not commute.

### Answer 6

The dimensions are:

$$
M:2\times3,
\qquad
\mathbf{x}:3\times1.
$$

Therefore $M\mathbf{x}$ is defined and will be $2\times1$.

Use the first row of $M$ for the first output entry:

$$
\begin{aligned}
(M\mathbf{x})_1
&=2(1)+1(-2)+(-1)(4)\\
&=2-2-4\\
&=-4.
\end{aligned}
$$

Use the second row for the second output entry:

$$
\begin{aligned}
(M\mathbf{x})_2
&=0(1)+3(-2)+2(4)\\
&=0-6+8\\
&=2.
\end{aligned}
$$

The row-column calculation gives:

$$
\boxed{
M\mathbf{x}=
\begin{bmatrix}
-4\\
2
\end{bmatrix}
}.
$$

Now write the columns of $M$ as:

$$
\mathbf{m}_1=
\begin{bmatrix}
2\\
0
\end{bmatrix},
\qquad
\mathbf{m}_2=
\begin{bmatrix}
1\\
3
\end{bmatrix},
\qquad
\mathbf{m}_3=
\begin{bmatrix}
-1\\
2
\end{bmatrix}.
$$

The entries of $\mathbf{x}$ are $1$, $-2$, and $4$. Therefore:

$$
M\mathbf{x}
=
1\mathbf{m}_1-2\mathbf{m}_2+4\mathbf{m}_3.
$$

Substitute the columns:

$$
\begin{aligned}
M\mathbf{x}
&=
1
\begin{bmatrix}
2\\
0
\end{bmatrix}
-2
\begin{bmatrix}
1\\
3
\end{bmatrix}
+4
\begin{bmatrix}
-1\\
2
\end{bmatrix}\\
&=
\begin{bmatrix}
2\\
0
\end{bmatrix}
+
\begin{bmatrix}
-2\\
-6
\end{bmatrix}
+
\begin{bmatrix}
-4\\
8
\end{bmatrix}\\
&=
\begin{bmatrix}
-4\\
2
\end{bmatrix}.
\end{aligned}
$$

The column-combination interpretation gives the same result.

### Answer 7

A matrix power uses matrix multiplication:

$$
A^2=AA.
$$

Substitute:

$$
A=
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}.
$$

Then:

$$
\begin{aligned}
A^2
&=
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}\\
&=
\begin{bmatrix}
2(2)+1(0)&2(1)+1(2)\\
0(2)+2(0)&0(1)+2(2)
\end{bmatrix}\\
&=
\begin{bmatrix}
4&4\\
0&4
\end{bmatrix}.
\end{aligned}
$$

The matrix product $AA$ gives:

$$
\boxed{
A^2=
\begin{bmatrix}
4&4\\
0&4
\end{bmatrix}
}.
$$

Now use:

$$
A^3=A^2A.
$$

Substitute the calculated $A^2$ and the original $A$:

$$
\begin{aligned}
A^3
&=
\begin{bmatrix}
4&4\\
0&4
\end{bmatrix}
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}\\
&=
\begin{bmatrix}
4(2)+4(0)&4(1)+4(2)\\
0(2)+4(0)&0(1)+4(2)
\end{bmatrix}\\
&=
\begin{bmatrix}
8&12\\
0&8
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
A^3=
\begin{bmatrix}
8&12\\
0&8
\end{bmatrix}
}.
$$

Entrywise squaring would produce:

$$
\begin{bmatrix}
4&1\\
0&4
\end{bmatrix},
$$

which differs from $A^2$. The notation $A^2$ means $AA$.

### Answer 8

Differentiate each entry of:

$$
A(t)=
\begin{bmatrix}
t^3&\cos t\\
e^{-t}&2t-1
\end{bmatrix}.
$$

The entrywise derivative is:

$$
\begin{aligned}
A'(t)
&=
\begin{bmatrix}
\dfrac{d}{dt}(t^3)&\dfrac{d}{dt}(\cos t)\\
\dfrac{d}{dt}(e^{-t})&\dfrac{d}{dt}(2t-1)
\end{bmatrix}\\
&=
\begin{bmatrix}
3t^2&-\sin t\\
-e^{-t}&2
\end{bmatrix}.
\end{aligned}
$$

Thus:

$$
\boxed{
A'(t)=
\begin{bmatrix}
3t^2&-\sin t\\
-e^{-t}&2
\end{bmatrix}
}.
$$

For the definite integral, integrate each entry from $0$ to $1$:

$$
\int_0^1A(t)\,dt
=
\begin{bmatrix}
\int_0^1t^3\,dt&\int_0^1\cos t\,dt\\
\int_0^1e^{-t}\,dt&\int_0^1(2t-1)\,dt
\end{bmatrix}.
$$

Calculate the top-left entry:

$$
\begin{aligned}
\int_0^1t^3\,dt
&=\left[\frac{t^4}{4}\right]_0^1\\
&=\frac14.
\end{aligned}
$$

Calculate the top-right entry:

$$
\begin{aligned}
\int_0^1\cos t\,dt
&=[\sin t]_0^1\\
&=\sin1.
\end{aligned}
$$

Calculate the bottom-left entry:

$$
\begin{aligned}
\int_0^1e^{-t}\,dt
&=[-e^{-t}]_0^1\\
&=-e^{-1}-(-1)\\
&=1-e^{-1}.
\end{aligned}
$$

Calculate the bottom-right entry:

$$
\begin{aligned}
\int_0^1(2t-1)\,dt
&=[t^2-t]_0^1\\
&=(1-1)-(0-0)\\
&=0.
\end{aligned}
$$

Place the four results in their original positions:

$$
\boxed{
\int_0^1A(t)\,dt
=
\begin{bmatrix}
\dfrac14&\sin1\\
1-e^{-1}&0
\end{bmatrix}
}.
$$

A definite integral does not require an arbitrary constant matrix.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

The product rule is:

$$
(AB)'=A'B+AB'.
$$

Differentiate $A(t)$ entry by entry:

$$
A'(t)=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

Differentiate $B(t)$ entry by entry:

$$
B'(t)=
\begin{bmatrix}
e^t&0\\
1&0
\end{bmatrix}.
$$

Calculate the first product-rule term:

$$
\begin{aligned}
A'B
&=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}
\begin{bmatrix}
e^t&0\\
t&1
\end{bmatrix}\\
&=
\begin{bmatrix}
e^t&0\\
t&1
\end{bmatrix}.
\end{aligned}
$$

Calculate the second term:

$$
\begin{aligned}
AB'
&=
\begin{bmatrix}
t&1\\
0&t
\end{bmatrix}
\begin{bmatrix}
e^t&0\\
1&0
\end{bmatrix}\\
&=
\begin{bmatrix}
te^t+1&0\\
t&0
\end{bmatrix}.
\end{aligned}
$$

Add corresponding entries:

$$
\begin{aligned}
A'B+AB'
&=
\begin{bmatrix}
e^t&0\\
t&1
\end{bmatrix}
+
\begin{bmatrix}
te^t+1&0\\
t&0
\end{bmatrix}\\
&=
\begin{bmatrix}
(t+1)e^t+1&0\\
2t&1
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
\frac{d}{dt}[A(t)B(t)]
=
\begin{bmatrix}
(t+1)e^t+1&0\\
2t&1
\end{bmatrix}
}.
$$

To check, multiply first:

$$
\begin{aligned}
A(t)B(t)
&=
\begin{bmatrix}
t&1\\
0&t
\end{bmatrix}
\begin{bmatrix}
e^t&0\\
t&1
\end{bmatrix}\\
&=
\begin{bmatrix}
te^t+t&1\\
t^2&t
\end{bmatrix}.
\end{aligned}
$$

Differentiate the product entry by entry:

$$
\frac{d}{dt}[AB]
=
\begin{bmatrix}
(t+1)e^t+1&0\\
2t&1
\end{bmatrix}.
$$

The two methods agree.

### Answer 10

The characteristic polynomial is:

$$
p_C(\lambda)=\det(\lambda I-C).
$$

Construct the matrix:

$$
\lambda I-C
=
\begin{bmatrix}
\lambda-5&-2\\
-2&\lambda-2
\end{bmatrix}.
$$

Take its determinant:

$$
\begin{aligned}
p_C(\lambda)
&=(\lambda-5)(\lambda-2)-(-2)(-2)\\
&=(\lambda-5)(\lambda-2)-4.
\end{aligned}
$$

Expand:

$$
\begin{aligned}
p_C(\lambda)
&=\lambda^2-7\lambda+10-4\\
&=\lambda^2-7\lambda+6.
\end{aligned}
$$

Factor:

$$
p_C(\lambda)=(\lambda-6)(\lambda-1).
$$

Therefore:

$$
\boxed{\lambda_1=6,\qquad\lambda_2=1}.
$$

For $\lambda=6$, solve:

$$
(C-6I)\mathbf{v}=0.
$$

The coefficient matrix is:

$$
C-6I=
\begin{bmatrix}
-1&2\\
2&-4
\end{bmatrix}.
$$

The first row gives:

$$
-v_1+2v_2=0.
$$

Hence:

$$
v_1=2v_2.
$$

Choose $v_2=1$, which gives $v_1=2$. One eigenvector is:

$$
\boxed{
\mathbf{v}_1=
\begin{bmatrix}
2\\
1
\end{bmatrix}
}.
$$

Check:

$$
\begin{aligned}
C\mathbf{v}_1
&=
\begin{bmatrix}
5&2\\
2&2
\end{bmatrix}
\begin{bmatrix}
2\\
1
\end{bmatrix}\\
&=
\begin{bmatrix}
12\\
6
\end{bmatrix}\\
&=
6
\begin{bmatrix}
2\\
1
\end{bmatrix}.
\end{aligned}
$$

For $\lambda=1$, solve:

$$
(C-I)\mathbf{v}=0.
$$

The coefficient matrix is:

$$
C-I=
\begin{bmatrix}
4&2\\
2&1
\end{bmatrix}.
$$

The second row gives:

$$
2v_1+v_2=0.
$$

Therefore:

$$
v_2=-2v_1.
$$

Choose $v_1=1$, so one eigenvector is:

$$
\boxed{
\mathbf{v}_2=
\begin{bmatrix}
1\\
-2
\end{bmatrix}
}.
$$

Check:

$$
\begin{aligned}
C\mathbf{v}_2
&=
\begin{bmatrix}
5&2\\
2&2
\end{bmatrix}
\begin{bmatrix}
1\\
-2
\end{bmatrix}\\
&=
\begin{bmatrix}
1\\
-2
\end{bmatrix}\\
&=
1
\begin{bmatrix}
1\\
-2
\end{bmatrix}.
\end{aligned}
$$

### Answer 11

The characteristic polynomial is:

$$
p_T(\lambda)=\det(\lambda I-T).
$$

Construct:

$$
\lambda I-T
=
\begin{bmatrix}
\lambda-4&-2&0\\
0&\lambda-4&1\\
0&0&\lambda+3
\end{bmatrix}.
$$

This matrix is triangular. Its determinant is the product of its diagonal
entries:

$$
\begin{aligned}
p_T(\lambda)
&=(\lambda-4)(\lambda-4)(\lambda+3)\\
&=(\lambda-4)^2(\lambda+3).
\end{aligned}
$$

Therefore:

$$
\boxed{\lambda=4\text{ has algebraic multiplicity }2}
$$

and:

$$
\boxed{\lambda=-3\text{ has algebraic multiplicity }1}.
$$

The off-diagonal entries do not change the fact that a triangular matrix's
eigenvalues are its diagonal entries.

### Answer 12

The characteristic polynomial is:

$$
p_D(\lambda)=\det(\lambda I-D).
$$

For:

$$
D=
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix},
$$

construct:

$$
\lambda I-D
=
\begin{bmatrix}
\lambda&-2\\
-1&\lambda-3
\end{bmatrix}.
$$

Take the determinant:

$$
\begin{aligned}
p_D(\lambda)
&=\lambda(\lambda-3)-(-2)(-1)\\
&=\lambda^2-3\lambda-2.
\end{aligned}
$$

Thus:

$$
\boxed{p_D(\lambda)=\lambda^2-3\lambda-2}.
$$

Cayley-Hamilton predicts:

$$
D^2-3D-2I=0.
$$

Calculate $D^2$:

$$
\begin{aligned}
D^2
&=
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix}
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix}\\
&=
\begin{bmatrix}
0(0)+2(1)&0(2)+2(3)\\
1(0)+3(1)&1(2)+3(3)
\end{bmatrix}\\
&=
\begin{bmatrix}
2&6\\
3&11
\end{bmatrix}.
\end{aligned}
$$

Calculate $3D$:

$$
3D=
\begin{bmatrix}
0&6\\
3&9
\end{bmatrix}.
$$

Subtract:

$$
\begin{aligned}
D^2-3D
&=
\begin{bmatrix}
2&6\\
3&11
\end{bmatrix}
-
\begin{bmatrix}
0&6\\
3&9
\end{bmatrix}\\
&=
\begin{bmatrix}
2&0\\
0&2
\end{bmatrix}\\
&=2I.
\end{aligned}
$$

Subtract $2I$ from both sides:

$$
\boxed{D^2-3D-2I=0}.
$$

Rearrange the verified identity:

$$
D^2=3D+2I.
$$

Multiply both sides by $D$:

$$
D^3=3D^2+2D.
$$

Replace $D^2$ with $3D+2I$:

$$
\begin{aligned}
D^3
&=3(3D+2I)+2D\\
&=9D+6I+2D\\
&=11D+6I.
\end{aligned}
$$

Multiply by $D$ again:

$$
D^4=11D^2+6D.
$$

Replace $D^2$ once more:

$$
\begin{aligned}
D^4
&=11(3D+2I)+6D\\
&=33D+22I+6D\\
&=39D+22I.
\end{aligned}
$$

Insert $D$ and $I$:

$$
\begin{aligned}
D^4
&=
39
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix}
+
22
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}\\
&=
\begin{bmatrix}
0&78\\
39&117
\end{bmatrix}
+
\begin{bmatrix}
22&0\\
0&22
\end{bmatrix}\\
&=
\begin{bmatrix}
22&78\\
39&139
\end{bmatrix}.
\end{aligned}
$$

Therefore:

$$
\boxed{
D^4=
\begin{bmatrix}
22&78\\
39&139
\end{bmatrix}
}.
$$

</details>

<details open>
<summary><strong>Chapter 15 Final Summary</strong></summary>


An $m\times n$ matrix has $m$ rows and $n$ columns, and $a_{ij}$ denotes its
row $i$, column $j$ entry.

The core compatibility rules are:

$$
\begin{aligned}
A+B&=[a_{ij}+b_{ij}]
&&\text{when the dimensions match},\\
(m\times n)(n\times p)&\longrightarrow m\times p,\\
(AB)_{ij}&=\sum_{k=1}^{n}a_{ik}b_{kj}.
\end{aligned}
$$

Matrix multiplication is associative and distributive, but generally
$AB\ne BA$. For square matrices and matrix-valued functions:

$$
\begin{aligned}
A^0&=I,
&
A^n&=\underbrace{AA\cdots A}_{n\text{ factors}},\\
A'&=[a_{ij}'],
&
\int A\,dt&=\left[\int a_{ij}\,dt\right]+C,\\
(AB)'&=A'B+AB'. &&
\end{aligned}
$$

Using the monic characteristic-polynomial convention:

$$
p_A(\lambda)=\det(\lambda I-A).
$$

Its roots are eigenvalues. An associated nonzero eigenvector satisfies:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

The Cayley-Hamilton theorem converts that scalar polynomial into the matrix
identity:

$$
p_A(A)=0.
$$

This identity can reduce higher matrix powers.

The chapter's central lesson is:

> begin with dimensions, preserve factor order, and identify whether each
> object is a scalar, vector, or matrix before applying an algebraic rule.

</details>
