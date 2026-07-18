# GMM EM Equations 58-70

This note walks through the Gaussian mixture model section of **The
Variational Approximation for Bayesian Inference (2008)**.

The previous note focused on variational Bayesian linear regression. The paper
then moves to **Gaussian mixture models**.

The main idea is:

> a dataset may not come from one Gaussian cloud; it may come from several
> Gaussian clouds mixed together.

This creates a natural hidden-variable problem.

For each observation, we observe:

$$
x_n
$$

but we do not observe:

$$
z_n
$$

where $z_n$ says which mixture component generated $x_n$.

Plain English:

> GMMs are about clustering when the cluster labels are hidden.

---

## Block 1: Equations (58)-(61)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to understand the basic probability model behind a
Gaussian mixture model.

The paper introduces:

- $X$, the observed random variable
- $Z$, the hidden component label
- $\pi_j$, the probability of choosing component $j$
- $p_j(x)$, the density of component $j$

If the components are Gaussian, then:

$$
p_j(x)
=
\mathcal{N}(x\mid \boldsymbol{\mu}_j,\Sigma_j)
$$

The main questions are:

1. How do we write the joint model over $X$ and $Z$?
2. How do we get the marginal density of $X$?
3. How does this become a Gaussian mixture?
4. Given an observation $x$, how do we compute the probability that component
   $j$ generated it?

Those four questions correspond to equations (58)-(61).

</details>

<details open>
<summary><strong>Notation Before We Start</strong></summary>

The notation can be confusing because the paper moves between random variables,
observed values, and whole datasets.

In this note:

- $X$ is the random variable for one observation
- $x$ is one realised value of that random variable
- $x_n$ is the $n^{\text{th}}$ observed data point
- $\mathcal{X}=\{x_1,\ldots,x_N\}$ is the whole dataset
- $Z$ is the random hidden component label for one observation
- $z_n$ is the hidden component label for the $n^{\text{th}}$ observation

The paper sometimes uses $X$ for one random observation and sometimes uses
$X$ for the whole dataset. That is common, but it can be confusing. In this
note, we use $\mathcal{X}$ when we mean the whole dataset, and $x_n$ when we
mean a specific observed data point.

Each observation may be one-dimensional or multidimensional. In the paper's
GMM section, the data points are written as vectors:

$$
x_n\in\mathbb{R}^d
$$

So each Gaussian component has:

$$
\boldsymbol{\mu}_j\in\mathbb{R}^d
$$

and:

$$
\Sigma_j\in\mathbb{R}^{d\times d}
$$

Plain English:

> a component mean is a centre point in the data space, and a covariance matrix
> describes the shape and spread of that component around its centre.

So when we write:

$$
p(X=x)
$$

we mean:

> the density of the random variable $X$ evaluated at the observed value $x$.

And when we write:

$$
p(Z=j\mid X=x)
$$

we mean:

> after seeing the value $x$, what is the probability that the hidden component
> label was $j$?

For continuous observations, $p(X=x)$ is technically a **density**, not a
probability mass. But the intuition is still:

> larger density means the model finds that value more plausible.

</details>

<details open>
<summary><strong>Figure 5: From One Gaussian To A Mixture</strong></summary>

Figure 5 compares two graphical models.

![Figure 5: Graphical models for a single Gaussian component and a Gaussian mixture model](assets/gmm_figure5_graphical_models.png)

The first graphical model is for a **single Gaussian component**.

It has:

$$
\boldsymbol{\mu},\Sigma
\longrightarrow
X
$$

This means:

> the observation $X$ is generated directly from one Gaussian distribution with
> mean $\boldsymbol{\mu}$ and covariance $\Sigma$.

Mathematically:

$$
X
\sim
\mathcal{N}(\boldsymbol{\mu},\Sigma)
$$

There is no hidden label because there is only one component.

The plate marked $N$ in the figure means:

> repeat this data-generating process for $N$ observations.

So for a dataset, the single-Gaussian model says:

$$
x_n
\overset{\mathrm{iid}}{\sim}
\mathcal{N}(\boldsymbol{\mu},\Sigma)
\quad
\text{for } n=1,\ldots,N
$$

All points come from the same Gaussian cloud.

The second graphical model is for a **Gaussian mixture model**.

It adds a hidden variable:

$$
Z
$$

The dependency structure is:

$$
\boldsymbol{\pi}
\longrightarrow
Z
\longrightarrow
X
$$

and:

$$
\{\boldsymbol{\mu}_j,\Sigma_j\}_{j=1}^{M}
\longrightarrow
X
$$

More explicitly:

1. Choose a hidden component label $Z$ using the mixing weights
   $\boldsymbol{\pi}$.
2. Generate $X$ from the Gaussian component selected by $Z$.

For a dataset, this is repeated for every observation:

$$
z_n
\sim
\mathrm{Categorical}(\boldsymbol{\pi})
$$

then:

$$
x_n\mid z_n=j
\sim
\mathcal{N}(\boldsymbol{\mu}_j,\Sigma_j)
$$

The means and covariances are shared component parameters. The hidden label
$z_n$ changes from point to point.

Plain English:

> Figure 5 shows that a GMM is a Gaussian model with one extra hidden decision:
> which Gaussian generated this observation?

</details>

<details open>
<summary><strong>The Generative Story</strong></summary>

A mixture model assumes that each data point is generated in two steps.

First, choose a component:

$$
Z=j
$$

with probability:

$$
p(Z=j)
=
\pi_j
$$

The mixing weights must satisfy:

$$
\pi_j\geq 0
$$

and:

$$
\sum_{j=1}^{M}\pi_j
=
1
$$

This is because the component choice is a probability distribution over the
$M$ possible components.

For example, with three components we might have:

$$
\boldsymbol{\pi}
=
(0.5,0.3,0.2)
$$

This says:

- component 1 is chosen 50% of the time before seeing the data point
- component 2 is chosen 30% of the time
- component 3 is chosen 20% of the time

Second, generate the observation from that component:

$$
X\mid Z=j
\sim
p_j(x)
$$

So:

$$
p(X=x\mid Z=j)
=
p_j(x)
$$

If the components are Gaussian, then:

$$
p(X=x\mid Z=j)
=
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Plain English:

> the mixture weight chooses the cluster; the component density generates the
> data point inside that cluster.

</details>

<details open>
<summary><strong>Equation (58): The Joint Model</strong></summary>

Equation (58) writes the joint density of the observation and the hidden
component label:

$$
p(X,Z)
=
p(X\mid Z)p(Z)
\tag{58}
$$

This is the product rule:

$$
p(A,B)
=
p(A\mid B)p(B)
$$

with:

$$
A=X,
\quad
B=Z
$$

So:

$$
p(X,Z)
=
p(X\mid Z)p(Z)
$$

In mixture-model language:

- $p(Z)$ says how likely each component is before observing $X$
- $p(X\mid Z)$ says how likely the observation is once the component is known

For example, if:

$$
Z=2
$$

then:

$$
p(X=x,Z=2)
=
p(X=x\mid Z=2)p(Z=2)
$$

Using mixture notation:

$$
p(X=x,Z=2)
=
p_2(x)\pi_2
$$

The order of the multiplication does not matter:

$$
p_2(x)\pi_2
=
\pi_2p_2(x)
$$

This product is an **unnormalised component score** for the explanation:

> component 2 generated the value $x$.

Plain English:

> the joint probability of "component 2 generated this point and the point has
> value $x$" is the probability of choosing component 2 times the probability
> that component 2 produces $x$.

</details>

<details open>
<summary><strong>Equation (59): Marginalising Out The Hidden Component</strong></summary>

Usually, we observe:

$$
X=x
$$

but we do not observe:

$$
Z
$$

So to get the density of $X$, we add over all possible hidden component labels.

The marginalisation rule for a discrete hidden variable is:

$$
p(X=x)
=
\sum_{j=1}^{M}
p(X=x,Z=j)
$$

This is the sum rule of probability.

For a small example with three possible hidden components:

$$
p(X=x)
=
p(X=x,Z=1)
+
p(X=x,Z=2)
+
p(X=x,Z=3)
$$

The observed value $x$ could have been produced by component 1, component 2, or
component 3. Since those possibilities are mutually exclusive, we add their
joint scores.

Now use equation (58):

$$
p(X=x,Z=j)
=
p(X=x\mid Z=j)p(Z=j)
$$

Substituting this into the marginalisation equation gives:

$$
p(X=x)
=
\sum_{j=1}^{M}
p(X=x\mid Z=j)p(Z=j)
$$

Using:

$$
p(Z=j)
=
\pi_j
$$

and:

$$
p(X=x\mid Z=j)
=
p_j(x)
$$

reproduce the marginalisation equation that receives those substitutions:

$$
p(X=x)
=
\sum_{j=1}^{M}
p(X=x\mid Z=j)p(Z=j)
$$

Now substitute both model definitions:

