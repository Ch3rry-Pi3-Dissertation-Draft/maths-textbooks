# Classification And Characteristic Coordinates

Chapter 31 introduced the main PDE models and used separation of variables in
fixed-boundary heat and wave problems. This chapter looks more closely at the
second-order part of a PDE.

The signs and combinations of the second derivatives tell us which coordinate
directions are natural for the equation. For a hyperbolic equation, those
directions lead to characteristic curves. For parabolic and elliptic
equations, related coordinate changes reveal different canonical forms.

This chapter will:

- isolate the principal part of a second-order PDE
- classify an equation as hyperbolic, parabolic, or elliptic
- explain why classification may change from one point to another
- derive the characteristic equation from a level curve
- distinguish a characteristic curve from its slope
- transform first and second partial derivatives carefully
- check that a coordinate change is locally invertible
- reduce constant-coefficient equations to canonical form
- solve simple canonical hyperbolic and parabolic equations
- use dimensional consistency to check PDE models
- nondimensionalise heat, wave, and advection-diffusion equations
- build a reliable classification-and-transformation workflow

---

## Block 1: Reading The Principal Part

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to identify the part of a second-order PDE that controls its type
and to apply the discriminant test without losing the factor of $2$ in the
mixed term.

> classification begins with the highest-order derivatives, not with every
> term in the equation.

</details>

<details open>
<summary><strong>The General Second-Order Form</strong></summary>

For an unknown function $u=u(x,y)$, write a general second-order equation as:

$$
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}
+D\,u_x+E\,u_y+F\,u=G.
$$

The coefficients may depend on $x$ and $y$. For example:

$$
A=A(x,y),
\qquad
B=B(x,y),
\qquad
C=C(x,y).
$$

The **principal part** is the collection of highest-order terms:

$$
\boxed{
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}
}.
$$

The lower-order terms $D u_x$, $E u_y$, and $F u$ affect the solutions, but
they do not determine the second-order type.

</details>

<details open>
<summary><strong>The Factor-Of-Two Convention</strong></summary>

This chapter uses:

$$
A\,u_{xx}+2B\,u_{xy}+C\,u_{yy}.
$$

Therefore, if the displayed equation contains:

$$
6u_{xy},
$$

then:

$$
2B=6,
$$

so:

$$
B=3.
$$

Do not insert the visible coefficient $6$ directly into $B^2-AC$.

The practical rule is:

> first match the mixed term with $2B u_{xy}$; only then calculate the
> discriminant.

</details>

<details open>
<summary><strong>The Discriminant Test</strong></summary>

Define:

$$
\Delta=B^2-AC.
$$

For $\Delta=B^2-AC$, the classification at the point being considered is:

$$
\begin{array}{c|c}
\Delta>0 & \text{hyperbolic}\\
\Delta=0 & \text{parabolic}\\
\Delta<0 & \text{elliptic}
\end{array}
$$

The same information is contained in the symmetric principal matrix:

$$
M=
\begin{pmatrix}
A&B\\
B&C
\end{pmatrix}.
$$

Its determinant is:

$$
\begin{aligned}
\det M
&=AC-B^2\\
&=-\Delta.
\end{aligned}
$$

Thus the PDE discriminant has the opposite sign from the determinant of the
principal matrix.[^quadratic-form]

[^quadratic-form]: The matrix packages the quadratic expression
    $A p^2+2Bpq+Cq^2$. Hyperbolic, parabolic, and elliptic behaviour correspond
    to that quadratic expression having two, one, or no real zero directions.

</details>

<details open>
<summary><strong>Worked Classification With A Mixed Term</strong></summary>

Classify:

$$
3u_{xx}-8u_{xy}+2u_{yy}+u_x=0.
$$

Match the principal part with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

For $3u_{xx}-8u_{xy}+2u_{yy}+u_x=0$, the principal coefficients are:

$$
A=3,
\qquad
2B=-8,
\qquad
C=2.
$$

Solve $2B=-8$ for $B$:

$$
B=-4.
$$

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

Since $\Delta>0$:

$$
\boxed{\text{the equation is hyperbolic}.}
$$

The first-order term $u_x$ does not enter this classification.

</details>

<details open>
<summary><strong>Worked Classification At Different Points</strong></summary>

Consider:

$$
(1-x^2-y^2)u_{xx}+u_{yy}=0.
$$

Here:

$$
A=1-x^2-y^2,
\qquad
B=0,
\qquad
C=1.
$$

For this variable-coefficient equation, the discriminant is:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=0-(1-x^2-y^2)(1)\\
&=x^2+y^2-1.
\end{aligned}
$$

Inside the unit circle, $x^2+y^2<1$, so:

$$
\Delta<0.
$$

The equation is elliptic there.

On the unit circle, $x^2+y^2=1$, so:

$$
\Delta=0.
$$

The equation is parabolic there.

Outside the unit circle, $x^2+y^2>1$, so:

$$
\Delta>0.
$$

The equation is hyperbolic there.

What this tells us:

> a variable-coefficient PDE can change type across a curve. Classification
> is then a local statement, not one permanent label for the whole plane.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

For:

$$
A u_{xx}+2B u_{xy}+C u_{yy}+\text{lower-order terms}=0,
$$

calculate:

$$
\Delta=B^2-AC.
$$

The sign of $\Delta$ determines the type. If the coefficients depend on the
independent variables, repeat the sign analysis in each relevant region.

</details>

---

## Block 2: Changing Coordinates Without Skipping The Chain Rule

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to express a PDE in new coordinates while keeping every chain-rule
term visible. These formulas explain exactly how characteristic and canonical
coordinates change the principal part.

</details>

<details open>
<summary><strong>Old And New Variables</strong></summary>

Introduce new coordinates:

$$
\xi=\xi(x,y),
\qquad
\eta=\eta(x,y).
$$

Write the same dependent variable in the new coordinates as:

$$
u(x,y)=U(\xi,\eta).
$$

The letters $u$ and $U$ do not represent two unrelated solutions. They are two
coordinate descriptions of the same function.

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

</details>

<details open>
<summary><strong>Transform The First Derivatives</strong></summary>

Since $u(x,y)=U(\xi(x,y),\eta(x,y))$, the multivariable chain rule gives:

$$
\boxed{
u_x=U_\xi\xi_x+U_\eta\eta_x
}.
$$

Similarly:

$$
\boxed{
u_y=U_\xi\xi_y+U_\eta\eta_y
}.
$$

Each old derivative differentiates through both new coordinates. For example,
$u_x$ contains one contribution from the change of $\xi$ with $x$ and another
from the change of $\eta$ with $x$.

</details>

<details open>
<summary><strong>Derive The Second X-Derivative</strong></summary>

Start from the transformed first derivative:

$$
u_x=U_\xi\xi_x+U_\eta\eta_x.
$$

Differentiate both terms with respect to $x$:

$$
u_{xx}
=\frac{\partial}{\partial x}(U_\xi\xi_x)
+\frac{\partial}{\partial x}(U_\eta\eta_x).
$$

Apply the product rule to both terms in the expression for $u_{xx}$:

$$
u_{xx}
=(U_\xi)_x\xi_x+U_\xi\xi_{xx}
+(U_\eta)_x\eta_x+U_\eta\eta_{xx}.
$$

Now apply the chain rule to the derivatives of $U_\xi$ and $U_\eta$:

$$
\begin{aligned}
(U_\xi)_x
&=U_{\xi\xi}\xi_x+U_{\xi\eta}\eta_x,\\
(U_\eta)_x
&=U_{\eta\xi}\xi_x+U_{\eta\eta}\eta_x.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Transform The Mixed And Y-Derivatives</strong></summary>

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

