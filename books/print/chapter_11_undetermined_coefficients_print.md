```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 11}}
\fancyhead[R]{\sffamily\small\color{BodyInk}The Method Of Undetermined Coefficients}
```
# Chapter 11 - The Method Of Undetermined Coefficients

```{=latex}
\Needspace{12\baselineskip}
```
Chapter 10 solved homogeneous constant-coefficient equations of any finite
order. This chapter adds a forcing term and asks a new question:

```{=latex}
\Needspace{8\baselineskip}
```
> once the complementary solution is known, how can we construct one function
> that produces the required forcing when substituted into the differential
> equation?

The method of undetermined coefficients answers that question for a useful
class of forcing functions. Its central strategy is to predict the **shape** of
a particular solution before calculating its numerical coefficients.

The main questions are:

-   why does one particular solution complete the general solution?
-   how does the forcing term determine the trial family?
-   why must polynomial trials contain every lower power?
-   why must sine and cosine be included together?
-   how are product and sum forcing terms handled?
-   what changes when the first trial overlaps the homogeneous solution?
-   when is this method unavailable?

```{=latex}
\Needspace{20\baselineskip}
```
## From A Homogeneous Family To A Forced Solution {#block-1-from-a-homogeneous-family-to-a-forced-solution}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{10\baselineskip}
```
The goal is to understand the structure:

$$
\boxed{y=y_h+y_p}
$$

before learning how to construct $y_p$.

Here:

-   $y_h$ is the general solution of the associated homogeneous equation
-   $y_p$ is one particular solution of the nonhomogeneous equation

The key distinction is that $y_h$ contains arbitrary constants, while $y_p$
does not.

```{=latex}
\Needspace{12\baselineskip}
```
### The Operator View Of A Forced Equation {#the-operator-view-of-a-forced-equation-2}

```{=latex}
\Needspace{10\baselineskip}
```
Write an $n$th-order linear constant-coefficient equation as:

$$
L[y]=g(x),
$$

where:

-   $L$ is the linear differential operator on the left
-   $y=y(x)$ is the unknown function
-   $g(x)$ is the forcing function on the right

```{=latex}
\Needspace{10\baselineskip}
```
For example:

$$
y''-3y'+2y=5x
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $y''-3y'+2y=5x$ can be written as:

$$
L[y]=5x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
L[y]=y''-3y'+2y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The **associated homogeneous equation** is obtained by replacing the forcing
with zero:

$$
L[y]=0.
$$

This does not mean that the original forcing disappears from the problem. It
creates a related equation whose solution family supplies the complementary
part $y_h$.

```{=latex}
\Needspace{12\baselineskip}
```
### Why $y_h+y_p$ Works {#why-yhyp-works-3}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
L[y_h]=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
L[y_p]=g(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $L$ is linear:

$$
L[y_h+y_p]=L[y_h]+L[y_p].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the two known outputs:

$$
\begin{aligned}
L[y_h+y_p]
&=L[y_h]+L[y_p] \\
&=0+g(x) \\
&=g(x).
\end{aligned}
$$

Therefore $y_h+y_p$ satisfies the nonhomogeneous equation.

```{=latex}
\Needspace{12\baselineskip}
```
A useful interpretation:

```{=latex}
\Needspace{8\baselineskip}
```
> $y_h$ contains every freely adjustable motion allowed by the homogeneous
> equation, while $y_p$ supplies one response forced by the right side.

```{=latex}
\Needspace{12\baselineskip}
```
### Why One Particular Solution Is Enough {#why-one-particular-solution-is-enough-4}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $y_{p,1}$ and $y_{p,2}$ are two particular solutions of the same
equation:

$$
L[y_{p,1}]=g(x),
\qquad
L[y_{p,2}]=g(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the second equation from the first. By linearity:

$$
\begin{aligned}
L[y_{p,1}-y_{p,2}]
&=L[y_{p,1}]-L[y_{p,2}] \\
&=g(x)-g(x) \\
&=0.
\end{aligned}
$$

Thus $y_{p,1}-y_{p,2}$ is a homogeneous solution. Any difference between two
particular solutions is already absorbed by the arbitrary constants in $y_h$.

That is why the method seeks **one** convenient $y_p$, not every possible
particular solution.

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Structural Example {#a-small-structural-example-5}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''-y'-6y=12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The associated homogeneous equation is:

$$
y''-y'-6y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its characteristic equation is:

$$
r^2-r-6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-3)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_h=c_1e^{3x}+c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now look for a constant particular solution:

$$
y_p=A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $A$ is constant:

$$
y_p'=0,
\qquad
y_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $y_p=A$, both derivatives are zero. Substitute $y_p=A$,
$y_p'=0$, and $y_p''=0$ into the original equation:

$$
\begin{aligned}
y_p''-y_p'-6y_p
&=0-0-6A \\
&=-6A.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The required forcing is $12$, so:

$$
-6A=12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-6$:

$$
A=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus one particular solution is:

$$
y_p=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the homogeneous and particular parts:

$$
\boxed{
y=c_1e^{3x}+c_2e^{-2x}-2
}.
$$

The constants $c_1,c_2$ are arbitrary because they belong to $y_h$. The
coefficient $A$ was not arbitrary: substitution forced it to equal $-2$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-6}

```{=latex}
\Needspace{10\baselineskip}
```
For a linear nonhomogeneous equation $L[y]=g(x)$, the general solution has the
form:

$$
y=y_h+y_p.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two parts have different jobs:

$$
L[y_h]=0,
\qquad
L[y_p]=g(x).
$$

Only one particular solution is required because the difference between any
two particular solutions lies in the homogeneous family.

```{=latex}
\Needspace{20\baselineskip}
```
## Reading The Forcing Fingerprint {#block-2-reading-the-forcing-fingerprint}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-7}

The goal is to choose the correct trial family before calculating any
coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
The organising idea is:

```{=latex}
\Needspace{8\baselineskip}
```
> include every function that can appear when the forcing function is
> differentiated repeatedly.

The trial is not a guess at the final numerical answer. It is a finite family
with unknown coefficients that is broad enough to survive differentiation.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Derivative Closure Matters {#why-derivative-closure-matters-8}

The operator $L$ combines a proposed function and several of its derivatives.
If those derivatives leave the proposed family, substitution creates terms
that the trial cannot represent.

```{=latex}
\Needspace{10\baselineskip}
```
For example, differentiating $x^2$ gives:

$$
x^2
\longrightarrow
2x
\longrightarrow
2
\longrightarrow
0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The finite family involved is:

$$
\{x^2,x,1\}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore a second-degree polynomial forcing requires the complete trial:

$$
Ax^2+Bx+C,
$$

not merely $Ax^2$.

```{=latex}
\Needspace{10\baselineskip}
```
Similarly:

$$
\frac{d}{dx}\sin(\omega x)=\omega\cos(\omega x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{d}{dx}\cos(\omega x)=-\omega\sin(\omega x).
$$

Sine and cosine generate each other. A trial for either one must normally
contain both.

```{=latex}
\Needspace{12\baselineskip}
```
### The Basic Trial Ledger {#the-basic-trial-ledger-9}

```{=latex}
\Needspace{10\baselineskip}
```
Before checking for overlap with $y_h$, use the following base trials.

$$
\begin{array}{c|c}
\text{Forcing }g(x) & \text{Base trial for }y_p \\
\hline
P_n(x) & A_nx^n+A_{n-1}x^{n-1}+\cdots+A_1x+A_0 \\
Ke^{ax} & Ae^{ax} \\
K_1\cos(\omega x)+K_2\sin(\omega x)
& A\cos(\omega x)+B\sin(\omega x)
\end{array}
$$

Here:

-   $P_n(x)$ is a polynomial of degree $n$
-   $a$ and $\omega$ are known numbers from the forcing
-   the capital letters $A_j,A,B$ are coefficients to be determined

The values multiplying the forcing do not determine the trial's shape. For
example, $19e^{-4x}$ and $-2e^{-4x}$ both lead to the base trial $Ae^{-4x}$.

```{=latex}
\Needspace{12\baselineskip}
```
### Polynomial Forcing: Keep Every Lower Power {#polynomial-forcing-keep-every-lower-power-10}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
g(x)=7x^3-2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Although the $x^2$ and constant terms are absent, the forcing has degree $3$.
The complete base trial is:

$$
\boxed{y_p=Ax^3+Bx^2+Cx+D}.
$$

The missing powers cannot be omitted. Differentiation and the lower-order
terms in $L$ can create contributions at those powers even when their target
coefficients are zero.

```{=latex}
\Needspace{10\baselineskip}
```
Coefficient comparison will later include:

$$
0x^2
\qquad\text{and}\qquad
0.
$$

Those zero targets are genuine equations for the unknown trial coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### Trigonometric Forcing: Keep Both Partners {#trigonometric-forcing-keep-both-partners-11}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
g(x)=9\sin(5x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing visibly contains only sine, but its derivative contains cosine.
Therefore the base trial is:

$$
\boxed{
y_p=A\cos(5x)+B\sin(5x)
}.
$$

If the forcing were $9\cos(5x)$, the same two-function trial would be used.
One of $A$ or $B$ may turn out to be zero after substitution, but that is a
conclusion of the calculation rather than an assumption made beforehand.

```{=latex}
\Needspace{12\baselineskip}
```
### Products Inherit Every Factor {#products-inherit-every-factor-12}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the forcing is:

$$
g(x)=e^{-2x}(4x^2+1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is an exponential multiplied by a second-degree polynomial. Preserve the
exponential and attach a complete second-degree polynomial:

$$
\boxed{
y_p=e^{-2x}(Ax^2+Bx+C)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a polynomial multiplied by a trigonometric function, both trigonometric
partners need polynomial coefficients. For example:

$$
g(x)=(x-3)\cos(5x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
leads to:

$$
\boxed{
y_p=(Ax+B)\cos(5x)+(Cx+D)\sin(5x)
}.
$$

The two polynomials have the same degree as the polynomial in the forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Sums Produce Sums Of Trials {#sums-produce-sums-of-trials-13}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
g(x)=2e^x+x^2\sin(3x).
$$

Treat the two forcing components separately.

```{=latex}
\Needspace{10\baselineskip}
```
For $2e^x$, use:

$$
y_{p,1}=Ae^x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x^2\sin(3x)$, use a complete quadratic on both trigonometric partners:

$$
y_{p,2}
=(Bx^2+Cx+D)\cos(3x)
+(Ex^2+Fx+G)\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the two trial components:

$$
\boxed{
\begin{aligned}
y_p
&=Ae^x \\
&\quad +(Bx^2+Cx+D)\cos(3x) \\
&\quad +(Ex^2+Fx+G)\sin(3x).
\end{aligned}
}
$$

This base trial is not yet final. It must still be compared with $y_h$ for
overlap.

```{=latex}
\Needspace{12\baselineskip}
```
### The Trial-Selection Checklist {#the-trial-selection-checklist-14}

Before differentiating a trial, ask:

1.  What basic forcing families are present?
2.  What polynomial degree must be preserved?
3.  Is an exponential factor present?
4.  What trigonometric frequency must be preserved?
5.  Have both sine and cosine been included?
6.  If the forcing is a sum, has each component received its own trial?
7.  Does any part of the combined trial overlap $y_h$?

The seventh question is essential. Blocks 3 and 4 first study non-overlapping
examples; Block 5 develops the correction for overlap.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

Trial selection is controlled by derivative closure. Preserve:

-   every polynomial power down to the constant term
-   the forcing exponential
-   both sine and cosine at the forcing frequency
-   every factor in a product
-   every component in a sum

Then compare the complete base trial with the homogeneous solution before
using it.

```{=latex}
\Needspace{20\baselineskip}
```
## Solving The Three Basic Nonresonant Cases {#block-3-solving-the-three-basic-nonresonant-cases}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to carry out the complete method for polynomial, exponential, and
trigonometric forcing when the base trial does not overlap $y_h$.

Every example follows the same sequence:

1.  solve the associated homogeneous equation
2.  choose and check the base trial
3.  differentiate the trial
4.  substitute into the differential equation
5.  compare like coefficients
6.  solve for the trial coefficients
7.  write $y=y_h+y_p$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Polynomial Forcing Example {#worked-polynomial-forcing-example-17}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+y'-6y=-12x^2+10x-15.
$$

#### Step 1: Solve the associated homogeneous equation

```{=latex}
\Needspace{10\baselineskip}
```
Replace the forcing by zero:

$$
y''+y'-6y=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+r-6=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)(r+3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $2$ and $-3$, so:

$$
y_h=c_1e^{2x}+c_2e^{-3x}.
$$

#### Step 2: Build and check the trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is a second-degree polynomial. Use the complete quadratic trial:

$$
y_p=Ax^2+Bx+C.
$$

The homogeneous solution contains exponentials, not polynomial modes, so no
overlap occurs.

#### Step 3: Differentiate the trial

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y_p=Ax^2+Bx+C$:

$$
\begin{aligned}
y_p'&=2Ax+B, \\
y_p''&=2A.
\end{aligned}
$$

#### Step 4: Substitute each expression

```{=latex}
\Needspace{10\baselineskip}
```
The left side is $y_p''+y_p'-6y_p$. Substitute the trial and its derivatives:

$$
\begin{aligned}
y_p''+y_p'-6y_p
&=2A+(2Ax+B)-6(Ax^2+Bx+C).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Distribute $-6$:

$$
\begin{aligned}
y_p''+y_p'-6y_p
&=2A+2Ax+B-6Ax^2-6Bx-6C.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Group equal powers of $x$:

$$
\begin{aligned}
y_p''+y_p'-6y_p
&=(-6A)x^2+(2A-6B)x+(2A+B-6C).
\end{aligned}
$$

#### Step 5: Match the forcing coefficient by coefficient

```{=latex}
\Needspace{10\baselineskip}
```
The differential equation requires:

$$
(-6A)x^2+(2A-6B)x+(2A+B-6C)
=-12x^2+10x-15.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the $x^2$ coefficients:

$$
-6A=-12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The current equation is $-6A=-12$. Divide both sides by $-6$:

$$
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $A=2$ from the $x^2$ coefficient, now match the $x$ coefficients:

$$
2A-6B=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=2$:

$$
4-6B=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $4$:

$$
-6B=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The current equation is $-6B=6$. Divide both sides by $-6$:

$$
B=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the constant coefficients:

$$
2A+B-6C=-15.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=2$ and $B=-1$:

$$
4-1-6C=-15.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the known constants:

$$
3-6C=-15.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $3-6C=-15$, subtract $3$ from both sides:

$$
-6C=-18.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-6$:

$$
C=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Construct the particular and general solutions

```{=latex}
\Needspace{10\baselineskip}
```
Insert $A=2$, $B=-1$, and $C=3$ into the trial:

$$
y_p=2x^2-x+3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now combine $y_h$ and $y_p$:

$$
\boxed{
y=c_1e^{2x}+c_2e^{-3x}+2x^2-x+3
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Exponential Forcing Example {#worked-exponential-forcing-example-18}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y'+3y=30e^{2x}.
$$

#### Step 1: Find the complementary solution

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2+4r+3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the characteristic equation $r^2+4r+3=0$:

$$
(r+1)(r+3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_h=c_1e^{-x}+c_2e^{-3x}.
$$

#### Step 2: Choose and check the trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is a constant multiple of $e^{2x}$, so the base trial is:

$$
y_p=Ae^{2x}.
$$

The homogeneous exponentials are $e^{-x}$ and $e^{-3x}$. Since $e^{2x}$ is
not present in $y_h$, the base trial is valid without modification.

#### Step 3: Differentiate

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y_p=Ae^{2x}$:

$$
\begin{aligned}
y_p'&=2Ae^{2x}, \\
y_p''&=4Ae^{2x}.
\end{aligned}
$$

#### Step 4: Substitute into the left side

```{=latex}
\Needspace{10\baselineskip}
```
Use $y_p''+4y_p'+3y_p$:

$$
\begin{aligned}
y_p''+4y_p'+3y_p
&=4Ae^{2x}+4(2Ae^{2x})+3(Ae^{2x}) \\
&=4Ae^{2x}+8Ae^{2x}+3Ae^{2x} \\
&=15Ae^{2x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The required forcing is $30e^{2x}$, so:

$$
15Ae^{2x}=30e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential $e^{2x}$ is nonzero, so divide both sides by it:

$$
15A=30.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $15$:

$$
A=2.
$$

#### Step 5: Write the complete solution

```{=latex}
\Needspace{10\baselineskip}
```
The particular solution is:

$$
y_p=2e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y=c_1e^{-x}+c_2e^{-3x}+2e^{2x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Trigonometric Forcing Example {#worked-trigonometric-forcing-example-19}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+2y'+5y=-16\cos(3x)+2\sin(3x).
$$

#### Step 1: Find the complementary solution

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2+2r+5=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Complete the square:

$$
(r+1)^2+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $(r+1)^2+4=0$, the roots are:

$$
r=-1\pm2i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complementary solution is:

$$
y_h=e^{-x}\left(c_1\cos(2x)+c_2\sin(2x)\right).
$$

#### Step 2: Choose and check the trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing frequency is $3$, so include both trigonometric partners:

$$
y_p=A\cos(3x)+B\sin(3x).
$$

The homogeneous solution uses frequency $2$ with an $e^{-x}$ envelope. The
trial uses frequency $3$ with no exponential envelope, so no overlap occurs.

#### Step 3: Differentiate carefully

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y_p=A\cos(3x)+B\sin(3x)$:

$$
\begin{aligned}
y_p'
&=-3A\sin(3x)+3B\cos(3x), \\
y_p''
&=-9A\cos(3x)-9B\sin(3x).
\end{aligned}
$$

#### Step 4: Substitute and group the two function types

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y_p''+2y_p'+5y_p$:

$$
\begin{aligned}
y_p''+2y_p'+5y_p
&=[-9A\cos(3x)-9B\sin(3x)] \\
&\quad+2[-3A\sin(3x)+3B\cos(3x)] \\
&\quad+5[A\cos(3x)+B\sin(3x)].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the cosine terms:

$$
(-9A+6B+5A)\cos(3x)=(-4A+6B)\cos(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the sine terms:

$$
(-9B-6A+5B)\sin(3x)=(-6A-4B)\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $L[y_{p,1}]=g_1(x)$ and $L[y_{p,2}]=g_2(x)$, linearity gives the combined
particular solution:

$$
\begin{aligned}
y_p''+2y_p'+5y_p
&=(-4A+6B)\cos(3x) \\
&\quad+(-6A-4B)\sin(3x).
\end{aligned}
$$

#### Step 5: Match cosine and sine coefficients

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is:

$$
-16\cos(3x)+2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the coefficients satisfy:

$$
\begin{aligned}
-4A+6B&=-16, \\
-6A-4B&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
We now solve this system without skipping the elimination step. Multiply the
first equation by $2$:

$$
-8A+12B=-32.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the second equation by $3$:

$$
-18A-12B=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the two equations. The $B$-terms cancel:

$$
-26A=-26.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-26$:

$$
A=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1$ into the first coefficient equation:

$$
-4(1)+6B=-16.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-4+6B=-16.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $-4+6B=-16$, add $4$ to both sides:

$$
6B=-12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $6$:

$$
B=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Write the particular and general solutions

```{=latex}
\Needspace{10\baselineskip}
```
Insert $A=1$ and $B=-2$ into the trial:

$$
y_p=\cos(3x)-2\sin(3x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine with $y_h$:

$$
\boxed{
y=e^{-x}\left(c_1\cos(2x)+c_2\sin(2x)\right)
+\cos(3x)-2\sin(3x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-20}

For a nonresonant forcing term:

1.  solve for $y_h$
2.  choose the derivative-closed base trial
3.  verify that it does not overlap $y_h$
4.  substitute the trial and its derivatives
5.  compare coefficients of independent function types
6.  determine every trial coefficient
7.  write $y=y_h+y_p$

Polynomial powers, exponentials with different exponents, and trigonometric
functions with different frequencies must be compared separately.

```{=latex}
\Needspace{20\baselineskip}
```
## Product And Sum Forcing Terms {#block-4-product-and-sum-forcing-terms}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-21}

The goal is to preserve the complete forcing fingerprint when exponentials,
polynomials, and trigonometric functions are multiplied or added.

For a product, keep every visible factor. For a sum, build one trial component
for each forcing component and then add them.

```{=latex}
\Needspace{12\baselineskip}
```
### Exponential Times Polynomial {#exponential-times-polynomial-22}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-2y'+5y=e^x(8x-4).
$$

#### Step 1: Solve the homogeneous equation

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-2r+5=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite it as:

$$
(r-1)^2+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $1\pm2i$, so:

$$
y_h=e^x\left(c_1\cos(2x)+c_2\sin(2x)\right).
$$

#### Step 2: Build and check the product trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is $e^x$ multiplied by a first-degree polynomial. Preserve both
parts:

$$
y_p=e^x(Ax+B).
$$

Although $y_h$ contains an $e^x$ envelope, its modes also contain
$\cos(2x)$ and $\sin(2x)$. Neither $e^x x$ nor $e^x$ alone is a homogeneous
mode, so the trial does not overlap $y_h$.

#### Step 3: Differentiate the product explicitly

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
y_p=e^x(Ax+B).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the product rule once:

$$
\begin{aligned}
y_p'
&=e^x(Ax+B)+e^x(A) \\
&=e^x(Ax+A+B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
\begin{aligned}
y_p''
&=e^x(Ax+A+B)+e^x(A) \\
&=e^x(Ax+2A+B).
\end{aligned}
$$

#### Step 4: Substitute without dropping the common exponential

```{=latex}
\Needspace{10\baselineskip}
```
Use $y_p''-2y_p'+5y_p$:

$$
\begin{aligned}
y_p''-2y_p'+5y_p
&=e^x(Ax+2A+B) \\
&\quad-2e^x(Ax+A+B) \\
&\quad+5e^x(Ax+B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $e^x$:

$$
\begin{aligned}
y_p''-2y_p'+5y_p
&=e^x\bigl[(Ax+2A+B) \\
&\qquad-2(Ax+A+B)+5(Ax+B)\bigr].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the $x$-terms and constant terms inside the brackets:

$$
\begin{aligned}
y_p''-2y_p'+5y_p
&=e^x\left[(A-2A+5A)x\right. \\
&\qquad\left.+(2A+B-2A-2B+5B)\right] \\
&=e^x(4Ax+4B).
\end{aligned}
$$

#### Step 5: Compare the polynomial inside $e^x$

```{=latex}
\Needspace{10\baselineskip}
```
The required forcing is:

$$
e^x(8x-4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^x$ is nonzero, compare the polynomial coefficients:

$$
4Ax+4B=8x-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the $x$ coefficients:

$$
4A=8,
\qquad
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the constant coefficients:

$$
4B=-4,
\qquad
B=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_p=e^x(2x-1).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y=e^x\left(c_1\cos(2x)+c_2\sin(2x)\right)+e^x(2x-1)
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Polynomial Times Trigonometric Forcing {#polynomial-times-trigonometric-forcing-23}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+y=(-3x+5)\cos(2x)+(-6x-1)\sin(2x).
$$

#### Step 1: Find $y_h$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous characteristic equation is:

$$
r^2+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $\pm i$, so:

$$
y_h=c_1\cos x+c_2\sin x.
$$

#### Step 2: Build the complete paired trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing contains first-degree polynomials multiplying sine and cosine at
frequency $2$. Use:

$$
y_p=(Ax+B)\cos(2x)+(Cx+D)\sin(2x).
$$

The homogeneous frequency is $1$, while the trial frequency is $2$. Therefore
the trial does not overlap $y_h$.

#### Step 3: Differentiate once

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $(Ax+B)\cos(2x)$ by the product rule:

$$
\frac{d}{dx}[(Ax+B)\cos(2x)]
=A\cos(2x)-2(Ax+B)\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $(Cx+D)\sin(2x)$:

$$
\frac{d}{dx}[(Cx+D)\sin(2x)]
=C\sin(2x)+2(Cx+D)\cos(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add
$A\cos(2x)-2(Ax+B)\sin(2x)$ and
$C\sin(2x)+2(Cx+D)\cos(2x)$, then group sine and cosine:

$$
\begin{aligned}
y_p'
&=[A+2(Cx+D)]\cos(2x) \\
&\quad+[C-2(Ax+B)]\sin(2x).
\end{aligned}
$$

#### Step 4: Use a local second-derivative calculation

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the grouped first derivative. The resulting second derivative
is:

$$
\begin{aligned}
y_p''
&=[4C-4(Ax+B)]\cos(2x) \\
&\quad+[-4A-4(Cx+D)]\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
To see the source of the first cosine coefficient, differentiate both parts
that contribute cosine:

$$
2C\cos(2x)+2[C-2(Ax+B)]\cos(2x)
=[4C-4(Ax+B)]\cos(2x).
$$

The sine coefficient follows in the same way from the product rule.

#### Step 5: Add $y_p$ to $y_p''$

```{=latex}
\Needspace{10\baselineskip}
```
The left side is $y_p''+y_p$. Add the cosine coefficients:

$$
4C-4(Ax+B)+(Ax+B)=4C-3Ax-3B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the sine coefficients:

$$
-4A-4(Cx+D)+(Cx+D)=-4A-3Cx-3D.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete expression for $y_p''+y_p$ is:

$$
\begin{aligned}
y_p''+y_p
&=(-3Ax+4C-3B)\cos(2x) \\
&\quad+(-3Cx-4A-3D)\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Compare all four coefficients

```{=latex}
\Needspace{10\baselineskip}
```
Match this expression with:

$$
(-3x+5)\cos(2x)+(-6x-1)\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The $x\cos(2x)$ coefficients give:

$$
-3A=-3,
\qquad
A=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The $x\sin(2x)$ coefficients give:

$$
-3C=-6,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant cosine coefficients give:

$$
4C-3B=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=2$:

$$
8-3B=5,
\qquad
B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The constant sine coefficients give:

$$
-4A-3D=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1$:

$$
-4-3D=-1,
\qquad
D=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Assemble the solution

```{=latex}
\Needspace{10\baselineskip}
```
The particular solution is:

$$
y_p=(x+1)\cos(2x)+(2x-1)\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y=c_1\cos x+c_2\sin x
+(x+1)\cos(2x)+(2x-1)\sin(2x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Why Sums Can Be Split {#why-sums-can-be-split-24}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose:

$$
L[y]=g_1(x)+g_2(x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
L[y_{p,1}]=g_1(x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
L[y_{p,2}]=g_2(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
then linearity gives:

$$
\begin{aligned}
L[y_{p,1}+y_{p,2}]
&=L[y_{p,1}]+L[y_{p,2}] \\
&=g_1(x)+g_2(x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because these two operator equations have just been established, a particular
solution for the combined forcing is:

$$
y_p=y_{p,1}+y_{p,2}.
$$

This allows a complicated forcing sum to be separated into manageable
components. Each component must be checked separately for overlap with $y_h$.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-25}

```{=latex}
\Needspace{10\baselineskip}
```
For products, preserve every factor in the trial. For sums, construct and add
separate trial components. In particular:

$$
e^{ax}P_n(x)
\quad\leadsto\quad
e^{ax}Q_n(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
P_n(x)\cos(\omega x)
\quad\leadsto\quad
Q_n(x)\cos(\omega x)+R_n(x)\sin(\omega x),
$$

where $Q_n$ and $R_n$ are complete degree-$n$ polynomials with undetermined
coefficients.

```{=latex}
\Needspace{20\baselineskip}
```
## Resonance And The Overlap Correction {#block-5-resonance-and-the-overlap-correction}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-26}

The goal is to repair a base trial that is already part of the homogeneous
solution.

```{=latex}
\Needspace{10\baselineskip}
```
The correction rule is:

$$
\boxed{
\text{multiply the complete base trial by }x^s
}
$$

where $s$ is the multiplicity with which the relevant characteristic root or
conjugate pair occurs.

This is not a decorative change. It moves the trial out of the homogeneous
solution space so the operator can produce a nonzero forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Why An Overlapping Trial Cannot Work {#why-an-overlapping-trial-cannot-work-27}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the forcing is $e^{ax}$ and the base trial is:

$$
y_p=Ae^{ax}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $e^{ax}$ already belongs to $y_h$, then it satisfies the homogeneous
equation:

$$
L[e^{ax}]=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiplying by a constant does not change that output:

$$
L[Ae^{ax}]=A\,L[e^{ax}]=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A particular solution for the nonzero forcing $e^{ax}$ must instead satisfy:

$$
L[y_p]=e^{ax},
$$

which is nonzero. No value of $A$ can make the overlapping trial work.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning:

```{=latex}
\Needspace{8\baselineskip}
```
> check overlap before differentiating; otherwise an impossible coefficient
> equation such as $0=1$ will appear only after unnecessary work.

```{=latex}
\Needspace{12\baselineskip}
```
### Reading The Correcting Power From Multiplicity {#reading-the-correcting-power-from-multiplicity-28}

```{=latex}
\Needspace{10\baselineskip}
```
For an exponential-trigonometric forcing, associate the complex number:

$$
\lambda=a+i\omega.
$$

Here:

-   $a$ is the exponential rate
-   $\omega$ is the trigonometric frequency
-   pure exponential forcing has $\omega=0$
-   pure polynomial forcing corresponds to $\lambda=0$

Compare $\lambda$ with the roots of the characteristic polynomial.

If $\lambda$ is not a root, use $s=0$ and keep the base trial unchanged.

If $\lambda$ is a root of multiplicity $s$, multiply the **entire** base trial
by $x^s$.

```{=latex}
\Needspace{10\baselineskip}
```
The overlap ledger is:

$$
\begin{array}{c|c}
\text{Root status} & \text{Trial correction} \\
\hline
\lambda\text{ is not a root} & x^0=1 \\
\lambda\text{ is a simple root} & x \\
\lambda\text{ has multiplicity }2 & x^2 \\
\lambda\text{ has multiplicity }s & x^s
\end{array}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Repeated Real Resonance {#repeated-real-resonance-29}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-4y'+4y=e^{2x}.
$$

#### Step 1: Find $y_h$ and the root multiplicity

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
The root $r=2$ has multiplicity $2$, so:

$$
y_h=(c_1+c_2x)e^{2x}.
$$

#### Step 2: Build and correct the base trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $e^{2x}$ suggests the base trial:

$$
Ae^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
That function overlaps $y_h$. Because the root $2$ has multiplicity $2$,
multiply the complete base trial by $x^2$:

$$
y_p=Ax^2e^{2x}.
$$

#### Step 3: Use the repeated-factor operator efficiently

```{=latex}
\Needspace{10\baselineskip}
```
The differential operator factors as:

$$
L=(D-2)^2,
$$

where $D=d/dx$.

```{=latex}
\Needspace{10\baselineskip}
```
Write the corrected trial as:

$$
y_p=e^{2x}v(x),
\qquad
v(x)=Ax^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From Chapter 10:

$$
(D-2)^2[e^{2x}v]=e^{2x}v''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $v=Ax^2$ twice:

$$
v'=2Ax,
\qquad
v''=2A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
L[y_p]=2Ae^{2x}.
$$

#### Step 4: Match the forcing

```{=latex}
\Needspace{10\baselineskip}
```
The differential equation requires:

$$
2Ae^{2x}=e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by the nonzero function $e^{2x}$:

$$
2A=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $2A=1$ gives:

$$
A=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1/2$ into the corrected trial $y_p=Ax^2e^{2x}$:

$$
y_p=\frac12x^2e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y=e^{2x}\left(c_1+c_2x+\frac12x^2\right)
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Trigonometric Resonance {#trigonometric-resonance-30}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=6\cos(2x).
$$

#### Step 1: Find the homogeneous frequency

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $\pm2i$, so:

$$
y_h=c_1\cos(2x)+c_2\sin(2x).
$$

#### Step 2: Correct the paired base trial

```{=latex}
\Needspace{10\baselineskip}
```
The base trial for $6\cos(2x)$ is:

$$
A\cos(2x)+B\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both functions already occur in $y_h$. The pair $\pm2i$ is simple, so
multiply the entire paired trial by $x$:

$$
y_p=x[A\cos(2x)+B\sin(2x)].
$$

#### Step 3: Differentiate the two corrected modes

```{=latex}
\Needspace{10\baselineskip}
```
For the cosine component:

$$
\begin{aligned}
\frac{d}{dx}[x\cos(2x)]
&=\cos(2x)-2x\sin(2x), \\
\frac{d^2}{dx^2}[x\cos(2x)]
&=-4\sin(2x)-4x\cos(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using
$(x\cos(2x))''=-4\sin(2x)-4x\cos(2x)$, add
$4[x\cos(2x)]$:

$$
\left(\frac{d^2}{dx^2}+4\right)[x\cos(2x)]
=-4\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the sine component:

$$
\begin{aligned}
\frac{d}{dx}[x\sin(2x)]
&=\sin(2x)+2x\cos(2x), \\
\frac{d^2}{dx^2}[x\sin(2x)]
&=4\cos(2x)-4x\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\left(\frac{d^2}{dx^2}+4\right)[x\sin(2x)]
=4\cos(2x).
$$

#### Step 4: Apply the operator to the complete trial

```{=latex}
\Needspace{10\baselineskip}
```
Using the two outputs just calculated:

$$
\begin{aligned}
y_p''+4y_p
&=A[-4\sin(2x)]+B[4\cos(2x)] \\
&=4B\cos(2x)-4A\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with $6\cos(2x)+0\sin(2x)$:

$$
4B=6,
\qquad
-4A=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
B=\frac32,
\qquad
A=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The particular solution is:

$$
y_p=\frac32x\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y=c_1\cos(2x)+c_2\sin(2x)+\frac32x\sin(2x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Polynomial Resonance At The Zero Root {#polynomial-resonance-at-the-zero-root-31}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y'''-y''=12x-10.
$$

#### Step 1: Inspect the zero-root multiplicity

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^3-r^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
r^2(r-1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The root $0$ has multiplicity $2$, and the root $1$ is simple. Therefore:

$$
y_h=c_1+c_2x+c_3e^x.
$$

#### Step 2: Correct the polynomial base trial

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is first-degree, so the base trial is:

$$
Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both $1$ and $x$ occur in $y_h$ because the zero root has multiplicity $2$.
Multiply the entire base trial by $x^2$:

$$
\begin{aligned}
y_p
&=x^2(Ax+B) \\
&=Ax^3+Bx^2.
\end{aligned}
$$

#### Step 3: Differentiate to the required order

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $y_p=Ax^3+Bx^2$:

$$
\begin{aligned}
y_p'&=3Ax^2+2Bx, \\
y_p''&=6Ax+2B, \\
y_p'''&=6A.
\end{aligned}
$$

#### Step 4: Substitute and compare coefficients

```{=latex}
\Needspace{10\baselineskip}
```
The left side is $y_p'''-y_p''$:

$$
\begin{aligned}
y_p'''-y_p''
&=6A-(6Ax+2B) \\
&=(-6A)x+(6A-2B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with $12x-10$:

$$
-6A=12,
\qquad
6A-2B=-10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first coefficient equation is $-6A=12$. Divide by $-6$:

$$
A=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-2$ into the second equation:

$$
6(-2)-2B=-10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-12-2B=-10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $12$:

$$
-2B=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $-2B=2$ gives:

$$
B=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-2$ and $B=-1$ into $y_p=Ax^3+Bx^2$:

$$
y_p=-2x^3-x^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
\boxed{
y=c_1+c_2x+c_3e^x-2x^3-x^2
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Resonance Checklist {#resonance-checklist-32}

Before accepting a trial:

1.  solve the characteristic equation
2.  write enough of $y_h$ to see every mode
3.  build the complete base trial from the forcing
4.  identify the forcing exponent and frequency
5.  compare them with the characteristic roots
6.  read the relevant multiplicity $s$
7.  multiply the entire base trial by $x^s$
8.  only then differentiate and determine coefficients

Do not multiply by $x$ merely because the equation is nonhomogeneous. The
correction is used only when overlap occurs, and its power comes from
multiplicity.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-33}

```{=latex}
\Needspace{10\baselineskip}
```
A base trial that overlaps $y_h$ is annihilated by the homogeneous operator
and cannot generate the forcing. If the matching root or conjugate pair has
multiplicity $s$, use:

$$
y_p=x^s(\text{complete base trial}).
$$

Polynomial resonance is overlap at the zero root. Trigonometric resonance is
overlap at a conjugate pair. The same multiplicity rule governs every case.

```{=latex}
\Needspace{20\baselineskip}
```
## Complete Problems With Several Moving Parts {#block-6-complete-problems-with-several-moving-parts}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-34}

The goal is to coordinate homogeneous solving, trial selection, resonance,
sum splitting, and initial conditions without losing the source of any term.

```{=latex}
\Needspace{12\baselineskip}
```
### Mixed Polynomial And Resonant Exponential Forcing {#mixed-polynomial-and-resonant-exponential-forcing-35}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-y'-2y=8x-3+5e^{-x}.
$$

#### Step 1: Solve the associated homogeneous equation

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-r-2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the characteristic equation $r^2-r-2=0$:

$$
(r-2)(r+1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $2$ and $-1$, so:

$$
y_h=c_1e^{2x}+c_2e^{-x}.
$$

#### Step 2: Split the forcing and build two trials

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
g_1(x)=8x-3,
\qquad
g_2(x)=5e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the polynomial component, use:

$$
y_{p,1}=Ax+B.
$$

The zero root is not a characteristic root, so this polynomial trial does not
overlap $y_h$.

```{=latex}
\Needspace{10\baselineskip}
```
For the exponential component, the base trial would be $Ce^{-x}$. However,
$e^{-x}$ occurs in $y_h$ because $-1$ is a simple root. Multiply that trial by
$x$:

$$
y_{p,2}=Cxe^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete corrected trial is:

$$
y_p=y_{p,1}+y_{p,2}=Ax+B+Cxe^{-x}.
$$

#### Step 3: Solve the polynomial component locally

```{=latex}
\Needspace{10\baselineskip}
```
For $y_{p,1}=Ax+B$:

$$
y_{p,1}'=A,
\qquad
y_{p,1}''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $L[y]=y''-y'-2y$:

$$
\begin{aligned}
L[y_{p,1}]
&=0-A-2(Ax+B) \\
&=(-2A)x+(-A-2B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with $g_1(x)=8x-3$:

$$
-2A=8,
\qquad
-A-2B=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first coefficient equation is $-2A=8$, so:

$$
A=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-4$ into the second equation:

$$
-(-4)-2B=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
4-2B=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $4$:

$$
-2B=-7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $-2B=-7$ gives:

$$
B=\frac72.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-4$ and $B=7/2$ into $y_{p,1}=Ax+B$:

$$
y_{p,1}=-4x+\frac72.
$$

#### Step 4: Solve the resonant exponential component locally

```{=latex}
\Needspace{10\baselineskip}
```
For the corrected trial $y_{p,2}=Cxe^{-x}$, differentiate by the product
rule:

$$
\begin{aligned}
y_{p,2}'
&=C[e^{-x}-xe^{-x}] \\
&=C(1-x)e^{-x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $y_{p,2}'=C(1-x)e^{-x}$ again:

$$
\begin{aligned}
y_{p,2}''
&=C[-e^{-x}-(1-x)e^{-x}] \\
&=C(x-2)e^{-x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $L[y]=y''-y'-2y$:

$$
\begin{aligned}
L[y_{p,2}]
&=C(x-2)e^{-x}-C(1-x)e^{-x}-2Cxe^{-x} \\
&=C[(x-2)-(1-x)-2x]e^{-x} \\
&=C[x-2-1+x-2x]e^{-x} \\
&=-3Ce^{-x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with $g_2(x)=5e^{-x}$:

$$
-3Ce^{-x}=5e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $-3Ce^{-x}=5e^{-x}$, divide by the nonzero function $e^{-x}$:

$$
-3C=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation $-3C=5$ gives:

$$
C=-\frac53.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=-5/3$ into $y_{p,2}=Cxe^{-x}$:

$$
y_{p,2}=-\frac53xe^{-x}.
$$

#### Step 5: Combine all three parts

```{=latex}
\Needspace{10\baselineskip}
```
The particular solution is:

$$
y_p=-4x+\frac72-\frac53xe^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add it to the homogeneous solution:

$$
\boxed{
y=c_1e^{2x}+c_2e^{-x}
-4x+\frac72-\frac53xe^{-x}
}.
$$

The term $c_2e^{-x}$ cannot absorb $xe^{-x}$ because they are linearly
independent functions. The resonance correction created a genuinely new
particular mode.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### A Resonant Initial-Value Problem {#a-resonant-initial-value-problem-36}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+y=4\sin x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=1,
\qquad
y'(0)=0.
$$

#### Step 1: Find $y_h$

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
The roots are $\pm i$, so:

$$
y_h=c_1\cos x+c_2\sin x.
$$

#### Step 2: Build the corrected trial

```{=latex}
\Needspace{10\baselineskip}
```
The base trial for $4\sin x$ is:

$$
A\cos x+B\sin x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Both modes occur in $y_h$. The pair $\pm i$ is simple, so multiply the entire
trial by $x$:

$$
y_p=x(A\cos x+B\sin x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this sine forcing, the coefficient calculation will select the cosine
component. The two local operator outputs are:

$$
\begin{aligned}
\left(\frac{d^2}{dx^2}+1\right)[x\cos x]
&=-2\sin x, \\
\left(\frac{d^2}{dx^2}+1\right)[x\sin x]
&=2\cos x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $L=d^2/dx^2+1$ to
$y_p=x[A\cos x+B\sin x]$ using these two identities:

$$
y_p''+y_p=-2A\sin x+2B\cos x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $4\sin x+0\cos x$:

$$
-2A=4,
\qquad
2B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A=-2,
\qquad
B=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The particular solution is:

$$
y_p=-2x\cos x.
$$

#### Step 3: Write the general solution before using conditions

```{=latex}
\Needspace{10\baselineskip}
```
Combine $y_h$ and $y_p$:

$$
y=c_1\cos x+c_2\sin x-2x\cos x.
$$

#### Step 4: Apply $y(0)=1$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the complete solution:

$$
1=c_1\cos0+c_2\sin0-2(0)\cos0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $\cos0=1$ and $\sin0=0$:

$$
1=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The condition has reduced to $1=c_1$, so:

$$
c_1=1.
$$

#### Step 5: Differentiate the complete solution

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate every term in
$y=c_1\cos x+c_2\sin x-2x\cos x$:

$$
\begin{aligned}
y'
&=-c_1\sin x+c_2\cos x \\
&\quad-2\cos x+2x\sin x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply $y'(0)=0$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $x=0$ into the derivative formula:

$$
0=-c_1\sin0+c_2\cos0-2\cos0+2(0)\sin0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $\sin0=0$ and $\cos0=1$:

$$
0=c_2-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $2$:

$$
c_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Write the selected solution

```{=latex}
\Needspace{10\baselineskip}
```
Insert $c_1=1$ and $c_2=2$:

$$
\boxed{
y=\cos x+2\sin x-2x\cos x
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-37}

```{=latex}
\Needspace{10\baselineskip}
```
For a forcing sum, split the particular solution into matching components and
check each component independently for resonance. After all trial
coefficients are fixed, reconstruct:

$$
y=y_h+y_p.
$$

Only then apply initial or boundary conditions to the arbitrary constants in
$y_h$.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Workflow, Limits, And Common Mistakes {#block-7-a-reliable-workflow-limits-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Complete Workflow {#the-complete-workflow-38}

#### Step 1: Check that the equation fits the method

Confirm that the equation is linear and has constant coefficients.

#### Step 2: Isolate the forcing

```{=latex}
\Needspace{10\baselineskip}
```
Write the equation in the form:

$$
L[y]=g(x).
$$

#### Step 3: Solve the associated homogeneous equation

Find the characteristic roots and write the complete complementary solution
$y_h$.

#### Step 4: Split a forcing sum

If $g(x)$ is a sum of manageable components, plan one trial component for each
one.

#### Step 5: Build each base trial

Use the derivative-closed family matching the forcing fingerprint.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Perform the overlap check

Compare each complete base trial with $y_h$. If its associated root has
multiplicity $s$, multiply that entire trial component by $x^s$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Differentiate the corrected trial

Keep product-rule and chain-rule steps visible, especially for exponential or
trigonometric products.

#### Step 8: Substitute and group like functions

Collect independent types separately: polynomial powers, distinct
exponentials, and sine-cosine pairs at each frequency.

#### Step 9: Solve for the trial coefficients

These coefficients are determined numbers, not arbitrary integration
constants.

#### Step 10: Reconstruct and verify

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
y=y_h+y_p
$$

and verify at least the particular part by checking $L[y_p]=g(x)$.

#### Step 11: Apply extra conditions last

Use initial or boundary conditions only after the complete general solution is
available.

```{=latex}
\Needspace{12\baselineskip}
```
### When The Method Applies {#when-the-method-applies-39}

The method is designed for linear constant-coefficient equations whose
forcing belongs to a finite derivative-closed family.

```{=latex}
\Needspace{10\baselineskip}
```
Typical admissible forcing components include:

$$
P_n(x),
\qquad
e^{ax}P_n(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
A third admissible family is:

$$
e^{ax}\left[P_n(x)\cos(\omega x)+Q_n(x)\sin(\omega x)\right].
$$

Finite sums of these forms are also admissible.

The word **finite** matters. Repeated differentiation must remain inside a
finite-dimensional family that can be represented by finitely many
undetermined coefficients.

```{=latex}
\Needspace{12\baselineskip}
```
### When Another Method Is Needed {#when-another-method-is-needed-40}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y''+y=\ln x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Repeated derivatives of $\ln x$ produce:

$$
\frac1x,
\quad
-\frac1{x^2},
\quad
\frac{2}{x^3},
\quad\ldots
$$

No finite trial family closes under differentiation, so undetermined
coefficients is not the appropriate method.

```{=latex}
\Needspace{10\baselineskip}
```
Now consider:

$$
xy''+y=e^x.
$$

The coefficient of $y''$ is the variable $x$, not a constant. Even though the
forcing is an exponential, the standard constant-coefficient trial rules do
not apply.

Variation of parameters, introduced in Chapter 12, handles a broader class of
linear equations.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Choosing A Trial Before Finding $y_h$ {#common-mistake-choosing-a-trial-before-finding-yh-41}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
y''-6y'+9y=e^{3x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the forcing suggests $Ae^{3x}$. However, the characteristic equation is:

$$
(r-3)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $e^{3x}$ and $xe^{3x}$ already occur in $y_h$. The corrected trial must
be:

$$
Ax^2e^{3x}.
$$

Finding $y_h$ first makes the required power of $x$ visible.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Omitting Lower Polynomial Powers {#common-mistake-omitting-lower-polynomial-powers-42}

```{=latex}
\Needspace{10\baselineskip}
```
For a cubic forcing, the trial must be:

$$
Ax^3+Bx^2+Cx+D.
$$

Using only $Ax^3$ assumes in advance that the lower coefficients are zero.
The differential operator may require nonzero lower-degree terms even when
some powers are absent from the forcing.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using Only The Visible Trigonometric Function {#common-mistake-using-only-the-visible-trigonometric-function-43}

```{=latex}
\Needspace{10\baselineskip}
```
For a forcing proportional to $\sin(4x)$, do not use only $A\sin(4x)$.
Differentiation creates cosine, so use:

$$
A\cos(4x)+B\sin(4x).
$$

The paired family must also be multiplied as a unit if resonance occurs.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Multiplying Only One Term By $x^s$ {#common-mistake-multiplying-only-one-term-by-xs-44}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the corrected base family is:

$$
(Ax+B)\cos(2x)+(Cx+D)\sin(2x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and the relevant conjugate pair has multiplicity $2$. The correction is:

$$
x^2\left[(Ax+B)\cos(2x)+(Cx+D)\sin(2x)\right].
$$

The factor $x^2$ multiplies the entire trial component. Applying it to only
the sine term or only the highest-degree terms destroys the derivative-closed
family.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating Trial Coefficients As Arbitrary {#common-mistake-treating-trial-coefficients-as-arbitrary-45}

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
y_p=Ax^2+Bx+C,
$$

the values $A,B,C$ are determined by substitution. They are not extra
integration constants.

The arbitrary constants appear only in $y_h$. Adding arbitrary constants to
$y_p$ would duplicate homogeneous freedom already represented there.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reporting Only $y_p$ {#common-mistake-reporting-only-yp-46}

```{=latex}
\Needspace{10\baselineskip}
```
The method constructs a particular solution, but the general solution is:

$$
y=y_h+y_p.
$$

Unless the problem asks only for a particular solution or only for the trial
form, stopping at $y_p$ leaves out the arbitrary homogeneous family.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-47}

The method succeeds when three decisions are made in the correct order:

1.  identify the homogeneous modes
2.  build a derivative-closed trial from the forcing
3.  correct every overlap using the exact root multiplicity

After substitution determines the trial coefficients, attach the particular
solution to $y_h$ and apply any additional conditions.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-8-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-48}

#### Problem 1: Build A Complete Polynomial Trial

```{=latex}
\Needspace{10\baselineskip}
```
An equation has constant coefficients, its homogeneous solution contains no
polynomial modes, and its forcing is:

$$
5x^4-3x+2.
$$

Write the correct trial form for $y_p$.

#### Problem 2: Preserve An Exponential-Polynomial Product

```{=latex}
\Needspace{10\baselineskip}
```
An equation has no homogeneous mode with exponential rate $-2$. Its forcing
is:

$$
e^{-2x}(x^2+4).
$$

Write the correct trial form.

#### Problem 3: Preserve Both Trigonometric Partners

```{=latex}
\Needspace{10\baselineskip}
```
An equation has no homogeneous mode at frequency $4$. Its forcing is:

$$
(3x-1)\sin(4x).
$$

Write the correct trial form.

#### Problem 4: Correct A Simple Exponential Resonance

The complementary solution contains $c_1e^{3x}$, and the forcing is
$7e^{3x}$. The root $3$ is simple. Write the corrected trial form.

#### Problem 5: Correct A Repeated Product Resonance

```{=latex}
\Needspace{10\baselineskip}
```
The complementary solution contains:

$$
e^{-x}(c_1+c_2x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
and the forcing is:

$$
e^{-x}(2x+5).
$$

Write the corrected trial form.

#### Problem 6: Recognise Polynomial Resonance

```{=latex}
\Needspace{10\baselineskip}
```
The complementary solution is:

$$
y_h=c_1+c_2x+c_3e^{2x},
$$

and the forcing is $4x-1$. Write the corrected trial form.

#### Problem 7: Solve A Polynomially Forced Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-3y'+2y=-2x^2+10x-6.
$$

#### Problem 8: Solve An Exponentially Forced Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-2y'+2y=10e^{-x}.
$$

#### Problem 9: Solve A Trigonometrically Forced Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+3y'+2y=-10\cos(2x)-10\sin(2x).
$$

#### Problem 10: Solve A Repeated Resonance

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-6y'+9y=12e^{3x}.
$$

#### Problem 11: Solve A Mixed Forcing Problem

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-y'-2y=-2x-5+6e^{2x}.
$$

#### Problem 12: Solve A Resonant Initial-Value Problem

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=8\cos(2x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
y(0)=3,
\qquad
y'(0)=1.
$$

#### Problem 13: Diagnose The Method's Scope

```{=latex}
\Needspace{10\baselineskip}
```
For each equation, state whether the standard method of undetermined
coefficients applies and explain why:

```{=latex}
\Needspace{10\baselineskip}
```
$$
\text{(a)}\quad y''+5y=xe^{-x},
$$

```{=latex}
\Needspace{10\baselineskip}
```
$$
\text{(b)}\quad y''+y=\ln x,
$$

$$
\text{(c)}\quad xy''-y'=e^x.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 6 {#worked-answers-problems-1-to-6-49}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is:

$$
5x^4-3x+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its highest power is $x^4$, so use a complete fourth-degree polynomial. The
missing $x^3$ and $x^2$ terms in the forcing do not remove those terms from the
trial:

$$
\boxed{
y_p=Ax^4+Bx^3+Cx^2+Dx+E
}.
$$

The problem states that no polynomial homogeneous modes are present, so no
power of $x$ is needed for overlap correction.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is:

$$
e^{-2x}(x^2+4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Preserve the exponential $e^{-2x}$ and attach a complete quadratic:

$$
\boxed{
y_p=e^{-2x}(Ax^2+Bx+C)
}.
$$

The linear term must be included even though it is absent from $x^2+4$. The
problem states that exponential rate $-2$ does not overlap the homogeneous
solution, so the base trial is unchanged.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is:

$$
(3x-1)\sin(4x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The polynomial has degree $1$, and differentiation exchanges sine and cosine.
Therefore both trigonometric partners require complete first-degree
polynomials:

$$
\boxed{
y_p=(Ax+B)\cos(4x)+(Cx+D)\sin(4x)
}.
$$

There is no homogeneous mode at frequency $4$, so no resonance correction is
required.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $7e^{3x}$ gives the base trial:

$$
Ae^{3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
However, $e^{3x}$ already occurs in the complementary solution, and root $3$
is simple. Multiply the entire base trial by $x^1$:

$$
\boxed{
y_p=Axe^{3x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
The complementary solution contains:

$$
e^{-x}(c_1+c_2x),
$$

so root $-1$ has multiplicity $2$.

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $e^{-x}(2x+5)$ produces the base trial:

$$
e^{-x}(Ax+B).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because exponential rate $-1$ overlaps with multiplicity $2$, multiply the
complete base trial by $x^2$:

$$
\boxed{
y_p=x^2e^{-x}(Ax+B)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The complementary solution is:

$$
y_h=c_1+c_2x+c_3e^{2x}.
$$

The modes $1$ and $x$ show that the zero root has multiplicity $2$.

```{=latex}
\Needspace{10\baselineskip}
```
The first-degree polynomial forcing $4x-1$ gives the base trial:

$$
Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply that entire trial by $x^2$:

$$
\boxed{
y_p=x^2(Ax+B)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently, the corrected trial may be expanded as:

$$
y_p=Ax^3+Bx^2.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 7 To 10 {#worked-answers-problems-7-to-10-50}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-3y'+2y=-2x^2+10x-6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2-3r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the characteristic equation $r^2-3r+2=0$:

$$
(r-1)(r-2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_h=c_1e^x+c_2e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing is quadratic and does not overlap $y_h$, so use:

$$
y_p=Ax^2+Bx+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y_p'=2Ax+B,
\qquad
y_p''=2A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $y_p''-3y_p'+2y_p$:

$$
\begin{aligned}
y_p''-3y_p'+2y_p
&=2A-3(2Ax+B)+2(Ax^2+Bx+C) \\
&=(2A)x^2+(-6A+2B)x+(2A-3B+2C).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $-2x^2+10x-6$:

$$
\begin{aligned}
2A&=-2, \\
-6A+2B&=10, \\
2A-3B+2C&=-6.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first equation gives:

$$
A=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-1$ into the second equation:

$$
-6(-1)+2B=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
6+2B=10,
\qquad
B=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-1$ and $B=2$ into the third equation:

$$
2(-1)-3(2)+2C=-6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
-8+2C=-6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $8$ and divide by $2$:

$$
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=-1$, $B=2$, and $C=1$ into the quadratic trial:

$$
y_p=-x^2+2x+1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y=c_1e^x+c_2e^{2x}-x^2+2x+1
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-2y'+2y=10e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The associated characteristic equation is:

$$
r^2-2r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite it as:

$$
(r-1)^2+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $1\pm i$, so:

$$
y_h=e^x(c_1\cos x+c_2\sin x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing exponential rate is $-1$, which does not match the homogeneous
roots. Use:

$$
y_p=Ae^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
y_p'=-Ae^{-x},
\qquad
y_p''=Ae^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the left side:

$$
\begin{aligned}
y_p''-2y_p'+2y_p
&=Ae^{-x}-2(-Ae^{-x})+2Ae^{-x} \\
&=5Ae^{-x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $10e^{-x}$:

$$
5Ae^{-x}=10e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $e^{-x}$ and then by $5$:

$$
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
y=e^x(c_1\cos x+c_2\sin x)+2e^{-x}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+3y'+2y=-10\cos(2x)-10\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+3r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor the characteristic equation $r^2+3r+2=0$:

$$
(r+1)(r+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_h=c_1e^{-x}+c_2e^{-2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The nonresonant paired trial is:

$$
y_p=A\cos(2x)+B\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
\begin{aligned}
y_p'&=-2A\sin(2x)+2B\cos(2x), \\
y_p''&=-4A\cos(2x)-4B\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute and group sine and cosine:

$$
\begin{aligned}
y_p''+3y_p'+2y_p
&=(-2A+6B)\cos(2x) \\
&\quad+(-6A-2B)\sin(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients with the forcing:

$$
\begin{aligned}
-2A+6B&=-10, \\
-6A-2B&=-10.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide both equations by $-2$:

$$
\begin{aligned}
A-3B&=5, \\
3A+B&=5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first simplified coefficient equation is $A-3B=5$. Solve it for $A$:

$$
A=5+3B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this expression into $3A+B=5$:

$$
3(5+3B)+B=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand and combine:

$$
15+10B=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $15$ and divide by $10$:

$$
B=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $A=5+3B$:

$$
A=5+3(-1)=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
y_p=2\cos(2x)-\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{
y=c_1e^{-x}+c_2e^{-2x}+2\cos(2x)-\sin(2x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-6y'+9y=12e^{3x}.
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
Therefore:

$$
y_h=e^{3x}(c_1+c_2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The base trial $Ae^{3x}$ overlaps a root of multiplicity $2$. Correct it by
multiplying by $x^2$:

$$
y_p=Ax^2e^{3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The operator is $(D-3)^2$. Write $y_p=e^{3x}v$ with $v=Ax^2$. Then:

$$
(D-3)^2[e^{3x}v]=e^{3x}v''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $v''=2A$ in
$(D-3)^2[e^{3x}v]=e^{3x}v''$ gives:

$$
y_p''-6y_p'+9y_p=2Ae^{3x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with $12e^{3x}$:

$$
2A=12,
\qquad
A=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
\boxed{
y=e^{3x}(c_1+c_2x+6x^2)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 11 To 13 {#worked-answers-problems-11-to-13-51}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''-y'-2y=-2x-5+6e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2-r-2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(r-2)(r+1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_h=c_1e^{2x}+c_2e^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Split the forcing into:

$$
g_1(x)=-2x-5,
\qquad
g_2(x)=6e^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the polynomial component, use:

$$
y_{p,1}=Ax+B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
y_{p,1}'=A,
\qquad
y_{p,1}''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $L[y]=y''-y'-2y$:

$$
\begin{aligned}
L[y_{p,1}]
&=0-A-2(Ax+B) \\
&=(-2A)x+(-A-2B).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $-2x-5$:

$$
-2A=-2,
\qquad
-A-2B=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first coefficient equation $-2A=-2$ gives $A=1$. Substitute this value
into the second equation $-A-2B=-5$:

$$
-1-2B=-5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $1$:

$$
-2B=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
B=2
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
y_{p,1}=x+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $6e^{2x}$, the base trial $Ce^{2x}$ overlaps the simple root $2$.
Multiply by $x$:

$$
y_{p,2}=Cxe^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
\begin{aligned}
y_{p,2}'
&=C(1+2x)e^{2x}, \\
y_{p,2}''
&=C(4+4x)e^{2x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the operator:

$$
\begin{aligned}
L[y_{p,2}]
&=C(4+4x)e^{2x}-C(1+2x)e^{2x}-2Cxe^{2x} \\
&=C[(4+4x)-(1+2x)-2x]e^{2x} \\
&=3Ce^{2x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $6e^{2x}$:

$$
3C=6,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y_{p,2}=2xe^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine $y_h$, $y_{p,1}$, and $y_{p,2}$:

$$
\boxed{
y=c_1e^{2x}+c_2e^{-x}+x+2+2xe^{2x}
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
y''+4y=8\cos(2x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
y(0)=3,
\qquad
y'(0)=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are $\pm2i$, so:

$$
y_h=c_1\cos(2x)+c_2\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The base trigonometric trial overlaps this simple conjugate pair. Use the
corrected trial:

$$
y_p=x[A\cos(2x)+B\sin(2x)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
The local operator outputs are:

$$
\left(\frac{d^2}{dx^2}+4\right)[x\cos(2x)]
=-4\sin(2x)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\left(\frac{d^2}{dx^2}+4\right)[x\sin(2x)]
=4\cos(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $L=d^2/dx^2+4$ to the corrected trial using these two local operator
outputs:

$$
y_p''+4y_p=4B\cos(2x)-4A\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match with $8\cos(2x)+0\sin(2x)$:

$$
4B=8,
\qquad
-4A=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
B=2,
\qquad
A=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution before applying the conditions is:

$$
y=c_1\cos(2x)+c_2\sin(2x)+2x\sin(2x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y(0)=3$:

$$
3=c_1\cos0+c_2\sin0+2(0)\sin0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $\cos0=1$ and $\sin0=0$, the condition reduces to $3=c_1$.
Therefore:

$$
c_1=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete general solution:

$$
\begin{aligned}
y'
&=-2c_1\sin(2x)+2c_2\cos(2x) \\
&\quad+2\sin(2x)+4x\cos(2x).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $y'(0)=1$:

$$
1=-2c_1\sin0+2c_2\cos0+2\sin0+4(0)\cos0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $\sin0=0$ and $\cos0=1$:

$$
1=2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is:

$$
\boxed{
y=3\cos(2x)+\frac12\sin(2x)+2x\sin(2x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 13

```{=latex}
\Needspace{10\baselineskip}
```
For part (a):

$$
y''+5y=xe^{-x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation is linear with constant coefficients. Its forcing is a
first-degree polynomial multiplied by an exponential, which belongs to a
finite derivative-closed family. The standard method applies. Before using
the base trial:

$$
e^{-x}(Ax+B),
$$

the root $-1$ must be compared with the characteristic roots of
$r^2+5=0$.

```{=latex}
\Needspace{10\baselineskip}
```
For part (b):

$$
y''+y=\ln x.
$$

The equation has constant coefficients, but repeated derivatives of $\ln x$
produce an unending sequence of distinct reciprocal powers. There is no
finite standard trial family. Undetermined coefficients does not apply.

```{=latex}
\Needspace{10\baselineskip}
```
For part (c):

$$
xy''-y'=e^x.
$$

The coefficient of $y''$ is the variable $x$. The equation is linear but does
not have constant coefficients, so the standard method does not apply.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 11 Final Summary {#chapter-11-final-summary-52}

```{=latex}
\Needspace{10\baselineskip}
```
For a linear constant-coefficient equation:

$$
L[y]=g(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the general solution is:

$$
\boxed{y=y_h+y_p}.
$$

Construct $y_h$ from the associated equation $L[y]=0$. Construct one $y_p$ by
matching a finite derivative-closed trial family to the forcing.

```{=latex}
\Needspace{10\baselineskip}
```
The basic fingerprints are:

$$
P_n(x),
\qquad
e^{ax}P_n(x),
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential-trigonometric fingerprint is:

$$
e^{ax}\left[P_n(x)\cos(\omega x)+Q_n(x)\sin(\omega x)\right].
$$

For a forcing sum, add matching trial components. Before differentiating,
compare every complete base trial with $y_h$.

```{=latex}
\Needspace{10\baselineskip}
```
If the relevant characteristic root or conjugate pair has multiplicity $s$,
use:

$$
\boxed{
y_p=x^s(\text{complete base trial})
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's final lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> solve the homogeneous problem first, preserve the forcing's complete
> derivative family, correct overlap by the exact multiplicity, and make
> every trial coefficient earn its value through substitution.