$$
p(X=x)
=
\sum_{j=1}^{M}
\pi_j p_j(x)
\tag{59}
$$

Plain English:

> since we do not know which component generated $x$, we score $x$ under every
> component and average those scores using the mixing weights.

</details>

<details open>
<summary><strong>A Small Numeric Example For Equation (59)</strong></summary>

Suppose there are two components:

$$
M=2
$$

and the mixing weights are:

$$
\pi_1=0.7,
\quad
\pi_2=0.3
$$

For a particular observed value $x$, suppose the component densities give:

$$
p_1(x)=0.10,
\quad
p_2(x)=0.40
$$

Then the mixture density is:

$$
p(x)
=
\pi_1p_1(x)+\pi_2p_2(x)
$$

Substituting:

$$
p(x)
=
0.7(0.10)+0.3(0.40)
$$

So:

$$
p(x)
=
0.07+0.12
=
0.19
$$

This tells us:

- component 1 was more likely before seeing $x$
- but component 2 explains this particular $x$ better
- the final density combines both facts

Plain English:

> a mixture density is a weighted vote across components.

</details>

<details open>
<summary><strong>Equation (60): The Gaussian Mixture Density</strong></summary>

Equation (59) gave the general mixture model:

$$
p(X=x)
=
\sum_{j=1}^{M}
\pi_j p_j(x)
$$

For a Gaussian mixture model, each component density is Gaussian:

$$
p_j(x)
=
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Now substitute this into equation (59):

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
\tag{60}
$$

This is the standard Gaussian mixture model density.

Each component has:

- a mixing weight $\pi_j$
- a mean $\boldsymbol{\mu}_j$
- a covariance matrix $\Sigma_j$

The mean controls the centre of the Gaussian component.

The covariance controls its spread and orientation.

The mixing weight controls how often that component is used.

So each term in the sum:

$$
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

has two parts:

- $\pi_j$ says how common component $j$ is overall
- $\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)$ says how well component $j$
  explains this particular value of $x$

Plain English:

> a GMM is a weighted sum of Gaussian clouds.

</details>

<details open>
<summary><strong>Why The Sum Makes The Likelihood Awkward</strong></summary>

For one observation, the density is:

$$
p(x_n)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

For a dataset:

$$
\mathcal{X}
=
\{x_1,\ldots,x_N\}
$$

the likelihood is:

$$
p(\mathcal{X})
=
\prod_{n=1}^{N}
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

The log likelihood is:

$$
\ln p(\mathcal{X})
=
\sum_{n=1}^{N}
\ln
\left[
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

The difficult part is:

$$
\ln
\left[
\sum_{j=1}^{M}
\cdots
\right]
$$

The log is outside the sum.

This is the same kind of problem we saw earlier with hidden variables.

Plain English:

> direct maximum likelihood is awkward because each data point could have come
> from any component, and the likelihood has to add over all those hidden
> possibilities.

This is why EM is natural for GMMs.

</details>

<details open>
<summary><strong>Equation (61): Responsibilities</strong></summary>

Equation (61) asks:

> after observing $x$, what is the probability that component $j$ generated it?

This probability is:

$$
P(j\mid x)
=
p(Z=j\mid X=x)
$$

This is different from the mixing weight:

$$
\pi_j
=
p(Z=j)
$$

The mixing weight is the **prior** probability of component $j$, before seeing
$x$.

The responsibility is the **posterior** probability of component $j$, after
seeing $x$.

Use Bayes' rule:

$$
p(Z=j\mid X=x)
=
\frac{
p(X=x\mid Z=j)p(Z=j)
}{
p(X=x)
}
$$

Now substitute the mixture-model pieces.

The likelihood under component $j$ is:

$$
p(X=x\mid Z=j)
=
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

The prior probability of component $j$ is:

$$
p(Z=j)
=
\pi_j
$$

The marginal density of $x$ from equation (60) is:

$$
p(x)
=
\sum_{\ell=1}^{M}
\pi_\ell
\mathcal{N}(x\mid\boldsymbol{\mu}_\ell,\Sigma_\ell)
$$

Before substituting, reproduce Bayes' rule:

$$
p(Z=j\mid X=x)
=
\frac{
p(X=x\mid Z=j)p(Z=j)
}{
p(X=x)
}
$$

Now substitute the component likelihood, the mixing weight, and the complete
mixture density into that formula:

$$
P(j\mid x)
=
\frac{
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
}{
\sum_{\ell=1}^{M}
\pi_\ell
\mathcal{N}(x\mid\boldsymbol{\mu}_\ell,\Sigma_\ell)
}
\tag{61}
$$

This is called the **responsibility** of component $j$ for observation $x$.

The numerator:

$$
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

is the unnormalised score for component $j$.

The denominator:

$$
\sum_{\ell=1}^{M}
\pi_\ell
\mathcal{N}(x\mid\boldsymbol{\mu}_\ell,\Sigma_\ell)
$$

is the total score across all possible components.

Dividing by the denominator turns the component scores into probabilities that
sum to one:

$$
\sum_{j=1}^{M}P(j\mid x)
=
1
$$

Plain English:

> component $j$ gets high responsibility if it had high prior weight and it
> explains the observed point well.

The left panel below plots the weighted component scores that equation (60)
adds. The right panel applies equation (61), dividing each score by their sum.

![Mixture density and posterior responsibilities](assets/gmm_em_mixture_and_responsibilities.png)

Both horizontal axes show the same observed value $x$. The left vertical axis
is a **density**, so its values need not lie between 0 and 1. The right vertical
axis is a **posterior probability**, so it is fixed to $[0,1]$. The mixture
parameters are held fixed throughout. Notice that the two responsibilities are
equal exactly where the two weighted component scores are equal: after dividing
equal numbers by the same total, each component receives responsibility $0.5$.

</details>

<details open>
<summary><strong>Responsibility Intuition With Numbers</strong></summary>

Use the same two-component example:

$$
\pi_1=0.7,
\quad
\pi_2=0.3
$$

and:

$$
p_1(x)=0.10,
\quad
p_2(x)=0.40
$$

The general responsibility formula is:

$$
P(j\mid x)
=
\frac{\pi_jp_j(x)}{\sum_{\ell=1}^{M}\pi_\ell p_\ell(x)}
$$

The unnormalised score for component 1 is:

$$
\pi_1p_1(x)
=
0.7(0.10)
=
0.07
$$

The unnormalised score for component 2 is:

$$
\pi_2p_2(x)
=
0.3(0.40)
=
0.12
$$

The denominator in the responsibility formula is the total score:

$$
0.07+0.12
=
0.19
$$

Before inserting numbers for component 1, reproduce the formula being used:

$$
P(1\mid x)
=
\frac{\pi_1p_1(x)}{\pi_1p_1(x)+\pi_2p_2(x)}
$$

Now substitute the values:

$$
P(1\mid x)
=
\frac{0.7(0.10)}{0.7(0.10)+0.3(0.40)}
=
\frac{0.07}{0.19}
\approx
0.368
$$

For component 2, the formula is:

$$
P(2\mid x)
=
\frac{\pi_2p_2(x)}{\pi_1p_1(x)+\pi_2p_2(x)}
$$

Substitute the same values:

$$
P(2\mid x)
=
\frac{0.3(0.40)}{0.7(0.10)+0.3(0.40)}
=
\frac{0.12}{0.19}
\approx
0.632
$$

Even though component 1 had the larger mixing weight, component 2 gets the
larger responsibility for this particular point because it explains $x$ much
better.

Plain English:

> responsibilities are soft cluster assignments.

A hard assignment would say:

$$
x \text{ belongs to component 2}
$$

A soft assignment says:

$$
P(1\mid x)=0.368,
\quad
P(2\mid x)=0.632
$$

So the model is leaning toward component 2, but it still keeps some uncertainty.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Equations (58)-(61) define the basic Gaussian mixture model.

Equation (58) writes the joint model:

$$
p(X,Z)
=
p(X\mid Z)p(Z)
$$

Equation (59) marginalises over the hidden component:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_jp_j(x)
$$

Equation (60) specialises this to Gaussian components:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Equation (61) computes the posterior responsibility:

$$
P(j\mid x)
=
\frac{
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
}{
\sum_{\ell=1}^{M}
\pi_\ell
\mathcal{N}(x\mid\boldsymbol{\mu}_\ell,\Sigma_\ell)
}
$$

The core idea is:

> a GMM treats the component label as hidden, then uses Bayes' rule to compute
> soft assignments of observations to components.

This sets up the next block, where EM uses those responsibilities to update the
mixture weights, means, and covariances.

</details>

---

## Block 2: Equations (62)-(65)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

Block 1 defined the Gaussian mixture density:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Now the question is:

> how do we learn the mixture weights, means, and covariances from data?

The unknown parameters are:

$$
\boldsymbol{\theta}
=
\{
\pi_j,
\boldsymbol{\mu}_j,
\Sigma_j
\mid
j=1,\ldots,M
\}
$$

where:

- $\pi_j$ is the mixing weight for component $j$
- $\boldsymbol{\mu}_j$ is the mean of component $j$
- $\Sigma_j$ is the covariance matrix of component $j$

The key difficulty is that the component labels are hidden.

For each observation $x_n$, we do not know which component generated it.

So this block introduces explicit hidden assignment variables:

$$
z_{jn}
$$

These variables make the hidden structure visible, which is exactly what EM
needs.

This block covers equations (62)-(65). The important bridge is the move from
the observed-data likelihood to an explicit hidden-variable representation using
the one-hot assignment variable $z_{jn}$.

Plain English:

> Block 1 wrote the mixture after hiding the component labels. Block 2 brings
> those hidden labels back into the model so EM can work with them.

</details>

<details open>
<summary><strong>Equation (62): The Maximum Likelihood Objective</strong></summary>

The dataset is:

$$
\mathcal{X}
=
\{x_1,\ldots,x_N\}
$$

The GMM parameters are:

$$
\boldsymbol{\theta}
=
\{
\pi_j,
\boldsymbol{\mu}_j,
\Sigma_j
\mid
j=1,\ldots,M
\}
$$

These parameters are not completely free.

The mixing weights must satisfy:

$$
\pi_j\geq 0,
\quad
\sum_{j=1}^{M}\pi_j=1
$$

and each covariance matrix must be a valid covariance matrix:

$$
\Sigma_j
\text{ is symmetric positive definite.}
$$

Maximum likelihood chooses the parameter values that make the observed dataset
most likely.

The paper writes:

$$
\boldsymbol{\theta}_{ML}
=
\arg\max_{\boldsymbol{\theta}}
\log p(\mathcal{X};\boldsymbol{\theta})
\tag{62}
$$

This means:

> find the mixture weights, means, and covariances that maximise the log
> likelihood of the observed data.

The semicolon in:

$$
p(\mathcal{X};\boldsymbol{\theta})
$$

means that $\boldsymbol{\theta}$ is being treated as a parameter, not as a
random variable.

Plain English:

> ML asks: which GMM parameters make this dataset look most plausible?

</details>

<details open>
<summary><strong>Equation (63): The Dataset Likelihood</strong></summary>

From equation (60), one observation has density:

$$
p(x_n;\boldsymbol{\theta})
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Assuming the observations are independent, the dataset likelihood is:

$$
p(\mathcal{X};\boldsymbol{\theta})
=
\prod_{n=1}^{N}
p(x_n;\boldsymbol{\theta})
$$

Substitute the GMM density:

$$
p(\mathcal{X};\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\left[
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
\tag{63}
$$

This is equation (63) in the paper.

It says:

> the likelihood of the whole dataset is the product of the mixture density
> evaluated at each observed data point.

Taking logs gives:

$$
\log p(\mathcal{X};\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\log
\left[
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

The awkward part is:

$$
\log
\left[
\sum_{j=1}^{M}
\cdots
\right]
$$

The log is outside the sum over components.

This makes direct optimisation harder because the contribution of each data
point is a mixture of all possible component explanations.

Plain English:

> each data point could have come from any component, so the likelihood has to
> add over those possibilities before taking the log.

EM avoids this awkwardness by introducing the hidden component assignments
explicitly.

</details>

<details open>
<summary><strong>Introducing Hidden Indicator Variables</strong></summary>

For each observation $x_n$, introduce a hidden vector:

$$
z_n
=
(z_{1n},\ldots,z_{Mn})^T
$$

This is a **one-hot vector**.

That means exactly one entry is equal to 1 and all the others are equal to 0.

The entry:

$$
z_{jn}
$$

means:

$$
z_{jn}
=
\begin{cases}
1, & \text{if }x_n\text{ was generated by component }j,\\
0, & \text{otherwise.}
\end{cases}
$$

Because each data point is generated by exactly one component:

$$
\sum_{j=1}^{M}
z_{jn}
=
1
$$

This means $z_n$ is a one-trial multinomial, also commonly called a
categorical, random variable:

$$
z_n
\sim
\mathrm{Categorical}(\boldsymbol{\pi})
$$

The vector form is useful because it lets us keep track of all possible
components at once, even though only one component is actually selected.

For example, if there are three components and $x_n$ came from component 2,
then:

$$
z_n
=
\begin{bmatrix}
0\\
1\\
0
\end{bmatrix}
$$

Plain English:

> $z_n$ records the missing cluster label for data point $x_n$.

</details>

<details open>
<summary><strong>Why One-Hot Powers Are Useful</strong></summary>

The one-hot notation lets us write "choose one component" using products.

Suppose:

$$
z_n
=
\begin{bmatrix}
0\\
1\\
0
\end{bmatrix}
$$

Then:

$$
\prod_{j=1}^{3}
\pi_j^{z_{jn}}
=
\pi_1^0
\pi_2^1
\pi_3^0
$$

Since:

$$
a^0=1
$$

and:

$$
a^1=a
$$

we get:

$$
\pi_1^0
\pi_2^1
\pi_3^0
=
1\cdot \pi_2\cdot 1
=
\pi_2
$$

So the product:

$$
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

automatically selects the mixing weight of the component that generated
$x_n$.

The same trick works for Gaussian densities:

$$
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
$$

Only the selected component density survives.

Plain English:

> one-hot exponents turn a product over all components into a compact way of
> selecting one component.

</details>

<details open>
<summary><strong>Equation (64): The Probability Of The Hidden Assignments</strong></summary>

For one observation $x_n$, the hidden component label has probabilities:

$$
p(z_{jn}=1)
=
\pi_j
$$

Equivalently:

$$
z_n
\sim
\mathrm{Categorical}(\boldsymbol{\pi})
$$

where:

$$
\boldsymbol{\pi}
=
(\pi_1,\ldots,\pi_M)
$$

Using the one-hot product trick, the probability of the whole hidden vector
$z_n$ is:

$$
p(z_n;\boldsymbol{\theta})
=
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

Now do this for all $N$ observations.

Let:

$$
Z
=
\{z_1,\ldots,z_N\}
$$

Assuming the hidden assignments are independent given the mixing weights:

$$
p(Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
p(z_n;\boldsymbol{\theta})
$$

Reproduce the one-observation expression that will be substituted:

$$
p(z_n;\boldsymbol{\theta})
=
\prod_{j=1}^{M}\pi_j^{z_{jn}}
$$

Now substitute it into every factor of the dataset expression:

$$
p(Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
\tag{64}
$$

Plain English:

> equation (64) scores a complete set of hidden component assignments using
> the mixture weights.

If many data points are assigned to component $j$, then $\pi_j$ appears many
times in the product.

</details>

<details open>
<summary><strong>Equation (65): The Likelihood Given Hidden Assignments</strong></summary>

Now we write the probability of the observations given the hidden assignments.

For one observation, if:

$$
z_{jn}=1
$$

then $x_n$ was generated by component $j$, so:

$$
p(x_n\mid z_{jn}=1;\boldsymbol{\theta})
=
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Using the same one-hot product trick:

$$
p(x_n\mid z_n;\boldsymbol{\theta})
=
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
$$

For all observations:

$$
p(\mathcal{X}\mid Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
p(x_n\mid z_n;\boldsymbol{\theta})
$$

Reproduce the one-observation expression that will be substituted:

$$
p(x_n\mid z_n;\boldsymbol{\theta})
=
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
$$

Now substitute it into every factor of the dataset likelihood:

$$
p(\mathcal{X}\mid Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
\tag{65}
$$

Plain English:

> equation (65) says that once the hidden component labels are known, each data
> point is scored only under its selected Gaussian component.

</details>

<details open>
<summary><strong>How Equations (64)-(65) Rebuild The Joint Model</strong></summary>

From equation (58), the basic joint model is:

$$
p(X,Z)
=
p(X\mid Z)p(Z)
$$

For the whole dataset, this becomes:

$$
p(\mathcal{X},Z;\boldsymbol{\theta})
=
p(\mathcal{X}\mid Z;\boldsymbol{\theta})
p(Z;\boldsymbol{\theta})
$$

The two expressions that will be substituted are:

$$
p(Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}\prod_{j=1}^{M}\pi_j^{z_{jn}}
$$

and:

$$
p(\mathcal{X}\mid Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
$$

Now substitute both into the complete joint-density equation:

$$
p(\mathcal{X},Z;\boldsymbol{\theta})
=
\left[
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
\right]
\left[
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
\right]
$$

Since both products run over the same $n$ and $j$, we can combine them:

$$
p(\mathcal{X},Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\left[
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]^{z_{jn}}
$$

This is the complete-data likelihood.

It is called "complete-data" because it includes both:

- the observed data $\mathcal{X}$
- the hidden labels $Z$

Plain English:

> if we knew the missing component labels, training the GMM would be much
> simpler.

This is the key reason EM is useful.

</details>

<details open>
<summary><strong>Why This Sets Up EM</strong></summary>

The observed-data log likelihood is awkward because it has:

$$
\log
\left[
\sum_{j=1}^{M}
\cdots
\right]
$$

The complete-data log likelihood is easier because the hidden indicators select
components.

From the previous subsection, the complete-data likelihood is:

$$
p(\mathcal{X},Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\left[
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]^{z_{jn}}
$$

Now take logs:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\log
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\left[
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]^{z_{jn}}
$$

Use the product-to-sum rule:

$$
\log\prod_i a_i
=
\sum_i \log a_i
$$

So:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\log
\left[
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]^{z_{jn}}
$$

Now use the power rule:

$$
\log(a^z)
=
z\log a
$$

to bring the hidden indicator down:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log
\left[
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

Finally use:

$$
\log(ab)
=
\log a+\log b
$$

to separate the mixing-weight part from the Gaussian-density part:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\left[
\log \pi_j
+
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

Equivalently:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Those terms are much easier to optimise if the $z_{jn}$ values are known.

But they are not known.

So EM uses the current model to compute their expected values:

$$
\langle z_{jn}\rangle
$$

These expected values are the responsibilities from equation (61).

Plain English:

> EM replaces unknown hard assignments with soft assignments, then updates the
> mixture parameters as if those soft assignments were fractional counts.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Equation (62) defines the maximum likelihood objective:

$$
\boldsymbol{\theta}_{ML}
=
\arg\max_{\boldsymbol{\theta}}
\log p(\mathcal{X};\boldsymbol{\theta})
$$

Equation (63) writes the observed-data likelihood:

$$
p(\mathcal{X};\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\left[
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

The direct objective is awkward because the log likelihood contains:

$$
\log
\left[
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right]
$$

So the paper introduces hidden one-hot assignment variables:

$$
z_{jn}
$$

Equation (64) writes the probability of those assignments:

$$
p(Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

Equation (65) writes the likelihood of the observations given those
assignments:

$$
p(\mathcal{X}\mid Z;\boldsymbol{\theta})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)^{z_{jn}}
$$

The key idea is:

> once the hidden component labels are made explicit, the GMM becomes a natural
> EM problem.

The next block derives the actual EM updates for the responsibilities, mixing
weights, means, and covariances.

</details>

---

## Block 3: Equations (66)-(70)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

Block 2 introduced the hidden component indicators:

$$
z_{jn}
$$

where:

$$
z_{jn}
=
\begin{cases}
1, & \text{if }x_n\text{ was generated by component }j,\\
0, & \text{otherwise.}
\end{cases}
$$

If we knew these values, fitting the GMM would be simple.

But we do not know them.

So EM alternates between two steps:

- **E-step:** estimate the hidden assignments using the current parameters
- **M-step:** update the parameters using those estimated assignments

The current parameters at EM iteration $t$ are:

$$
\boldsymbol{\theta}^{(t)}
=
\{
\pi_j^{(t)},
\boldsymbol{\mu}_j^{(t)},
\Sigma_j^{(t)}
\mid
j=1,\ldots,M
\}
$$

The next parameters are:

$$
\boldsymbol{\theta}^{(t+1)}
$$

This block derives:

1. the **responsibility** update
2. the **expected complete-data log likelihood**
3. the **mixing-weight** update
4. the **mean** update
5. the **covariance** update

Plain English:

> EM for GMMs is soft clustering followed by weighted Gaussian refitting.

</details>

<details open>
<summary><strong>Equation (66): The E-Step Responsibility Update</strong></summary>

From equation (61), the posterior probability that component $j$ generated an
observed value $x$ is:

$$
P(j\mid x)
=
\frac{
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
}{
\sum_{\ell=1}^{M}
\pi_\ell
\mathcal{N}(x\mid\boldsymbol{\mu}_\ell,\Sigma_\ell)
}
$$

For EM, we apply this to every observation $x_n$ using the current parameter
values:

$$
\pi_j^{(t)},
\quad
\boldsymbol{\mu}_j^{(t)},
\quad
\Sigma_j^{(t)}
$$

The expected value of the hidden indicator is:

$$
\langle z_{jn}^{(t)}\rangle
$$

This notation means:

> under the current model, what is the probability that $z_{jn}=1$?

Since $z_{jn}$ is a binary indicator, its expectation is just the probability
that it equals 1:

$$
\langle z_{jn}^{(t)}\rangle
=
1\cdot p(z_{jn}=1\mid x_n;\boldsymbol{\theta}^{(t)})
+
0\cdot p(z_{jn}=0\mid x_n;\boldsymbol{\theta}^{(t)})
$$

So:

$$
\langle z_{jn}^{(t)}\rangle
=
p(z_{jn}=1\mid x_n;\boldsymbol{\theta}^{(t)})
$$

The responsibility formula evaluated at the current parameters is:

$$
p(z_{jn}=1\mid x_n;\boldsymbol{\theta}^{(t)})
=
\frac{
\pi_j^{(t)}
\mathcal{N}
\left(x_n\mid\boldsymbol{\mu}_j^{(t)},\Sigma_j^{(t)}\right)
}{
\sum_{\ell=1}^{M}\pi_\ell^{(t)}
\mathcal{N}
\left(x_n\mid\boldsymbol{\mu}_\ell^{(t)},\Sigma_\ell^{(t)}\right)
}
$$

Reproduce the expectation identity that receives this substitution:

$$
\langle z_{jn}^{(t)}\rangle
=
p(z_{jn}=1\mid x_n;\boldsymbol{\theta}^{(t)})
$$

Now substitute the complete responsibility formula:

$$
\langle z_{jn}^{(t)}\rangle
=
\frac{
\pi_j^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_j^{(t)},
\Sigma_j^{(t)}
\right)
}{
\sum_{\ell=1}^{M}
\pi_\ell^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_\ell^{(t)},
\Sigma_\ell^{(t)}
\right)
}
\tag{66}
$$

This is equation (66).

The numerator:

$$
\pi_j^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_j^{(t)},
\Sigma_j^{(t)}
\right)
$$

is the current unnormalised score for the claim:

> component $j$ generated data point $x_n$.

The denominator:

$$
\sum_{\ell=1}^{M}
\pi_\ell^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_\ell^{(t)},
\Sigma_\ell^{(t)}
\right)
$$

is the total score across all possible components.

Dividing by the total score makes the responsibilities add to 1:

$$
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
=
1
$$

Plain English:

> the E-step gives each component a soft share of responsibility for each data
> point.

</details>

<details open>
<summary><strong>A Small Numeric Example For The E-Step</strong></summary>

Suppose there are two components:

$$
M=2
$$

For one data point $x_n$, suppose the current model gives:

$$
\pi_1^{(t)}=0.6,
\quad
\pi_2^{(t)}=0.4
$$

and:

$$
\mathcal{N}(x_n\mid\boldsymbol{\mu}_1^{(t)},\Sigma_1^{(t)})
=
0.10
$$

$$
\mathcal{N}(x_n\mid\boldsymbol{\mu}_2^{(t)},\Sigma_2^{(t)})
=
0.30
$$

The E-step responsibility formula is:

$$
\langle z_{jn}^{(t)}\rangle
=
\frac{
\pi_j^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j^{(t)},\Sigma_j^{(t)})
}{
\sum_{\ell=1}^{M}
\pi_\ell^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_\ell^{(t)},\Sigma_\ell^{(t)})
}
$$

The unnormalised score for component 1 is:

$$
0.6(0.10)=0.06
$$

The unnormalised score for component 2 is:

$$
0.4(0.30)=0.12
$$

The total score is:

$$
0.06+0.12=0.18
$$

For component 1, reproduce the two-component form of the formula:

$$
\langle z_{1n}^{(t)}\rangle
=
\frac{
\pi_1^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_1^{(t)},\Sigma_1^{(t)})
}{
\pi_1^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_1^{(t)},\Sigma_1^{(t)})
+
\pi_2^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_2^{(t)},\Sigma_2^{(t)})
}
$$

Now substitute the values:

$$
\langle z_{1n}^{(t)}\rangle
=
\frac{0.6(0.10)}{0.6(0.10)+0.4(0.30)}
=
\frac{0.06}{0.18}
=
0.333
$$

For component 2, the corresponding formula is:

$$
\langle z_{2n}^{(t)}\rangle
=
\frac{
\pi_2^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_2^{(t)},\Sigma_2^{(t)})
}{
\pi_1^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_1^{(t)},\Sigma_1^{(t)})
+
\pi_2^{(t)}
\mathcal{N}(x_n\mid\boldsymbol{\mu}_2^{(t)},\Sigma_2^{(t)})
}
$$

Substituting the same values gives:

$$
\langle z_{2n}^{(t)}\rangle
=
\frac{0.4(0.30)}{0.6(0.10)+0.4(0.30)}
=
\frac{0.12}{0.18}
=
0.667
$$

The model does not make a hard decision.

It says:

> this point is about one-third component 1 and two-thirds component 2.

</details>

<details open>
<summary><strong>Equation (67): The Expected Complete-Data Log Likelihood</strong></summary>

At the end of Block 2, we derived the complete-data log likelihood:

$$
\log p(\mathcal{X},Z;\boldsymbol{\theta})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

This expression would be easy to optimise if the hidden indicators $z_{jn}$
were known.

But they are not known.

EM therefore takes an expectation with respect to the posterior distribution of
the hidden variables under the current parameter values:

$$
p(Z\mid\mathcal{X};\boldsymbol{\theta}^{(t)})
$$

**Why This Is An Expectation Under The Current Posterior**

At this point, $\mathcal{X}$ and $\boldsymbol{\theta}^{(t)}$ are fixed. The
uncertain object is the complete assignment matrix $Z$. It can take many
possible one-hot configurations.

For a discrete random object $Z$ with normalised distribution $q(Z)$, the
definition of expectation is:

$$
\mathbb{E}_{q(Z)}[g(Z)]
=
\sum_Z q(Z)g(Z)
$$

Here the distribution supplying the weights is:

$$
q(Z)
=
p(Z\mid\mathcal{X};\boldsymbol{\theta}^{(t)})
$$

and the function being averaged is the complete-data log likelihood evaluated
at a candidate next parameter value:

$$
g(Z)
=
\log p(\mathcal{X},Z;\boldsymbol{\theta})
$$

Substitute these two pieces into the definition of expectation:

$$
\mathbb{E}_{p(Z\mid\mathcal{X};\boldsymbol{\theta}^{(t)})}
\left[
\log p(\mathcal{X},Z;\boldsymbol{\theta})
\right]
=
\sum_Z
p(Z\mid\mathcal{X};\boldsymbol{\theta}^{(t)})
\log p(\mathcal{X},Z;\boldsymbol{\theta})
$$

This is an exact probability-weighted average over possible hidden assignment
configurations. It is useful because the raw $z_{jn}$ values inside the
easy-to-optimise complete-data log likelihood will become their posterior
averages, the responsibilities already computed in the E-step.

So the EM objective is:

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\left\langle
\log p(\mathcal{X},Z;\boldsymbol{\theta})
\right\rangle_{p(Z\mid\mathcal{X};\boldsymbol{\theta}^{(t)})}
$$

The two parameter arguments play different roles:

- $\boldsymbol{\theta}^{(t)}$ is fixed and supplies the posterior weights over
  $Z$
- $\boldsymbol{\theta}$ is the candidate parameter vector that the M-step will
  optimise

Now substitute the complete-data log likelihood:

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\left\langle
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\right\rangle
$$

The only random terms inside the expectation are the hidden indicators:

$$
z_{jn}
$$

The candidate parameters:

$$
\pi_j,
\quad
\boldsymbol{\mu}_j,
\quad
\Sigma_j
$$

are the quantities we are about to optimise in the M-step, so they stay inside
the logs as ordinary variables.

Using linearity of expectation:

$$
\langle a+b\rangle
=
\langle a\rangle+\langle b\rangle
$$

and:

$$
\langle c z_{jn}\rangle
=
c\langle z_{jn}\rangle
$$

where $c$ does not depend on $Z$, we get:

For one representative term, this operation is:

$$
\mathbb{E}
\left[
z_{jn}\log\pi_j
\right]
=
\log\pi_j\,\mathbb{E}[z_{jn}]
=
\log\pi_j\,\langle z_{jn}^{(t)}\rangle
$$

The same replacement applies to every $z_{jn}$ in the two sums. Therefore:

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
\tag{67}
$$

This is equation (67).

Plain English:

> the unknown hard assignments $z_{jn}$ have been replaced by soft assignments
> $\langle z_{jn}^{(t)}\rangle$.

So if:

$$
\langle z_{jn}^{(t)}\rangle=0.8
$$

then data point $x_n$ contributes 80% of its weight to component $j$ in the
M-step.

</details>

<details open>
<summary><strong>Why Equation (67) Splits Into Separate Update Problems</strong></summary>

Equation (67) is:

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

This has two main parts.

The first part:

$$
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log \pi_j
$$

contains the mixing weights.

The second part:

$$
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

contains the Gaussian parameters.

This is important because the M-step now looks like fitting weighted Gaussian
models.

Define the effective number of points assigned to component $j$:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

This is not necessarily an integer.

For example, if three points have responsibilities:

$$
0.9,
\quad
0.4,
\quad
0.2
$$

for component $j$, then:

$$
N_j^{(t)}
=
0.9+0.4+0.2
=
1.5
$$

Plain English:

> component $j$ has effectively been assigned one and a half data points.

This effective count appears in all the M-step updates.

</details>

<details open>
<summary><strong>Equation (68): Updating The Mixing Weights</strong></summary>

The question this update answers is:

> what fraction of the mixture should component $j$ occupy after seeing the
> current soft assignments?

Reproduce the full objective from equation (67):

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\sum_{n=1}^{N}\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle\log\pi_j
+
\sum_{n=1}^{N}\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

When optimising $\boldsymbol{\pi}$, the Gaussian term contains no mixing
weights, so it is constant with respect to this derivative. The part that can
change is:

$$
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log \pi_j
$$

The mixing weights must satisfy:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

So the M-step maximises the mixing-weight part subject to this constraint.

To see where the update comes from, define:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

The inner sum is exactly the definition of $N_j^{(t)}$, while $\log\pi_j$
does not depend on the observation index $n$. Substitute the effective count:

$$
\sum_{j=1}^{M}
N_j^{(t)}
\log \pi_j
$$

The constraint is:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

Using a Lagrange multiplier, we maximise:

$$
\mathcal{L}
=
\sum_{j=1}^{M}
N_j^{(t)}
\log \pi_j
+
\lambda
\left(
\sum_{j=1}^{M}
\pi_j
-
1
\right)
$$

Differentiate with respect to $\pi_j$:

$$
\frac{\partial\mathcal{L}}{\partial \pi_j}
=
\frac{N_j^{(t)}}{\pi_j}
+
\lambda
$$

Set this equal to zero:

$$
\frac{N_j^{(t)}}{\pi_j}
+
\lambda
=
0
$$

So:

$$
\pi_j
=
-
\frac{N_j^{(t)}}{\lambda}
$$

Now use the constraint:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

The expression we will substitute for each mixing weight is:

$$
\pi_j
=
-\frac{N_j^{(t)}}{\lambda}
$$

Substitute this expression into the complete constraint:

$$
\sum_{j=1}^{M}
-
\frac{N_j^{(t)}}{\lambda}
=
1
$$

Before using the total effective count, derive it from its definition:

$$
\sum_{j=1}^{M}N_j^{(t)}
=
\sum_{j=1}^{M}\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

Swap the finite sums:

$$
\sum_{j=1}^{M}N_j^{(t)}
=
\sum_{n=1}^{N}\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
$$

For each observation, the component responsibilities sum to one:

$$
\sum_{j=1}^{M}\langle z_{jn}^{(t)}\rangle=1
$$

Therefore:

$$
\sum_{j=1}^{M}
N_j^{(t)}
=
\sum_{n=1}^{N}1
=
N
$$

Return to the complete multiplier equation:

$$
\sum_{j=1}^{M}
-\frac{N_j^{(t)}}{\lambda}
=
1
$$

Now substitute $\sum_jN_j^{(t)}=N$:

$$
-
\frac{N}{\lambda}
=
1
$$

so:

$$
\lambda
=
-N
$$

Substituting this back into the expression for $\pi_j$ gives:

$$
\pi_j
=
-\frac{N_j^{(t)}}{\lambda}
$$

Now substitute $\lambda=-N$:

$$
\pi_j
=
-\frac{N_j^{(t)}}{-N}
=
\frac{N_j^{(t)}}{N}
$$

Therefore, the M-step update is:

$$
\pi_j^{(t+1)}
=
\frac{1}{N}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\tag{68}
$$

Using the effective count:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

we can write:

$$
\pi_j^{(t+1)}
=
\frac{N_j^{(t)}}{N}
$$

This is very intuitive.

If component $j$ is responsible for many data points, its mixing weight should
increase.

If component $j$ is responsible for very few data points, its mixing weight
should decrease.

The update also automatically sums to 1:

$$
\sum_{j=1}^{M}
\pi_j^{(t+1)}
=
\sum_{j=1}^{M}
\frac{1}{N}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

Swap the sums:

$$
\sum_{j=1}^{M}
\pi_j^{(t+1)}
=
\frac{1}{N}
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
$$

For each data point:

$$
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
=
1
$$

so:

$$
\sum_{j=1}^{M}
\pi_j^{(t+1)}
=
\frac{1}{N}
\sum_{n=1}^{N}
1
=
1
$$

This confirms normalisation. We should also check that the stationary point is
a maximum. For $N_j^{(t)}>0$:

$$
\frac{\partial^2}{\partial\pi_j^2}
\left[N_j^{(t)}\log\pi_j\right]
=
-\frac{N_j^{(t)}}{\pi_j^2}
<
0
$$

The objective is therefore concave over positive mixing weights, so the
stationary solution is the constrained maximum. If $N_j^{(t)}=0$, the exact
maximum can lie on the boundary at $\pi_j^{(t+1)}=0$; implementations often
reinitialise a nearly empty component instead.

Plain English:

> the new mixing weight is the fraction of the dataset softly assigned to that
> component.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Mixing-Weight Update</strong></summary>

Suppose $N=4$ observations have these responsibilities:

| Observation | Component 1 | Component 2 | Component 3 |
|---|---:|---:|---:|
| $x_1$ | $0.8$ | $0.2$ | $0.0$ |
| $x_2$ | $0.7$ | $0.2$ | $0.1$ |
| $x_3$ | $0.1$ | $0.7$ | $0.2$ |
| $x_4$ | $0.2$ | $0.2$ | $0.6$ |

The effective-count formula is:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}\langle z_{jn}^{(t)}\rangle
$$

Substitute the entries in each column:

$$
N_1^{(t)}=0.8+0.7+0.1+0.2=1.8
$$

$$
N_2^{(t)}=0.2+0.2+0.7+0.2=1.3
$$

$$
N_3^{(t)}=0.0+0.1+0.2+0.6=0.9
$$

The counts pass the check:

$$
1.8+1.3+0.9=4=N
$$

Now reproduce the mixing-weight formula:

$$
\pi_j^{(t+1)}
=
\frac{N_j^{(t)}}{N}
$$

Substitute $N=4$ and the three effective counts:

$$
\pi_1^{(t+1)}=\frac{1.8}{4}=0.45
$$

$$
\pi_2^{(t+1)}=\frac{1.3}{4}=0.325
$$

$$
\pi_3^{(t+1)}=\frac{0.9}{4}=0.225
$$

These values sum to one. Component 1 receives the largest new mixing weight
because it accumulated the largest share of responsibility.

</details>

<details open>
<summary><strong>Equation (69): Updating The Component Means</strong></summary>

The Gaussian part of equation (67) is:

$$
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

For a fixed component $j$, the terms involving its mean are:

$$
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

This is like fitting a Gaussian to the data, except each data point has a
weight:

$$
\langle z_{jn}^{(t)}\rangle
$$

To see why the mean update is a weighted average, focus only on the terms that
depend on $\boldsymbol{\mu}_j$.

For a Gaussian:

$$
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
=
-
\frac{1}{2}
(x_n-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
+
\text{terms not involving }\boldsymbol{\mu}_j
$$

So maximising the Gaussian part with respect to $\boldsymbol{\mu}_j$ is
equivalent to minimising the weighted squared distances:

$$
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
(x_n-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
$$

That last sentence tells us the target, but it does not yet prove that the
answer is a weighted mean. We now take the missing derivative explicitly.

For readability, define:

$$
r_{jn}^{(t)}
=
\langle z_{jn}^{(t)}\rangle
$$

The mean-dependent part of the objective is:

$$
Q_{\mu_j}
=
-\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}^{(t)}
(x_n-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
$$

During this derivative, the responsibilities and $\Sigma_j$ are held fixed.
Because a covariance matrix is symmetric, its inverse is also symmetric. For
any symmetric matrix $A$:

$$
\nabla_{\boldsymbol{\mu}}
\left[
(x-\boldsymbol{\mu})^T
A
(x-\boldsymbol{\mu})
\right]
=
-2A(x-\boldsymbol{\mu})
$$

Apply this identity to one term with $A=\Sigma_j^{-1}$. The two minus signs and
the factor of two cancel:

$$
\nabla_{\boldsymbol{\mu}_j}Q_{\mu_j}
=
\sum_{n=1}^{N}
r_{jn}^{(t)}
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
$$

At a stationary point, set this gradient equal to the zero vector:

$$
\sum_{n=1}^{N}
r_{jn}^{(t)}
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
=
\boldsymbol{0}
$$

The same invertible matrix $\Sigma_j^{-1}$ appears in every term, so factor it
out:

$$
\Sigma_j^{-1}
\sum_{n=1}^{N}
r_{jn}^{(t)}
(x_n-\boldsymbol{\mu}_j)
=
\boldsymbol{0}
$$

Multiply both sides by $\Sigma_j$. Since
$\Sigma_j\Sigma_j^{-1}=I$, this removes the precision matrix:

$$
\sum_{n=1}^{N}
r_{jn}^{(t)}
(x_n-\boldsymbol{\mu}_j)
=
\boldsymbol{0}
$$

Distribute the weighted sum:

$$
\sum_{n=1}^{N}r_{jn}^{(t)}x_n
-
\sum_{n=1}^{N}r_{jn}^{(t)}\boldsymbol{\mu}_j
=
\boldsymbol{0}
$$

The candidate mean does not depend on $n$, so take it outside the second sum:

$$
\sum_{n=1}^{N}r_{jn}^{(t)}x_n
-
\boldsymbol{\mu}_j
\sum_{n=1}^{N}r_{jn}^{(t)}
=
\boldsymbol{0}
$$

Move the second term to the right:

$$
\boldsymbol{\mu}_j
\sum_{n=1}^{N}r_{jn}^{(t)}
=
\sum_{n=1}^{N}r_{jn}^{(t)}x_n
$$

Provided the component has positive effective count, divide by
$\sum_nr_{jn}^{(t)}$:

$$
\boldsymbol{\mu}_j
=
\frac{
\sum_{n=1}^{N}r_{jn}^{(t)}x_n
}{
\sum_{n=1}^{N}r_{jn}^{(t)}
}
$$

Finally, reproduce the shorthand before substituting it back:

$$
r_{jn}^{(t)}
=
\langle z_{jn}^{(t)}\rangle
$$

Substituting the responsibilities and adding the next-iteration label gives the
paper's update:

$$
\boldsymbol{\mu}_j^{(t+1)}
=
\frac{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
x_n
}{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
}
\tag{69}
$$

Using $N_j^{(t)}$, this is:

$$
\boldsymbol{\mu}_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
x_n
$$

This is the ordinary sample mean with soft weights.

The objective is a negative weighted quadratic in $\boldsymbol{\mu}_j$, so the
stationary point is the maximum of the log-likelihood contribution. If
$N_j^{(t)}=0$, the denominator is zero and the data provide no mean update for
that component; an implementation must keep, remove, or reinitialise it.

Intuitively, a point with a large responsibility pulls the component centre
strongly, while a point with a small responsibility barely moves it.

For comparison, if the assignments were hard, then $z_{jn}$ would be either 0
or 1, and the update would be:

$$
\boldsymbol{\mu}_j
=
\frac{
\text{sum of points assigned to component }j
}{
\text{number of points assigned to component }j
}
$$

EM replaces the hard count with a soft count.

Plain English:

> the new centre of component $j$ is the weighted average of the data points,
> where the weights are the responsibilities for component $j$.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Mean Update</strong></summary>

Suppose we are updating one one-dimensional component.

There are three data points:

$$
x_1=1,
\quad
x_2=4,
\quad
x_3=10
$$

The current responsibilities for component $j$ are:

$$
\langle z_{j1}^{(t)}\rangle=0.8,
\quad
\langle z_{j2}^{(t)}\rangle=0.6,
\quad
\langle z_{j3}^{(t)}\rangle=0.1
$$

Reproduce the effective-count formula:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}\langle z_{jn}^{(t)}\rangle
$$

Substitute the three responsibilities:

The effective count is:

$$
N_j^{(t)}
=
0.8+0.6+0.1
=
1.5
$$

The numerator of the mean update is:

$$
\sum_{n=1}^{N}\langle z_{jn}^{(t)}\rangle x_n
$$

Substitute the observations and responsibilities:

$$
0.8(1)+0.6(4)+0.1(10)
=
0.8+2.4+1.0
=
4.2
$$

Now reproduce the complete mean update:

$$
\mu_j^{(t+1)}
=
\frac{
\sum_{n=1}^{N}\langle z_{jn}^{(t)}\rangle x_n
}{
N_j^{(t)}
}
$$

Substitute the weighted sum and effective count:

$$
\mu_j^{(t+1)}
=
\frac{4.2}{1.5}
=
2.8
$$

The point $x_3=10$ has only a small responsibility, so it pulls the mean only a
little.

![Responsibilities control how strongly observations pull the component mean](assets/gmm_em_weighted_mean.png)

The horizontal axis is the observed one-dimensional value $x_n$. Marker size
and colour both encode the responsibility for this component; there is no
meaningful vertical quantity, so the vertical axis is deliberately omitted.
The red line is the weighted mean from equation (69). The distant point at 10
does not drag the centre far to the right because its responsibility is only
$0.1$.

</details>

<details open>
<summary><strong>Equation (70): Updating The Component Covariances</strong></summary>

The covariance controls the spread and shape of each Gaussian component.

The covariance update also comes from the Gaussian part of equation (67):

$$
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

For one Gaussian component, the covariance matrix is estimated by looking at
how far the points are from the component mean.

With hard assignments, the usual sample covariance would be:

$$
\Sigma_j
=
\frac{1}{\text{number of points in component }j}
\sum_{\text{points in component }j}
(x_n-\boldsymbol{\mu}_j)(x_n-\boldsymbol{\mu}_j)^T
$$

EM uses exactly the same idea, but replaces hard membership with
responsibilities.

For component $j$, the covariance update is:

$$
\Sigma_j^{(t+1)}
=
\frac{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)^T
}{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
}
\tag{70}
$$

Using $N_j^{(t)}$, this is:

$$
\Sigma_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)^T
$$

The term:

$$
x_n-\boldsymbol{\mu}_j^{(t)}
$$

is the displacement of data point $x_n$ from the current centre of component
$j$, as written in the paper.

The outer product:

$$
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)^T
$$

turns that displacement into a covariance contribution.

Then the responsibility:

$$
\langle z_{jn}^{(t)}\rangle
$$

decides how much that data point should contribute to the covariance of
component $j$.

Plain English:

> the covariance update measures the weighted spread of the data around the
> component mean.

A small notation note is useful here.

The paper displays equation (70) using:

$$
\boldsymbol{\mu}_j^{(t)}
$$

inside the covariance update.

However, if we derive the M-step by maximising $Q$ with respect to the Gaussian
parameters, the covariance update is normally written using the newly updated
mean from equation (69):

$$
\boldsymbol{\mu}_j^{(t+1)}
$$

That standard implementation-friendly form is:

$$
\Sigma_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(
x_n-\boldsymbol{\mu}_j^{(t+1)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t+1)}
\right)^T
$$

**Step-By-Step Derivation Of The Standard M-Step Form**

We now derive that update rather than accepting it by analogy with an ordinary
sample covariance.

For readability, reproduce the responsibility shorthand and define the
displacement from the new component centre:

$$
r_{jn}^{(t)}
=
\langle z_{jn}^{(t)}\rangle
$$

$$
d_{jn}
=
x_n-\boldsymbol{\mu}_j^{(t+1)}
$$

For $D$-dimensional data, the full Gaussian log density is:

$$
\log\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
=
-\frac{D}{2}\log(2\pi)
-\frac{1}{2}\log|\Sigma_j|
-\frac{1}{2}
(x_n-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x_n-\boldsymbol{\mu}_j)
$$

The first term contains no covariance. To make the derivative cleaner, define
the precision matrix:

$$
\Lambda_j
=
\Sigma_j^{-1}
$$

This is an exact one-to-one reparameterisation when $\Sigma_j$ is positive
definite. Since:

$$
|\Lambda_j|
=
|\Sigma_j^{-1}|
=
\frac{1}{|\Sigma_j|}
$$

we have:

$$
-\log|\Sigma_j|
=
\log|\Lambda_j|
$$

Substitute $\Lambda_j=\Sigma_j^{-1}$ and the displacement $d_{jn}$ into the
covariance-dependent part of the Gaussian log density:

$$
\log\mathcal{N}(x_n\mid\boldsymbol{\mu}_j^{(t+1)},\Lambda_j)
=
\frac{1}{2}\log|\Lambda_j|
-
\frac{1}{2}d_{jn}^T\Lambda_jd_{jn}
+
\text{const}
$$

Here `const` means constant with respect to $\Lambda_j$ only. It may still
contain the data dimension and $2\pi$.

Reproduce the component-specific expected log-likelihood contribution:

$$
Q_j
=
\sum_{n=1}^{N}
r_{jn}^{(t)}
\log\mathcal{N}(x_n\mid\boldsymbol{\mu}_j^{(t+1)},\Lambda_j)
$$

Now substitute the precision-form Gaussian log density:

$$
Q_j(\Lambda_j)
=
\frac{1}{2}
\sum_{n=1}^{N}r_{jn}^{(t)}\log|\Lambda_j|
-
\frac{1}{2}
\sum_{n=1}^{N}r_{jn}^{(t)}d_{jn}^T\Lambda_jd_{jn}
+
\text{const}
$$

The same $\log|\Lambda_j|$ appears for every observation. Using the effective
count:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}r_{jn}^{(t)}
$$

