```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 32}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Classification And Characteristic Coordinates}
```
# Chapter 32 - Classification And Characteristic Coordinates

Chapter 31 introduced the main PDE models and used separation of variables in
fixed-boundary heat and wave problems. This chapter looks more closely at the
second-order part of a PDE.

The signs and combinations of the second derivatives tell us which coordinate
directions are natural for the equation. For a hyperbolic equation, those
directions lead to characteristic curves. For parabolic and elliptic
equations, related coordinate changes reveal different canonical forms.

This chapter will:

-   isolate the principal part of a second-order PDE
-   classify an equation as hyperbolic, parabolic, or elliptic
-   explain why classification may change from one point to another
-   derive the characteristic equation from a level curve
-   distinguish a characteristic curve from its slope
-   transform first and second partial derivatives carefully
-   check that a coordinate change is locally invertible
-   reduce constant-coefficient equations to canonical form
-   solve simple canonical hyperbolic and parabolic equations
-   use dimensional consistency to check PDE models
-   nondimensionalise heat, wave, and advection-diffusion equations
-   build a reliable classification-and-transformation workflow

```{=latex}
\Needspace{20\baselineskip}
```
## Reading The Principal Part {#block-1-reading-the-principal-part}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

```{=latex}
\Needspace{12\baselineskip}
```
The goal is to identify the part of a second-order PDE that controls its type
and to apply the discriminant test without losing the factor of $2$ in the
mixed term.

```{=latex}
\Needspace{8\baselineskip}
```
> classification begins with the highest-order derivatives, not with every
> term in the equation.

```{=latex}
\Needspace{12\baselineskip}
```
### The General Second-Order Form {#the-general-second-order-form-2}

```{=latex}
\Needspace{10\baselineskip}
```
For an unknown function $u=u(x,y)$, write a general second-order equation as:

$$
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}
+D\,u_x+E\,u_y+F\,u=G.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficients may depend on $x$ and $y$. For example:

$$
A=A(x,y),
\qquad
B=B(x,y),
\qquad
C=C(x,y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The **principal part** is the collection of highest-order terms:

$$
\boxed{
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}
}.
$$

The lower-order terms $D u_x$, $E u_y$, and $F u$ affect the solutions, but
they do not determine the second-order type.

```{=latex}
\Needspace{12\baselineskip}
```
### The Factor-Of-Two Convention {#the-factor-of-two-convention-3}

```{=latex}
\Needspace{10\baselineskip}
```
This chapter uses:

$$
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore, if the displayed equation contains:

$$
6u_{xy},
$$

```{=latex}
\Needspace{10\baselineskip}
```
then:

$$
2B=6,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
B=3.
$$

Do not insert the visible coefficient $6$ directly into $B^2-AC$.

```{=latex}
\Needspace{12\baselineskip}
```
The practical rule is:

```{=latex}
\Needspace{8\baselineskip}
```
> first match the mixed term with $2B u_{xy}$; only then calculate the
> discriminant.

```{=latex}
\Needspace{12\baselineskip}
```
### The Discriminant Test {#the-discriminant-test-4}

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
\Delta=B^2-AC.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\Delta=B^2-AC$, the classification at the point being considered is:

$$
\begin{array}{c|c}
\Delta>0 & \text{hyperbolic}\\
\Delta=0 & \text{parabolic}\\
\Delta<0 & \text{elliptic}
\end{array}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The same information is contained in the symmetric principal matrix:

$$
M=
\begin{pmatrix}
A&B\\
B&C
\end{pmatrix}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its determinant is:

$$
\begin{aligned}
\det M
&=AC-B^2\\
&=-\Delta.
\end{aligned}
$$