</details>

<details open>
<summary><strong>Read The New Principal Coefficients</strong></summary>

Substitute the transformed derivatives into:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

The coefficient of $U_{\xi\xi}$ is:

$$
\boxed{
\overline A
=A\xi_x^2+2B\xi_x\xi_y+C\xi_y^2
}.
$$

The coefficient of $U_{\eta\eta}$ is:

$$
\boxed{
\overline C
=A\eta_x^2+2B\eta_x\eta_y+C\eta_y^2
}.
$$

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

</details>

<details open>
<summary><strong>A Linear Coordinate Check</strong></summary>

Let:

$$
\xi=x+y,
\qquad
\eta=2x-y.
$$

The first derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=-1.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

A valid coordinate change needs $J\ne0$. The chain rule transforms each old
second derivative into a combination of $U_{\xi\xi}$, $U_{\xi\eta}$,
$U_{\eta\eta}$, and possibly lower-order terms. Canonical coordinates are
chosen to make one or more principal coefficients vanish.

</details>

---

## Block 3: Deriving Characteristic Curves

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to derive the characteristic equation and connect its real roots
to the three PDE types.

</details>

<details open>
<summary><strong>Choose A Coordinate That Removes One Pure Derivative</strong></summary>

Suppose one new coordinate is:

$$
\xi=\phi(x,y).
$$

The coefficient of $U_{\xi\xi}$ in the transformed principal part is:

$$
\overline A
=A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2.
$$

To remove $U_{\xi\xi}$, require:

$$
\boxed{
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0
}.
$$

The curves $\phi(x,y)=\text{constant}$ that satisfy this condition are
characteristic curves.

</details>

<details open>
<summary><strong>Convert The Level-Curve Condition Into A Slope Equation</strong></summary>

Along a level curve $\phi(x,y)=k$, the differential of $\phi$ is zero:

$$
d\phi=0.
$$

Expand the level-curve condition $d\phi=0$:

$$
\phi_x\,dx+\phi_y\,dy=0.
$$

If $dx\ne0$, define the curve slope:

$$
m=\frac{dy}{dx}.
$$

Divide the level-curve equation by $dx$:

$$
\phi_x+\phi_y m=0.
$$

Solve for $\phi_x$:

$$
\phi_x=-m\phi_y.
$$

Substitute this into the characteristic condition:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

This gives:

$$
A(-m\phi_y)^2
+2B(-m\phi_y)\phi_y
+C\phi_y^2=0.
$$

Expand the powers and products:

$$
A m^2\phi_y^2
-2Bm\phi_y^2
+C\phi_y^2=0.
$$

For a nondegenerate level curve with $\phi_y\ne0$, divide by $\phi_y^2$:

$$
\boxed{
A m^2-2Bm+C=0
}.
$$

Equivalently:

$$
\boxed{
A(dy)^2-2B\,dx\,dy+C(dx)^2=0
}.
$$

The differential form remains useful when a characteristic is vertical and
$dy/dx$ is not finite.

</details>

<details open>
<summary><strong>Why The Discriminant Reappears</strong></summary>

For $A\ne0$, solve:

$$
A m^2-2Bm+C=0
$$

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

Since $\Delta=B^2-AC$:

$$
\boxed{
m=\frac{B\pm\sqrt\Delta}{A}
}.
$$

Therefore:

- $\Delta>0$ gives two distinct real characteristic directions
- $\Delta=0$ gives one repeated real characteristic direction
- $\Delta<0$ gives no real characteristic direction

This is the geometric reason behind the hyperbolic, parabolic, and elliptic
classification.

</details>

<details open>
<summary><strong>Characteristic Direction Versus Characteristic Curve</strong></summary>

The formula:

$$
\frac{dy}{dx}=m(x,y)
$$

specifies a direction field. A characteristic curve is obtained by solving
that first-order ODE.

If $m$ is constant, integration gives straight lines. For example:

$$
\frac{dy}{dx}=-2
$$

integrates to:

$$
y=-2x+k.
$$

Rearrange to place the constant on one side:

$$
2x+y=k.
$$

Thus a suitable characteristic coordinate is:

$$
\xi=2x+y.
$$

Do not stop after finding the slope. The coordinate used in the transformation
must be constant along the corresponding family of curves.

</details>

<details open>
<summary><strong>A Quick Characteristic Calculation</strong></summary>

Find the characteristic slopes of:

$$
2u_{xx}+2u_{xy}-u_{yy}=0.
$$

Match the principal coefficients:

$$
A=2,
\qquad
2B=2,
\qquad
C=-1.
$$

Hence:

$$
B=1.
$$

The slope equation is:

$$
A m^2-2Bm+C=0.
$$

Substitute $A=2$, $B=1$, and $C=-1$:

$$
2m^2-2m-1=0.
$$

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

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Characteristic coordinates satisfy:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

For nonvertical curves, their slopes satisfy:

$$
A\left(\frac{dy}{dx}\right)^2
-2B\frac{dy}{dx}+C=0.
$$

Solve the slope equation, integrate each direction field, and use the resulting
constants of integration as new coordinates.

</details>

---

## Block 4: A Hyperbolic Equation In Canonical Coordinates

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to find both characteristic families, build a valid coordinate
change, and reduce a hyperbolic PDE to a mixed-derivative canonical form.

</details>

<details open>
<summary><strong>Classify And Find The Characteristic Slopes</strong></summary>

Consider:

$$
u_{xx}-4u_{xy}+3u_{yy}=0.
$$

Match the equation with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

For $u_{xx}-4u_{xy}+3u_{yy}=0$, the principal coefficients are:

$$
A=1,
\qquad
2B=-4,
\qquad
C=3,
$$

so:

$$
B=-2.
$$

Calculate the discriminant:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=(-2)^2-(1)(3)\\
&=1>0.
\end{aligned}
$$

The equation is hyperbolic. Its characteristic slope equation is:

$$
A m^2-2Bm+C=0.
$$

Insert $A=1$, $B=-2$, and $C=3$:

$$
m^2+4m+3=0.
$$

Factor:

$$
(m+1)(m+3)=0.
$$

Therefore the two slopes are:

$$
m_1=-1,
\qquad
m_2=-3.
$$

</details>

<details open>
<summary><strong>Integrate Both Characteristic Families</strong></summary>

For the first family:

$$
\frac{dy}{dx}=-1.
$$

Integrate with respect to $x$:

$$
y=-x+k_1.
$$

Rearrange $y=-x+k_1$:

$$
x+y=k_1.
$$

A coordinate that is constant on this first family is:

$$
\xi=x+y.
$$

For the second family:

$$
\frac{dy}{dx}=-3.
$$

Integrate:

$$
y=-3x+k_2.
$$

Rearrange $y=-3x+k_2$:

$$
3x+y=k_2.
$$

A coordinate that is constant on this second family is:

$$
\eta=3x+y.
$$

These coordinates are constant along the two characteristic families.

</details>

<details open>
<summary><strong>Check The Jacobian</strong></summary>

For:

$$
\xi=x+y,
\qquad
\eta=3x+y,
$$

the coordinate derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=3,&\eta_y&=1.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Transform The Derivatives Explicitly</strong></summary>

Write:

$$
u(x,y)=U(\xi,\eta).
$$

Because $\xi$ and $\eta$ are linear, their second derivatives vanish. The
first derivative with respect to $x$ is:

$$
\begin{aligned}
u_x
&=U_\xi\xi_x+U_\eta\eta_x\\
&=U_\xi+3U_\eta.
\end{aligned}
$$

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

The first derivative with respect to $y$ is:

$$
\begin{aligned}
u_y
&=U_\xi\xi_y+U_\eta\eta_y\\
&=U_\xi+U_\eta.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Substitute And Watch The Pure Derivatives Cancel</strong></summary>

The original principal expression is:

$$
u_{xx}-4u_{xy}+3u_{yy}.
$$

Substitute the transformed derivatives:

$$
\begin{aligned}
u_{xx}-4u_{xy}+3u_{yy}
={}&(U_{\xi\xi}+6U_{\xi\eta}+9U_{\eta\eta})\\
&-4(U_{\xi\xi}+4U_{\xi\eta}+3U_{\eta\eta})\\
&+3(U_{\xi\xi}+2U_{\xi\eta}+U_{\eta\eta}).
\end{aligned}
$$

Collect the coefficient of each new second derivative:

$$
\begin{aligned}
u_{xx}-4u_{xy}+3u_{yy}
={}&(1-4+3)U_{\xi\xi}\\
&+(6-16+6)U_{\xi\eta}\\
&+(9-12+3)U_{\eta\eta}.
\end{aligned}
$$

Simplify the three numerical coefficients:

$$
u_{xx}-4u_{xy}+3u_{yy}
=-4U_{\xi\eta}.
$$

Therefore the PDE becomes:

$$
-4U_{\xi\eta}=0.
$$

Divide by $-4$:

$$
\boxed{U_{\xi\eta}=0.}
$$

This is the hyperbolic canonical form.

</details>

<details open>
<summary><strong>Solve The Canonical Equation</strong></summary>

Start from:

$$
U_{\xi\eta}=0.
$$

Treat $U_\xi$ as the quantity being differentiated with respect to $\eta$:

$$
\frac{\partial}{\partial\eta}(U_\xi)=0.
$$

Therefore $U_\xi$ does not depend on $\eta$. Write:

$$
U_\xi=F'(\xi),
$$

where $F$ is an arbitrary differentiable function.

Integrate with respect to $\xi$:

$$
U(\xi,\eta)=F(\xi)+G(\eta),
$$

where $G$ is the arbitrary function introduced by the integration.

Return to the original coordinates:

$$
\xi=x+y,
\qquad
\eta=3x+y.
$$

Hence:

$$
\boxed{
u(x,y)=F(x+y)+G(3x+y)
}.
$$

The solution contains one arbitrary function associated with each
characteristic family.

</details>

<details open>
<summary><strong>Verify The General Family</strong></summary>

Let:

$$
u(x,y)=F(x+y)+G(3x+y).
$$

Differentiate once with respect to $x$:

$$
u_x=F'(x+y)+3G'(3x+y).
$$

Differentiate again with respect to $x$:

$$
u_{xx}=F''(x+y)+9G''(3x+y).
$$

Differentiate $u_x$ with respect to $y$:

$$
u_{xy}=F''(x+y)+3G''(3x+y).
$$

Differentiate twice with respect to $y$:

$$
u_{yy}=F''(x+y)+G''(3x+y).
$$

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

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

For a hyperbolic equation, the two characteristic families provide two new
coordinates. In this example they reduced the principal part to
$U_{\xi\eta}$, and integrating the canonical equation produced one arbitrary
function of each characteristic coordinate.

</details>

---

## Block 5: A Parabolic Equation In Canonical Coordinates

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to see what changes when the characteristic equation has one
repeated direction rather than two distinct directions.

</details>

<details open>
<summary><strong>Classify The Equation</strong></summary>

Consider:

$$
u_{xx}+2u_{xy}+u_{yy}=0.
$$

The principal coefficients are:

$$
A=1,
\qquad
B=1,
\qquad
C=1.
$$

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

</details>

<details open>
<summary><strong>Find The Repeated Characteristic</strong></summary>

Use the slope equation:

$$
A m^2-2Bm+C=0.
$$

Substitute $A=1$, $B=1$, and $C=1$:

$$
m^2-2m+1=0.
$$

Factor:

$$
(m-1)^2=0.
$$

The repeated slope is:

$$
m=1.
$$

Thus:

$$
\frac{dy}{dx}=1.
$$

Integrate:

$$
y=x+k.
$$

Rearrange:

$$
y-x=k.
$$

Since $y-x=k$, choose the characteristic coordinate:

$$
\xi=y-x.
$$

A second coordinate must be independent of $\xi$. A convenient choice is:

$$
\eta=x.
$$

</details>

<details open>
<summary><strong>Check That The Coordinates Are Independent</strong></summary>

For:

$$
\xi=y-x,
\qquad
\eta=x,
$$

the first derivatives are:

$$
\begin{aligned}
\xi_x&=-1,&\xi_y&=1,\\
\eta_x&=1,&\eta_y&=0.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Transform Each Second Derivative</strong></summary>

Write $u(x,y)=U(\xi,\eta)$. First:

$$
\begin{aligned}
u_x
&=U_\xi\xi_x+U_\eta\eta_x\\
&=-U_\xi+U_\eta.
\end{aligned}
$$

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

Next:

$$
\begin{aligned}
u_y
&=U_\xi\xi_y+U_\eta\eta_y\\
&=U_\xi.
\end{aligned}
$$

Differentiate $u_x=-U_\xi+U_\eta$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=-(U_\xi)_y+(U_\eta)_y\\
&=-U_{\xi\xi}+U_{\eta\xi}\\
&=-U_{\xi\xi}+U_{\xi\eta}.
\end{aligned}
$$

Differentiate $u_y=U_\xi$ with respect to $y$:

$$
u_{yy}=U_{\xi\xi}.
$$

</details>

<details open>
<summary><strong>Reduce And Solve The Canonical Equation</strong></summary>

Substitute the transformed derivatives into:

$$
u_{xx}+2u_{xy}+u_{yy}.
$$

This gives:

$$
\begin{aligned}
u_{xx}+2u_{xy}+u_{yy}
={}&(U_{\xi\xi}-2U_{\xi\eta}+U_{\eta\eta})\\
&+2(-U_{\xi\xi}+U_{\xi\eta})
+U_{\xi\xi}.
\end{aligned}
$$

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

Therefore the canonical equation is:

$$
\boxed{U_{\eta\eta}=0.}
$$

Integrate once with respect to $\eta$:

$$
U_\eta=F(\xi).
$$

Integrate a second time with respect to $\eta$:

$$
U(\xi,\eta)=\eta F(\xi)+G(\xi).
$$

Return to $\xi=y-x$ and $\eta=x$:

$$
\boxed{
u(x,y)=xF(y-x)+G(y-x)
}.
$$

Both arbitrary functions depend on the single repeated characteristic
coordinate.

</details>

<details open>
<summary><strong>Verify The Parabolic Solution Family</strong></summary>

Let:

$$
s=y-x
$$

and write:

$$
u(x,y)=xF(s)+G(s).
$$

Since:

$$
s_x=-1,
\qquad
s_y=1,
$$

differentiate with respect to $x$:

$$
\begin{aligned}
u_x
&=F(s)+xF'(s)s_x+G'(s)s_x\\
&=F(s)-xF'(s)-G'(s).
\end{aligned}
$$

Differentiate this expression with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=F'(s)s_x-\left[F'(s)+xF''(s)s_x\right]-G''(s)s_x\\
&=-F'(s)-F'(s)+xF''(s)+G''(s)\\
&=-2F'(s)+xF''(s)+G''(s).
\end{aligned}
$$