the first sum becomes:

$$
\frac{1}{2}
\sum_{n=1}^{N}r_{jn}^{(t)}\log|\Lambda_j|
=
\frac{N_j^{(t)}}{2}\log|\Lambda_j|
$$

For the quadratic term, use the scalar-to-trace identity:

$$
d_{jn}^T\Lambda_jd_{jn}
=
\operatorname{tr}
\left(
\Lambda_jd_{jn}d_{jn}^T
\right)
$$

Define the responsibility-weighted scatter matrix:

$$
C_j
=
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}d_{jn}^T
$$

Reproduce the quadratic sum before substituting this definition:

$$
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}^T\Lambda_jd_{jn}
=
\sum_{n=1}^{N}
r_{jn}^{(t)}
\operatorname{tr}(\Lambda_jd_{jn}d_{jn}^T)
$$

Linearity of the trace lets us move the sum inside:

$$
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}^T\Lambda_jd_{jn}
=
\operatorname{tr}
\left(
\Lambda_j
\sum_{n=1}^{N}r_{jn}^{(t)}d_{jn}d_{jn}^T
\right)
$$

Substitute the definition of $C_j$:

$$
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}^T\Lambda_jd_{jn}
=
\operatorname{tr}(\Lambda_jC_j)
$$

The covariance objective is therefore:

$$
Q_j(\Lambda_j)
=
\frac{N_j^{(t)}}{2}\log|\Lambda_j|
-
\frac{1}{2}\operatorname{tr}(\Lambda_jC_j)
+
\text{const}
$$

Now use the matrix derivatives:

$$
\frac{\partial\log|\Lambda_j|}{\partial\Lambda_j}
=
\Lambda_j^{-T}
$$

and:

$$
\frac{\partial\operatorname{tr}(\Lambda_jC_j)}
{\partial\Lambda_j}
=
C_j^T
$$

Both $\Lambda_j$ and $C_j$ are symmetric, so the transposes do not change
them. Differentiate while holding the responsibilities and the new mean fixed:

$$
\frac{\partial Q_j}{\partial\Lambda_j}
=
\frac{N_j^{(t)}}{2}\Lambda_j^{-1}
-
\frac{1}{2}C_j
$$

Set the derivative equal to the zero matrix:

$$
\frac{N_j^{(t)}}{2}\Lambda_j^{-1}
-
\frac{1}{2}C_j
=
0
$$

Multiply every term by 2:

$$
N_j^{(t)}\Lambda_j^{-1}
-
C_j
=
0
$$

Rearrange:

$$
\Lambda_j^{-1}
=
\frac{C_j}{N_j^{(t)}}
$$

