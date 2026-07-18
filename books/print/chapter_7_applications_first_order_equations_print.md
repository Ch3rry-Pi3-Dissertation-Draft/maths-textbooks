```{=latex}
\clearpage
```
```{=latex}
\fancyhead[L]{\sffamily\small\color{ChapterBlue}\textbf{Chapter 7}}
\fancyhead[R]{\sffamily\small\color{BodyInk}Applications Of First-Order Equations}
```
# Chapter 7 - First-Order Applications

This chapter uses first-order differential equations to describe changing
quantities in physical, biological, chemical, and geometric settings.

The main challenge is no longer deciding how to solve an equation that has
already been given. It is deciding which equation the situation actually
implies.

The central questions are:

-   which quantity should be represented by the unknown function?
-   what mechanisms make that quantity increase or decrease?
-   how do units and sign conventions expose an incorrect model?
-   which assumptions make a familiar first-order equation reasonable?
-   what does the resulting solution say about the original situation?

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's organising idea is:

```{=latex}
\Needspace{8\baselineskip}
```
> build the rate equation from the mechanisms first, solve it second, and
> interpret the result in the language of the model last.

The examples and exercises are original constructions. Each model states its
assumptions explicitly and keeps the substitutions used to determine its
constants visible.

```{=latex}
\Needspace{20\baselineskip}
```
## Turning A Description Into A Differential Equation {#block-1-turning-a-description-into-a-differential-equation}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-1}

The goal is to turn a verbal description into a rate equation without guessing
from a memorised formula.

We will separate the modelling process into small decisions:

1.  choose the changing quantity
2.  identify its units
3.  list the mechanisms that increase and decrease it
4.  write one term for each mechanism
5.  apply the given conditions
6.  solve and check the result against the situation

```{=latex}
\Needspace{8\baselineskip}
```
> the differential equation should be readable as a sentence about how the
> chosen quantity changes.

```{=latex}
\Needspace{12\baselineskip}
```
### The State Variable {#the-state-variable-2}

The **state variable** records the quantity whose value we want to follow.

Examples include:

-   $N(t)$: the number of organisms at time $t$
-   $T(t)$: the temperature of an object at time $t$
-   $A(t)$: the amount of dissolved material in a tank at time $t$
-   $v(t)$: the velocity of a moving body at time $t$
-   $I(t)$: the current in an electrical circuit at time $t$

```{=latex}
\Needspace{10\baselineskip}
```
The derivative of the state variable is its instantaneous rate of change. If
$A$ is measured in kilograms and $t$ in minutes, then:

$$
A'(t)=\frac{dA}{dt}
$$

must be measured in kilograms per minute.

```{=latex}
\Needspace{12\baselineskip}
```
The practical meaning is:

```{=latex}
\Needspace{8\baselineskip}
```
> deciding what the unknown function measures also decides what units every
> term in the differential equation must have.

```{=latex}
\Needspace{12\baselineskip}
```
### A General Balance Law {#a-general-balance-law-3}

```{=latex}
\Needspace{10\baselineskip}
```
Many application models can be organised by the balance statement:

$$
\boxed{
\text{rate of change}
=
\text{rate in}
-
\text{rate out}
+
\text{rate created}
-
\text{rate destroyed}
}
$$

Not every model has all four mechanisms.

```{=latex}
\Needspace{10\baselineskip}
```
For a stored amount $Q(t)$, a general mathematical version is:

$$
Q'(t)=R_{\mathrm{in}}(t)-R_{\mathrm{out}}(t)
+R_{\mathrm{create}}(t)-R_{\mathrm{destroy}}(t).
$$

Every term must have the same units as $Q'(t)$.

```{=latex}
\Needspace{10\baselineskip}
```
For example, if water enters a reservoir at $7$ litres per minute and leaves
at $3$ litres per minute, then its volume $V(t)$ satisfies:

$$
\begin{aligned}
V'(t)
&=\text{rate in}-\text{rate out} \\
&=7-3 \\
&=4.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $V'=4$ and $V(0)=V_0$, integrate the rate equation:

$$
\int V'(t)\,dt=\int 4\,dt,
$$

```{=latex}
\Needspace{10\baselineskip}
```
The integrated volume family is:

$$
V(t)=4t+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $V(0)=V_0$ in the complete formula:

$$
V_0=4(0)+C,
$$

```{=latex}
\Needspace{10\baselineskip}
```
which gives $C=V_0$. Therefore:

$$
\boxed{V(t)=V_0+4t}.
$$

This small example illustrates the full chain from a verbal balance to a
solution.

```{=latex}
\Needspace{12\baselineskip}
```
### Signs Describe Direction {#signs-describe-direction-4}

A positive term increases the state variable. A negative term decreases it.

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $M(t)$ is the mass of a substance. The statement:

$$
M'=-0.08M
$$

says that the substance is being lost because $M'<0$ whenever $M>0$.

```{=latex}
\Needspace{10\baselineskip}
```
By contrast:

$$
M'=0.08M
$$

describes growth because $M'>0$ whenever $M>0$.

The coefficient also has units. Since $M'$ has units of mass per unit time and
$M$ has units of mass, the number $0.08$ must have units of inverse time.

```{=latex}
\Needspace{12\baselineskip}
```
A useful interpretation is:

```{=latex}
\Needspace{8\baselineskip}
```
> the sign tells us the direction of change, while the units tell us whether
> the proposed rate law is dimensionally possible.

```{=latex}
\Needspace{12\baselineskip}
```
### Parameters, Data, And Initial Conditions {#parameters-data-and-initial-conditions-5}

A **parameter** is a fixed quantity within a model, although its value may
need to be estimated from observations.

```{=latex}
\Needspace{10\baselineskip}
```
In:

$$
N'=kN,
$$

```{=latex}
\Needspace{10\baselineskip}
```
$k$ is a model parameter. Solving the equation introduces an integration
constant as well:

$$
N(t)=Ce^{kt}.
$$

An initial condition determines $C$. A later observation can then determine
$k$.

These are different jobs:

-   the initial condition selects one solution from the family
-   observed change over time calibrates the rate parameter