Differentiate $u_x$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=F'(s)s_y-xF''(s)s_y-G''(s)s_y\\
&=F'(s)-xF''(s)-G''(s).
\end{aligned}
$$

Differentiate $u$ with respect to $y$:

$$
u_y=xF'(s)+G'(s).
$$

Differentiate again with respect to $y$:

$$
u_{yy}=xF''(s)+G''(s).
$$

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

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

A parabolic equation has one repeated characteristic family. One new
coordinate follows that family; the other is any convenient independent
coordinate. The canonical principal part contains one pure second derivative.

</details>

---

## Block 6: An Elliptic Equation And Rotation Of Axes

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to remove a mixed derivative from an elliptic equation even though
there are no real characteristic curves.

</details>

<details open>
<summary><strong>Why Rotation Is The Natural Tool</strong></summary>

Consider a constant-coefficient principal part:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

Use a rotation:

$$
\begin{aligned}
\xi&=x\cos\theta+y\sin\theta,\\
\eta&=-x\sin\theta+y\cos\theta.
\end{aligned}
$$

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

After substitution, the coefficient of $U_{\xi\eta}$ is:

$$
(C-A)\sin(2\theta)+2B\cos(2\theta).
$$

Set this coefficient equal to zero:

$$
(C-A)\sin(2\theta)+2B\cos(2\theta)=0.
$$

When the relevant denominator is nonzero, rearrange to obtain:

$$
\boxed{
\tan(2\theta)=\frac{2B}{A-C}
}.
$$

This angle aligns the new axes with the principal directions of the quadratic
form.

</details>

<details open>
<summary><strong>A Worked Elliptic Rotation</strong></summary>

Consider:

$$
2u_{xx}+2u_{xy}+2u_{yy}=0.
$$

The coefficients are:

$$
A=2,
\qquad
B=1,
\qquad
C=2.
$$

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

Since $A=C$ and $B\ne0$, the rotation condition is satisfied by:

$$
2\theta=\frac{\pi}{2},
$$

so choose:

$$
\theta=\frac{\pi}{4}.
$$

The rotated coordinates are:

$$
\boxed{
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}
}.
$$

</details>

<details open>
<summary><strong>Transform The Rotated Derivatives</strong></summary>

For the chosen rotation:

$$
\begin{aligned}
\xi_x&=\frac1{\sqrt2},&
\xi_y&=\frac1{\sqrt2},\\
\eta_x&=-\frac1{\sqrt2},&
\eta_y&=\frac1{\sqrt2}.
\end{aligned}
$$

The first derivatives are:

$$
\begin{aligned}
u_x
&=\frac1{\sqrt2}U_\xi-\frac1{\sqrt2}U_\eta,\\
u_y
&=\frac1{\sqrt2}U_\xi+\frac1{\sqrt2}U_\eta.
\end{aligned}
$$

Differentiate $u_x$ with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=\frac12U_{\xi\xi}
-U_{\xi\eta}
+\frac12U_{\eta\eta}.
\end{aligned}
$$

Differentiate $u_x$ with respect to $y$:

$$
\begin{aligned}
u_{xy}
&=\frac12U_{\xi\xi}
-\frac12U_{\eta\eta}.
\end{aligned}
$$

Differentiate $u_y$ with respect to $y$:

$$
\begin{aligned}
u_{yy}
&=\frac12U_{\xi\xi}
+U_{\xi\eta}
+\frac12U_{\eta\eta}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Substitute Into The Elliptic Equation</strong></summary>

The original left side is:

$$
2u_{xx}+2u_{xy}+2u_{yy}.
$$

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

Thus $2u_{xx}+2u_{xy}+2u_{yy}=0$ becomes:

$$
\boxed{
3U_{\xi\xi}+U_{\eta\eta}=0
}.
$$

The mixed derivative has disappeared, and both remaining pure derivatives have
coefficients with the same sign.

</details>

<details open>
<summary><strong>Rescale To The Laplace Form</strong></summary>

Start from:

$$
3U_{\xi\xi}+U_{\eta\eta}=0.
$$

Define:

$$
X=\frac{\xi}{\sqrt3},
\qquad
Y=\eta,
$$

and write:

$$
U(\xi,\eta)=V(X,Y).
$$

Since $X_\xi=1/\sqrt3$:

$$
\begin{aligned}
U_\xi
&=V_X X_\xi\\
&=\frac1{\sqrt3}V_X.
\end{aligned}
$$

Differentiate once more with respect to $\xi$:

$$
\begin{aligned}
U_{\xi\xi}
&=\frac1{\sqrt3}(V_X)_\xi\\
&=\frac1{\sqrt3}V_{XX}X_\xi\\
&=\frac13V_{XX}.
\end{aligned}
$$

Because $Y=\eta$:

$$
U_{\eta\eta}=V_{YY}.
$$

Substitute both derivatives:

$$
3\left(\frac13V_{XX}\right)+V_{YY}=0.
$$

Simplify:

$$
\boxed{
V_{XX}+V_{YY}=0
}.
$$

Thus the equation has been reduced to Laplace's equation in scaled, rotated
coordinates.

</details>

<details open>
<summary><strong>What Elliptic Canonical Form Does Not Give Us</strong></summary>

For the hyperbolic and parabolic examples, the canonical PDE integrated
directly to an arbitrary-function family. Laplace's equation does not collapse
in the same way.

Solving an elliptic problem normally requires information on a surrounding
boundary. The coordinate transformation simplifies the differential operator,
but it does not replace the boundary-value problem.

> canonical form reveals structure; it is not automatically a complete
> solution method.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

An elliptic equation has no real characteristic directions. A rotation removes
the mixed derivative, and a positive rescaling can reduce the principal part
to a sum of two pure second derivatives.

</details>

---

## Block 7: Variable Coefficients And A Change Of Type

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to classify a variable-coefficient equation by region and to find
its real characteristic curves only where they actually exist.

</details>

<details open>
<summary><strong>A Mixed-Type Model</strong></summary>

Consider:

$$
y\,u_{xx}+u_{yy}=0.
$$

The coefficients are:

$$
A=y,
\qquad
B=0,
\qquad
C=1.
$$

Hence:

$$
\begin{aligned}
\Delta
&=B^2-AC\\
&=0-y(1)\\
&=-y.
\end{aligned}
$$

Therefore:

$$
\begin{array}{c|c}
y<0 & \Delta>0\text{: hyperbolic}\\
y=0 & \Delta=0\text{: parabolic}\\
y>0 & \Delta<0\text{: elliptic}
\end{array}
$$

The line $y=0$ separates regions with different PDE behaviour.

</details>

<details open>
<summary><strong>Find Characteristics In The Hyperbolic Region</strong></summary>

Use the differential characteristic equation:

$$
A(dy)^2-2B\,dx\,dy+C(dx)^2=0.
$$

Insert $A=y$, $B=0$, and $C=1$:

$$
y(dy)^2+(dx)^2=0.
$$

In the hyperbolic region $y<0$, rearrange:

$$
(dx)^2=-y(dy)^2.
$$

Take square roots:

$$
\frac{dx}{dy}=\pm\sqrt{-y}.
$$

Using $dx/dy$ avoids dividing by $A=y$ and gives a cleaner integral near the
change-of-type line.

</details>

<details open>
<summary><strong>Integrate The Two Variable-Coefficient Families</strong></summary>

For the positive sign:

$$
\frac{dx}{dy}=\sqrt{-y}.
$$

Integrate with respect to $y$:

$$
x=\int\sqrt{-y}\,dy+k_1.
$$