Reproduce the two definitions that now need to be substituted:

$$
\Sigma_j=\Lambda_j^{-1}
$$

$$
C_j
=
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}d_{jn}^T
$$

Substitute them into the stationary solution:

$$
\Sigma_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
r_{jn}^{(t)}d_{jn}d_{jn}^T
$$

Finally, reproduce the displacement and responsibility definitions:

$$
d_{jn}=x_n-\boldsymbol{\mu}_j^{(t+1)},
\qquad
r_{jn}^{(t)}=\langle z_{jn}^{(t)}\rangle
$$

Substituting both gives the implementation-friendly covariance update:

$$
\Sigma_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(x_n-\boldsymbol{\mu}_j^{(t+1)}\right)
\left(x_n-\boldsymbol{\mu}_j^{(t+1)}\right)^T
$$

The function $\log|\Lambda_j|$ is concave over positive-definite matrices and
the trace term is linear, so this stationary point is the maximum when the
weighted scatter supplies a valid positive-definite estimate. With too little
data, that scatter may be singular. Implementations commonly add a small
positive number to the covariance diagonal to keep it invertible.

So there are two things to keep clear:

- **paper-faithful notation:** equation (70) is reproduced above using
  $\boldsymbol{\mu}_j^{(t)}$
- **usual EM implementation:** compute $\boldsymbol{\mu}_j^{(t+1)}$ first, then
  use it inside the covariance update

