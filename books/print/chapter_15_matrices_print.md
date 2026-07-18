```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 15}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Matrices}
```
# Chapter 15 - Matrices

The preceding chapters studied one unknown function at a time. Later chapters
will place several unknown functions into a single vector and write their
differential equations as one matrix equation.

A matrix is more than a rectangular storage box. Its dimensions determine
which operations are legal, and its multiplication rule describes how several
quantities interact.

The main questions are:

-   how are rows, columns, entries, and vectors described precisely?
-   when can matrices be added or multiplied?
-   why is matrix multiplication based on rows and columns?
-   why can changing the order of a product change the answer?
-   how are powers and the identity matrix defined?
-   how are matrices containing functions differentiated and integrated?
-   how does a determinant produce a characteristic polynomial?
-   what do eigenvalues and eigenvectors say about a matrix?
-   how does the Cayley-Hamilton theorem reduce high matrix powers?

All examples, equations, and exercises in this chapter are independently
constructed. The reference text is used only to identify the mathematical
topics.

```{=latex}
\Needspace{20\baselineskip}
```
## Reading Matrix Notation {#block-1-reading-matrix-notation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to read a matrix unambiguously. Before performing an operation, the
reader should be able to state the matrix's size and locate any requested
entry.

```{=latex}
\Needspace{12\baselineskip}
```
### Rows, Columns, And Dimensions {#rows-columns-and-dimensions-2}

```{=latex}
\Needspace{10\baselineskip}
```
A matrix is a rectangular arrangement of entries. For example:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

Matrix $A$ has:

-   two horizontal rows
-   three vertical columns

```{=latex}
\Needspace{10\baselineskip}
```
Its dimensions are therefore:

$$
\boxed{2\times3}.
$$

The order matters. A $2\times3$ matrix has two rows and three columns, not
three rows and two columns.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> dimensions are the first compatibility check for every matrix operation.

```{=latex}
\Needspace{12\baselineskip}
```
### Entry Notation {#entry-notation-3}

```{=latex}
\Needspace{10\baselineskip}
```
For a matrix $A$, the symbol $a_{ij}$ denotes the entry in:

$$
\text{row }i,\qquad \text{column }j.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The entry in row $1$, column $3$ is:

$$
\boxed{a_{13}=4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The entry in row $2$, column $1$ is:

$$
\boxed{a_{21}=0}.
$$

The first index always names the row. The second index always names the
column.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Form {#the-general-form-4}

```{=latex}
\Needspace{10\baselineskip}
```
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

-   $m$ counts rows
-   $n$ counts columns
-   $a_{ij}$ is the entry in row $i$, column $j$

If $m=n$, the matrix is **square**. A square matrix has the same number of rows
and columns.

```{=latex}
\Needspace{12\baselineskip}
```
### When Two Matrices Are Equal {#when-two-matrices-are-equal-5}

Two matrices are equal only when both conditions hold:

1.  they have the same dimensions;
2.  every pair of corresponding entries is equal.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Equality of the top-left entries gives:

$$
x+1=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$ from both sides:

$$
x=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equality of the bottom-right entries gives:

$$
y=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the matrices are equal when:

$$
\boxed{x=5,\qquad y=3}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Column Vectors And Row Vectors {#column-vectors-and-row-vectors-6}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
A matrix with one row is a **row vector**:

$$
\mathbf{r}=
\begin{bmatrix}
r_1&r_2&r_3
\end{bmatrix}.
$$

Its dimensions are $1\times3$.

```{=latex}
\Needspace{10\baselineskip}
```
These contain the same number of entries, but they do not have the same shape:

$$
3\times1\ne1\times3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In systems of differential equations, unknowns are usually collected into a
column vector such as:

$$
\mathbf{x}(t)=
\begin{bmatrix}
x_1(t)\\
x_2(t)
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Zero, Diagonal, And Identity Matrices {#zero-diagonal-and-identity-matrices-7}

```{=latex}
\Needspace{10\baselineskip}
```
A **zero matrix** has zero in every position. Its dimensions must still be
specified. For example:

$$
0_{2\times3}=
\begin{bmatrix}
0&0&0\\
0&0&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A **diagonal matrix** is square and has zero away from its main diagonal:

$$
D=
\begin{bmatrix}
4&0&0\\
0&-2&0\\
0&0&7
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Transpose {#the-transpose-8}

The transpose of $A$, written $A^{\mathsf T}$, turns rows into columns.

```{=latex}
\Needspace{10\baselineskip}
```
Start with:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-9}

```{=latex}
\Needspace{10\baselineskip}
```
For an $m\times n$ matrix:

$$
a_{ij}
=
\text{entry in row }i\text{ and column }j.
$$

Dimensions are written as rows by columns. Vectors are one-row or one-column
matrices, square matrices have equal row and column counts, and transposition
interchanges rows with columns.

```{=latex}
\Needspace{20\baselineskip}
```
## Addition And Scalar Multiplication {#block-2-addition-and-scalar-multiplication}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-10}

The goal is to combine matrices entry by entry and to distinguish this process
from matrix multiplication.

```{=latex}
\Needspace{12\baselineskip}
```
### The Size Rule For Addition {#the-size-rule-for-addition-11}

Matrices can be added only when they have the same dimensions.

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
A=[a_{ij}],
\qquad
B=[b_{ij}]
$$

```{=latex}
\Needspace{10\baselineskip}
```
are both $m\times n$, then:

$$
\boxed{A+B=[a_{ij}+b_{ij}]}.
$$

Each entry is added only to the entry occupying the same position.

A $2\times3$ matrix cannot be added to a $3\times2$ matrix. Having the same
number of entries is not enough; the shapes must match.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Addition Example {#a-complete-addition-example-12}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Scalar Multiplication {#scalar-multiplication-13}

A scalar is a single number or scalar-valued function. Multiplying a matrix by
a scalar multiplies every entry.

```{=latex}
\Needspace{10\baselineskip}
```
Using:

$$
A=
\begin{bmatrix}
2&-1&4\\
0&3&5
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Matrix Linear Combination {#a-matrix-linear-combination-14}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
First calculate $3A$:

$$
3A=
\begin{bmatrix}
6&-3&12\\
0&9&15
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate $2B$:

$$
2B=
\begin{bmatrix}
-6&12&2\\
14&-4&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Additive Properties {#additive-properties-15}

```{=latex}
\Needspace{10\baselineskip}
```
For matrices of compatible dimensions:

$$
A+B=B+A
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
(A+B)+C=A+(B+C).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The zero matrix is the additive identity:

$$
A+0=A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrix $-A$ is formed by negating every entry, so:

$$
A+(-A)=0.
$$

These properties work because matrix addition is ordinary addition performed
independently in each position.

```{=latex}
\Needspace{12\baselineskip}
```
### A Useful Vector Interpretation {#a-useful-vector-interpretation-16}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
First:

$$
2\mathbf{u}=
\begin{bmatrix}
2\\
-4\\
8
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> vector linear combinations use the same entrywise addition and scalar
> multiplication rules as all other matrices.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-17}

```{=latex}
\Needspace{10\baselineskip}
```
Addition requires equal dimensions:

$$
A+B=[a_{ij}+b_{ij}].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Scalar multiplication affects every entry:

$$
\alpha A=[\alpha a_{ij}].
$$

Both operations preserve the dimensions of the matrices involved.

```{=latex}
\Needspace{20\baselineskip}
```
## Matrix Multiplication {#block-3-matrix-multiplication}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-18}

The goal is to make row-by-column multiplication predictable rather than
mysterious. The dimension test will be applied before any arithmetic begins.

```{=latex}
\Needspace{12\baselineskip}
```
### The Inner-Dimension Test {#the-inner-dimension-test-19}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
A\text{ is }m\times n
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
B\text{ is }n\times p.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $AB$ is defined because the two inner dimensions match:

$$
(m\times\boxed{n})(\boxed{n}\times p).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product has the two outer dimensions:

$$
\boxed{AB\text{ is }m\times p}.
$$

If the inner dimensions do not match, the product is not defined.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Rows Meet Columns {#why-rows-meet-columns-20}

```{=latex}
\Needspace{10\baselineskip}
```
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

1.  take row $i$ from $A$;
2.  take column $j$ from $B$;
3.  multiply corresponding entries;
4.  add those products.

The matching inner dimension ensures that the selected row and column contain
the same number of entries.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Product Example {#a-complete-product-example-21}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The dimensions are:

$$
A:2\times3,
\qquad
B:3\times2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions match, so:

$$
AB\text{ is }2\times2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Changing The Order Changes The Problem {#changing-the-order-changes-the-problem-22}

```{=latex}
\Needspace{10\baselineskip}
```
For the same matrices:

$$
A:2\times3,
\qquad
B:3\times2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the reverse product has dimensions:

$$
(3\times2)(2\times3).
$$

Therefore $BA$ is defined, but it is $3\times3$, not $2\times2$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Here $AB$ and $BA$ do not even have the same dimensions. In general:

$$
\boxed{AB\ne BA}.
$$

Matrix multiplication is not commutative.

```{=latex}
\Needspace{12\baselineskip}
```
### Matrix Times Vector {#matrix-times-vector-23}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The dimensions are:

$$
(2\times2)(2\times1),
$$

so $M\mathbf{x}$ is a $2\times1$ vector.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Column-Combination Interpretation {#the-column-combination-interpretation-24}

The same product can be understood using the columns of $M$.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\boxed{M\mathbf{x}=x_1\mathbf{m}_1+x_2\mathbf{m}_2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
Another way to see it:

```{=latex}
\Needspace{8\baselineskip}
```
> multiplying by a matrix forms a linear combination of that matrix's
> columns, using the input vector entries as coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Associativity And Distributivity {#associativity-and-distributivity-25}

```{=latex}
\Needspace{10\baselineskip}
```
Whenever the dimensions make all products meaningful:

$$
A(BC)=(AB)C.
$$

Thus matrix multiplication is associative.

```{=latex}
\Needspace{10\baselineskip}
```
It also distributes over addition:

$$
A(B+C)=AB+AC
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
(A+B)C=AC+BC.
$$

The order of factors has not been changed in any of these rules.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-26}

```{=latex}
\Needspace{10\baselineskip}
```
The product:

$$
(m\times n)(n\times p)
$$

```{=latex}
\Needspace{10\baselineskip}
```
is defined and has dimensions:

$$
m\times p.
$$

Each product entry is a row-column dot product. Matrix multiplication is
associative and distributive, but it is not generally commutative.

```{=latex}
\Needspace{20\baselineskip}
```
## Identity Matrices, Powers, And Algebraic Caution {#block-4-identity-matrices-powers-and-algebraic-caution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-27}

The goal is to define powers of square matrices and identify which familiar
algebra rules survive matrix multiplication.

```{=latex}
\Needspace{12\baselineskip}
```
### The Identity Matrix In A Product {#the-identity-matrix-in-a-product-28}

```{=latex}
\Needspace{10\baselineskip}
```
For an $m\times n$ matrix $A$:

$$
I_mA=A
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
AI_n=A.
$$

The identity on the left must have $m$ rows and columns. The identity on the
right must have $n$ rows and columns.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Powers Of A Square Matrix {#powers-of-a-square-matrix-29}

```{=latex}
\Needspace{10\baselineskip}
```
If $A$ is square and $n$ is a positive integer, define:

$$
\boxed{A^n=\underbrace{AA\cdots A}_{n\text{ factors}}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In particular:

$$
A^2=AA,
\qquad
A^3=AAA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The zeroth power is defined by:

$$
\boxed{A^0=I}.
$$

A nonsquare matrix does not have an ordinary square $A^2$, because the inner
dimensions of $AA$ would not match.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Power Example {#a-complete-power-example-30}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix}.
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Matrix Squaring Is Not Entrywise Squaring {#matrix-squaring-is-not-entrywise-squaring-31}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A=
\begin{bmatrix}
1&2\\
0&3
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the actual matrix square is:

$$
A^2=
\begin{bmatrix}
1&8\\
0&9
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> the exponent in $A^2$ means the matrix product $AA$, not entrywise
> exponentiation.

```{=latex}
\Needspace{12\baselineskip}
```
### Expanding A Matrix Square {#expanding-a-matrix-square-32}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
(A+B)^2=(A+B)(A+B).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute without changing the order of any factors:

$$
\begin{aligned}
(A+B)^2
&=A(A+B)+B(A+B)\\
&=A^2+AB+BA+B^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The correct matrix expansion is:

$$
\boxed{(A+B)^2=A^2+AB+BA+B^2}.
$$

For ordinary numbers, $AB=BA$, so the middle terms combine to $2AB$. For
matrices, that combination is valid only when $A$ and $B$ commute.

```{=latex}
\Needspace{12\baselineskip}
```
### Nonzero Matrices Can Multiply To Zero {#nonzero-matrices-can-multiply-to-zero-33}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
This calculation shows that two nonzero matrices can have a zero product:

$$
\boxed{P\ne0,\quad Q\ne0,\quad\text{but}\quad PQ=0}.
$$

This is one reason scalar cancellation habits cannot be imported blindly into
matrix algebra.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-34}

```{=latex}
\Needspace{10\baselineskip}
```
For square matrices:

$$
A^0=I,
\qquad
A^n=\underbrace{AA\cdots A}_{n\text{ factors}}.
$$

Matrix powers use matrix multiplication. Factor order matters, $(A+B)^2$
contains both $AB$ and $BA$, and a product of nonzero matrices can equal the
zero matrix.

```{=latex}
\Needspace{20\baselineskip}
```
## Matrices Whose Entries Are Functions {#block-5-matrices-whose-entries-are-functions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-35}

The goal is to differentiate and integrate matrices entry by entry while
preserving the order of factors in product rules.

```{=latex}
\Needspace{12\baselineskip}
```
### A Matrix-Valued Function {#a-matrix-valued-function-36}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Differentiate Entry By Entry {#differentiate-entry-by-entry-37}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A(t)=[a_{ij}(t)],
$$

```{=latex}
\Needspace{10\baselineskip}
```
define:

$$
\boxed{A'(t)=[a_{ij}'(t)]}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using:

$$
A(t)=
\begin{bmatrix}
t^2&e^t\\
\sin t&3t
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Integrate Entry By Entry {#integrate-entry-by-entry-38}

```{=latex}
\Needspace{10\baselineskip}
```
An indefinite matrix integral is also calculated entry by entry:

$$
\int A(t)\,dt
=
\left[\int a_{ij}(t)\,dt\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### The Matrix Product Rule {#the-matrix-product-rule-39}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Product-Rule Check {#a-complete-product-rule-check-40}

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate this product entry by entry:

$$
\frac{d}{dt}[AB]
=
\begin{bmatrix}
2&2t\\
3t^2&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Matrix Initial-Value Calculation {#a-matrix-initial-value-calculation-41}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
X'(t)=
\begin{bmatrix}
2t&1\\
\cos t&-e^{-t}
\end{bmatrix}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
X(0)=
\begin{bmatrix}
1&-2\\
0&3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate from $0$ to $t$:

$$
X(t)-X(0)=\int_0^tX'(s)\,ds.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Check the initial value by setting $t=0$:

$$
X(0)=
\begin{bmatrix}
1&-2\\
0&3
\end{bmatrix}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-42}

```{=latex}
\Needspace{10\baselineskip}
```
Matrix differentiation and integration are entrywise operations:

$$
A'=[a_{ij}'],
\qquad
\int A\,dt=\left[\int a_{ij}\,dt\right].
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrix product rule is:

$$
(AB)'=A'B+AB',
$$

with factor order preserved. An indefinite matrix integral requires a constant
matrix, not merely one scalar constant.

```{=latex}
\Needspace{20\baselineskip}
```
## Determinants, Eigenvalues, And Eigenvectors {#block-6-determinants-eigenvalues-and-eigenvectors}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-43}

The goal is to build the characteristic polynomial from a determinant and then
interpret its roots as special scaling factors of the matrix.

```{=latex}
\Needspace{12\baselineskip}
```
### The Two-By-Two Determinant {#the-two-by-two-determinant-44}

A determinant is a scalar associated with a square matrix.

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
M=
\begin{bmatrix}
a&b\\
c&d
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the determinant is:

$$
\boxed{\det(M)=ad-bc}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The products use opposite corners:

$$
\text{main-diagonal product}
-
\text{other-diagonal product}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For example, let:

$$
M=
\begin{bmatrix}
3&-2\\
5&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the entries into $ad-bc$:

$$
\begin{aligned}
\det(M)
&=3(1)-(-2)(5)\\
&=3-(-10)\\
&=13.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this matrix, the determinant is:

$$
\boxed{\det(M)=13}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Three-By-Three Determinant {#a-three-by-three-determinant-45}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
M=
\begin{bmatrix}
a&b&c\\
d&e&f\\
g&h&i
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
expansion along the first row gives:

$$
\boxed{
\det(M)
=
a(ei-fh)-b(di-fg)+c(dh-eg)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The cofactor signs across the first row are:

$$
+,\quad-,\quad+.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
M=
\begin{bmatrix}
2&1&0\\
-1&3&2\\
4&0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Simplify each bracket:

$$
\begin{aligned}
\det(M)
&=2(3)-1(-1-8)+0\\
&=6-(-9)\\
&=15.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this matrix, the three-by-three determinant is:

$$
\boxed{\det(M)=15}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Characteristic Polynomial {#the-characteristic-polynomial-46}

Let $A$ be an $n\times n$ matrix, and let $I$ be the $n\times n$ identity
matrix.

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial used in this chapter is:

$$
\boxed{p_A(\lambda)=\det(\lambda I-A)}.
$$

Here $\lambda$ is a scalar variable. The matrix $\lambda I-A$ is formed first,
and its determinant then produces an ordinary polynomial in $\lambda$.

```{=latex}
\Needspace{10\baselineskip}
```
An **eigenvalue** of $A$ is a root of that polynomial:

$$
p_A(\lambda)=0.
$$

Some books define the characteristic polynomial as $\det(A-\lambda I)$. That
convention differs by a factor $(-1)^n$ but gives the same eigenvalues. Mixing
the two conventions halfway through a calculation causes unnecessary sign
errors.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Two-By-Two Eigenvalue Example {#a-complete-two-by-two-eigenvalue-example-47}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Start with the identity matrix:

$$
I=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply it by $\lambda$:

$$
\lambda I=
\begin{bmatrix}
\lambda&0\\
0&\lambda
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $A$ entry by entry:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-4&-2\\
-1&\lambda-3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=
\det(\lambda I-A)\\
&=(\lambda-4)(\lambda-3)-(-2)(-1).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the off-diagonal entries:

$$
(-2)(-1)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substituting this off-diagonal product into the determinant gives:

$$
p_A(\lambda)
=
(\lambda-4)(\lambda-3)-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the brackets:

$$
\begin{aligned}
p_A(\lambda)
&=\lambda^2-7\lambda+12-2\\
&=\lambda^2-7\lambda+10.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the polynomial:

$$
p_A(\lambda)
=
(\lambda-5)(\lambda-2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set the characteristic polynomial equal to zero:

$$
(\lambda-5)(\lambda-2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence the eigenvalues are:

$$
\boxed{\lambda_1=5,\qquad\lambda_2=2}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### What An Eigenvector Adds {#what-an-eigenvector-adds-48}

```{=latex}
\Needspace{10\baselineskip}
```
A nonzero vector $\mathbf{v}$ is an eigenvector associated with $\lambda$ when:

$$
\boxed{A\mathbf{v}=\lambda\mathbf{v}}.
$$

The matrix may change the vector's length or direction sign, but it does not
turn the vector away from its line.

```{=latex}
\Needspace{10\baselineskip}
```
To find an eigenvector, rewrite the equation as:

$$
(A-\lambda I)\mathbf{v}=0.
$$

The requirement $\mathbf{v}\ne0$ matters. The zero vector satisfies
$A\mathbf{0}=\lambda\mathbf{0}$ for every $\lambda$, so it cannot distinguish
one eigenvalue from another.

```{=latex}
\Needspace{12\baselineskip}
```
### Finding The Eigenvectors In The Example {#finding-the-eigenvectors-in-the-example-49}

```{=latex}
\Needspace{10\baselineskip}
```
Continue with:

$$
A=
\begin{bmatrix}
4&2\\
1&3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\lambda=5$:

$$
A-5I
=
\begin{bmatrix}
-1&2\\
1&-2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\mathbf{v}=
\begin{bmatrix}
v_1\\
v_2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then $(A-5I)\mathbf{v}=0$ gives:

$$
-v_1+2v_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $v_1$ to both sides:

$$
2v_2=v_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For $\lambda=2$:

$$
A-2I
=
\begin{bmatrix}
2&2\\
1&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $(A-2I)\mathbf{v}=0$ reduces to:

$$
v_1+v_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Why Eigenvalues Matter For Differential Equations {#why-eigenvalues-matter-for-differential-equations-50}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the future matrix differential equation:

$$
\mathbf{x}'=A\mathbf{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $A\mathbf{v}=\lambda\mathbf{v}$. Try:

$$
\mathbf{x}(t)=e^{\lambda t}\mathbf{v}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
\mathbf{x}'(t)=\lambda e^{\lambda t}\mathbf{v}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Both $\mathbf{x}'$ and $A\mathbf{x}$ equal
$\lambda e^{\lambda t}\mathbf{v}$. Hence the proposed function satisfies:

$$
\mathbf{x}'=A\mathbf{x}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition:

```{=latex}
\Needspace{8\baselineskip}
```
> an eigenvector supplies a fixed direction, while its eigenvalue controls the
> exponential behavior along that direction.

A later chapter will develop this method fully.

```{=latex}
\Needspace{12\baselineskip}
```
### Triangular Matrices And Multiplicity {#triangular-matrices-and-multiplicity-51}

For a triangular matrix, the characteristic polynomial is the product of
$\lambda$ minus the diagonal entries.

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
T=
\begin{bmatrix}
3&1&-2\\
0&-1&4\\
0&0&-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
This is triangular, so its determinant is the product of its diagonal entries:

$$
\begin{aligned}
p_T(\lambda)
&=(\lambda-3)(\lambda+1)(\lambda+1)\\
&=(\lambda-3)(\lambda+1)^2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The factorization $p_T(\lambda)=(\lambda-3)(\lambda+1)^2$ shows that:

$$
\boxed{\lambda=3\text{ has multiplicity }1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\boxed{\lambda=-1\text{ has multiplicity }2}.
$$

The exponent in the characteristic polynomial gives the **algebraic
multiplicity**. It does not automatically tell us how many independent
eigenvectors belong to that eigenvalue.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-52}

```{=latex}
\Needspace{10\baselineskip}
```
Using the monic convention:

$$
p_A(\lambda)=\det(\lambda I-A).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots of $p_A(\lambda)=0$ are the eigenvalues. An associated nonzero vector
satisfies:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

Eigenpairs matter in ODEs because they generate modes of the form
$e^{\lambda t}\mathbf{v}$.

```{=latex}
\Needspace{20\baselineskip}
```
## Cayley-Hamilton And A Reliable Matrix Workflow {#block-7-cayley-hamilton-and-a-reliable-matrix-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-53}

The goal is to understand what it means for a matrix to satisfy its own
characteristic equation and to use that identity to reduce high powers.

```{=latex}
\Needspace{12\baselineskip}
```
### Substituting A Matrix Into A Polynomial {#substituting-a-matrix-into-a-polynomial-54}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
p(\lambda)=\lambda^2-4\lambda+7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replacing the scalar variable $\lambda$ by a square matrix $A$ gives:

$$
p(A)=A^2-4A+7I.
$$

The constant term becomes $7I$, not the scalar $7$, because every term in the
sum must be a matrix of the same dimensions.

```{=latex}
\Needspace{10\baselineskip}
```
More generally, if:

$$
p(\lambda)
=
\lambda^n+c_{n-1}\lambda^{n-1}+\cdots+c_1\lambda+c_0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
p(A)
=
A^n+c_{n-1}A^{n-1}+\cdots+c_1A+c_0I.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Cayley-Hamilton Theorem {#the-cayley-hamilton-theorem-55}

```{=latex}
\Needspace{10\baselineskip}
```
Let $p_A(\lambda)$ be the characteristic polynomial of a square matrix $A$.
The Cayley-Hamilton theorem states:

$$
\boxed{p_A(A)=0}.
$$

The zero on the right is the zero matrix of the same dimensions as $A$.

This does not say that $p_A(\lambda)=0$ for every scalar $\lambda$. It says that
the matrix expression obtained by replacing $\lambda$ with $A$ equals the zero
matrix.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Cayley-Hamilton Verification {#a-complete-cayley-hamilton-verification-56}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A=
\begin{bmatrix}
1&2\\
3&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Construct $\lambda I-A$:

$$
\lambda I-A
=
\begin{bmatrix}
\lambda-1&-2\\
-3&\lambda
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the determinant:

$$
\begin{aligned}
p_A(\lambda)
&=(\lambda-1)\lambda-(-2)(-3)\\
&=\lambda^2-\lambda-6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the characteristic equation is:

$$
\lambda^2-\lambda-6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cayley-Hamilton predicts:

$$
A^2-A-6I=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Write $6I$ explicitly:

$$
6I=
\begin{bmatrix}
6&0\\
0&6
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two displayed matrices are equal, so:

$$
A^2-A=6I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $6I$ from both sides:

$$
\boxed{A^2-A-6I=0}.
$$

This verifies the theorem for the chosen matrix.

```{=latex}
\Needspace{12\baselineskip}
```
### Reducing A High Matrix Power {#reducing-a-high-matrix-power-57}

```{=latex}
\Needspace{10\baselineskip}
```
The verified identity is:

$$
A^2=A+6I.
$$

Use it to find $A^5$ without performing four full matrix multiplications.

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the identity by $A$:

$$
A^3=A(A+6I).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute:

$$
A^3=A^2+6A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $A^2$ by $A+6I$:

$$
\begin{aligned}
A^3
&=(A+6I)+6A\\
&=7A+6I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $A$ again:

$$
A^4=A(7A+6I).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute:

$$
A^4=7A^2+6A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $A^2$:

$$
\begin{aligned}
A^4
&=7(A+6I)+6A\\
&=7A+42I+6A\\
&=13A+42I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $A$ once more:

$$
A^5=A(13A+42I).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute:

$$
A^5=13A^2+42A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $A^2$ by $A+6I$:

$$
\begin{aligned}
A^5
&=13(A+6I)+42A\\
&=13A+78I+42A\\
&=55A+78I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Workflow {#a-reliable-workflow-58}

#### Step 1: Write dimensions beside every matrix

Do this before adding or multiplying.

#### Step 2: Test compatibility

Addition needs identical dimensions. Multiplication needs matching inner
dimensions.

#### Step 3: Predict the output dimensions

For $(m\times n)(n\times p)$, create an empty $m\times p$ result before doing
arithmetic.

#### Step 4: Name the row and column for each product entry

This prevents accidental entrywise multiplication.

#### Step 5: Preserve factor order

Never commute factors unless commutativity has been proved for those matrices.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: For eigenvalues, construct $\lambda I-A$ explicitly

Then take the determinant and solve the resulting scalar polynomial.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: For an eigenvector, solve $(A-\lambda I)\mathbf{v}=0$

Keep the requirement $\mathbf{v}\ne0$ visible.

#### Step 8: For Cayley-Hamilton, convert constants to multiples of $I$

Then verify or reduce powers one substitution at a time.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Multiplying Corresponding Entries {#common-mistake-multiplying-corresponding-entries-59}

Matrix multiplication is not usually entrywise multiplication.

```{=latex}
\Needspace{10\baselineskip}
```
For $AB$, the entry $(AB)_{ij}$ comes from:

$$
\text{row }i\text{ of }A
\quad\text{with}\quad
\text{column }j\text{ of }B.
$$

If corresponding entries are multiplied instead, a different operation has
been performed.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Checking The Outer Dimensions {#common-mistake-checking-the-outer-dimensions-60}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
(m\times n)(r\times p),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the product exists only when:

$$
\boxed{n=r}.
$$

The inner dimensions must match. The outer dimensions $m$ and $p$ describe the
answer; they do not decide whether multiplication is legal.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reversing A Product {#common-mistake-reversing-a-product-61}

From $AB$, one cannot casually move to $BA$.

Possible outcomes include:

-   both products exist but have different values
-   both products exist but have different interpretations
-   one product exists while the other does not
-   both products exist but have different dimensions

Always retest dimensions after reversing the order.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing Constants In A Matrix Integral {#common-mistake-losing-constants-in-a-matrix-integral-62}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
X'(t)=A(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
then an indefinite integration gives:

$$
X(t)=\int A(t)\,dt+C,
$$

where $C$ is a constant matrix. Each entry can have an independent constant.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating An Eigenvalue As A Vector {#common-mistake-treating-an-eigenvalue-as-a-vector-63}

```{=latex}
\Needspace{10\baselineskip}
```
An eigenvalue $\lambda$ is a scalar. An eigenvector $\mathbf{v}$ is a nonzero
vector. They are linked by:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

The equation does not say $A\lambda=\mathbf{v}$ or
$A\mathbf{v}=\mathbf{v}$ unless $\lambda=1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reading Multiplicity From A Matrix Entry {#common-mistake-reading-multiplicity-from-a-matrix-entry-64}

Algebraic multiplicity comes from the exponent of a factor in the
characteristic polynomial.

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
p_A(\lambda)=(\lambda-4)^3(\lambda+2),
$$

then $\lambda=4$ has algebraic multiplicity $3$. Repeated appearances of the
number $4$ among the matrix entries would not establish that fact.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Substituting A Scalar Constant Into Cayley-Hamilton {#common-mistake-substituting-a-scalar-constant-into-cayley-hamilton-65}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
p_A(\lambda)=\lambda^2-5\lambda+6,
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
p_A(A)=A^2-5A+6I.
$$

The final term is $6I$, because it must be a matrix. Writing
$A^2-5A+6$ tries to add a scalar directly to matrices.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-66}

```{=latex}
\Needspace{10\baselineskip}
```
The Cayley-Hamilton theorem states:

$$
p_A(A)=0.
$$

It turns the characteristic polynomial into a matrix identity. That identity
can verify a calculation, reduce high powers, and later simplify functions of
matrices. Reliable work begins with dimensions, preserves factor order, and
keeps scalar, vector, and matrix objects distinct.

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
### Practice Problems {#practice-problems-67}

#### Problem 1: Read Entries And Form A Transpose

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 2: Calculate A Linear Combination

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 3: Test Product Dimensions

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
A:3\times2,
\qquad
B:2\times4,
\qquad
C:4\times3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For each expression, state whether it is defined. If it is defined, state its
dimensions:

$$
AB,\qquad BA,\qquad BC,\qquad CA,\qquad AC,\qquad (AB)C.
$$

#### Problem 4: Calculate A Rectangular Product

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 5: Compare Both Product Orders

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 6: Multiply A Matrix By A Vector

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 7: Calculate Matrix Powers

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 8: Differentiate And Integrate A Matrix

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
A(t)=
\begin{bmatrix}
t^3&\cos t\\
e^{-t}&2t-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Find:

$$
A'(t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\int_0^1A(t)\,dt.
$$

#### Problem 9: Use The Matrix Product Rule

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
(AB)'=A'B+AB'
$$

to find $\dfrac{d}{dt}[A(t)B(t)]$. Then check the result by multiplying $AB$
first and differentiating afterward.

#### Problem 10: Find Eigenvalues And Eigenvectors

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 11: Read Multiplicity From A Triangular Matrix

```{=latex}
\Needspace{10\baselineskip}
```
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

#### Problem 12: Verify Cayley-Hamilton And Reduce A Power

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
D=
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix}.
$$

1.  Find $p_D(\lambda)=\det(\lambda I-D)$.
2.  Verify $p_D(D)=0$.
3.  Use the resulting matrix identity to find $D^4$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-68}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

Two matrices are equal when corresponding entries are equal.

```{=latex}
\Needspace{10\baselineskip}
```
Compare the row $1$, column $2$ entries:

$$
a=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare the row $2$, column $1$ entries:

$$
b=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The matrix has two rows and three columns, so:

$$
\boxed{A\text{ is }2\times3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $a=5$ and $b=-3$:

$$
A=
\begin{bmatrix}
2&5&-1\\
-3&4&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To transpose $A$, turn each row into a column. The first row becomes:

$$
\begin{bmatrix}
2\\
5\\
-1
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and the second row becomes:

$$
\begin{bmatrix}
-3\\
4\\
0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
The requested expression is:

$$
2A-3B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
A product:

$$
(m\times n)(r\times p)
$$

```{=latex}
\Needspace{10\baselineskip}
```
is defined only when the inner dimensions match:

$$
n=r.
$$

When it is defined, the answer has dimensions $m\times p$.

```{=latex}
\Needspace{10\baselineskip}
```
For $AB$:

$$
(3\times2)(2\times4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions are both $2$, so:

$$
\boxed{AB\text{ is defined and is }3\times4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $BA$:

$$
(2\times4)(3\times2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions are $4$ and $3$, so:

$$
\boxed{BA\text{ is not defined}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $BC$:

$$
(2\times4)(4\times3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions are both $4$, so:

$$
\boxed{BC\text{ is defined and is }2\times3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $CA$:

$$
(4\times3)(3\times2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions are both $3$, so:

$$
\boxed{CA\text{ is defined and is }4\times2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $AC$:

$$
(3\times2)(4\times3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions are $2$ and $4$, so:

$$
\boxed{AC\text{ is not defined}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally, $AB$ has dimensions $3\times4$. Therefore:

$$
(AB)C
\quad\text{has dimensions}\quad
(3\times4)(4\times3).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The inner dimensions match, so:

$$
\boxed{(AB)C\text{ is defined and is }3\times3}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The dimensions are:

$$
P:2\times3,
\qquad
Q:3\times2.
$$

Therefore $PQ$ is defined and will be $2\times2$.

```{=latex}
\Needspace{10\baselineskip}
```
For row $1$, column $1$:

$$
\begin{aligned}
(PQ)_{11}
&=2(1)+(-1)(-2)+3(3)\\
&=2+2+9\\
&=13.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For row $1$, column $2$:

$$
\begin{aligned}
(PQ)_{12}
&=2(2)+(-1)(0)+3(-1)\\
&=4+0-3\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For row $2$, column $1$:

$$
\begin{aligned}
(PQ)_{21}
&=0(1)+4(-2)+1(3)\\
&=0-8+3\\
&=-5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For row $2$, column $2$:

$$
\begin{aligned}
(PQ)_{22}
&=0(2)+4(0)+1(-1)\\
&=0+0-1\\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-69}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

Both matrices are $2\times2$, so both $AB$ and $BA$ are defined.

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The dimensions are:

$$
M:2\times3,
\qquad
\mathbf{x}:3\times1.
$$

Therefore $M\mathbf{x}$ is defined and will be $2\times1$.

```{=latex}
\Needspace{10\baselineskip}
```
Use the first row of $M$ for the first output entry:

$$
\begin{aligned}
(M\mathbf{x})_1
&=2(1)+1(-2)+(-1)(4)\\
&=2-2-4\\
&=-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the second row for the second output entry:

$$
\begin{aligned}
(M\mathbf{x})_2
&=0(1)+3(-2)+2(4)\\
&=0-6+8\\
&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
The entries of $\mathbf{x}$ are $1$, $-2$, and $4$. Therefore:

$$
M\mathbf{x}
=
1\mathbf{m}_1-2\mathbf{m}_2+4\mathbf{m}_3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
A matrix power uses matrix multiplication:

$$
A^2=AA.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
A=
\begin{bmatrix}
2&1\\
0&2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Now use:

$$
A^3=A^2A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Entrywise squaring would produce:

$$
\begin{bmatrix}
4&1\\
0&4
\end{bmatrix},
$$

which differs from $A^2$. The notation $A^2$ means $AA$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate each entry of:

$$
A(t)=
\begin{bmatrix}
t^3&\cos t\\
e^{-t}&2t-1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For the definite integral, integrate each entry from $0$ to $1$:

$$
\int_0^1A(t)\,dt
=
\begin{bmatrix}
\int_0^1t^3\,dt&\int_0^1\cos t\,dt\\
\int_0^1e^{-t}\,dt&\int_0^1(2t-1)\,dt
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the top-left entry:

$$
\begin{aligned}
\int_0^1t^3\,dt
&=\left[\frac{t^4}{4}\right]_0^1\\
&=\frac14.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the top-right entry:

$$
\begin{aligned}
\int_0^1\cos t\,dt
&=[\sin t]_0^1\\
&=\sin1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the bottom-left entry:

$$
\begin{aligned}
\int_0^1e^{-t}\,dt
&=[-e^{-t}]_0^1\\
&=-e^{-1}-(-1)\\
&=1-e^{-1}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the bottom-right entry:

$$
\begin{aligned}
\int_0^1(2t-1)\,dt
&=[t^2-t]_0^1\\
&=(1-1)-(0-0)\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-70}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The product rule is:

$$
(AB)'=A'B+AB'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $A(t)$ entry by entry:

$$
A'(t)=
\begin{bmatrix}
1&0\\
0&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $B(t)$ entry by entry:

$$
B'(t)=
\begin{bmatrix}
e^t&0\\
1&0
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial is:

$$
p_C(\lambda)=\det(\lambda I-C).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Construct the matrix:

$$
\lambda I-C
=
\begin{bmatrix}
\lambda-5&-2\\
-2&\lambda-2
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take its determinant:

$$
\begin{aligned}
p_C(\lambda)
&=(\lambda-5)(\lambda-2)-(-2)(-2)\\
&=(\lambda-5)(\lambda-2)-4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
\begin{aligned}
p_C(\lambda)
&=\lambda^2-7\lambda+10-4\\
&=\lambda^2-7\lambda+6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
p_C(\lambda)=(\lambda-6)(\lambda-1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{\lambda_1=6,\qquad\lambda_2=1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\lambda=6$, solve:

$$
(C-6I)\mathbf{v}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient matrix is:

$$
C-6I=
\begin{bmatrix}
-1&2\\
2&-4
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first row gives:

$$
-v_1+2v_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
v_1=2v_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
For $\lambda=1$, solve:

$$
(C-I)\mathbf{v}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient matrix is:

$$
C-I=
\begin{bmatrix}
4&2\\
2&1
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second row gives:

$$
2v_1+v_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
v_2=-2v_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial is:

$$
p_T(\lambda)=\det(\lambda I-T).
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
This matrix is triangular. Its determinant is the product of its diagonal
entries:

$$
\begin{aligned}
p_T(\lambda)
&=(\lambda-4)(\lambda-4)(\lambda+3)\\
&=(\lambda-4)^2(\lambda+3).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{\lambda=4\text{ has algebraic multiplicity }2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\boxed{\lambda=-3\text{ has algebraic multiplicity }1}.
$$

The off-diagonal entries do not change the fact that a triangular matrix's
eigenvalues are its diagonal entries.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic polynomial is:

$$
p_D(\lambda)=\det(\lambda I-D).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
D=
\begin{bmatrix}
0&2\\
1&3
\end{bmatrix},
$$

```{=latex}
\Needspace{10\baselineskip}
```
construct:

$$
\lambda I-D
=
\begin{bmatrix}
\lambda&-2\\
-1&\lambda-3
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the determinant:

$$
\begin{aligned}
p_D(\lambda)
&=\lambda(\lambda-3)-(-2)(-1)\\
&=\lambda^2-3\lambda-2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{p_D(\lambda)=\lambda^2-3\lambda-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cayley-Hamilton predicts:

$$
D^2-3D-2I=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Calculate $3D$:

$$
3D=
\begin{bmatrix}
0&6\\
3&9
\end{bmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2I$ from both sides:

$$
\boxed{D^2-3D-2I=0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange the verified identity:

$$
D^2=3D+2I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply both sides by $D$:

$$
D^3=3D^2+2D.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $D^2$ with $3D+2I$:

$$
\begin{aligned}
D^3
&=3(3D+2I)+2D\\
&=9D+6I+2D\\
&=11D+6I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $D$ again:

$$
D^4=11D^2+6D.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $D^2$ once more:

$$
\begin{aligned}
D^4
&=11(3D+2I)+6D\\
&=33D+22I+6D\\
&=39D+22I.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 15 Final Summary {#chapter-15-final-summary-71}

An $m\times n$ matrix has $m$ rows and $n$ columns, and $a_{ij}$ denotes its
row $i$, column $j$ entry.

```{=latex}
\Needspace{10\baselineskip}
```
The core compatibility rules are:

$$
\begin{aligned}
A+B&=[a_{ij}+b_{ij}]
&&\text{when the dimensions match},\\
(m\times n)(n\times p)&\longrightarrow m\times p,\\
(AB)_{ij}&=\sum_{k=1}^{n}a_{ik}b_{kj}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
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

```{=latex}
\Needspace{10\baselineskip}
```
Using the monic characteristic-polynomial convention:

$$
p_A(\lambda)=\det(\lambda I-A).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its roots are eigenvalues. An associated nonzero eigenvector satisfies:

$$
A\mathbf{v}=\lambda\mathbf{v}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Cayley-Hamilton theorem converts that scalar polynomial into the matrix
identity:

$$
p_A(A)=0.
$$

This identity can reduce higher matrix powers.

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> begin with dimensions, preserve factor order, and identify whether each
> object is a scalar, vector, or matrix before applying an algebraic rule.