Let $q=-y$, so $dq=-dy$. Then:

$$
\begin{aligned}
\int\sqrt{-y}\,dy
&=-\int q^{1/2}\,dq\\
&=-\frac23q^{3/2}\\
&=-\frac23(-y)^{3/2}.
\end{aligned}
$$

Thus:

$$
x+\frac23(-y)^{3/2}=k_1.
$$

For the negative sign:

$$
\frac{dx}{dy}=-\sqrt{-y}.
$$

Integrating gives:

$$
x-\frac23(-y)^{3/2}=k_2.
$$

Therefore characteristic coordinates in $y<0$ may be chosen as:

$$
\boxed{
\xi=x+\frac23(-y)^{3/2},
\qquad
\eta=x-\frac23(-y)^{3/2}
}.
$$

</details>

<details open>
<summary><strong>Check The Variable-Coefficient Jacobian</strong></summary>

Differentiate the coordinates for $y<0$:

$$
\begin{aligned}
\xi_x&=1,&
\xi_y&=-\sqrt{-y},\\
\eta_x&=1,&
\eta_y&=\sqrt{-y}.
\end{aligned}
$$

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

</details>

<details open>
<summary><strong>Why Extra First-Derivative Terms Appear</strong></summary>

The coordinates $\xi$ and $\eta$ contain $(-y)^{3/2}$, so they are not linear.
Consequently:

$$
\xi_{yy}\ne0,
\qquad
\eta_{yy}\ne0.
$$

The second-derivative chain rule contains:

$$
U_\xi\xi_{yy}+U_\eta\eta_{yy}.
$$

These terms survive as first-order derivatives of $U$ in the transformed PDE.
The characteristic choice still simplifies the principal part, but it does not
guarantee that every lower-order term disappears.

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

For variable coefficients, classify point by point or region by region.
Characteristics exist as real curves only in hyperbolic or parabolic regions.
Nonlinear coordinate changes generally create lower-order chain-rule terms,
and the Jacobian may reveal where the transformation degenerates.

</details>

---

## Block 8: Dimensional Analysis And Nondimensionalisation

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to use physical dimensions as an error check and then rescale a PDE
so that its essential dimensionless parameters become visible.

</details>

<details open>
<summary><strong>Dimensions Are Not The Same As Units</strong></summary>

A unit might be metres or centimetres. Both represent the dimension of length.
We use:

$$
[x]=L,
\qquad
[t]=T,
$$

where $L$ denotes length and $T$ denotes time.

If $u$ represents temperature, we may write:

$$
[u]=\Theta.
$$

Every term added in a physically meaningful equation must have the same
dimension.[^dimensions-units]

[^dimensions-units]: Dimensions describe the kind of quantity, while units
    specify a measurement scale. Changing metres to centimetres changes a
    numerical value but does not change the dimension $L$.

</details>

<details open>
<summary><strong>Find The Dimension Of Thermal Diffusivity</strong></summary>

Consider the heat equation:

$$
u_t=\kappa u_{xx}.
$$

For the heat equation $u_t=\kappa u_{xx}$, differentiation with respect to
time divides by time:

$$
[u_t]=\frac{\Theta}{T}.
$$

Two derivatives with respect to space divide by length twice:

$$
[u_{xx}]=\frac{\Theta}{L^2}.
$$

The two sides must have the same dimension:

$$
\frac{\Theta}{T}
=[\kappa]\frac{\Theta}{L^2}.
$$

Cancel $\Theta$:

$$
\frac1T=\frac{[\kappa]}{L^2}.
$$

Multiply by $L^2$:

$$
\boxed{
[\kappa]=\frac{L^2}{T}
}.
$$

Thermal diffusivity therefore has dimensions of area per unit time.

</details>

<details open>
<summary><strong>Check The Wave-Speed Dimension</strong></summary>

For the wave equation:

$$
u_{tt}=c^2u_{xx},
$$

For $u_{tt}=c^2u_{xx}$, the derivative dimensions are:

$$
[u_{tt}]=\frac{[u]}{T^2},
\qquad
[u_{xx}]=\frac{[u]}{L^2}.
$$

Match the dimensions of both sides:

$$
\frac{[u]}{T^2}
=[c]^2\frac{[u]}{L^2}.
$$

Cancel $[u]$:

$$
\frac1{T^2}=\frac{[c]^2}{L^2}.
$$

Multiply by $L^2$:

$$
[c]^2=\frac{L^2}{T^2}.
$$

Take the positive square root for a speed:

$$
\boxed{
[c]=\frac{L}{T}
}.
$$

</details>

<details open>
<summary><strong>Detect A Dimensionally Inconsistent Model</strong></summary>

Suppose someone proposes:

$$
u_t=u_{xx}+u
$$

for a dimensional time $t$ and length $x$.

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

A consistent reaction-diffusion model may instead be:

$$
u_t=D u_{xx}+r u,
$$

where:

$$
[D]=\frac{L^2}{T},
\qquad
[r]=\frac1T.
$$

Then:

$$
[D u_{xx}]
=\frac{L^2}{T}\frac{[u]}{L^2}
=\frac{[u]}{T},
$$

and:

$$
[r u]
=\frac1T[u]
=\frac{[u]}{T}.
$$

All three terms now agree.

</details>

<details open>
<summary><strong>Nondimensionalise The Heat Equation</strong></summary>

Consider:

$$
u_t=\kappa u_{xx}
$$

on a spatial interval with characteristic length $L$. Let $U_0$ be a typical
size of $u$.

Define dimensionless variables:

$$
X=\frac{x}{L},
\qquad
\tau=\frac{\kappa t}{L^2},
\qquad
U(X,\tau)=\frac{u(x,t)}{U_0}.
$$

Equivalently:

$$
x=LX,
\qquad
t=\frac{L^2}{\kappa}\tau,
\qquad
u=U_0U.
$$

The time scale:

$$
t_c=\frac{L^2}{\kappa}
$$

is the diffusion time across distance $L$.

</details>

<details open>
<summary><strong>Transform The Heat Derivatives One At A Time</strong></summary>

Since:

$$
\tau=\frac{\kappa t}{L^2},
$$

we have:

$$
\frac{\partial\tau}{\partial t}
=\frac{\kappa}{L^2}.
$$

Differentiate $u=U_0U(X,\tau)$ with respect to $t$. The coordinate $X=x/L$
does not depend on $t$, so:

$$
\begin{aligned}
u_t
&=U_0U_\tau\frac{\partial\tau}{\partial t}\\
&=U_0\frac{\kappa}{L^2}U_\tau.
\end{aligned}
$$

For the spatial derivative:

$$
\frac{\partial X}{\partial x}=\frac1L.
$$

Therefore:

$$
\begin{aligned}
u_x
&=U_0U_X\frac{\partial X}{\partial x}\\
&=\frac{U_0}{L}U_X.
\end{aligned}
$$

Differentiate once more with respect to $x$:

$$
\begin{aligned}
u_{xx}
&=\frac{U_0}{L}(U_X)_x\\
&=\frac{U_0}{L}U_{XX}\frac{\partial X}{\partial x}\\
&=\frac{U_0}{L^2}U_{XX}.
\end{aligned}
$$

</details>

<details open>
<summary><strong>Cancel The Dimensional Scales</strong></summary>

Substitute:

$$
u_t=U_0\frac{\kappa}{L^2}U_\tau
$$

and:

$$
u_{xx}=\frac{U_0}{L^2}U_{XX}
$$

Substitute these transformed derivatives into $u_t=\kappa u_{xx}$:

$$
U_0\frac{\kappa}{L^2}U_\tau
=\kappa\left(\frac{U_0}{L^2}U_{XX}\right).
$$

The common factor is:

$$
\frac{\kappa U_0}{L^2}.
$$

Divide both sides by this nonzero factor:

$$
\boxed{
U_\tau=U_{XX}
}.
$$

The dimensionless heat equation contains no material parameter. The diffusivity
has been absorbed into the time scale.

</details>

<details open>
<summary><strong>Advection Versus Diffusion</strong></summary>

Consider:

$$
u_t+v u_x=D u_{xx},
$$

where $v$ is a constant transport speed and $D$ is a diffusivity.

Use the transport time $L/v$:

$$
X=\frac{x}{L},
\qquad
\tau=\frac{vt}{L},
\qquad
u=U_0U.
$$

The derivatives become:

$$
u_t=\frac{U_0v}{L}U_\tau,
\qquad
u_x=\frac{U_0}{L}U_X,
\qquad
u_{xx}=\frac{U_0}{L^2}U_{XX}.
$$

Substitute these derivatives into
$u_t+v u_x=D u_{xx}$:

$$
\frac{U_0v}{L}U_\tau
+v\frac{U_0}{L}U_X
=D\frac{U_0}{L^2}U_{XX}.
$$

Divide by $U_0v/L$:

$$
U_\tau+U_X
=\frac{D}{vL}U_{XX}.
$$

Define the Peclet number:

$$
\boxed{
\operatorname{Pe}=\frac{vL}{D}
}.
$$

Since $D/(vL)=1/\operatorname{Pe}$, the dimensionless equation is:

$$
\boxed{
U_\tau+U_X
=\frac1{\operatorname{Pe}}U_{XX}
}.
$$

A large Peclet number means transport by advection is strong relative to
diffusion on the chosen length scale.

</details>

<details open>
<summary><strong>Check That The Peclet Number Is Dimensionless</strong></summary>

Use:

$$
[v]=\frac{L}{T},
\qquad
[L]=L,
\qquad
[D]=\frac{L^2}{T}.
$$

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

</details>

<details open>
<summary><strong>Block 8 Summary</strong></summary>

Dimensional consistency checks whether terms can legitimately be added.
Nondimensionalisation goes further: it chooses natural scales, transforms each
derivative, and exposes the parameter combinations that control the behaviour.

</details>

---

## Block 9: A Reliable Classification And Transformation Workflow

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal is to collect the chapter into a sequence that can be applied without
guessing which formula comes next.

</details>

<details open>
<summary><strong>The Full Workflow</strong></summary>

**Step 1: Isolate the principal part.** Write it in the convention:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

**Step 2: Read $A$, $B$, and $C$.** If the visible mixed coefficient is $q$,
solve $2B=q$ before continuing.

**Step 3: Calculate the discriminant.**

$$
\Delta=B^2-AC.
$$

**Step 4: Classify by region.** Variable coefficients may make the sign of
$\Delta$ depend on $(x,y)$.

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

</details>

<details open>
<summary><strong>Common Mistake: Using The Visible Mixed Coefficient As B</strong></summary>

For:

$$
u_{xx}+6u_{xy}+5u_{yy}=0,
$$

the convention is:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

Therefore:

$$
A=1,
\qquad
2B=6,
\qquad
C=5,
$$

Solving $2B=6$ gives:

$$
B=3.
$$

The correct discriminant is:

$$
\Delta=3^2-(1)(5)=4.
$$

Using $B=6$ would produce the wrong discriminant and the wrong characteristic
slopes.

</details>

<details open>
<summary><strong>Common Mistake: Calling A Slope A Coordinate</strong></summary>

Suppose the slope equation gives:

$$
\frac{dy}{dx}=2.
$$

The number $2$ is a direction, not a coordinate. Integrate:

$$
y=2x+k.
$$

Then rearrange:

$$
y-2x=k.
$$

The coordinate that stays constant along this family is:

$$
\xi=y-2x.
$$

</details>

<details open>
<summary><strong>Common Mistake: Skipping The Jacobian</strong></summary>

Consider:

$$
\xi=x+y,
\qquad
\eta=2x+2y.
$$

Although two formulas are written, the second is only twice the first:

$$
\eta=2\xi.
$$

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

</details>

<details open>
<summary><strong>Common Mistake: Dropping Lower-Order Chain-Rule Terms</strong></summary>

For nonlinear $\xi(x,y)$:

$$
u_{xx}
=U_{\xi\xi}\xi_x^2+\cdots+U_\xi\xi_{xx}+\cdots.
$$

The term $U_\xi\xi_{xx}$ vanishes only when $\xi_{xx}=0$. A characteristic
choice removes a selected principal coefficient; it does not make every second
derivative of the coordinate functions zero.

</details>

<details open>
<summary><strong>Common Mistake: Treating Canonical Form As The Final Answer</strong></summary>

Reducing a PDE to:

$$
U_{\xi\eta}=0
$$

is an important structural step. If the question asks for a solution, continue
to:

$$
U(\xi,\eta)=F(\xi)+G(\eta)
$$

and then return to $x,y$.

If the original problem includes boundary data, rewrite those curves and data
in the new coordinates as well.

</details>

<details open>
<summary><strong>Block 9 Summary</strong></summary>

The dependable chain is:

> principal part $\longrightarrow$ coefficients $\longrightarrow$
> discriminant $\longrightarrow$ characteristic directions
> $\longrightarrow$ characteristic curves $\longrightarrow$ Jacobian
> $\longrightarrow$ transformed PDE $\longrightarrow$ transformed data.

Each arrow represents a calculation that should be shown rather than implied.

</details>

---

## Block 10: Original Practice Set

<details open>
<summary><strong>Problems 1 To 4: Classification And Characteristics</strong></summary>

### Problem 1: Read The Principal Coefficients

Classify:

$$
4u_{xx}-12u_{xy}+5u_{yy}+7u_x-u=0.
$$

### Problem 2: Classify By Region

Classify:

$$
(x-1)u_{xx}+u_{yy}=0
$$

in the regions $x<1$, $x=1$, and $x>1$.

### Problem 3: Find Two Characteristic Slopes

Find the characteristic slopes of:

$$
u_{xx}-u_{xy}-2u_{yy}=0.
$$

### Problem 4: Build Characteristic Coordinates

For the equation in Problem 3, integrate both characteristic directions,
choose $\xi$ and $\eta$, and verify that the Jacobian is nonzero.

</details>

<details open>
<summary><strong>Problems 5 To 8: Canonical Forms</strong></summary>

### Problem 5: Solve A Hyperbolic Equation

Reduce and solve:

$$
u_{xx}+3u_{xy}+2u_{yy}=0.
$$

### Problem 6: Solve A Parabolic Equation

Reduce and solve:

$$
4u_{xx}+4u_{xy}+u_{yy}=0.
$$

### Problem 7: Rotate An Elliptic Equation

Use:

$$
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}
$$

to remove the mixed derivative from:

$$
3u_{xx}+2u_{xy}+3u_{yy}=0.
$$

### Problem 8: Check A Proposed Transformation

Determine whether:

$$
\xi=x-2y,
\qquad
\eta=3x+y
$$

defines a valid coordinate change.

</details>

<details open>
<summary><strong>Problems 9 To 12: Dimensions And Scaling</strong></summary>

### Problem 9: Find A Coefficient Dimension

For:

$$
u_t=\alpha u_{xxxx},
$$

find the dimension of $\alpha$.

### Problem 10: Scale A Heat Equation

