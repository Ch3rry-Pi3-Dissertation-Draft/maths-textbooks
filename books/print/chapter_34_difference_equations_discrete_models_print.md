```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 34}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Difference Equations And Discrete Models}
```
# Chapter 34 - Difference Equations And Discrete Models

Most of this book has described change in a continuous variable. A derivative
such as $y'(t)$ measures how a quantity changes as time moves through every
real value.

```{=latex}
\Needspace{10\baselineskip}
```
Many processes are observed differently. A bank balance may be updated once
per month, a population may be counted once per year, and an algorithm may
produce one new value at each iteration. In these settings the independent
variable is an integer index:

$$
n=0,1,2,3,\ldots
$$

and the unknown object is a sequence rather than a continuously defined
function.

A **difference equation**, also called a **recurrence relation**, connects
different terms of that sequence. It plays a role in discrete mathematics
similar to the role played by a differential equation in continuous
mathematics.

This chapter will:

-   introduce sequences, shifted indices, and forward differences
-   classify recurrences by order, linearity, and homogeneity
-   connect recurrence order with the required starting data
-   generate terms and verify closed forms without skipping index substitutions
-   solve first-order homogeneous and affine recurrences
-   solve second-order recurrences for every characteristic-root type
-   construct particular responses for polynomial and exponential forcing
-   recognise resonance and correct an overlapping trial
-   model repeated financial, population, and numerical updates
-   predict long-term behaviour and build a reliable solution workflow

```{=latex}
\Needspace{20\baselineskip}
```
## Sequences And Differences {#block-1-sequences-and-differences}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to read sequence notation confidently and understand how a
difference measures change from one index to the next.

```{=latex}
\Needspace{8\baselineskip}
```
> a derivative compares nearby values in continuous time; a forward
> difference compares consecutive values in discrete time.

```{=latex}
\Needspace{12\baselineskip}
```
### A Sequence Is A Function On Integer Indices {#a-sequence-is-a-function-on-integer-indices-2}

```{=latex}
\Needspace{10\baselineskip}
```
A sequence $y$ assigns a value $y_n$ to each allowed integer $n$. If the
sequence begins at $n=0$, we may write:

$$
y_0,y_1,y_2,y_3,\ldots
$$

The symbol $n$ is the **independent index**. The symbol $y_n$ is the value of
the dependent sequence at index $n$.

```{=latex}
\Needspace{10\baselineskip}
```
For example, let:

$$
y_n=n^2-2n+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Evaluate the first few terms one index at a time:

$$
\begin{aligned}
y_0&=0^2-2(0)+3=3,\\
y_1&=1^2-2(1)+3=2,\\
y_2&=2^2-2(2)+3=3,\\
y_3&=3^2-2(3)+3=6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_n=n^2-2n+3$, the calculated values show that the sequence begins:

$$
3,2,3,6,\ldots
$$

