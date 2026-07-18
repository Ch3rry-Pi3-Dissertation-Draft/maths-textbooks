# From Situations To Equations: Models And Qualitative Reasoning

Chapter 1 taught us how to read a differential equation once it has already
been written.

This chapter asks an earlier question:

> where does the equation come from, and what can it tell us before we solve
> it?

A model is not a perfect copy of reality. It is a deliberate mathematical
description built for a particular purpose.

The same real system can have several useful models because different
questions require different levels of detail.

In this chapter, we will learn how to:

- choose variables and define a system boundary
- state assumptions instead of leaving them hidden
- translate verbal rate statements into differential equations
- use units to detect mistakes
- identify equilibria and directions of change without solving
- interpret interactions in coupled equations
- test, revise, and communicate a model responsibly

---

## Block 1: What A Mathematical Model Is For

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to separate a real system from the mathematical
description we choose to build around it.

A **mathematical model** is a collection of variables, relationships, and
assumptions designed to answer a question about a system.

The purpose comes first.

For example, a model of a city bus network might be built to estimate:

- average passenger waiting time
- fuel use
- crowding at particular stops
- the effect of adding one more bus

One equation is unlikely to answer all four questions equally well.

In everyday terms:

> a useful model keeps the parts of reality that matter for the question and
> deliberately leaves other parts out.

</details>

<details open>
<summary><strong>A Model Is Not The System Itself</strong></summary>

Suppose a support team receives technical requests throughout the day.

Let:

$$
B(t)
$$

represent the number of unresolved requests at time $t$.

For the backlog $B(t)$, one possible model is:

$$
B'(t)=12-0.25B(t)
$$

where $t$ is measured in hours.

This equation says:

- new requests arrive at an average rate of $12$ requests per hour
- the resolution rate is proportional to the current backlog
- the proportionality factor is $0.25$ per hour

The equation is not the support team.

It does not describe:

- the difficulty of individual requests
- lunch breaks
- priority customers
- staff absences
- sudden outages
- the fact that requests are whole objects rather than fractions

That does not automatically make the model poor.

Its quality depends on the question.

If we want the average backlog over a normal working day, the simplification
might be useful.

If we want to schedule one specialist during a major outage, it may be far too
crude.

The key idea:

> model quality is always judged relative to a purpose, a scale, and a range of
> conditions.

</details>

<details open>
<summary><strong>The Main Ingredients Of A Model</strong></summary>

A clear model identifies at least six ingredients.

### 1. The question

What are we trying to understand, estimate, predict, or control?

### 2. The system boundary

What is inside the model, and what is treated as an external influence?

### 3. State variables

Which quantities describe the current condition of the system?

In the support example, the state is:

$$
B(t)
$$

### 4. Inputs

Which influences come from outside the model?

The arrival rate of new requests may be treated as an input.

### 5. Parameters

Which fixed values describe rates, strengths, capacities, or efficiencies?

In:

$$
B'=12-0.25B
$$

the values $12$ and $0.25$ are parameters.

### 6. Outputs

Which quantities will be reported or compared with observations?

Possible outputs include the predicted backlog after four hours or the time at
which the backlog falls below a chosen threshold.

</details>

<details open>
<summary><strong>Continuous And Discrete Descriptions</strong></summary>

A **continuous variable** can take any value in an interval.

Examples include:

- temperature
- elapsed time
- fluid volume
- position

A **discrete variable** changes in separate steps or counts.

Examples include:

- number of buses
- number of messages
- number of daily inspections
- number of components that have failed

Ordinary differential equations are naturally built for continuous variables.

However, a continuous model is sometimes used as an approximation to a large
discrete count.

The backlog $B(t)$ is technically an integer count, but if hundreds of requests
are involved, a smooth average may still be informative.

If individual events or small counts matter, a difference equation, stochastic
model, or event-based simulation may be more appropriate.

What this means:

> choosing a differential equation is already a modelling assumption about
> how finely we need to represent change.

</details>

<details open>
<summary><strong>Assumptions Should Be Visible</strong></summary>

The model:

$$
B'=12-0.25B
$$

contains several assumptions even though they are not written as equations.

It assumes that:

- the average arrival rate remains near $12$ per hour
- the team's effective resolution factor remains near $0.25$ per hour
- more unresolved requests lead to a larger total resolution rate
- random fluctuations can be smoothed into average rates
- one state variable is enough to describe the backlog

Hidden assumptions are difficult to test.

Written assumptions can be compared with evidence.

A good modelling habit is to place the assumptions beside the equation rather
than treating them as an afterthought.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

A model is a purpose-built representation, not a duplicate of reality.

Its essential ingredients include:

- a question
- a boundary
- state variables
- inputs
- parameters
- outputs
- explicit assumptions

The choice between continuous and discrete mathematics depends on the scale of
the question and the detail required.

</details>

---

## Block 2: Modelling As An Iterative Process

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to replace the idea of a one-way calculation with an
iterative modelling process.

The process can be organised as:

$$
\text{question}
\longrightarrow
\text{assumptions}
\longrightarrow
\text{equations}
\longrightarrow
\text{analysis}
\longrightarrow
\text{comparison}
\longrightarrow
\text{revision}
$$

The final arrow returns us to earlier choices.

Real modelling usually involves several passes through this loop.

</details>

<details open>
<summary><strong>A Running Example: A Bicycle Repair Queue</strong></summary>

A shared bicycle operator wants to estimate how many bicycles are waiting for
repair during an ordinary week.

Let:

$$
D(t)
$$

be the number of bicycles awaiting repair, where $t$ is measured in days.

Suppose historical averages suggest:

- about $7$ bicycles enter the repair queue per day
- the team repairs a fraction of the current queue each day
- the effective repair fraction is approximately $0.35$ per day

For the bicycle-repair queue, the modelling question is:

> how does the repair queue tend to change, and around what size might it
> settle?

This is not yet an equation.

It is a modelling question plus a small set of proposed assumptions.

</details>

<details open>
<summary><strong>From A Flow Description To An Equation</strong></summary>

The queue changes through an inflow and an outflow.

The general balance rule is:

$$
\text{rate of change}
=
\text{rate in}
-
\text{rate out}
$$

For the repair queue:

$$
\text{rate in}=7
$$

and:

$$
\text{rate out}=0.35D
$$

Therefore:

$$
\boxed{D'(t)=7-0.35D(t)}
$$

Every term has units of bicycles per day.

The sign of each term reflects its role:

- $+7$ adds bicycles to the queue
- $-0.35D$ removes bicycles from the queue

Another way to see it:

> the derivative records the net result of all processes that add to or remove
> from the state.

</details>

<details open>
<summary><strong>Analysis Before Exact Solution</strong></summary>

We can learn something immediately by asking when the queue stops changing.

Set:

$$
D'=0
$$

Then:

$$
7-0.35D=0
$$

Add $0.35D$ to both sides:

$$
7=0.35D
$$

Divide by $0.35$:

$$
\begin{aligned}
D
&=\frac{7}{0.35} \\
&=20.
\end{aligned}
$$

Now inspect the sign of $D'$ in the model $D'=7-0.35D$.

For $D'=7-0.35D$, if:

$$
D<20
$$

then:

$$
7-0.35D>0
$$

and the queue tends to grow.

For the same model, if:

$$
D>20
$$

then:

$$
7-0.35D<0
$$

and the queue tends to shrink.

Both directions point toward $D=20$.

We have obtained a meaningful prediction without solving for $D(t)$.

</details>

<details open>
<summary><strong>Compare The Model With Evidence</strong></summary>

Suppose observed queues over several weeks usually settle between $18$ and
$23$ bicycles.

That supports the model's equilibrium prediction of $20$.

But suppose the data also show that the queue drops by at most $10$ bicycles in
one day, even after a large disruption.

In the bicycle-repair model, the outflow term:

$$
0.35D
$$

predicts more than $10$ repairs per day whenever:

$$
0.35D>10
$$

Starting from $0.35D>10$, divide both sides by the positive number $0.35$:

$$
\begin{aligned}
D
&>\frac{10}{0.35} \\
&\approx 28.6.
\end{aligned}
$$

That may exceed the physical capacity of the team.

The simple model could work near ordinary queue sizes and fail for unusually
large backlogs.

This is not unusual.

Models often have a **domain of credibility**: a range of states and times in
which their assumptions are plausible.

</details>

<details open>
<summary><strong>Revise Without Adding Unnecessary Detail</strong></summary>

If repair capacity is limited to $10$ bicycles per day, a revised outflow could
be:

$$
\min(0.35D,10)
$$

Replacing the original outflow by $\min(0.35D,10)$ gives the revised model:

$$
D'
=
7-
\min(0.35D,10)
$$

This model is more realistic for large queues.

It is also less smooth because its rule changes when:

$$
0.35D=10
$$

A more detailed model is not automatically better.

We should add complexity only when it improves the answer to the stated
question enough to justify the extra effort.

The practical meaning:

> revise a model in response to a specific failure, not merely because reality
> contains more detail.

</details>

<details open>
<summary><strong>Communicate The Result In Context</strong></summary>

A modelling conclusion should not be reported as an isolated number.

Instead of saying:

> the answer is 20.

Instead, report the contextual conclusion:

> under stable arrival and proportional repair assumptions, the model predicts
> that an ordinary repair queue is drawn toward about 20 bicycles; the model
> should be revised for queues large enough to exceed daily repair capacity.

This statement includes:

- the prediction
- the assumptions
- the interpretation
- the limitation

Communication is part of modelling, not decoration added after the mathematics.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Modelling is an iterative process:

1. ask a focused question
2. choose a system boundary and variables
3. state assumptions
4. formulate relationships
5. analyse the mathematics
6. compare predictions with evidence
7. revise where the model fails
8. communicate conclusions with limitations

The cycle continues as new evidence or new questions appear.

</details>

---

## Block 3: Translating Language Into Rate Equations

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to recognise common verbal structures and translate
them into mathematical terms.

The translation should preserve:

- which quantity changes
- what increases it
- what decreases it
- which effects depend on the current state
- the units of every term

</details>

<details open>
<summary><strong>A Small Translation Dictionary</strong></summary>

If $X=X(t)$, then:

> the rate of change of $X$

becomes:

$$
X'(t)
$$

The phrase:

> increases at a constant rate $a$

contributes:

$$
+a
$$

The phrase:

> decreases at a constant rate $b$

contributes:

$$
-b
$$

The phrase "changes at a rate proportional to $X$" contributes a term of the
form:

$$
kX
$$

The sign and units of $k$ must be determined from the context.

The phrase:

> proportional to the difference between $X$ and a target $X_*$

suggests:

$$
k(X-X_*)
$$

or:

$$
k(X_*-X)
$$

depending on the intended direction of change.

</details>

<details open>
<summary><strong>Example: A Data Buffer</strong></summary>

Let $S(t)$ be the amount of data waiting in a processing buffer, measured in
gigabytes.

Suppose:

- data arrive at $18$ gigabytes per minute
- processing removes data at a rate proportional to the amount waiting
- the processing factor is $0.6$ per minute

For this buffer, the rate balance is:

$$
S'
=
\text{arrival rate}
-
\text{processing rate}
$$

Therefore:

$$
\boxed{S'(t)=18-0.6S(t)}
$$

The constant inflow appears with a positive sign.

The state-dependent outflow appears with a negative sign.

Read it this way:

> more queued data produces more total processing, which pushes the buffer
> back down when it becomes large.

</details>

<details open>
<summary><strong>Example: A Second-Order Force Balance</strong></summary>

First derivatives describe rates such as velocity.

Second derivatives describe changes in those rates, such as acceleration.

Suppose $y(t)$ is the vertical position of a small test vehicle.

Assume the vertical forces are:

- upward thrust $T(t)$
- downward weight $mg$
- linear drag opposing motion, with force $-cy'(t)$

Newton's force balance gives:

$$
m y''(t)
=
T(t)-mg-cy'(t)
$$

Starting from $my''(t)=T(t)-mg-cy'(t)$, add $cy'(t)$ to both sides:

$$
\boxed{m y''+cy'=T(t)-mg}
$$

Here:

- $m$ is mass
- $g$ is gravitational acceleration
- $c$ measures drag strength
- $T(t)$ is an external input
- $y$ is the state
- $y'$ and $y''$ are velocity and acceleration

This model is second order because acceleration appears.

</details>

<details open>
<summary><strong>States, Inputs, And Parameters Are Different Roles</strong></summary>

In:

$$
m y''+cy'=T(t)-mg
$$

the symbols do not all play the same role.

The state is:

$$
y(t)
$$

For the force-balance model $my''+cy'=T(t)-mg$, the input is:

$$
T(t)
$$

The parameters are:

$$
m,
\quad
c,
\quad
g
$$

A state changes as the system evolves.

An input is imposed from outside the chosen system boundary.

A parameter is treated as fixed during the model run, even though it may be
estimated from data or changed between scenarios.

The same physical quantity can play different roles in different models.

For example, thrust could be a prescribed input in one model and the output of
a motor model in another.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Verbal modelling statements can often be organised around:

$$
\text{net rate}
=
\text{positive contributions}
-
\text{negative contributions}
$$

Translation requires more than replacing words with symbols.

We must identify the roles of states, inputs, and parameters, choose signs from
the context, and preserve units.

</details>

---

## Block 4: Units As A Built-In Error Check

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to use dimensional consistency to test a proposed
model.

An equation can be algebraically neat and still be physically meaningless if
its terms have incompatible units.

The basic rule is:

> quantities that are added or equated must have matching dimensions.

</details>

<details open>
<summary><strong>Checking The Buffer Model</strong></summary>

Recall:

$$
S'=18-0.6S
$$

where:

$$
[S]=\text{gigabytes}
$$

and:

$$
[t]=\text{minutes}
$$

Therefore:

$$
[S']
=
\frac{\text{gigabytes}}{\text{minute}}
$$

In the buffer model $S'=18-0.6S$, the arrival rate $18$ must have units:

$$
\frac{\text{gigabytes}}{\text{minute}}
$$

For $0.6S$ to have the same units, the factor $0.6$ must have units:

$$
\frac{1}{\text{minute}}
$$

The units combine correctly because:

$$
\frac{1}{\text{minute}}
\times
\text{gigabytes}
=
\frac{\text{gigabytes}}{\text{minute}}
$$

Every term is dimensionally compatible.

</details>

<details open>
<summary><strong>Finding The Units Of An Unknown Parameter</strong></summary>

Suppose a contaminant concentration $C(t)$, measured in milligrams per litre,
is modelled by:

$$
C'=-kC^2
$$

Time is measured in hours.

The derivative has units:

$$
[C']
=
\frac{\text{mg}}{\text{L}\cdot\text{hour}}
$$

The square has units:

$$
[C^2]
=
\frac{\text{mg}^2}{\text{L}^2}
$$

For $C'=-kC^2$, dimensional consistency requires:

$$
[k][C^2]=[C']
$$

Therefore:

$$
\begin{aligned}
[k]
&=
\frac{[C']}{[C^2]} \\
&=
\frac{\text{mg}/(\text{L}\cdot\text{hour})}
{\text{mg}^2/\text{L}^2} \\
&=
\frac{\text{L}}{\text{mg}\cdot\text{hour}}.
\end{aligned}
$$

The units of a proportionality parameter depend on the expression it
multiplies.

In simple terms:

> a parameter is not just a number; its units are part of its meaning.

</details>

<details open>
<summary><strong>Detecting An Invalid Sum</strong></summary>

Suppose someone writes:

$$
S'=18-S
$$

while $S$ is measured in gigabytes and $t$ in minutes.

Then:

$$
[S']
=
\frac{\text{gigabytes}}{\text{minute}}
$$

In the proposed invalid sum $S'=18-S$, however:

$$
[S]
=
\text{gigabytes}
$$

These cannot be subtracted directly.

The equation needs a rate parameter, such as:

$$
S'=18-\alpha S
$$

with:

$$
[\alpha]
=
\frac{1}{\text{minute}}
$$

Dimensional analysis does not prove that a model is correct.

It can prove that some models are inconsistent.

</details>

<details open>
<summary><strong>Initial Conditions Carry Units Too</strong></summary>

If:

$$
S(0)=8
$$

then the value $8$ means:

$$
8\ \text{gigabytes}
$$

The input $0$ means:

$$
0\ \text{minutes}
$$

Writing units beside variable definitions and reported parameter values helps
prevent silent interpretation errors.

This becomes especially important when data arrive in mixed units, such as
seconds and hours or metres and kilometres.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

Dimensional consistency requires every additive term in a rate equation to
share the units of the derivative.

Units help us:

- interpret parameters
- detect missing conversion factors
- reject impossible sums
- communicate initial conditions and outputs clearly

Units are part of the model, not labels added after the calculation.

</details>

---

## Block 5: Learning From A Model Without Solving It

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to extract behaviour directly from the differential
equation.

An exact formula is valuable, but it is not the only form of understanding.

Qualitative questions include:

- where is the state increasing or decreasing?
- where is the rate zero?
- which states attract nearby behaviour?
- which values are physically impossible?
- what happens over short and long time scales?

</details>

<details open>
<summary><strong>Equilibrium States</strong></summary>

An **equilibrium** is a state at which the model predicts no instantaneous
change.

For an autonomous equation:

$$
x'=f(x)
$$

equilibria satisfy:

$$
f(x)=0
$$

For the buffer model:

$$
S'=18-0.6S
$$

For the buffer model $S'=18-0.6S$, set $S'=0$:

$$
18-0.6S=0
$$

Add $0.6S$ to both sides:

$$
18=0.6S
$$

Divide by $0.6$:

$$
\begin{aligned}
S
&=\frac{18}{0.6} \\
&=30.
\end{aligned}
$$

The model predicts that a buffer containing $30$ gigabytes has balanced
arrival and processing rates.

</details>

<details open>
<summary><strong>Direction Of Change</strong></summary>

If:

$$
S<30
$$

then:

$$
18-0.6S>0
$$

so:

$$
S'>0
$$

and the amount waiting increases.

For the same buffer model, if:

$$
S>30
$$

then:

$$
18-0.6S<0
$$

so:

$$
S'<0
$$

and the amount waiting decreases.

We can summarise the direction as:

$$
S<30
\quad\Longrightarrow\quad
S\text{ moves upward}
$$

$$
S>30
\quad\Longrightarrow\quad
S\text{ moves downward}
$$

Both directions point toward $30$.

</details>

<details open>
<summary><strong>Stability</strong></summary>

An equilibrium is **stable** when nearby states tend to move toward it.

The equilibrium:

$$
S=30
$$

is stable because:

- states below $30$ increase
- states above $30$ decrease

The equation also tells us the instantaneous speed of movement.

For $S'=18-0.6S$, evaluate the rate at:

$$
S=10
$$

the rate is:

$$
S'=18-0.6(10)=12
$$

gigabytes per minute.

Using $S'=18-0.6S$, evaluate the rate at:

$$
S=50
$$

the rate is:

$$
S'=18-0.6(50)=-12
$$

gigabytes per minute.

The signs give direction. The magnitudes give instantaneous speed.

A useful interpretation:

> qualitative analysis turns the derivative into a local motion rule for the
> state.

</details>

<details open>
<summary><strong>Short-Term Usefulness Versus Long-Term Credibility</strong></summary>

Consider the simpler model:

$$
S'=18
$$

It predicts a constant increase of $18$ gigabytes per minute.

This could approximate the first few moments after processing stops.

But it predicts unlimited growth:

$$
S(t)=S(0)+18t
$$

A real buffer has finite capacity.

The model may therefore be useful over a short interval and impossible over a
long one.

Every prediction should be accompanied by a question:

> are the assumptions still credible at this time and state?

</details>

<details open>
<summary><strong>Analytical, Numerical, And Qualitative Information</strong></summary>

An **analytical solution** is an explicit or implicit mathematical expression
describing the solution.

A **numerical solution** approximates solution values at selected inputs.

A **qualitative analysis** describes features such as direction, equilibrium,
stability, and bounds.

These approaches answer different questions.

They are not competitors.

A strong investigation may use all three:

- qualitative reasoning to predict the overall behaviour
- numerical computation to obtain values
- analytical work to explain structure or verify the computation

When an exact formula is unavailable, useful mathematical reasoning is still
possible.

</details>

<details open>
<summary><strong>Block 5 Summary</strong></summary>

Without solving an ODE, we can often determine:

- equilibrium states
- signs of change
- local rates
- stability
- physical bounds
- likely failures of long-term extrapolation

Qualitative analysis asks what solutions do, not only what formula represents
them.

</details>

---

## Block 6: Coupled Models And Interaction Terms

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to read a model containing more than one state
variable.

When the rate of one state depends on another state, the equations are
**coupled**.

Coupling allows a model to represent exchange, feedback, competition,
cooperation, or shared constraints.

</details>

<details open>
<summary><strong>Example: Two Thermal Zones</strong></summary>

Consider two rooms connected by an open internal doorway.

Let:

$$
T_1(t)
$$

and:

$$
T_2(t)
$$

be their temperatures in degrees Celsius, with $t$ measured in hours.

The outside temperature is treated as a constant:

$$
T_{\mathrm{out}}=8
$$

Room 1 has a heater. Room 2 does not.

For these two connected rooms, one possible model is:

$$
\begin{aligned}
T_1'
&=
-0.12(T_1-8)
-0.05(T_1-T_2)
+1.5, \\
T_2'
&=
-0.10(T_2-8)
+0.05(T_1-T_2).
\end{aligned}
$$

The rates $T_1'$ and $T_2'$ are measured in degrees Celsius per hour.

</details>

<details open>
<summary><strong>Reading The Terms One At A Time</strong></summary>

In the first equation:

$$
-0.12(T_1-8)
$$

models exchange between room 1 and the outside.

If $T_1>8$, the term is negative and room 1 loses heat.

The term:

$$
-0.05(T_1-T_2)
$$

models exchange from room 1 toward room 2.

If $T_1>T_2$, it decreases $T_1$.

The term:

$$
+1.5
$$

is the heater input.

In the second equation:

$$
+0.05(T_1-T_2)
$$

has the opposite sign.

Heat leaving room 1 through the internal doorway enters room 2 in this idealised
exchange model.

Conceptually:

> paired interaction terms often appear with opposite signs because what one
> part of a closed exchange loses, another part gains.

</details>

<details open>
<summary><strong>A Local Calculation</strong></summary>

Suppose at one moment:

$$
T_1=22,
\qquad
T_2=18
$$

Then:

$$
\begin{aligned}
T_1'
&=
-0.12(22-8)-0.05(22-18)+1.5 \\
&=
-1.68-0.20+1.50 \\
&=
-0.38.
\end{aligned}
$$

Room 1 is cooling at that instant.

For room 2:

$$
\begin{aligned}
T_2'
&=
-0.10(18-8)+0.05(22-18) \\
&=
-1.00+0.20 \\
&=
-0.80.
\end{aligned}
$$

Room 2 is also cooling.

The heater slows the cooling of room 1, while heat transfer from room 1 slows
the cooling of room 2.

This calculation gives local behaviour without solving the coupled system.

</details>

<details open>
<summary><strong>The Model Boundary Changes The Interpretation</strong></summary>

If the two rooms form the system, the internal doorway term represents exchange
within the system.

The outside terms represent exchange across the system boundary.

The heater term represents external energy supplied to the system.

If we expanded the boundary to include the heating equipment and outside air,
the classification of inputs and internal states would change.

This illustrates why system boundaries must be stated explicitly.

</details>

<details open>
<summary><strong>Block 6 Summary</strong></summary>

Coupled equations describe interacting states.

To read a coupled model:

1. identify each state and its units
2. read each derivative as a net rate
3. inspect the sign of every interaction term
4. identify external inputs and boundary exchanges
5. evaluate the rates at representative states

We can learn a great deal from the structure before finding a full solution.

</details>

---

## Block 7: Model Quality, Computation, And Revision

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to decide what to do when a model is difficult to
solve or imperfectly matches observations.

The answer is not always to make the equation more complicated.

We need to ask which weakness matters for the question being studied.

</details>

<details open>
<summary><strong>Simplify Or Compute?</strong></summary>

When an exact solution is difficult, two broad options are available.

### Simplify the model

We may remove a weak effect, approximate a varying quantity as constant, or
focus on a restricted operating range.

The simplification should be documented and tested.

### Retain the model and approximate its solutions

Numerical methods can estimate solution values, while graphs and direction
fields can reveal structure.

The choice depends on the question.

If a small physical effect is central to the question, removing it is not a
good simplification even if it makes the equation easy.

</details>

<details open>
<summary><strong>Calibration And Validation</strong></summary>

**Calibration** uses data to estimate parameters.

For example, observed queue data might be used to estimate the repair factor:

$$
0.35\ \text{day}^{-1}
$$

**Validation** asks how well the calibrated model performs on evidence not used
to fit it.

Using the same data for both tasks can make a weak model appear stronger than
it is.

Validation should compare quantities that matter for the model's purpose, such
as:

- equilibrium level
- transient response
- maximum error
- timing of a threshold crossing
- behaviour under a new operating condition

</details>

<details open>
<summary><strong>Sensitivity To Parameters</strong></summary>

A **sensitivity analysis** asks how predictions change when parameters change.

For:

$$
D'=a-bD
$$

set the rate equal to zero:

$$
0=a-bD_*
$$

Add $bD_*$ to both sides:

$$
bD_*=a
$$

Assuming $b\neq 0$, divide by $b$. The equilibrium is:

$$
D_*=\frac{a}{b}
$$

Increasing $a$ raises the equilibrium.

Increasing $b$ lowers the equilibrium.

If a small uncertainty in $b$ creates a large change in the prediction, then
measuring $b$ accurately may be important.

If the output barely changes, a rough estimate may be enough.

Sensitivity connects mathematical analysis to decisions about data collection.

</details>

<details open>
<summary><strong>A Model Can Be Wrong And Still Useful</strong></summary>

Every model omits something.

The useful question is not:

> is this model a perfect description of reality?

The useful questions are:

- does it answer the intended question accurately enough?
- are its assumptions visible?
- is its domain of credibility understood?
- does it fail in a predictable way?
- is a more complex model worth its cost?

What to remember:

> responsible modelling combines mathematical analysis with evidence,
> assumptions, limitations, and judgement.

</details>

<details open>
<summary><strong>A Reusable Modelling Checklist</strong></summary>

Before accepting a model, check:

### Purpose

- Is the question specific?
- Is the requested output clear?

### Structure

- Are the state variables defined?
- Is the system boundary explicit?
- Are inputs and parameters distinguished?

### Mathematics

- Do the signs match the stated processes?
- Are units consistent?
- Are initial or boundary conditions available?

### Behaviour

- Are equilibria and directions reasonable?
- Does the model respect physical bounds?
- Is long-term extrapolation credible?

### Evidence

- How were parameters calibrated?
- Has the model been validated separately?
- Which observations would reveal failure?

### Communication

- Are assumptions and limitations reported with the prediction?

</details>

<details open>
<summary><strong>Block 7 Summary</strong></summary>

When exact analysis is difficult, we may simplify carefully, compute
numerically, reason qualitatively, or combine all three.

Model development continues through calibration, validation, sensitivity
analysis, and revision.

A useful conclusion includes its assumptions and range of credibility.

</details>

---

## Block 8: Original Practice Set

<details open>
<summary><strong>Practice Problems</strong></summary>

### Problem 1: Choose A Representation

For each quantity, decide whether a continuous or discrete description is more
natural:

1. the temperature of a refrigerated cabinet
2. the number of cabinet-door openings in one hour
3. the mass of ice inside the cabinet
4. the number of failed temperature sensors

### Problem 2: Build A Rate Balance

Let $E(t)$ be energy stored in a battery, measured in kilowatt-hours.

Solar input adds energy at $3$ kilowatts. Internal use removes energy at a rate
proportional to stored energy, with factor $0.08$ per hour.

Construct a differential equation for $E(t)$.

### Problem 3: Check Units

For the model in Problem 2, show that every term has units of kilowatt-hours
per hour.

### Problem 4: Reason Qualitatively

Find the equilibrium of the battery model and determine whether $E$ increases
or decreases above and below it.

### Problem 5: Criticise The Model

Suppose the physical battery capacity is $30$ kilowatt-hours. Explain what the
equilibrium from Problem 4 reveals about the model.

### Problem 6: Read A Coupled System

Two online services share incoming traffic. Let $X(t)$ and $Y(t)$ be their
queued workloads, measured in compute-hours:

$$
\begin{aligned}
X'&=6-0.4X-0.1(X-Y), \\
Y'&=4-0.3Y+0.1(X-Y).
\end{aligned}
$$

Interpret the constants, the self-removal terms, and the paired interaction
terms.

### Problem 7: Evaluate Local Behaviour

Using the system in Problem 6, calculate $X'$ and $Y'$ when:

$$
X=12,
\qquad
Y=8
$$

and interpret the signs.

### Problem 8: Choose An Investigation Method

Suppose a model has no convenient exact solution, but a manager needs the
predicted queue size at the end of each hour. Which type of method is most
directly useful: analytical, numerical, or qualitative? What additional value
could qualitative reasoning provide?

</details>

<details open>
<summary><strong>Practice Answers</strong></summary>

### Answer 1

Natural first choices are:

1. temperature: continuous
2. door openings: discrete
3. ice mass: continuous
4. failed sensors: discrete

A different representation may still be justified for a particular purpose.

### Answer 2

The stored energy changes by input minus internal use:

$$
E'
=
\text{solar input}
-
\text{internal use}
$$

Substitute the constant input $3$ and the proportional use $0.08E$:

$$
\boxed{E'=3-0.08E}
$$

### Answer 3

Since $E$ is measured in kilowatt-hours and $t$ in hours:

$$
[E']
=
\frac{\text{kWh}}{\text{hour}}
=
\text{kW}
$$

The input $3$ has units of kilowatts.

The parameter $0.08$ has units of $1/\text{hour}$, so:

$$
[0.08E]
=
\frac{1}{\text{hour}}\times\text{kWh}
=
\text{kW}
$$

### Answer 4

For the battery model $E'=3-0.08E$, an equilibrium satisfies $E'=0$.
Therefore:

$$
3-0.08E=0
$$

Add $0.08E$ to both sides:

$$
3=0.08E
$$

Divide by $0.08$:

$$
\begin{aligned}
E_*
&=\frac{3}{0.08} \\
&=37.5\ \text{kWh}.
\end{aligned}
$$

If $E<37.5$, then $E'>0$ and stored energy increases.

If $E>37.5$, then $E'<0$ and stored energy decreases.

### Answer 5

The predicted equilibrium exceeds the physical capacity of $30$ kWh.

The equation omits a charging limit or saturation rule. It may be useful below
capacity but cannot be trusted as a complete long-term battery model.

### Answer 6

The constants $6$ and $4$ are external workload arrival rates.

The terms $-0.4X$ and $-0.3Y$ represent processing that removes workload from
each service.

The transfer term in the first equation is:

$$
-0.1(X-Y)
$$

Paired with $-0.1(X-Y)$ in the first equation, the matching term in the
second equation is:

$$
+0.1(X-Y)
$$

transfers workload from the more heavily loaded service toward the less
heavily loaded service.

### Answer 7

At $X=12$ and $Y=8$:

$$
\begin{aligned}
X'
&=
6-0.4(12)-0.1(12-8) \\
&=
6-4.8-0.4 \\
&=
0.8,
\end{aligned}
$$

and:

$$
\begin{aligned}
Y'
&=
4-0.3(8)+0.1(12-8) \\
&=
4-2.4+0.4 \\
&=
2.0.
\end{aligned}
$$

Both queues are increasing at that instant, with $Y$ increasing faster.

### Answer 8

A numerical method most directly provides approximate values at the end of
each hour.

Qualitative reasoning can still check expected direction, equilibrium,
bounds, and whether the numerical results are plausible.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

Building a differential-equation model requires choices before calculation
begins.

We choose a purpose, boundary, variables, inputs, parameters, assumptions, and
level of detail.

Then we translate processes into rates, check units, analyse behaviour, compare
with evidence, and revise where needed.

The main lesson is:

> a model is useful when its mathematics, assumptions, evidence, and intended
> purpose are kept connected.

</details>