For:

$$
u_t=5u_{xx},
\qquad
0<x<4,
$$

choose dimensionless $X$ and $\tau$ that reduce the PDE to
$U_\tau=U_{XX}$.

### Problem 11: Calculate A Peclet Number

An advection-diffusion model has:

$$
v=0.4\ {\rm m\,s^{-1}},
\qquad
L=2\ {\rm m},
\qquad
D=0.08\ {\rm m^2\,s^{-1}}.
$$

Calculate $\operatorname{Pe}=vL/D$ and interpret its size.

### Problem 12: Check Dimensional Consistency

Suppose $[u]=\Theta$, $[x]=L$, and $[t]=T$. Determine the dimensions that
$a$ and $b$ need in:

$$
u_t=a u_{xx}+b u.
$$

</details>

<details open>
<summary><strong>Problems 13 And 14: Integration And Diagnosis</strong></summary>

### Problem 13: Integrate A Forced Canonical Equation

Find the general solution of:

$$
U_{\xi\eta}=e^\xi.
$$

### Problem 14: Diagnose A Failed Coordinate Pair

Explain precisely why:

$$
\xi=x+y,
\qquad
\eta=2x+2y
$$

cannot be used as two new coordinates.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 1 To 4</strong></summary>

### Answer 1

The equation is:

$$
4u_{xx}-12u_{xy}+5u_{yy}+7u_x-u=0.
$$

Match its principal part with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}.
$$

Therefore:

$$
A=4,
\qquad
2B=-12,
\qquad
C=5.
$$

Solve for $B$:

$$
B=-6.
$$

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

Since $\Delta>0$:

$$
\boxed{\text{the equation is hyperbolic}.}
$$

The terms $7u_x$ and $-u$ are lower order and do not enter the discriminant.

### Answer 2

For:

$$
(x-1)u_{xx}+u_{yy}=0,
$$

the principal coefficients are:

$$
A=x-1,
\qquad
B=0,
\qquad
C=1.
$$

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

### Answer 3

For:

$$
u_{xx}-u_{xy}-2u_{yy}=0,
$$

Compare $u_{xx}-u_{xy}-2u_{yy}=0$ with:

$$
A u_{xx}+2B u_{xy}+C u_{yy}=0.
$$

This gives:

$$
A=1,
\qquad
2B=-1,
\qquad
C=-2,
$$

so:

$$
B=-\frac12.
$$

The characteristic slope equation is:

$$
A m^2-2Bm+C=0.
$$

Substitute $A=1$, $B=-1/2$, and $C=-2$:

$$
m^2-2\left(-\frac12\right)m-2=0.
$$

Simplify the middle coefficient:

$$
m^2+m-2=0.
$$

Factor:

$$
(m-1)(m+2)=0.
$$

The characteristic slopes are therefore:

$$
\boxed{
m_1=1,
\qquad
m_2=-2
}.
$$

### Answer 4

The two slopes from Problem 3 are:

$$
\frac{dy}{dx}=1
$$

and:

$$
\frac{dy}{dx}=-2.
$$

Integrate the first direction:

$$
y=x+k_1.
$$

Rearrange $y=x+k_1$ to isolate the characteristic constant:

$$
y-x=k_1.
$$

Choose:

$$
\xi=y-x.
$$

Integrate the second direction:

$$
y=-2x+k_2.
$$

Rearrange $y=-2x+k_2$:

$$
2x+y=k_2.
$$

Choose:

$$
\eta=2x+y.
$$

The coordinate derivatives are:

$$
\begin{aligned}
\xi_x&=-1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=1.
\end{aligned}
$$

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

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 5 To 8</strong></summary>

### Answer 5

Start from:

$$
u_{xx}+3u_{xy}+2u_{yy}=0.
$$

The principal coefficients in the $2B$ convention are:

$$
A=1,
\qquad
B=\frac32,
\qquad
C=2.
$$

The characteristic equation is:

$$
A m^2-2Bm+C=0.
$$

Substitute the coefficients:

$$
m^2-3m+2=0.
$$

Factor:

$$
(m-1)(m-2)=0.
$$

Thus the slopes are:

$$
m_1=1,
\qquad
m_2=2.
$$

Integrate the first slope:

$$
\frac{dy}{dx}=1
\quad\Longrightarrow\quad
y-x=k_1.
$$

Integrate the second slope:

$$
\frac{dy}{dx}=2
\quad\Longrightarrow\quad
y-2x=k_2.
$$

Choose:

$$
\xi=y-x,
\qquad
\eta=y-2x.
$$

The Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(1)-(1)(-2)\\
&=1.
\end{aligned}
$$

The transformation is valid. For a constant-coefficient hyperbolic equation,
these two characteristic coordinates reduce the PDE to a nonzero multiple of:

$$
U_{\xi\eta}=0.
$$

Integrate the canonical equation:

$$
U(\xi,\eta)=F(\xi)+G(\eta).
$$

Return to the original variables:

$$
\boxed{
u(x,y)=F(y-x)+G(y-2x)
}.
$$

To check the first component, let $u=F(y-x)$. Then:

$$
u_{xx}=F'',
\qquad
u_{xy}=-F'',
\qquad
u_{yy}=F'',
$$

so:

$$
u_{xx}+3u_{xy}+2u_{yy}
=F''-3F''+2F''
=0.
$$

For $u=G(y-2x)$:

$$
u_{xx}=4G'',
\qquad
u_{xy}=-2G'',
\qquad
u_{yy}=G'',
$$

and:

$$
u_{xx}+3u_{xy}+2u_{yy}
=4G''-6G''+2G''
=0.
$$

Linearity then verifies their sum.

### Answer 6

For:

$$
4u_{xx}+4u_{xy}+u_{yy}=0,
$$

the principal coefficients are:

$$
A=4,
\qquad
B=2,
\qquad
C=1.
$$

Calculate:

$$
\Delta=2^2-(4)(1)=0.
$$

For $4u_{xx}+4u_{xy}+u_{yy}=0$, $\Delta=0$, so the equation is
parabolic. Its slope equation is:

$$
4m^2-4m+1=0.
$$

Factor:

$$
(2m-1)^2=0.
$$

The repeated slope is:

$$
m=\frac12.
$$

Integrate:

$$
\frac{dy}{dx}=\frac12
\quad\Longrightarrow\quad
y=\frac{x}{2}+k.
$$

Multiply by $2$ and rearrange:

$$
2y-x=2k.
$$

Choose:

$$
\xi=2y-x.
$$

Choose the independent coordinate:

$$
\eta=y.
$$

For $\xi=2y-x$ and $\eta=y$, the Jacobian is:

$$
\begin{aligned}
J
&=\xi_x\eta_y-\xi_y\eta_x\\
&=(-1)(1)-(2)(0)\\
&=-1.
\end{aligned}
$$

Thus the transformation is valid. In these coordinates the operator
$4\partial_{xx}+4\partial_{xy}+\partial_{yy}$ becomes
$\partial_{\eta\eta}$, so:

$$
U_{\eta\eta}=0.
$$

Integrate twice with respect to $\eta$:

$$
U(\xi,\eta)=\eta F(\xi)+G(\xi).
$$

Return to $\xi=2y-x$ and $\eta=y$:

$$
\boxed{
u(x,y)=yF(2y-x)+G(2y-x)
}.
$$

### Answer 7

Use:

$$
\xi=\frac{x+y}{\sqrt2},
\qquad
\eta=\frac{-x+y}{\sqrt2}.
$$

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

Substitute these derivatives into the original principal expression:

$$
3u_{xx}+2u_{xy}+3u_{yy}.
$$

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

Therefore the canonical equation is:

$$
\boxed{
2U_{\xi\xi}+U_{\eta\eta}=0
},
$$

after division by $2$.

### Answer 8

For:

$$
\xi=x-2y,
\qquad
\eta=3x+y,
$$

the derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=-2,\\
\eta_x&=3,&\eta_y&=1.
\end{aligned}
$$

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

Since $J\ne0$:

$$
\boxed{\text{the coordinate change is valid}.}
$$

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 9 To 12</strong></summary>

### Answer 9

For:

$$
u_t=\alpha u_{xxxx},
$$

the time derivative has dimension:

$$
[u_t]=\frac{[u]}{T}.
$$

Four spatial derivatives give:

$$
[u_{xxxx}]=\frac{[u]}{L^4}.
$$

Match the dimensions of both sides:

$$
\frac{[u]}{T}
=[\alpha]\frac{[u]}{L^4}.
$$

Cancel $[u]$:

$$
\frac1T=\frac{[\alpha]}{L^4}.
$$

Multiply by $L^4$:

$$
\boxed{
[\alpha]=\frac{L^4}{T}
}.
$$

### Answer 10

The heat equation is:

$$
u_t=5u_{xx}
$$

on a length-$4$ interval. Thus:

$$
\kappa=5,
\qquad
L=4.
$$

Use the dimensionless space variable:

$$
X=\frac{x}{L}.
$$

Substitute $L=4$:

$$
\boxed{
X=\frac{x}{4}
}.
$$

Use the diffusion time variable:

$$
\tau=\frac{\kappa t}{L^2}.
$$

Insert $\kappa=5$ and $L=4$:

$$
\begin{aligned}
\tau
&=\frac{5t}{4^2}\\
&=\frac{5t}{16}.
\end{aligned}
$$

The numerical calculation therefore gives:

$$
\boxed{
\tau=\frac{5t}{16}
}.
$$

With $u=U_0U(X,\tau)$, the derivative factors are:

$$
u_t=U_0\frac5{16}U_\tau
$$

and:

$$
u_{xx}=U_0\frac1{16}U_{XX}.
$$

Substitute into $u_t=5u_{xx}$:

$$
U_0\frac5{16}U_\tau
=5\left(U_0\frac1{16}U_{XX}\right).
$$

Divide by $5U_0/16$:

$$
\boxed{
U_\tau=U_{XX}
}.
$$

### Answer 11

Use:

$$
\operatorname{Pe}=\frac{vL}{D}.
$$

Substitute:

$$
v=0.4\ {\rm m\,s^{-1}},
\qquad
L=2\ {\rm m},
\qquad
D=0.08\ {\rm m^2\,s^{-1}}.
$$

Then:

$$
\begin{aligned}
\operatorname{Pe}
&=\frac{(0.4)(2)}{0.08}\\
&=\frac{0.8}{0.08}\\
&=10.
\end{aligned}
$$

The Peclet-number calculation gives:

$$
\boxed{\operatorname{Pe}=10.}
$$

On this length scale, advection is stronger than diffusion, although diffusion
is not absent.

### Answer 12

For:

$$
u_t=a u_{xx}+b u,
$$

the left side has dimension:

$$
[u_t]=\frac{\Theta}{T}.
$$

Since:

$$
[u_{xx}]=\frac{\Theta}{L^2},
$$

the diffusion term must satisfy:

$$
[a]\frac{\Theta}{L^2}
=\frac{\Theta}{T}.
$$

Cancel $\Theta$ and solve for $[a]$:

$$
\boxed{
[a]=\frac{L^2}{T}
}.
$$

For the reaction term $bu$ in the same equation:

$$
[b]\Theta=\frac{\Theta}{T}.
$$

Cancel $\Theta$:

$$
\boxed{
[b]=\frac1T
}.
$$

Both terms on the right then have the same dimension as $u_t$.

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Worked Answers: Problems 13 And 14</strong></summary>

### Answer 13

Start from:

$$
U_{\xi\eta}=e^\xi.
$$

Regard $U_{\xi\eta}$ as the $\eta$-derivative of $U_\xi$:

$$
\frac{\partial}{\partial\eta}(U_\xi)=e^\xi.
$$

Integrate both sides with respect to $\eta$. Since $e^\xi$ is constant with
respect to $\eta$:

$$
U_\xi=\eta e^\xi+F(\xi).
$$

The integration function is $F(\xi)$ because differentiating it with respect
to $\eta$ gives zero.

Now integrate with respect to $\xi$:

$$
U(\xi,\eta)
=\int\left[\eta e^\xi+F(\xi)\right]d\xi.
$$

Integrate each term:

$$
U(\xi,\eta)
=\eta e^\xi+G(\xi)+H(\eta),
$$

where:

$$
G'(\xi)=F(\xi)
$$

and $H(\eta)$ is the arbitrary function introduced by the second integration.

Integrating $U_{\xi\eta}=e^\xi$ twice therefore gives:

$$
\boxed{
U(\xi,\eta)=\eta e^\xi+G(\xi)+H(\eta)
}.
$$

Verify by differentiating with respect to $\xi$:

$$
U_\xi=\eta e^\xi+G'(\xi).
$$

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

### Answer 14

The proposed coordinates are:

$$
\xi=x+y,
\qquad
\eta=2x+2y.
$$

First observe:

$$
\eta=2(x+y).
$$

Since $\xi=x+y$, this means:

$$
\eta=2\xi.
$$

The two coordinates are therefore not independent.

For $\xi=x+y$ and $\eta=2x+2y$, the Jacobian confirms the problem.
The derivatives are:

$$
\begin{aligned}
\xi_x&=1,&\xi_y&=1,\\
\eta_x&=2,&\eta_y&=2.
\end{aligned}
$$

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

</details>

<!-- print-page-break -->

<details open>
<summary><strong>Chapter 32 Final Summary</strong></summary>

For a second-order PDE with principal part:

$$
A u_{xx}+2B u_{xy}+C u_{yy},
$$

the discriminant is:

$$
\Delta=B^2-AC.
$$

Its sign gives:

$$
\begin{array}{c|c}
\Delta>0&\text{hyperbolic}\\
\Delta=0&\text{parabolic}\\
\Delta<0&\text{elliptic}
\end{array}
$$

A characteristic level curve $\phi(x,y)=\text{constant}$ satisfies:

$$
A\phi_x^2+2B\phi_x\phi_y+C\phi_y^2=0.
$$

For a nonvertical curve with $m=dy/dx$, this becomes:

$$
A m^2-2Bm+C=0.
$$

Hyperbolic equations have two real characteristic directions, parabolic
equations have one repeated real direction, and elliptic equations have no
real characteristic direction.

A coordinate change:

$$
\xi=\xi(x,y),
\qquad
\eta=\eta(x,y)
$$

Its Jacobian must satisfy:

$$
J=\xi_x\eta_y-\xi_y\eta_x\ne0.
$$

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

Dimensional analysis requires every additive term to have the same dimension.
For the heat and wave equations:

$$
[\kappa]=\frac{L^2}{T},
\qquad
[c]=\frac{L}{T}.
$$

Nondimensionalisation transforms both the variables and the derivatives. It can
remove dimensional constants or combine them into dimensionless groups such
as:

$$
\operatorname{Pe}=\frac{vL}{D}.
$$

> classify the principal part, integrate characteristic directions into
> coordinate functions, check the Jacobian, transform every required
> derivative, preserve lower-order terms, and verify the resulting equation.

</details>
