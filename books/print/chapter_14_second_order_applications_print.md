```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 14}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Second-Order Applications}
```
# Chapter 14 - Second-Order Applications

The preceding chapters developed methods for solving second-order linear
equations and selecting solutions from initial data. This chapter turns those
methods into models of physical systems.

```{=latex}
\Needspace{10\baselineskip}
```
The main mathematical form is:

$$
M u''+C u'+K u=F(t).
$$

The interpretation of the symbols changes with the application:

-   for a spring, $u$ is displacement
-   for a circuit, $u$ may be charge
-   for a floating body, $u$ is vertical displacement from equilibrium

The equation should not be memorized as a string of symbols. Each term must be
connected to a physical law, a sign convention, and a unit.

The main questions are:

-   how does Newton's second law produce the spring equation?
-   why does gravity disappear when displacement is measured from equilibrium?
-   what distinguishes undamped, underdamped, critically damped, and overdamped
    motion?
-   how are circular frequency, ordinary frequency, period, amplitude, and phase
    related?
-   what is the difference between transient and steady-state response?
-   why does matching a natural frequency create resonance in an ideal undamped
    system?
-   how does an RLC circuit produce the same differential-equation structure?
-   how does Archimedes' principle create a buoyant restoring force?

All examples, equations, and exercises in this chapter are independently
constructed. The reference text is used only to identify the mathematical
topics.

```{=latex}
\Needspace{20\baselineskip}
```
## From Physical Laws To A Differential Equation {#block-1-from-physical-laws-to-a-differential-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to construct the mass-spring equation from forces rather than quote
it. Every sign will be tied to one declared positive direction.

```{=latex}
\Needspace{12\baselineskip}
```
### Choose The Coordinate Before Writing Forces {#choose-the-coordinate-before-writing-forces-2}

Let $x(t)$ be the displacement of a mass from its **equilibrium position**.
Choose downward displacement as positive.

Then:

-   $x>0$ means the mass is below equilibrium
-   $x<0$ means the mass is above equilibrium
-   $x'>0$ means the mass is moving downward
-   $x'<0$ means the mass is moving upward

This choice is not the only valid convention. Upward could be positive instead.
What matters is using one convention consistently in the force equation and
the initial data.

```{=latex}
\Needspace{12\baselineskip}
```
### The Spring Restoring Force {#the-spring-restoring-force-3}

```{=latex}
\Needspace{10\baselineskip}
```
Hooke's law says that the magnitude of the spring force is proportional to
displacement from equilibrium:

$$
|F_s|=k|x|,
$$

where $k>0$ is the spring constant.

The spring force points back toward equilibrium. With downward positive:

-   if $x>0$, the force points upward and is negative
-   if $x<0$, the force points downward and is positive

```{=latex}
\Needspace{10\baselineskip}
```
Both cases are represented by:

$$
\boxed{F_s=-kx}.
$$

The minus sign expresses direction, not a negative spring constant.

```{=latex}
\Needspace{12\baselineskip}
```
### The Damping Force {#the-damping-force-4}

For linear viscous damping, the resistive force is proportional to velocity
and points opposite the motion.

```{=latex}
\Needspace{10\baselineskip}
```
If $c\ge 0$ is the damping coefficient, then:

$$
\boxed{F_d=-cx'}.
$$

When $x'>0$, the mass moves downward and the damping force is upward. When
$x'<0$, the mass moves upward and the damping force is downward. The same
formula handles both cases.

```{=latex}
\Needspace{12\baselineskip}
```
### Newton's Second Law {#newtons-second-law-5}

```{=latex}
\Needspace{10\baselineskip}
```
Let $F(t)$ be an externally applied force, measured positive downward. The
three forces measured from equilibrium are:

$$
F_s=-kx,
\qquad
F_d=-cx',
\qquad
F_{\mathrm{ext}}=F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Newton's second law is:

$$
\text{mass}\times\text{acceleration}=\text{sum of forces}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
mx''=-kx-cx'+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $cx'$ and $kx$ to both sides:

$$
\boxed{mx''+cx'+kx=F(t)}.
$$

Each term has the units of force:

-   $mx''$ is the inertial term
-   $cx'$ is the damping term
-   $kx$ is the restoring term
-   $F(t)$ is the applied forcing

```{=latex}
\Needspace{12\baselineskip}
```
### Where Did Gravity Go? {#where-did-gravity-go-6}

Gravity has not been ignored. It is cancelled by the spring's static extension
when displacement is measured from equilibrium.

```{=latex}
\Needspace{10\baselineskip}
```
Let $z(t)$ be the total downward extension from the spring's natural length.
Ignoring damping briefly, Newton's law is:

$$
mz''=mg-kz+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Let $\ell$ be the static extension produced by the mass. At equilibrium,
acceleration is zero and no external force is present, so:

$$
mg-k\ell=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{k\ell=mg}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now measure displacement $x$ from equilibrium:

$$
z=\ell+x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $\ell$ is constant:

$$
z'=x',
\qquad
z''=x''.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $z=\ell+x$ into the natural-length equation:

$$
mx''=mg-k(\ell+x)+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the spring term:

$$
mx''=mg-k\ell-kx+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $k\ell=mg$:

$$
mx''=mg-mg-kx+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The gravity and static-spring terms cancel:

$$
mx''=-kx+F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Including damping restores the full model:

$$
mx''+cx'+kx=F(t).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Mass, Weight, And Units {#mass-weight-and-units-7}

In SI units:

-   mass is measured in kilograms
-   force is measured in newtons
-   displacement is measured in metres
-   $k$ is measured in newtons per metre
-   $c$ is measured in newton-seconds per metre

```{=latex}
\Needspace{10\baselineskip}
```
If a problem gives a mass $m$ and a static extension $\ell$, then:

$$
k=\frac{mg}{\ell}.
$$

Weight is the force $mg$, not the mass $m$.

```{=latex}
\Needspace{10\baselineskip}
```
In imperial units, a weight in pounds-force must be converted to mass in slugs:

$$
m=\frac{\text{weight}}{g}.
$$

Mixing weight and mass produces a dimensionally incorrect inertial term.

```{=latex}
\Needspace{12\baselineskip}
```
### A Small Static-Stretch Example {#a-small-static-stretch-example-8}

A $3$ kg mass stretches a vertical spring by $0.147$ m. Using
$g=9.8\text{ m/s}^2$, find $k$.

```{=latex}
\Needspace{10\baselineskip}
```
At static equilibrium:

$$
k\ell=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $k$:

$$
k=\frac{mg}{\ell}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $m=3$, $g=9.8$, and $\ell=0.147$:

$$
\begin{aligned}
k
&=\frac{3(9.8)}{0.147} \\
&=\frac{29.4}{0.147} \\
&=200.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{k=200\text{ N/m}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-9}

```{=latex}
\Needspace{10\baselineskip}
```
With displacement measured from equilibrium and downward chosen positive:

$$
F_s=-kx,
\qquad
F_d=-cx'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Newton's second law gives:

$$
\boxed{mx''+cx'+kx=F(t)}.
$$

Gravity is absent from this equilibrium-coordinate equation because the static
balance $k\ell=mg$ has already accounted for it.

```{=latex}
\Needspace{20\baselineskip}
```
## Free Undamped Motion And Harmonic Quantities {#block-2-free-undamped-motion-and-harmonic-quantities}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-10}

The goal is to solve the free undamped spring and interpret every constant in
the resulting harmonic motion.

```{=latex}
\Needspace{12\baselineskip}
```
### The Free Undamped Equation {#the-free-undamped-equation-11}

```{=latex}
\Needspace{10\baselineskip}
```
Free motion means no external force:

$$
F(t)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Undamped motion means:

$$
c=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The spring equation becomes:

$$
mx''+kx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $m>0$:

$$
x''+\frac{k}{m}x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the natural circular frequency:

$$
\boxed{\omega_0=\sqrt{\frac{k}{m}}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x''+\omega_0^2x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The general solution is:

$$
\boxed{x(t)=A\cos(\omega_0t)+B\sin(\omega_0t)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Circular Frequency, Frequency, And Period {#circular-frequency-frequency-and-period-12}

```{=latex}
\Needspace{10\baselineskip}
```
The circular frequency $\omega_0$ is measured in radians per unit time. The
ordinary frequency $f$ counts cycles per unit time:

$$
\boxed{f=\frac{\omega_0}{2\pi}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period $T$ is the time for one complete cycle:

$$
\boxed{T=\frac{1}{f}=\frac{2\pi}{\omega_0}}.
$$

These are different quantities. A circular frequency of $5$ rad/s is not a
frequency of $5$ cycles/s.

```{=latex}
\Needspace{12\baselineskip}
```
### Amplitude And Phase {#amplitude-and-phase-13}

```{=latex}
\Needspace{10\baselineskip}
```
The combination:

$$
A\cos(\omega t)+B\sin(\omega t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
can be written as one shifted cosine:

$$
\boxed{R\cos(\omega t-\delta)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the shifted cosine:

$$
\begin{aligned}
R\cos(\omega t-\delta)
&=R\cos(\omega t)\cos\delta
+R\sin(\omega t)\sin\delta.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Compare coefficients with $A\cos(\omega t)+B\sin(\omega t)$:

$$
A=R\cos\delta,
\qquad
B=R\sin\delta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Square and add:

$$
A^2+B^2=R^2(\cos^2\delta+\sin^2\delta).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\cos^2\delta+\sin^2\delta=1$:

$$
\boxed{R=\sqrt{A^2+B^2}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The phase should be chosen from both coefficient signs:

$$
\cos\delta=\frac{A}{R},
\qquad
\sin\delta=\frac{B}{R}.
$$

Using a two-argument inverse tangent, often written $\operatorname{atan2}(B,A)$,
places $\delta$ in the correct quadrant.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Free Undamped Example {#a-complete-free-undamped-example-14}

A $2$ kg mass is attached to a spring with $k=50$ N/m. There is no damping or
external force. Downward is positive. The mass begins $0.08$ m below
equilibrium with an upward velocity of $0.30$ m/s.

Find the motion, amplitude, circular frequency, ordinary frequency, and period.

#### Step 1: Translate the physical data

```{=latex}
\Needspace{10\baselineskip}
```
The parameters are:

$$
m=2,
\qquad
k=50,
\qquad
c=0,
\qquad
F(t)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial displacement is downward and therefore positive:

$$
x(0)=0.08.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial velocity is upward and therefore negative:

$$
x'(0)=-0.30.
$$

#### Step 2: Construct and normalize the equation

```{=latex}
\Needspace{10\baselineskip}
```
Use $mx''+kx=0$:

$$
2x''+50x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
x''+25x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\omega_0^2=25,
\qquad
\omega_0=5\text{ rad/s}.
$$

#### Step 3: Write the general motion

```{=latex}
\Needspace{10\baselineskip}
```
The solution of $x''+25x=0$ is:

$$
x=A\cos(5t)+B\sin(5t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x'=-5A\sin(5t)+5B\cos(5t).
$$

#### Step 4: Apply the displacement condition

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$ into the motion:

$$
0.08=A\cos(0)+B\sin(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A=0.08.
$$

#### Step 5: Apply the velocity condition

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$ into the velocity:

$$
-0.30=-5A\sin(0)+5B\cos(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
-0.30=5B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5$:

$$
B=-0.06.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is:

$$
\boxed{x(t)=0.08\cos(5t)-0.06\sin(5t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Find the amplitude

```{=latex}
\Needspace{10\baselineskip}
```
Use $R=\sqrt{A^2+B^2}$:

$$
\begin{aligned}
R
&=\sqrt{(0.08)^2+(-0.06)^2} \\
&=\sqrt{0.0064+0.0036} \\
&=\sqrt{0.01} \\
&=0.10.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the amplitude is:

$$
\boxed{R=0.10\text{ m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the phase:

$$
\cos\delta=\frac{0.08}{0.10}=\frac45,
\qquad
\sin\delta=\frac{-0.06}{0.10}=-\frac35.
$$

```{=latex}
\Needspace{10\baselineskip}
```
One suitable phase is:

$$
\delta=-\arctan\left(\frac34\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence an equivalent form is:

$$
\boxed{
x(t)=0.10\cos\left(5t+\arctan\frac34\right)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Find frequency and period

```{=latex}
\Needspace{10\baselineskip}
```
The ordinary frequency is:

$$
\boxed{f=\frac{5}{2\pi}\text{ Hz}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period is:

$$
\boxed{T=\frac{2\pi}{5}\text{ s}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-15}

```{=latex}
\Needspace{10\baselineskip}
```
For free undamped motion:

$$
x''+\omega_0^2x=0,
\qquad
\omega_0=\sqrt{\frac{k}{m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is harmonic:

$$
x=A\cos(\omega_0t)+B\sin(\omega_0t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its amplitude, frequency, and period are:

$$
R=\sqrt{A^2+B^2},
\qquad
f=\frac{\omega_0}{2\pi},
\qquad
T=\frac{2\pi}{\omega_0}.
$$

```{=latex}
\Needspace{20\baselineskip}
```
## Damping And The Three Free-Motion Regimes {#block-3-damping-and-the-three-free-motion-regimes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-16}

The goal is to classify free damped motion directly from the characteristic
discriminant and connect each root pattern to its physical behavior.

```{=latex}
\Needspace{12\baselineskip}
```
### The Free Damped Equation {#the-free-damped-equation-17}

```{=latex}
\Needspace{10\baselineskip}
```
For free motion, $F(t)=0$. With damping $c>0$:

$$
mx''+cx'+kx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
mr^2+cr+k=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The quadratic formula gives:

$$
r=\frac{-c\pm\sqrt{c^2-4mk}}{2m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the discriminant:

$$
\boxed{\Delta=c^2-4mk}.
$$

The sign of $\Delta$ determines the type of free damped motion.

```{=latex}
\Needspace{12\baselineskip}
```
### Overdamped Motion {#overdamped-motion-18}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
\Delta>0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the roots are real and distinct. The motion has the form:

$$
x=c_1e^{r_1t}+c_2e^{r_2t}.
$$

Both roots are negative when $m,c,k>0$. The motion returns toward equilibrium
without sustained oscillation.

The physical interpretation is that resistance is stronger than the critical
amount needed to suppress oscillation.

```{=latex}
\Needspace{12\baselineskip}
```
### Critically Damped Motion {#critically-damped-motion-19}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
\Delta=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the repeated root is:

$$
r=-\frac{c}{2m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is:

$$
x=(c_1+c_2t)e^{-ct/(2m)}.
$$

Critical damping is the boundary between oscillatory and nonoscillatory
return. It produces the fastest idealized return to equilibrium without
oscillation.

```{=latex}
\Needspace{10\baselineskip}
```
The critical damping coefficient is found from $c^2=4mk$:

$$
\boxed{c_{\mathrm{crit}}=2\sqrt{mk}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Underdamped Motion {#underdamped-motion-20}

```{=latex}
\Needspace{10\baselineskip}
```
If:

$$
\Delta<0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the roots are complex:

$$
r=-\frac{c}{2m}\pm i\omega_d,
$$

```{=latex}
\Needspace{10\baselineskip}
```
where the damped circular frequency is:

$$
\boxed{
\omega_d=\frac{\sqrt{4mk-c^2}}{2m}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is:

$$
x=e^{-ct/(2m)}
[c_1\cos(\omega_dt)+c_2\sin(\omega_dt)].
$$

The sine and cosine produce oscillation. The exponential envelope shrinks the
amplitude toward zero.

```{=latex}
\Needspace{12\baselineskip}
```
### A Three-Case Comparison {#a-three-case-comparison-21}

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
m=1,
\qquad
k=9.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
c_{\mathrm{crit}}=2\sqrt{(1)(9)}=6.
$$

#### Case 1: $c=2$

```{=latex}
\Needspace{10\baselineskip}
```
The discriminant is:

$$
\Delta=2^2-4(1)(9)=4-36=-32<0.
$$

The system is underdamped.

#### Case 2: $c=6$

```{=latex}
\Needspace{10\baselineskip}
```
The discriminant is:

$$
\Delta=6^2-36=0.
$$

The system is critically damped.

#### Case 3: $c=8$

```{=latex}
\Needspace{10\baselineskip}
```
The discriminant is:

$$
\Delta=8^2-36=28>0.
$$

The system is overdamped.

The mass and spring are unchanged. Only the damping coefficient changes the
qualitative motion.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Underdamped Example {#a-complete-underdamped-example-22}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
x''+2x'+9x=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
x(0)=1,
\qquad
x'(0)=0.
$$

#### Step 1: Classify the roots

```{=latex}
\Needspace{10\baselineskip}
```
Here $m=1,c=2,k=9$. The discriminant is:

$$
\Delta=2^2-4(1)(9)=-32<0.
$$

Therefore the motion is underdamped.

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic roots are:

$$
\begin{aligned}
r
&=\frac{-2\pm\sqrt{-32}}{2} \\
&=-1\pm2\sqrt2\,i.
\end{aligned}
$$

#### Step 2: Write the general motion

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
\beta=2\sqrt2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x=e^{-t}[c_1\cos(\beta t)+c_2\sin(\beta t)].
$$

#### Step 3: Apply $x(0)=1$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$:

$$
1=e^0[c_1\cos0+c_2\sin0].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=1.
$$

#### Step 4: Differentiate before applying the velocity

```{=latex}
\Needspace{10\baselineskip}
```
Write:

$$
f(t)=c_1\cos(\beta t)+c_2\sin(\beta t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x=e^{-t}f(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with the product rule:

$$
x'=e^{-t}[f'(t)-f(t)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
Also:

$$
f'(t)=-\beta c_1\sin(\beta t)+\beta c_2\cos(\beta t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
f(0)=c_1,
\qquad
f'(0)=\beta c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x'(0)=\beta c_2-c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x'(0)=0$ and $c_1=1$:

$$
0=\beta c_2-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $1$:

$$
\beta c_2=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $\beta=2\sqrt2$:

$$
c_2=\frac{1}{2\sqrt2}.
$$

#### Step 5: Write and interpret the motion

$$
\boxed{
x(t)=e^{-t}
\left[
\cos(2\sqrt2\,t)
+\frac{1}{2\sqrt2}\sin(2\sqrt2\,t)
\right]
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The oscillatory bracket remains bounded, while $e^{-t}\to0$. Therefore:

$$
x(t)\to0
\qquad\text{as}\qquad
t\to\infty.
$$

The free damped response is transient.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-23}

```{=latex}
\Needspace{10\baselineskip}
```
For free damped motion:

$$
mx''+cx'+kx=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the discriminant:

$$
\Delta=c^2-4mk
$$

classifies the response:

-   $\Delta>0$: overdamped
-   $\Delta=0$: critically damped
-   $\Delta<0$: underdamped

For positive $m,c,k$, every free damped solution tends to equilibrium.

```{=latex}
\Needspace{20\baselineskip}
```
## Forced Motion, Steady State, And Resonance {#block-4-forced-motion-steady-state-and-resonance}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-24}

The goal is to separate a forced response into transient and steady-state
parts and understand why ideal resonance produces an unbounded amplitude.

```{=latex}
\Needspace{12\baselineskip}
```
### Free Versus Forced Response {#free-versus-forced-response-25}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
mx''+cx'+kx=F(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
the complete solution is:

$$
x=x_h+x_p.
$$

The homogeneous part $x_h$ is the system's free response. For a damped system,
it normally contains decaying exponentials and is called the **transient**
part.

The particular part $x_p$ is generated by the continuing external input. For a
bounded sinusoidal input in a damped system, it normally becomes the
**steady-state** part.

```{=latex}
\Needspace{10\baselineskip}
```
The names describe long-term behavior:

$$
x_{\mathrm{tr}}(t)\to0,
\qquad
x_{\mathrm{ss}}(t)\not\to0.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Damped Forced Example {#a-complete-damped-forced-example-26}

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
x''+2x'+5x=10\cos(2t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
x(0)=0,
\qquad
x'(0)=0.
$$

#### Step 1: Solve the homogeneous equation

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+2r+5=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are:

$$
r=-1\pm2i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x_h=e^{-t}[c_1\cos(2t)+c_2\sin(2t)].
$$

#### Step 2: Build the sinusoidal trial

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
x_p=A\cos(2t)+B\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x_p'=-2A\sin(2t)+2B\cos(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
x_p''=-4A\cos(2t)-4B\sin(2t).
$$

#### Step 3: Substitute and group cosine terms

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $x_p''+2x_p'+5x_p$:

$$
\begin{aligned}
&[-4A\cos(2t)-4B\sin(2t)] \\
&\quad +2[-2A\sin(2t)+2B\cos(2t)] \\
&\quad +5[A\cos(2t)+B\sin(2t)].
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The cosine coefficient is:

$$
-4A+4B+5A=A+4B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sine coefficient is:

$$
-4B-4A+5B=B-4A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x_p''+2x_p'+5x_p
=(A+4B)\cos(2t)+(B-4A)\sin(2t).
$$

#### Step 4: Match the forcing coefficients

```{=latex}
\Needspace{10\baselineskip}
```
The required forcing is:

$$
10\cos(2t)+0\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\begin{aligned}
A+4B&=10, \\
B-4A&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The second equation gives:

$$
B=4A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into the first equation:

$$
A+4(4A)=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
17A=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
A=\frac{10}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
B=4A=\frac{40}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
x_p=\frac{10}{17}\cos(2t)+\frac{40}{17}\sin(2t).
$$

#### Step 5: Write the complete solution

$$
x=e^{-t}[c_1\cos(2t)+c_2\sin(2t)]
+\frac{10}{17}\cos(2t)+\frac{40}{17}\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Apply $x(0)=0$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
0=c_1+\frac{10}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=-\frac{10}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Differentiate locally and apply $x'(0)=0$

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
f(t)=c_1\cos(2t)+c_2\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
x_h=e^{-t}f(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
x_h'=e^{-t}[f'(t)-f(t)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
f(0)=c_1,
\qquad
f'(0)=2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x_h'(0)=2c_2-c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the particular solution:

$$
x_p'=-\frac{20}{17}\sin(2t)+\frac{80}{17}\cos(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
x_p'(0)=\frac{80}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the complete velocity condition:

$$
0=2c_2-c_1+\frac{80}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $c_1=-10/17$:

$$
0=2c_2+\frac{10}{17}+\frac{80}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the fractions:

$$
0=2c_2+\frac{90}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $90/17$:

$$
2c_2=-\frac{90}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
c_2=-\frac{45}{17}.
$$

#### Step 8: Identify transient and steady-state parts

```{=latex}
\Needspace{10\baselineskip}
```
The selected motion is:

$$
\boxed{
x(t)=
-\frac{e^{-t}}{17}[10\cos(2t)+45\sin(2t)]
+\frac{10}{17}\cos(2t)+\frac{40}{17}\sin(2t)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The transient part is:

$$
x_{\mathrm{tr}}
=-\frac{e^{-t}}{17}[10\cos(2t)+45\sin(2t)].
$$

It tends to zero because of $e^{-t}$.

```{=latex}
\Needspace{10\baselineskip}
```
The steady-state part is:

$$
x_{\mathrm{ss}}
=\frac{10}{17}\cos(2t)+\frac{40}{17}\sin(2t).
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Steady-State Amplitude And Phase Lag {#steady-state-amplitude-and-phase-lag-27}

```{=latex}
\Needspace{10\baselineskip}
```
For the previous steady-state response:

$$
A=\frac{10}{17},
\qquad
B=\frac{40}{17}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The amplitude is:

$$
\begin{aligned}
R
&=\sqrt{A^2+B^2} \\
&=\sqrt{\frac{100+1600}{289}} \\
&=\frac{10\sqrt{17}}{17} \\
&=\frac{10}{\sqrt{17}}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because both coefficients are positive, choose:

$$
\delta=\arctan\left(\frac{B}{A}\right)=\arctan(4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
x_{\mathrm{ss}}(t)
=\frac{10}{\sqrt{17}}
\cos[2t-\arctan(4)]
}.
$$

The response oscillates at the forcing frequency, but its peak occurs later
than the peak of $10\cos(2t)$. This shift is the phase lag.

```{=latex}
\Needspace{12\baselineskip}
```
### Pure Resonance In An Undamped System {#pure-resonance-in-an-undamped-system-28}

```{=latex}
\Needspace{10\baselineskip}
```
Consider the zero-data IVP:

$$
x''+9x=6\cos(3t),
\qquad
x(0)=0,
\qquad
x'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The natural circular frequency is:

$$
\omega_0=3.
$$

The forcing also has circular frequency $3$. The usual trial
$A\cos(3t)+B\sin(3t)$ overlaps the homogeneous solution, so use a resonant
trial.

```{=latex}
\Needspace{10\baselineskip}
```
The operator identity needed here is:

$$
\left(\frac{d^2}{dt^2}+9\right)[t\sin(3t)]
=6\cos(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore one particular solution is:

$$
x_p=t\sin(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
It also satisfies the zero initial data:

$$
x_p(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x_p'=\sin(3t)+3t\cos(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
x_p'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The selected solution is therefore:

$$
\boxed{x(t)=t\sin(3t)}.
$$

The factor $t$ makes the oscillation envelope grow without bound. This is
**pure resonance** in the ideal undamped model.

Damping changes the model and prevents this unlimited linear growth for a
bounded sinusoidal input.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-29}

```{=latex}
\Needspace{10\baselineskip}
```
For a damped forced system:

$$
x=x_{\mathrm{tr}}+x_{\mathrm{ss}}.
$$

The transient part comes from the homogeneous equation and decays. The
steady-state part follows the continuing forcing.

In an ideal undamped system, forcing at the natural circular frequency creates
a resonant term with a growing factor such as $t$.

```{=latex}
\Needspace{20\baselineskip}
```
## Series RLC Circuits {#block-5-series-rlc-circuits}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-30}

The goal is to derive the charge equation for a series resistor-inductor-
capacitor circuit and connect its terms to the mass-spring model.

```{=latex}
\Needspace{12\baselineskip}
```
### Charge And Current {#charge-and-current-31}

Let:

-   $q(t)$ be charge on the capacitor, measured in coulombs
-   $I(t)$ be current, measured in amperes

```{=latex}
\Needspace{10\baselineskip}
```
Current is the time derivative of charge:

$$
\boxed{I=q'}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
I'=q''.
$$

The distinction matters. An initial charge condition specifies $q(0)$, while
an initial current condition specifies $q'(0)$.

```{=latex}
\Needspace{12\baselineskip}
```
### Voltage Drops Around The Loop {#voltage-drops-around-the-loop-32}

For a series RLC circuit:

-   the inductor voltage drop is $LI'$
-   the resistor voltage drop is $RI$
-   the capacitor voltage drop is $q/C$
-   the applied voltage is $E(t)$

```{=latex}
\Needspace{10\baselineskip}
```
Kirchhoff's voltage law gives:

$$
LI'+RI+\frac{q}{C}=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $I=q'$ and $I'=q''$:

$$
\boxed{
Lq''+Rq'+\frac{1}{C}q=E(t)
}.
$$

Here:

-   $L$ is inductance in henries
-   $R$ is resistance in ohms
-   $C$ is capacitance in farads
-   $E(t)$ is applied voltage in volts

```{=latex}
\Needspace{12\baselineskip}
```
### The Mechanical-Electrical Analogy {#the-mechanical-electrical-analogy-33}

```{=latex}
\Needspace{10\baselineskip}
```
Compare:

$$
mx''+cx'+kx=F(t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
Lq''+Rq'+\frac1Cq=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding quantities are:

$$
\begin{array}{c|c}
\text{mechanical system}&\text{electrical system}\\
\hline
m&L\\
c&R\\
k&1/C\\
x&q\\
x'&I\\
F(t)&E(t)
\end{array}
$$

The analogy is structural. Mass and inductance do not have the same physical
units, but they occupy the same mathematical position in their equations.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Charge-And-Current Example {#a-complete-charge-and-current-example-34}

```{=latex}
\Needspace{10\baselineskip}
```
A series circuit has:

$$
L=1\text{ H},
\qquad
R=4\ \Omega,
\qquad
C=\frac15\text{ F},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and a constant applied voltage:

$$
E(t)=10\text{ V}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Initially:

$$
q(0)=0,
\qquad
I(0)=0.
$$

Find the charge and current.

#### Step 1: Construct the charge equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
Lq''+Rq'+\frac1Cq=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1/C=5$, substitution gives:

$$
q''+4q'+5q=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The current condition becomes:

$$
q'(0)=I(0)=0.
$$

#### Step 2: Solve the homogeneous equation

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+4r+5=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are:

$$
r=-2\pm i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
q_h=e^{-2t}[c_1\cos t+c_2\sin t].
$$

#### Step 3: Find a constant particular charge

```{=latex}
\Needspace{10\baselineskip}
```
Try:

$$
q_p=A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
q_p'=0,
\qquad
q_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $q''+4q'+5q=10$:

$$
5A=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5$:

$$
A=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
q_p=2.
$$

#### Step 4: Write the complete charge

$$
q=e^{-2t}[c_1\cos t+c_2\sin t]+2.
$$

#### Step 5: Apply $q(0)=0$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$:

$$
0=c_1+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_1=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Differentiate to obtain current

```{=latex}
\Needspace{10\baselineskip}
```
Let:

$$
f(t)=c_1\cos t+c_2\sin t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
q=e^{-2t}f(t)+2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
q'=e^{-2t}[f'(t)-2f(t)].
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
f(0)=c_1,
\qquad
f'(0)=c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
q'(0)=c_2-2c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $q'(0)=0$ and $c_1=-2$:

$$
0=c_2-2(-2).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=-4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The charge is:

$$
\boxed{
q(t)=2-e^{-2t}[2\cos t+4\sin t]
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Simplify the current

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the selected charge. Let:

$$
f(t)=-2\cos t-4\sin t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
q=2+e^{-2t}f(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate:

$$
f'(t)=2\sin t-4\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $q'=e^{-2t}[f'-2f]$:

$$
\begin{aligned}
I(t)=q'(t)
&=e^{-2t}
[2\sin t-4\cos t+4\cos t+8\sin t] \\
&=10e^{-2t}\sin t.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{I(t)=10e^{-2t}\sin t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
As $t\to\infty$:

$$
q(t)\to2,
\qquad
I(t)\to0.
$$

The capacitor approaches a steady charge while the current dies away.

```{=latex}
\Needspace{12\baselineskip}
```
### Writing An Equation Directly For Current {#writing-an-equation-directly-for-current-35}

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the charge equation:

$$
Lq''+Rq'+\frac1Cq=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $I=q'$ gives:

$$
\boxed{
LI''+RI'+\frac1CI=E'(t)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
An initial value for $I'$ is not usually given directly. It must be recovered
from the original loop equation:

$$
LI'(0)+RI(0)+\frac{q(0)}{C}=E(0).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $I'(0)$:

$$
\boxed{
I'(0)=\frac{E(0)-RI(0)-q(0)/C}{L}
}.
$$

Solving for charge first is often simpler because $q(0)$ and $I(0)=q'(0)$ are
already the natural initial conditions.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-36}

```{=latex}
\Needspace{10\baselineskip}
```
For a series RLC circuit:

$$
\boxed{
Lq''+Rq'+\frac1Cq=E(t)
},
\qquad
I=q'.
$$

Inductance corresponds mathematically to mass, resistance to damping, inverse
capacitance to spring stiffness, and applied voltage to external force.

```{=latex}
\Needspace{20\baselineskip}
```
## Buoyancy And Floating-Body Oscillations {#block-6-buoyancy-and-floating-body-oscillations}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-37}

The goal is to derive a restoring force from Archimedes' principle and show why
a slightly displaced floating body behaves like an undamped spring.

```{=latex}
\Needspace{12\baselineskip}
```
### Equilibrium Of A Vertical Cylinder {#equilibrium-of-a-vertical-cylinder-38}

Consider a vertical cylinder with:

-   mass $m$
-   constant horizontal cross-sectional area $A$
-   submerged equilibrium depth $h$
-   liquid mass density $\rho$

```{=latex}
\Needspace{10\baselineskip}
```
The cylinder's weight is:

$$
mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At equilibrium, the displaced liquid volume is:

$$
Ah.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The mass of displaced liquid is $\rho Ah$, so the upward buoyant force is:

$$
\rho gAh.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equilibrium requires upward buoyancy to equal downward weight:

$$
\rho gAh=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $g>0$:

$$
\rho Ah=m.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for the submerged depth:

$$
\boxed{h=\frac{m}{\rho A}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Buoyant Restoring Force {#the-buoyant-restoring-force-39}

Measure displacement $x(t)$ upward from equilibrium and choose upward as
positive.

```{=latex}
\Needspace{10\baselineskip}
```
If the cylinder moves upward by $x>0$, its submerged depth decreases from $h$
to:

$$
h-x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The new buoyant force is:

$$
F_b=\rho gA(h-x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The weight remains downward:

$$
F_g=-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Newton's second law gives:

$$
mx''=\rho gA(h-x)-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
mx''=\rho gAh-\rho gAx-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the equilibrium identity $\rho gAh=mg$:

$$
mx''=mg-\rho gAx-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium terms cancel:

$$
mx''=-\rho gAx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the restoring term to the left:

$$
\boxed{mx''+\rho gA x=0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This has the same form as an undamped spring with effective stiffness:

$$
\boxed{k_{\mathrm{b}}=\rho gA}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Natural Frequency And Period {#natural-frequency-and-period-40}

```{=latex}
\Needspace{10\baselineskip}
```
Divide the buoyancy equation by $m$:

$$
x''+\frac{\rho gA}{m}x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the natural circular frequency is:

$$
\boxed{
\omega_0=\sqrt{\frac{\rho gA}{m}}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period is:

$$
\boxed{
T=2\pi\sqrt{\frac{m}{\rho gA}}
}.
$$

This model assumes the cylinder remains vertical, the cross-sectional area at
the waterline stays constant, and the displacement is small enough that the
body remains partially submerged.

```{=latex}
\Needspace{12\baselineskip}
```
### A Complete Buoyancy Example {#a-complete-buoyancy-example-41}

```{=latex}
\Needspace{10\baselineskip}
```
A vertical cylinder has:

$$
m=9.8\text{ kg},
\qquad
A=0.05\text{ m}^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It floats in water with:

$$
\rho=1000\text{ kg/m}^3,
\qquad
g=9.8\text{ m/s}^2.
$$

It is raised $0.04$ m above equilibrium and released from rest. Find the
equilibrium submerged depth and subsequent motion.

#### Step 1: Find the equilibrium submerged depth

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
h=\frac{m}{\rho A}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute:

$$
\begin{aligned}
h
&=\frac{9.8}{1000(0.05)} \\
&=\frac{9.8}{50} \\
&=0.196.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{h=0.196\text{ m}}.
$$

#### Step 2: Construct the motion equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
mx''+\rho gA x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the parameters:

$$
9.8x''+1000(9.8)(0.05)x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the restoring coefficient:

$$
1000(9.8)(0.05)=490.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
9.8x''+490x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $9.8$:

$$
x''+50x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The natural circular frequency is:

$$
\omega_0=\sqrt{50}=5\sqrt2.
$$

#### Step 3: Translate the initial data

```{=latex}
\Needspace{10\baselineskip}
```
Upward is positive. The cylinder is raised by $0.04$ m, so:

$$
x(0)=0.04.
$$

```{=latex}
\Needspace{10\baselineskip}
```
It is released from rest, so:

$$
x'(0)=0.
$$

#### Step 4: Solve the IVP

```{=latex}
\Needspace{10\baselineskip}
```
The general motion is:

$$
x=c_1\cos(5\sqrt2\,t)+c_2\sin(5\sqrt2\,t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x(0)=0.04$:

$$
c_1=0.04.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x'=-5\sqrt2\,c_1\sin(5\sqrt2\,t)
+5\sqrt2\,c_2\cos(5\sqrt2\,t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x'(0)=0$:

$$
0=5\sqrt2\,c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is:

$$
\boxed{x(t)=0.04\cos(5\sqrt2\,t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period is:

$$
\boxed{T=\frac{2\pi}{5\sqrt2}\text{ s}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-42}

```{=latex}
\Needspace{10\baselineskip}
```
For a vertical cylinder of constant cross-sectional area $A$:

$$
h=\frac{m}{\rho A}
$$

```{=latex}
\Needspace{10\baselineskip}
```
and small vertical displacement from equilibrium satisfies:

$$
\boxed{mx''+\rho gA x=0}.
$$

The buoyant restoring force is proportional to the change in displaced volume.

```{=latex}
\Needspace{20\baselineskip}
```
## A Unified Workflow And Common Mistakes {#block-7-a-unified-workflow-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Shared Second-Order Structure {#the-shared-second-order-structure-43}

```{=latex}
\Needspace{10\baselineskip}
```
Springs, circuits, and buoyancy models all fit:

$$
\boxed{M u''+C u'+K u=F(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roles are:

$$
\begin{array}{c|c|c|c}
&\text{spring}&\text{RLC charge}&\text{buoyancy}\\
\hline
M&m&L&m\\
C&c&R&0\text{ in the ideal model}\\
K&k&1/C&\rho gA\\
u&x&q&x\\
F&F(t)&E(t)&0
\end{array}
$$

Recognising the shared form allows the same characteristic-root and forcing
methods to be reused without confusing the physical meanings.

```{=latex}
\Needspace{12\baselineskip}
```
### The Complete Modeling Workflow {#the-complete-modeling-workflow-44}

#### Step 1: Declare the unknown and positive direction

State what $u(t)$ measures and where zero is located.

#### Step 2: Convert all data to consistent units

Do not mix centimetres with metres, grams with kilograms, or weight with mass.

#### Step 3: List each force or voltage contribution

Attach a sign and physical law to every term before combining them.

#### Step 4: Construct the differential equation

Use Newton's law, Kirchhoff's law, or Archimedes' principle.

#### Step 5: Translate the initial data

Use the declared sign convention. In a circuit, remember $I=q'$.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Classify before solving

Identify free or forced, damped or undamped, and the root regime when damping
is present.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Solve the complete IVP

Find $u_h+u_p$, calculate the required derivative, and apply all data.

#### Step 8: Interpret the result

Report units, transient and steady-state parts, frequency information, and
long-term behavior.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Confusing Mass With Weight {#common-mistake-confusing-mass-with-weight-45}

```{=latex}
\Needspace{10\baselineskip}
```
Newton's law uses mass:

$$
mx''=\sum F.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If a problem gives weight $W$, then:

$$
W=mg,
\qquad
m=\frac{W}{g}.
$$

Substituting weight directly for $m$ gives the wrong inertial coefficient.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Adding Gravity Twice {#common-mistake-adding-gravity-twice-46}

```{=latex}
\Needspace{10\baselineskip}
```
If $x$ is measured from equilibrium, the balance $k\ell=mg$ has already
removed gravity from the dynamic equation. The correct model is:

$$
mx''+cx'+kx=F(t).
$$

Adding another $mg$ term counts gravity twice.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Losing The Velocity Sign {#common-mistake-losing-the-velocity-sign-47}

If downward is positive, an upward initial velocity is negative. If upward is
positive, the same physical velocity is positive.

The phrase "moving upward" does not determine a numerical sign until the
coordinate convention has been declared.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using The Wrong Damping Test {#common-mistake-using-the-wrong-damping-test-48}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
mx''+cx'+kx=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the discriminant is:

$$
c^2-4mk.
$$

The coefficients must come from the unnormalized characteristic equation
$mr^2+cr+k=0$. Omitting $m$ changes the classification.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Mixing Radians And Cycles {#common-mistake-mixing-radians-and-cycles-49}

```{=latex}
\Needspace{10\baselineskip}
```
Circular frequency $\omega$ is measured in radians per second. Ordinary
frequency is:

$$
f=\frac{\omega}{2\pi}\text{ Hz}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period is:

$$
T=\frac{2\pi}{\omega}.
$$

Writing $T=1/\omega$ misses the factor $2\pi$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Calling Every Forced Term Steady State {#common-mistake-calling-every-forced-term-steady-state-50}

Steady state describes long-term behavior, not merely the fact that a term came
from $u_p$.

For a stable damped system with bounded sinusoidal forcing, the particular
sinusoidal response is steady state. In an undamped resonant system, a
particular term such as $t\sin(\omega_0t)$ grows and is not bounded steady-state
motion.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using A One-Argument Phase Formula Blindly {#common-mistake-using-a-one-argument-phase-formula-blindly-51}

The ratio $B/A$ does not record the signs of $A$ and $B$ separately. A basic
$\arctan(B/A)$ can therefore choose the wrong quadrant.

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\cos\delta=\frac{A}{R},
\qquad
\sin\delta=\frac{B}{R},
$$

or a two-argument inverse tangent.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-52}

```{=latex}
\Needspace{10\baselineskip}
```
The equation:

$$
M u''+C u'+K u=F(t)
$$

is useful only after its symbols have been tied to a physical model. Declare
coordinates, convert units, derive signs, classify the system, solve the IVP,
and interpret the result in the original units.

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
### Practice Problems {#practice-problems-53}

#### Problem 1: Construct And Classify A Spring Model

A $5$ kg mass moves vertically about its equilibrium position. The damping
coefficient is $6$ N s/m, the spring constant is $45$ N/m, and an external
force $20\cos(3t)$ N acts in the positive direction.

Take displacement in that direction as positive. At $t=0$, the mass is $0.04$
m from equilibrium and is moving in the opposite direction at $0.10$ m/s.

Construct the initial-value problem. Then classify the motion as free or
forced, damped or undamped, and underdamped, critically damped, or overdamped.

#### Problem 2: Find A Spring Constant From Static Stretch

A $4$ kg mass stretches a vertical spring by $0.196$ m. Use $g=9.8$ m/s$^2$.
After equilibrium has been established, the mass is pulled $0.05$ m downward
and released from rest. Ignore damping.

Find:

1.  the spring constant;
2.  the displacement from equilibrium;
3.  the period of the motion.

Take downward displacement from equilibrium as positive.

#### Problem 3: Solve A Free Undamped IVP

```{=latex}
\Needspace{10\baselineskip}
```
A $2$ kg mass is attached to a spring with spring constant $18$ N/m. There is
no damping or external force. With displacement measured positively downward,
the initial data are:

$$
x(0)=0.10,
\qquad
x'(0)=-0.30.
$$

Find the displacement $x(t)$ and its amplitude.

#### Problem 4: Read Harmonic Quantities From A Solution

```{=latex}
\Needspace{10\baselineskip}
```
For the motion:

$$
x(t)=-0.12\cos(4t)+0.05\sin(4t),
$$

find:

1.  the amplitude;
2.  the circular frequency;
3.  the ordinary frequency;
4.  the period;
5.  a phase angle $\delta$ such that $x=R\cos(4t-\delta)$.

#### Problem 5: Classify Three Damping Levels

```{=latex}
\Needspace{10\baselineskip}
```
For each of the following systems, classify the free motion as underdamped,
critically damped, or overdamped:

$$
m=2,
\qquad
k=8,
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
\text{(a) }c=4,
\qquad
\text{(b) }c=8,
\qquad
\text{(c) }c=10.
$$

#### Problem 6: Solve A Free Damped IVP

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
x''+6x'+13x=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
x(0)=1,
\qquad
x'(0)=-3.
$$

State the damping regime and identify the exponential envelope.

#### Problem 7: Find A Steady-State Response

```{=latex}
\Needspace{10\baselineskip}
```
Find a sinusoidal particular solution, and hence the steady-state response, for:

$$
x''+4x'+13x=17\cos(2t)+\sin(2t).
$$

You do not need to find the transient constants.

#### Problem 8: Solve A Resonant IVP

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
x''+16x=8\cos(4t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
subject to:

$$
x(0)=0,
\qquad
x'(0)=0.
$$

Explain why the usual trial $A\cos(4t)+B\sin(4t)$ must be modified.

#### Problem 9: Charge And Current In A Series RLC Circuit

```{=latex}
\Needspace{10\baselineskip}
```
A series circuit has:

$$
L=2\text{ H},
\qquad
R=4\ \Omega,
\qquad
C=\frac14\text{ F},
$$

```{=latex}
\Needspace{10\baselineskip}
```
and is driven by the constant voltage $E(t)=8$ V. Initially:

$$
q(0)=1\text{ C},
\qquad
I(0)=0\text{ A}.
$$

Find the charge $q(t)$ and the current $I(t)$.

#### Problem 10: Translate Between Mechanical And Electrical Models

```{=latex}
\Needspace{10\baselineskip}
```
An RLC charge equation is:

$$
3q''+6q'+12q=9\cos t.
$$

Write down a mechanically analogous spring equation by identifying the
corresponding mass, damping coefficient, spring constant, and external force.
Classify the homogeneous response of both systems.

#### Problem 11: Model A Floating Cylinder

A vertical cylinder of mass $2$ kg and horizontal cross-sectional area
$0.01$ m$^2$ floats in water of mass density $1000$ kg/m$^3$. Use
$g=9.8$ m/s$^2$ and ignore resistance.

Take upward displacement from equilibrium as positive. The cylinder is pushed
$0.03$ m downward and released from rest.

Find:

1.  the equilibrium submerged depth;
2.  the differential equation for displacement;
3.  the resulting motion;
4.  the period.

#### Problem 12: Diagnose Four Modelling Errors

Correct each statement.

1.  An object weighing $98$ N has mass $98$ kg.
2.  If the circular frequency is $5$ rad/s, the period is $1/5$ s.
3.  If downward is positive and a mass initially moves upward at $0.20$ m/s,
    then $x'(0)=0.20$.
4.  For $x''+9x=\cos(3t)$, a suitable particular trial is
    $A\cos(3t)+B\sin(3t)$.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 1 To 4 {#worked-answers-problems-1-to-4-54}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

```{=latex}
\Needspace{10\baselineskip}
```
The mass-spring model measured from equilibrium is:

$$
mx''+cx'+kx=F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the given coefficients:

$$
5x''+6x'+45x=20\cos(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The initial displacement is positive:

$$
x(0)=0.04.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The mass initially moves opposite to the declared positive direction, so its
initial velocity is negative:

$$
x'(0)=-0.10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the complete initial-value problem is:

$$
\boxed{
5x''+6x'+45x=20\cos(3t),
\qquad
x(0)=0.04,
\qquad
x'(0)=-0.10
}.
$$

The right side is not zero, so the motion is **forced**. Since $c=6>0$, it is
also **damped**.

```{=latex}
\Needspace{10\baselineskip}
```
To classify the homogeneous response, use the discriminant from:

$$
5r^2+6r+45=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\begin{aligned}
\Delta
&=c^2-4mk \\
&=6^2-4(5)(45) \\
&=36-900 \\
&=-864.
\end{aligned}
$$

Since $\Delta<0$, the homogeneous response is **underdamped**. The complete
classification is forced, damped motion with an underdamped transient.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
At static equilibrium, the spring force balances the weight:

$$
k\ell=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
m=4,
\qquad
\ell=0.196,
\qquad
g=9.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute these values:

$$
k(0.196)=4(9.8).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right side is:

$$
4(9.8)=39.2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $0.196$:

$$
\boxed{k=200\text{ N/m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Displacement is measured from equilibrium, so gravity has already been
cancelled by the equilibrium spring stretch. With no damping or forcing:

$$
mx''+kx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $m=4$ and $k=200$:

$$
4x''+200x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $4$:

$$
x''+50x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The circular frequency is:

$$
\omega_0=\sqrt{50}=5\sqrt2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x=c_1\cos(5\sqrt2\,t)+c_2\sin(5\sqrt2\,t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The mass is pulled $0.05$ m downward, and downward is positive:

$$
x(0)=0.05.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$:

$$
0.05=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the solution:

$$
x'=-5\sqrt2\,c_1\sin(5\sqrt2\,t)
+5\sqrt2\,c_2\cos(5\sqrt2\,t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The mass is released from rest, so:

$$
x'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$:

$$
0=5\sqrt2\,c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The displacement is:

$$
\boxed{x(t)=0.05\cos(5\sqrt2\,t)\text{ m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
T=\frac{2\pi}{\omega_0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\omega_0=5\sqrt2$:

$$
\boxed{T=\frac{2\pi}{5\sqrt2}\text{ s}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
With no damping or external force, the model is:

$$
mx''+kx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $m=2$ and $k=18$:

$$
2x''+18x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
x''+9x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation is:

$$
r^2+9=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so the roots are:

$$
r=\pm3i.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
x=c_1\cos(3t)+c_2\sin(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the initial displacement:

$$
\begin{aligned}
0.10
&=c_1\cos(0)+c_2\sin(0) \\
&=c_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=0.10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x'=-3c_1\sin(3t)+3c_2\cos(3t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply the initial velocity:

$$
\begin{aligned}
-0.30
&=-3c_1\sin(0)+3c_2\cos(0) \\
&=3c_2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $3$:

$$
c_2=-0.10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The displacement is:

$$
\boxed{x(t)=0.10\cos(3t)-0.10\sin(3t)\text{ m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $A\cos(\omega t)+B\sin(\omega t)$, the amplitude is:

$$
R=\sqrt{A^2+B^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here $A=0.10$ and $B=-0.10$, so:

$$
\begin{aligned}
R
&=\sqrt{(0.10)^2+(-0.10)^2} \\
&=\sqrt{0.02} \\
&=0.10\sqrt2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{R=0.10\sqrt2\text{ m}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

```{=latex}
\Needspace{10\baselineskip}
```
Compare:

$$
x(t)=-0.12\cos(4t)+0.05\sin(4t)
$$

```{=latex}
\Needspace{10\baselineskip}
```
with:

$$
x(t)=A\cos(\omega t)+B\sin(\omega t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A=-0.12,
\qquad
B=0.05,
\qquad
\omega=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The amplitude is:

$$
\begin{aligned}
R
&=\sqrt{A^2+B^2} \\
&=\sqrt{(-0.12)^2+(0.05)^2} \\
&=\sqrt{0.0144+0.0025} \\
&=\sqrt{0.0169} \\
&=0.13.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{R=0.13}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The circular frequency is:

$$
\boxed{\omega=4\text{ rad/s}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Convert circular frequency to ordinary frequency:

$$
f=\frac{\omega}{2\pi}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\omega=4$:

$$
\boxed{f=\frac{2}{\pi}\text{ Hz}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The period is:

$$
T=\frac{2\pi}{\omega}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{T=\frac{\pi}{2}\text{ s}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To write $x=R\cos(4t-\delta)$, expand:

$$
R\cos(4t-\delta)
=
R\cos\delta\cos(4t)
+
R\sin\delta\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match coefficients with the given formula:

$$
R\cos\delta=-0.12,
\qquad
R\sin\delta=0.05.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $R=0.13$:

$$
\cos\delta=-\frac{12}{13},
\qquad
\sin\delta=\frac{5}{13}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cosine is negative and sine is positive, so $\delta$ lies in quadrant II. One
suitable phase angle is:

$$
\boxed{
\delta=\pi-\arctan\left(\frac{5}{12}\right)
}.
$$

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 5 To 8 {#worked-answers-problems-5-to-8-55}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

```{=latex}
\Needspace{10\baselineskip}
```
For free damped motion:

$$
mx''+cx'+kx=0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the characteristic discriminant is:

$$
\Delta=c^2-4mk.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
m=2,
\qquad
k=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
\Delta
&=c^2-4(2)(8) \\
&=c^2-64.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=4$:

$$
\begin{aligned}
\Delta
&=4^2-64 \\
&=16-64 \\
&=-48.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta<0$, case (a) is:

$$
\boxed{\text{underdamped}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=8$:

$$
\begin{aligned}
\Delta
&=8^2-64 \\
&=64-64 \\
&=0.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta=0$, case (b) is:

$$
\boxed{\text{critically damped}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $c=10$:

$$
\begin{aligned}
\Delta
&=10^2-64 \\
&=100-64 \\
&=36.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\Delta>0$, case (c) is:

$$
\boxed{\text{overdamped}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

```{=latex}
\Needspace{10\baselineskip}
```
The characteristic equation for:

$$
x''+6x'+13x=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
is:

$$
r^2+6r+13=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula:

$$
r=\frac{-6\pm\sqrt{6^2-4(1)(13)}}{2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the discriminant:

$$
6^2-4(13)=36-52=-16.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
r
&=\frac{-6\pm\sqrt{-16}}{2} \\
&=\frac{-6\pm4i}{2} \\
&=-3\pm2i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The roots are complex with a negative real part, so the system is
**underdamped**. Its general solution is:

$$
x=e^{-3t}\bigl(c_1\cos(2t)+c_2\sin(2t)\bigr).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x(0)=1$:

$$
\begin{aligned}
1
&=e^0\bigl(c_1\cos(0)+c_2\sin(0)\bigr) \\
&=c_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
c_1=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the product:

$$
\begin{aligned}
x'
={}&-3e^{-3t}\bigl(c_1\cos(2t)+c_2\sin(2t)\bigr) \\
&+e^{-3t}\bigl(-2c_1\sin(2t)+2c_2\cos(2t)\bigr).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
x'(0)=-3c_1+2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $x'(0)=-3$ and $c_1=1$:

$$
-3=-3(1)+2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $3$ to both sides:

$$
0=2c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is:

$$
\boxed{x(t)=e^{-3t}\cos(2t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $-1\leq\cos(2t)\leq1$, the oscillation lies between:

$$
-e^{-3t}
\qquad\text{and}\qquad
e^{-3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence the exponential envelopes are:

$$
\boxed{x=\pm e^{-3t}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Seek a particular solution with the same two sinusoidal building blocks as the
forcing:

$$
x_p=A\cos(2t)+B\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
x_p'=-2A\sin(2t)+2B\cos(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
x_p''=-4A\cos(2t)-4B\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute all three expressions into:

$$
x''+4x'+13x=17\cos(2t)+\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\begin{aligned}
&[-4A\cos(2t)-4B\sin(2t)] \\
&\quad+4[-2A\sin(2t)+2B\cos(2t)] \\
&\quad+13[A\cos(2t)+B\sin(2t)] \\
&=17\cos(2t)+\sin(2t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the cosine terms:

$$
-4A+8B+13A=9A+8B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Collect the sine terms:

$$
-4B-8A+13B=-8A+9B.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the substituted equation is:

$$
(9A+8B)\cos(2t)+(-8A+9B)\sin(2t)
=
17\cos(2t)+\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match the cosine and sine coefficients:

$$
\begin{aligned}
9A+8B&=17, \\
-8A+9B&=1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the first equation by $9$:

$$
81A+72B=153.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the second equation by $8$:

$$
-64A+72B=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract the second equation from the first:

$$
145A=145.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $A=1$ into $9A+8B=17$:

$$
9+8B=17.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $9$:

$$
8B=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
B=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The sinusoidal particular solution is:

$$
x_p=\cos(2t)+\sin(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since the homogeneous roots have negative real part, the homogeneous transient
decays. The steady-state response is therefore:

$$
\boxed{x_{\mathrm{ss}}(t)=\cos(2t)+\sin(2t)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous equation:

$$
x''+16x=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the solution:

$$
x_h=c_1\cos(4t)+c_2\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The forcing $\cos(4t)$ already appears in the homogeneous solution. Therefore
the usual trial:

$$
A\cos(4t)+B\sin(4t)
$$

would be absorbed into $x_h$ and could not produce the nonzero right side. This
is resonance, so multiply the trial by $t$.

```{=latex}
\Needspace{10\baselineskip}
```
For this forcing, use the simpler resonant trial:

$$
x_p=Ct\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate once:

$$
x_p'=C\sin(4t)+4Ct\cos(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate again:

$$
x_p''=4C\cos(4t)+4C\cos(4t)-16Ct\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Combine the two cosine terms:

$$
x_p''=8C\cos(4t)-16Ct\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now substitute into the left side:

$$
\begin{aligned}
x_p''+16x_p
&=8C\cos(4t)-16Ct\sin(4t)
  +16Ct\sin(4t) \\
&=8C\cos(4t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match this with the forcing $8\cos(4t)$:

$$
8C\cos(4t)=8\cos(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
C=1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution is:

$$
x=c_1\cos(4t)+c_2\sin(4t)+t\sin(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x(0)=0$:

$$
0=c_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete solution:

$$
x'=-4c_1\sin(4t)+4c_2\cos(4t)
+\sin(4t)+4t\cos(4t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $x'(0)=0$:

$$
0=4c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The resonant motion is:

$$
\boxed{x(t)=t\sin(4t)}.
$$

The factor $t$ makes the oscillation amplitude grow with time.

```{=latex}
\clearpage
```
```{=latex}
\Needspace{12\baselineskip}
```
### Worked Answers: Problems 9 To 12 {#worked-answers-problems-9-to-12-56}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
The charge equation for a series RLC circuit is:

$$
Lq''+Rq'+\frac{1}{C}q=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert:

$$
L=2,
\qquad
R=4,
\qquad
C=\frac14,
\qquad
E(t)=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\frac{1}{C}
=
\frac{1}{1/4}
=
4,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the equation becomes:

$$
2q''+4q'+4q=8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $2$:

$$
q''+2q'+2q=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous characteristic equation is:

$$
r^2+2r+2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the quadratic formula:

$$
\begin{aligned}
r
&=\frac{-2\pm\sqrt{2^2-4(1)(2)}}{2} \\
&=\frac{-2\pm\sqrt{-4}}{2} \\
&=-1\pm i.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
q_h=e^{-t}(c_1\cos t+c_2\sin t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because the applied voltage is constant, try a constant particular charge:

$$
q_p=Q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Then:

$$
q_p'=0,
\qquad
q_p''=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute into $q''+2q'+2q=4$:

$$
2Q=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
Q=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the complete charge is:

$$
q=2+e^{-t}(c_1\cos t+c_2\sin t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply $q(0)=1$:

$$
\begin{aligned}
1
&=2+e^0(c_1\cos0+c_2\sin0) \\
&=2+c_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $2$:

$$
c_1=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Current is the derivative of charge:

$$
I=q'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the complete charge:

$$
\begin{aligned}
I
={}&-e^{-t}(c_1\cos t+c_2\sin t) \\
&+e^{-t}(-c_1\sin t+c_2\cos t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$:

$$
I(0)=-c_1+c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $I(0)=0$ and $c_1=-1$:

$$
0=-(-1)+c_2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
c_2=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The charge is:

$$
\boxed{
q(t)=2-e^{-t}(\cos t+\sin t)\text{ C}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate this final formula:

$$
\begin{aligned}
I(t)
&=-\frac{d}{dt}\left[e^{-t}(\cos t+\sin t)\right] \\
&=-e^{-t}\left[-(\cos t+\sin t)-\sin t+\cos t\right] \\
&=-e^{-t}(-2\sin t).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{I(t)=2e^{-t}\sin t\text{ A}}.
$$

As $t\to\infty$, the exponential terms vanish, so $q\to2$ C and $I\to0$ A.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
The series RLC charge model is:

$$
Lq''+Rq'+\frac1Cq=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The mechanical spring model is:

$$
mx''+cx'+kx=F(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Match terms in:

$$
3q''+6q'+12q=9\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corresponding quantities are:

```{=latex}
\Needspace{10\baselineskip}
```
$$
m\longleftrightarrow L=3,
$$

```{=latex}
\Needspace{10\baselineskip}
```
$$
c\longleftrightarrow R=6,
$$

$$
k\longleftrightarrow \frac1C=12,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
F(t)\longleftrightarrow E(t)=9\cos t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore a mechanically analogous equation is:

$$
\boxed{
3x''+6x'+12x=9\cos t
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For either homogeneous system, the characteristic equation is:

$$
3r^2+6r+12=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its discriminant is:

$$
\begin{aligned}
\Delta
&=6^2-4(3)(12) \\
&=36-144 \\
&=-108.
\end{aligned}
$$

Since $\Delta<0$, the mechanical system has an underdamped transient. By the
same coefficient structure, the circuit also has an oscillatory transient
whose amplitude decays exponentially.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
At equilibrium, the buoyant force equals the weight. If $h$ is the equilibrium
submerged depth, then:

$$
\rho gAh=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Cancel $g$ from both sides:

$$
\rho Ah=m.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $h$:

$$
h=\frac{m}{\rho A}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert:

$$
m=2,
\qquad
\rho=1000,
\qquad
A=0.01.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\begin{aligned}
h
&=\frac{2}{1000(0.01)} \\
&=\frac{2}{10} \\
&=0.20.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{h=0.20\text{ m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now let $x$ be upward displacement from equilibrium. An upward displacement
$x$ reduces the submerged depth from $h$ to:

$$
h-x.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The upward buoyant force is then:

$$
\rho gA(h-x).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Weight acts downward, so Newton's second law is:

$$
mx''=\rho gA(h-x)-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand the buoyancy term:

$$
mx''=\rho gAh-\rho gAx-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At equilibrium:

$$
\rho gAh=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute that equality into the force equation:

$$
mx''=mg-\rho gAx-mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The two constant weight terms cancel:

$$
mx''=-\rho gAx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move the restoring term to the left:

$$
mx''+\rho gAx=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert the numerical values:

$$
2x''+1000(9.8)(0.01)x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Calculate the coefficient of $x$:

$$
1000(9.8)(0.01)=98.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
2x''+98x=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
\boxed{x''+49x=0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The circular frequency is:

$$
\omega_0=\sqrt{49}=7.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
x=c_1\cos(7t)+c_2\sin(7t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Upward is positive, but the cylinder is initially pushed $0.03$ m downward.
Therefore:

$$
x(0)=-0.03.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $t=0$:

$$
c_1=-0.03.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate:

$$
x'=-7c_1\sin(7t)+7c_2\cos(7t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The cylinder is released from rest:

$$
x'(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
0=7c_2,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
c_2=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The motion is:

$$
\boxed{x(t)=-0.03\cos(7t)\text{ m}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally:

$$
T=\frac{2\pi}{\omega_0}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $\omega_0=7$:

$$
\boxed{T=\frac{2\pi}{7}\text{ s}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

#### Statement 1

```{=latex}
\Needspace{10\baselineskip}
```
Weight and mass are not the same quantity. They are related by:

$$
W=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $W=98$ N and $g=9.8$ m/s$^2$:

$$
m=\frac{W}{g}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the values:

$$
m=\frac{98}{9.8}=10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The corrected statement is:

$$
\boxed{\text{An object weighing }98\text{ N has mass }10\text{ kg}.}
$$

#### Statement 2

```{=latex}
\Needspace{10\baselineskip}
```
Circular frequency and period satisfy:

$$
T=\frac{2\pi}{\omega}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $\omega=5$ rad/s:

$$
\boxed{T=\frac{2\pi}{5}\text{ s}}.
$$

The proposed $1/5$ omits the factor $2\pi$.

#### Statement 3

The coordinate declares downward velocity positive. An upward velocity must
therefore be negative.

```{=latex}
\Needspace{10\baselineskip}
```
The corrected initial condition is:

$$
\boxed{x'(0)=-0.20\text{ m/s}}.
$$

#### Statement 4

```{=latex}
\Needspace{10\baselineskip}
```
The homogeneous equation:

$$
x''+9x=0
$$

```{=latex}
\Needspace{10\baselineskip}
```
has the basis:

$$
\cos(3t),
\qquad
\sin(3t).
$$

Therefore the trial $A\cos(3t)+B\sin(3t)$ duplicates the homogeneous solution.
The forcing frequency equals the natural frequency, so this is resonance.

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the usual sinusoidal trial by $t$. One suitable choice is:

$$
\boxed{x_p=Ct\sin(3t)}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter 14 Final Summary {#chapter-14-final-summary-57}

```{=latex}
\Needspace{10\baselineskip}
```
A physical second-order model begins with a stated unknown, a coordinate
direction, and a balance law. For a mass-spring system measured from
equilibrium:

$$
\boxed{mx''+cx'+kx=F(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Its free response is classified using:

$$
\boxed{\Delta=c^2-4mk}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The three possibilities are:

$$
\begin{aligned}
\Delta&>0 &&\Longrightarrow \text{overdamped}, \\
\Delta&=0 &&\Longrightarrow \text{critically damped}, \\
\Delta&<0 &&\Longrightarrow \text{underdamped}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Without damping, the natural circular frequency and period are:

$$
\boxed{
\omega_0=\sqrt{\frac{k}{m}},
\qquad
T=\frac{2\pi}{\omega_0}
}.
$$

For stable forced damped motion, the homogeneous part is the transient and the
bounded particular response is the steady state. If undamped forcing matches
the natural frequency, resonance introduces a growing factor of $t$.

```{=latex}
\Needspace{10\baselineskip}
```
A series RLC circuit follows:

$$
\boxed{
Lq''+Rq'+\frac1Cq=E(t),
\qquad
I=q'
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A floating vertical cylinder with no resistance follows:

$$
\boxed{
mx''+\rho gAx=0
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
These models share the structure:

$$
\boxed{
M u''+C u'+K u=F(t)
}.
$$

The transferable method is:

1.  define the unknown and positive direction;
2.  convert every quantity to compatible units;
3.  construct the balance law term by term;
4.  translate the initial data with the declared sign convention;
5.  classify the homogeneous response;
6.  solve the complete initial-value problem;
7.  interpret the formula in the original physical setting.

```{=latex}
\Needspace{12\baselineskip}
```
The central lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> the same differential-equation structure can describe very different
> systems, but the symbols gain meaning only after the physical law, signs,
> units, and initial data have been made explicit.