Thus the PDE discriminant has the opposite sign from the determinant of the
principal matrix.[^1]

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Classification With A Mixed Term {#worked-classification-with-a-mixed-term-5}

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
3u_{xx}-8u_{xy}+2u_{yy}+u_x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the principal part with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $3u_{xx}-8u_{xy}+2u_{yy}+u_x=0$, the principal coefficients are:

$$
A=3,
\qquad
2B=-8,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve $2B=-8$ for $B$:

$$
B=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate the discriminant:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=(-4)^2-(3)(2)\\
&=16-6\\
&=10.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta>0$:

$$
\boxed{\text{the equation is hyperbolic}.}
$$

The first-order term $u_x$ does not enter this classification.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Classification At Different Points {#worked-classification-at-different-points-6}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
(1-x^2-y^2)u_{xx}+u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
A=1-x^2-y^2,
\qquad
B=0,
\qquad
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For this variable-coefficient equation, the discriminant is:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=0-(1-x^2-y^2)(1)\\
&=x^2+y^2-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Inside the unit circle, $x^2+y^2<1$, so:

$$
\Delta<0.
$$

The equation is elliptic there.

```{=latex}
\Needspace{10\baselineskip}
```
On the unit circle, $x^2+y^2=1$, so:

$$
\Delta=0.
$$

The equation is parabolic there.

```{=latex}
\Needspace{10\baselineskip}
```
Outside the unit circle, $x^2+y^2>1$, so:

$$
\Delta>0.
$$

The equation is hyperbolic there.

```{=latex}
\Needspace{12\baselineskip}
```
What this tells us:

```{=latex}
\Needspace{8\baselineskip}
```
> a variable-coefficient PDE can change type across a curve. Classification
> is then a local statement, not one permanent label for the whole plane.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-7}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
A u_{xx}+2B u_{xy}+C u_{yy}+\text{lower-order terms}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
calculate:

$$
\Delta=B^2-AC.
$$

The sign of $\Delta$ determines the type. If the coefficients depend on the
independent variables, repeat the sign analysis in each relevant region.

```{=latex}
\Needspace{20\baselineskip}
```
## Changing Coordinates Without Skipping The Chain Rule {#block-2-changing-coordinates-without-skipping-the-chain-rule}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-8}

The goal is to express a PDE in new coordinates while keeping every chain-rule
term visible. These formulas explain exactly how characteristic and canonical
coordinates change the principal part.

```{=latex}
\Needspace{12\baselineskip}
```
### Old And New Variables {#old-and-new-variables-9}

```{=latex}
\Needspace{10\baselineskip}
```
Introduce new coordinates:

$$
\xi=\xi(x,y),
\qquad
\eta=\eta(x,y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Write the same dependent variable in the new coordinates as:

$$
u(x,y)=U(\xi,\eta).
$$

The letters $u$ and $U$ do not represent two unrelated solutions. They are two
coordinate descriptions of the same function.

```{=latex}
\Needspace{10\baselineskip}
```
The coordinate change is locally invertible when its Jacobian is nonzero:

$$
\boxed{
J
=\frac{\partial(\xi,\eta)}{\partial(x,y)}
=\xi_x\eta_y-\xi_y\eta_x
\ne0
}.
$$

If $J=0$, the two proposed coordinates fail to provide two independent
directions.

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The First Derivatives {#transform-the-first-derivatives-10}

```{=latex}
\Needspace{10\baselineskip}
```
Since $u(x,y)=U(\xi(x,y),\eta(x,y))$, the multivariable chain rule gives:

$$
\boxed{
u_x=U_\xi\xi_x+U_\eta\eta_x
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Similarly:

$$
\boxed{
u_y=U_\xi\xi_y+U_\eta\eta_y
}.
$$

Each old derivative differentiates through both new coordinates. For example,
$u_x$ contains one contribution from the change of $\xi$ with $x$ and another
from the change of $\eta$ with $x$.

```{=latex}
\Needspace{12\baselineskip}
```
### Derive The Second X-Derivative {#derive-the-second-x-derivative-11}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the transformed first derivative:

$$
u_x=U_\xi\xi_x+U_\eta\eta_x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate both terms with respect to $x$:

$$
u_{xx}
=\frac{\partial}{\partial x}(U_\xi\xi_x)
+\frac{\partial}{\partial x}(U_\eta\eta_x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the product rule to both terms in the expression for $u_{xx}$:

$$
u_{xx}
=(U_\xi)_x\xi_x+U_\xi\xi_{xx}
+(U_\eta)_x\eta_x+U_\eta\eta_{xx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now apply the chain rule to the derivatives of $U_\xi$ and $U_\eta$:

$$
\begin{aligned}
(U_\xi)_x
&=U_{\xi\xi}\xi_x+U_{\xi\eta}\eta_x,\\
(U_\eta)_x
&=U_{\eta\xi}\xi_x+U_{\eta\eta}\eta_x.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Assuming the relevant mixed derivatives are continuous,
$U_{\eta\xi}=U_{\xi\eta}$. Substitute the two chain-rule expressions into
$u_{xx}$:

$$
\boxed{
\begin{aligned}
u_{xx}
={}&U_{\xi\xi}\xi_x^2
+2U_{\xi\eta}\xi_x\eta_x
+U_{\eta\eta}\eta_x^2\\
&+U_\xi\xi_{xx}
+U_\eta\eta_{xx}.
\end{aligned}
}
$$

The first line contains the new second derivatives. The second line contributes
only lower-order derivatives of $U$.

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Mixed And Y-Derivatives {#transform-the-mixed-and-y-derivatives-12}

```{=latex}
\Needspace{10\baselineskip}
```
Applying the same chain rule to $u_x$ with respect to $y$ gives:

$$
\boxed{
\begin{aligned}
u_{xy}
={}&U_{\xi\xi}\xi_x\xi_y
+U_{\xi\eta}(\xi_x\eta_y+\xi_y\eta_x)
+U_{\eta\eta}\eta_x\eta_y\\
&+U_\xi\xi_{xy}
+U_\eta\eta_{xy}.
\end{aligned}
}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiating $u_y$ once more with respect to $y$ gives:

$$
\boxed{
\begin{aligned}
u_{yy}
={}&U_{\xi\xi}\xi_y^2
+2U_{\xi\eta}\xi_y\eta_y
+U_{\eta\eta}\eta_y^2\\
&+U_\xi\xi_{yy}
+U_\eta\eta_{yy}.
\end{aligned}
}
$$

For a linear coordinate change, all second derivatives of $\xi$ and $\eta$
are zero. The lower-order terms in these boxes then disappear.

```{=latex}
\Needspace{12\baselineskip}
```
### Read The New Principal Coefficients {#read-the-new-principal-coefficients-13}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the transformed derivatives into:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $U_{\xi\xi}$ is:

$$
\boxed{
\overline A
=A\xi_x^2+2B\xi_x\xi_y+C\xi_y^2
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $U_{\eta\eta}$ is:

$$
\boxed{
\overline C
=A\eta_x^2+2B\eta_x\eta_y+C\eta_y^2
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformed equation uses $2\overline B U_{\xi\eta}$. Its coefficient is:

$$
\boxed{
\begin{aligned}
2\overline B
=2\bigl[&A\xi_x\eta_x
+B(\xi_x\eta_y+\xi_y\eta_x)\\
&+C\xi_y\eta_y\bigr].
\end{aligned}
}
$$

The remaining chain-rule pieces multiply $U_\xi$ and $U_\eta$, so they become
lower-order terms in the transformed PDE.

```{=latex}
\Needspace{12\baselineskip}
```
### A Linear Coordinate Check {#a-linear-coordinate-check-14}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\xi=x+y,
\qquad
\eta=2x-y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the Jacobian:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)(-1)-(1)(2)\\
&=-3.
\end{aligned}
$$

Since $J\ne0$, the coordinates are independent.

All second derivatives of $\xi$ and $\eta$ vanish because both coordinates are
linear functions of $x$ and $y$. This is why linear changes are especially
convenient for constant-coefficient PDEs.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

A valid coordinate change needs $J\ne0$. The chain rule transforms each old
second derivative into a combination of $U_{\xi\xi}$, $U_{\xi\eta}$,
$U_{\eta\eta}$, and possibly lower-order terms. Canonical coordinates are
chosen to make one or more principal coefficients vanish.

```{=latex}
\Needspace{20\baselineskip}
```
## Deriving Characteristic Curves {#block-3-deriving-characteristic-curves}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to derive the characteristic equation and connect its real roots
to the three PDE types.

```{=latex}
\Needspace{12\baselineskip}
```
### Choose A Coordinate That Removes One Pure Derivative {#choose-a-coordinate-that-removes-one-pure-derivative-17}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose one new coordinate is:

$$
\xi=\phi(x,y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficient of $U_{\xi\xi}$ in the transformed principal part is:

$$
\overline A
=A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To remove $U_{\xi\xi}$, require:

$$
\boxed{
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0
}.
$$

The curves $\phi(x,y)=\text{constant}$ that satisfy this condition are
characteristic curves.

```{=latex}
\Needspace{12\baselineskip}
```
### Convert The Level-Curve Condition Into A Slope Equation {#convert-the-level-curve-condition-into-a-slope-equation-18}

```{=latex}
\Needspace{10\baselineskip}
```
Along a level curve $\phi(x,y)=k$, the differential of $\phi$ is zero:

$$
d\phi=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the level-curve condition $d\phi=0$:

$$
\phi_x\,dx+\phi_y\,dy=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $dx\ne0$, define the curve slope:

$$
m=\frac{dy}{dx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide the level-curve equation by $dx$:

$$
\phi_x+\phi_y m=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $\phi_x$:

$$
\phi_x=-m\phi_y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into the characteristic condition:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
A(-m\phi_y)^2
+2B(-m\phi_y)\phi_y
+C\phi_y^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the powers and products:

$$
A m^2\phi_y^2
-2Bm\phi_y^2
+C\phi_y^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nondegenerate level curve with $\phi_y\ne0$, divide by $\phi_y^2$:

$$
\boxed{
A m^2-2Bm+C=0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently:

$$
\boxed{
A(dy)^2-2B\,dx\,dy+C(dx)^2=0
}.
$$

The differential form remains useful when a characteristic is vertical and
$dy/dx$ is not finite.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Discriminant Reappears {#why-the-discriminant-reappears-19}

```{=latex}
\Needspace{10\baselineskip}
```
For $A\ne0$, solve:

$$
A m^2-2Bm+C=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
with the quadratic formula:

$$
\begin{aligned}
m
&=\frac{2B\pm\sqrt{(-2B)^2-4AC}}{2A}\\
&=\frac{2B\pm\sqrt{4B^2-4AC}}{2A}\\
&=\frac{2B\pm2\sqrt{B^2-AC}}{2A}\\
&=\frac{B\pm\sqrt{B^2-AC}}{A}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta=B^2-AC$:

$$
\boxed{
m=\frac{B\pm\sqrt\Delta}{A}
}.
$$

Therefore:

-   $\Delta>0$ gives two distinct real characteristic directions
-   $\Delta=0$ gives one repeated real characteristic direction
-   $\Delta<0$ gives no real characteristic direction

This is the geometric reason behind the hyperbolic, parabolic, and elliptic
classification.

```{=latex}
\Needspace{12\baselineskip}
```
### Characteristic Direction Versus Characteristic Curve {#characteristic-direction-versus-characteristic-curve-20}

```{=latex}
\Needspace{10\baselineskip}
```
The formula:

$$
\frac{dy}{dx}=m(x,y)
$$

specifies a direction field. A characteristic curve is obtained by solving
that first-order ODE.

```{=latex}
\Needspace{10\baselineskip}
```
If $m$ is constant, integration gives straight lines. For example:

$$
\frac{dy}{dx}=-2
$$

```{=latex}
\Needspace{10\baselineskip}
```
integrates to:

$$
y=-2x+k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange to place the constant on one side:

$$
2x+y=k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus a suitable characteristic coordinate is:

$$
\xi=2x+y.
$$

Do not stop after finding the slope. The coordinate used in the transformation
must be constant along the corresponding family of curves.

```{=latex}
\Needspace{12\baselineskip}
```
### A Quick Characteristic Calculation {#a-quick-characteristic-calculation-21}

```{=latex}
\Needspace{10\baselineskip}
```
Find the characteristic slopes of:

$$
2u_{xx}+2u_{xy}-u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the principal coefficients:

$$
A=2,
\qquad
2B=2,
\qquad
C=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The slope equation is:

$$
A m^2-2Bm+C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=2$, $B=1$, and $C=-1$:

$$
2m^2-2m-1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the quadratic formula:

$$
\begin{aligned}
m
&=\frac{2\pm\sqrt{(-2)^2-4(2)(-1)}}{2(2)}\\
&=\frac{2\pm\sqrt{4+8}}{4}\\
&=\frac{2\pm2\sqrt3}{4}\\
&=\frac{1\pm\sqrt3}{2}.
\end{aligned}
$$

The two real slopes confirm that the equation is hyperbolic.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-22}

```{=latex}
\Needspace{10\baselineskip}
```
Characteristic coordinates satisfy:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For nonvertical curves, their slopes satisfy:

$$
A\left(\frac{dy}{dx}\right)^2
-2B\frac{dy}{dx}+C=0.
$$

Solve the slope equation, integrate each direction field, and use the resulting
constants of integration as new coordinates.

```{=latex}
\Needspace{20\baselineskip}
```
## A Hyperbolic Equation In Canonical Coordinates {#block-4-a-hyperbolic-equation-in-canonical-coordinates}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-23}

The goal is to find both characteristic families, build a valid coordinate
change, and reduce a hyperbolic PDE to a mixed-derivative canonical form.

```{=latex}
\Needspace{12\baselineskip}
```
### Classify And Find The Characteristic Slopes {#classify-and-find-the-characteristic-slopes-24}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u_{xx}-4u_{xy}+3u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the equation with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u_{xx}-4u_{xy}+3u_{yy}=0$, the principal coefficients are:

$$
A=1,
\qquad
2B=-4,
\qquad
C=3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
B=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the discriminant:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=(-2)^2-(1)(3)\\
&=1>0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equation is hyperbolic. Its characteristic slope equation is:

$$
A m^2-2Bm+C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $A=1$, $B=-2$, and $C=3$:

$$
m^2+4m+3=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(m+1)(m+3)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the two slopes are:

$$
m_1=-1,
\qquad
m_2=-3.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Integrate Both Characteristic Families {#integrate-both-characteristic-families-25}

```{=latex}
\Needspace{10\baselineskip}
```
For the first family:

$$
\frac{dy}{dx}=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate with respect to $x$:

$$
y=-x+k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange $y=-x+k_1$:

$$
x+y=k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A coordinate that is constant on this first family is:

$$
\xi=x+y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the second family:

$$
\frac{dy}{dx}=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
y=-3x+k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange $y=-3x+k_2$:

$$
3x+y=k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A coordinate that is constant on this second family is:

$$
\eta=3x+y.
$$

These coordinates are constant along the two characteristic families.

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Jacobian {#check-the-jacobian-26}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\xi=x+y,
\qquad
\eta=3x+y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the coordinate derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=3,&\eta_y&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)(1)-(1)(3)\\
&=-2.
\end{aligned}
$$

Since $J\ne0$, the transformation is locally invertible.

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Derivatives Explicitly {#transform-the-derivatives-explicitly-27}

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
u(x,y)=U(\xi,\eta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $\xi$ and $\eta$ are linear, their second derivatives vanish. The
first derivative with respect to $x$ is:

$$
\begin{aligned}
u_x
&=U_\xi\xi_x+U_\eta\eta_x\\
&=U_\xi+3U_\eta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate this expression with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=(U_\xi)_x+3(U_\eta)_x\\
&=(U_{\xi\xi}+3U_{\xi\eta})
+3(U_{\eta\xi}+3U_{\eta\eta})\\
&=U_{\xi\xi}+6U_{\xi\eta}+9U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first derivative with respect to $y$ is:

$$
\begin{aligned}
u_y
&=U_\xi\xi_y+U_\eta\eta_y\\
&=U_\xi+U_\eta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x=U_\xi+3U_\eta$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=(U_\xi)_y+3(U_\eta)_y\\
&=(U_{\xi\xi}+U_{\xi\eta})
+3(U_{\eta\xi}+U_{\eta\eta})\\
&=U_{\xi\xi}+4U_{\xi\eta}+3U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_y=U_\xi+U_\eta$ with respect to $y$:

$$
\begin{aligned}
u_{yy}
&=(U_\xi)_y+(U_\eta)_y\\
&=(U_{\xi\xi}+U_{\xi\eta})
+(U_{\eta\xi}+U_{\eta\eta})\\
&=U_{\xi\xi}+2U_{\xi\eta}+U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Substitute And Watch The Pure Derivatives Cancel {#substitute-and-watch-the-pure-derivatives-cancel-28}

```{=latex}
\Needspace{10\baselineskip}
```
The original principal expression is:

$$
u_{xx}-4u_{xy}+3u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the transformed derivatives:

$$
\begin{aligned}
u_{xx}-4u_{xy}+3u_{yy}
={}&(U_{\xi\xi}+6U_{\xi\eta}+9U_{\eta\eta})\\
&-4(U_{\xi\xi}+4U_{\xi\eta}+3U_{\eta\eta})\\
&+3(U_{\xi\xi}+2U_{\xi\eta}+U_{\eta\eta}).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the coefficient of each new second derivative:

$$
\begin{aligned}
u_{xx}-4u_{xy}+3u_{yy}
={}&(1-4+3)U_{\xi\xi}\\
&+(6-16+6)U_{\xi\eta}\\
&+(9-12+3)U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the three numerical coefficients:

$$
u_{xx}-4u_{xy}+3u_{yy}
=-4U_{\xi\eta}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the PDE becomes:

$$
-4U_{\xi\eta}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-4$:

$$
\boxed{U_{\xi\eta}=0.}
$$

This is the hyperbolic canonical form.

```{=latex}
\Needspace{12\baselineskip}
```
### Solve The Canonical Equation {#solve-the-canonical-equation-29}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
U_{\xi\eta}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Treat $U_\xi$ as the quantity being differentiated with respect to $\eta$:

$$
\frac{\partial}{\partial\eta}(U_\xi)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $U_\xi$ does not depend on $\eta$. Write:

$$
U_\xi=F'(\xi),
$$

where $F$ is an arbitrary differentiable function.

```{=latex}
\Needspace{10\baselineskip}
```
Integrate with respect to $\xi$:

$$
U(\xi,\eta)=F(\xi)+G(\eta),
$$

where $G$ is the arbitrary function introduced by the integration.

```{=latex}
\Needspace{10\baselineskip}
```
Return to the original coordinates:

$$
\xi=x+y,
\qquad
\eta=3x+y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
u(x,y)=F(x+y)+G(3x+y)
}.
$$

The solution contains one arbitrary function associated with each
characteristic family.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The General Family {#verify-the-general-family-30}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
u(x,y)=F(x+y)+G(3x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once with respect to $x$:

$$
u_x=F'(x+y)+3G'(3x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again with respect to $x$:

$$
u_{xx}=F''(x+y)+9G''(3x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x$ with respect to $y$:

$$
u_{xy}=F''(x+y)+3G''(3x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate twice with respect to $y$:

$$
u_{yy}=F''(x+y)+G''(3x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these derivatives into the original left side:

$$
\begin{aligned}
u_{xx}-4u_{xy}+3u_{yy}
={}&[F''+9G'']-4[F''+3G'']+3[F''+G'']\\
={}&(1-4+3)F''+(9-12+3)G''\\
={}&0.
\end{aligned}
$$

Thus every twice-differentiable pair $F,G$ produces a solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-31}

For a hyperbolic equation, the two characteristic families provide two new
coordinates. In this example they reduced the principal part to
$U_{\xi\eta}$, and integrating the canonical equation produced one arbitrary
function of each characteristic coordinate.

```{=latex}
\Needspace{20\baselineskip}
```
## A Parabolic Equation In Canonical Coordinates {#block-5-a-parabolic-equation-in-canonical-coordinates}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-32}

The goal is to see what changes when the characteristic equation has one
repeated direction rather than two distinct directions.

```{=latex}
\Needspace{12\baselineskip}
```
### Classify The Equation {#classify-the-equation-33}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u_{xx}+2u_{xy}+u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The principal coefficients are:

$$
A=1,
\qquad
B=1,
\qquad
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=1^2-(1)(1)\\
&=0.
\end{aligned}
$$

Therefore the equation is parabolic.

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Repeated Characteristic {#find-the-repeated-characteristic-34}

```{=latex}
\Needspace{10\baselineskip}
```
Use the slope equation:

$$
A m^2-2Bm+C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1$, $B=1$, and $C=1$:

$$
m^2-2m+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(m-1)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated slope is:

$$
m=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\frac{dy}{dx}=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
y=x+k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
y-x=k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $y-x=k$, choose the characteristic coordinate:

$$
\xi=y-x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A second coordinate must be independent of $\xi$. A convenient choice is:

$$
\eta=x.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Check That The Coordinates Are Independent {#check-that-the-coordinates-are-independent-35}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\xi=y-x,
\qquad
\eta=x,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the first derivatives are:

$$
\begin{aligned}
\xi_x&=-1,&\xi_y&=1,\\
\eta_x&=1,&\eta_y&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(0)-(1)(1)\\
&=-1.
\end{aligned}
$$

Since $J\ne0$, the coordinate change is valid.

```{=latex}
\Needspace{12\baselineskip}
```
### Transform Each Second Derivative {#transform-each-second-derivative-36}

```{=latex}
\Needspace{10\baselineskip}
```
Write $u(x,y)=U(\xi,\eta)$. First:

$$
\begin{aligned}
u_x
&=U_\xi\xi_x+U_\eta\eta_x\\
&=-U_\xi+U_\eta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=-(U_\xi)_x+(U_\eta)_x\\
&=-(-U_{\xi\xi}+U_{\xi\eta})
+(-U_{\eta\xi}+U_{\eta\eta})\\
&=U_{\xi\xi}-2U_{\xi\eta}+U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Next:

$$
\begin{aligned}
u_y
&=U_\xi\xi_y+U_\eta\eta_y\\
&=U_\xi.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x=-U_\xi+U_\eta$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=-(U_\xi)_y+(U_\eta)_y\\
&=-U_{\xi\xi}+U_{\eta\xi}\\
&=-U_{\xi\xi}+U_{\xi\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_y=U_\xi$ with respect to $y$:

$$
u_{yy}=U_{\xi\xi}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Reduce And Solve The Canonical Equation {#reduce-and-solve-the-canonical-equation-37}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the transformed derivatives into:

$$
u_{xx}+2u_{xy}+u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\begin{aligned}
u_{xx}+2u_{xy}+u_{yy}
={}&(U_{\xi\xi}-2U_{\xi\eta}+U_{\eta\eta})\\
&+2(-U_{\xi\xi}+U_{\xi\eta})
+U_{\xi\xi}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect like derivatives:

$$
\begin{aligned}
u_{xx}+2u_{xy}+u_{yy}
={}&(1-2+1)U_{\xi\xi}\\
&+(-2+2)U_{\xi\eta}\\
&+U_{\eta\eta}\\
={}&U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the canonical equation is:

$$
\boxed{U_{\eta\eta}=0.}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate once with respect to $\eta$:

$$
U_\eta=F(\xi).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate a second time with respect to $\eta$:

$$
U(\xi,\eta)=\eta F(\xi)+G(\xi).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $\xi=y-x$ and $\eta=x$:

$$
\boxed{
u(x,y)=xF(y-x)+G(y-x)
}.
$$

Both arbitrary functions depend on the single repeated characteristic
coordinate.

```{=latex}
\Needspace{12\baselineskip}
```
### Verify The Parabolic Solution Family {#verify-the-parabolic-solution-family-38}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
s=y-x
$$

```{=latex}
\Needspace{10\baselineskip}
```
and write:

$$
u(x,y)=xF(s)+G(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
s_x=-1,
\qquad
s_y=1,
$$

```{=latex}
\Needspace{10\baselineskip}
```
differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=F(s)+xF'(s)s_x+G'(s)s_x\\
&=F(s)-xF'(s)-G'(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate this expression with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=F'(s)s_x-\left[F'(s)+xF''(s)s_x\right]-G''(s)s_x\\
&=-F'(s)-F'(s)+xF''(s)+G''(s)\\
&=-2F'(s)+xF''(s)+G''(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=F'(s)s_y-xF''(s)s_y-G''(s)s_y\\
&=F'(s)-xF''(s)-G''(s).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u$ with respect to $y$:

$$
u_y=xF'(s)+G'(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again with respect to $y$:

$$
u_{yy}=xF''(s)+G''(s).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now substitute:

$$
\begin{aligned}
u_{xx}+2u_{xy}+u_{yy}
={}&[-2F'+xF''+G'']\\
&+2[F'-xF''-G'']\\
&+[xF''+G'']\\
={}&0.
\end{aligned}
$$

The family satisfies the original PDE.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-39}

A parabolic equation has one repeated characteristic family. One new
coordinate follows that family; the other is any convenient independent
coordinate. The canonical principal part contains one pure second derivative.

```{=latex}
\Needspace{20\baselineskip}
```
## An Elliptic Equation And Rotation Of Axes {#block-6-an-elliptic-equation-and-rotation-of-axes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to remove a mixed derivative from an elliptic equation even though
there are no real characteristic curves.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Rotation Is The Natural Tool {#why-rotation-is-the-natural-tool-41}

```{=latex}
\Needspace{10\baselineskip}
```
Consider a constant-coefficient principal part:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use a rotation:

$$
\begin{aligned}
\xi&=x\cos\theta+y\sin\theta,\\
\eta&=-x\sin\theta+y\cos\theta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(\cos\theta)(\cos\theta)
-(\sin\theta)(-\sin\theta)\\
&=\cos^2\theta+\sin^2\theta\\
&=1.
\end{aligned}
$$

Thus every such rotation is invertible.

```{=latex}
\Needspace{10\baselineskip}
```
After substitution, the coefficient of $U_{\xi\eta}$ is:

$$
(C-A)\sin(2\theta)+2B\cos(2\theta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set this coefficient equal to zero:

$$
(C-A)\sin(2\theta)+2B\cos(2\theta)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When the relevant denominator is nonzero, rearrange to obtain:

$$
\boxed{
\tan(2\theta)=\frac{2B}{A-C}
}.
$$

This angle aligns the new axes with the principal directions of the quadratic
form.

```{=latex}
\Needspace{12\baselineskip}
```
### A Worked Elliptic Rotation {#a-worked-elliptic-rotation-42}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
2u_{xx}+2u_{xy}+2u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficients are:

$$
A=2,
\qquad
B=1,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=1-(2)(2)\\
&=-3<0.
\end{aligned}
$$

The equation is elliptic.

```{=latex}
\Needspace{10\baselineskip}
```
Since $A=C$ and $B\ne0$, the rotation condition is satisfied by:

$$
2\theta=\frac{\pi}{2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
so choose:

$$
\theta=\frac{\pi}{4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The rotated coordinates are:

$$
\boxed{
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Rotated Derivatives {#transform-the-rotated-derivatives-43}

```{=latex}
\Needspace{10\baselineskip}
```
For the chosen rotation:

$$
\begin{aligned}
\xi_x&=\frac1{\sqrt2},&
\xi_y&=\frac1{\sqrt2},\\
\eta_x&=-\frac1{\sqrt2},&
\eta_y&=\frac1{\sqrt2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The first derivatives are:

$$
\begin{aligned}
u_x
&=\frac1{\sqrt2}U_\xi-\frac1{\sqrt2}U_\eta,\\
u_y
&=\frac1{\sqrt2}U_\xi+\frac1{\sqrt2}U_\eta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x$ with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=\frac12U_{\xi\xi}
-U_{\xi\eta}
+\frac12U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_x$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=\frac12U_{\xi\xi}
-\frac12U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u_y$ with respect to $y$:

$$
\begin{aligned}
u_{yy}
&=\frac12U_{\xi\xi}
+U_{\xi\eta}
+\frac12U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Substitute Into The Elliptic Equation {#substitute-into-the-elliptic-equation-44}

```{=latex}
\Needspace{10\baselineskip}
```
The original left side is:

$$
2u_{xx}+2u_{xy}+2u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the rotated derivatives:

$$
\begin{aligned}
2u_{xx}
&=U_{\xi\xi}-2U_{\xi\eta}+U_{\eta\eta},\\
2u_{xy}
&=U_{\xi\xi}-U_{\eta\eta},\\
2u_{yy}
&=U_{\xi\xi}+2U_{\xi\eta}+U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the three lines:

$$
\begin{aligned}
2u_{xx}+2u_{xy}+2u_{yy}
={}&(1+1+1)U_{\xi\xi}\\
&+(-2+0+2)U_{\xi\eta}\\
&+(1-1+1)U_{\eta\eta}\\
={}&3U_{\xi\xi}+U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $2u_{xx}+2u_{xy}+2u_{yy}=0$ becomes:

$$
\boxed{
3U_{\xi\xi}+U_{\eta\eta}=0
}.
$$

The mixed derivative has disappeared, and both remaining pure derivatives have
coefficients with the same sign.

```{=latex}
\Needspace{12\baselineskip}
```
### Rescale To The Laplace Form {#rescale-to-the-laplace-form-45}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
3U_{\xi\xi}+U_{\eta\eta}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define:

$$
X=\frac{\xi}{\sqrt3},
\qquad
Y=\eta,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and write:

$$
U(\xi,\eta)=V(X,Y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $X_\xi=1/\sqrt3$:

$$
\begin{aligned}
U_\xi
&=V_X X_\xi\\
&=\frac1{\sqrt3}V_X.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $\xi$:

$$
\begin{aligned}
U_{\xi\xi}
&=\frac1{\sqrt3}(V_X)_\xi\\
&=\frac1{\sqrt3}V_{XX}X_\xi\\
&=\frac13V_{XX}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $Y=\eta$:

$$
U_{\eta\eta}=V_{YY}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute both derivatives:

$$
3\left(\frac13V_{XX}\right)+V_{YY}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
\boxed{
V_{XX}+V_{YY}=0
}.
$$

Thus the equation has been reduced to Laplace's equation in scaled, rotated
coordinates.

```{=latex}
\Needspace{12\baselineskip}
```
### What Elliptic Canonical Form Does Not Give Us {#what-elliptic-canonical-form-does-not-give-us-46}

For the hyperbolic and parabolic examples, the canonical PDE integrated
directly to an arbitrary-function family. Laplace's equation does not collapse
in the same way.

```{=latex}
\Needspace{12\baselineskip}
```
Solving an elliptic problem normally requires information on a surrounding
boundary. The coordinate transformation simplifies the differential operator,
but it does not replace the boundary-value problem.

```{=latex}
\Needspace{8\baselineskip}
```
> canonical form reveals structure; it is not automatically a complete
> solution method.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-47}

An elliptic equation has no real characteristic directions. A rotation removes
the mixed derivative, and a positive rescaling can reduce the principal part
to a sum of two pure second derivatives.

```{=latex}
\Needspace{20\baselineskip}
```
## Variable Coefficients And A Change Of Type {#block-7-variable-coefficients-and-a-change-of-type}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-48}

The goal is to classify a variable-coefficient equation by region and to find
its real characteristic curves only where they actually exist.

```{=latex}
\Needspace{12\baselineskip}
```
### A Mixed-Type Model {#a-mixed-type-model-49}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
y\,u_{xx}+u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coefficients are:

$$
A=y,
\qquad
B=0,
\qquad
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=0-y(1)\\
&=-y.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{array}{c|c}
y<0 & \Delta>0\text{: hyperbolic}\\
y=0 & \Delta=0\text{: parabolic}\\
y>0 & \Delta<0\text{: elliptic}
\end{array}
$$

The line $y=0$ separates regions with different PDE behaviour.

```{=latex}
\Needspace{12\baselineskip}
```
### Find Characteristics In The Hyperbolic Region {#find-characteristics-in-the-hyperbolic-region-50}

```{=latex}
\Needspace{10\baselineskip}
```
Use the differential characteristic equation:

$$
A(dy)^2-2B\,dx\,dy+C(dx)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $A=y$, $B=0$, and $C=1$:

$$
y(dy)^2+(dx)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In the hyperbolic region $y<0$, rearrange:

$$
(dx)^2=-y(dy)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take square roots:

$$
\frac{dx}{dy}=\pm\sqrt{-y}.
$$

Using $dx/dy$ avoids dividing by $A=y$ and gives a cleaner integral near the
change-of-type line.

```{=latex}
\Needspace{12\baselineskip}
```
### Integrate The Two Variable-Coefficient Families {#integrate-the-two-variable-coefficient-families-51}

```{=latex}
\Needspace{10\baselineskip}
```
For the positive sign:

$$
\frac{dx}{dy}=\sqrt{-y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate with respect to $y$:

$$
x=\int\sqrt{-y}\,dy+k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $q=-y$, so $dq=-dy$. Then:

$$
\begin{aligned}
\int\sqrt{-y}\,dy
&=-\int q^{1/2}\,dq\\
&=-\frac23q^{3/2}\\
&=-\frac23(-y)^{3/2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
x+\frac23(-y)^{3/2}=k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the negative sign:

$$
\frac{dx}{dy}=-\sqrt{-y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrating gives:

$$
x-\frac23(-y)^{3/2}=k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore characteristic coordinates in $y<0$ may be chosen as:

$$
\boxed{
\xi=x+\frac23(-y)^{3/2},
\qquad
\eta=x-\frac23(-y)^{3/2}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Variable-Coefficient Jacobian {#check-the-variable-coefficient-jacobian-52}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the coordinates for $y<0$:

$$
\begin{aligned}
\xi_x&=1,&
\xi_y&=-\sqrt{-y},\\
\eta_x&=1,&
\eta_y&=\sqrt{-y}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For
$\xi=x+\frac23(-y)^{3/2}$ and
$\eta=x-\frac23(-y)^{3/2}$,
calculate the Jacobian:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)\sqrt{-y}-(-\sqrt{-y})(1)\\
&=2\sqrt{-y}.
\end{aligned}
$$

For $y<0$, $\sqrt{-y}>0$, so $J\ne0$. As $y$ approaches $0$ from below,
$J$ approaches $0$.

This degeneration is not an algebra accident. It records the fact that the two
hyperbolic characteristic directions merge at the parabolic boundary.

```{=latex}
\Needspace{12\baselineskip}
```
### Why Extra First-Derivative Terms Appear {#why-extra-first-derivative-terms-appear-53}

```{=latex}
\Needspace{10\baselineskip}
```
The coordinates $\xi$ and $\eta$ contain $(-y)^{3/2}$, so they are not linear.
Consequently:

$$
\xi_{yy}\ne0,
\qquad
\eta_{yy}\ne0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second-derivative chain rule contains:

$$
U_\xi\xi_{yy}+U_\eta\eta_{yy}.
$$

These terms survive as first-order derivatives of $U$ in the transformed PDE.
The characteristic choice still simplifies the principal part, but it does not
guarantee that every lower-order term disappears.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-54}

For variable coefficients, classify point by point or region by region.
Characteristics exist as real curves only in hyperbolic or parabolic regions.
Nonlinear coordinate changes generally create lower-order chain-rule terms,
and the Jacobian may reveal where the transformation degenerates.

```{=latex}
\Needspace{20\baselineskip}
```
## Dimensional Analysis And Nondimensionalisation {#block-8-dimensional-analysis-and-nondimensionalisation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-55}

The goal is to use physical dimensions as an error check and then rescale a PDE
so that its essential dimensionless parameters become visible.

```{=latex}
\Needspace{12\baselineskip}
```
### Dimensions Are Not The Same As Units {#dimensions-are-not-the-same-as-units-56}

```{=latex}
\Needspace{10\baselineskip}
```
A unit might be metres or centimetres. Both represent the dimension of length.
We use:

$$
[x]=L,
\qquad
[t]=T,
$$

where $L$ denotes length and $T$ denotes time.

```{=latex}
\Needspace{10\baselineskip}
```
If $u$ represents temperature, we may write:

$$
[u]=\Theta.
$$

Every term added in a physically meaningful equation must have the same
dimension.[^2]

```{=latex}
\Needspace{12\baselineskip}
```
### Find The Dimension Of Thermal Diffusivity {#find-the-dimension-of-thermal-diffusivity-57}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the heat equation:

$$
u_t=\kappa u_{xx}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the heat equation $u_t=\kappa u_{xx}$, differentiation with respect to
time divides by time:

$$
[u_t]=\frac{\Theta}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Two derivatives with respect to space divide by length twice:

$$
[u_{xx}]=\frac{\Theta}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two sides must have the same dimension:

$$
\frac{\Theta}{T}
=[\kappa]\frac{\Theta}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $\Theta$:

$$
\frac1T=\frac{[\kappa]}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $L^2$:

$$
\boxed{
[\kappa]=\frac{L^2}{T}
}.
$$

Thermal diffusivity therefore has dimensions of area per unit time.

```{=latex}
\Needspace{12\baselineskip}
```
### Check The Wave-Speed Dimension {#check-the-wave-speed-dimension-58}

```{=latex}
\Needspace{10\baselineskip}
```
For the wave equation:

$$
u_{tt}=c^2u_{xx},
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u_{tt}=c^2u_{xx}$, the derivative dimensions are:

$$
[u_{tt}]=\frac{[u]}{T^2},
\qquad
[u_{xx}]=\frac{[u]}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the dimensions of both sides:

$$
\frac{[u]}{T^2}
=[c]^2\frac{[u]}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $[u]$:

$$
\frac1{T^2}=\frac{[c]^2}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $L^2$:

$$
[c]^2=\frac{L^2}{T^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take the positive square root for a speed:

$$
\boxed{
[c]=\frac{L}{T}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Detect A Dimensionally Inconsistent Model {#detect-a-dimensionally-inconsistent-model-59}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose someone proposes:

$$
u_t=u_{xx}+u
$$

for a dimensional time $t$ and length $x$.

```{=latex}
\Needspace{10\baselineskip}
```
For the proposed model $u_t=u_{xx}+u$, the three terms have dimensions:

$$
[u_t]=\frac{[u]}{T},
\qquad
[u_{xx}]=\frac{[u]}{L^2},
\qquad
[u]=[u].
$$

These dimensions do not match. Coefficients with appropriate dimensions are
missing.

```{=latex}
\Needspace{10\baselineskip}
```
A consistent reaction-diffusion model may instead be:

$$
u_t=D u_{xx}+r u,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
[D]=\frac{L^2}{T},
\qquad
[r]=\frac1T.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
[D u_{xx}]
=\frac{L^2}{T}\frac{[u]}{L^2}
=\frac{[u]}{T},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
[r u]
=\frac1T[u]
=\frac{[u]}{T}.
$$

All three terms now agree.

```{=latex}
\Needspace{12\baselineskip}
```
### Nondimensionalise The Heat Equation {#nondimensionalise-the-heat-equation-60}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u_t=\kappa u_{xx}
$$

on a spatial interval with characteristic length $L$. Let $U_0$ be a typical
size of $u$.

```{=latex}
\Needspace{10\baselineskip}
```
Define dimensionless variables:

$$
X=\frac{x}{L},
\qquad
\tau=\frac{\kappa t}{L^2},
\qquad
U(X,\tau)=\frac{u(x,t)}{U_0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently:

$$
x=LX,
\qquad
t=\frac{L^2}{\kappa}\tau,
\qquad
u=U_0U.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The time scale:

$$
t_c=\frac{L^2}{\kappa}
$$

is the diffusion time across distance $L$.

```{=latex}
\Needspace{12\baselineskip}
```
### Transform The Heat Derivatives One At A Time {#transform-the-heat-derivatives-one-at-a-time-61}

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\tau=\frac{\kappa t}{L^2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have:

$$
\frac{\partial\tau}{\partial t}
=\frac{\kappa}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $u=U_0U(X,\tau)$ with respect to $t$. The coordinate $X=x/L$
does not depend on $t$, so:

$$
\begin{aligned}
u_t
&=U_0U_\tau\frac{\partial\tau}{\partial t}\\
&=U_0\frac{\kappa}{L^2}U_\tau.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the spatial derivative:

$$
\frac{\partial X}{\partial x}=\frac1L.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
u_x
&=U_0U_X\frac{\partial X}{\partial x}\\
&=\frac{U_0}{L}U_X.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once more with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=\frac{U_0}{L}(U_X)_x\\
&=\frac{U_0}{L}U_{XX}\frac{\partial X}{\partial x}\\
&=\frac{U_0}{L^2}U_{XX}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Cancel The Dimensional Scales {#cancel-the-dimensional-scales-62}

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
u_t=U_0\frac{\kappa}{L^2}U_\tau
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{xx}=\frac{U_0}{L^2}U_{XX}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these transformed derivatives into $u_t=\kappa u_{xx}$:

$$
U_0\frac{\kappa}{L^2}U_\tau
=\kappa\left(\frac{U_0}{L^2}U_{XX}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The common factor is:

$$
\frac{\kappa U_0}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide both sides by this nonzero factor:

$$
\boxed{
U_\tau=U_{XX}
}.
$$

The dimensionless heat equation contains no material parameter. The diffusivity
has been absorbed into the time scale.

```{=latex}
\Needspace{12\baselineskip}
```
### Advection Versus Diffusion {#advection-versus-diffusion-63}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
u_t+v u_x=D u_{xx},
$$

where $v$ is a constant transport speed and $D$ is a diffusivity.

```{=latex}
\Needspace{10\baselineskip}
```
Use the transport time $L/v$:

$$
X=\frac{x}{L},
\qquad
\tau=\frac{vt}{L},
\qquad
u=U_0U.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The derivatives become:

$$
u_t=\frac{U_0v}{L}U_\tau,
\qquad
u_x=\frac{U_0}{L}U_X,
\qquad
u_{xx}=\frac{U_0}{L^2}U_{XX}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these derivatives into
$u_t+v u_x=D u_{xx}$:

$$
\frac{U_0v}{L}U_\tau
+v\frac{U_0}{L}U_X
=D\frac{U_0}{L^2}U_{XX}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $U_0v/L$:

$$
U_\tau+U_X
=\frac{D}{vL}U_{XX}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the Peclet number:

$$
\boxed{
\operatorname{Pe}=\frac{vL}{D}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $D/(vL)=1/\operatorname{Pe}$, the dimensionless equation is:

$$
\boxed{
U_\tau+U_X
=\frac1{\operatorname{Pe}}U_{XX}
}.
$$

A large Peclet number means transport by advection is strong relative to
diffusion on the chosen length scale.

```{=latex}
\Needspace{12\baselineskip}
```
### Check That The Peclet Number Is Dimensionless {#check-that-the-peclet-number-is-dimensionless-64}

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
[v]=\frac{L}{T},
\qquad
[L]=L,
\qquad
[D]=\frac{L^2}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
[\operatorname{Pe}]
&=\frac{[v][L]}{[D]}\\
&=\frac{(L/T)(L)}{L^2/T}\\
&=\frac{L^2/T}{L^2/T}\\
&=1.
\end{aligned}
$$

The symbol $1$ means the group has no physical dimension.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-65}

Dimensional consistency checks whether terms can legitimately be added.
Nondimensionalisation goes further: it chooses natural scales, transforms each
derivative, and exposes the parameter combinations that control the behaviour.

```{=latex}
\Needspace{20\baselineskip}
```
## A Reliable Classification And Transformation Workflow {#block-9-a-reliable-classification-and-transformation-workflow}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-66}

The goal is to collect the chapter into a sequence that can be applied without
guessing which formula comes next.

```{=latex}
\Needspace{12\baselineskip}
```
### The Full Workflow {#the-full-workflow-67}

```{=latex}
\Needspace{10\baselineskip}
```
**Step 1: Isolate the principal part.** Write it in the convention:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

**Step 2: Read $A$, $B$, and $C$.** If the visible mixed coefficient is $q$,
solve $2B=q$ before continuing.

```{=latex}
\Needspace{10\baselineskip}
```
**Step 3: Calculate the discriminant.**

$$
\Delta=B^2-AC.
$$

**Step 4: Classify by region.** Variable coefficients may make the sign of
$\Delta$ depend on $(x,y)$.

```{=latex}
\Needspace{10\baselineskip}
```
**Step 5: For hyperbolic or parabolic equations, write the characteristic
equation.**

$$
A(dy)^2-2B\,dx\,dy+C(dx)^2=0.
$$

**Step 6: Solve for characteristic directions.** Use $dy/dx$ or $dx/dy$,
whichever avoids a zero denominator or an awkward integral.

**Step 7: Integrate each direction field.** Convert the constants of
integration into coordinate functions.

**Step 8: Choose enough independent coordinates.** Hyperbolic equations use
the two characteristic families. Parabolic equations need the repeated
characteristic coordinate plus another independent coordinate.

```{=latex}
\Needspace{10\baselineskip}
```
**Step 9: Check the Jacobian.**

$$
J=\xi_x\eta_y-\xi_y\eta_x\ne0.
$$

**Step 10: Transform derivatives locally.** Write the first derivatives, then
the second derivatives, and only then substitute into the PDE.

**Step 11: Simplify the canonical equation.** Do not assume lower-order terms
vanish when the coordinate functions are nonlinear.

**Step 12: Transform boundary or initial data.** A new PDE without transformed
data is not yet the complete transformed problem.

**Step 13: Verify the result.** If a general family is obtained, differentiate
it and substitute into the original equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using The Visible Mixed Coefficient As B {#common-mistake-using-the-visible-mixed-coefficient-as-b-68}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_{xx}+6u_{xy}+5u_{yy}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the convention is:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A=1,
\qquad
2B=6,
\qquad
C=5,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving $2B=6$ gives:

$$
B=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The correct discriminant is:

$$
\Delta=3^2-(1)(5)=4.
$$

Using $B=6$ would produce the wrong discriminant and the wrong characteristic
slopes.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Calling A Slope A Coordinate {#common-mistake-calling-a-slope-a-coordinate-69}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose the slope equation gives:

$$
\frac{dy}{dx}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The number $2$ is a direction, not a coordinate. Integrate:

$$
y=2x+k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then rearrange:

$$
y-2x=k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coordinate that stays constant along this family is:

$$
\xi=y-2x.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Skipping The Jacobian {#common-mistake-skipping-the-jacobian-70}

```{=latex}
\Needspace{10\baselineskip}
```
Consider:

$$
\xi=x+y,
\qquad
\eta=2x+2y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Although two formulas are written, the second is only twice the first:

$$
\eta=2\xi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)(2)-(1)(2)\\
&=0.
\end{aligned}
$$

The proposed transformation collapses the plane onto one coordinate direction
and cannot be inverted.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Dropping Lower-Order Chain-Rule Terms {#common-mistake-dropping-lower-order-chain-rule-terms-71}

```{=latex}
\Needspace{10\baselineskip}
```
For nonlinear $\xi(x,y)$:

$$
u_{xx}
=U_{\xi\xi}\xi_x^2+\cdots+U_\xi\xi_{xx}+\cdots.
$$

The term $U_\xi\xi_{xx}$ vanishes only when $\xi_{xx}=0$. A characteristic
choice removes a selected principal coefficient; it does not make every second
derivative of the coordinate functions zero.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Treating Canonical Form As The Final Answer {#common-mistake-treating-canonical-form-as-the-final-answer-72}

```{=latex}
\Needspace{10\baselineskip}
```
Reducing a PDE to:

$$
U_{\xi\eta}=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
is an important structural step. If the question asks for a solution, continue
to:

$$
U(\xi,\eta)=F(\xi)+G(\eta)
$$

and then return to $x,y$.

If the original problem includes boundary data, rewrite those curves and data
in the new coordinates as well.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 9 Summary {#block-9-summary-73}

```{=latex}
\Needspace{12\baselineskip}
```
The dependable chain is:

```{=latex}
\Needspace{8\baselineskip}
```
> principal part $\longrightarrow$ coefficients $\longrightarrow$
> discriminant $\longrightarrow$ characteristic directions
> $\longrightarrow$ characteristic curves $\longrightarrow$ Jacobian
> $\longrightarrow$ transformed PDE $\longrightarrow$ transformed data.

Each arrow represents a calculation that should be shown rather than implied.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 1 To 4: Classification And Characteristics {#problems-1-to-4-classification-and-characteristics-74}

#### Problem 1: Read The Principal Coefficients

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
4u_{xx}-12u_{xy}+5u_{yy}+7u_x-u=0.
$$

#### Problem 2: Classify By Region

```{=latex}
\Needspace{10\baselineskip}
```
Classify:

$$
(x-1)u_{xx}+u_{yy}=0
$$

in the regions $x<1$, $x=1$, and $x>1$.

#### Problem 3: Find Two Characteristic Slopes

```{=latex}
\Needspace{10\baselineskip}
```
Find the characteristic slopes of:

$$
u_{xx}-u_{xy}-2u_{yy}=0.
$$

#### Problem 4: Build Characteristic Coordinates

For the equation in Problem 3, integrate both characteristic directions,
choose $\xi$ and $\eta$, and verify that the Jacobian is nonzero.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 5 To 8: Canonical Forms {#problems-5-to-8-canonical-forms-75}

#### Problem 5: Solve A Hyperbolic Equation

```{=latex}
\Needspace{10\baselineskip}
```
Reduce and solve:

$$
u_{xx}+3u_{xy}+2u_{yy}=0.
$$

#### Problem 6: Solve A Parabolic Equation

```{=latex}
\Needspace{10\baselineskip}
```
Reduce and solve:

$$
4u_{xx}+4u_{xy}+u_{yy}=0.
$$

#### Problem 7: Rotate An Elliptic Equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}
$$

```{=latex}
\Needspace{10\baselineskip}
```
to remove the mixed derivative from:

$$
3u_{xx}+2u_{xy}+3u_{yy}=0.
$$

#### Problem 8: Check A Proposed Transformation

```{=latex}
\Needspace{10\baselineskip}
```
Determine whether:

$$
\xi=x-2y,
\qquad
\eta=3x+y
$$

defines a valid coordinate change.

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 9 To 12: Dimensions And Scaling {#problems-9-to-12-dimensions-and-scaling-76}

#### Problem 9: Find A Coefficient Dimension

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_t=\alpha u_{xxxx},
$$

find the dimension of $\alpha$.

#### Problem 10: Scale A Heat Equation

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_t=5u_{xx},
\qquad
0<x<4,
$$

choose dimensionless $X$ and $\tau$ that reduce the PDE to
$U_\tau=U_{XX}$.

#### Problem 11: Calculate A Peclet Number

```{=latex}
\Needspace{10\baselineskip}
```
An advection-diffusion model has:

$$
v=0.4\ {\rm m\,s^{-1}},
\qquad
L=2\ {\rm m},
\qquad
D=0.08\ {\rm m^2\,s^{-1}}.
$$

Calculate $\operatorname{Pe}=vL/D$ and interpret its size.

#### Problem 12: Check Dimensional Consistency

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $[u]=\Theta$, $[x]=L$, and $[t]=T$. Determine the dimensions that
$a$ and $b$ need in:

$$
u_t=a u_{xx}+b u.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Problems 13 And 14: Integration And Diagnosis {#problems-13-and-14-integration-and-diagnosis-77}

#### Problem 13: Integrate A Forced Canonical Equation

```{=latex}
\Needspace{10\baselineskip}
```
Find the general solution of:

$$
U_{\xi\eta}=e^\xi.
$$

#### Problem 14: Diagnose A Failed Coordinate Pair

```{=latex}
\Needspace{10\baselineskip}
```
Explain precisely why:

$$
\xi=x+y,
\qquad
\eta=2x+2y
$$

cannot be used as two new coordinates.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-78}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The equation is:

$$
4u_{xx}-12u_{xy}+5u_{yy}+7u_x-u=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match its principal part with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A=4,
\qquad
2B=-12,
\qquad
C=5.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $B$:

$$
B=-6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=(-6)^2-(4)(5)\\
&=36-20\\
&=16.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta>0$:

$$
\boxed{\text{the equation is hyperbolic}.}
$$

The terms $7u_x$ and $-u$ are lower order and do not enter the discriminant.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
(x-1)u_{xx}+u_{yy}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the principal coefficients are:

$$
A=x-1,
\qquad
B=0,
\qquad
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=0-(x-1)(1)\\
&=1-x.
\end{aligned}
$$

If $x<1$, then $1-x>0$, so the equation is hyperbolic.

If $x=1$, then $1-x=0$, so the equation is parabolic.

If $x>1$, then $1-x<0$, so the equation is elliptic.

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
\begin{array}{c|c}
x<1&\text{hyperbolic}\\
x=1&\text{parabolic}\\
x>1&\text{elliptic}
\end{array}
}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_{xx}-u_{xy}-2u_{yy}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare $u_{xx}-u_{xy}-2u_{yy}=0$ with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
A=1,
\qquad
2B=-1,
\qquad
C=-2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
B=-\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic slope equation is:

$$
A m^2-2Bm+C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1$, $B=-1/2$, and $C=-2$:

$$
m^2-2\left(-\frac12\right)m-2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the middle coefficient:

$$
m^2+m-2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(m-1)(m+2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic slopes are therefore:

$$
\boxed{
m_1=1,
\qquad
m_2=-2
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
The two slopes from Problem 3 are:

$$
\frac{dy}{dx}=1
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\frac{dy}{dx}=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the first direction:

$$
y=x+k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange $y=x+k_1$ to isolate the characteristic constant:

$$
y-x=k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
\xi=y-x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the second direction:

$$
y=-2x+k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange $y=-2x+k_2$:

$$
2x+y=k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
\eta=2x+y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The coordinate derivatives are:

$$
\begin{aligned}
\xi_x&=-1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the Jacobian:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(1)-(1)(2)\\
&=-3.
\end{aligned}
$$

Since $J\ne0$, the two characteristic coordinates define a valid local
coordinate change.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-79}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
u_{xx}+3u_{xy}+2u_{yy}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The principal coefficients in the $2B$ convention are:

$$
A=1,
\qquad
B=\frac32,
\qquad
C=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
A m^2-2Bm+C=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the coefficients:

$$
m^2-3m+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(m-1)(m-2)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the slopes are:

$$
m_1=1,
\qquad
m_2=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the first slope:

$$
\frac{dy}{dx}=1
\quad\Longrightarrow\quad
y-x=k_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the second slope:

$$
\frac{dy}{dx}=2
\quad\Longrightarrow\quad
y-2x=k_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
\xi=y-x,
\qquad
\eta=y-2x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(1)-(1)(-2)\\
&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transformation is valid. For a constant-coefficient hyperbolic equation,
these two characteristic coordinates reduce the PDE to a nonzero multiple of:

$$
U_{\xi\eta}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate the canonical equation:

$$
U(\xi,\eta)=F(\xi)+G(\eta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to the original variables:

$$
\boxed{
u(x,y)=F(y-x)+G(y-2x)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To check the first component, let $u=F(y-x)$. Then:

$$
u_{xx}=F'',
\qquad
u_{xy}=-F'',
\qquad
u_{yy}=F'',
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
u_{xx}+3u_{xy}+2u_{yy}
=F''-3F''+2F''
=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $u=G(y-2x)$:

$$
u_{xx}=4G'',
\qquad
u_{xy}=-2G'',
\qquad
u_{yy}=G'',
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{xx}+3u_{xy}+2u_{yy}
=4G''-6G''+2G''
=0.
$$

Linearity then verifies their sum.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
4u_{xx}+4u_{xy}+u_{yy}=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the principal coefficients are:

$$
A=4,
\qquad
B=2,
\qquad
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\Delta=2^2-(4)(1)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $4u_{xx}+4u_{xy}+u_{yy}=0$, $\Delta=0$, so the equation is
parabolic. Its slope equation is:

$$
4m^2-4m+1=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor:

$$
(2m-1)^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The repeated slope is:

$$
m=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\frac{dy}{dx}=\frac12
\quad\Longrightarrow\quad
y=\frac{x}{2}+k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $2$ and rearrange:

$$
2y-x=2k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose:

$$
\xi=2y-x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Choose the independent coordinate:

$$
\eta=y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\xi=2y-x$ and $\eta=y$, the Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(1)-(2)(0)\\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the transformation is valid. In these coordinates the operator
$4\partial_{xx}+4\partial_{xy}+\partial_{yy}$ becomes
$\partial_{\eta\eta}$, so:

$$
U_{\eta\eta}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate twice with respect to $\eta$:

$$
U(\xi,\eta)=\eta F(\xi)+G(\xi).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $\xi=2y-x$ and $\eta=y$:

$$
\boxed{
u(x,y)=yF(2y-x)+G(2y-x)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The required transformed derivatives are:

$$
\begin{aligned}
u_{xx}
&=\frac12U_{\xi\xi}-U_{\xi\eta}
+\frac12U_{\eta\eta},\\
u_{xy}
&=\frac12U_{\xi\xi}-\frac12U_{\eta\eta},\\
u_{yy}
&=\frac12U_{\xi\xi}+U_{\xi\eta}
+\frac12U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these derivatives into the original principal expression:

$$
3u_{xx}+2u_{xy}+3u_{yy}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\begin{aligned}
3u_{xx}
&=\frac32U_{\xi\xi}-3U_{\xi\eta}
+\frac32U_{\eta\eta},\\
2u_{xy}
&=U_{\xi\xi}-U_{\eta\eta},\\
3u_{yy}
&=\frac32U_{\xi\xi}+3U_{\xi\eta}
+\frac32U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add the three transformed lines:

$$
\begin{aligned}
3u_{xx}+2u_{xy}+3u_{yy}
={}&\left(\frac32+1+\frac32\right)U_{\xi\xi}\\
&+(-3+3)U_{\xi\eta}\\
&+\left(\frac32-1+\frac32\right)U_{\eta\eta}\\
={}&4U_{\xi\xi}+2U_{\eta\eta}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the canonical equation is:

$$
\boxed{
2U_{\xi\xi}+U_{\eta\eta}=0
},
$$

after division by $2$.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
\xi=x-2y,
\qquad
\eta=3x+y,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=-2,\\
\eta_x&=3,&\eta_y&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)(1)-(-2)(3)\\
&=1+6\\
&=7.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $J\ne0$:

$$
\boxed{\text{the coordinate change is valid}.}
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-80}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_t=\alpha u_{xxxx},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the time derivative has dimension:

$$
[u_t]=\frac{[u]}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Four spatial derivatives give:

$$
[u_{xxxx}]=\frac{[u]}{L^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the dimensions of both sides:

$$
\frac{[u]}{T}
=[\alpha]\frac{[u]}{L^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $[u]$:

$$
\frac1T=\frac{[\alpha]}{L^4}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $L^4$:

$$
\boxed{
[\alpha]=\frac{L^4}{T}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The heat equation is:

$$
u_t=5u_{xx}
$$

```{=latex}
\Needspace{10\baselineskip}
```
on a length-$4$ interval. Thus:

$$
\kappa=5,
\qquad
L=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the dimensionless space variable:

$$
X=\frac{x}{L}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $L=4$:

$$
\boxed{
X=\frac{x}{4}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the diffusion time variable:

$$
\tau=\frac{\kappa t}{L^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $\kappa=5$ and $L=4$:

$$
\begin{aligned}
\tau
&=\frac{5t}{4^2}\\
&=\frac{5t}{16}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The numerical calculation therefore gives:

$$
\boxed{
\tau=\frac{5t}{16}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $u=U_0U(X,\tau)$, the derivative factors are:

$$
u_t=U_0\frac5{16}U_\tau
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
u_{xx}=U_0\frac1{16}U_{XX}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $u_t=5u_{xx}$:

$$
U_0\frac5{16}U_\tau
=5\left(U_0\frac1{16}U_{XX}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5U_0/16$:

$$
\boxed{
U_\tau=U_{XX}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\operatorname{Pe}=\frac{vL}{D}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
v=0.4\ {\rm m\,s^{-1}},
\qquad
L=2\ {\rm m},
\qquad
D=0.08\ {\rm m^2\,s^{-1}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
\begin{aligned}
\operatorname{Pe}
&=\frac{(0.4)(2)}{0.08}\\
&=\frac{0.8}{0.08}\\
&=10.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The Peclet-number calculation gives:

$$
\boxed{\operatorname{Pe}=10.}
$$

On this length scale, advection is stronger than diffusion, although diffusion
is not absent.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
u_t=a u_{xx}+b u,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the left side has dimension:

$$
[u_t]=\frac{\Theta}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
[u_{xx}]=\frac{\Theta}{L^2},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the diffusion term must satisfy:

$$
[a]\frac{\Theta}{L^2}
=\frac{\Theta}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $\Theta$ and solve for $[a]$:

$$
\boxed{
[a]=\frac{L^2}{T}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the reaction term $bu$ in the same equation:

$$
[b]\Theta=\frac{\Theta}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $\Theta$:

$$
\boxed{
[b]=\frac1T
}.
$$

Both terms on the right then have the same dimension as $u_t$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 13 And 14 {#worked-answers-problems-13-and-14-81}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 13

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
U_{\xi\eta}=e^\xi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Regard $U_{\xi\eta}$ as the $\eta$-derivative of $U_\xi$:

$$
\frac{\partial}{\partial\eta}(U_\xi)=e^\xi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides with respect to $\eta$. Since $e^\xi$ is constant with
respect to $\eta$:

$$
U_\xi=\eta e^\xi+F(\xi).
$$

The integration function is $F(\xi)$ because differentiating it with respect
to $\eta$ gives zero.

```{=latex}
\Needspace{10\baselineskip}
```
Now integrate with respect to $\xi$:

$$
U(\xi,\eta)
=\int\left[\eta e^\xi+F(\xi)\right]d\xi.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate each term:

$$
U(\xi,\eta)
=\eta e^\xi+G(\xi)+H(\eta),
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
G'(\xi)=F(\xi)
$$

and $H(\eta)$ is the arbitrary function introduced by the second integration.

```{=latex}
\Needspace{10\baselineskip}
```
Integrating $U_{\xi\eta}=e^\xi$ twice therefore gives:

$$
\boxed{
U(\xi,\eta)=\eta e^\xi+G(\xi)+H(\eta)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Verify by differentiating with respect to $\xi$:

$$
U_\xi=\eta e^\xi+G'(\xi).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate this result with respect to $\eta$:

$$
\begin{aligned}
U_{\xi\eta}
&=\frac{\partial}{\partial\eta}
\left[\eta e^\xi+G'(\xi)\right]\\
&=e^\xi+0\\
&=e^\xi.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 14

```{=latex}
\Needspace{10\baselineskip}
```
The proposed coordinates are:

$$
\xi=x+y,
\qquad
\eta=2x+2y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
First observe:

$$
\eta=2(x+y).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\xi=x+y$, this means:

$$
\eta=2\xi.
$$

The two coordinates are therefore not independent.

```{=latex}
\Needspace{10\baselineskip}
```
For $\xi=x+y$ and $\eta=2x+2y$, the Jacobian confirms the problem.
The derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(1)(2)-(1)(2)\\
&=0.
\end{aligned}
$$

Because $J=0$, the map cannot be locally inverted. Specifying $\xi$ already
determines $\eta$, so the pair provides only one independent direction.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 32 Final Summary {#chapter-32-final-summary-82}

```{=latex}
\Needspace{10\baselineskip}
```
For a second-order PDE with principal part:

$$
A u_{xx}+2B u_{xy}+C u_{yy},
$$

```{=latex}
\Needspace{10\baselineskip}
```
the discriminant is:

$$
\Delta=B^2-AC.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its sign gives:

$$
\begin{array}{c|c}
\Delta>0&\text{hyperbolic}\\
\Delta=0&\text{parabolic}\\
\Delta<0&\text{elliptic}
\end{array}
$$

```{=latex}
\Needspace{10\baselineskip}
```
A characteristic level curve $\phi(x,y)=\text{constant}$ satisfies:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a nonvertical curve with $m=dy/dx$, this becomes:

$$
A m^2-2Bm+C=0.
$$

Hyperbolic equations have two real characteristic directions, parabolic
equations have one repeated real direction, and elliptic equations have no
real characteristic direction.

```{=latex}
\Needspace{10\baselineskip}
```
A coordinate change:

$$
\xi=\xi(x,y),
\qquad
\eta=\eta(x,y)
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its Jacobian must satisfy:

$$
J=\xi_x\eta_y-\xi_y\eta_x\ne0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The three typical canonical principal parts are:

$$
\begin{aligned}
U_{\xi\eta}&&&\text{hyperbolic},\\
U_{\eta\eta}&&&\text{parabolic},\\
U_{\xi\xi}+U_{\eta\eta}&&&\text{elliptic after scaling}.
\end{aligned}
$$

For nonlinear coordinate changes, second derivatives of $\xi$ and $\eta$
produce lower-order derivatives of $U$ and must not be discarded.

```{=latex}
\Needspace{10\baselineskip}
```
Dimensional analysis requires every additive term to have the same dimension.
For the heat and wave equations:

$$
[\kappa]=\frac{L^2}{T},
\qquad
[c]=\frac{L}{T}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Nondimensionalisation transforms both the variables and the derivatives. It can
remove dimensional constants or combine them into dimensionless groups such
as:

```{=latex}
\Needspace{12\baselineskip}
```
$$
\operatorname{Pe}=\frac{vL}{D}.
$$

```{=latex}
\Needspace{8\baselineskip}
```
> classify the principal part, integrate characteristic directions into
> coordinate functions, check the Jacobian, transform every required
> derivative, preserve lower-order terms, and verify the resulting equation.

[^1]: The matrix packages the quadratic expression
    $A p^2+2Bpq+Cq^2$. Hyperbolic, parabolic, and elliptic behaviour correspond
    to that quadratic expression having two, one, or no real zero directions.

[^2]: Dimensions describe the kind of quantity, while units
    specify a measurement scale. Changing metres to centimetres changes a
    numerical value but does not change the dimension $L$.