The subscript is not a power. In particular, $y_2$ means the value at index
$2$; it does not mean $y^2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Shifted Terms {#shifted-terms-3}

If a formula for $y_n$ is known, a shifted term is found by replacing every
occurrence of $n$ by the shifted index.

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
y_n=n^2-2n+3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
replace $n$ by $n+1$:

$$
y_{n+1}=(n+1)^2-2(n+1)+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the square and distribute the $-2$:

$$
\begin{aligned}
y_{n+1}
&=n^2+2n+1-2n-2+3\\
&=n^2+2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a shift of two, replace $n$ by $n+2$:

$$
y_{n+2}=(n+2)^2-2(n+2)+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand $(n+2)^2$ and distribute the factor $-2$:

$$
\begin{aligned}
y_{n+2}
&=n^2+4n+4-2n-4+3\\
&=n^2+2n+3.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
The practical rule is:

```{=latex}
\Needspace{8\baselineskip}
```
> when an index changes, substitute the entire new index into the entire
> formula before expanding anything.

```{=latex}
\Needspace{12\baselineskip}
```
### The First Forward Difference {#the-first-forward-difference-4}

```{=latex}
\Needspace{10\baselineskip}
```
The **forward-difference operator** is denoted by $\Delta$. It is defined by:

$$
\boxed{
\Delta y_n=y_{n+1}-y_n
}.
$$

This is the change in the sequence during the step from index $n$ to index
$n+1$.

```{=latex}
\Needspace{10\baselineskip}
```
For the sequence:

$$
y_n=n^2-2n+3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
we already found:

$$
y_{n+1}=n^2+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both formulas into the definition of the forward difference:

$$
\begin{aligned}
\Delta y_n
&=y_{n+1}-y_n\\
&=(n^2+2)-(n^2-2n+3).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
In the expression for $\Delta y_n$, distribute the minus sign across the
second parentheses:

$$
\begin{aligned}
\Delta y_n
&=n^2+2-n^2+2n-3\\
&=2n-1.
\end{aligned}
$$

Therefore the amount added at step $n$ is $2n-1$.

```{=latex}
\Needspace{10\baselineskip}
```
For instance, from $n=2$ to $n=3$:

$$
\Delta y_2=2(2)-1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sequence values confirm this:

$$
y_3-y_2=6-3=3.
$$

The forward difference is the discrete analogue of a derivative, but it is a
finite change rather than a limiting rate.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### The Second Forward Difference {#the-second-forward-difference-5}

```{=latex}
\Needspace{10\baselineskip}
```
The second forward difference measures how the first differences change:

$$
\Delta^2y_n=\Delta(\Delta y_n).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the definition of $\Delta$ to the sequence $\Delta y_n$:

$$
\Delta^2y_n=\Delta y_{n+1}-\Delta y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $\Delta y_j=y_{j+1}-y_j$, expand both first differences:

$$
\Delta y_{n+1}=y_{n+2}-y_{n+1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\Delta y_n=y_{n+1}-y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these two expressions:

$$
\begin{aligned}
\Delta^2y_n
&=(y_{n+2}-y_{n+1})-(y_{n+1}-y_n)\\
&=y_{n+2}-y_{n+1}-y_{n+1}+y_n\\
&=y_{n+2}-2y_{n+1}+y_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
\Delta^2y_n=y_{n+2}-2y_{n+1}+y_n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For our polynomial sequence, the first difference is:

$$
\Delta y_n=2n-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Shift $n$ to $n+1$:

$$
\begin{aligned}
\Delta y_{n+1}
&=2(n+1)-1\\
&=2n+1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\Delta^2y_n
&=\Delta y_{n+1}-\Delta y_n\\
&=(2n+1)-(2n-1)\\
&=2.
\end{aligned}
$$

A quadratic sequence has constant second differences, just as a quadratic
function has a constant second derivative.

```{=latex}
\Needspace{12\baselineskip}
```
### Difference Form And Recurrence Form {#difference-form-and-recurrence-form-6}

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
\Delta y_n=3n+2
$$

```{=latex}
\Needspace{10\baselineskip}
```
can be rewritten using $\Delta y_n=y_{n+1}-y_n$:

$$
y_{n+1}-y_n=3n+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $y_n$ to both sides:

$$
\boxed{
y_{n+1}=y_n+3n+2
}.
$$

The two forms say the same thing:

-   the difference form tells us the change during step $n$
-   the recurrence form tells us how to calculate the next value

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

A sequence is a function evaluated at integer indices. Shifted terms are found
by replacing the complete index in the complete formula. The first forward
difference is $\Delta y_n=y_{n+1}-y_n$, and the second is
$\Delta^2y_n=y_{n+2}-2y_{n+1}+y_n$.

```{=latex}
\Needspace{20\baselineskip}
```
## Classifying Difference Equations {#block-2-classifying-difference-equations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to classify a recurrence by its independent index, dependent
sequence, order, linearity, and homogeneity.

```{=latex}
\Needspace{8\baselineskip}
```
> classification tells us what kind of solution method is allowed before we
> begin any algebra.

```{=latex}
\Needspace{12\baselineskip}
```
### A General Linear Recurrence {#a-general-linear-recurrence-9}

```{=latex}
\Needspace{10\baselineskip}
```
A linear recurrence involving shifts from $n$ through $n+k$ can be written as:

$$
a_k(n)y_{n+k}+a_{k-1}(n)y_{n+k-1}+\cdots+a_0(n)y_n=g_n.
$$

Here:

-   $n$ is the independent index
-   $y$ is the dependent sequence
-   $a_0(n),\ldots,a_k(n)$ are known coefficient sequences
-   $g_n$ is a known forcing sequence

When $a_k(n)$ is nonzero, the equation can be rearranged to calculate the
latest term $y_{n+k}$ from earlier terms.

```{=latex}
\Needspace{12\baselineskip}
```
### Order Comes From The Index Span {#order-comes-from-the-index-span-10}

The order is the difference between the largest and smallest indices of the
unknown sequence that occur in the equation.

```{=latex}
\Needspace{10\baselineskip}
```
To calculate an order from its index span, consider:

$$
y_{n+4}-3y_{n+1}+2y_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The largest index is $n+4$, and the smallest is $n$. Therefore:

$$
\begin{aligned}
\text{order}
&=(n+4)-n\\
&=4.
\end{aligned}
$$

The missing shifts $y_{n+2}$ and $y_{n+3}$ do not reduce the order.

```{=latex}
\Needspace{10\baselineskip}
```
Now consider the same relationship written with different labels:

$$
y_{n+7}-3y_{n+4}+2y_{n+3}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its order is still:

$$
(n+7)-(n+3)=4.
$$

Shifting every index by the same amount does not change the recurrence order.

```{=latex}
\Needspace{12\baselineskip}
```
### What Makes A Recurrence Linear {#what-makes-a-recurrence-linear-11}

A difference equation is linear when every sequence value appears only to the
first power, sequence values are not multiplied together, and no nonlinear
function is applied to a sequence value.

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
(n+1)y_{n+2}-4y_{n+1}+ny_n=n^2
$$

is linear. Its coefficients depend on $n$, but each $y$-term is still linear.

```{=latex}
\Needspace{10\baselineskip}
```
A squared sequence value changes the classification. For example:

$$
y_{n+1}=y_n^2+1
$$

is nonlinear because $y_n$ is squared.

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence:

$$
y_{n+2}=y_{n+1}y_n
$$

is nonlinear because two unknown sequence values are multiplied.

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence:

$$
y_{n+1}=\cos(y_n)
$$

is nonlinear because a nonlinear function is applied to $y_n$.

```{=latex}
\Needspace{12\baselineskip}
```
### Homogeneous And Nonhomogeneous {#homogeneous-and-nonhomogeneous-12}

First move every term containing the unknown sequence to the left side.

```{=latex}
\Needspace{10\baselineskip}
```
A linear recurrence is **homogeneous** when the remaining right side is zero:

$$
y_{n+2}-5y_{n+1}+6y_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It is **nonhomogeneous** when a nonzero forcing term remains:

$$
y_{n+2}-5y_{n+1}+6y_n=4^n.
$$

The forcing $4^n$ is known in advance and does not contain the unknown
sequence $y$.

```{=latex}
\Needspace{10\baselineskip}
```
Do not classify an equation merely by looking at its original right side. For
example:

$$
y_{n+1}=3y_n
$$

```{=latex}
\Needspace{10\baselineskip}
```
looks as though it has a nonzero right side. Move the $y$-term left:

$$
y_{n+1}-3y_n=0.
$$

The recurrence is homogeneous because every term contains the unknown
sequence.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Classification Example {#a-complete-classification-example-13}

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
2^n+x_n=4x_{n+3}-x_{n+1}.
$$

The independent index is $n$, and the dependent sequence is $x$.

```{=latex}
\Needspace{10\baselineskip}
```
Move all $x$-terms to the left and the known term to the right:

$$
4x_{n+3}-x_{n+1}-x_n=2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The largest unknown index is $n+3$, and the smallest is $n$. Thus:

$$
\text{order}=(n+3)-n=3.
$$

Every occurrence of $x$ is linear, so the recurrence is linear. The right
side is nonzero, so it is nonhomogeneous.

```{=latex}
\Needspace{10\baselineskip}
```
Combining these classification results, the equation is a:

$$
\boxed{
\text{third-order linear nonhomogeneous difference equation.}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Classification Checklist {#classification-checklist-14}

For any recurrence, ask:

1.  What symbol is the independent index?
2.  What sequence is unknown?
3.  What are the highest and lowest unknown indices?
4.  Do unknown sequence values appear only linearly?
5.  After collecting unknown terms on the left, is the right side zero?

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

The order is the span between the largest and smallest unknown indices.
Linearity concerns how the unknown sequence values appear, not whether the
coefficients depend on $n$. A linear recurrence is homogeneous only when its
forcing side is zero after the unknown terms have been collected.

```{=latex}
\Needspace{20\baselineskip}
```
## Recursive Generation And Initial Data {#block-3-recursive-generation-and-initial-data}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to use a recurrence as an instruction for generating terms and to
understand why an order-$k$ recurrence usually needs $k$ starting values.

```{=latex}
\Needspace{12\baselineskip}
```
### A First-Order Recurrence Needs One Starting Value {#a-first-order-recurrence-needs-one-starting-value-17}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y_{n+1}=2y_n+1,
\qquad
y_0=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=0$ in the recurrence:

$$
y_{0+1}=2y_0+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the index and substitute $y_0=3$:

$$
\begin{aligned}
y_1
&=2(3)+1\\
&=7.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now set $n=1$:

$$
y_{1+1}=2y_1+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the value $y_1=7$ just calculated:

$$
\begin{aligned}
y_2
&=2(7)+1\\
&=15.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the recurrence $y_{n+1}=2y_n+1$, set $n=2$:

$$
y_3=2y_2+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the known value $y_2=15$:

$$
\begin{aligned}
y_3
&=2(15)+1\\
&=31.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sequence begins:

$$
3,7,15,31,\ldots
$$

One starting value is enough because each new term depends on only one
previous term.

```{=latex}
\Needspace{12\baselineskip}
```
### A Second-Order Recurrence Needs Two Starting Values {#a-second-order-recurrence-needs-two-starting-values-18}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u_{n+2}=3u_{n+1}-2u_n,
\qquad
u_0=2,
\qquad
u_1=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To find $u_2$, set $n=0$:

$$
u_{0+2}=3u_{0+1}-2u_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the indices:

$$
u_2=3u_1-2u_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $u_0=2$ and $u_1=5$ into $u_2=3u_1-2u_0$:

$$
\begin{aligned}
u_2
&=3(5)-2(2)\\
&=15-4\\
&=11.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
To find $u_3$, set $n=1$ in the original recurrence:

$$
u_{1+2}=3u_{1+1}-2u_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the indices and substitute known values:

$$
\begin{aligned}
u_3
&=3u_2-2u_1\\
&=3(11)-2(5)\\
&=33-10\\
&=23.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u_4$, set $n=2$:

$$
\begin{aligned}
u_4
&=3u_3-2u_2\\
&=3(23)-2(11)\\
&=69-22\\
&=47.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sequence begins:

$$
2,5,11,23,47,\ldots
$$

Two starting values are needed because the recurrence uses two earlier terms
to produce the next one.

```{=latex}
\Needspace{12\baselineskip}
```
### A Fibonacci-Type Recursion {#a-fibonacci-type-recursion-19}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
f_{n+2}=f_{n+1}+f_n,
\qquad
f_0=2,
\qquad
f_1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=0$:

$$
\begin{aligned}
f_2
&=f_1+f_0\\
&=3+2\\
&=5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=1$:

$$
\begin{aligned}
f_3
&=f_2+f_1\\
&=5+3\\
&=8.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=2$:

$$
\begin{aligned}
f_4
&=f_3+f_2\\
&=8+5\\
&=13.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Continue in the same way:

$$
f_5=21,
\qquad
f_6=34.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The recursively generated terms are therefore:

$$
2,3,5,8,13,21,34,\ldots
$$

The recurrence gives a local rule. It does not initially give a direct formula
for $f_n$. A direct formula, when available, is called a **closed form**.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Number Of Initial Values Matches The Order {#why-the-number-of-initial-values-matches-the-order-20}

```{=latex}
\Needspace{10\baselineskip}
```
An order-$k$ recurrence solved for $y_{n+k}$ has the pattern:

$$
y_{n+k}=F(n,y_n,y_{n+1},\ldots,y_{n+k-1}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
To calculate the first new term $y_k$, the recurrence needs:

$$
y_0,y_1,\ldots,y_{k-1}.
$$

That is a list of $k$ starting values.

```{=latex}
\Needspace{10\baselineskip}
```
For a third-order recurrence such as:

$$
y_{n+3}=2y_{n+2}-y_n,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the first generated value is:

$$
y_3=2y_2-y_0.
$$

We therefore need $y_0$, $y_1$, and $y_2$ before the recurrence can generate
the entire sequence. Although $y_1$ does not appear in the first update, it
will appear after the index advances.

```{=latex}
\Needspace{12\baselineskip}
```
### When Forward Generation Can Fail {#when-forward-generation-can-fail-21}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(n-2)y_{n+1}=y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $n\ne2$, solve for the next term:

$$
y_{n+1}=\frac{y_n}{n-2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=2$, however, the original equation becomes:

$$
0\cdot y_3=y_2.
$$

This requires $y_2=0$, and even then it does not determine $y_3$.

The lesson is the same as for a differential equation with a vanishing leading
coefficient: check that the coefficient of the term being solved for is
nonzero on the intended index range.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-22}

A recurrence generates values by repeated index substitution. A first-order
recurrence normally needs one starting value, a second-order recurrence needs
two, and an order-$k$ recurrence needs $k$. Forward generation also requires a
nonzero coefficient on the newest term.

```{=latex}
\Needspace{20\baselineskip}
```
## Verifying Closed-Form Solutions {#block-4-verifying-closed-form-solutions}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-23}

The goal is to verify a proposed sequence formula by calculating every shifted
term explicitly and checking both the recurrence and any initial conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### Verification Means An Identity For Every Index {#verification-means-an-identity-for-every-index-24}

Suppose a recurrence is required for every integer $n\ge0$. A proposed formula
is a solution only if substitution makes the recurrence true for every such
$n$.

Checking two or three generated values is useful evidence, but it is not a
proof for all indices.

The dependable sequence is:

1.  write the proposed $y_n$
2.  calculate $y_{n+1}$, $y_{n+2}$, and any other required shifts
3.  substitute them into one side of the recurrence
4.  simplify until it matches the other side
5.  check each initial condition separately

```{=latex}
\Needspace{12\baselineskip}
```
### Verify A First-Order Family {#verify-a-first-order-family-25}

```{=latex}
\Needspace{10\baselineskip}
```
Verify that:

$$
y_n=C3^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
solves:

$$
y_{n+1}=3y_n,
$$

where $C$ is any constant.

```{=latex}
\Needspace{10\baselineskip}
```
Start from the proposed formula:

$$
y_n=C3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $n$ by $n+1$:

$$
y_{n+1}=C3^{n+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $3^{n+1}=3\cdot3^n$:

$$
y_{n+1}=3C3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $y_n=C3^n$, this becomes:

$$
y_{n+1}=3y_n.
$$

Thus every member of the family solves the recurrence.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify A Second-Order Initial-Value Solution {#verify-a-second-order-initial-value-solution-26}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
a_{n+2}-3a_{n+1}+2a_n=0,
\qquad
a_0=1,
\qquad
a_1=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Verify the proposed formula:

$$
a_n=-3+4\cdot2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First calculate the one-step shift by replacing $n$ with $n+1$:

$$
a_{n+1}=-3+4\cdot2^{n+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate the two-step shift:

$$
a_{n+2}=-3+4\cdot2^{n+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute all three formulas into the left side of the recurrence:

$$
\begin{aligned}
&a_{n+2}-3a_{n+1}+2a_n\\
&=\left(-3+4\cdot2^{n+2}\right)
-3\left(-3+4\cdot2^{n+1}\right)
+2\left(-3+4\cdot2^n\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the constant terms from the powers of two:

$$
\begin{aligned}
&=(-3+9-6)\\
&\quad+\left(4\cdot2^{n+2}
-12\cdot2^{n+1}
+8\cdot2^n\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant group is:

$$
-3+9-6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $4\cdot2^n$ from the exponential group:

$$
\begin{aligned}
4\cdot2^{n+2}
-12\cdot2^{n+1}
+8\cdot2^n
&=4\cdot2^n(2^2-3\cdot2+2)\\
&=4\cdot2^n(4-6+2)\\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both the constant group and the exponential group are zero, so:

$$
a_{n+2}-3a_{n+1}+2a_n=0
$$

for every $n$.

```{=latex}
\Needspace{10\baselineskip}
```
Now check the initial value at $n=0$:

$$
\begin{aligned}
a_0
&=-3+4\cdot2^0\\
&=-3+4\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Check the second initial value at $n=1$:

$$
\begin{aligned}
a_1
&=-3+4\cdot2^1\\
&=-3+8\\
&=5.
\end{aligned}
$$

The formula satisfies both the recurrence and the two initial conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### A Quick Failure Check {#a-quick-failure-check-27}

```{=latex}
\Needspace{10\baselineskip}
```
Does $y_n=n^2$ solve:

$$
y_{n+1}-y_n=2n?
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the shifted term:

$$
y_{n+1}=(n+1)^2=n^2+2n+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $y_n=n^2$:

$$
\begin{aligned}
y_{n+1}-y_n
&=(n^2+2n+1)-n^2\\
&=2n+1.
\end{aligned}
$$

The recurrence requires $2n$, but substitution gives $2n+1$. Therefore
$y_n=n^2$ is not a solution.

The extra $1$ is not negligible. Difference equations require exact equality,
not an approximation.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-28}

Verification requires explicit shifted formulas and an identity valid for
every allowed index. Initial conditions are separate requirements and must
also be checked one at a time.

```{=latex}
\Needspace{20\baselineskip}
```
## First-Order Homogeneous Recurrences {#block-5-first-order-homogeneous-recurrences}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-29}

The goal is to solve a first-order constant-coefficient recurrence and read
its long-term behaviour directly from its multiplier.

```{=latex}
\Needspace{12\baselineskip}
```
### Repeated Substitution Reveals The Pattern {#repeated-substitution-reveals-the-pattern-30}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y_{n+1}=ay_n,
\qquad
y_0=Y_0,
$$

where $a$ and $Y_0$ are constants.

```{=latex}
\Needspace{10\baselineskip}
```
For $y_{n+1}=ay_n$ with $y_0=Y_0$, set $n=0$:

$$
\begin{aligned}
y_1
&=ay_0\\
&=aY_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=1$:

$$
\begin{aligned}
y_2
&=ay_1\\
&=a(aY_0)\\
&=a^2Y_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $n=2$:

$$
\begin{aligned}
y_3
&=ay_2\\
&=a(a^2Y_0)\\
&=a^3Y_0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponent records the number of update steps. The pattern is:

$$
\boxed{
y_n=Y_0a^n
}.
$$

At $n=0$, the formula gives $y_0=Y_0a^0=Y_0$, so it includes the initial
value as well as every later term.

```{=latex}
\Needspace{12\baselineskip}
```
### The Characteristic Guess For First Order {#the-characteristic-guess-for-first-order-31}

```{=latex}
\Needspace{10\baselineskip}
```
The same result can be found by trying an exponential sequence:

$$
y_n=r^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_n=r^n$ into:

$$
y_{n+1}-ay_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The shifted value is:

$$
y_{n+1}=r^{n+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
r^{n+1}-ar^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $r^n$:

$$
r^n(r-a)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nonzero exponential sequence, the factor $r-a$ must vanish:

$$
r=a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $a^n$ is a solution. Linearity allows any constant multiple:

$$
y_n=Ca^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Applying $y_0=Y_0$ gives:

$$
Y_0=Ca^0=C,
$$

so $C=Y_0$ and $y_n=Y_0a^n$.

```{=latex}
\Needspace{12\baselineskip}
```
### Growth, Decay, And Alternation {#growth-decay-and-alternation-32}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y_n=Y_0a^n,
$$

the magnitude of $a$ determines the long-term pattern.

-   If $|a|<1$, then $a^n\to0$, so $y_n\to0$.
-   If $a=1$, then $y_n=Y_0$ is constant.
-   If $a=-1$, the values alternate between $Y_0$ and $-Y_0$.
-   If $|a|>1$ and $Y_0\ne0$, the magnitude grows.
-   If $a<0$, successive nonzero terms alternate signs.

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
y_{n+1}=-\frac12y_n,
\qquad
y_0=16
$$

```{=latex}
\Needspace{10\baselineskip}
```
has solution:

$$
y_n=16\left(-\frac12\right)^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first terms are:

$$
16,-8,4,-2,1,-\frac12,\ldots
$$

The sign alternates because the multiplier is negative, while the magnitude
shrinks because $|-1/2|<1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Convert A Difference Equation First {#convert-a-difference-equation-first-33}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
\Delta y_n=-0.3y_n,
\qquad
y_0=50.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Start from the definition:

$$
\Delta y_n=y_{n+1}-y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute it into the equation:

$$
y_{n+1}-y_n=-0.3y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $y_n$ to both sides:

$$
\begin{aligned}
y_{n+1}
&=y_n-0.3y_n\\
&=0.7y_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is now in multiplier form with $a=0.7$. Therefore:

$$
\boxed{
y_n=50(0.7)^n
}.
$$

The sequence loses $30\%$ of its current value per step; it does not lose a
fixed amount of $0.3$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-34}

The recurrence $y_{n+1}=ay_n$ has solution $y_n=y_0a^n$. Repeated
substitution explains the exponent, while the characteristic guess provides a
method that extends to higher order. The magnitude and sign of $a$ determine
decay, growth, and alternation.

```{=latex}
\Needspace{20\baselineskip}
```
## First-Order Forced And Affine Recurrences {#block-6-first-order-forced-and-affine-recurrences}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-35}

The goal is to solve recurrences with an added input and to understand the
equilibrium value around which the transient part evolves.

```{=latex}
\Needspace{12\baselineskip}
```
### The Affine Recurrence {#the-affine-recurrence-36}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y_{n+1}=ay_n+b,
$$

where $a$ and $b$ are constants.

The term $ay_n$ carries forward part of the current state. The term $b$ adds
the same external input at every step.

```{=latex}
\Needspace{10\baselineskip}
```
This recurrence is linear and nonhomogeneous when written as:

$$
y_{n+1}-ay_n=b.
$$

Although the update map $ay_n+b$ is often called affine, the recurrence itself
is a nonhomogeneous linear difference equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Equilibrium First {#find-the-equilibrium-first-37}

An equilibrium is a constant sequence $y_n=y_*$ that does not change under the
update.

```{=latex}
\Needspace{10\baselineskip}
```
If $y_n=y_*$, then $y_{n+1}=y_*$ as well. Substitute both into:

$$
y_{n+1}=ay_n+b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant-equilibrium substitution gives:

$$
y_*=ay_*+b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $ay_*$ from both sides:

$$
(1-a)y_*=b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When $a\ne1$, divide by $1-a$:

$$
\boxed{
y_*=\frac{b}{1-a}
}.
$$

The equilibrium is not an extra term inserted into the original recurrence.
It is the constant value that makes the update return the same value.

```{=latex}
\Needspace{12\baselineskip}
```
### Shift The State Away From Equilibrium {#shift-the-state-away-from-equilibrium-38}

```{=latex}
\Needspace{10\baselineskip}
```
Define the deviation from equilibrium:

$$
z_n=y_n-y_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
z_{n+1}=y_{n+1}-y_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the original update $y_{n+1}=ay_n+b$:

$$
z_{n+1}=ay_n+b-y_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium identity is:

$$
y_*=ay_*+b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract this same quantity from the expression for $z_{n+1}$:

$$
\begin{aligned}
z_{n+1}
&=ay_n+b-(ay_*+b)\\
&=ay_n-ay_*\\
&=a(y_n-y_*)\\
&=az_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The shifted sequence obeys a homogeneous recurrence. Therefore:

$$
z_n=z_0a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $z_0=y_0-y_*$:

$$
y_n-y_*=(y_0-y_*)a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $y_*$ to both sides:

$$
\boxed{
y_n=y_*+(y_0-y_*)a^n
}.
$$

This formula separates the solution into:

-   the equilibrium level $y_*$
-   the transient deviation $(y_0-y_*)a^n$

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Affine Example {#a-complete-affine-example-39}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+1}=0.8y_n+12,
\qquad
y_0=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First find the equilibrium:

$$
y_*=0.8y_*+12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $0.8y_*$:

$$
0.2y_*=12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $0.2$:

$$
y_*=60.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the affine solution formula:

$$
y_n=y_*+(y_0-y_*)a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_*=60$, $y_0=10$, and $a=0.8$:

$$
\begin{aligned}
y_n
&=60+(10-60)(0.8)^n\\
&=60-50(0.8)^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y_n=60-50(0.8)^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_n=60-50(0.8)^n$, the transient multiplier satisfies $|0.8|<1$, so:

$$
(0.8)^n\to0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
y_n\to60.
$$

The sequence approaches the equilibrium from below.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Same Formula By Repeated Updates {#derive-the-same-formula-by-repeated-updates-40}

```{=latex}
\Needspace{10\baselineskip}
```
Starting from:

$$
y_{n+1}=ay_n+b,
$$

```{=latex}
\Needspace{10\baselineskip}
```
calculate the first term:

$$
y_1=ay_0+b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The next term is:

$$
\begin{aligned}
y_2
&=ay_1+b\\
&=a(ay_0+b)+b\\
&=a^2y_0+ab+b.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Update once more:

$$
\begin{aligned}
y_3
&=ay_2+b\\
&=a(a^2y_0+ab+b)+b\\
&=a^3y_0+a^2b+ab+b.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
After $n$ steps, the pattern is:

$$
y_n=a^ny_0+b(1+a+a^2+\cdots+a^{n-1}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $a\ne1$, the finite geometric sum is:

$$
1+a+a^2+\cdots+a^{n-1}=\frac{1-a^n}{1-a}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_n=a^ny_0+b\frac{1-a^n}{1-a}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $y_*=b/(1-a)$, rearrange:

$$
\begin{aligned}
y_n
&=a^ny_0+y_*(1-a^n)\\
&=y_*+(y_0-y_*)a^n.
\end{aligned}
$$

The equilibrium shift and the geometric-sum method lead to the same formula.

```{=latex}
\Needspace{12\baselineskip}
```
### The Special Case A Equals One {#the-special-case-a-equals-one-41}

```{=latex}
\Needspace{10\baselineskip}
```
If $a=1$, the recurrence becomes:

$$
y_{n+1}=y_n+b.
$$

```{=latex}
\Needspace{10\baselineskip}
```
There is no finite equilibrium unless $b=0$. Each step adds $b$:

$$
\begin{aligned}
y_1&=y_0+b,\\
y_2&=y_0+2b,\\
y_3&=y_0+3b.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $a=1$, repeated addition gives:

$$
\boxed{
y_n=y_0+nb
}.
$$

This case must be separated because the equilibrium formula would divide by
$1-a=0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Polynomial Forcing By Undetermined Coefficients {#polynomial-forcing-by-undetermined-coefficients-42}

```{=latex}
\Needspace{10\baselineskip}
```
Find a particular solution of:

$$
d_{n+1}=2d_n+6n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $6n$ is a first-degree polynomial, so try:

$$
d_n^{(p)}=An+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the shifted trial carefully:

$$
\begin{aligned}
d_{n+1}^{(p)}
&=A(n+1)+B\\
&=An+A+B.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the trial and its shift into the recurrence:

$$
An+A+B=2(An+B)+6n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the right side:

$$
An+A+B=2An+2B+6n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Group the coefficient of $n$ on the right:

$$
An+A+B=(2A+6)n+2B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients of $n$:

$$
A=2A+6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2A$:

$$
-A=6,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
A=-6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match constant terms:

$$
A+B=2B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $B$:

$$
A=B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $B=-6$, and a particular solution is:

$$
\boxed{
d_n^{(p)}=-6n-6
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The associated homogeneous recurrence is $d_{n+1}=2d_n$, with solution:

$$
d_n^{(h)}=C2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence the general solution is:

$$
\boxed{
d_n=C2^n-6n-6
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Resonance In A First-Order Recurrence {#resonance-in-a-first-order-recurrence-43}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y_{n+1}-2y_n=2^n.
$$

The associated homogeneous solution contains $2^n$. Therefore the naive trial
$A2^n$ overlaps with the homogeneous family and cannot work.

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the trial by $n$:

$$
y_n^{(p)}=A n\,2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Shift the complete trial:

$$
\begin{aligned}
y_{n+1}^{(p)}
&=A(n+1)2^{n+1}\\
&=2A(n+1)2^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side:

$$
\begin{aligned}
y_{n+1}^{(p)}-2y_n^{(p)}
&=2A(n+1)2^n-2(A n\,2^n)\\
&=\left(2An+2A-2An\right)2^n\\
&=2A2^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The substituted trial produces $2A2^n$. Match it to the required forcing
$2^n$:

$$
2A2^n=2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2^n$:

$$
2A=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
A=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A particular solution is:

$$
\boxed{
y_n^{(p)}=\frac12 n\,2^n
}.
$$

The multiplication by $n$ is the discrete counterpart of the resonance
correction used for differential equations.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-44}

For $a\ne1$, the affine recurrence $y_{n+1}=ay_n+b$ has equilibrium
$y_*=b/(1-a)$ and solution $y_n=y_*+(y_0-y_*)a^n$. More general forcing can
be handled by a homogeneous-plus-particular decomposition. If a trial overlaps
with a homogeneous mode, multiply it by $n$.

```{=latex}
\Needspace{20\baselineskip}
```
## Second-Order Homogeneous Recurrences {#block-7-second-order-homogeneous-recurrences}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-45}

The goal is to turn a second-order constant-coefficient recurrence into a
quadratic characteristic equation and handle each possible root type.

```{=latex}
\Needspace{12\baselineskip}
```
### Build The Characteristic Equation {#build-the-characteristic-equation-46}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the homogeneous recurrence:

$$
y_{n+2}+py_{n+1}+qy_n=0,
$$

where $p$ and $q$ are constants.

```{=latex}
\Needspace{10\baselineskip}
```
Try an exponential sequence:

$$
y_n=r^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its shifted terms are:

$$
y_{n+1}=r^{n+1}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y_{n+2}=r^{n+2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute all three expressions into the recurrence:

$$
r^{n+2}+pr^{n+1}+qr^n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In $r^{n+2}+pr^{n+1}+qr^n=0$, factor out $r^n$:

$$
r^n(r^2+pr+q)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation that determines the exponential modes is:

$$
\boxed{
r^2+pr+q=0
}.
$$

This is the **characteristic equation**. Its roots determine the form of the
homogeneous solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Distinct Real Roots {#distinct-real-roots-47}

```{=latex}
\Needspace{10\baselineskip}
```
If the characteristic equation has distinct real roots $r_1$ and $r_2$, then
the two independent modes are:

$$
r_1^n
\qquad\text{and}\qquad
r_2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y_n=C_1r_1^n+C_2r_2^n
}.
$$

Two constants appear because a second-order recurrence needs two initial
values.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Distinct-Root Initial-Value Problem {#worked-distinct-root-initial-value-problem-48}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-5y_{n+1}+6y_n=0,
\qquad
y_0=2,
\qquad
y_1=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace the shifts $y_{n+2}$, $y_{n+1}$, and $y_n$ by $r^{n+2}$,
$r^{n+1}$, and $r^n$. After factoring $r^n$, the characteristic equation is:

$$
r^2-5r+6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the quadratic:

$$
(r-2)(r-3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
r_1=2,
\qquad
r_2=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the general solution before applying either condition:

$$
y_n=C_1 2^n+C_2 3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_0=2$:

$$
\begin{aligned}
2
&=C_1 2^0+C_2 3^0\\
&=C_1+C_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
C_1+C_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply $y_1=5$ to the same general formula:

$$
\begin{aligned}
5
&=C_1 2^1+C_2 3^1\\
&=2C_1+3C_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two initial conditions give the system:

$$
\begin{aligned}
C_1+C_2&=2,\\
2C_1+3C_2&=5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the first equation by $2$:

$$
2C_1+2C_2=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract this equation from $2C_1+3C_2=5$:

$$
C_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C_2=1$ into $C_1+C_2=2$:

$$
C_1+1=2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
C_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is:

$$
\boxed{
y_n=2^n+3^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Repeated Real Roots {#repeated-real-roots-49}

If the characteristic equation has one repeated root $r$, the mode $r^n$
alone does not provide two independent solution directions.

```{=latex}
\Needspace{10\baselineskip}
```
The second mode is obtained by multiplying by $n$:

$$
nr^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the general solution is:

$$
\boxed{
y_n=(C_1+C_2n)r^n
}.
$$

The factor $n$ has the same structural role as the factor $x$ in a repeated
root solution of a constant-coefficient differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Repeated-Root Problem {#worked-repeated-root-problem-50}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-6y_{n+1}+9y_n=0,
\qquad
y_0=1,
\qquad
y_1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-6r+9=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-3)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated root is $r=3$, so write:

$$
y_n=(C_1+C_2n)3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_n=(C_1+C_2n)3^n$, apply $y_0=1$:

$$
\begin{aligned}
1
&=(C_1+C_2\cdot0)3^0\\
&=C_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
C_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the general formula and apply $y_1=0$:

$$
\begin{aligned}
0
&=(C_1+C_2\cdot1)3^1\\
&=3(C_1+C_2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3$:

$$
C_1+C_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C_1=1$:

$$
1+C_2=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
C_2=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y_n=(1-n)3^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Complex-Conjugate Roots {#complex-conjugate-roots-51}

```{=latex}
\Needspace{10\baselineskip}
```
For a recurrence with real coefficients, nonreal characteristic roots occur
in a conjugate pair:

$$
r_{1,2}=\rho(\cos\theta\pm i\sin\theta)
=\rho e^{\pm i\theta}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding real solution can be written as:

$$
\boxed{
y_n=\rho^n\left(C_1\cos(n\theta)+C_2\sin(n\theta)\right)
}.
$$

The factor $\rho^n$ controls the amplitude. The trigonometric terms control
the oscillation.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Complex-Root Problem {#worked-complex-root-problem-52}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-y_{n+1}+y_n=0,
\qquad
y_0=2,
\qquad
y_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-r+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula:

$$
\begin{aligned}
r
&=\frac{1\pm\sqrt{(-1)^2-4(1)(1)}}{2}\\
&=\frac{1\pm\sqrt{-3}}{2}\\
&=\frac12\pm i\frac{\sqrt3}{2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $r=\frac12\pm i\frac{\sqrt3}{2}$, the magnitude is:

$$
\rho=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and angle:

$$
\theta=\frac{\pi}{3},
$$

```{=latex}
\Needspace{10\baselineskip}
```
because:

$$
\cos\left(\frac\pi3\right)=\frac12,
\qquad
\sin\left(\frac\pi3\right)=\frac{\sqrt3}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The real general solution is therefore:

$$
y_n=C_1\cos\left(\frac{n\pi}{3}\right)
+C_2\sin\left(\frac{n\pi}{3}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_0=2$:

$$
\begin{aligned}
2
&=C_1\cos0+C_2\sin0\\
&=C_1.
\end{aligned}
$$

Thus $C_1=2$.

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_1=1$:

$$
1=2\cos\left(\frac\pi3\right)
+C_2\sin\left(\frac\pi3\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $\cos(\pi/3)=1/2$ and $\sin(\pi/3)=\sqrt3/2$:

$$
1=2\left(\frac12\right)+C_2\frac{\sqrt3}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
1=1+C_2\frac{\sqrt3}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $1$:

$$
0=C_2\frac{\sqrt3}{2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $C_2=0$. Hence:

$$
\boxed{
y_n=2\cos\left(\frac{n\pi}{3}\right)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sequence is periodic:

$$
2,1,-1,-2,-1,1,2,\ldots
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Root Ledger {#a-root-ledger-53}

For a second-order homogeneous recurrence, use this ledger:

  Root type                 General real solution
  ------------------------- ---------------------------------------------
  distinct real $r_1,r_2$   $C_1r_1^n+C_2r_2^n$
  repeated real $r$         $(C_1+C_2n)r^n$
  $\rho e^{\pm i\theta}$    $\rho^n[C_1\cos(n\theta)+C_2\sin(n\theta)]$

Classify the roots before applying initial conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-54}

The trial $y_n=r^n$ converts a constant-coefficient homogeneous recurrence
into a characteristic polynomial. Distinct roots give distinct exponential
modes, repeated roots require an extra factor of $n$, and complex roots give
real oscillatory modes.

```{=latex}
\Needspace{20\baselineskip}
```
## Nonhomogeneous Higher-Order Recurrences {#block-8-nonhomogeneous-higher-order-recurrences}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-55}

The goal is to combine the complementary homogeneous family with one
particular response to the forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Homogeneous Plus Particular {#homogeneous-plus-particular-56}

```{=latex}
\Needspace{10\baselineskip}
```
For a linear recurrence:

$$
L[y]_n=g_n,
$$

```{=latex}
\Needspace{10\baselineskip}
```
let $y_n^{(h)}$ denote the general solution of:

$$
L[y]_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $y_n^{(p)}$ be one specific sequence satisfying:

$$
L[y^{(p)}]_n=g_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then the general nonhomogeneous solution is:

$$
\boxed{
y_n=y_n^{(h)}+y_n^{(p)}
}.
$$

The homogeneous part carries the arbitrary constants. The particular part
accounts for the external forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Polynomial Forcing In Second Order {#polynomial-forcing-in-second-order-57}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-3y_{n+1}+2y_n=4,
$$

without initial conditions.

```{=latex}
\Needspace{10\baselineskip}
```
First solve the associated homogeneous recurrence:

$$
y_{n+2}-3y_{n+1}+2y_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its characteristic equation is:

$$
r^2-3r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-1)(r-2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_n^{(h)}=C_1+C_2 2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A constant trial for the constant forcing would overlap with the homogeneous
mode $1^n=1$. Multiply the constant trial by $n$:

$$
y_n^{(p)}=An.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_n^{(p)}=An$, calculate both shifted trials:

$$
y_{n+1}^{(p)}=A(n+1)=An+A
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y_{n+2}^{(p)}=A(n+2)=An+2A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute them into the left side:

$$
\begin{aligned}
&y_{n+2}^{(p)}-3y_{n+1}^{(p)}+2y_n^{(p)}\\
&=(An+2A)-3(An+A)+2An.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand and collect terms:

$$
\begin{aligned}
&=An+2A-3An-3A+2An\\
&=-A.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the forcing:

$$
-A=4,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
A=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_n^{(p)}=-4n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine $y_n^{(h)}=C_1+C_2 2^n$ with $y_n^{(p)}=-4n$:

$$
\boxed{
y_n=C_1+C_2 2^n-4n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Exponential Forcing Without Resonance {#exponential-forcing-without-resonance-58}

```{=latex}
\Needspace{10\baselineskip}
```
Find a particular solution of:

$$
y_{n+2}-3y_{n+1}+2y_n=3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous roots are $1$ and $2$. Since $3$ is not a homogeneous root,
try:

$$
y_n^{(p)}=A3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Shift the trial:

$$
y_{n+1}^{(p)}=A3^{n+1}=3A3^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding two-step shift is:

$$
y_{n+2}^{(p)}=A3^{n+2}=9A3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
\begin{aligned}
&y_{n+2}^{(p)}-3y_{n+1}^{(p)}+2y_n^{(p)}\\
&=9A3^n-3(3A3^n)+2A3^n\\
&=(9A-9A+2A)3^n\\
&=2A3^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The substituted trial produces $2A3^n$. Match it to the forcing $3^n$:

$$
2A3^n=3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3^n$:

$$
2A=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $A=1/2$. Therefore:

$$
\boxed{
y_n^{(p)}=\frac12 3^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Resonance With An Exponential Forcing {#resonance-with-an-exponential-forcing-59}

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
y_{n+2}-3y_{n+1}+2y_n=2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The value $2$ is a characteristic root, so $A2^n$ is already part of the
homogeneous family. Correct the trial by multiplying by $n$:

$$
y_n^{(p)}=A n\,2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate each shift:

$$
\begin{aligned}
y_{n+1}^{(p)}
&=A(n+1)2^{n+1}\\
&=2A(n+1)2^n
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding two-step shift is:

$$
\begin{aligned}
y_{n+2}^{(p)}
&=A(n+2)2^{n+2}\\
&=4A(n+2)2^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the recurrence operator:

$$
\begin{aligned}
&y_{n+2}^{(p)}-3y_{n+1}^{(p)}+2y_n^{(p)}\\
&=4A(n+2)2^n-3\left[2A(n+1)2^n\right]+2A n\,2^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $A2^n$:

$$
\begin{aligned}
&=A2^n\left[4(n+2)-6(n+1)+2n\right]\\
&=A2^n(4n+8-6n-6+2n)\\
&=2A2^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the forcing $2^n$:

$$
2A2^n=2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $2A=1$, so:

$$
A=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A particular solution is:

$$
\boxed{
y_n^{(p)}=\frac12 n\,2^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Trial Selection Ledger {#trial-selection-ledger-60}

For constant-coefficient recurrences, common starting trials are:

  Forcing $g_n$            Initial trial
  ------------------------ ---------------------------------
  constant                 $A$
  degree-$m$ polynomial    degree-$m$ polynomial in $n$
  $s^n$                    $As^n$
  polynomial times $s^n$   matching polynomial times $s^n$
  sine or cosine           matching sine-cosine pair

If the trial overlaps with a characteristic root of multiplicity $k$, multiply
the entire trial by $n^k$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-61}

A forced linear recurrence has the structure
$y_n=y_n^{(h)}+y_n^{(p)}$. Choose a particular trial that matches the forcing,
write every shifted trial explicitly, and correct resonance by multiplying the
entire trial by the required power of $n$.

```{=latex}
\Needspace{20\baselineskip}
```
## Discrete Models And Long-Term Behaviour {#block-9-discrete-models-and-long-term-behaviour}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-62}

The goal is to translate repeated real-world updates into recurrences and use
their multipliers or characteristic roots to predict long-term behaviour.

```{=latex}
\Needspace{12\baselineskip}
```
### Model The Timing Before The Algebra {#model-the-timing-before-the-algebra-63}

In a discrete model, the order of events within one step matters.

For a savings account, these two statements describe different updates:

1.  interest is applied, then a deposit is added
2.  a deposit is added, then interest is applied

```{=latex}
\Needspace{10\baselineskip}
```
If $B_n$ is the balance immediately after the $n$th deposit, a monthly growth
factor $a$, followed by a deposit $d$, gives:

$$
B_{n+1}=aB_n+d.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the deposit is made before interest, the update is instead:

$$
B_{n+1}=a(B_n+d).
$$

These are not interchangeable. Define exactly when $B_n$ is measured before
writing the recurrence.

```{=latex}
\Needspace{12\baselineskip}
```
### A Savings Model {#a-savings-model-64}

An account contains $500$ immediately after an initial deposit. Each month it
earns $1\%$ interest, after which another $200$ is deposited.

```{=latex}
\Needspace{10\baselineskip}
```
Let $B_n$ be the balance immediately after the deposit at the end of month
$n$. Then:

$$
B_0=500.
$$

```{=latex}
\Needspace{10\baselineskip}
```
During the next month, interest changes $B_n$ to $1.01B_n$. The end-of-month
deposit then adds $200$. Therefore:

$$
B_{n+1}=1.01B_n+200.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the repeated-update formula:

$$
B_n=a^nB_0+d\frac{a^n-1}{a-1},
$$

where the equivalent geometric-sum form has been written for $a>1$.

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $a=1.01$, $B_0=500$, and $d=200$:

$$
B_n=500(1.01)^n
+200\frac{(1.01)^n-1}{0.01}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $200/0.01=20{,}000$:

$$
\begin{aligned}
B_n
&=500(1.01)^n+20{,}000[(1.01)^n-1]\\
&=20{,}500(1.01)^n-20{,}000.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
After $24$ monthly updates:

$$
\begin{aligned}
B_{24}
&=20{,}500(1.01)^{24}-20{,}000\\
&\approx 6{,}029.56.
\end{aligned}
$$

The formula includes the initial $500$, twenty-four deposits, and interest on
amounts already present in the account.

```{=latex}
\Needspace{12\baselineskip}
```
### Population Growth With Fixed Removal {#population-growth-with-fixed-removal-65}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a population grows by $8\%$ during each year and then $150$ individuals
are removed. If $P_n$ is the population immediately after the removal in year
$n$, the model is:

$$
P_{n+1}=1.08P_n-150.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Find an equilibrium $P_*$:

$$
P_*=1.08P_*-150.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $P_*$ from both sides:

$$
0=0.08P_*-150.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $150$:

$$
150=0.08P_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $0.08$:

$$
P_*=1875.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is:

$$
\boxed{
P_n=1875+(P_0-1875)(1.08)^n
}.
$$

Because $1.08>1$, the equilibrium is unstable:

-   if $P_0>1875$, the positive deviation grows
-   if $P_0<1875$, the negative deviation grows in magnitude

If the formula later predicts a negative population, that does not make a
negative population physically possible. It means the linear model has been
used beyond the range where its assumptions make sense.

```{=latex}
\Needspace{12\baselineskip}
```
### Difference Equations From Euler's Method {#difference-equations-from-eulers-method-66}

Difference equations also arise when a differential equation is approximated
numerically.

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y'=f(t,y),
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler's method with step size $h$ uses:

$$
y_{n+1}=y_n+h f(t_n,y_n).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the continuous decay equation:

$$
y'=-ky,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Euler's method gives:

$$
\begin{aligned}
y_{n+1}
&=y_n+h(-ky_n)\\
&=(1-hk)y_n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the numerical values obey a first-order difference equation with
multiplier:

$$
a=1-hk.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exact differential-equation solution decays when $k>0$. The Euler sequence
decays to zero only when:

$$
|1-hk|<1.
$$

This shows why an excessively large step size can make a stable continuous
model produce an unstable numerical sequence.[^2]

```{=latex}
\Needspace{12\baselineskip}
```
### Characteristic Roots And Stability {#characteristic-roots-and-stability-67}

For a homogeneous constant-coefficient recurrence, each characteristic root
$r$ contributes a mode related to $r^n$.

-   If every root satisfies $|r|<1$, every homogeneous mode decays.
-   If some root has $|r|>1$, a nonzero component in that mode grows.
-   A negative real root produces sign alternation.
-   Complex roots produce oscillation.
-   A repeated root on $|r|=1$ can still generate growth through a factor of
    $n$.

```{=latex}
\Needspace{10\baselineskip}
```
For example, suppose the roots are:

$$
r_1=0.4,
\qquad
r_2=-1.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution has the form:

$$
y_n=C_1(0.4)^n+C_2(-1.2)^n.
$$

The first mode decays. The second alternates and grows in magnitude because
$|-1.2|>1$. Unless the initial conditions happen to make $C_2=0$, the sequence
is unstable.

```{=latex}
\Needspace{12\baselineskip}
```
### The Dominant Root {#the-dominant-root-68}

When characteristic roots have different magnitudes, the root with largest
magnitude usually controls long-term behaviour.

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y_n=7(0.5)^n-2(1.3)^n,
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_n=7(0.5)^n-2(1.3)^n$, the first term approaches zero while the
magnitude of the second grows. Therefore:

$$
y_n\sim-2(1.3)^n
\qquad\text{as }n\to\infty.
$$

This is an asymptotic statement: the ratio of the full expression to
$-2(1.3)^n$ approaches $1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-69}

Discrete models require a precise statement of when the state is measured and
in what order updates occur. Affine recurrences model repeated proportional
change plus fixed input. Characteristic-root magnitudes predict decay or
growth, while signs and arguments predict alternation or oscillation.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Difference-Equation Workflow {#block-10-a-reliable-difference-equation-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-70}

The goal is to organise classification, construction, verification, and
interpretation into one dependable process.

```{=latex}
\Needspace{12\baselineskip}
```
### The Full Workflow {#the-full-workflow-71}

**Step 1: Define the sequence and index.** State what $y_n$ measures and when
it is measured.

**Step 2: Put the recurrence in a readable form.** Either solve for the newest
term or collect unknown terms on the left.

**Step 3: Classify it.** Identify order, linearity, homogeneity, and whether
the coefficients are constant.

**Step 4: Count the starting values.** An order-$k$ forward recurrence normally
needs $k$ initial values.

**Step 5: Choose the method.** Use recursive generation, an equilibrium shift,
a characteristic equation, or homogeneous plus particular.

**Step 6: Write every index shift explicitly.** Replace $n$ by $n+1$ or $n+2$
in the entire proposed formula.

**Step 7: Apply initial conditions one at a time.** Reproduce the general
formula before each substitution.

**Step 8: Verify.** Check the recurrence and all initial conditions.

**Step 9: Interpret the roots or multiplier.** Describe growth, decay,
alternation, oscillation, or convergence to equilibrium.

**Step 10: Check the model's domain.** A mathematically valid sequence may
eventually violate physical restrictions such as nonnegative population.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Shifting Only Part Of A Formula {#common-mistake-shifting-only-part-of-a-formula-72}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
y_n=(An+B)r^n,
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete one-step shift of $y_n=(An+B)r^n$ is:

$$
y_{n+1}=[A(n+1)+B]r^{n+1}.
$$

It is incorrect to change only one occurrence of $n$. Both the polynomial
factor and the exponent use the new index.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Calling Any Nonzero Right Side Nonhomogeneous {#common-mistake-calling-any-nonzero-right-side-nonhomogeneous-73}

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence:

$$
y_{n+1}=4y_n
$$

```{=latex}
\Needspace{10\baselineskip}
```
is homogeneous. Collect the unknown terms:

$$
y_{n+1}-4y_n=0.
$$

Homogeneity is judged after every term containing the unknown sequence has
been moved to one side.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Forgetting Resonance {#common-mistake-forgetting-resonance-74}

Before choosing a particular trial $As^n$, check whether $s$ is a
characteristic root.

```{=latex}
\Needspace{10\baselineskip}
```
If it is a root of multiplicity $k$, use:

$$
n^kAs^n
$$

instead. Without the factor $n^k$, substitution collapses into the homogeneous
equation and cannot reproduce the forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Applying Conditions Before The Root Case {#common-mistake-applying-conditions-before-the-root-case-75}

```{=latex}
\Needspace{10\baselineskip}
```
Do not write two independent exponentials before checking whether the roots
are distinct. A repeated root requires:

$$
(C_1+C_2n)r^n,
$$

and complex roots require a sine-cosine pair. Establish the correct general
family first, then apply conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 10 Summary {#block-10-summary-76}

```{=latex}
\Needspace{12\baselineskip}
```
The reliable chain is:

```{=latex}
\Needspace{8\baselineskip}
```
> define the index and state -\> classify -\> count data -\> choose a method -\>
> shift every term -\> apply conditions -\> verify -\> interpret.

Most errors come from an incomplete index shift, an incorrect root family, or
a particular trial that overlaps with a homogeneous mode.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-11-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Notation, Classification, And Verification {#problems-1-to-4-notation-classification-and-verification-77}

#### Problem 1: Calculate Forward Differences

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y_n=n^2+n+2,
$$

find $\Delta y_n$ and $\Delta^2y_n$.

#### Problem 2: Classify A Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
x_{k+3}=(k+1)x_{k+1}+5
$$

by identifying the independent index, dependent sequence, order, linearity,
and homogeneity.

#### Problem 3: Generate Terms Recursively

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
a_{n+2}=2a_{n+1}+a_n,
\qquad
a_0=1,
\qquad
a_1=2,
$$

calculate $a_2,a_3,a_4$, and $a_5$.

#### Problem 4: Verify A Homogeneous Family

```{=latex}
\Needspace{10\baselineskip}
```
Verify that:

$$
y_n=C(-3)^n
$$

```{=latex}
\Needspace{10\baselineskip}
```
solves:

$$
y_{n+1}=-3y_n
$$

for every constant $C$.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: First- And Second-Order Solutions {#problems-5-to-8-first--and-second-order-solutions-78}

#### Problem 5: Solve A First-Order Decay Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+1}=0.4y_n,
\qquad
y_0=80.
$$

State the limiting value as $n\to\infty$.

#### Problem 6: Solve An Affine Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+1}=0.75y_n+10,
\qquad
y_0=50.
$$

Find the equilibrium and state whether the sequence approaches it.

#### Problem 7: Use Distinct Characteristic Roots

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-4y_{n+1}+3y_n=0,
\qquad
y_0=2,
\qquad
y_1=4.
$$

#### Problem 8: Use A Repeated Characteristic Root

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}-4y_{n+1}+4y_n=0,
\qquad
y_0=3,
\qquad
y_1=8.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 11: Oscillation And Forcing {#problems-9-to-11-oscillation-and-forcing-79}

#### Problem 9: Solve An Oscillatory Recurrence

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y_{n+2}+y_n=0,
\qquad
y_0=2,
\qquad
y_1=-1.
$$

#### Problem 10: Find A Polynomial Particular Solution

```{=latex}
\Needspace{10\baselineskip}
```
Find one particular solution of:

$$
y_{n+1}-3y_n=2n+1.
$$

#### Problem 11: Correct An Exponential Trial For Resonance

```{=latex}
\Needspace{10\baselineskip}
```
Find one particular solution of:

$$
y_{n+2}-5y_{n+1}+6y_n=3^n.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 12 To 14: Models And Stability {#problems-12-to-14-models-and-stability-80}

#### Problem 12: Model Monthly Saving

An account contains $1000$ immediately after an initial deposit. Each month it
earns $0.5\%$ interest, after which $100$ is deposited.

1.  Write a recurrence for the balance $B_n$ immediately after the $n$th
    deposit.
2.  Find a closed formula for $B_n$.
3.  Estimate $B_{12}$.

#### Problem 13: Diagnose Stability From Roots

```{=latex}
\Needspace{10\baselineskip}
```
A homogeneous second-order recurrence has characteristic roots:

$$
r_1=0.5,
\qquad
r_2=-1.2.
$$

Describe the behaviour of each mode and decide whether the zero solution is
stable for general initial data.

#### Problem 14: Compare Two Euler Step Sizes

```{=latex}
\Needspace{10\baselineskip}
```
Euler's method is applied to:

$$
y'=-4y.
$$

Find the recurrence multiplier for:

1.  $h=0.1$
2.  $h=0.6$

Determine which Euler sequence decays to zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-81}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y_n=n^2+n+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $n$ by $n+1$:

$$
y_{n+1}=(n+1)^2+(n+1)+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand and collect terms:

$$
\begin{aligned}
y_{n+1}
&=n^2+2n+1+n+1+2\\
&=n^2+3n+4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now subtract $y_n$:

$$
\begin{aligned}
\Delta y_n
&=y_{n+1}-y_n\\
&=(n^2+3n+4)-(n^2+n+2)\\
&=2n+2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
To find the second difference, shift the first-difference formula:

$$
\begin{aligned}
\Delta y_{n+1}
&=2(n+1)+2\\
&=2n+4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the original first difference:

$$
\begin{aligned}
\Delta^2y_n
&=\Delta y_{n+1}-\Delta y_n\\
&=(2n+4)-(2n+2)\\
&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The requested differences are therefore:

$$
\boxed{
\Delta y_n=2n+2,
\qquad
\Delta^2y_n=2
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the recurrence with unknown terms on the left:

$$
x_{k+3}-(k+1)x_{k+1}=5.
$$

The independent index is $k$, and the dependent sequence is $x$.

```{=latex}
\Needspace{10\baselineskip}
```
The largest unknown index is $k+3$, and the smallest is $k+1$. Therefore:

$$
\begin{aligned}
\text{order}
&=(k+3)-(k+1)\\
&=2.
\end{aligned}
$$

Both occurrences of $x$ are linear. The nonzero forcing $5$ remains after the
unknown terms are collected.

```{=latex}
\Needspace{10\baselineskip}
```
Thus the recurrence is:

$$
\boxed{
\text{second-order, linear, and nonhomogeneous.}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence and starting values are:

$$
a_{n+2}=2a_{n+1}+a_n,
\qquad
a_0=1,
\qquad
a_1=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=0$:

$$
\begin{aligned}
a_2
&=2a_1+a_0\\
&=2(2)+1\\
&=5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $a_{n+2}=2a_{n+1}+a_n$, continue by setting $n=1$:

$$
\begin{aligned}
a_3
&=2a_2+a_1\\
&=2(5)+2\\
&=12.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=2$:

$$
\begin{aligned}
a_4
&=2a_3+a_2\\
&=2(12)+5\\
&=29.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $n=3$:

$$
\begin{aligned}
a_5
&=2a_4+a_3\\
&=2(29)+12\\
&=70.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
a_2=5,
\quad
a_3=12,
\quad
a_4=29,
\quad
a_5=70
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The proposed family is:

$$
y_n=C(-3)^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Replace $n$ by $n+1$:

$$
y_{n+1}=C(-3)^{n+1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $(-3)^{n+1}=(-3)(-3)^n$:

$$
\begin{aligned}
y_{n+1}
&=C(-3)(-3)^n\\
&=-3[C(-3)^n]\\
&=-3y_n.
\end{aligned}
$$

Therefore the recurrence holds for every $n$ and every constant $C$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-82}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence has multiplier $a=0.4$. A first-order homogeneous recurrence
has solution:

$$
y_n=y_0a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_0=80$ and $a=0.4$:

$$
\boxed{
y_n=80(0.4)^n
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $|0.4|<1$:

$$
(0.4)^n\to0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y_n\to0
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence is:

$$
y_{n+1}=0.75y_n+10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Find the equilibrium from:

$$
y_*=0.75y_*+10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $0.75y_*$:

$$
0.25y_*=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $0.25$:

$$
y_*=40.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
y_n=y_*+(y_0-y_*)a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $y_*=40$, $y_0=50$, and $a=0.75$:

$$
\begin{aligned}
y_n
&=40+(50-40)(0.75)^n\\
&=40+10(0.75)^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
y_n=40+10(0.75)^n
}.
$$

Because $|0.75|<1$, the transient term approaches zero and $y_n\to40$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence is:

$$
y_{n+2}-4y_{n+1}+3y_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its characteristic equation is:

$$
r^2-4r+3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-1)(r-3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The distinct roots are $1$ and $3$, so:

$$
y_n=C_1+C_2 3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_0=2$:

$$
\begin{aligned}
2
&=C_1+C_2 3^0\\
&=C_1+C_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_1=4$ to the general formula:

$$
\begin{aligned}
4
&=C_1+C_2 3^1\\
&=C_1+3C_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $C_1+C_2=2$ from $C_1+3C_2=4$:

$$
2C_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving the two constant equations gives $C_2=1$ and $C_1=1$. Hence:

$$
\boxed{
y_n=1+3^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-4r+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The root $r=2$ is repeated. Therefore:

$$
y_n=(C_1+C_2n)2^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_0=3$:

$$
\begin{aligned}
3
&=(C_1+C_2\cdot0)2^0\\
&=C_1.
\end{aligned}
$$

Thus $C_1=3$.

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_1=8$ to the general formula:

$$
\begin{aligned}
8
&=(C_1+C_2)2\\
&=2(3+C_2).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $8=2(3+C_2)$, divide both sides by $2$:

$$
4=3+C_2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $C_2=1$. The solution is:

$$
\boxed{
y_n=(3+n)2^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 11 {#worked-answers-problems-9-to-11-83}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The recurrence is:

$$
y_{n+2}+y_n=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
r=\pm i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots have magnitude $1$ and angles $\pm\pi/2$. The real general solution
is:

$$
y_n=C_1\cos\left(\frac{n\pi}{2}\right)
+C_2\sin\left(\frac{n\pi}{2}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the oscillatory family
$y_n=C_1\cos(n\pi/2)+C_2\sin(n\pi/2)$, apply $y_0=2$:

$$
\begin{aligned}
2
&=C_1\cos0+C_2\sin0\\
&=C_1.
\end{aligned}
$$

Therefore $C_1=2$.

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y_1=-1$ to the same general formula:

$$
-1=2\cos\left(\frac\pi2\right)
+C_2\sin\left(\frac\pi2\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\cos(\pi/2)=0$ and $\sin(\pi/2)=1$:

$$
-1=C_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
y_n=2\cos\left(\frac{n\pi}{2}\right)
-\sin\left(\frac{n\pi}{2}\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $2n+1$ is a first-degree polynomial, so try:

$$
y_n^{(p)}=An+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Shift the trial:

$$
\begin{aligned}
y_{n+1}^{(p)}
&=A(n+1)+B\\
&=An+A+B.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side of:

$$
y_{n+1}-3y_n=2n+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\begin{aligned}
y_{n+1}^{(p)}-3y_n^{(p)}
&=(An+A+B)-3(An+B)\\
&=An+A+B-3An-3B\\
&=-2An+(A-2B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the coefficient of $n$:

$$
-2A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the constant terms:

$$
A-2B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-1$:

$$
-1-2B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $1$ to both sides:

$$
-2B=2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant-coefficient equation gives $B=-1$. A particular solution is:

$$
\boxed{
y_n^{(p)}=-n-1
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2-5r+6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)(r-3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $3$ is a characteristic root, the trial $A3^n$ would overlap with a
homogeneous mode. Use:

$$
y_n^{(p)}=A n\,3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the first shift:

$$
\begin{aligned}
y_{n+1}^{(p)}
&=A(n+1)3^{n+1}\\
&=3A(n+1)3^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the second shift:

$$
\begin{aligned}
y_{n+2}^{(p)}
&=A(n+2)3^{n+2}\\
&=9A(n+2)3^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the recurrence operator:

$$
\begin{aligned}
&y_{n+2}^{(p)}-5y_{n+1}^{(p)}+6y_n^{(p)}\\
&=9A(n+2)3^n-5[3A(n+1)3^n]+6A n\,3^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $A3^n$:

$$
\begin{aligned}
&=A3^n[9(n+2)-15(n+1)+6n]\\
&=A3^n(9n+18-15n-15+6n)\\
&=3A3^n.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the forcing $3^n$:

$$
3A3^n=3^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3^n$:

$$
3A=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $A=1/3$. Therefore:

$$
\boxed{
y_n^{(p)}=\frac{n}{3}3^n
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 12 To 14 {#worked-answers-problems-12-to-14-84}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Let $B_n$ be the balance immediately after the deposit at the end of month
$n$. The initial balance is:

$$
B_0=1000.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A monthly interest rate of $0.5\%$ gives the growth factor:

$$
1+0.005=1.005.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Interest is applied first and the $100$ deposit is added afterward. Therefore:

$$
\boxed{
B_{n+1}=1.005B_n+100,
\qquad
B_0=1000
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $B_{n+1}=aB_n+d$, use:

$$
B_n=a^nB_0+d\frac{a^n-1}{a-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $a=1.005$, $B_0=1000$, and $d=100$:

$$
B_n=1000(1.005)^n
+100\frac{(1.005)^n-1}{0.005}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $100/0.005=20{,}000$:

$$
\begin{aligned}
B_n
&=1000(1.005)^n+20{,}000[(1.005)^n-1]\\
&=21{,}000(1.005)^n-20{,}000.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
B_n=21{,}000(1.005)^n-20{,}000
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After twelve updates:

$$
\begin{aligned}
B_{12}
&=21{,}000(1.005)^{12}-20{,}000\\
&\approx 2295.23.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 13

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic roots are:

$$
r_1=0.5,
\qquad
r_2=-1.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With distinct roots, the homogeneous solution has the form:

$$
y_n=C_1(0.5)^n+C_2(-1.2)^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the first mode:

$$
|0.5|<1,
$$

so $(0.5)^n\to0$.

```{=latex}
\Needspace{10\baselineskip}
```
For the second mode:

$$
|-1.2|>1.
$$

Its magnitude grows, and its sign alternates because the root is negative.
For general initial data, $C_2$ will not be zero. Therefore the growing mode
is present and the zero solution is unstable.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 14

```{=latex}
\Needspace{10\baselineskip}
```
Euler's method applied to $y'=-4y$ gives:

$$
y_{n+1}=y_n+h(-4y_n).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor $y_n$:

$$
y_{n+1}=(1-4h)y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the multiplier is:

$$
a=1-4h.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $h=0.1$:

$$
\begin{aligned}
a
&=1-4(0.1)\\
&=1-0.4\\
&=0.6.
\end{aligned}
$$

Since $|0.6|<1$, this Euler sequence decays to zero.

```{=latex}
\Needspace{10\baselineskip}
```
For $h=0.6$:

$$
\begin{aligned}
a
&=1-4(0.6)\\
&=1-2.4\\
&=-1.4.
\end{aligned}
$$

Since $|-1.4|>1$, this Euler sequence alternates and grows in magnitude. It
does not reproduce the decay of the continuous solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 34 Final Summary {#chapter-34-final-summary-85}

```{=latex}
\Needspace{10\baselineskip}
```
A difference equation connects values of a sequence at different integer
indices. The forward difference is:

$$
\Delta y_n=y_{n+1}-y_n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second forward difference is:

$$
\Delta^2y_n=y_{n+2}-2y_{n+1}+y_n.
$$

The order of a recurrence is the span between its largest and smallest unknown
indices. A linear recurrence is homogeneous when its forcing side is zero
after all unknown terms have been collected.

```{=latex}
\Needspace{10\baselineskip}
```
The first-order homogeneous recurrence:

$$
y_{n+1}=ay_n
$$

```{=latex}
\Needspace{10\baselineskip}
```
has solution:

$$
y_n=y_0a^n.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the affine recurrence:

$$
y_{n+1}=ay_n+b,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with $a\ne1$, the equilibrium and solution are:

$$
y_*=\frac{b}{1-a}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding affine solution is:

$$
y_n=y_*+(y_0-y_*)a^n.
$$

For a constant-coefficient homogeneous recurrence, the trial $y_n=r^n$
produces the characteristic equation. Distinct roots, repeated roots, and
complex roots give different real solution families.

```{=latex}
\Needspace{10\baselineskip}
```
A nonhomogeneous linear recurrence has the structure:

$$
y_n=y_n^{(h)}+y_n^{(p)}.
$$

When a proposed particular trial overlaps with a characteristic mode, multiply
the trial by a sufficient power of $n$.

```{=latex}
\Needspace{12\baselineskip}
```
The central habits are:

```{=latex}
\Needspace{8\baselineskip}
```
> define exactly what the index and sequence mean, replace the entire index in
> every shifted formula, establish the correct root family before applying
> conditions, verify both the recurrence and the initial data, and interpret
> long-term behaviour from the characteristic roots.

[^1]: If the index represented time steps of width $h$,
    the average rate over one step would be $(y_{n+1}-y_n)/h$. With unit-width
    steps, this reduces to $\Delta y_n$.

[^2]: Numerical instability here is created by the approximation,
    not by the differential equation. Reducing $h$ moves the multiplier
    $1-hk$ closer to $1$ and can restore $|1-hk|<1$.