Keeping those roles separate prevents constants from appearing without an
explanation.

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Modelling Workflow {#a-reliable-modelling-workflow-6}

For each application in this chapter, use the following workflow.

#### Step 1: Define the state variable

State exactly what the unknown function measures and give its units.

#### Step 2: Choose the time origin and sign convention

Say what $t=0$ means. For motion, also say which direction is positive.

#### Step 3: List the assumptions

Examples include constant ambient temperature, perfect mixing, constant mass,
or drag proportional to velocity.

#### Step 4: Build the rate equation

Write one term for each mechanism. Do not solve yet.

#### Step 5: Check signs and units

Ask whether the derivative points in the expected direction and whether every
term has matching units.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Solve the differential equation

Classify it and use the corresponding method from earlier chapters.

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply the data locally

Restate the complete solution formula before inserting each observation or
initial value.

#### Step 8: Interpret and validate

Check the initial value, the long-term behaviour, the physical domain, and any
limiting value.

```{=latex}
\Needspace{12\baselineskip}
```
### A Model Is Not The Situation Itself {#a-model-is-not-the-situation-itself-7}

A differential equation is a simplified representation of a situation.

```{=latex}
\Needspace{10\baselineskip}
```
For example, the equation:

$$
N'=kN
$$

assumes the same proportional growth rule continues at every relevant time.
That may be reasonable for an early growth phase, but it cannot describe an
unbounded population in a permanently limited environment.

Solving an equation correctly does not prove that its assumptions are correct.

```{=latex}
\Needspace{12\baselineskip}
```
What to remember:

```{=latex}
\Needspace{8\baselineskip}
```
> mathematical correctness answers "what follows from this model?";
> modelling judgement asks "when should this model be trusted?"

```{=latex}
\Needspace{12\baselineskip}
```
### Block 1 Summary {#block-1-summary-8}

```{=latex}
\Needspace{10\baselineskip}
```
The modelling chain is:

$$
\text{situation}
\longrightarrow
\text{state variable}
\longrightarrow
\text{rate law}
\longrightarrow
\text{solution}
\longrightarrow
\text{interpretation}.
$$

At every stage, check:

-   definitions
-   assumptions
-   signs
-   units
-   initial data
-   valid time interval

```{=latex}
\Needspace{20\baselineskip}
```
## Proportional Growth And Decay {#block-2-proportional-growth-and-decay}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-9}

The goal is to understand models in which the rate of change is proportional
to the amount currently present.

```{=latex}
\Needspace{12\baselineskip}
```
The proportional-change pattern can describe growth or decay over an interval
where the relative rate remains approximately constant.

```{=latex}
\Needspace{8\baselineskip}
```
> proportional change means that equal time intervals multiply the amount by
> equal factors; they do not add equal amounts.

```{=latex}
\Needspace{12\baselineskip}
```
### Building The Proportional-Change Model {#building-the-proportional-change-model-10}

Let $N(t)$ be an amount measured at time $t$.

```{=latex}
\Needspace{10\baselineskip}
```
The phrase "the rate of change is proportional to the amount present" means:

$$
\frac{dN}{dt}=kN,
$$

where $k$ is the constant of proportionality.

```{=latex}
\Needspace{10\baselineskip}
```
Dividing by $N$ when $N>0$ gives:

$$
\frac{N'}{N}=k.
$$

The left side is the **relative rate of change**. Its units are inverse time.
Therefore $k$ also has units of inverse time.

```{=latex}
\Needspace{10\baselineskip}
```
The sign of $k$ determines the qualitative behaviour:

$$
\begin{array}{c|c|c}
k>0 & N'>0 & \text{growth} \\
k=0 & N'=0 & \text{constant amount} \\
k<0 & N'<0 & \text{decay}
\end{array}
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Deriving The Exponential Solution {#deriving-the-exponential-solution-11}

```{=latex}
\Needspace{10\baselineskip}
```
Start from the model:

$$
N'=kN.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For a positive amount $N$, separate the variables:

$$
\frac{1}{N}\,dN=k\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides:

$$
\int\frac{1}{N}\,dN=\int k\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
\ln N=kt+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiate both sides:

$$
N=e^{kt+C_1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $N=e^{kt+C_1}$, use $e^{a+b}=e^ae^b$:

$$
N=e^{C_1}e^{kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{C_1}$ is a positive constant, rename it $C$:

$$
N(t)=Ce^{kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $N(0)=N_0$, substitute $t=0$ into the complete family:

$$
N_0=Ce^{k(0)}=C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{N(t)=N_0e^{kt}}.
$$

The zero amount $N=0$ is also a solution of the differential equation. In
most amount models, it is already covered by taking $N_0=0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: Calibrating A Growth Rate {#worked-example-calibrating-a-growth-rate-12}

A cell culture contains $180$ thousand cells when observation begins. Four
hours later it contains $270$ thousand cells. Assume proportional growth over
the observation period.

Find the model and predict the amount after ten hours.

#### Step 1: Define the state variable

Let $N(t)$ be the number of cells, measured in thousands, $t$ hours after
observation begins.

```{=latex}
\Needspace{10\baselineskip}
```
The data are:

$$
N(0)=180,
\qquad
N(4)=270.
$$

#### Step 2: Write and solve the rate equation

```{=latex}
\Needspace{10\baselineskip}
```
Proportional growth gives:

$$
N'=kN,
\qquad k>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using the derived solution with $N(0)=180$:

$$
N(t)=180e^{kt}.
$$

#### Step 3: Use the later observation to determine $k$

```{=latex}
\Needspace{10\baselineskip}
```
Restate the current model:

$$
N(t)=180e^{kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $t=4$ and $N(4)=270$:

$$
270=180e^{4k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $180$:

$$
\frac{270}{180}=e^{4k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify the ratio:

$$
\frac32=e^{4k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $3/2=e^{4k}$, take natural logarithms:

$$
\ln\left(\frac32\right)=4k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
k=\frac14\ln\left(\frac32\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The calibrated model is:

$$
\boxed{
N(t)=180e^{[\ln(3/2)/4]t}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
An equivalent form makes the four-hour growth factor visible:

$$
\boxed{
N(t)=180\left(\frac32\right)^{t/4}
}.
$$

#### Step 4: Predict the ten-hour amount

```{=latex}
\Needspace{10\baselineskip}
```
Use the calibrated model at $t=10$:

$$
\begin{aligned}
N(10)
&=180\left(\frac32\right)^{10/4} \\
&=180\left(\frac32\right)^{5/2} \\
&\approx496.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $N$ is measured in thousands, the prediction is approximately:

$$
\boxed{496\text{ thousand cells}}.
$$

This prediction is conditional on the proportional-growth assumption
remaining reasonable for the full ten hours.

```{=latex}
\Needspace{12\baselineskip}
```
### Doubling Time {#doubling-time-13}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose $N(t)=N_0e^{kt}$ with $k>0$. The doubling time $T_d$ satisfies:

$$
N(T_d)=2N_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the doubling time, substitute $N(T_d)=N_0e^{kT_d}$ into the condition
$N(T_d)=2N_0$:

$$
N_0e^{kT_d}=2N_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $N_0>0$, divide by $N_0$:

$$
e^{kT_d}=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
kT_d=\ln2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{T_d=\frac{\ln2}{k}}.
$$

The initial amount has cancelled. Under this model, doubling time depends on
the relative growth rate, not on the starting size.

```{=latex}
\Needspace{12\baselineskip}
```
### Half-Life {#half-life-14}

```{=latex}
\Needspace{10\baselineskip}
```
For decay, it is often clearer to write:

$$
N(t)=N_0e^{-\lambda t},
\qquad \lambda>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The half-life $T_{1/2}$ is defined by:

$$
N(T_{1/2})=\frac12N_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the half-life, substitute $N(T_{1/2})=N_0e^{-\lambda T_{1/2}}$ into the
condition $N(T_{1/2})=N_0/2$:

$$
N_0e^{-\lambda T_{1/2}}=\frac12N_0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $N_0>0$:

$$
e^{-\lambda T_{1/2}}=\frac12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
-\lambda T_{1/2}=\ln\left(\frac12\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\ln(1/2)=-\ln2$:

$$
-\lambda T_{1/2}=-\ln2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{T_{1/2}=\frac{\ln2}{\lambda}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After $n$ half-lives, the remaining fraction is:

$$
\boxed{\left(\frac12\right)^n}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Decay Example {#worked-decay-example-15}

A tracer has an initial measured activity of $96$ units. After six days its
activity is $72$ units. Assume exponential decay.

```{=latex}
\Needspace{10\baselineskip}
```
Let $A(t)$ denote the activity after $t$ days. Write:

$$
A(t)=96e^{-\lambda t},
\qquad \lambda>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the observation $A(6)=72$:

$$
72=96e^{-6\lambda}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $96$:

$$
\frac34=e^{-6\lambda}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
\ln\left(\frac34\right)=-6\lambda.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $-1$ and use $-\ln(3/4)=\ln(4/3)$:

$$
6\lambda=\ln\left(\frac43\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving $6\lambda=\ln(4/3)$ for the decay parameter gives:

$$
\lambda=\frac16\ln\left(\frac43\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The model is:

$$
\boxed{
A(t)=96\left(\frac34\right)^{t/6}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The half-life is:

$$
\begin{aligned}
T_{1/2}
&=\frac{\ln2}{\lambda} \\
&=\frac{6\ln2}{\ln(4/3)} \\
&\approx14.46\text{ days}.
\end{aligned}
$$

Notice that the activity does not lose $24$ units every six days. It retains
the same fraction, $3/4$, during each six-day interval.

```{=latex}
\Needspace{12\baselineskip}
```
### When Unlimited Exponential Growth Is Not Credible {#when-unlimited-exponential-growth-is-not-credible-16}

The model $N'=kN$ predicts unlimited growth when $k>0$.

```{=latex}
\Needspace{10\baselineskip}
```
If crowding or limited resources become important, a common alternative is
the logistic model:

$$
\boxed{
N'=rN\left(1-\frac{N}{K}\right)
},
$$

where:

-   $r>0$ is the low-density growth parameter
-   $K>0$ is the carrying capacity

```{=latex}
\Needspace{10\baselineskip}
```
In the logistic model, the crowding factor is:

$$
1-\frac{N}{K}
$$

This factor reduces the per-capita growth rate as $N$ approaches $K$.

```{=latex}
\Needspace{10\baselineskip}
```
Its sign predicts the direction of change:

$$
\begin{array}{c|c}
0<N<K & N'>0 \\
N=K & N'=0 \\
N>K & N'<0
\end{array}
$$

Thus $N=K$ acts as a stable equilibrium in the model.

```{=latex}
\Needspace{12\baselineskip}
```
The key intuition is:

```{=latex}
\Needspace{8\baselineskip}
```
> exponential growth assumes a constant relative growth rate; logistic
> growth lets that relative rate fall as the population approaches a limit.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 2 Summary {#block-2-summary-17}

```{=latex}
\Needspace{10\baselineskip}
```
For constant proportional change:

$$
N'=kN
\quad\Longrightarrow\quad
N(t)=N_0e^{kt}.
$$

Remember:

-   $k>0$ gives growth
-   $k<0$ gives decay
-   equal time intervals produce equal multiplicative factors
-   observations determine unknown parameters
-   doubling time and half-life do not depend on the initial amount
-   exponential predictions are valid only while the proportional-rate
    assumption remains credible

```{=latex}
\Needspace{20\baselineskip}
```
## Heating And Cooling {#block-3-heating-and-cooling}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-18}

The goal is to model an object's temperature when it exchanges heat with an
environment held at a constant temperature.

```{=latex}
\Needspace{12\baselineskip}
```
The important quantity is not the object's temperature by itself. It is the
temperature difference between the object and its surroundings.

```{=latex}
\Needspace{8\baselineskip}
```
> the larger the temperature gap, the faster the model predicts that the gap
> will close.

```{=latex}
\Needspace{12\baselineskip}
```
### Building Newton's Heating And Cooling Model {#building-newtons-heating-and-cooling-model-19}

Let:

-   $T(t)$ be the object's temperature
-   $T_a$ be the constant ambient temperature
-   $k>0$ be a heat-transfer parameter

```{=latex}
\Needspace{10\baselineskip}
```
Newton's heating and cooling model is:

$$
\boxed{
T'=-k(T-T_a)
}.
$$

The sign works in both directions.

```{=latex}
\Needspace{10\baselineskip}
```
If the object is hotter than the environment, then $T-T_a>0$, so:

$$
T'=-k(T-T_a)<0.
$$

The object cools.

```{=latex}
\Needspace{10\baselineskip}
```
If the object is colder than the environment, then $T-T_a<0$, so:

$$
T'=-k(T-T_a)>0.
$$

The object warms.

```{=latex}
\Needspace{10\baselineskip}
```
If $T=T_a$, then:

$$
T'=0.
$$

The ambient temperature is therefore an equilibrium.

```{=latex}
\Needspace{12\baselineskip}
```
### Why The Temperature Difference Is The Natural Variable {#why-the-temperature-difference-is-the-natural-variable-20}

```{=latex}
\Needspace{10\baselineskip}
```
Define the temperature excess:

$$
\theta(t)=T(t)-T_a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $T_a$ is constant:

$$
\theta'(t)=T'(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $T'=-k(T-T_a)$ and $\theta=T-T_a$:

$$
\theta'=-k\theta.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is an exponential-decay equation. Therefore:

$$
\theta(t)=\theta(0)e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $\theta(0)=T_0-T_a$:

$$
T(t)-T_a=(T_0-T_a)e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Add $T_a$ to both sides:

$$
\boxed{
T(t)=T_a+(T_0-T_a)e^{-kt}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Read this as:

$$
\boxed{
\text{current temperature}
=
\text{ambient temperature}
+
\text{remaining initial gap}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Cooling Example {#worked-cooling-example-21}

A heated component is moved into a room maintained at $20^\circ\mathrm C$.
Its initial temperature is $140^\circ\mathrm C$, and after six minutes its
temperature is $80^\circ\mathrm C$.

Assuming Newton's cooling model, find its temperature at time $t$ and the time
at which it reaches $35^\circ\mathrm C$.

#### Step 1: Define the quantities and data

Let $T(t)$ be the component's temperature in degrees Celsius, $t$ minutes
after it enters the room.

```{=latex}
\Needspace{10\baselineskip}
```
The fixed ambient temperature is:

$$
T_a=20.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The observations are:

$$
T(0)=140,
\qquad
T(6)=80.
$$

#### Step 2: Write the general temperature model

```{=latex}
\Needspace{10\baselineskip}
```
Use the equilibrium-deviation formula:

$$
T(t)=T_a+(T_0-T_a)e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $T_a=20$ and $T_0=140$:

$$
\begin{aligned}
T(t)
&=20+(140-20)e^{-kt} \\
&=20+120e^{-kt}.
\end{aligned}
$$

#### Step 3: Use the six-minute observation

```{=latex}
\Needspace{10\baselineskip}
```
Restate the current model:

$$
T(t)=20+120e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $t=6$ and $T(6)=80$:

$$
80=20+120e^{-6k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $20$:

$$
60=120e^{-6k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $120$:

$$
\frac12=e^{-6k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
\ln\left(\frac12\right)=-6k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\ln(1/2)=-\ln2$:

$$
-\ln2=-6k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
k=\frac{\ln2}{6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The calibrated temperature model is:

$$
\boxed{
T(t)=20+120\left(\frac12\right)^{t/6}
}.
$$

#### Step 4: Find when the component reaches $35^\circ\mathrm C$

```{=latex}
\Needspace{10\baselineskip}
```
Use the calibrated model with $T(t)=35$:

$$
35=20+120\left(\frac12\right)^{t/6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $20$:

$$
15=120\left(\frac12\right)^{t/6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $120$:

$$
\frac18=\left(\frac12\right)^{t/6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1/8=(1/2)^3$:

$$
\left(\frac12\right)^3
=
\left(\frac12\right)^{t/6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equate the exponents:

$$
3=\frac{t}{6}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{t=18\text{ minutes}}.
$$

The temperature gap halves every six minutes: $120$, $60$, $30$, then $15$
degrees above the room temperature.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Heating Example {#worked-heating-example-22}

A sensor begins at $20^\circ\mathrm C$ and is placed in a chamber held at
$200^\circ\mathrm C$. After five minutes the sensor reads
$65^\circ\mathrm C$. Find when it reaches $110^\circ\mathrm C$.

```{=latex}
\Needspace{10\baselineskip}
```
The model is:

$$
T(t)=T_a+(T_0-T_a)e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $T_a=200$ and $T_0=20$:

$$
T(t)=200-180e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $T(5)=65$:

$$
65=200-180e^{-5k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $65=200-180e^{-5k}$, subtract $200$:

$$
-135=-180e^{-5k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $-180$:

$$
\frac34=e^{-5k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take logarithms:

$$
\ln\left(\frac34\right)=-5k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
k=\frac15\ln\left(\frac43\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now set $T(t)=110$ in the calibrated model:

$$
110=200-180e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $200$ and divide by $-180$:

$$
\frac12=e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take logarithms:

$$
-\ln2=-kt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving $e^{-kt}=1/2$ for the requested time gives:

$$
\begin{aligned}
t
&=\frac{\ln2}{k} \\
&=\frac{5\ln2}{\ln(4/3)} \\
&\approx12.05\text{ minutes}.
\end{aligned}
$$

The sensor warms because it starts below the ambient temperature, but its rate
of warming decreases as the temperature gap closes.

```{=latex}
\Needspace{12\baselineskip}
```
### What The Model Can And Cannot Predict {#what-the-model-can-and-cannot-predict-23}

```{=latex}
\Needspace{10\baselineskip}
```
For $k>0$:

$$
e^{-kt}\longrightarrow0
\qquad\text{as}\qquad t\longrightarrow\infty.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
T(t)=T_a+(T_0-T_a)e^{-kt}\longrightarrow T_a.
$$

The model approaches the ambient temperature without crossing it. The sign of
$T(t)-T_a$ remains the same as the sign of $T_0-T_a$.

The constant-ambient formula should not be used unchanged if:

-   the room or bath temperature varies substantially with time
-   the object produces internal heat
-   phase changes occur
-   the transfer coefficient changes significantly
-   different parts of the object have very different temperatures

Those situations require a modified model.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 3 Summary {#block-3-summary-24}

```{=latex}
\Needspace{10\baselineskip}
```
With constant ambient temperature $T_a$:

$$
T'=-k(T-T_a),
\qquad k>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is:

$$
\boxed{
T(t)=T_a+(T_0-T_a)e^{-kt}
}.
$$

The temperature difference, not the absolute temperature, decays
exponentially.

```{=latex}
\Needspace{20\baselineskip}
```
## Mixing Models And Conservation Of Material {#block-4-mixing-models-and-conservation-of-material}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-25}

The goal is to track the amount of a dissolved substance in a tank while
solution enters and leaves.

```{=latex}
\Needspace{10\baselineskip}
```
The central balance is:

$$
\boxed{
\text{rate of change of amount}
=
\text{rate of substance in}
-
\text{rate of substance out}
}.
$$

The difficult part is usually constructing the two rates, not solving the
resulting differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Amount, Volume, And Concentration Are Different {#amount-volume-and-concentration-are-different-26}

Let:

-   $A(t)$ be the amount of dissolved substance in the tank
-   $V(t)$ be the volume of liquid in the tank
-   $c(t)$ be the concentration in the tank

```{=latex}
\Needspace{10\baselineskip}
```
Amount, volume, and concentration satisfy:

$$
\boxed{
c(t)=\frac{A(t)}{V(t)}
}.
$$

For example, if $A$ is measured in kilograms and $V$ in litres, then $c$ is
measured in kilograms per litre.

```{=latex}
\Needspace{10\baselineskip}
```
A material flow rate is built by multiplying concentration by liquid flow
rate:

$$
\frac{\text{kilograms}}{\text{litre}}
\times
\frac{\text{litres}}{\text{minute}}
=
\frac{\text{kilograms}}{\text{minute}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\text{material rate}
=
\text{concentration}
\times
\text{volume flow rate}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
The key distinction is:

```{=latex}
\Needspace{8\baselineskip}
```
> liquid leaves at a volumetric rate, but dissolved material leaves at that
> flow rate multiplied by the concentration at the outlet.

```{=latex}
\Needspace{12\baselineskip}
```
### The Perfect-Mixing Assumption {#the-perfect-mixing-assumption-27}

```{=latex}
\Needspace{10\baselineskip}
```
We will assume the tank is perfectly mixed. This means the concentration of
the outgoing solution equals the concentration everywhere in the tank:

$$
c_{\mathrm{out}}(t)=\frac{A(t)}{V(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the outgoing liquid flow rate is $r_{\mathrm{out}}$, then:

$$
\text{rate of material out}
=
r_{\mathrm{out}}\frac{A(t)}{V(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If incoming solution has concentration $c_{\mathrm{in}}(t)$ and enters at
liquid flow rate $r_{\mathrm{in}}$, then:

$$
\text{rate of material in}
=
r_{\mathrm{in}}c_{\mathrm{in}}(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete balance equation is therefore:

$$
\boxed{
A'(t)
=
r_{\mathrm{in}}c_{\mathrm{in}}(t)
-
r_{\mathrm{out}}\frac{A(t)}{V(t)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The tank volume is governed separately by:

$$
\boxed{
V'(t)=r_{\mathrm{in}}-r_{\mathrm{out}}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Constant-Volume Worked Example {#constant-volume-worked-example-28}

A tank initially contains $120$ litres of solution with $3$ kilograms of
dissolved mineral. Solution containing $0.05$ kilograms per litre enters at
$4$ litres per minute. The well-mixed solution leaves at the same flow rate.

Find the amount of mineral in the tank at time $t$.

#### Step 1: Define the state variable

Let $A(t)$ be the kilograms of mineral in the tank after $t$ minutes.

```{=latex}
\Needspace{10\baselineskip}
```
The initial condition is:

$$
A(0)=3.
$$

#### Step 2: Determine the volume

```{=latex}
\Needspace{10\baselineskip}
```
The liquid inflow and outflow rates are both $4$ litres per minute, so:

$$
V'(t)=4-4=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the volume remains:

$$
V(t)=120\text{ litres}.
$$

#### Step 3: Construct the incoming material rate

```{=latex}
\Needspace{10\baselineskip}
```
The incoming concentration is $0.05$ kilograms per litre. Hence:

$$
\begin{aligned}
\text{rate in}
&=(0.05)(4) \\
&=0.2\text{ kilograms per minute}.
\end{aligned}
$$

#### Step 4: Construct the outgoing material rate

```{=latex}
\Needspace{10\baselineskip}
```
By perfect mixing, the concentration in the tank is:

$$
\frac{A(t)}{120}
\quad\text{kilograms per litre}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by the outgoing flow rate:

$$
\begin{aligned}
\text{rate out}
&=4\frac{A(t)}{120} \\
&=\frac{A(t)}{30}
\quad\text{kilograms per minute}.
\end{aligned}
$$

#### Step 5: Write the balance equation

```{=latex}
\Needspace{10\baselineskip}
```
Use rate of change = rate in $-$ rate out:

$$
A'=0.2-\frac{A}{30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Put the balance equation $A'=0.2-A/30$ into linear standard form:

$$
\boxed{
A'+\frac1{30}A=0.2
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Solve the linear equation

```{=latex}
\Needspace{10\baselineskip}
```
The integrating factor is:

$$
\begin{aligned}
\mu(t)
&=e^{\int(1/30)\,dt} \\
&=e^{t/30}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term in the linear equation by $e^{t/30}$:

$$
e^{t/30}A'
+\frac1{30}e^{t/30}A
=0.2e^{t/30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The left side is the product derivative:

$$
\frac{d}{dt}\left(e^{t/30}A\right)
=0.2e^{t/30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides:

$$
e^{t/30}A
=
\int0.2e^{t/30}\,dt+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\int0.2e^{t/30}\,dt
=0.2(30)e^{t/30}
=6e^{t/30},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have:

$$
e^{t/30}A=6e^{t/30}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $e^{t/30}A=6e^{t/30}+C$, divide by $e^{t/30}$:

$$
A(t)=6+Ce^{-t/30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 7: Apply the initial amount

```{=latex}
\Needspace{10\baselineskip}
```
Use $A(0)=3$ in the complete family:

$$
3=6+Ce^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
C=-3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The amount is:

$$
\boxed{
A(t)=6-3e^{-t/30}
\quad\text{kilograms}
}.
$$

#### Step 8: Interpret the limiting amount

```{=latex}
\Needspace{10\baselineskip}
```
As $t\to\infty$:

$$
e^{-t/30}\to0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
A(t)\to6\text{ kilograms}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This agrees with the incoming concentration. At long times, a tank volume of
$120$ litres at $0.05$ kilograms per litre contains:

$$
(120)(0.05)=6\text{ kilograms}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Variable-Volume Worked Example {#variable-volume-worked-example-29}

A tank initially holds $80$ litres of solution containing $8$ kilograms of
dissolved material. Fresh water enters at $3$ litres per minute, while the
well-mixed solution leaves at $5$ litres per minute.

Find the amount of dissolved material while liquid remains in the tank. Then
find the amount when the volume has fallen to $40$ litres.

#### Step 1: Find the changing volume

```{=latex}
\Needspace{10\baselineskip}
```
The net liquid rate is:

$$
V'=3-5=-2
\quad\text{litres per minute}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $V(0)=80$:

$$
\boxed{
V(t)=80-2t
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The model is valid only while $V(t)>0$:

$$
80-2t>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solving this inequality gives:

$$
\boxed{0\le t<40}.
$$

#### Step 2: Build the material rates

```{=latex}
\Needspace{10\baselineskip}
```
Fresh water contains no dissolved material, so:

$$
\text{rate in}=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The concentration in the tank is:

$$
\frac{A(t)}{80-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The material leaves at $5$ litres per minute, so:

$$
\text{rate out}
=5\frac{A(t)}{80-2t}.
$$

#### Step 3: Write the balance equation

```{=latex}
\Needspace{10\baselineskip}
```
Using rate of change = rate in $-$ rate out:

$$
A'
=
0-5\frac{A}{80-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
A'=-\frac{5A}{80-2t}
}.
$$

#### Step 4: Separate the variables

```{=latex}
\Needspace{10\baselineskip}
```
For $A>0$:

$$
\frac1A\,dA
=
-\frac5{80-2t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int\frac1A\,dA
=
\int-\frac5{80-2t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For the right side, let:

$$
u=80-2t,
\qquad
du=-2\,dt,
\qquad
dt=-\frac12du.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The right-hand integral becomes:

$$
\begin{aligned}
\int-\frac5{80-2t}\,dt
&=\int-\frac5u\left(-\frac12du\right) \\
&=\frac52\int\frac1u\,du \\
&=\frac52\ln u+C_1 \\
&=\frac52\ln(80-2t)+C_1,
\end{aligned}
$$

where $80-2t>0$ on the working interval.

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\ln A=\frac52\ln(80-2t)+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiate:

$$
A=C(80-2t)^{5/2}.
$$

#### Step 5: Apply the initial amount

```{=latex}
\Needspace{10\baselineskip}
```
Use $A(0)=8$ in the complete family:

$$
8=C(80)^{5/2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
C=\frac8{80^{5/2}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $C=8/80^{5/2}$ into the amount family:

$$
\begin{aligned}
A(t)
&=\frac8{80^{5/2}}(80-2t)^{5/2} \\
&=8\left(\frac{80-2t}{80}\right)^{5/2} \\
&=8\left(1-\frac{t}{40}\right)^{5/2}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
A(t)=8\left(1-\frac{t}{40}\right)^{5/2},
\qquad 0\le t<40
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
#### Step 6: Use the requested volume

```{=latex}
\Needspace{10\baselineskip}
```
First find when the volume is $40$ litres:

$$
80-2t=40.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $80$:

$$
-2t=-40.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
t=20\text{ minutes}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now use $t=20$ in the amount formula:

$$
\begin{aligned}
A(20)
&=8\left(1-\frac{20}{40}\right)^{5/2} \\
&=8\left(\frac12\right)^{5/2} \\
&=\sqrt2.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=20$, the amount calculation gives:

$$
\boxed{\sqrt2\text{ kilograms}}
$$

when its volume is $40$ litres.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mixing Errors {#common-mixing-errors-30}

**Using the incoming concentration for the outflow.**

The outgoing concentration is $A(t)/V(t)$ under perfect mixing. It is not
generally equal to the incoming concentration.

**Treating volume as constant when the flow rates differ.**

```{=latex}
\Needspace{10\baselineskip}
```
Always calculate:

$$
V'=r_{\mathrm{in}}-r_{\mathrm{out}}.
$$

**Confusing amount with concentration.**

$A(t)$ and $A(t)/V(t)$ have different units and answer different questions.

**Ignoring an emptying or overflow time.**

The formula is valid only while the physical tank model remains meaningful.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 4 Summary {#block-4-summary-31}

```{=latex}
\Needspace{10\baselineskip}
```
For a perfectly mixed tank:

$$
A'
=
r_{\mathrm{in}}c_{\mathrm{in}}
-
r_{\mathrm{out}}\frac{A}{V}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
A mixing model must also track the volume equation:

$$
V'=r_{\mathrm{in}}-r_{\mathrm{out}}.
$$

Construct the two material rates with their units before attempting to solve
the equation.

```{=latex}
\Needspace{20\baselineskip}
```
## Falling Motion With Linear Drag {#block-5-falling-motion-with-linear-drag}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-32}

The goal is to derive a velocity model from Newton's second law when gravity
and air resistance act on a falling body.

```{=latex}
\Needspace{12\baselineskip}
```
The sign convention will be chosen before any force is written.

```{=latex}
\Needspace{8\baselineskip}
```
> forces do not come with automatic plus or minus signs; the chosen positive
> direction determines those signs.

```{=latex}
\Needspace{12\baselineskip}
```
### Choose A Direction Before Writing Forces {#choose-a-direction-before-writing-forces-33}

Let downward be the positive direction, and let $v(t)$ be downward velocity.

Then:

-   positive $v$ means downward motion
-   negative $v$ means upward motion
-   gravity acts in the positive direction
-   linear drag acts opposite the velocity

```{=latex}
\Needspace{10\baselineskip}
```
For a falling body with $v>0$:

$$
F_{\mathrm{gravity}}=mg,
\qquad
F_{\mathrm{drag}}=-cv,
$$

where:

-   $m>0$ is mass
-   $g>0$ is gravitational acceleration
-   $c>0$ is the linear-drag coefficient

```{=latex}
\Needspace{10\baselineskip}
```
Newton's second law states:

$$
m\frac{dv}{dt}=\text{net force}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the two forces:

$$
\boxed{
m v'=mg-cv
}.
$$

For motion that may reverse direction, the phrase "opposite the velocity" is
more fundamental than memorising $-cv$ under one convention.

```{=latex}
\Needspace{12\baselineskip}
```
### Terminal Velocity Before Solving {#terminal-velocity-before-solving-34}

```{=latex}
\Needspace{10\baselineskip}
```
Terminal velocity is an equilibrium velocity. At equilibrium:

$$
v'=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Apply this to:

$$
m v'=mg-cv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At terminal velocity, set $v'=0$ in $m v'=mg-cv$:

$$
0=mg-cv_{\infty}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
cv_{\infty}=mg.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
v_{\infty}=\frac{mg}{c}
}.
$$

This value can be predicted directly from force balance, before solving the
differential equation.

```{=latex}
\Needspace{12\baselineskip}
```
### Deriving The Velocity Formula {#deriving-the-velocity-formula-35}

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
m v'=mg-cv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $m$:

$$
v'+\frac{c}{m}v=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This is a linear first-order equation. Its equilibrium is:

$$
v_{\infty}=\frac{mg}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the deviation from equilibrium:

$$
w(t)=v(t)-v_{\infty}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $v_{\infty}$ is constant:

$$
w'=v'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $v=w+v_{\infty}$ into the normalised velocity equation:

$$
w'+\frac{c}{m}(w+v_{\infty})=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
w'+\frac{c}{m}w+\frac{c}{m}v_{\infty}=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $v_{\infty}=mg/c$, substitute this formula into
$(c/m)v_{\infty}$:

$$
\frac{c}{m}v_{\infty}
=\frac{c}{m}\cdot\frac{mg}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply the numerators and multiply the denominators:

$$
\frac{c}{m}v_{\infty}
=\frac{cmg}{mc}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Regroup the numerator so that the common factor $mc$ is visible:

$$
\frac{c}{m}v_{\infty}
=\frac{(mc)g}{mc}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the common factor from $g$:

$$
\frac{c}{m}v_{\infty}
=\left(\frac{mc}{mc}\right)g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $m>0$ and $c>0$, the factor $mc$ is nonzero and $mc/mc=1$.
Therefore:

$$
\frac{c}{m}v_{\infty}
=1\cdot g
=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now substitute $(c/m)v_{\infty}=g$ into the expanded equation:

$$
w'+\frac{c}{m}w+g=g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Starting from $w'+(c/m)w+g=g$, subtract $g$ from both sides:

$$
w'+\frac{c}{m}w+g-g=g-g.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify both sides:

$$
w'+\frac{c}{m}w=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
w(t)=Ce^{-ct/m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $w=Ce^{-ct/m}$ and $v=w+v_{\infty}$, return to the velocity:

$$
v(t)=\frac{mg}{c}+Ce^{-ct/m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $v(0)=v_0$, substitute into the complete family:

$$
v_0=\frac{mg}{c}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
C=v_0-\frac{mg}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
v(t)
=
\frac{mg}{c}
+
\left(v_0-\frac{mg}{c}\right)e^{-ct/m}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This has the familiar form:

$$
\text{current value}
=
\text{equilibrium}
+
\text{decaying initial deviation}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Complete Motion Example {#complete-motion-example-36}

A $4$ kilogram object is moving downward at $3$ metres per second when timing
begins. Take downward as positive. Assume $g=9.8$ metres per second squared and
a linear-drag coefficient $c=8$ kilograms per second.

Find its velocity and downward displacement from its position at $t=0$.

#### Step 1: Write the velocity equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
m v'=mg-cv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $m=4$, $g=9.8$, and $c=8$:

$$
4v'=4(9.8)-8v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
4v'=39.2-8v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $4$:

$$
\boxed{v'+2v=9.8}.
$$

#### Step 2: Find the terminal velocity

```{=latex}
\Needspace{10\baselineskip}
```
Set $v'=0$ in the normalised equation:

$$
0+2v_{\infty}=9.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
v_{\infty}=4.9\text{ metres per second}.
$$

#### Step 3: Use the general velocity formula

```{=latex}
\Needspace{10\baselineskip}
```
The decay rate is:

$$
\frac{c}{m}=\frac84=2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the equilibrium-deviation velocity formula:

$$
v(t)=v_{\infty}+(v_0-v_{\infty})e^{-ct/m}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $v_{\infty}=4.9$, $v_0=3$, and $c/m=2$:

$$
\begin{aligned}
v(t)
&=4.9+(3-4.9)e^{-2t} \\
&=4.9-1.9e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
v(t)=4.9-1.9e^{-2t}
\quad\text{metres per second}
}.
$$

At $t=0$, this gives $v(0)=4.9-1.9=3$, as required. As $t\to\infty$,
$v(t)\to4.9$.

#### Step 4: Relate velocity to displacement

```{=latex}
\Needspace{10\baselineskip}
```
Let $s(t)$ be downward displacement from the position at $t=0$. Then:

$$
s'(t)=v(t),
\qquad
s(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the velocity formula:

$$
s'(t)=4.9-1.9e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate term by term:

$$
\begin{aligned}
s(t)
&=\int\left(4.9-1.9e^{-2t}\right)dt \\
&=4.9t+0.95e^{-2t}+C.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The exponential term is positive because:

$$
\frac{d}{dt}\left(0.95e^{-2t}\right)
=-1.9e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $s(0)=0$ in the complete displacement family:

$$
0=4.9(0)+0.95e^0+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
C=-0.95.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The downward displacement is:

$$
\boxed{
s(t)=4.9t+0.95e^{-2t}-0.95
\quad\text{metres}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Equivalently:

$$
\boxed{
s(t)=4.9t-0.95(1-e^{-2t})
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Checking The Force Directions {#checking-the-force-directions-37}

```{=latex}
\Needspace{10\baselineskip}
```
In the worked example, the initial velocity is below terminal velocity:

$$
v_0=3<4.9=v_{\infty}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=0$, the acceleration is:

$$
\begin{aligned}
v'(0)
&=9.8-2v(0) \\
&=9.8-2(3) \\
&=3.8>0.
\end{aligned}
$$

The object speeds up downward.

If instead $v_0>4.9$, then $v'(0)<0$ and the object slows toward terminal
velocity. In both cases the equilibrium attracts nearby velocities.

```{=latex}
\Needspace{12\baselineskip}
```
### Changing The Drag Assumption Changes The Equation {#changing-the-drag-assumption-changes-the-equation-38}

Linear drag assumes the drag magnitude is proportional to speed. It is often
useful over a limited regime, but it is not universal.

```{=latex}
\Needspace{10\baselineskip}
```
If drag magnitude is proportional to the square of speed, a direction-aware
form is:

$$
F_{\mathrm{drag}}=-c|v|v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With downward positive, the equation becomes:

$$
m v'=mg-c|v|v.
$$

This is nonlinear. The linear-drag solution formula cannot be reused after
changing the force law.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 5 Summary {#block-5-summary-39}

```{=latex}
\Needspace{10\baselineskip}
```
With downward positive and linear drag:

$$
m v'=mg-cv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The terminal velocity is:

$$
v_{\infty}=\frac{mg}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $v(0)=v_0$:

$$
\boxed{
v(t)=v_{\infty}+(v_0-v_{\infty})e^{-ct/m}
}.
$$

To find position or displacement, use $s'=v$ and apply a position condition
after integrating.

```{=latex}
\Needspace{20\baselineskip}
```
## Current In A Resistor-Inductor Circuit {#block-6-current-in-a-resistor-inductor-circuit}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-40}

The goal is to model current in a series circuit containing a resistor and an
inductor.

```{=latex}
\Needspace{12\baselineskip}
```
The differential equation comes from balancing voltage changes around the
circuit loop.

```{=latex}
\Needspace{8\baselineskip}
```
> an inductor resists rapid change in current, while a resistor opposes the
> current itself.

```{=latex}
\Needspace{12\baselineskip}
```
### Constructing The Circuit Equation {#constructing-the-circuit-equation-41}

Let:

-   $I(t)$ be the current in amperes
-   $L>0$ be the inductance in henries
-   $R>0$ be the resistance in ohms
-   $E(t)$ be the applied electromotive force in volts

```{=latex}
\Needspace{10\baselineskip}
```
The voltage across the inductor is:

$$
L\frac{dI}{dt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The voltage across the resistor is:

$$
RI.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Kirchhoff's voltage law gives:

$$
\boxed{
L I'+RI=E(t)
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Each term has units of volts:

$$
\underbrace{LI'}_{\text{inductor voltage}}
+
\underbrace{RI}_{\text{resistor voltage}}
=
\underbrace{E(t)}_{\text{applied voltage}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $L$ to obtain linear standard form:

$$
\boxed{
I'+\frac{R}{L}I=\frac{E(t)}{L}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Constant-Voltage Worked Example {#constant-voltage-worked-example-42}

A series circuit has inductance $L=2$ henries, resistance $R=6$ ohms, and a
constant applied voltage of $12$ volts. The initial current is zero.

Find the current and the time required to reach $90\%$ of its limiting value.

#### Step 1: Build the differential equation

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
L I'+RI=E.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $L=2$, $R=6$, and $E=12$:

$$
2I'+6I=12.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide every term by $2$:

$$
\boxed{I'+3I=6}.
$$

#### Step 2: Identify the limiting current

```{=latex}
\Needspace{10\baselineskip}
```
At a constant limiting current, $I'=0$. Substitute this into the circuit
equation:

$$
0+3I_{\infty}=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{I_{\infty}=2\text{ amperes}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This agrees with Ohm's law for the long-time state:

$$
I_{\infty}=\frac{E}{R}=\frac{12}{6}=2.
$$

#### Step 3: Solve the linear equation

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
I'+3I=6,
$$

```{=latex}
\Needspace{10\baselineskip}
```
the integrating factor is:

$$
\mu(t)=e^{\int3\,dt}=e^{3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $e^{3t}$:

$$
e^{3t}I'+3e^{3t}I=6e^{3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Recognise the product derivative:

$$
\frac{d}{dt}\left(e^{3t}I\right)=6e^{3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product equation $(e^{3t}I)'=6e^{3t}$ integrates to:

$$
e^{3t}I=\int6e^{3t}\,dt+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since:

$$
\int6e^{3t}\,dt=2e^{3t},
$$

```{=latex}
\Needspace{10\baselineskip}
```
we obtain:

$$
e^{3t}I=2e^{3t}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $e^{3t}$:

$$
I(t)=2+Ce^{-3t}.
$$

#### Step 4: Apply the initial current

```{=latex}
\Needspace{10\baselineskip}
```
Use $I(0)=0$ in the complete family:

$$
0=2+Ce^0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
C=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The current is:

$$
\boxed{
I(t)=2(1-e^{-3t})
\quad\text{amperes}
}.
$$

#### Step 5: Find the time to reach $90\%$ of the limit

```{=latex}
\Needspace{10\baselineskip}
```
Ninety percent of the limiting current is:

$$
0.9I_{\infty}=0.9(2)=1.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set $I(t)=1.8$ in the current formula:

$$
1.8=2(1-e^{-3t}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $2$:

$$
0.9=1-e^{-3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
e^{-3t}=0.1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
-3t=\ln(0.1)=-\ln10.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{
t=\frac{\ln10}{3}\approx0.768\text{ seconds}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### A Time-Varying Voltage {#a-time-varying-voltage-43}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose a circuit has:

$$
L=1,
\qquad
R=2,
\qquad
E(t)=10\cos(2t),
\qquad
I(0)=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The circuit equation is:

$$
I'+2I=10\cos(2t).
$$

#### Step 1: Construct the integrating factor

```{=latex}
\Needspace{10\baselineskip}
```
The integrating factor is:

$$
\mu(t)=e^{\int2\,dt}=e^{2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $e^{2t}$:

$$
e^{2t}I'+2e^{2t}I=10e^{2t}\cos(2t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\frac{d}{dt}\left(e^{2t}I\right)
=10e^{2t}\cos(2t).
$$

#### Step 2: Integrate the forcing term

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
\int e^{at}\cos(bt)\,dt
=
\frac{e^{at}}{a^2+b^2}
\left(a\cos(bt)+b\sin(bt)\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $a=2$ and $b=2$:

$$
\begin{aligned}
\int10e^{2t}\cos(2t)\,dt
&=10\frac{e^{2t}}{2^2+2^2}
\left(2\cos(2t)+2\sin(2t)\right) \\
&=\frac52e^{2t}\left(\cos(2t)+\sin(2t)\right).
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product equation $(e^{2t}I)'=10e^{2t}\cos(2t)$ integrates to:

$$
e^{2t}I
=
\frac52e^{2t}\left(\cos(2t)+\sin(2t)\right)+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $e^{2t}$:

$$
I(t)
=
\frac52\left(\cos(2t)+\sin(2t)\right)+Ce^{-2t}.
$$

#### Step 3: Apply the initial current

```{=latex}
\Needspace{10\baselineskip}
```
Use $I(0)=0$ in the complete current family:

$$
0
=
\frac52(\cos0+\sin0)+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $\cos0=1$ and $\sin0=0$:

$$
0=\frac52+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
C=-\frac52.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The current is:

$$
\boxed{
I(t)
=
\frac52\left(\cos(2t)+\sin(2t)-e^{-2t}\right)
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### Transient And Steady-State Current {#transient-and-steady-state-current-44}

```{=latex}
\Needspace{10\baselineskip}
```
In the time-varying example, write:

$$
I(t)=I_{\mathrm{steady}}(t)+I_{\mathrm{transient}}(t),
$$

```{=latex}
\Needspace{10\baselineskip}
```
where:

$$
I_{\mathrm{steady}}(t)
=
\frac52\left(\cos(2t)+\sin(2t)\right)
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
I_{\mathrm{transient}}(t)
=
-\frac52e^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
As $t\to\infty$:

$$
I_{\mathrm{transient}}(t)\to0.
$$

The initial condition affects the transient term, while the continuing
sinusoidal voltage determines the long-term oscillation.

```{=latex}
\Needspace{10\baselineskip}
```
The steady-state part can be written as one shifted cosine. Since:

$$
\cos u+\sin u
=
\sqrt2\cos\left(u-\frac\pi4\right),
$$

```{=latex}
\Needspace{10\baselineskip}
```
we have:

$$
\boxed{
I_{\mathrm{steady}}(t)
=
\frac5{\sqrt2}
\cos\left(2t-\frac\pi4\right)
}.
$$

This form displays the steady amplitude and phase shift directly.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 6 Summary {#block-6-summary-45}

```{=latex}
\Needspace{10\baselineskip}
```
For a series resistor-inductor circuit:

$$
L I'+RI=E(t).
$$

```{=latex}
\Needspace{10\baselineskip}
```
After division by $L$:

$$
I'+\frac RL I=\frac{E(t)}L.
$$

For constant voltage, the current approaches $E/R$. For periodic voltage, the
solution generally contains a decaying transient plus a persistent periodic
response.

```{=latex}
\Needspace{20\baselineskip}
```
## One Relaxation Pattern Behind Several Models {#block-7-one-relaxation-pattern-behind-several-models}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-46}

The goal is to recognise that several apparently unrelated applications have
the same mathematical skeleton.

```{=latex}
\Needspace{10\baselineskip}
```
The repeated pattern is:

$$
\boxed{X'=a-bX},
\qquad b>0.
$$

The input $a$ pushes the state upward, while the loss term $bX$ grows with the
state itself.

```{=latex}
\Needspace{12\baselineskip}
```
### Equilibrium Plus A Decaying Deviation {#equilibrium-plus-a-decaying-deviation-47}

```{=latex}
\Needspace{10\baselineskip}
```
An equilibrium $X_*$ satisfies $X'=0$. Apply this to:

$$
X'=a-bX.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Set the derivative to zero:

$$
0=a-bX_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
\boxed{X_*=\frac ab}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Define the deviation from equilibrium:

$$
z(t)=X(t)-X_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Because $X_*$ is constant:

$$
z'=X'.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $X=z+X_*$ into the model:

$$
z'=a-b(z+X_*).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Expand:

$$
z'=a-bz-bX_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $z'=a-bz-bX_*$ and $bX_*=b(a/b)=a$:

$$
z'=a-bz-a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
z'=-bz.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The deviation is:

$$
z(t)=z(0)e^{-bt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now calculate the initial deviation. Since $X(0)=X_0$:

$$
z(0)=X(0)-X_*=X_0-X_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this value into the formula for $z(t)$:

$$
z(t)=(X_0-X_*)e^{-bt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Return to $X=z+X_*$. In function notation:

$$
X(t)=z(t)+X_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the expression just found for $z(t)$:

$$
\begin{aligned}
X(t)
&=(X_0-X_*)e^{-bt}+X_* \\
&=X_*+(X_0-X_*)e^{-bt}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
X(t)=\frac ab+\left(X_0-\frac ab\right)e^{-bt}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### How The Applications Fit The Pattern {#how-the-applications-fit-the-pattern-48}

```{=latex}
\Needspace{10\baselineskip}
```
**Constant-environment heating or cooling**

$$
T'=-k(T-T_a)=kT_a-kT.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=kT_a,
\qquad
b=k,
\qquad
T_*=\frac{kT_a}{k}=T_a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
**Constant-volume mixing with constant inflow concentration**

$$
A'=r c_{\mathrm{in}}-\frac rV A.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=rc_{\mathrm{in}},
\qquad
b=\frac rV,
\qquad
A_*=Vc_{\mathrm{in}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
**Falling motion with linear drag**

$$
v'=g-\frac cmv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=g,
\qquad
b=\frac cm,
\qquad
v_*=\frac{mg}{c}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
**A resistor-inductor circuit with constant voltage**

$$
I'=\frac EL-\frac RL I.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Here:

$$
a=\frac EL,
\qquad
b=\frac RL,
\qquad
I_*=\frac ER.
$$

```{=latex}
\Needspace{10\baselineskip}
```
These are different stories, but each solution has the form:

$$
\boxed{
\text{state}
=
\text{equilibrium}
+
\text{decaying initial deviation}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
### The Time Constant {#the-time-constant-49}

```{=latex}
\Needspace{10\baselineskip}
```
The exponential factor in:

$$
X(t)=X_*+(X_0-X_*)e^{-bt},
$$

```{=latex}
\Needspace{10\baselineskip}
```
is controlled by $b$. We now **introduce a new symbol** for the reciprocal of
$b$. Define the time constant by:

$$
\boxed{\tau=\frac1b}.
$$

The symbol $\tau$ was not present in the original equation. It is convenient
shorthand for $1/b$.

```{=latex}
\Needspace{10\baselineskip}
```
Since $\tau=1/b$, we can rearrange this definition to obtain:

$$
b=\frac1\tau.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute $b=1/\tau$ into the exponential:

$$
e^{-bt}
=e^{-(1/\tau)t}
=e^{-t/\tau}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution can therefore be rewritten as:

$$
X(t)=X_*+(X_0-X_*)e^{-t/\tau}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $t=\tau$:

$$
e^{-t/\tau}
=e^{-\tau/\tau}
=e^{-1}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore the deviation from equilibrium has fallen to:

$$
e^{-1}\approx0.368
$$

of its initial value.

```{=latex}
\Needspace{10\baselineskip}
```
For the models above:

$$
\begin{array}{c|c}
\text{model} & \text{time constant} \\
\hline
\text{heating or cooling} & 1/k \\
\text{constant-volume mixing} & V/r \\
\text{linear drag} & m/c \\
\text{RL circuit} & L/R
\end{array}
$$

The time constant measures response speed. A smaller $\tau$ means the state
approaches equilibrium more quickly.

```{=latex}
\Needspace{12\baselineskip}
```
### A Fast Qualitative Check {#a-fast-qualitative-check-50}

```{=latex}
\Needspace{10\baselineskip}
```
For:

$$
X'=a-bX,
\qquad
X_*=\frac ab,
$$

```{=latex}
\Needspace{10\baselineskip}
```
first rearrange the equilibrium formula. From $X_*=a/b$:

$$
bX_*=a.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Now substitute $a=bX_*$ into the original rate equation:

$$
X'=bX_*-bX.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Factor out $b$:

$$
X'=b(X_*-X).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Finally, $X_*-X=-(X-X_*)$, so:

$$
X'
=b\bigl[-(X-X_*)\bigr]
=-b(X-X_*).
$$

If $X>X_*$, then $X-X_*>0$, so $X'<0$. The state decreases.

If $X<X_*$, then $X-X_*<0$, so $X'>0$. The state increases.

The derivative always points back toward equilibrium.

This sign check can reveal an incorrect model before any calculation is done.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 7 Summary {#block-7-summary-51}

```{=latex}
\Needspace{10\baselineskip}
```
The model:

$$
X'=a-bX,
\qquad b>0,
$$

```{=latex}
\Needspace{10\baselineskip}
```
has equilibrium $X_*=a/b$ and solution:

$$
\boxed{
X(t)=X_*+(X_0-X_*)e^{-bt}
}.
$$

Cooling, constant-volume mixing, linear drag, and constant-voltage RL circuits
all use this same relaxation pattern.

```{=latex}
\Needspace{20\baselineskip}
```
## Orthogonal Trajectories As A Geometric Application {#block-8-orthogonal-trajectories-as-a-geometric-application}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-52}

The goal is to find a family of curves that intersects every member of a given
curve family at right angles.

Unlike the balance models in earlier blocks, this application starts from
geometry. The derivative supplies the tangent slope needed to express
perpendicularity.

```{=latex}
\Needspace{12\baselineskip}
```
### The Negative-Reciprocal Rule {#the-negative-reciprocal-rule-53}

```{=latex}
\Needspace{10\baselineskip}
```
Suppose one curve has finite nonzero slope $m$ at an intersection point. A
perpendicular curve has slope:

$$
m_{\perp}=-\frac1m.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Their slopes satisfy:

$$
mm_{\perp}=-1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the original family has slope field:

$$
y'=f(x,y),
$$

```{=latex}
\Needspace{10\baselineskip}
```
then its orthogonal trajectories satisfy:

$$
\boxed{
y'=-\frac1{f(x,y)}
}.
$$

Horizontal and vertical tangents require care because one of the slopes may be
undefined. Geometrically, a horizontal tangent is perpendicular to a vertical
tangent.

```{=latex}
\Needspace{12\baselineskip}
```
### A Reliable Orthogonal-Trajectory Workflow {#a-reliable-orthogonal-trajectory-workflow-54}

#### Step 1: Differentiate the given family

Treat the family parameter as a constant.

#### Step 2: Eliminate the family parameter

Use the original family equation to express the slope using only $x$ and $y$.

#### Step 3: Replace the slope by its negative reciprocal

This constructs the differential equation of the orthogonal family.

#### Step 4: Solve the new differential equation

Use the appropriate first-order method.

#### Step 5: Check perpendicularity

At a common point where both slopes are finite and nonzero, verify that their
product is $-1$.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: Parabolas And Ellipses {#worked-example-parabolas-and-ellipses-55}

```{=latex}
\Needspace{10\baselineskip}
```
Find the orthogonal trajectories of the family:

$$
y=Cx^2.
$$

#### Step 1: Differentiate the given family

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate $y=Cx^2$ with respect to $x$, treating $C$ as constant:

$$
y'=2Cx.
$$

#### Step 2: Eliminate $C$

```{=latex}
\Needspace{10\baselineskip}
```
From the original family:

$$
y=Cx^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From the original family $y=Cx^2$, for $x\neq0$ solve for $C$:

$$
C=\frac{y}{x^2}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this expression into $y'=2Cx$:

$$
\begin{aligned}
y'
&=2\left(\frac{y}{x^2}\right)x \\
&=\frac{2y}{x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus the given parabola family has slope field:

$$
y'=\frac{2y}{x}.
$$

#### Step 3: Construct the perpendicular slope

```{=latex}
\Needspace{10\baselineskip}
```
Take the negative reciprocal:

$$
y'
=
-\frac{1}{2y/x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Simplify:

$$
\boxed{
y'=-\frac{x}{2y}
}.
$$

#### Step 4: Solve the orthogonal equation

```{=latex}
\Needspace{10\baselineskip}
```
Write the equation in differential form:

$$
\frac{dy}{dx}=-\frac{x}{2y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The orthogonal equation $dy/dx=-x/(2y)$ separates as:

$$
2y\,dy=-x\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides:

$$
\int2y\,dy=\int-x\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
This gives:

$$
y^2=-\frac{x^2}{2}+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply every term by $2$:

$$
2y^2=-x^2+2C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Move $x^2$ to the left:

$$
x^2+2y^2=2C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rename the arbitrary constant $2C_1$ as $K$:

$$
\boxed{
x^2+2y^2=K
}.
$$

These ellipses form the orthogonal family.

#### Step 5: Verify the slope product

```{=latex}
\Needspace{10\baselineskip}
```
Steps 1 and 2 showed that differentiating the original parabola family and
eliminating $C$ produces:

$$
\frac{dy}{dx}=\frac{2y}{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Call this original tangent slope $m_1$:

$$
m_1=\frac{2y}{x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For two curves to meet at a right angle, their finite nonzero slopes must be
negative reciprocals. Call the perpendicular slope $m_2$. Starting from
$m_1=2y/x$:

$$
\begin{aligned}
m_2
&=-\frac{1}{m_1} \\
&=-\frac{1}{2y/x} \\
&=-\frac{x}{2y}.
\end{aligned}
$$

This is the same orthogonal slope constructed in Step 3 and solved in Step 4.

```{=latex}
\Needspace{10\baselineskip}
```
At points where $x\neq0$ and $y\neq0$:

$$
\begin{aligned}
m_1m_2
&=\frac{2y}{x}\left(-\frac{x}{2y}\right) \\
&=-1.
\end{aligned}
$$

Therefore the two families meet at right angles wherever the slope-product
test applies.

```{=latex}
\Needspace{12\baselineskip}
```
### Worked Example: An Exponential Curve Family {#worked-example-an-exponential-curve-family-56}

```{=latex}
\Needspace{10\baselineskip}
```
Find the orthogonal trajectories of:

$$
y=Ce^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate the family:

$$
y'=2Ce^{2x}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $y=Ce^{2x}$, replace $Ce^{2x}$ by $y$:

$$
y'=2y.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The perpendicular slope is the negative reciprocal:

$$
\frac{dy}{dx}=-\frac1{2y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The orthogonal equation $dy/dx=-1/(2y)$ separates as:

$$
2y\,dy=-dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\int2y\,dy=\int-dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
y^2=-x+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rearrange:

$$
\boxed{
x+y^2=C
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To check the slopes, differentiate the orthogonal family:

$$
1+2yy'=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Solve for $y'$:

$$
y'=-\frac1{2y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The product with the original slope $2y$ is:

$$
(2y)\left(-\frac1{2y}\right)=-1,
$$

where $y\neq0$.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Orthogonal-Trajectory Errors {#common-orthogonal-trajectory-errors-57}

**Negating without taking a reciprocal.**

The perpendicular slope to $m$ is $-1/m$, not merely $-m$.

**Leaving the original parameter in the slope field.**

The parameter must be eliminated before the orthogonal differential equation
is solved.

**Taking the reciprocal of the family equation.**

Perpendicularity applies to tangent slopes, so differentiate first.

**Ignoring zero or undefined slopes.**

The algebraic product test $m_1m_2=-1$ applies only when both slopes are finite
and nonzero. The geometry still handles horizontal and vertical tangents.

```{=latex}
\Needspace{12\baselineskip}
```
### Block 8 Summary {#block-8-summary-58}

To find orthogonal trajectories:

1.  differentiate the given curve family
2.  eliminate its parameter
3.  replace the slope by its negative reciprocal
4.  solve the resulting first-order equation
5.  check the slope product where it is defined

The derivative converts a geometric right-angle condition into a differential
equation.

```{=latex}
\Needspace{20\baselineskip}
```
## Model Selection, Validation, And Common Mistakes {#block-9-model-selection-validation-and-common-mistakes}

```{=latex}
\Needspace{12\baselineskip}
```
### The Goal Of This Block {#the-goal-of-this-block-59}

The goal is to decide which model structure fits a description and to test
whether the resulting answer remains meaningful.

```{=latex}
\Needspace{12\baselineskip}
```
No keyword should replace reasoning from the mechanisms.

```{=latex}
\Needspace{8\baselineskip}
```
> classify the change process, not merely the vocabulary used in the
> question.

```{=latex}
\Needspace{12\baselineskip}
```
### A Model-Selection Map {#a-model-selection-map-60}

Use the following patterns as starting points.

```{=latex}
\Needspace{10\baselineskip}
```
**Constant relative rate**

$$
X'=kX.
$$

Look for a rate proportional to the current amount.

```{=latex}
\Needspace{10\baselineskip}
```
**Movement toward a fixed level**

$$
X'=-b(X-X_*),
\qquad b>0.
$$

Look for a state whose rate is proportional to its difference from an
equilibrium.

```{=latex}
\Needspace{10\baselineskip}
```
**Stored-material balance**

$$
A'=\text{rate in}-\text{rate out}.
$$

Build each material rate as concentration times volumetric flow.

```{=latex}
\Needspace{10\baselineskip}
```
**Force balance**

$$
m v'=\sum F.
$$

Choose a positive direction before assigning signs to the forces.

```{=latex}
\Needspace{10\baselineskip}
```
**Circuit voltage balance**

$$
L I'+RI=E(t).
$$

Identify which circuit elements and source terms are present.

```{=latex}
\Needspace{10\baselineskip}
```
**Perpendicular curve family**

$$
y'_{\perp}=-\frac1{y'_{\mathrm{given}}}.
$$

Differentiate and eliminate the original family parameter first.

```{=latex}
\Needspace{12\baselineskip}
```
### Calibration Is Not Prediction {#calibration-is-not-prediction-61}

Suppose a model contains an unknown parameter $k$.

Using observed data to determine $k$ is **calibration**. Evaluating the
calibrated formula at another time is **prediction**.

The algebra may be exact while the prediction remains approximate because:

-   observations may contain measurement error
-   the model assumptions may be only approximately true
-   parameters may change over time
-   prediction may extend beyond the observed interval

A numerical answer should therefore be interpreted at the precision supported
by the data and assumptions.

```{=latex}
\Needspace{12\baselineskip}
```
### Four Validation Checks {#four-validation-checks-62}

#### Check 1: Initial value

Substitute $t=0$ into the final formula. It must reproduce the given initial
state.

#### Check 2: Differential equation

Differentiate the proposed solution and substitute it into the model.

#### Check 3: Units

Every term in the differential equation must have the same units. Arguments
of exponentials and logarithms must be dimensionless.

For example, if $k$ has units of inverse minutes, then $kt$ has no units, so
$e^{-kt}$ is meaningful.

#### Check 4: Qualitative behaviour

Ask whether the sign, limiting value, and valid time interval fit the physical
or geometric situation.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Starting From A Memorised Solution {#common-mistake-starting-from-a-memorised-solution-63}

Writing an exponential formula before constructing the differential equation
hides the modelling decision.

```{=latex}
\Needspace{10\baselineskip}
```
For cooling, begin with:

$$
T'=-k(T-T_a),
$$

not with the final temperature formula.

```{=latex}
\Needspace{10\baselineskip}
```
For mixing, begin with:

$$
A'=\text{rate in}-\text{rate out},
$$

not with a generic exponential-decay expression.

The equation records why the state changes. The solution records what that
assumed mechanism predicts.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Using A Magnitude Without A Sign Convention {#common-mistake-using-a-magnitude-without-a-sign-convention-64}

In motion problems, "speed" is nonnegative but velocity is signed.

If downward is positive, a downward gravitational force is $+mg$. If upward
is positive, the same physical force is $-mg$.

State the positive direction before writing Newton's law, and keep it fixed
throughout the problem.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Ignoring The Model Domain {#common-mistake-ignoring-the-model-domain-65}

A formula may continue algebraically after the physical model has stopped
making sense.

Examples include:

-   using a variable-volume mixing formula after the tank empties
-   predicting a negative population from an inappropriate approximation
-   applying constant-ambient cooling when the environment changes
-   using a linear drag law outside the regime where it is reasonable

State restrictions alongside the final formula rather than leaving them
implicit.

```{=latex}
\Needspace{12\baselineskip}
```
### Common Mistake: Reporting A Number Without Its Meaning {#common-mistake-reporting-a-number-without-its-meaning-66}

A final answer should identify:

-   the measured quantity
-   its units
-   the time reference
-   any assumptions or interval restrictions needed to interpret it

```{=latex}
\Needspace{12\baselineskip}
```
For example, "$A(20)=\sqrt2$" is mathematically incomplete in an application.
A useful conclusion is:

```{=latex}
\Needspace{8\baselineskip}
```
> after $20$ minutes, while the tank still contains $40$ litres of solution,
> the model predicts $\sqrt2$ kilograms of dissolved material.

```{=latex}
\Needspace{12\baselineskip}
```
### Chapter Method Summary {#chapter-method-summary-67}

For a first-order application:

1.  define the state variable and units
2.  state assumptions, time origin, and sign convention
3.  construct the rate law from mechanisms
4.  check dimensions and qualitative signs
5.  classify and solve the differential equation
6.  apply each condition to a locally restated formula
7.  verify the equation and initial data
8.  interpret the result and state its valid domain

```{=latex}
\Needspace{12\baselineskip}
```
The main lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> a model is understandable when every term can be traced back to a mechanism
> and every conclusion can be traced forward from the solved equation.

```{=latex}
\Needspace{20\baselineskip}
```
## Original Practice Set {#block-10-original-practice-set}

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Problems {#practice-problems-68}

#### Problem 1: Translate A Balance Statement

A storage vessel contains a material amount $Q(t)$ in kilograms. Material
enters at $5$ kilograms per hour, is removed at $2$ kilograms per hour, and is
destroyed internally at a rate equal to $0.04Q$ kilograms per hour.

Write the differential equation and identify the units of $0.04$.

#### Problem 2: Calibrate Proportional Growth

A quantity grows at a rate proportional to its current size. It has value
$320$ at $t=0$ and value $400$ at $t=5$ days.

Find the model and its doubling time.

#### Problem 3: Calibrate Exponential Decay

A substance begins with mass $250$ grams. After $12$ hours, $40\%$ of the
initial mass remains.

Find the mass model and the time at which $100$ grams remain.

#### Problem 4: Model Cooling

An object at $98^\circ\mathrm C$ is placed in a room held at
$18^\circ\mathrm C$. After ten minutes the object is at $58^\circ\mathrm C$.

Assuming Newton's cooling model, find its temperature at time $t$ and the time
at which it reaches $28^\circ\mathrm C$.

#### Problem 5: Solve A Constant-Volume Mixing Model

A tank contains $90$ litres of solution and $9$ kilograms of dissolved salt.
Brine containing $0.2$ kilograms of salt per litre enters at $3$ litres per
minute. The well-mixed solution leaves at the same rate.

Find the amount of salt at time $t$ and its limiting value.

#### Problem 6: Solve A Variable-Volume Mixing Model

A tank initially contains $60$ litres of solution and $6$ kilograms of dye.
Fresh water enters at $2$ litres per minute, while well-mixed solution leaves
at $4$ litres per minute.

Find the amount of dye while the tank contains liquid. How much dye remains
when the volume is $30$ litres?

#### Problem 7: Model Falling Motion

A $5$ kilogram object is released from rest. Take downward as positive, use
$g=9.8$ metres per second squared, and assume linear drag with coefficient
$c=10$ kilograms per second.

Find the terminal velocity, velocity $v(t)$, and downward displacement $s(t)$
from the release point.

#### Problem 8: Model A Constant-Voltage Circuit

An RL circuit has $L=4$ henries, $R=8$ ohms, constant applied voltage
$E=24$ volts, and initial current $I(0)=1$ ampere.

Find the current and its limiting value.

#### Problem 9: Interpret A Relaxation Equation

```{=latex}
\Needspace{10\baselineskip}
```
Solve:

$$
X'=12-3X,
\qquad
X(0)=10.
$$

Identify the equilibrium and state whether the solution approaches it from
above or below.

#### Problem 10: Find Orthogonal Trajectories

```{=latex}
\Needspace{10\baselineskip}
```
Find the orthogonal trajectories of:

$$
y=Cx^3.
$$

Verify the slope product where it is defined.

#### Problem 11: Diagnose A Mixing Error

```{=latex}
\Needspace{10\baselineskip}
```
A tank receives liquid of concentration $c_{\mathrm{in}}$ at rate
$r_{\mathrm{in}}$ and loses well-mixed liquid at rate $r_{\mathrm{out}}$.
A student writes:

$$
A'=r_{\mathrm{in}}c_{\mathrm{in}}
-r_{\mathrm{out}}c_{\mathrm{in}}.
$$

Explain the error and write the correct model in terms of $A(t)$ and $V(t)$.

#### Problem 12: Compare Two Population Models

```{=latex}
\Needspace{10\baselineskip}
```
Two proposed models for a positive population are:

$$
\text{Model A:}
\qquad
N'=0.4N,
$$

```{=latex}
\Needspace{10\baselineskip}
```
and:

$$
\text{Model B:}
\qquad
N'=0.4N\left(1-\frac{N}{900}\right).
$$

For each model, describe the sign of $N'$ and the predicted long-term
behaviour. Explain which model contains a crowding effect.

```{=latex}
\Needspace{12\baselineskip}
```
### Practice Answers {#practice-answers-69}

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 1

Let $Q(t)$ be the stored amount in kilograms, with $t$ measured in hours.

```{=latex}
\Needspace{10\baselineskip}
```
Use:

$$
Q'
=
\text{rate in}
-
\text{rate out}
-
\text{rate destroyed}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute the three stated rates:

$$
Q'=5-2-0.04Q.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{Q'=3-0.04Q}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
In $Q'=3-0.04Q$, the derivative $Q'$ is measured in kilograms per hour, so
the product $0.04Q$ must also be measured in kilograms per hour. Hence $0.04$
has units:

$$
\boxed{\text{hour}^{-1}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 2

```{=latex}
\Needspace{10\baselineskip}
```
Let $N(t)$ be the quantity after $t$ days. Proportional growth gives:

$$
N'=kN,
\qquad k>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $N(0)=320$, the solution is:

$$
N(t)=320e^{kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use the observation $N(5)=400$:

$$
400=320e^{5k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $320$:

$$
\frac54=e^{5k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Take natural logarithms:

$$
\ln\left(\frac54\right)=5k.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
k=\frac15\ln\left(\frac54\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The calibrated model is:

$$
\boxed{
N(t)=320\left(\frac54\right)^{t/5}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The doubling time satisfies $e^{kT_d}=2$, so:

$$
\begin{aligned}
T_d
&=\frac{\ln2}{k} \\
&=\frac{5\ln2}{\ln(5/4)} \\
&\approx15.53\text{ days}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 3

```{=latex}
\Needspace{10\baselineskip}
```
Let $M(t)$ be the mass in grams after $t$ hours. Exponential decay has the
form:

$$
M(t)=250e^{-\lambda t},
\qquad \lambda>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
After $12$ hours, $40\%$ of the initial mass remains:

$$
M(12)=0.4(250)=100.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this observation into the model:

$$
100=250e^{-12\lambda}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $250$:

$$
0.4=e^{-12\lambda}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{-12\lambda}=0.4$, the mass model may be written directly as:

$$
\boxed{
M(t)=250(0.4)^{t/12}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The question asks when $100$ grams remain. This is exactly the calibration
observation:

$$
\boxed{t=12\text{ hours}}.
$$

The repeated value is a useful reading check: no further logarithmic
calculation is required.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 4

Let $T(t)$ be the temperature in degrees Celsius after $t$ minutes. The room
temperature is $T_a=18$, and $T(0)=98$.

```{=latex}
\Needspace{10\baselineskip}
```
Newton's cooling formula is:

$$
T(t)=T_a+(T_0-T_a)e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $T_a=18$ and $T_0=98$:

$$
T(t)=18+80e^{-kt}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $T(10)=58$:

$$
58=18+80e^{-10k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $18$:

$$
40=80e^{-10k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
From $40=80e^{-10k}$, divide by $80$:

$$
\frac12=e^{-10k}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
k=\frac{\ln2}{10}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The calibrated model is:

$$
\boxed{
T(t)=18+80\left(\frac12\right)^{t/10}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
To find when $T=28$, substitute into the calibrated formula:

$$
28=18+80\left(\frac12\right)^{t/10}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Subtract $18$ and divide by $80$:

$$
\frac18=\left(\frac12\right)^{t/10}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $1/8=(1/2)^3$:

$$
\frac{t}{10}=3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{t=30\text{ minutes}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 5

Let $A(t)$ be the kilograms of salt after $t$ minutes. Equal inflow and
outflow rates keep the volume at $90$ litres.

```{=latex}
\Needspace{10\baselineskip}
```
The incoming salt rate is:

$$
(0.2)(3)=0.6
\quad\text{kilograms per minute}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The outgoing concentration is $A/90$, so the outgoing salt rate is:

$$
3\frac{A}{90}=\frac{A}{30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The balance equation is:

$$
A'=0.6-\frac{A}{30},
$$

```{=latex}
\Needspace{10\baselineskip}
```
or:

$$
A'+\frac1{30}A=0.6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium amount satisfies:

$$
0=0.6-\frac{A_*}{30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
A_*=18.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The decay rate toward equilibrium is $1/30$, so:

$$
A(t)=18+Ce^{-t/30}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $A(0)=9$ in $A(t)=18+Ce^{-t/30}$:

$$
9=18+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore $C=-9$, and:

$$
\boxed{
A(t)=18-9e^{-t/30}
\quad\text{kilograms}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $e^{-t/30}\to0$:

$$
\boxed{A(t)\to18\text{ kilograms}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 6

Let $A(t)$ be the kilograms of dye and $V(t)$ the litres of solution after
$t$ minutes.

```{=latex}
\Needspace{10\baselineskip}
```
The volume rate is:

$$
V'=2-4=-2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $V(0)=60$:

$$
V(t)=60-2t.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The tank contains liquid while:

$$
0\le t<30.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Fresh water contributes no dye. The outgoing dye rate is:

$$
4\frac{A}{60-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The balance "zero rate in minus outgoing dye rate" therefore gives:

$$
A'=-\frac{4A}{60-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate the variables:

$$
\frac1A\,dA=-\frac4{60-2t}\,dt.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate both sides. With $u=60-2t$ and $du=-2dt$:

$$
\begin{aligned}
\ln A
&=\int-\frac4{60-2t}\,dt \\
&=2\ln(60-2t)+C_1.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Exponentiating gives:

$$
A=C(60-2t)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $A(0)=6$:

$$
6=C(60)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence:

$$
A(t)
=
6\left(\frac{60-2t}{60}\right)^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{
A(t)=6\left(1-\frac{t}{30}\right)^2,
\qquad 0\le t<30
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
When the volume is $30$ litres:

$$
60-2t=30,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so $t=15$ minutes. Then:

$$
\begin{aligned}
A(15)
&=6\left(1-\frac{15}{30}\right)^2 \\
&=6\left(\frac12\right)^2 \\
&=1.5.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{1.5\text{ kilograms of dye remain}}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 7

```{=latex}
\Needspace{10\baselineskip}
```
Take downward as positive. Newton's law with linear drag is:

$$
m v'=mg-cv.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $m=5$, $g=9.8$, and $c=10$:

$$
5v'=49-10v.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $5$:

$$
v'+2v=9.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At terminal velocity, $v'=0$:

$$
2v_{\infty}=9.8.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\boxed{v_{\infty}=4.9\text{ metres per second}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
With $v(0)=0$, the velocity formula is:

$$
\begin{aligned}
v(t)
&=v_{\infty}+(v_0-v_{\infty})e^{-2t} \\
&=4.9+(0-4.9)e^{-2t}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus:

$$
\boxed{
v(t)=4.9(1-e^{-2t})
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For downward displacement $s(t)$ with $s(0)=0$:

$$
s'(t)=4.9(1-e^{-2t}).
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
s(t)=4.9t+2.45e^{-2t}+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $s(0)=0$:

$$
0=2.45+C,
$$

```{=latex}
\Needspace{10\baselineskip}
```
Using $s(0)=0$ in $s(t)=4.9t+2.45e^{-2t}+C$ gives $C=-2.45$.
Therefore:

$$
\boxed{
s(t)=4.9t-2.45(1-e^{-2t})
\quad\text{metres}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 8

```{=latex}
\Needspace{10\baselineskip}
```
The circuit equation is:

$$
L I'+RI=E.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Insert $L=4$, $R=8$, and $E=24$:

$$
4I'+8I=24.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Divide by $4$:

$$
I'+2I=6.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The limiting current satisfies:

$$
0+2I_{\infty}=6,
$$

```{=latex}
\Needspace{10\baselineskip}
```
so:

$$
\boxed{I_{\infty}=3\text{ amperes}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The complete solution has the form:

$$
I(t)=3+Ce^{-2t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $I(0)=1$ in $I(t)=3+Ce^{-2t}$:

$$
1=3+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Thus $C=-2$, and:

$$
\boxed{
I(t)=3-2e^{-2t}
\quad\text{amperes}
}.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 9

```{=latex}
\Needspace{10\baselineskip}
```
Start from:

$$
X'=12-3X.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The equilibrium satisfies:

$$
0=12-3X_*.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
X_*=4.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Rewrite the equation around the equilibrium:

$$
X'=-3(X-4).
$$

```{=latex}
\Needspace{10\baselineskip}
```
The solution is:

$$
X(t)=4+Ce^{-3t}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Use $X(0)=10$ in $X(t)=4+Ce^{-3t}$:

$$
10=4+C.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Hence $C=6$, and:

$$
\boxed{X(t)=4+6e^{-3t}}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Since $6e^{-3t}>0$ for finite $t$:

$$
X(t)>4.
$$

The solution approaches the equilibrium $4$ from above.

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 10

```{=latex}
\Needspace{10\baselineskip}
```
Begin with the curve family:

$$
y=Cx^3.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Differentiate with respect to $x$:

$$
y'=3Cx^2.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $x\neq0$, the original family gives:

$$
C=\frac{y}{x^3}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Substitute this into the slope expression:

$$
\begin{aligned}
y'
&=3\left(\frac{y}{x^3}\right)x^2 \\
&=\frac{3y}{x}.
\end{aligned}
$$

```{=latex}
\Needspace{10\baselineskip}
```
The orthogonal slope is the negative reciprocal:

$$
\frac{dy}{dx}=-\frac{x}{3y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Separate variables:

$$
3y\,dy=-x\,dx.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Integrate:

$$
\frac32y^2=-\frac12x^2+C_1.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Multiply by $2$ and rearrange:

$$
\boxed{x^2+3y^2=C},
$$

where $C=2C_1$ is an arbitrary constant.

```{=latex}
\Needspace{10\baselineskip}
```
The original slope found after eliminating the parameter is $3y/x$. Call it
$m_1$. The orthogonal slope used above is its negative reciprocal; call it
$m_2$:

$$
m_1=\frac{3y}{x},
\qquad
m_2=-\frac{x}{3y}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Where $x\neq0$ and $y\neq0$:

$$
\begin{aligned}
m_1m_2
&=\frac{3y}{x}\left(-\frac{x}{3y}\right) \\
&=-1.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 11

```{=latex}
\Needspace{10\baselineskip}
```
The student's outgoing term uses the incoming concentration. Under the
perfect-mixing assumption, liquid leaving the tank has the concentration
currently inside the tank:

$$
c_{\mathrm{out}}(t)=\frac{A(t)}{V(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore:

$$
\text{rate out}
=
r_{\mathrm{out}}\frac{A(t)}{V(t)}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
The correct balance equation is:

$$
\boxed{
A'(t)
=
r_{\mathrm{in}}c_{\mathrm{in}}
-
r_{\mathrm{out}}\frac{A(t)}{V(t)}
}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If the liquid flow rates are constant, the accompanying volume model is:

$$
V(t)=V_0+(r_{\mathrm{in}}-r_{\mathrm{out}})t.
$$

```{=latex}
\Needspace{12\baselineskip}
```
#### Answer 12

```{=latex}
\Needspace{10\baselineskip}
```
For Model A:

$$
N'=0.4N.
$$

```{=latex}
\Needspace{10\baselineskip}
```
If $N>0$, then:

$$
N'>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For Model A, the equation $N'=0.4N$ has the exponential-growth solution:

$$
N(t)=N_0e^{0.4t}.
$$

Thus Model A predicts unbounded growth as $t\to\infty$.

```{=latex}
\Needspace{10\baselineskip}
```
For Model B:

$$
N'=0.4N\left(1-\frac{N}{900}\right).
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $0<N<900$, both factors on the right are positive, so:

$$
N'>0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
At $N=900$:

$$
N'=0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
For $N>900$, the factor $1-N/900$ is negative, so:

$$
N'<0.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Therefore Model B drives positive solutions toward the equilibrium:

$$
\boxed{N=900}.
$$

```{=latex}
\Needspace{10\baselineskip}
```
Model B contains the crowding effect through the factor:

$$
1-\frac{N}{900}.
$$

This factor reduces the relative growth rate as the population approaches
$900$.

```{=latex}
\Needspace{12\baselineskip}
```
### Final Takeaway {#final-takeaway-70}

First-order applications become manageable when the modelling and solution
stages remain separate.

```{=latex}
\Needspace{10\baselineskip}
```
The reusable chain is:

$$
\begin{aligned}
&\text{define the state and units} \\
&\Longrightarrow\text{identify change mechanisms} \\
&\Longrightarrow\text{write and check the rate equation} \\
&\Longrightarrow\text{solve and apply data} \\
&\Longrightarrow\text{interpret, validate, and restrict the result}.
\end{aligned}
$$

```{=latex}
\Needspace{12\baselineskip}
```
The chapter's final lesson is:

```{=latex}
\Needspace{8\baselineskip}
```
> do not ask only which formula fits the words; ask which rate mechanism the
> words describe and whether the resulting equation behaves as the situation
> should.