The intuition is the same:

> use the responsibilities to measure the spread of the points assigned to
> component $j$.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Variance Update</strong></summary>

Continue the one-dimensional mean example:

$$
(x_1,x_2,x_3)=(1,4,10)
$$

$$
(r_{j1}^{(t)},r_{j2}^{(t)},r_{j3}^{(t)})=(0.8,0.6,0.1)
$$

We already calculated:

$$
N_j^{(t)}=1.5,
\qquad
\mu_j^{(t+1)}=2.8
$$

In one dimension, the covariance formula becomes the variance formula:

$$
(\sigma_j^2)^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
r_{jn}^{(t)}
\left(x_n-\mu_j^{(t+1)}\right)^2
$$

Substitute the three observations, responsibilities, new mean, and effective
count:

$$
(\sigma_j^2)^{(t+1)}
=
\frac{
0.8(1-2.8)^2
+0.6(4-2.8)^2
+0.1(10-2.8)^2
}{1.5}
$$

Calculate each weighted squared displacement:

$$
0.8(1-2.8)^2=0.8(3.24)=2.592
$$

$$
0.6(4-2.8)^2=0.6(1.44)=0.864
$$

$$
0.1(10-2.8)^2=0.1(51.84)=5.184
$$

Return to the complete variance formula with those three contributions:

$$
(\sigma_j^2)^{(t+1)}
=
\frac{2.592+0.864+5.184}{1.5}
=
\frac{8.64}{1.5}
=
5.76
$$

The point at 10 has low responsibility, but it is far from the mean. Its
squared displacement is large enough that it still contributes noticeably to
the variance. Responsibility and distance therefore play different roles:
responsibility controls the weight, while squared distance controls the size of
the spread contribution.

</details>

<details open>
<summary><strong>Why The Covariance Uses An Outer Product</strong></summary>

If the data are one-dimensional, covariance reduces to variance:

$$
\sigma_j^2
=
\frac{1}{N_j}
\sum_{n=1}^{N}
\langle z_{jn}\rangle
(x_n-\mu_j)^2
$$

This measures average squared distance from the mean.

For vector data, the difference:

$$
x_n-\boldsymbol{\mu}_j
$$

is a column vector.

For example, in two dimensions:

$$
x_n-\boldsymbol{\mu}_j
=
\begin{bmatrix}
a\\
b
\end{bmatrix}
$$

The outer product is:

$$
\begin{bmatrix}
a\\
b
\end{bmatrix}
\begin{bmatrix}
a & b
\end{bmatrix}
=
\begin{bmatrix}
a^2 & ab\\
ab & b^2
\end{bmatrix}
$$

The diagonal terms:

$$
a^2,
\quad
b^2
$$

measure spread in each coordinate.

The off-diagonal terms:

$$
ab
$$

measure how the two coordinates vary together.

Plain English:

> the covariance matrix records both the width of the component and its
> orientation in the data space.

![Weighted observations and their covariance ellipse](assets/gmm_em_covariance_geometry.png)

The axes are the two observed coordinates $x_{n1}$ and $x_{n2}$, shown with
equal spatial scale so the ellipse's direction is not visually distorted.
Marker size and colour encode $r_{jn}$, the responsibility for this component.
The red star is the weighted mean and the blue ellipse is the covariance shape
produced by the weighted outer products. High-responsibility points lying along
the lower-left to upper-right direction make the ellipse long in that direction;
low-responsibility off-line points have less influence.

</details>

<details open>
<summary><strong>How Equations (66)-(70) Appear In The Implementation</strong></summary>

The corresponding implementation is in:

```text
src/gaussian_mixture/em.py
```

The main symbol mapping is:

| Paper quantity | Meaning | Code name |
|---|---|---|
| $x_n$ | observation $n$ | `x[n]` |
| $\pi_j$ | component mixing weight | `mixing_weights[j]` |
| $\boldsymbol{\mu}_j$ | component mean | `means[j]` |
| $\Sigma_j$ | component covariance | `covariances[j]` |
| $\langle z_{jn}^{(t)}\rangle$ | responsibility of component $j$ for point $n$ | `responsibilities[n, j]` |
| $N_j^{(t)}$ | effective component count | `effective_counts[j]` |

The array uses observation first and component second, so its index order is
`[n, j]`, whereas the paper writes $z_{jn}$ with component first.

The E-step calculates the log of each unnormalised score:

$$
\log\pi_j^{(t)}
+
\log\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j^{(t)},\Sigma_j^{(t)}
\right)
$$

and then normalises the scores using log-sum-exp. This is algebraically the same
as equation (66), but avoids numerical underflow when Gaussian densities are
extremely small.

The M-step then follows the derived order:

```python
effective_counts = responsibilities.sum(axis=0)
mixing_weights = effective_counts / n_observations

weights = responsibilities[:, component]
means[component] = (weights[:, None] * x).sum(axis=0) / count
centred = x - means[component]
covariances[component] = (
    (weights[:, None] * centred).T @ centred / count
    + covariance_regularization * np.eye(n_features)
)
```

The first line is $N_j^{(t)}$. The next line is equation (68). The weighted mean
is equation (69). Crucially, `centred = x - means[component]` uses the mean that
has just been updated, matching the implementation-friendly derivation of
equation (70).

The added diagonal matrix is not part of the paper's maximum-likelihood update.
It is a small numerical regulariser:

$$
\Sigma_j
\leftarrow
\Sigma_j+\varepsilon I
$$

It prevents a covariance from becoming exactly singular. The code also
reinitialises a nearly empty component because division by an effective count
near zero cannot produce a reliable mean or covariance.

</details>

<details open>
<summary><strong>One EM Iteration In Plain English</strong></summary>

Using the implementation-friendly covariance convention, one EM iteration for a
Gaussian mixture model is:

1. Start with current parameters:

$$
\boldsymbol{\theta}^{(t)}
$$

2. **E-step:** compute responsibilities:

$$
\langle z_{jn}^{(t)}\rangle
$$

for every component $j$ and every data point $x_n$.

3. Compute the effective component counts:

$$
N_j^{(t)}
=
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

4. **M-step:** update the mixing weights:

$$
\pi_j^{(t+1)}
=
\frac{N_j^{(t)}}{N}
$$

5. Update the means:

$$
\boldsymbol{\mu}_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle x_n
$$

6. Update the covariances:

$$
\Sigma_j^{(t+1)}
=
\frac{1}{N_j^{(t)}}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(
x_n-\boldsymbol{\mu}_j^{(t+1)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t+1)}
\right)^T
$$

Then repeat.

Plain English:

> estimate soft cluster memberships, then recompute each Gaussian from its
> softly assigned data.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Equation (66) is the E-step:

$$
\langle z_{jn}^{(t)}\rangle
=
\frac{
\pi_j^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_j^{(t)},
\Sigma_j^{(t)}
\right)
}{
\sum_{\ell=1}^{M}
\pi_\ell^{(t)}
\mathcal{N}
\left(
x_n
\mid
\boldsymbol{\mu}_\ell^{(t)},
\Sigma_\ell^{(t)}
\right)
}
$$

Equation (67) is the expected complete-data log likelihood:

$$
Q(\boldsymbol{\theta},\boldsymbol{\theta}^{(t)})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log \pi_j
+
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\langle z_{jn}^{(t)}\rangle
\log
\mathcal{N}(x_n\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Equation (68) updates the mixing weights:

$$
\pi_j^{(t+1)}
=
\frac{1}{N}
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
$$

Equation (69) updates the means:

$$
\boldsymbol{\mu}_j^{(t+1)}
=
\frac{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
x_n
}{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
}
$$

Equation (70) updates the covariances:

$$
\Sigma_j^{(t+1)}
=
\frac{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)
\left(
x_n-\boldsymbol{\mu}_j^{(t)}
\right)^T
}{
\sum_{n=1}^{N}
\langle z_{jn}^{(t)}\rangle
}
$$

This last display preserves the paper's use of
$\boldsymbol{\mu}_j^{(t)}$. The standard implementation derived above centres
on $\boldsymbol{\mu}_j^{(t+1)}$ after updating the mean.

The key idea is:

> responsibilities turn hidden assignments into fractional counts, and the
> M-step uses those fractional counts to refit the mixture model.

</details>

<details open>
<summary><strong>Why The Paper Moves From Ordinary EM To Bayesian GMMs</strong></summary>

Equations (66)-(70) give an elegant maximum-likelihood algorithm, but the paper
immediately points out two limitations.

First, a component can collapse around a single observation. As its covariance
approaches zero, its Gaussian density at that observation can grow without
bound. This is why a covariance matrix may become singular: maximum likelihood
can reward a component for becoming an extremely narrow spike rather than a
useful cluster. The implementation's diagonal regulariser protects the
calculation, but it is a numerical safeguard rather than a probabilistic
solution to the underlying overfitting problem.

Second, ordinary maximum-likelihood EM assumes that the number of mixture
components $M$ has already been chosen. It does not automatically express that
an unnecessarily large component has become unsupported.

The next note therefore changes the question. Instead of finding only one best
value of each mixing weight, mean, and covariance, the Bayesian GMM places
probability distributions over those quantities. Variational inference then
approximates their posterior distributions. Priors provide regularisation, and
the Dirichlet mixing-weight prior can allow redundant components to lose their
mass.

The continuation is:

```text
gmm_variational_em_equations_71_93.md
```

</details>
