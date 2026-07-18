# GMM Variational EM Equations 71-93

This note continues the Gaussian mixture model section of **The Variational
Approximation for Bayesian Inference (2008)**.

The previous GMM note covered ordinary EM for a Gaussian mixture model:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Ordinary EM treats the parameters:

$$
\pi_j,
\quad
\boldsymbol{\mu}_j,
\quad
\Sigma_j
$$

as unknown fixed values to estimate.

This note moves to **Bayesian GMMs** and **variational EM**.

The main change is:

> some quantities that were previously treated as fixed parameters are now
> treated as random variables with priors.

That means we no longer just estimate one best value of each parameter.

Instead, we try to approximate a posterior distribution over the unknown
quantities.

---

## Block 1: Equations (71)-(77)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The goal of this block is to set up the **full Bayesian Gaussian mixture
model**.

In ordinary GMM EM, the hidden variables were only the component labels:

$$
Z
$$

In the full Bayesian GMM, the unknown random quantities are:

$$
h
=
(Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
$$

Here the paper uses $h$ as a compact bundle of everything that is not directly
observed.

That bundle contains two slightly different kinds of unknowns:

- $Z$ is a **latent variable**, because it is the unobserved component label for
  each data point
- $\boldsymbol{\pi}$, $\boldsymbol{\mu}$, and $T$ are **model parameters**, but
  in the Bayesian version they are treated as random variables with priors

where:

- $Z$ contains the hidden component labels
- $\boldsymbol{\pi}$ contains the mixing weights
- $\boldsymbol{\mu}$ contains the component means
- $T$ contains the component precision matrices

So the problem becomes larger.

In ordinary EM, the main uncertainty was:

> which component generated each observation?

In the Bayesian GMM, the uncertainty becomes:

> which component generated each observation, and what are the plausible values
> of the mixture weights, means, and precision matrices?

Instead of approximating only:

$$
p(Z\mid X)
$$

we now want to approximate:

$$
p(Z,\boldsymbol{\pi},\boldsymbol{\mu},T\mid X)
$$

The exact posterior is not analytically tractable, so the paper introduces a
mean-field variational approximation:

$$
q(h)
$$

This block covers equations (71)-(77).

Plain English:

> the full Bayesian GMM puts probability distributions over the mixture
> weights, means, and precision matrices instead of treating them as fixed
> unknowns.

</details>

<details open>
<summary><strong>The Big Picture Difference From Ordinary EM</strong></summary>

In ordinary GMM EM, the model tries to find one best value for each parameter:

$$
\pi_j,
\quad
\boldsymbol{\mu}_j,
\quad
\Sigma_j
$$

So after training, we might say:

> component 2 has mixing weight 0.3, mean at this location, and this covariance
> matrix.

That is a **point-estimate** view.

The Bayesian GMM asks a different question.

Instead of asking:

> what is the best value of $\boldsymbol{\mu}_j$?

it asks:

> what is our posterior uncertainty about $\boldsymbol{\mu}_j$?

So the mean of a component is no longer just a single point. It has a
distribution over possible values.

Similarly, the mixing weights are no longer just a single vector:

$$
\boldsymbol{\pi}
$$

They have a distribution over possible mixing-weight vectors.

The precision matrices also have distributions over possible component shapes.

The hidden labels are still uncertain too:

$$
Z
$$

So ordinary EM keeps uncertainty mainly in the hidden labels during the
E-step, then collapses the parameters to point estimates in the M-step.

The full Bayesian GMM keeps uncertainty over:

$$
Z,
\quad
\boldsymbol{\pi},
\quad
\boldsymbol{\mu},
\quad
T
$$

Plain English:

> ordinary EM says "estimate the best mixture"; Bayesian GMM says "represent
> uncertainty about the mixture."

Here is a tiny example.

Suppose ordinary EM estimates a two-component mixture and returns:

$$
\pi_1=0.7,
\quad
\pi_2=0.3
$$

This is a single best estimate.

A Bayesian GMM might instead represent a distribution over possible values of:

$$
(\pi_1,\pi_2)
$$

For example, it might say:

> most plausible values are near $(0.7,0.3)$, but nearby values such as
> $(0.65,0.35)$ or $(0.75,0.25)$ are also possible.

If the dataset were much smaller, it might still be centred near:

$$
(0.7,0.3)
$$

but with much wider uncertainty.

Later in this block, this kind of uncertainty over mixing weights will be
represented using a Dirichlet distribution.

For now, the important distinction is:

- ordinary EM returns one vector, such as $(0.7,0.3)$
- Bayesian inference represents a distribution over many possible vectors


Plain English:

> ordinary EM gives one answer; Bayesian inference gives an answer plus a sense
> of how confident we are.

</details>

<details open>
<summary><strong>Notation Before We Start</strong></summary>

The dataset is:

$$
X
=
\{x_1,\ldots,x_N\}
$$

where each observation is a vector:

$$
x_n\in\mathbb{R}^d
$$

The number of mixture components is:

$$
M
$$

So:

- $n$ indexes observations, with $n=1,\ldots,N$
- $j$ indexes mixture components, with $j=1,\ldots,M$

For example, $x_n$ means:

> the $n^{\text{th}}$ observed data point.

And component $j$ means:

> the $j^{\text{th}}$ Gaussian in the mixture.

The paper switches from covariance matrices to **precision matrices**.

In the ordinary EM note, a Gaussian component was written as:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

where:

$$
\Sigma_j
$$

is the covariance matrix.

In the Bayesian GMM section, the paper writes:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,T_j)
$$

where:

$$
T_j
=
\Sigma_j^{-1}
$$

is the precision matrix.

When the paper writes:

$$
T
$$

without a component subscript, it means the collection of all component
precision matrices:

$$
T
=
\{T_1,\ldots,T_M\}
$$

This is the same convention used for the component means:

$$
\boldsymbol{\mu}
=
\{\boldsymbol{\mu}_1,\ldots,\boldsymbol{\mu}_M\}
$$

Precision is the inverse of covariance.

In one dimension:

$$
\text{precision}
=
\frac{1}{\text{variance}}
$$

So:

- large variance means low precision
- small variance means high precision

For multidimensional data, the same idea applies through the inverse covariance
matrix:

$$
T_j
=
\Sigma_j^{-1}
$$

Plain English:

> covariance measures spread; precision measures tightness.

</details>

<details open>
<summary><strong>A Small Numeric Example For Precision</strong></summary>

Suppose we have two one-dimensional Gaussian components.

Component 1 has variance:

$$
\sigma_1^2=4
$$

Its precision is:

$$
\tau_1
=
\frac{1}{4}
=
0.25
$$

Component 2 has variance:

$$
\sigma_2^2=0.25
$$

Its precision is:

$$
\tau_2
=
\frac{1}{0.25}
=
4
$$

So component 1 is broad and uncertain:

$$
\sigma_1^2=4,
\quad
\tau_1=0.25
$$

while component 2 is narrow and precise:

$$
\sigma_2^2=0.25,
\quad
\tau_2=4
$$

This is why precision is sometimes easier to reason about in Bayesian updates.

A high precision means:

> this component is tightly concentrated.

A low precision means:

> this component is spread out.

</details>

<details open>
<summary><strong>Figure 7: Full Bayesian GMM Versus The Modified Model</strong></summary>

Figure 7 compares two Bayesian GMM graphical models.

![Figure 7: Full Bayesian GMM and Bayesian GMM without prior on mixing weights](assets/gmm_figure7_graphical_models.png)

For this first block, the relevant diagram is **Figure 7(a)**, the full
Bayesian GMM.

The right-hand diagram, **Figure 7(b)**, is a modified version used later in
the paper. The main difference is that the mixing weights are handled
differently.

It shows:

$$
\boldsymbol{\pi}
\longrightarrow
Z
\longrightarrow
X
$$

and:

$$
T
\longrightarrow
X
$$

$$
\boldsymbol{\mu}
\longrightarrow
X
$$

This means:

1. the mixing weights $\boldsymbol{\pi}$ control the hidden component labels
   $Z$
2. the hidden component label $Z$ chooses which Gaussian component generates
   $X$
3. the Gaussian component is controlled by its mean $\boldsymbol{\mu}_j$ and
   precision matrix $T_j$

The important Bayesian difference is that:

$$
\boldsymbol{\pi},
\quad
\boldsymbol{\mu},
\quad
T
$$

are all treated as random variables.

Plain English:

> Figure 7(a) is the ordinary GMM idea, but with uncertainty placed over the
> mixture weights, component centres, and component shapes.

</details>

<details open>
<summary><strong>Equation (71): The GMM Written With Precision Matrices</strong></summary>

The ordinary GMM density is:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

Equation (71) writes the same kind of mixture, but using precision matrices:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,T_j)
\tag{71}
$$

The quantities are:

- $\pi_j$, the mixing coefficient for component $j$
- $\boldsymbol{\mu}_j$, the mean of component $j$
- $T_j$, the precision matrix of component $j$

The mixing weights still satisfy:

$$
\pi_j\geq 0,
\quad
\sum_{j=1}^{M}
\pi_j
=
1
$$

The Gaussian term:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,T_j)
$$

means:

> score $x$ under the Gaussian component with centre $\boldsymbol{\mu}_j$ and
> precision $T_j$.

Because:

$$
T_j
=
\Sigma_j^{-1}
$$

we can read this as equivalent to:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
$$

but parameterised using precision rather than covariance.

To see the replacement explicitly, reproduce the usual covariance-form
Gaussian density:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
=
\frac{1}{
(2\pi)^{d/2}|\Sigma_j|^{1/2}
}
\exp
\left\{
-\frac{1}{2}
(x-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x-\boldsymbol{\mu}_j)
\right\}
$$

The precision definition is:

$$
T_j
=
\Sigma_j^{-1}
$$

Taking determinants gives:

$$
|T_j|
=
|\Sigma_j^{-1}|
=
\frac{1}{|\Sigma_j|}
$$

and therefore:

$$
\frac{1}{|\Sigma_j|^{1/2}}
=
|T_j|^{1/2}
$$

Reproduce the covariance-form density before substituting these two identities:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,\Sigma_j)
=
\frac{1}{
(2\pi)^{d/2}|\Sigma_j|^{1/2}
}
\exp
\left\{
-\frac{1}{2}
(x-\boldsymbol{\mu}_j)^T
\Sigma_j^{-1}
(x-\boldsymbol{\mu}_j)
\right\}
$$

Substitution gives the precision-form pattern used by the paper:

$$
\mathcal{N}(x\mid\boldsymbol{\mu}_j,T_j)
=
\frac{|T_j|^{1/2}}{(2\pi)^{d/2}}
\exp
\left\{
-\frac{1}{2}
(x-\boldsymbol{\mu}_j)^T
T_j
(x-\boldsymbol{\mu}_j)
\right\}
$$

This is the same density, not a new approximation. Only the matrix used to
describe its spread has changed.

Plain English:

> equation (71) is still a Gaussian mixture model; it has just swapped
> covariance matrices for precision matrices because precision works neatly
> with the Bayesian priors used next.

</details>

<details open>
<summary><strong>Why Use Precision Matrices?</strong></summary>

The paper says that in Bayesian GMMs it is more convenient to use precision
matrices instead of covariance matrices.

The reason is conjugacy.

For a multivariate Gaussian, a natural prior over the precision matrix is the
**Wishart distribution**.

This is similar to what happened in Bayesian linear regression.

There, a Gaussian likelihood with an unknown scalar precision was paired with a
Gamma prior:

$$
\text{Gaussian with scalar precision}
+
\text{Gamma prior}
\Longrightarrow
\text{Gamma posterior}
$$

For a multivariate Gaussian, the precision is a matrix rather than a scalar.

So the matrix version is:

$$
\text{Gaussian with precision matrix}
+
\text{Wishart prior}
\Longrightarrow
\text{Wishart posterior}
$$

The Wishart distribution is the matrix generalisation of the Gamma
distribution.

Plain English:

> Gamma is convenient for scalar precisions; Wishart is convenient for matrix
> precisions.

In one dimension, a precision is just one positive number:

$$
\tau>0
$$

so a Gamma prior is enough:

$$
\tau
\sim
\operatorname{Gamma}(a,b)
$$

In several dimensions, the precision is a matrix:

$$
T
=
\Sigma^{-1}
$$

so we need a distribution over positive definite matrices.

That is what the Wishart distribution provides.

So, at this stage, it is enough to read:

$$
T_j
\sim
W(\nu,V)
$$

as:

> component $j$ has an uncertain precision matrix, and that uncertainty is
> represented by a Wishart distribution.

Another way to say this:

> the prior is chosen so that the posterior stays in a familiar family after
> seeing Gaussian data.

That is why this section introduces distributions that may look more
complicated than the ordinary GMM. They are not arbitrary. They are chosen
because they make Bayesian updating manageable.

</details>

<details open>
<summary><strong>Priors In The Full Bayesian GMM</strong></summary>

The full Bayesian GMM puts priors on:

$$
\boldsymbol{\pi},
\quad
\boldsymbol{\mu},
\quad
T
$$

The mixing weights get a **Dirichlet prior**:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(\alpha_1,\ldots,\alpha_M)
$$

Read this as:

> the unknown mixture-weight vector $\boldsymbol{\pi}$ is random, and its prior
> distribution is Dirichlet.

The values inside the Dirichlet:

$$
\alpha_1,\ldots,\alpha_M
$$

are not probabilities.

They are prior-shape parameters. They control what kinds of valid probability
vectors are considered plausible before seeing the data.

The Dirichlet distribution is used because:

$$
\pi_j\geq 0
$$

and:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

So the Dirichlet is a distribution over valid mixing-weight vectors.

This is the key reason it appears here:

> a Gaussian mixture needs mixing weights that are non-negative and sum to one,
> and the Dirichlet is designed exactly for that kind of object.

The paper gives the Dirichlet density as:

$$
\operatorname{Dir}(\boldsymbol{\pi}\mid\alpha_1,\ldots,\alpha_M)
=
\frac{
\Gamma\left(\sum_{j=1}^{M}\alpha_j\right)
}{
\prod_{j=1}^{M}\Gamma(\alpha_j)
}
\prod_{j=1}^{M}
\pi_j^{\alpha_j-1}
$$

This formula has two parts.

You do not need to memorise this density to understand the modelling move. The
important point is:

> the Dirichlet assigns probabilities to different possible settings of
> $\boldsymbol{\pi}$.

The front fraction:

$$
\frac{
\Gamma\left(\sum_{j=1}^{M}\alpha_j\right)
}{
\prod_{j=1}^{M}\Gamma(\alpha_j)
}
$$

is a normalising constant. Its job is to make the whole density integrate to
one.

For intuition, the more important part is:

$$
\prod_{j=1}^{M}
\pi_j^{\alpha_j-1}
$$

This is the part that shapes which mixture-weight vectors are more likely
under the prior.

Often the paper assumes:

$$
\alpha_j
=
\alpha_0,
\quad
j=1,\ldots,M
$$

This is a symmetric Dirichlet prior.

The next subsection unpacks what $\alpha_0$ means. For now, the key point is
only that every component is being given the same prior setting.

Plain English:

> before seeing the data, every component is treated in the same way.

</details>

<details open>
<summary><strong>Intuition For The Dirichlet Prior</strong></summary>

The Dirichlet prior can feel abstract because it is not a distribution over one
number.

It is a distribution over a **set of probabilities that must add to one**.

For example, if:

$$
M=3
$$

then:

$$
\boldsymbol{\pi}
=
(\pi_1,\pi_2,\pi_3)
$$

must satisfy:

$$
\pi_1+\pi_2+\pi_3=1
$$

This means the mixing weights are like a probability budget.

There is one unit of probability to distribute across the three components.

For example, these are all valid settings:

$$
(0.5,0.3,0.2)
$$

$$
(0.9,0.05,0.05)
$$

$$
\left(\frac{1}{3},\frac{1}{3},\frac{1}{3}\right)
$$

They all add to one.

The Dirichlet prior describes which kinds of probability-budget splits we think
are plausible **before seeing the data**.

So:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(\alpha_1,\alpha_2,\alpha_3)
$$

means:

> we are putting a prior distribution over possible values of
> $(\pi_1,\pi_2,\pi_3)$.

The parameters:

$$
\alpha_1,
\quad
\alpha_2,
\quad
\alpha_3
$$

control the shape of that prior.

Now the paper makes a simplifying assumption:

$$
\alpha_1=\alpha_2=\alpha_3=\alpha_0
$$

This means:

> use the same prior setting for every component.

This is called a **symmetric Dirichlet prior**.

So $\alpha_0$ is just the shared Dirichlet setting.

For three components:

$$
\operatorname{Dir}(\alpha_0,\alpha_0,\alpha_0)
$$

means:

> give component 1, component 2, and component 3 the same prior treatment.

So $\alpha_0$ is not a data value.

It is not a component weight.

It is not one of the $\pi_j$ values.

This distinction is important:

$$
\pi_1+\pi_2+\pi_3=1
$$

because the $\pi_j$ values are probabilities.

But:

$$
\alpha_1+\alpha_2+\alpha_3
$$

does **not** have to equal 1.

The $\alpha_j$ values are not probabilities. They are prior-shape or
pseudo-count parameters.

So this is allowed:

$$
\operatorname{Dir}(10,10,10)
$$

even though:

$$
10+10+10=30
$$

because the numbers inside the Dirichlet are not the mixture weights
themselves.

The shared value $\alpha_0$ is a **prior-strength knob**.

It controls how strongly the prior shapes the possible mixture weights before
the data are seen.

For example:

$$
\operatorname{Dir}(1,1,1)
$$

means:

> use the same prior setting of 1 for each component.

And:

$$
\operatorname{Dir}(10,10,10)
$$

means:

> use the same prior setting for each component, but make that prior much
> stronger.

Both:

$$
\operatorname{Dir}(1,1,1)
$$

and:

$$
\operatorname{Dir}(10,10,10)
$$

are centred on balanced mixture weights:

$$
\left(\frac{1}{3},\frac{1}{3},\frac{1}{3}\right)
$$

The difference is strength.

The first has total prior strength:

$$
1+1+1=3
$$

The second has total prior strength:

$$
10+10+10=30
$$

So $\operatorname{Dir}(10,10,10)$ is much more committed to balanced mixture
weights than $\operatorname{Dir}(1,1,1)$.

This does **not** mean that the mixture weights become:

$$
(10,10,10)
$$

That would be impossible, because mixture weights must add to one.

The possible values of $\boldsymbol{\pi}$ are still things like:

$$
(0.34,0.33,0.33)
$$

or:

$$
(0.5,0.25,0.25)
$$

The Dirichlet parameters only control which of those valid probability vectors
are more likely under the prior.

Different settings of $\alpha_0$ encode different prior beliefs about how the
probability budget should be split.

If:

$$
\alpha_0=1
$$

the prior is roughly neutral. It does not strongly push toward balanced or
sparse weights.

If:

$$
\alpha_0>1
$$

the prior prefers more balanced mixing weights, such as:

$$
\left(\frac{1}{3},\frac{1}{3},\frac{1}{3}\right)
$$

For example, with three components:

$$
\operatorname{Dir}(10,10,10)
$$

expresses a prior belief that the three components should probably all have
non-trivial weight.

If:

$$
\alpha_0<1
$$

the prior prefers sparse mixing weights, where some components get very small
weight.

For example:

$$
\operatorname{Dir}(0.2,0.2,0.2)
$$

puts more prior mass near uneven settings like:

$$
(0.9,0.05,0.05)
$$

or:

$$
(0.05,0.9,0.05)
$$

Plain English:

> the Dirichlet prior is a prior over how the mixture's probability budget is
> split between components.

</details>

<details open>
<summary><strong>Graph: How The Dirichlet Setting Changes The Prior</strong></summary>

![Symmetric Dirichlet prior shapes in the two-component special case](assets/gmm_dirichlet_prior_shapes.png)

The easiest slice of a Dirichlet distribution to draw has two components:

$$
\boldsymbol{\pi}
=
(\pi_1,\pi_2)
$$

Because the weights must sum to 1:

$$
\pi_2
=
1-\pi_1
$$

one horizontal coordinate, $\pi_1$, completely determines the probability
split. In this two-component case, a symmetric Dirichlet becomes the symmetric
Beta density:

$$
p(\pi_1)
\propto
\pi_1^{\alpha_0-1}
(1-\pi_1)^{\alpha_0-1}
$$

The horizontal axis is the first mixing weight and is fixed to its full valid
range:

$$
0\leq\pi_1\leq1
$$

The vertical axis is **probability density**, not probability. A density may be
greater than 1; the area under each curve is what equals 1.

The three curves make the role of $\alpha_0$ visible:

- $\alpha_0=0.3$ places density near 0 and 1, favouring a sparse split where
  one component dominates;
- $\alpha_0=1$ is flat, so every valid two-component split has equal prior
  density;
- $\alpha_0=5$ concentrates density near the balanced split $\pi_1=0.5$.

For $\alpha_0=0.3$, the theoretical density grows without bound at the exact
endpoints 0 and 1. The plotted curve is evaluated from 0.01 to 0.99 so that the
shape throughout the interior remains readable; the horizontal axis still
shows the complete valid mixing-weight range.

All three priors are symmetric around 0.5. Changing $\alpha_0$ changes how
strongly the prior favours the centre or the edges; it does not change which
component is preferred.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Dirichlet Prior</strong></summary>

Suppose there are three possible mixture components:

$$
M=3
$$

A symmetric Dirichlet prior might be:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(1,1,1)
$$

This is a weak prior. It says:

> before seeing the data, we do not strongly prefer any particular mixture
> weighting.

Now suppose the soft component counts from the data are roughly:

$$
N_1=50,
\quad
N_2=30,
\quad
N_3=20
$$

For a Dirichlet prior combined with categorical assignments, the updated
parameter for component $j$ has the prior-plus-count form:

$$
\lambda_j
=
\alpha_j+N_j
$$

Reproduce this update before substituting the three prior settings and counts:

$$
\lambda_j
=
\alpha_j+N_j
$$

Substitution gives:

$$
(1+50,\;1+30,\;1+20)
=
(51,31,21)
$$

In the paper, the updated Dirichlet parameters are later written as:

$$
\lambda_j
$$

So in this simple example:

$$
\lambda_1=51,
\quad
\lambda_2=31,
\quad
\lambda_3=21
$$

That is where the $\lambda_j$ notation comes from.

It is not a new kind of probability.

It is the updated Dirichlet parameter after combining:

$$
\text{prior pseudo-count}
+
\text{soft data count}
$$

For a Dirichlet distribution:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(\lambda_1,\ldots,\lambda_M)
$$

the posterior mean of component $\pi_j$ is:

$$
\mathbb{E}[\pi_j]
=
\frac{\lambda_j}{\sum_{k=1}^{M}\lambda_k}
$$

So:

$$
\mathbb{E}[\pi_1]
=
\frac{51}{51+31+21}
=
\frac{51}{103}
\approx
0.495
$$

Reproduce the Dirichlet-mean formula before calculating component 2:

$$
\mathbb{E}[\pi_j]
=
\frac{\lambda_j}{
\displaystyle\sum_{k=1}^{M}\lambda_k
}
$$

Substitute $\lambda_2=31$ and
$\sum_k\lambda_k=51+31+21=103$:

$$
\mathbb{E}[\pi_2]
=
\frac{31}{103}
\approx
0.301
$$

Reproduce the formula before calculating component 3:

$$
\mathbb{E}[\pi_j]
=
\frac{\lambda_j}{
\displaystyle\sum_{k=1}^{M}\lambda_k
}
$$

Substitute $\lambda_3=21$ and $\sum_k\lambda_k=103$:

$$
\mathbb{E}[\pi_3]
=
\frac{21}{103}
\approx
0.204
$$

These are close to the observed proportions:

$$
(0.5,0.3,0.2)
$$

but the prior has been included too.

Now compare that with a stronger prior:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(20,20,20)
$$

The parameter update is still:

$$
\lambda_j
=
\alpha_j+N_j
$$

Substitute the stronger prior pseudo-count $\alpha_j=20$ and the same soft
counts:

$$
(20+50,\;20+30,\;20+20)
=
(70,50,40)
$$

Reproduce the Dirichlet-mean formula:

$$
\mathbb{E}[\pi_j]
=
\frac{\lambda_j}{
\displaystyle\sum_{k=1}^{M}\lambda_k
}
$$

Here the denominator is:

$$
\sum_{k=1}^{3}\lambda_k
=
70+50+40
=
160
$$

Substitute each updated parameter:

$$
\left(
\frac{70}{160},
\frac{50}{160},
\frac{40}{160}
\right)
=
(0.4375,0.3125,0.25)
$$

This is pulled more toward equal mixture weights.

Plain English:

> the Dirichlet prior behaves like extra imaginary observations added before
> the real data are counted.

</details>

<details open>
<summary><strong>The Gauss-Wishart Prior</strong></summary>

The component means and precision matrices are given a **Gauss-Wishart prior**.

This prior is used for the pair:

$$
(\boldsymbol{\mu}_j,T_j)
$$

for each component $j$.

The two objects play different roles:

- $\boldsymbol{\mu}_j$ says where component $j$ is centred
- $T_j$ says how tight, stretched, and oriented component $j$ is

So the prior needs to express uncertainty about both:

> where is the component, and what shape does it have?

The paper writes:

$$
p(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
p(\boldsymbol{\mu}_j,T_j)
$$

and factors each component as:

$$
p(\boldsymbol{\mu}_j,T_j)
=
p(\boldsymbol{\mu}_j\mid T_j)p(T_j)
$$

This says:

> first describe uncertainty about the precision matrix $T_j$, then describe
> uncertainty about the mean $\boldsymbol{\mu}_j$ conditional on that precision.

The conditional Gaussian prior is:

$$
p(\boldsymbol{\mu}_j\mid T_j)
=
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{\mu}_0,\beta_0T_j)
$$

This notation is easy to misread.

Usually, when we write:

$$
\mathcal{N}(x\mid\mu,\Sigma)
$$

the last argument is a covariance matrix.

Here, the paper is using a **precision parameterisation**. So in:

$$
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{\mu}_0,\beta_0T_j)
$$

the last argument is acting like a precision matrix, not a covariance matrix.

Here the paper uses the precision parameterisation, so:

$$
\beta_0T_j
$$

acts like the precision of the prior over $\boldsymbol{\mu}_j$.

In covariance notation, the same Gaussian prior would have covariance:

$$
(\beta_0T_j)^{-1}
$$

So a larger $\beta_0T_j$ means a tighter prior around
$\boldsymbol{\mu}_0$.

The precision matrix prior is Wishart:

$$
p(T_j)
=
W(T_j\mid\nu,V)
$$

Read this as:

> before seeing the data, we are uncertain about the precision matrix $T_j$,
> and the Wishart distribution describes that uncertainty.

The Wishart is to a matrix precision what the Gamma distribution is to a scalar
precision:

$$
\text{scalar precision}
\Rightarrow
\text{Gamma prior}
$$

$$
\text{matrix precision}
\Rightarrow
\text{Wishart prior}
$$

The paper gives the Wishart density as:

You do not need to memorise this density for the argument here. Its job in this
note is to show that the paper has written down a proper prior distribution for
positive definite precision matrices.

$$
W(T_j\mid\nu,V)
=
\frac{
|T_j|^{(\nu-d-1)/2}
\exp\left\{
\operatorname{tr}\left(
-\frac{1}{2}VT_j
\right)
\right\}
}{
2^{\nu d/2}
\pi^{d(d-1)/4}
|V|^{-\nu/2}
\prod_{i=1}^{d}
\Gamma\left((\nu+1-i)/2\right)
}
$$

where:

- $\nu$ is the degrees of freedom
- $V$ is the matrix parameter that the paper calls a scale matrix; in the
  displayed density it behaves rate-like, because it appears in
  $-\operatorname{tr}(VT_j)/2$
- $d$ is the dimensionality of the observations

Plain English:

> the Gaussian part describes where the component centre might be, and the
> Wishart part describes what shapes and orientations the component might have.

The name **Gauss-Wishart** is literal:

- **Gauss** refers to the Gaussian prior over the mean
- **Wishart** refers to the Wishart prior over the precision matrix

The reason they are tied together is that the uncertainty about a component's
mean and the uncertainty about its shape are related.

If a component is very spread out, then its centre may be less precisely known.

If a component is very tight, then its centre may be more precisely pinned down.

That is why the prior over the mean is written conditionally:

$$
p(\boldsymbol{\mu}_j\mid T_j)
$$

rather than completely separately as:

$$
p(\boldsymbol{\mu}_j)
$$

Plain English:

> the model says: first decide what kind of shape this component has, then
> express uncertainty about where its centre is.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Mean Prior</strong></summary>

Use a one-dimensional version to keep the idea simple.

Suppose the prior centre is:

$$
\mu_0=0
$$

and the component precision is:

$$
T_j=4
$$

If:

$$
\beta_0=1
$$

then the prior precision over the component mean is:

$$
\beta_0T_j
=
1\cdot 4
=
4
$$

The prior variance over the mean is:

$$
(\beta_0T_j)^{-1}
=
\frac{1}{4}
=
0.25
$$

So the prior says:

> the component mean is probably fairly close to 0.

If instead:

$$
\beta_0=0.1
$$

then:

$$
\beta_0T_j
=
0.1\cdot 4
=
0.4
$$

and the prior variance is:

$$
(\beta_0T_j)^{-1}
=
\frac{1}{0.4}
=
2.5
$$

Now the prior is much wider.

Plain English:

> larger precision means stronger confidence about the component mean; smaller
> precision means weaker confidence.

</details>

<details open>
<summary><strong>What Are The Hyperparameters?</strong></summary>

The full Bayesian GMM has parameters inside the priors.

These are called **hyperparameters**.

The easiest way to read this is:

> parameters describe the mixture itself; hyperparameters describe the priors
> we place over those parameters.

For example, $\pi_j$ is a mixture weight.

But $\alpha_j$ is not a mixture weight. It is a setting inside the prior over
the mixture weights.

Likewise, $\boldsymbol{\mu}_j$ is a component mean.

But $\boldsymbol{\mu}_0$ is not one of the component means. It is the prior
centre used before seeing the data.

For the Dirichlet prior over mixing weights, the hyperparameters are:

$$
\alpha_1,\ldots,\alpha_M
$$

or, in the symmetric case:

$$
\alpha_0
$$

For the Gaussian prior over means, the hyperparameters are:

$$
\boldsymbol{\mu}_0,
\quad
\beta_0
$$

For the Wishart prior over precision matrices, the hyperparameters are:

$$
\nu,
\quad
V
$$

In this full Bayesian setup, the paper assumes these hyperparameters are fixed
in advance.

A simple example of fixed hyperparameter choices might be:

$$
\alpha_0=1,
\quad
\boldsymbol{\mu}_0=\boldsymbol{0},
\quad
\beta_0=0.1,
\quad
\nu=d,
\quad
V=I
$$

These choices are not the answer the model is trying to learn in this block.
They are the starting assumptions used to define the Bayesian model.

So the posterior inference problem is about:

$$
Z,
\quad
\boldsymbol{\pi},
\quad
\boldsymbol{\mu},
\quad
T
$$

not about learning:

$$
\alpha_0,
\quad
\boldsymbol{\mu}_0,
\quad
\beta_0,
\quad
\nu,
\quad
V
$$

Plain English:

> hyperparameters describe the prior beliefs we start with before updating
> uncertainty using the observed data.

The hierarchy is:

$$
\text{hyperparameters}
\longrightarrow
\text{priors}
\longrightarrow
\text{random quantities}
\longrightarrow
\text{observed data}
$$

For example:

$$
\alpha_0
\longrightarrow
p(\boldsymbol{\pi})
\longrightarrow
\boldsymbol{\pi}
\longrightarrow
Z
\longrightarrow
X
$$

and:

$$
\boldsymbol{\mu}_0,\beta_0,\nu,V
\longrightarrow
p(\boldsymbol{\mu},T)
\longrightarrow
\boldsymbol{\mu},T
\longrightarrow
X
$$

So the hyperparameters are not directly observed and not directly updated in
this block. They shape the prior distributions that guide the Bayesian update.

</details>

<details open>
<summary><strong>Why The Prior Factorises Over Components</strong></summary>

The prior over all component means and precision matrices is:

$$
p(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
p(\boldsymbol{\mu}_j,T_j)
$$

This product says that, before seeing the data, the components are assumed
independent under the prior.

For three components, this would mean:

$$
p(\boldsymbol{\mu},T)
=
p(\boldsymbol{\mu}_1,T_1)
p(\boldsymbol{\mu}_2,T_2)
p(\boldsymbol{\mu}_3,T_3)
$$

Each component has the same type of prior, but its own random variables:

$$
(\boldsymbol{\mu}_1,T_1),
\quad
(\boldsymbol{\mu}_2,T_2),
\quad
(\boldsymbol{\mu}_3,T_3)
$$

This is like saying:

> component 1 gets its own mean and precision, component 2 gets its own mean
> and precision, and so on.

They can share the same hyperparameter settings:

$$
\boldsymbol{\mu}_0,
\quad
\beta_0,
\quad
\nu,
\quad
V
$$

but they do not share the same realised values of:

$$
\boldsymbol{\mu}_j,
\quad
T_j
$$

For example, before seeing the data we might use the same prior centre
$\boldsymbol{\mu}_0$ for all components, but after inference component 1 and
component 2 can still end up in very different places.

Plain English:

> before the data are observed, we do not force one component's mean or
> precision to depend directly on another component's mean or precision.

This is a prior assumption, not a claim that the components will remain
unrelated after seeing data.

Once the data are observed, the components become coupled indirectly because
they compete to explain the same observations.

For example, if one component explains a group of points well, another
component may get lower responsibility for those points.

So:

- **before data:** component priors factorise independently
- **after data:** posterior uncertainty is coupled through the shared dataset

The mean-field approximation later simplifies this posterior coupling.

</details>

<details open>
<summary><strong>Why Exact Bayesian Inference Is Hard</strong></summary>

The full Bayesian GMM has unknown random quantities:

$$
h
=
(Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
$$

The posterior we would like is:

$$
p(h\mid X)
=
p(Z,\boldsymbol{\pi},\boldsymbol{\mu},T\mid X)
$$

Using Bayes' rule:

$$
p(h\mid X)
=
\frac{
p(X,h)
}{
p(X)
}
$$

The hard part is the denominator:

$$
p(X)
=
\int
\sum_Z
p(X,Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
\,
d\boldsymbol{\pi}
d\boldsymbol{\mu}
dT
$$

The notation:

$$
\sum_Z
$$

is compact, but it hides a lot.

It means:

> sum over every possible assignment of every observation to every component.

For example, if:

$$
N=4,
\quad
M=3
$$

then each of the four observations could belong to any of three components.

That gives:

$$
3^4=81
$$

possible assignment patterns.

For realistic datasets, this number explodes.

The integral then adds another difficulty:

$$
\int
d\boldsymbol{\pi}
d\boldsymbol{\mu}
dT
$$

means:

> average over all possible mixture weights, all possible component means, and
> all possible precision matrices.

So the denominator requires both:

- summing over possible component assignments
- integrating over the mixture weights, means, and precision matrices

That is why the paper says the posterior cannot be computed analytically.

Instead, it uses a variational approximation:

$$
q(h)
\approx
p(h\mid X)
$$

Plain English:

> the exact Bayesian posterior is too complicated, so we approximate it with a
> simpler distribution.

This is the same structural problem we have seen several times:

1. there are hidden labels $Z$
2. there are unknown mixture weights $\boldsymbol{\pi}$
3. there are unknown means $\boldsymbol{\mu}$
4. there are unknown precision matrices $T$
5. all of them interact through the likelihood of the observed data

The exact posterior has to keep track of all those dependencies at once.

That is what makes it hard.

Variational inference chooses a simpler family of distributions and asks:

> within this simpler family, which distribution is closest to the true
> posterior?

</details>

<details open>
<summary><strong>Equation (72): The Mean-Field Factorisation</strong></summary>

The exact posterior is:

$$
p(h\mid X)
=
p(Z,\boldsymbol{\pi},\boldsymbol{\mu},T\mid X)
$$

The variational approximation is:

$$
q(h)
$$

Equation (72) assumes that $q(h)$ factorises as:

$$
q(h)
=
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
\tag{72}
$$

This is a **mean-field approximation**.

The approximation says:

> instead of modelling every posterior dependency exactly, split the posterior
> approximation into simpler pieces.

The three pieces are:

- $q_Z(Z)$, the approximate posterior over component labels
- $q_{\pi}(\boldsymbol{\pi})$, the approximate posterior over mixing weights
- $q_{\mu T}(\boldsymbol{\mu},T)$, the approximate posterior over means and
  precision matrices

This does not mean the variables are truly independent in the exact posterior.

It means we are choosing an approximation that is easier to compute.

The important distinction is:

$$
p(Z,\boldsymbol{\pi},\boldsymbol{\mu},T\mid X)
$$

is the true posterior we want, but it is too hard.

So we replace it with:

$$
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
$$

which is easier because each part has a manageable mathematical form.

The approximation still allows the pieces to influence each other during the
updates.

For example:

- the current label probabilities influence the update for the component means
- the current component means influence the update for the label probabilities
- the current mixing-weight uncertainty influences how likely each component is

So mean-field does not mean:

> ignore all relationships.

It means:

> represent the posterior using separate factors, then update those factors in
> a coordinated way.

Plain English:

> mean-field variational inference replaces one impossible posterior with a
> product of simpler approximate posteriors.

This equation only says how the approximation is split up.

It does not yet say what each factor looks like.

That is what equations (73)-(77) do next.

The trade-off is important.

The approximation is easier because:

$$
q_Z(Z),
\quad
q_{\pi}(\boldsymbol{\pi}),
\quad
q_{\mu T}(\boldsymbol{\mu},T)
$$

can be updated separately.

But it is approximate because the true posterior may contain dependencies that
this factorisation cannot represent exactly.

Plain English:

> mean-field makes the problem solvable by deliberately simplifying the shape
> of the posterior.

</details>

<details open>
<summary><strong>Equation (73): The Variational Distribution Over Labels</strong></summary>

Equation (73) is:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
\tag{73}
$$

This has the same one-hot structure used in ordinary GMM EM.

Here:

- $z_{jn}=1$ means observation $n$ is assigned to component $j$
- $z_{jn}=0$ means observation $n$ is not assigned to component $j$
- $r_{jn}$ is the current variational probability, or responsibility, that
  observation $n$ belongs to component $j$

For each fixed observation $n$, the responsibilities must add to one:

$$
\sum_{j=1}^{M}
r_{jn}
=
1
$$

So $r_{1n},\ldots,r_{Mn}$ form a probability distribution over the possible
component labels for observation $n$.

For one observation:

$$
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

selects the responsibility for the chosen component.

If:

$$
z_{2n}=1
$$

and all other entries are zero, then:

$$
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
=
r_{2n}
$$

The difference from ordinary EM is that these responsibilities are now part of
a larger variational posterior that also includes uncertainty over
$\boldsymbol{\pi}$, $\boldsymbol{\mu}$, and $T$.

Plain English:

> $q_Z(Z)$ stores soft cluster assignments, just like responsibilities in EM.

So if:

$$
r_{3n}=0.8
$$

then the variational posterior currently says:

> data point $x_n$ is very likely to belong to component 3.

If:

$$
r_{1n}=0.33,
\quad
r_{2n}=0.34,
\quad
r_{3n}=0.33
$$

then the assignment is highly uncertain.

So $r_{jn}$ plays the same intuitive role as the ordinary EM responsibility:

$$
\langle z_{jn}\rangle
$$

but now it is part of a larger Bayesian approximation.

</details>

<details open>
<summary><strong>A Small Numeric Example For <i>q</i><sub>Z</sub>(Z)</strong></summary>

Suppose there are three components and one data point $x_n$.

The variational responsibilities might be:

$$
r_{1n}=0.1,
\quad
r_{2n}=0.7,
\quad
r_{3n}=0.2
$$

The one-hot label vector could be:

$$
z_n
=
\begin{bmatrix}
0\\
1\\
0
\end{bmatrix}
$$

Using equation (73), the contribution of this assignment is:

$$
\prod_{j=1}^{3}
r_{jn}^{z_{jn}}
=
r_{1n}^{0}
r_{2n}^{1}
r_{3n}^{0}
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
r_{1n}^{0}
r_{2n}^{1}
r_{3n}^{0}
=
1\cdot 0.7\cdot 1
=
0.7
$$

So the variational distribution assigns probability 0.7 to the claim:

> data point $x_n$ belongs to component 2.

Plain English:

> equation (73) is just a compact way to store soft probabilities over possible
> component labels.

</details>

<details open>
<summary><strong>Equation (74): The Variational Distribution Over Mixing Weights</strong></summary>

Equation (74) is:

$$
q_{\pi}(\boldsymbol{\pi})
=
\operatorname{Dir}(\boldsymbol{\pi}\mid\{\lambda_j\})
\tag{74}
$$

This says the approximate posterior over mixing weights is also Dirichlet.

The symbol:

$$
\lambda_j
$$

is the updated Dirichlet parameter for component $j$.

It is not the mixing weight itself.

The actual mixing weight is still:

$$
\pi_j
$$

and the weights still satisfy:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

That matches the prior form:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(\alpha_1,\ldots,\alpha_M)
$$

This is conjugacy again.

The prior is Dirichlet, the hidden component assignments are categorical, and
the posterior approximation remains Dirichlet.

The parameters:

$$
\lambda_j
$$

are variational parameters.

They play the role of updated component counts plus prior strength.

Plain English:

> after seeing the data softly assigned to components, our belief about the
> mixing weights is still Dirichlet, but with updated parameters.

For intuition, imagine ordinary EM found effective component counts:

$$
N_1=50,
\quad
N_2=30,
\quad
N_3=20
$$

In a Bayesian version, the Dirichlet posterior parameters behave like:

$$
\lambda_j
\approx
\text{prior pseudo-count for component }j
+
\text{soft data count for component }j
$$

For a small numeric example, suppose:

$$
\alpha_j=1
$$

for every component, and the current soft count for component 2 is:

$$
N_2=30
$$

Then:

$$
\lambda_2
\approx
1+30
=
31
$$

So $\lambda_2$ is not saying:

> $\pi_2=31$.

That would be impossible because $\pi_2$ is a probability.

Instead, $\lambda_2$ is saying:

> component 2 has prior strength plus soft evidence equivalent to about 31
> counts.

Relative to the other $\lambda_j$ values, a larger $\lambda_j$ pushes the
posterior toward a larger expected mixing weight for component $j$.

</details>

<details open>
<summary><strong>Equation (75): The Variational Distribution Over Means And Precisions</strong></summary>

Equation (75) is:

$$
q_{\mu T}(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
q_{\mu}(\boldsymbol{\mu}_j\mid T_j)
q_T(T_j)
\tag{75}
$$

This says the approximate posterior over the Gaussian parameters factorises
over components.

For each component $j$, we keep:

- a variational distribution over the mean, conditional on the precision
- a variational distribution over the precision matrix

The conditional structure:

$$
q_{\mu}(\boldsymbol{\mu}_j\mid T_j)
$$

is important.

It keeps a dependency between the component mean and the component precision,
instead of fully separating them.

This matches the prior structure introduced earlier:

$$
p(\boldsymbol{\mu}_j,T_j)
=
p(\boldsymbol{\mu}_j\mid T_j)p(T_j)
$$

So equation (75) is not introducing a new dependency pattern without
justification.

It reuses the same useful structure:

$$
\text{mean given precision}
\quad
\times
\quad
\text{precision}
$$

The approximation factorises **across components**, but within each component
it keeps the mean and precision connected.

That is a more careful approximation than fully splitting everything into:

$$
q_{\mu}(\boldsymbol{\mu}_j)q_T(T_j)
$$

because the uncertainty about a component centre and the uncertainty about its
shape are naturally related.

Plain English:

> each component gets its own approximate posterior over its centre and shape.

</details>

<details open>
<summary><strong>Equation (76): The Variational Distribution Over Means</strong></summary>

Equation (76) gives the form of the approximate posterior over component means:

$$
q_{\mu}(\boldsymbol{\mu}\mid T)
=
\prod_{j=1}^{M}
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{m}_j,\beta_jT_j)
\tag{76}
$$

The paper writes this in a compact way, but the meaning is:

> for each component $j$, the approximate posterior over
> $\boldsymbol{\mu}_j$ is Gaussian.

The variational parameters are:

$$
\boldsymbol{m}_j
$$

and:

$$
\beta_j
$$

Here:

- $\boldsymbol{m}_j$ is the posterior mean-like location for component $j$
- $\beta_jT_j$ is the precision of the Gaussian distribution over
  $\boldsymbol{\mu}_j$

The parameter $\beta_j$ here is a **variational parameter** for component $j$.

It should not be confused with $\beta_0$, which was the fixed hyperparameter
in the prior:

$$
p(\boldsymbol{\mu}_j\mid T_j)
=
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{\mu}_0,\beta_0T_j)
$$

The prior uses $\beta_0$.

The approximate posterior uses $\beta_j$.

In covariance notation, that Gaussian would have covariance:

$$
(\beta_jT_j)^{-1}
$$

So if $\beta_jT_j$ is large, the approximate posterior over
$\boldsymbol{\mu}_j$ is more concentrated around $\boldsymbol{m}_j$.

Plain English:

> the model is uncertain about each component centre, and that uncertainty is
> represented by a Gaussian distribution.

</details>

<details open>
<summary><strong>Equation (77): The Variational Distribution Over Precisions</strong></summary>

Equation (77) gives the form of the approximate posterior over precision
matrices:

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
\tag{77}
$$

So each component precision matrix has a Wishart variational distribution.

The variational parameters are:

$$
\eta_j
$$

and:

$$
U_j
$$

These update our belief about the shape and orientation of component $j$.

They are variational parameters, just like $\lambda_j$ and
$\boldsymbol{m}_j$ were variational parameters in the earlier factors.

They are not observed data values.

They are not fixed hyperparameters.

They are the values adjusted by the variational EM update equations.

Roughly:

- $\eta_j$ acts like a strength or degrees-of-freedom parameter
- $U_j$ acts like a matrix parameter controlling the scale and orientation

So:

$$
W(T_j\mid\eta_j,U_j)
$$

means:

> the approximate posterior over the precision matrix $T_j$ is controlled by
> the updated parameters $\eta_j$ and $U_j$.

This mirrors the prior:

$$
T_j
\sim
W(\nu,V)
$$

Again, this is conjugacy.

The prior over $T_j$ is Wishart, and the variational posterior over $T_j$ is
also Wishart.

Plain English:

> the model is uncertain about each component's shape, and that uncertainty is
> represented by a Wishart distribution over precision matrices.

</details>

<details open>
<summary><strong>Putting Equations (72)-(77) Together</strong></summary>

The exact posterior is:

$$
p(Z,\boldsymbol{\pi},\boldsymbol{\mu},T\mid X)
$$

The mean-field approximation from equation (72) is:

$$
q(h)
=
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
$$

Then equations (73)-(77) specify the form of each factor:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

$$
q_{\pi}(\boldsymbol{\pi})
=
\operatorname{Dir}(\boldsymbol{\pi}\mid\{\lambda_j\})
$$

$$
q_{\mu T}(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
q_{\mu}(\boldsymbol{\mu}_j\mid T_j)
q_T(T_j)
$$

$$
q_{\mu}(\boldsymbol{\mu}\mid T)
=
\prod_{j=1}^{M}
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{m}_j,\beta_jT_j)
$$

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
$$

So the approximate posterior has:

- categorical-style factors for the hidden labels
- a Dirichlet factor for the mixing weights
- Gaussian factors for the component means
- Wishart factors for the precision matrices

The unknown quantities inside these variational factors are:

$$
r_{jn},
\quad
\lambda_j,
\quad
\boldsymbol{m}_j,
\quad
\beta_j,
\quad
\eta_j,
\quad
U_j
$$

These are called **variational parameters**.

They are not model parameters in the same sense as the original GMM parameters.

Instead, they are the parameters of the approximate posterior distribution
$q(h)$.

So this block tells us the **shape** of the approximation:

$$
q(h)
$$

The next variational EM block will tell us how to **update** those variational
parameters.

Plain English:

> the full Bayesian posterior is too hard, so the paper approximates it with
> familiar distribution families that match the priors and likelihood.

</details>

<details open>
<summary><strong>Why The Paper Does Not Stop Here</strong></summary>

The full Bayesian GMM has two important advantages over ordinary maximum
likelihood GMM training.

First, it helps avoid singular covariance solutions.

In ordinary ML training, a component can collapse onto one data point. Its
covariance becomes extremely small, its density becomes extremely large, and
the likelihood can behave badly.

The Bayesian priors reduce this problem because the component parameters are
regularised by prior distributions.

Second, Bayesian GMMs can help with model selection.

Instead of choosing the number of components only by cross-validation, the
Bayesian framework can compare models through the variational lower bound.

However, the paper also points out a limitation.

In the full Bayesian GMM, the mixing weights have a Dirichlet prior:

$$
\boldsymbol{\pi}
\sim
\operatorname{Dir}(\alpha_1,\ldots,\alpha_M)
$$

This keeps every component inside the mixture. It does not naturally set a
component's mixing weight exactly to zero.

The distinction is:

- a Dirichlet posterior can put mass near very small values of $\pi_j$
- but with positive Dirichlet parameters, it does not usually create a hard
  point estimate where $\pi_j=0$ exactly

So a redundant component may become small, but it is not cleanly switched off.

So if we start with too many components, the full Bayesian model may not remove
redundant components as cleanly as we would like.

This motivates the next model in the paper: a Bayesian GMM where the mixing
weights:

$$
\boldsymbol{\pi}
$$

are treated as parameters rather than random variables with a prior.

Plain English:

> equations (71)-(77) define the full Bayesian GMM, but the next block modifies
> the model so redundant mixture components can be driven toward zero weight.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Equation (71) writes the Gaussian mixture using precision matrices:

$$
p(x)
=
\sum_{j=1}^{M}
\pi_j
\mathcal{N}(x\mid\boldsymbol{\mu}_j,T_j)
$$

Equation (72) gives the mean-field factorisation:

$$
q(h)
=
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
$$

Equation (73) gives the approximate posterior over hidden labels:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

Equation (74) gives the approximate posterior over mixing weights:

$$
q_{\pi}(\boldsymbol{\pi})
=
\operatorname{Dir}(\boldsymbol{\pi}\mid\{\lambda_j\})
$$

Equation (75) factorises the approximate posterior over means and precisions:

$$
q_{\mu T}(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
q_{\mu}(\boldsymbol{\mu}_j\mid T_j)
q_T(T_j)
$$

Equation (76) gives the approximate posterior over means:

$$
q_{\mu}(\boldsymbol{\mu}\mid T)
=
\prod_{j=1}^{M}
\mathcal{N}(\boldsymbol{\mu}_j\mid\boldsymbol{m}_j,\beta_jT_j)
$$

Equation (77) gives the approximate posterior over precision matrices:

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
$$

The variational parameters have the following roles:

- $r_{jn}$ controls the soft assignment of observation $n$ to component $j$
- $\lambda_j$ controls the approximate posterior over the mixing weight
  $\pi_j$
- $\boldsymbol{m}_j$ controls the posterior location of component mean
  $\boldsymbol{\mu}_j$
- $\beta_j$ controls how tightly $\boldsymbol{\mu}_j$ is distributed around
  $\boldsymbol{m}_j$
- $\eta_j$ and $U_j$ control the approximate posterior over the precision
  matrix $T_j$

The key idea is:

> the full Bayesian GMM replaces point estimates with posterior distributions,
> and variational inference approximates those posterior distributions using a
> manageable mean-field factorisation.

</details>

---

## Block 2: Equations (78)-(83)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The previous block described the **full Bayesian GMM**.

In that model, the mixing weights:

$$
\boldsymbol{\pi}
$$

were random variables with a Dirichlet prior.

This block changes that modelling choice.

The paper introduces a modified Bayesian GMM in which:

- the component means $\boldsymbol{\mu}$ remain Bayesian random variables
- the component precision matrices $T$ remain Bayesian random variables
- the hidden component assignments $Z$ remain latent random variables
- the mixing weights $\boldsymbol{\pi}$ are now treated as parameters to be
  optimised

The paper calls this the **CB model**, after Corduneanu and Bishop, the authors
of the work cited as reference [28].

The equation sequence is:

| Paper equation | Role in the model |
|---|---|
| (78) | places independent Gaussian priors on the component means |
| (79) | places independent Wishart priors on the component precisions |
| (80) | defines the marginal likelihood after integrating out the hidden random variables |
| (81) | introduces a variational lower bound on the log marginal likelihood |
| (82) | writes that lower bound explicitly for $Z$, $\boldsymbol{\mu}$, and $T$ |
| (83) | chooses a mean-field factorisation for the approximate posterior |

The key modelling move is:

$$
\boldsymbol{\pi}
\quad
\text{moves from the variational posterior into the M-step}
$$

Plain English:

> the model keeps Bayesian uncertainty over component locations and shapes, but
> it turns the mixing weights into adjustable parameters so that redundant
> components can be pushed all the way to zero weight.

</details>

<details open>
<summary><strong>Bridge From The Full Bayesian GMM</strong></summary>

In the full Bayesian model from equations (71)-(77), the unknown bundle was:

$$
h
=
(Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
$$

The approximate posterior therefore included a factor for the mixing weights:

$$
q_{\pi}(\boldsymbol{\pi})
$$

Specifically:

$$
q(h)
=
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
$$

The modified model removes the Dirichlet prior on:

$$
\boldsymbol{\pi}
$$

and treats the mixing weights as parameters.

So the hidden random-variable bundle is redefined as:

$$
h
=
(Z,\boldsymbol{\mu},T)
$$

This is a small-looking notation change with a major algorithmic consequence.

The new approximate posterior will describe uncertainty about:

$$
Z,
\quad
\boldsymbol{\mu},
\quad
T
$$

but it will **not** describe uncertainty about:

$$
\boldsymbol{\pi}
$$

Instead, the algorithm will choose one parameter vector:

$$
\boldsymbol{\pi}
$$

by maximising a variational objective.

This creates a variational EM structure:

- the variational E-step updates the approximate posterior over
  $Z,\boldsymbol{\mu},T$
- the variational M-step updates the mixing-weight parameter
  $\boldsymbol{\pi}$

Plain English:

> the full model asks for a posterior distribution over the mixing weights;
> the modified model asks for one best mixing-weight vector while retaining
> Bayesian uncertainty over the component means and precisions.

This model is still Bayesian in an important sense.

It still places priors over:

$$
\boldsymbol{\mu}
\quad
\text{and}
\quad
T
$$

and integrates those quantities out when defining the marginal likelihood.

It is therefore a **partially Bayesian** or **empirical-Bayes-style** model,
rather than an ordinary maximum-likelihood GMM.

</details>

<details open>
<summary><strong>Figure 7(b): What Changes In The Graphical Model</strong></summary>

Figure 7 compares the full Bayesian model on the left with the modified model
on the right.

![Figure 7: Full Bayesian GMM and Bayesian GMM without a prior on the mixing weights](assets/gmm_figure7_graphical_models.png)

For this block, the important diagram is **Figure 7(b)**.

In both diagrams:

$$
Z
\longrightarrow
X
$$

because the hidden label selects the component that generates each
observation.

Also:

$$
\boldsymbol{\mu}
\longrightarrow
X
$$

and:

$$
T
\longrightarrow
X
$$

because component means and precisions control the Gaussian distributions.

The important difference is the role of:

$$
\boldsymbol{\pi}
$$

In Figure 7(a), $\boldsymbol{\pi}$ is a random node with its own prior.

In Figure 7(b), $\boldsymbol{\pi}$ is a parameter. It still controls the
distribution of the hidden labels:

$$
p(z_{jn}=1;\boldsymbol{\pi})
=
\pi_j
$$

but it is no longer included in the hidden random-variable bundle that the
variational posterior must approximate.

Plain English:

> the arrow from the mixing weights to the labels remains, but the mathematical
> status of the mixing weights changes from uncertain random variables to
> optimised parameters.

</details>

<details open>
<summary><strong>Notation And Roles Before The Equations</strong></summary>

The observed dataset is:

$$
X
=
\{x_1,\ldots,x_N\}
$$

where:

$$
x_n\in\mathbb{R}^d
$$

The model begins with:

$$
M
$$

Gaussian components.

The main quantities in this block are:

| Symbol | Role in the modified model | Meaning |
|---|---|---|
| $X$ | observed data | all observed feature vectors |
| $Z$ | latent random variable | hidden component assignments |
| $\boldsymbol{\mu}$ | Bayesian random variable | collection of component means |
| $T$ | Bayesian random variable | collection of component precision matrices |
| $\boldsymbol{\pi}$ | model parameter | mixing weights to be optimised |
| $\beta$ | fixed hyperparameter | prior precision for component means |
| $\nu$ | fixed hyperparameter | Wishart degrees of freedom |
| $V$ | fixed hyperparameter | matrix parameter in the Wishart prior |
| $q$ | variational distribution | approximation to the posterior over $Z,\boldsymbol{\mu},T$ |

The new hidden bundle is:

$$
h
=
(Z,\boldsymbol{\mu},T)
$$

The approximate posterior is:

$$
q(h)
=
q(Z,\boldsymbol{\mu},T)
$$

The mixing weights are not inside either expression:

$$
h
\neq
(Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
$$

and:

$$
q(h)
\neq
q(Z,\boldsymbol{\pi},\boldsymbol{\mu},T)
$$

That was the full Bayesian model from the previous block, not the modified
model used here.

One further notation warning is important.

The symbol:

$$
\beta
$$

in this GMM block is the fixed prior precision for the component means.

It should not be confused with:

- the observation-noise precision $\beta$ in the earlier regression model
- the prior hyperparameter $\beta_0$ in the full Bayesian GMM
- the variational parameters $\beta_j$ in equation (76)

Plain English:

> the same Greek letter is reused, but its local role in equations (78)-(93) is
> the strength of the zero-centred prior on the component means.

</details>

<details open>
<summary><strong>Equation (78): Gaussian Priors Over Component Means</strong></summary>

Equation (78) is:

$$
p(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
\tag{78}
$$

This gives every component mean its own Gaussian prior.

The product:

$$
\prod_{j=1}^{M}
$$

says that the component means are independent under the prior.

For three components:

$$
p(\boldsymbol{\mu})
=
p(\boldsymbol{\mu}_1)
p(\boldsymbol{\mu}_2)
p(\boldsymbol{\mu}_3)
$$

Each prior is centred at:

$$
\boldsymbol{0}
$$

So before seeing the data, the prior does not favour a positive or negative
direction for any component centre.

The matrix:

$$
\beta I
$$

controls how tightly the component mean is concentrated around zero.

**A Precision-Parameterisation Warning**

The paper uses a precision parameterisation in this section.

So in:

$$
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
$$

the final argument:

$$
\beta I
$$

is a **precision matrix**, not a covariance matrix.

In covariance notation, the same prior is:

$$
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
(\beta I)^{-1}
\right)
$$

Because:

$$
(\beta I)^{-1}
=
\beta^{-1}I
$$

we can also write:

$$
\boldsymbol{\mu}_j
\sim
\mathcal{N}
\left(
\boldsymbol{0},
\beta^{-1}I
\right)
$$

when the last argument is understood as covariance.

Therefore:

- large $\beta$ means a narrow prior and stronger pull toward zero
- small $\beta$ means a wide prior and weaker pull toward zero

This prior is different from the Gauss-Wishart prior in the previous block.

Previously:

$$
p(\boldsymbol{\mu}_j\mid T_j)
$$

made the prior over the mean depend on the component precision.

Now:

$$
p(\boldsymbol{\mu}_j)
$$

is independent of $T_j$ under the prior.

Plain English:

> every component centre starts with the same zero-centred Gaussian prior, and
> $\beta$ controls how reluctant the model is to move a centre far from zero.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Mean Prior</strong></summary>

Use a one-dimensional component mean:

$$
\mu_j\in\mathbb{R}
$$

The general prior from equation (78), written using variance, is:

$$
\mu_j
\sim
\mathcal{N}
\left(
0,
\beta^{-1}
\right)
$$

Suppose:

$$
\beta
=
4
$$

Now substitute this value into the prior variance:

$$
\beta^{-1}
=
\frac{1}{4}
=
0.25
$$

So the prior is:

$$
\mu_j
\sim
\mathcal{N}(0,0.25)
$$

The corresponding prior standard deviation is:

$$
\sqrt{0.25}
=
0.5
$$

This is a fairly concentrated prior around zero.

Now compare it with:

$$
\beta
=
0.25
$$

The general prior variance is still:

$$
\beta^{-1}
$$

Substituting:

$$
\beta^{-1}
=
\frac{1}{0.25}
=
4
$$

So:

$$
\mu_j
\sim
\mathcal{N}(0,4)
$$

with standard deviation:

$$
\sqrt{4}
=
2
$$

The second prior allows component means to move much farther from zero.

Plain English:

> increasing $\beta$ strengthens the zero-centred pull on every component mean;
> decreasing $\beta$ gives the component centres more freedom.

</details>

<details open>
<summary><strong>Equation (79): Wishart Priors Over Component Precisions</strong></summary>

Equation (79) is:

$$
p(T)
=
\prod_{j=1}^{M}
W(T_j\mid\nu,V)
\tag{79}
$$

This gives every component precision matrix:

$$
T_j
$$

its own Wishart prior.

Again, the product over components means prior independence:

$$
p(T)
=
p(T_1)p(T_2)\cdots p(T_M)
$$

The Wishart distribution is appropriate because a precision matrix must be
positive definite.

That requirement ensures that the corresponding covariance:

$$
\Sigma_j
=
T_j^{-1}
$$

is a valid covariance matrix.

The hyperparameters are:

$$
\nu
$$

and:

$$
V
$$

where:

- $\nu$ controls the degrees of freedom or prior strength
- $V$ controls the matrix scale under the paper's chosen parameterisation

**A Parameterisation Warning About $V$**

The paper calls $V$ a scale matrix.

However, its displayed Wishart density contains:

$$
\exp
\left\{
-\frac{1}{2}
\operatorname{tr}(VT_j)
\right\}
$$

and its later expectation formula has the form:

$$
\langle T_j\rangle
=
\eta_j U_j^{-1}
$$

So $V$ behaves like a **rate-like** or **inverse-scale** matrix in the displayed
formula.

This is a notation convention, not a change in the modelling idea.

The important reading for this block is:

> $W(T_j\mid\nu,V)$ is a prior distribution over valid precision matrices, and
> its hyperparameters regularise the possible shapes of component $j$.

This prior helps prevent the maximum-likelihood singularity where a component
collapses onto one observation with nearly infinite precision.

Plain English:

> the Gaussian prior regularises where a component can be centred, while the
> Wishart prior regularises how narrow, stretched, and oriented the component
> can become.

</details>

<details open>
<summary><strong>Putting Equations (78)-(79) Into The Modified Model</strong></summary>

The prior over all Bayesian component parameters is:

$$
p(\boldsymbol{\mu},T)
=
p(\boldsymbol{\mu})p(T)
$$

Equation (78) gives:

$$
p(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
$$

Equation (79) gives:

$$
p(T)
=
\prod_{j=1}^{M}
W(T_j\mid\nu,V)
$$

Now substitute both prior expressions into the joint prior:

$$
p(\boldsymbol{\mu},T)
=
\left[
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
\right]
\left[
\prod_{j=1}^{M}
W(T_j\mid\nu,V)
\right]
$$

Because both products use the same component index, this can be grouped as:

$$
p(\boldsymbol{\mu},T)
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
W(T_j\mid\nu,V)
$$

This factorisation says that before seeing the data:

- different components are independent
- each component mean is independent of its precision
- all components use the same prior hyperparameters

The components do not remain unrelated after observing $X$.

They compete to explain the same data through the hidden assignments $Z$ and
the shared mixing-weight constraint:

$$
\sum_{j=1}^{M}
\pi_j
=
1
$$

Plain English:

> the priors begin independently, but the likelihood makes components compete
> for responsibility once they all try to explain the same observations.

</details>

<details open>
<summary><strong>Equation (80): The Marginal Likelihood</strong></summary>

The hidden random-variable bundle in the modified model is:

$$
h
=
(Z,\boldsymbol{\mu},T)
$$

The mixing weights:

$$
\boldsymbol{\pi}
$$

are parameters.

Equation (80) defines the marginal likelihood:

$$
p(X;\boldsymbol{\pi})
=
\int
p(X,h;\boldsymbol{\pi})
\,
dh
\tag{80}
$$

The semicolon in:

$$
p(X;\boldsymbol{\pi})
$$

emphasises that $\boldsymbol{\pi}$ is being treated as a parameter rather than
as a random variable with a posterior distribution.

The joint model can be factorised as:

$$
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
=
p(X\mid Z,\boldsymbol{\mu},T)
p(Z;\boldsymbol{\pi})
p(\boldsymbol{\mu})
p(T)
$$

The four pieces are:

- $p(X\mid Z,\boldsymbol{\mu},T)$, the Gaussian likelihood
- $p(Z;\boldsymbol{\pi})$, the component-assignment model
- $p(\boldsymbol{\mu})$, the Gaussian mean prior
- $p(T)$, the Wishart precision prior

Equation (80) is written with one compact integral:

$$
\int
p(X,h;\boldsymbol{\pi})
\,
dh
$$

but $h$ contains both discrete and continuous variables.

The labels:

$$
Z
$$

are discrete, so they must be summed over.

The means and precisions:

$$
\boldsymbol{\mu},
\quad
T
$$

are continuous, so they must be integrated over.

Therefore, the explicit form of equation (80) is:

$$
p(X;\boldsymbol{\pi})
=
\sum_Z
\int
\int
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\,
d\boldsymbol{\mu}
\,
dT
$$

Now reproduce the joint factorisation:

$$
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
=
p(X\mid Z,\boldsymbol{\mu},T)
p(Z;\boldsymbol{\pi})
p(\boldsymbol{\mu})
p(T)
$$

Substituting this joint factorisation into the explicit marginal likelihood
gives:

$$
p(X;\boldsymbol{\pi})
=
\sum_Z
\int
\int
p(X\mid Z,\boldsymbol{\mu},T)
p(Z;\boldsymbol{\pi})
p(\boldsymbol{\mu})
p(T)
\,
d\boldsymbol{\mu}
\,
dT
$$

There is no integration over:

$$
\boldsymbol{\pi}
$$

because the mixing weights are not random variables in this model.

Instead, the aim is to choose:

$$
\boldsymbol{\pi}
$$

to make this marginal likelihood large.

Plain English:

> for any candidate mixing-weight vector, the model scores the observed data
> after averaging over every possible label assignment, component mean, and
> precision matrix.

</details>

<details open>
<summary><strong>Why Equation (80) Is Difficult To Optimise Directly</strong></summary>

The marginal likelihood is:

$$
p(X;\boldsymbol{\pi})
=
\sum_Z
\int
\int
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\,
d\boldsymbol{\mu}
\,
dT
$$

There are two sources of difficulty.

First, the sum:

$$
\sum_Z
$$

runs over every possible assignment of all $N$ observations to $M$
components.

The number of assignment patterns is:

$$
M^N
$$

For example, if:

$$
M=4,
\quad
N=20
$$

then the number of possible assignment patterns is:

$$
4^{20}
=
1{,}099{,}511{,}627{,}776
$$

Second, for every assignment pattern, the model must integrate over:

$$
\boldsymbol{\mu}
\quad
\text{and}
\quad
T
$$

So direct evaluation requires:

> a huge sum over label configurations combined with multidimensional
> integration over component centres and shapes.

The posterior:

$$
p(Z,\boldsymbol{\mu},T\mid X;\boldsymbol{\pi})
$$

is therefore not available in a convenient exact form.

This is why the paper introduces:

$$
q(Z,\boldsymbol{\mu},T)
$$

as a manageable approximation.

</details>

<details open>
<summary><strong>Equation (81): The Variational Lower Bound</strong></summary>

Equation (81) introduces the variational objective:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
\leq
\ln p(X;\boldsymbol{\pi})
\tag{81}
$$

This quantity is commonly called the:

$$
\text{evidence lower bound}
$$

or:

$$
\text{ELBO}
$$

The paper writes it as:

$$
F[q,\boldsymbol{\pi}]
$$

The two arguments matter:

- $q$ is the approximate posterior we can adjust
- $\boldsymbol{\pi}$ is the mixing-weight parameter we can adjust

So the algorithm will try to increase the same bound by changing two different
kinds of object.

Plain English:

> instead of directly maximising the difficult log marginal likelihood, the
> algorithm maximises an objective that is guaranteed not to exceed it. The
> objective becomes computationally manageable after $q$ is restricted to the
> factorised family introduced in equation (83).

</details>

<details open>
<summary><strong>Deriving The Lower Bound Step By Step</strong></summary>

Start from the marginal likelihood in equation (80):

$$
p(X;\boldsymbol{\pi})
=
\int
p(X,h;\boldsymbol{\pi})
\,
dh
$$

Introduce any normalised distribution:

$$
q(h)
$$

such that:

$$
\int q(h)\,dh
=
1
$$

At this point, $q(h)$ is not being claimed to be the exact posterior.

It is an auxiliary probability distribution that we are free to choose over
the same possible values of $h$.

There is one technical condition.

Whenever:

$$
p(X,h;\boldsymbol{\pi})
>
0
$$

we require:

$$
q(h)
>
0
$$

Otherwise the ratio:

$$
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

would divide by zero in a region that contributes to the marginal likelihood.

This condition is often described by saying:

> $q$ must have support everywhere the joint density has support.

For the logarithmic lower bound to remain finite, it is also useful to avoid
giving $q$ positive mass where the joint density is zero. In the derivation
below, we therefore assume the ratio is positive wherever $q$ places weight.

**Why Multiplying And Dividing By The Auxiliary Density Changes Nothing**

For any value of $h$ where $q(h)>0$:

$$
\frac{q(h)}{q(h)}
=
1
$$

Multiplying any quantity by 1 leaves it unchanged.

Therefore:

$$
p(X,h;\boldsymbol{\pi})
=
1\cdot p(X,h;\boldsymbol{\pi})
$$

Now reproduce the identity for 1:

$$
1
=
\frac{q(h)}{q(h)}
$$

Substituting this identity gives:

$$
p(X,h;\boldsymbol{\pi})
=
\frac{q(h)}{q(h)}
p(X,h;\boldsymbol{\pi})
$$

Rearrange the multiplication:

$$
p(X,h;\boldsymbol{\pi})
=
q(h)
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

So this is not a new probabilistic factorisation and it is not yet an
approximation.

It is the ordinary algebraic identity:

$$
a
=
b\frac{a}{b}
$$

with:

$$
a
=
p(X,h;\boldsymbol{\pi})
$$

and:

$$
b
=
q(h)
$$

The reason for using this apparently unnecessary identity is that it creates
the exact pattern needed for an expectation under $q$.

Before substituting, the marginal likelihood is:

$$
p(X;\boldsymbol{\pi})
=
\int
p(X,h;\boldsymbol{\pi})
\,
dh
$$

Rewrite the joint density as:

$$
p(X,h;\boldsymbol{\pi})
=
q(h)
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

Now substitute this expression into the marginal likelihood:

$$
p(X;\boldsymbol{\pi})
=
\int
q(h)
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

The factor:

$$
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

corrects for the fact that we inserted $q(h)$.

If $q(h)$ gives a region a small weight, the ratio compensates by becoming
larger there. If $q(h)$ gives a region a large weight, the ratio compensates by
becoming smaller.

That compensation is why the integral still equals the original marginal
likelihood for any valid choice of $q$.

**Why This Is An Expectation Under The Auxiliary Distribution**

For a continuous random variable:

$$
H
\sim
q
$$

the expectation of any function $g(H)$ is **defined** as:

$$
\mathbb{E}_{q(h)}[g(H)]
=
\int
q(h)g(h)
\,
dh
$$

This is a probability-weighted average.

The density $q(h)$ supplies the weights, while $g(h)$ supplies the quantity
being averaged at each possible value of $h$.

For this derivation, define the function:

$$
g(h)
=
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

Now reproduce the definition of expectation:

$$
\mathbb{E}_{q(h)}[g(H)]
=
\int
q(h)g(h)
\,
dh
$$

Substitute the chosen function $g(h)$:

$$
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
=
\int
q(h)
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

The right-hand side is exactly the rewritten marginal-likelihood integral.

Therefore it can be written as:

$$
p(X;\boldsymbol{\pi})
=
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

The uppercase $H$ inside the expectation emphasises that it is a random
quantity drawn according to $q$. The lowercase $h$ inside an integral is the
dummy value over which we integrate.

Because the GMM hidden bundle contains both discrete and continuous variables,
the fully explicit expectation will later contain:

- a sum over $Z$
- an integral over $\boldsymbol{\mu}$
- an integral over $T$

The compact expectation notation temporarily hides those operations, but it
does not remove them.

Most importantly, no approximation has occurred yet:

$$
p(X;\boldsymbol{\pi})
=
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

is an exact identity for every valid $q$.

Plain English:

> We insert $q/q=1$ so that $q$ can act as a set of averaging weights. The
> ratio $p/q$ exactly corrects for those artificial weights, so the value has
> not changed. This prepares the expression for the next step, where Jensen's
> inequality will create the actual lower bound.

Now take the logarithm.

Before taking the logarithm, we have:

$$
p(X;\boldsymbol{\pi})
=
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

Both sides are positive because they equal the marginal probability or density
of the observed data. We can therefore apply the logarithm to both sides
without changing the equality.

Therefore:

$$
\ln p(X;\boldsymbol{\pi})
=
\ln
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

The logarithm is a concave function.

Jensen's inequality for a concave function says:

$$
\ln \mathbb{E}[Y]
\geq
\mathbb{E}[\ln Y]
$$

The direction of the inequality matters.

For a concave function such as the logarithm:

> applying the logarithm after averaging gives a value at least as large as
> averaging the logarithms of the individual values.

A tiny numeric example makes the direction visible.

Suppose a positive random variable $Y$ is equally likely to be:

$$
Y=2
$$

or:

$$
Y=8
$$

Its expectation is:

$$
\mathbb{E}[Y]
=
0.5(2)+0.5(8)
=
5
$$

Taking the logarithm after averaging gives:

$$
\ln\mathbb{E}[Y]
=
\ln(5)
\approx
1.609
$$

Now reproduce the expected-log expression:

$$
\mathbb{E}[\ln Y]
$$

Substituting the two equally weighted values gives:

$$
\mathbb{E}[\ln Y]
=
0.5\ln(2)
+
0.5\ln(8)
$$

So:

$$
\mathbb{E}[\ln Y]
\approx
0.5(0.693)
+
0.5(2.079)
=
1.386
$$

Therefore:

$$
1.609
\geq
1.386
$$

which agrees with:

$$
\ln \mathbb{E}[Y]
\geq
\mathbb{E}[\ln Y]
$$

In the variational derivation, the positive random variable is the function of
$H$:

$$
Y(H)
=
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
$$

It is positive wherever the joint density is positive, and $H$ is distributed
according to $q$.

Before applying Jensen's inequality, reproduce the log marginal likelihood:

$$
\ln p(X;\boldsymbol{\pi})
=
\ln
\mathbb{E}_{q(h)}
\left[
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

Now apply:

$$
\ln \mathbb{E}[Y]
\geq
\mathbb{E}[\ln Y]
$$

to obtain:

$$
\ln p(X;\boldsymbol{\pi})
\geq
\mathbb{E}_{q(h)}
\left[
\ln
\frac{
p(X,H;\boldsymbol{\pi})
}{
q(H)
}
\right]
$$

Writing the expectation as an integral gives:

$$
\ln p(X;\boldsymbol{\pi})
\geq
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

The right-hand side is defined as:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

Therefore:

$$
F[q,\boldsymbol{\pi}]
\leq
\ln p(X;\boldsymbol{\pi})
$$

which is equation (81).

The inequality is not an arbitrary approximation.

It follows directly from:

$$
\ln \mathbb{E}[Y]
\geq
\mathbb{E}[\ln Y]
$$

This is the first point at which equality is replaced by an inequality.

Before Jensen's inequality, inserting $q(h)/q(h)$ was exact. After Jensen's
inequality, the right-hand side may be smaller than the log marginal
likelihood, so it becomes a lower bound.

The new expression is useful because the logarithm now acts on a ratio of
densities:

$$
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

rather than acting outside a difficult integral:

$$
\ln
\int
p(X,h;\boldsymbol{\pi})
\,
dh
$$

Once the joint density and $q$ are factorised, the log of their products turns
into sums of expected log terms. Conjugate priors then make many of those
expectations and coordinate updates available in closed form.

Plain English:

> First we introduce $q$ using the exact identity $q/q=1$. That lets us express
> the marginal likelihood as a $q$-weighted average. Jensen's inequality is the
> separate step that turns this exact average into a lower bound by moving the
> logarithm inside. Moving the log inside is useful because logs turn the
> model's products into sums that can be handled factor by factor.

</details>

<details open>
<summary><strong>Why The Bound Measures Posterior Approximation Quality</strong></summary>

The exact posterior is:

$$
p(h\mid X;\boldsymbol{\pi})
=
\frac{
p(X,h;\boldsymbol{\pi})
}{
p(X;\boldsymbol{\pi})
}
$$

The Kullback-Leibler divergence from $q(h)$ to this posterior is:

$$
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
=
\int
q(h)
\ln
\frac{
q(h)
}{
p(h\mid X;\boldsymbol{\pi})
}
\,
dh
$$

This is another expectation under $q$.

Using the definition:

$$
\mathbb{E}_{q(h)}[g(H)]
=
\int q(h)g(h)\,dh
$$

the KL divergence can be read as:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\mathbb{E}_{q(h)}
\left[
\ln
\frac{
q(H)
}{
p(H\mid X;\boldsymbol{\pi})
}
\right]
$$

So $q$ supplies the averaging weights, and the log ratio measures how
differently $q$ and the exact posterior weight each possible hidden state.

The KL divergence is not a symmetric geometric distance:

$$
\operatorname{KL}(q\|p)
\neq
\operatorname{KL}(p\|q)
$$

The direction $\operatorname{KL}(q\|p)$ is not chosen arbitrarily here. It is
the direction that appears when the lower bound is subtracted from the log
marginal likelihood, as the following algebra shows.

Now reproduce the posterior before substituting it:

$$
p(h\mid X;\boldsymbol{\pi})
=
\frac{
p(X,h;\boldsymbol{\pi})
}{
p(X;\boldsymbol{\pi})
}
$$

Substitute this posterior into the KL divergence:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\int
q(h)
\ln
\left[
\frac{
q(h)
}{
p(X,h;\boldsymbol{\pi})/p(X;\boldsymbol{\pi})
}
\right]
\,
dh
$$

Dividing by a fraction gives:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\int
q(h)
\ln
\left[
\frac{
q(h)p(X;\boldsymbol{\pi})
}{
p(X,h;\boldsymbol{\pi})
}
\right]
\,
dh
$$

Use the log rule:

$$
\ln(ab)
=
\ln a+\ln b
$$

to separate the marginal-likelihood term:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\int
q(h)
\left[
\ln p(X;\boldsymbol{\pi})
+
\ln
\frac{
q(h)
}{
p(X,h;\boldsymbol{\pi})
}
\right]
\,
dh
$$

The quantity:

$$
\ln p(X;\boldsymbol{\pi})
$$

does not depend on $h$, and:

$$
\int q(h)\,dh
=
1
$$

First split the integral into its two terms:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\int
q(h)
\ln p(X;\boldsymbol{\pi})
\,
dh
+
\int
q(h)
\ln
\frac{
q(h)
}{
p(X,h;\boldsymbol{\pi})
}
\,
dh
$$

The first integral is:

$$
\int
q(h)
\ln p(X;\boldsymbol{\pi})
\,
dh
=
\ln p(X;\boldsymbol{\pi})
\int q(h)\,dh
$$

Using:

$$
\int q(h)\,dh
=
1
$$

gives:

$$
\int
q(h)
\ln p(X;\boldsymbol{\pi})
\,
dh
=
\ln p(X;\boldsymbol{\pi})
$$

For the second integral, use the reciprocal log identity:

$$
\ln\frac{a}{b}
=
-\ln\frac{b}{a}
$$

Therefore:

$$
\ln
\frac{
q(h)
}{
p(X,h;\boldsymbol{\pi})
}
=
-
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
$$

Putting these two results together gives:

$$
\operatorname{KL}
\left(
q
\,
\middle\|
\,
p
\right)
=
\ln p(X;\boldsymbol{\pi})
-
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

The integral on the right is the variational bound:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

Now substitute that definition:

$$
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
=
\ln p(X;\boldsymbol{\pi})
-
F[q,\boldsymbol{\pi}]
$$

Rearranging:

$$
\ln p(X;\boldsymbol{\pi})
=
F[q,\boldsymbol{\pi}]
+
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
$$

The KL divergence is always non-negative:

$$
\operatorname{KL}(q\|p)
\geq
0
$$

It is worth seeing why rather than treating this as a mysterious property.

For any positive number $u$:

$$
-\ln u
\geq
1-u
$$

This inequality can itself be checked with a short calculus argument.

Define:

$$
f(u)
=
u-1-\ln u
$$

Its derivative is:

$$
f'(u)
=
1-\frac{1}{u}
$$

The derivative is zero at:

$$
u=1
$$

and the second derivative is:

$$
f''(u)
=
\frac{1}{u^2}
>
0
$$

So $u=1$ is the minimum of $f$. At that point:

$$
f(1)
=
1-1-\ln(1)
=
0
$$

Therefore:

$$
f(u)
\geq
0
$$

which is equivalent to:

$$
-\ln u
\geq
1-u
$$

Let the exact posterior be abbreviated as:

$$
r(h)
=
p(h\mid X;\boldsymbol{\pi})
$$

The KL divergence is:

$$
\operatorname{KL}(q\|r)
=
\int
q(h)
\ln
\frac{q(h)}{r(h)}
\,
dh
$$

Rewrite the log ratio using a reciprocal:

$$
\ln
\frac{q(h)}{r(h)}
=
-\ln
\frac{r(h)}{q(h)}
$$

Now use:

$$
-\ln u
\geq
1-u
$$

with:

$$
u
=
\frac{r(h)}{q(h)}
$$

This gives:

$$
\operatorname{KL}(q\|r)
\geq
\int
q(h)
\left[
1-
\frac{r(h)}{q(h)}
\right]
\,
dh
$$

Multiply $q(h)$ into the bracket:

$$
\operatorname{KL}(q\|r)
\geq
\int
\left[
q(h)-r(h)
\right]
\,
dh
$$

Both $q$ and $r$ are normalised probability distributions:

$$
\int q(h)\,dh
=
1
$$

and:

$$
\int r(h)\,dh
=
1
$$

Therefore:

$$
\operatorname{KL}(q\|r)
\geq
1-1
=
0
$$

Equality holds when:

$$
q(h)
=
r(h)
$$

throughout the relevant support.

Therefore:

$$
F[q,\boldsymbol{\pi}]
\leq
\ln p(X;\boldsymbol{\pi})
$$

The gap between the bound and the true log marginal likelihood is exactly:

$$
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
$$

If $q(h)$ equals the exact posterior, then:

$$
\operatorname{KL}(q\|p)
=
0
$$

and:

$$
F[q,\boldsymbol{\pi}]
=
\ln p(X;\boldsymbol{\pi})
$$

For fixed $\boldsymbol{\pi}$, the log marginal likelihood:

$$
\ln p(X;\boldsymbol{\pi})
$$

does not change while $q$ is being updated.

From:

$$
\ln p(X;\boldsymbol{\pi})
=
F[q,\boldsymbol{\pi}]
+
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
$$

it follows that, with $\boldsymbol{\pi}$ fixed:

$$
\text{maximising }F[q,\boldsymbol{\pi}]
$$

is equivalent to:

$$
\text{minimising }
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
$$

If $q$ is restricted to a mean-field family, the exact posterior may not belong
to that family. In that case the KL divergence may remain positive even after
the best possible mean-field update.

Plain English:

> improving $q$ tightens the lower bound because it makes the approximate
> posterior closer to the exact posterior within the allowed variational
> family. The bound becomes exact only if that family can represent the true
> posterior and the two distributions match.

</details>

<details open>
<summary><strong>A Small Numeric Example For The Variational Bound</strong></summary>

Use a tiny hidden-variable model with only two possible hidden states:

$$
h_1
\quad
\text{and}
\quad
h_2
$$

Suppose the joint probabilities for one observed dataset $X$ are:

$$
p(X,h_1)
=
0.12
$$

and:

$$
p(X,h_2)
=
0.08
$$

These are joint probabilities for the **fixed observed event** $X$ together
with each possible hidden explanation. They do not need to sum to 1 when we
sum only over $h$, because their sum is the marginal probability of this
particular observed event $X$.

The marginal likelihood is:

$$
p(X)
=
\sum_h p(X,h)
$$

Now substitute the two joint probabilities:

$$
p(X)
=
0.12+0.08
=
0.20
$$

Therefore:

$$
\ln p(X)
=
\ln(0.20)
\approx
-1.609
$$

Now choose a simple variational distribution:

$$
q(h_1)
=
0.5,
\quad
q(h_2)
=
0.5
$$

This is a valid distribution because:

$$
q(h_1)+q(h_2)
=
0.5+0.5
=
1
$$

For a discrete hidden variable, the variational bound is:

$$
F[q]
=
\sum_h
q(h)
\ln
\frac{
p(X,h)
}{
q(h)
}
$$

Now substitute the two hidden states and their values:

$$
F[q]
=
0.5
\ln
\frac{0.12}{0.5}
+
0.5
\ln
\frac{0.08}{0.5}
$$

The denominators $0.5$ appear because $q$ supplied the artificial averaging
weights. The ratios correct for those weights, exactly as in the continuous
derivation.

Simplify the two ratios:

$$
F[q]
=
0.5\ln(0.24)
+
0.5\ln(0.16)
$$

Using:

$$
\ln(0.24)
\approx
-1.427
$$

and:

$$
\ln(0.16)
\approx
-1.833
$$

we get:

$$
F[q]
\approx
0.5(-1.427)
+
0.5(-1.833)
$$

So:

$$
F[q]
\approx
-1.630
$$

Compare the two quantities:

$$
F[q]
\approx
-1.630
$$

and:

$$
\ln p(X)
\approx
-1.609
$$

The bound is lower:

$$
-1.630
\leq
-1.609
$$

The gap is approximately:

$$
-1.609-(-1.630)
=
0.021
$$

Now compute the exact posterior over the two hidden states.

Bayes' rule is:

$$
p(h_i\mid X)
=
\frac{
p(X,h_i)
}{
p(X)
}
$$

For $h_1$, substitute:

$$
p(h_1\mid X)
=
\frac{0.12}{0.20}
=
0.6
$$

For $h_2$, reproduce Bayes' rule:

$$
p(h_i\mid X)
=
\frac{
p(X,h_i)
}{
p(X)
}
$$

Now substitute the values for $h_2$:

$$
p(h_2\mid X)
=
\frac{0.08}{0.20}
=
0.4
$$

So the exact posterior is:

$$
p(h\mid X)
=
(0.6,0.4)
$$

while the chosen approximation was:

$$
q(h)
=
(0.5,0.5)
$$

The bound is not exact because these distributions differ.

If we instead choose:

$$
q(h)
=
(0.6,0.4)
$$

then the discrete bound is still:

$$
F[q]
=
\sum_h
q(h)
\ln
\frac{
p(X,h)
}{
q(h)
}
$$

Substituting the posterior values gives:

$$
F[q]
=
0.6
\ln
\frac{0.12}{0.6}
+
0.4
\ln
\frac{0.08}{0.4}
$$

Both ratios are:

$$
\frac{0.12}{0.6}
=
\frac{0.08}{0.4}
=
0.20
$$

Therefore:

$$
F[q]
=
0.6\ln(0.20)
+
0.4\ln(0.20)
$$

So:

$$
F[q]
=
(0.6+0.4)\ln(0.20)
=
\ln(0.20)
$$

Hence:

$$
F[q]
=
\ln p(X)
$$

when $q$ equals the posterior.

Plain English:

> the lower bound loses a little value when the approximate posterior uses the
> wrong hidden-state probabilities. When the approximate posterior matches the
> exact posterior, the gap disappears.

</details>

<details open>
<summary><strong>Graph: Watching The Lower Bound Touch The Evidence</strong></summary>

![Variational lower bound as the approximate hidden-state probability changes](assets/gmm_variational_bound_gap.png)

This graph uses exactly the two-state model from the worked example:

$$
p(X,h_1)=0.12,
\qquad
p(X,h_2)=0.08
$$

The exact marginal likelihood is:

$$
p(X)
=
0.12+0.08
=
0.20
$$

so the red dashed line is fixed at:

$$
\ln p(X)
=
\ln(0.20)
\approx
-1.609
$$

The horizontal axis varies the chosen variational probability:

$$
q(h_1)
$$

across its full probability range from 0 to 1. Because there are two hidden
states:

$$
q(h_2)
=
1-q(h_1)
$$

For every horizontal position, the blue curve evaluates:

$$
F[q]
=
q(h_1)\ln\frac{0.12}{q(h_1)}
+
q(h_2)\ln\frac{0.08}{q(h_2)}
$$

The blue curve never rises above the red evidence line. It touches that line
only at:

$$
q(h_1)
=
\frac{0.12}{0.12+0.08}
=
0.6
$$

which is the exact posterior probability. Moving left or right means choosing a
worse approximate posterior, so the KL gap grows and the lower bound falls.

The vertical axis is kept wide enough to show the loss from nearly committing
to either hidden state, while retaining enough resolution to see the touching
point at $q(h_1)=0.6$.

</details>

<details open>
<summary><strong>Why Maximising The Bound Can Remove Components</strong></summary>

This subsection previews the mechanism that equations (87)-(93) will make
explicit. The responsibility and mixing-weight formulas have not yet been
derived in this block.

The bound depends on:

$$
q
\quad
\text{and}
\quad
\boldsymbol{\pi}
$$

The approximate posterior $q$ decides how much responsibility each component
takes for the data.

The parameter $\pi_j$ controls how much prior assignment probability component
$j$ receives.

These quantities reinforce each other.

If component $j$ explains very little data, then its responsibilities:

$$
r_{jn}
$$

become small.

Its effective count:

$$
N_j
=
\sum_{n=1}^{N}
r_{jn}
$$

also becomes small.

The later variational M-step will update:

$$
\pi_j
$$

from that effective count.

A smaller $\pi_j$ then makes component $j$ less competitive in the next
responsibility update.

This creates a feedback loop:

$$
\text{low responsibility}
\longrightarrow
\text{small mixing weight}
\longrightarrow
\text{even less future responsibility}
$$

If two components occupy nearly the same region, they compete to explain the
same points.

The priors on:

$$
\boldsymbol{\mu}
\quad
\text{and}
\quad
T
$$

create a complexity cost for maintaining both components.

If one component can already explain that region sufficiently well, the bound
may improve by allowing the redundant component's mixing weight to approach:

$$
\pi_j
=
0
$$

This is the model-selection mechanism described by the paper.

The paper is appropriately cautious and says the model can estimate the number
of components:

> to some extent.

It does not guarantee that every initialisation will recover a unique true
number of clusters. The optimisation is still local and can depend on the
priors and starting values.

Plain English:

> start with more components than may be needed, let them compete, and allow
> components that contribute no useful explanation to lose all their weight.

</details>

<details open>
<summary><strong>Equation (82): Writing The Bound For This GMM</strong></summary>

Equation (81) gave the general bound:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

For the modified GMM, the hidden bundle is:

$$
h
=
(Z,\boldsymbol{\mu},T)
$$

So:

$$
q(h)
=
q(Z,\boldsymbol{\mu},T)
$$

and:

$$
p(X,h;\boldsymbol{\pi})
=
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
$$

Now reproduce the general bound before substituting these pieces:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
$$

The variable $Z$ is discrete, while $\boldsymbol{\mu}$ and $T$ are continuous.

For a mixed collection of hidden variables, the definition of expectation is:

$$
\mathbb{E}_{q}[g(Z,\boldsymbol{\mu},T)]
=
\sum_Z
\int
q(Z,\boldsymbol{\mu},T)
g(Z,\boldsymbol{\mu},T)
\,
d\boldsymbol{\mu}
\,
dT
$$

This is the same probability-weighted-average definition used earlier. The
only difference is that discrete possibilities are added with a sum, while
continuous possibilities are averaged with an integral.

Substituting the GMM hidden variables and replacing the compact integral over
$h$ with a sum over $Z$ and a joint integral over the continuous variables
gives the paper-faithful form:

$$
F[q,\boldsymbol{\pi}]
=
\sum_Z
\int
q(Z,\boldsymbol{\mu},T)
\ln
\frac{
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
}{
q(Z,\boldsymbol{\mu},T)
}
\,
d\boldsymbol{\mu}
\,
dT
\tag{82}
$$

This is equation (82).

The sum:

$$
\sum_Z
$$

accounts for all possible hidden component assignments.

The integral:

$$
\int d\boldsymbol{\mu}
$$

averages over all possible component means.

The integral:

$$
\int dT
$$

averages over all possible component precision matrices.

There is still no integral over:

$$
\boldsymbol{\pi}
$$

because $\boldsymbol{\pi}$ is the parameter that the M-step will optimise.

Equation (82) does not yet make the calculation easy.

It states the formal variational objective for this model. The next move is to
restrict $q$ to a manageable factorised family.

Plain English:

> equation (82) expands the generic variational bound so we can see exactly
> which hidden quantities are summed over, which are integrated over, and which
> parameter remains to be optimised.

</details>

<details open>
<summary><strong>Variational E-Step And Variational M-Step</strong></summary>

The objective is:

$$
F[q,\boldsymbol{\pi}]
$$

The paper maximises it in two alternating stages.

Let:

$$
\mathcal{Q}
$$

denote the chosen family of normalised variational distributions. After
equation (83), this will be the mean-field family.

Let:

$$
\Delta_{M-1}
=
\left\{
\boldsymbol{\pi}
:
\pi_j\geq 0,
\quad
\sum_{j=1}^{M}\pi_j=1
\right\}
$$

denote the probability simplex containing all valid mixing-weight vectors.

**Variational E-Step**

Hold:

$$
\boldsymbol{\pi}
$$

fixed and improve:

$$
q(Z,\boldsymbol{\mu},T)
$$

This step asks:

> under the current mixing weights, what approximate posterior over labels,
> means, and precisions makes the bound as large as possible?

**Variational M-Step**

Hold:

$$
q(Z,\boldsymbol{\mu},T)
$$

fixed and improve:

$$
\boldsymbol{\pi}
$$

This step asks:

> under the current approximate posterior, what mixing weights make the bound
> as large as possible?

The alternation is:

$$
q^{(t+1)}
=
\arg\max_{q\in\mathcal{Q}}
F[q,\boldsymbol{\pi}^{(t)}]
$$

followed by:

$$
\boldsymbol{\pi}^{(t+1)}
=
\arg\max_{\boldsymbol{\pi}\in\Delta_{M-1}}
F[q^{(t+1)},\boldsymbol{\pi}]
$$

The constraint:

$$
\boldsymbol{\pi}
\in
\Delta_{M-1}
$$

ensures that the updated mixing weights remain non-negative and sum to one.

This resembles ordinary EM:

| Ordinary EM | Variational EM in this model |
|---|---|
| E-step computes an exact posterior over hidden variables | variational E-step optimises an approximate posterior |
| M-step updates model parameters | variational M-step updates $\boldsymbol{\pi}$ |
| objective is tied to the observed-data likelihood | objective is the variational lower bound |

Each stage holds one object fixed while improving the other.

This is a form of coordinate ascent.

The restriction:

$$
q\in\mathcal{Q}
$$

is essential.

If we could maximise over every possible normalised distribution $q$, the best
choice would be the exact posterior:

$$
q^*(h)
=
p(h\mid X;\boldsymbol{\pi})
$$

and the KL gap would be zero.

That exact posterior is the object we cannot compute conveniently. Variational
inference therefore searches only within a simpler family $\mathcal{Q}$ whose
factors can be updated.

The displayed $\arg\max$ notation states the conceptual target. In practice,
the algorithm does not optimise every function in $\mathcal{Q}$ at once. It
updates:

$$
q_Z,
\quad
q_{\mu},
\quad
q_T
$$

one factor at a time while holding the others fixed. Equations (84)-(92) will
show those factor forms and coordinate updates.

When each coordinate update is solved correctly while the other coordinate is
held fixed, the value of:

$$
F[q,\boldsymbol{\pi}]
$$

cannot decrease. This is the sense in which the procedure performs coordinate
ascent on the bound.

Plain English:

> improve the approximate posterior using the current weights, then improve the
> weights using the current approximate posterior, and repeat.

</details>

<details open>
<summary><strong>Equation (83): The Mean-Field Factorisation</strong></summary>

The unrestricted variational distribution is:

$$
q(h)
=
q(Z,\boldsymbol{\mu},T)
$$

That joint distribution can still contain complicated dependencies between
labels, component means, and precision matrices.

Equation (83) chooses the mean-field approximation:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
\tag{83}
$$

Each factor is itself a normalised probability distribution:

$$
\sum_Z q_Z(Z)
=
1
$$

$$
\int q_{\mu}(\boldsymbol{\mu})
\,
d\boldsymbol{\mu}
=
1
$$

and:

$$
\int q_T(T)
\,
dT
=
1
$$

Therefore their product is also normalised.

To see this, start from the total probability under the factorised $q$:

$$
\sum_Z
\int
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
\,
d\boldsymbol{\mu}
\,
dT
$$

Because each factor depends on a different variable group, this separates as:

$$
\left[
\sum_Z q_Z(Z)
\right]
\left[
\int q_{\mu}(\boldsymbol{\mu})
\,
d\boldsymbol{\mu}
\right]
\left[
\int q_T(T)
\,
dT
\right]
$$

Substitute the normalisation of each factor:

$$
1\times 1\times 1
=
1
$$

So equation (83) defines a valid joint probability distribution, not just an
arbitrary product of three functions.

The three factors are:

- $q_Z(Z)$, the approximate posterior over hidden component labels
- $q_{\mu}(\boldsymbol{\mu})$, the approximate posterior over component means
- $q_T(T)$, the approximate posterior over component precision matrices

The factorisation assumes these three groups are independent **inside the
variational approximation**.

It does not claim that they are independent in the exact posterior:

$$
p(Z,\boldsymbol{\mu},T\mid X;\boldsymbol{\pi})
$$

The exact posterior couples them.

For example:

- the component means affect which labels are plausible
- the labels affect which observations update each component mean
- the precision matrices affect how strongly each component explains each
  observation
- the assigned observations affect the posterior over each precision matrix

The mean-field approximation does not remove these influences from the update
algorithm.

Instead, each factor is updated using expectations under the other factors.

So the factors remain coupled through quantities such as:

$$
\langle z_{jn}\rangle,
\quad
\langle\boldsymbol{\mu}_j\rangle,
\quad
\langle\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T\rangle,
\quad
\langle T_j\rangle,
\quad
\langle\ln|T_j|\rangle
$$

Plain English:

> the approximation stores labels, means, and precisions in separate
> distributions, but their update equations continue to exchange expected
> information.

</details>

<details open>
<summary><strong>Comparing Equations (72) And (83)</strong></summary>

The full Bayesian model used:

$$
q(h)
=
q_Z(Z)
q_{\pi}(\boldsymbol{\pi})
q_{\mu T}(\boldsymbol{\mu},T)
$$

The modified model now uses:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

The differences are:

| Full Bayesian model, equation (72) | Modified CB model, equation (83) |
|---|---|
| $\boldsymbol{\pi}$ is a random variable | $\boldsymbol{\pi}$ is a parameter |
| includes $q_{\pi}(\boldsymbol{\pi})$ | has no variational factor for $\boldsymbol{\pi}$ |
| keeps $\boldsymbol{\mu}$ and $T$ together in $q_{\mu T}$ | separates them into $q_{\mu}$ and $q_T$ |
| uses a conditional Gauss-Wishart prior | uses independent Gaussian and Wishart priors |

The first difference enables a direct M-step update for the mixing weights.

The second difference makes the variational E-step simpler because the mean and
precision distributions can be updated as separate coordinate factors.

This is a stronger approximation than keeping:

$$
q_{\mu T}(\boldsymbol{\mu},T)
$$

joint.

That extra simplification is computationally useful, but it means $q$ cannot
directly represent posterior dependence between a component mean and its
precision.

Plain English:

> equation (83) gains simpler updates by separating more of the posterior, while
> equation (72) keeps more dependence but has a more complicated Bayesian
> treatment of the mixing weights.

</details>

<details open>
<summary><strong>One Variational EM Iteration At This Stage</strong></summary>

Equations (78)-(83) have not yet supplied the detailed update formulas.

They have supplied enough structure to describe one iteration conceptually.

1. Start with current mixing weights:

   $$
   \boldsymbol{\pi}^{(t)}
   $$

2. Use the mean-field family:

   $$
   q_Z(Z)
   q_{\mu}(\boldsymbol{\mu})
   q_T(T)
   $$

3. Update the three variational factors while holding
   $\boldsymbol{\pi}^{(t)}$ fixed.

4. Use the resulting responsibilities:

   $$
   r_{jn}
   =
   \langle z_{jn}\rangle
   $$

   to update the mixing weights.

5. Repeat until the variational bound or the model parameters stop changing
   materially.

The next equations will turn steps 3 and 4 into explicit calculations.

Plain English:

> this block builds the optimisation problem and decides how the approximate
> posterior is organised; the next block provides the distributions and update
> equations that perform the work.

</details>

<details open>
<summary><strong>Block 2 Summary</strong></summary>

Equation (78) places independent Gaussian priors on the component means:

$$
p(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{0},
\beta I
\right)
$$

Here $\beta I$ is used as a precision matrix, so the covariance form is:

$$
\boldsymbol{\mu}_j
\sim
\mathcal{N}
\left(
\boldsymbol{0},
\beta^{-1}I
\right)
$$

Equation (79) places independent Wishart priors on component precision
matrices:

$$
p(T)
=
\prod_{j=1}^{M}
W(T_j\mid\nu,V)
$$

The hidden random-variable bundle is now:

$$
h
=
(Z,\boldsymbol{\mu},T)
$$

while:

$$
\boldsymbol{\pi}
$$

is a parameter.

Equation (80) defines the marginal likelihood:

$$
p(X;\boldsymbol{\pi})
=
\int
p(X,h;\boldsymbol{\pi})
\,
dh
$$

More explicitly:

$$
p(X;\boldsymbol{\pi})
=
\sum_Z
\int
\int
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\,
d\boldsymbol{\mu}
\,
dT
$$

Equation (81) introduces the variational lower bound:

$$
F[q,\boldsymbol{\pi}]
=
\int
q(h)
\ln
\frac{
p(X,h;\boldsymbol{\pi})
}{
q(h)
}
\,
dh
\leq
\ln p(X;\boldsymbol{\pi})
$$

The gap is:

$$
\ln p(X;\boldsymbol{\pi})
-
F[q,\boldsymbol{\pi}]
=
\operatorname{KL}
\left(
q(h)
\,
\middle\|
\,
p(h\mid X;\boldsymbol{\pi})
\right)
$$

Equation (82) writes the lower bound explicitly for the GMM:

$$
F[q,\boldsymbol{\pi}]
=
\sum_Z
\int
q(Z,\boldsymbol{\mu},T)
\ln
\frac{
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
}{
q(Z,\boldsymbol{\mu},T)
}
\,
d\boldsymbol{\mu}
\,
dT
$$

Equation (83) chooses the mean-field approximation:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

The key idea is:

> equations (78)-(83) change the role of the mixing weights, define a lower
> bound that can be optimised, and split the approximate posterior into
> manageable factors for labels, means, and precision matrices.

The next natural block is equations (84)-(86).

Those equations specify the distribution family used for each factor:

$$
q_Z(Z),
\quad
q_{\mu}(\boldsymbol{\mu}),
\quad
q_T(T)
$$

After that, equations (87)-(93) give the detailed variational E-step and M-step
updates.

</details>

---

## Block 3: Equations (84)-(86)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

Equation (83) decided how the approximate posterior is factorised:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

That equation named three factors, but it did not yet say what kind of
probability distribution each factor should be.

Equations (84)-(86) answer that question.

| Paper equation | Variational factor | Distribution family |
|---|---|---|
| (84) | $q_Z(Z)$ | categorical factors over component labels |
| (85) | $q_{\mu}(\boldsymbol{\mu})$ | Gaussian factors over component means |
| (86) | $q_T(T)$ | Wishart factors over component precision matrices |

These equations specify the **shape** of the approximate posterior.

They do not yet specify the numerical values of:

$$
r_{jn},
\quad
\boldsymbol{m}_j,
\quad
S_j,
\quad
\eta_j,
\quad
U_j
$$

Those quantities are the variational parameters that determine the factors.
Equations (87)-(92) will show how to update them.

Plain English:

> this block chooses the mathematical container used to represent uncertainty
> about labels, component centres, and component shapes. The next block fills
> those containers with updated parameter values.

</details>

<details open>
<summary><strong>A Beginner's Reading Compass: Three Different Kinds Of Uncertainty</strong></summary>

Before reading the formulas, it helps to picture the approximate posterior as
three separate **uncertainty boxes**.

**Box 1: Which component generated each point?**

For every observation $x_n$, the model keeps a list of probabilities such as:

$$
(0.8,0.15,0.05)
$$

This says:

> component 1 is currently the most plausible explanation, but components 2
> and 3 have not been ruled out completely.

This box is:

$$
q_Z(Z)
$$

and equation (84) describes it using categorical probabilities.

**Box 2: Where is each component centre?**

The model does not pretend that the mean:

$$
\boldsymbol{\mu}_j
$$

is known exactly.

It keeps a cloud of plausible centre locations around:

$$
\boldsymbol{m}_j
$$

This box is:

$$
q_{\mu}(\boldsymbol{\mu})
$$

and equation (85) describes each cloud with a Gaussian distribution.

**Box 3: How narrow, stretched, and rotated is each component?**

The model is also uncertain about each precision matrix:

$$
T_j
$$

Different possible precision matrices describe different Gaussian ellipse
shapes.

This box is:

$$
q_T(T)
$$

and equation (86) describes uncertainty over those matrices with a Wishart
distribution.

So equations (84)-(86) can first be read without any advanced terminology:

$$
q(h)
=
\underbrace{\text{uncertainty about labels}}_{q_Z(Z)}
\times
\underbrace{\text{uncertainty about centres}}_{q_{\mu}(\boldsymbol{\mu})}
\times
\underbrace{\text{uncertainty about shapes}}_{q_T(T)}
$$

**What does “distribution family” mean?**

A distribution family is simply a reusable mathematical template.

For example, every Gaussian distribution has the same general bell-shaped
template, but its mean and covariance change its location and width.

Likewise:

- categorical is the template for probabilities over a finite list of choices
- Gaussian is the template for uncertainty over real-valued locations
- Wishart is the template for uncertainty over valid precision matrices

The variational parameters are the adjustable settings, or **knobs**, inside
those templates.

Plain English:

> equations (84)-(86) do not yet calculate the answers. They decide what form
> our three kinds of uncertainty will take so that later equations can adjust
> their knobs.

</details>

<details open>
<summary><strong>Bridge From Equation (83)</strong></summary>

The mean-field approximation is:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

The three factors correspond to three different kinds of object:

| Unknown quantity | Kind of object | Suitable family | Beginner reading |
|---|---|---|---|
| $Z$ | discrete one-hot labels | categorical | probabilities over a finite list of components |
| $\boldsymbol{\mu}_j$ | real-valued vectors | multivariate Gaussian | a cloud of plausible centre locations |
| $T_j$ | valid precision matrices | Wishart | probabilities over plausible component shapes |

The word **multivariate** only means that the Gaussian describes several
coordinates at once. For two-dimensional data, for example:

$$
\boldsymbol{\mu}_j
=
\begin{bmatrix}
\mu_{j1}\\
\mu_{j2}
\end{bmatrix}
$$

contains an $x$-coordinate and a $y$-coordinate for the component centre.

The distribution families are not selected merely because they are familiar.

They arise from **conjugacy**.

Conjugacy means:

> after combining the prior with the relevant likelihood information, the
> updated distribution stays in the same named family.

In this model:

- categorical component labels interact with mixing weights and Gaussian
  component scores
- a Gaussian likelihood combined with a Gaussian mean prior produces a log
  density built from squared distances in each component mean; this is the
  quadratic form explained later in the block
- a Gaussian likelihood written using precision matrices combines naturally
  with a Wishart precision prior

This is useful because the algorithm can update a finite collection of numbers
and matrices instead of inventing an entirely new probability shape at every
iteration.

**What does “coordinate update” mean?**

The three variational factors depend on one another, so the algorithm updates
one uncertainty box at a time:

1. hold the current mean and precision beliefs fixed, then update the label
   probabilities;
2. hold the current label and precision beliefs fixed, then update the mean
   beliefs;
3. hold the current label and mean beliefs fixed, then update the precision
   beliefs;
4. repeat.

This is called a coordinate update because only one part of $q$ is changed at
a time while the other parts are temporarily held fixed.

The formal rule explains why the algebraic form matters.

For one variational factor $q_i(h_i)$, the mean-field rule is:

$$
\ln q_i^*(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Here:

- $h_i$ is the variable group being updated
- $q_{-i}$ is read as “all $q$ factors except factor $i$”; the minus sign does
  not mean numerical subtraction
- the expectation averages over all other hidden-variable groups
- $\operatorname{const}$ contains terms that do not depend on $h_i$

**Why does this rule maximise the bound?**

Hold every factor except $q_i(h_i)$ fixed. The part of the ELBO that can still
change is:

The integral notation below covers a continuous $h_i$; for a discrete factor
such as $Z$, replace each integral by a sum. The argument is otherwise
identical.

$$
\begin{aligned}
\mathcal{L}(q_i)
&=
\int
q_i(h_i)
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h;\boldsymbol{\pi})
\right]
\,dh_i
\\
&\quad-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
\end{aligned}
$$

Define:

$$
f_i(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h;\boldsymbol{\pi})
\right]
$$

and construct the normalised density:

$$
p_i^*(h_i)
=
\frac{\exp\{f_i(h_i)\}}{
\displaystyle\int\exp\{f_i(u)\}\,du
}
$$

The denominator is a number that does not depend on $h_i$. Therefore:

$$
\ln p_i^*(h_i)
=
f_i(h_i)
-
\operatorname{const}
$$

or equivalently:

$$
f_i(h_i)
=
\ln p_i^*(h_i)
+
\operatorname{const}
$$

Reproduce the $q_i$-dependent ELBO before substituting this identity:

$$
\begin{aligned}
\mathcal{L}(q_i)
&=
\int q_i(h_i)f_i(h_i)\,dh_i
\\
&\quad-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
\end{aligned}
$$

Substitution gives:

$$
\begin{aligned}
\mathcal{L}(q_i)
&=
\int q_i(h_i)\ln p_i^*(h_i)\,dh_i
\\
&\quad-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
\\
&=
-\operatorname{KL}
\left(
q_i\parallel p_i^*
\right)
+
\operatorname{const}
\end{aligned}
$$

Because KL divergence is non-negative, this expression is largest when:

$$
q_i(h_i)
=
p_i^*(h_i)
$$

Using the definition of $p_i^*$:

$$
q_i^*(h_i)
\propto
\exp
\left\{
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h;\boldsymbol{\pi})
\right]
\right\}
$$

Take logarithms:

$$
\ln q_i^*(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

This proves the coordinate rule. It is the exact best update for one factor
inside the chosen mean-field family while the other factors are held fixed.

The logarithm is used because the joint model is built from products of
probability factors, and:

$$
\ln(ab)
=
\ln a+\ln b
$$

turns those products into sums that are easier to separate.

After the expectation is taken, we inspect how the result depends on the
variable being updated.

After the calculation, we undo the logarithm by exponentiating. This means
applying the exponential function because:

$$
\exp(\ln a)
=
a
$$

If the remaining expression has:

$$
\sum_j z_{jn}\ln(\text{positive score}_j)
$$

then exponentiating gives probabilities over a finite list of labels, which is
a categorical distribution.

If the result is quadratic in:

$$
\boldsymbol{\mu}_j
$$

then exponentiating gives the familiar Gaussian bell-shaped form.

If the result contains:

$$
\ln|T_j|
$$

and:

$$
\operatorname{tr}(U_jT_j)
$$

in the Wishart pattern, then exponentiating gives a Wishart distribution over
valid precision matrices.

Equations (84)-(86) state the resulting families. Equations (87)-(92) will
identify the scores, vectors, and matrices inside them.

Plain English:

> keep one hidden quantity, average the log joint model over the others, and
> look at the mathematical shape that remains. That shape tells us which
> distribution family the updated factor belongs to.

</details>

<details open>
<summary><strong>Notation And Roles Before The Equations</strong></summary>

The indices are:

$$
n
=
1,\ldots,N
$$

for observations, and:

$$
j
=
1,\ldots,M
$$

for mixture components.

The symbol:

$$
d
$$

is the number of features in one observation. If each data point has height and
weight, then $d=2$.

The variational parameters in this block are:

| Variational parameter | Mathematical size | Role |
|---|---|---|
| $r_{jn}$ | scalar | probability that observation $n$ belongs to component $j$ |
| $\boldsymbol{m}_j$ | $d$-vector | centre of the Gaussian factor over $\boldsymbol{\mu}_j$ |
| $S_j$ | $d\times d$ matrix | precision of the Gaussian factor over $\boldsymbol{\mu}_j$ |
| $\eta_j$ | scalar | Wishart shape/strength setting, called degrees of freedom |
| $U_j$ | $d\times d$ matrix | controls the matrix penalty in the Wishart factor; its rate-like role is explained below |

Here:

- a **scalar** is one number
- a **vector** is an ordered list of numbers
- a **matrix** is a rectangular grid of numbers

The phrase “degrees of freedom” in the Wishart distribution does not mean the
number of mixture components and does not mean the number of parameters being
freely optimised. It is the conventional name for one of the Wishart shape
settings. It works together with $U_j$ to determine the distribution over
precision matrices.

These are not observed values.

They are not the original GMM parameters:

$$
\pi_j,
\quad
\boldsymbol{\mu}_j,
\quad
T_j
$$

Instead, they parameterise the approximate posterior distributions over the
hidden random quantities.

For example:

$$
\boldsymbol{\mu}_j
$$

is an uncertain component mean, while:

$$
\boldsymbol{m}_j
$$

is the centre of our variational Gaussian belief about that uncertain mean.

Similarly:

$$
T_j
$$

is an uncertain precision matrix, while:

$$
\eta_j
\quad
\text{and}
\quad
U_j
$$

describe our variational Wishart belief about that matrix.

**Do Not Confuse $T_j$ With $S_j$**

Both symbols are $d\times d$ precision matrices, but they describe different
levels of uncertainty.

The matrix:

$$
T_j
$$

describes the precision of the **data cloud itself** around component mean
$\boldsymbol{\mu}_j$.

It answers:

> if component $j$ generated a new observation, how tightly would that
> observation be distributed around the component centre, and in which
> directions?

The matrix:

$$
S_j
$$

describes the precision of our **belief about the location of the centre**
$\boldsymbol{\mu}_j$.

It answers:

> how certain are we about where the centre itself is?

These can behave differently.

For example, a component may describe a broad population, so its data precision
$T_j$ is fairly low. But if we have observed many data points from that
population, we may still know its centre very accurately, so the mean precision
$S_j$ can be high.

Plain English:

> $T_j$ describes spread around the centre, while $S_j$ describes confidence
> about where the centre is. More broadly, the hidden quantities are what the
> model is uncertain about, and the variational parameters describe the
> distributions used to represent that uncertainty.

</details>

<details open>
<summary><strong>Equation (84): The Variational Distribution Over Labels</strong></summary>

Equation (84) is:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
\tag{84}
$$

For each observation $n$, the hidden label is represented by a one-hot vector:

$$
\boldsymbol{z}_n
=
(z_{1n},\ldots,z_{Mn})^T
$$

where:

$$
z_{jn}
\in
\{0,1\}
$$

and:

$$
\sum_{j=1}^{M}
z_{jn}
=
1
$$

Exactly one entry is 1 because each observation is assigned to exactly one
mixture component in any particular hidden assignment.

The variational probabilities satisfy:

$$
r_{jn}
\geq
0
$$

and, for every observation $n$:

$$
\sum_{j=1}^{M}
r_{jn}
=
1
$$

So:

$$
(r_{1n},\ldots,r_{Mn})
$$

is a categorical probability vector for observation $n$.

A categorical distribution is the many-choice version of a coin toss.

- a Bernoulli distribution chooses between two outcomes
- a categorical distribution chooses one outcome from $M$ possible outcomes

It is like rolling a weighted die whose faces are the component labels. The
probabilities $r_{1n},\ldots,r_{Mn}$ say how likely each face is.

The notation:

$$
\boldsymbol{z}_n
$$

means the label vector for one observation, while:

$$
Z
=
\{\boldsymbol{z}_1,\ldots,\boldsymbol{z}_N\}
$$

means the complete collection of hidden labels for the dataset.

The number:

$$
r_{jn}
$$

means:

> under the current variational approximation, how much probability do we
> assign to the claim that component $j$ generated observation $x_n$?

It is also the expected value of the binary indicator:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
r_{jn}
$$

The reason is that a binary indicator can only take the values 0 and 1:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
1\cdot q_Z(z_{jn}=1)
+
0\cdot q_Z(z_{jn}=0)
$$

Using:

$$
q_Z(z_{jn}=1)
=
r_{jn}
$$

gives:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
1\cdot r_{jn}
+
0\cdot(1-r_{jn})
=
r_{jn}
$$

Plain English:

> the responsibility $r_{jn}$ is both a soft assignment probability and the
> expected value of the one-hot membership indicator.

</details>

<details open>
<summary><strong>Why The Label Factor Is Categorical</strong></summary>

Reproduce the coordinate rule for the label factor:

$$
\ln q_Z^*(Z)
=
\mathbb{E}_{q_{\mu}q_T}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Only two joint-model factors contain $Z$:

$$
p(Z;\boldsymbol{\pi})
$$

and:

$$
p(X\mid Z,\boldsymbol{\mu},T)
$$

Their one-hot product forms are:

$$
p(Z;\boldsymbol{\pi})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

and:

$$
p(X\mid Z,\boldsymbol{\mu},T)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)^{z_{jn}}
$$

Take logarithms:

$$
\ln p(Z;\boldsymbol{\pi})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}\ln\pi_j
$$

and:

$$
\ln p(X\mid Z,\boldsymbol{\mu},T)
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
$$

Reproduce the label coordinate rule before substituting these two log factors:

$$
\ln q_Z^*(Z)
=
\mathbb{E}_{q_{\mu}q_T}
\left[
\ln p(Z;\boldsymbol{\pi})
+
\ln p(X\mid Z,\boldsymbol{\mu},T)
\right]
+
\operatorname{const}
$$

Substitution gives an expression linear in each binary indicator:

$$
\ln q_Z^*(Z)
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}a_{jn}
+
\operatorname{const}
$$

where the temporary teaching symbol:

$$
a_{jn}
=
\ln\pi_j
+
\mathbb{E}_{q_{\mu}q_T}
\left[
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
\right]
$$

is the expected log score for component $j$ and observation $n$.

Reproduce the linear log factor before exponentiating:

$$
\ln q_Z^*(Z)
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}a_{jn}
+
\operatorname{const}
$$

Exponentiation changes a sum into a product:

$$
\begin{aligned}
q_Z^*(Z)
&\propto
\exp
\left\{
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}a_{jn}
\right\}
\\
&=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\exp(a_{jn})^{z_{jn}}
\end{aligned}
$$

Define the positive unnormalised score:

$$
\widetilde r_{jn}
=
\exp(a_{jn})
$$

and normalise across components for each fixed observation:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle\sum_{k=1}^{M}\widetilde r_{kn}
}
$$

Reproduce the exponentiated product before substituting the normalised
categorical probabilities:

$$
q_Z^*(Z)
\propto
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\widetilde r_{jn}^{z_{jn}}
$$

Normalisation gives:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

which is equation (84). Equations (87)-(88) later unpack the exact formula for
$\widetilde r_{jn}$ and its normalisation.

Plain English:

> the log joint assigns one expected log score to every possible label;
> exponentiating turns those scores into positive weights, and normalising the
> weights produces a categorical probability vector.

</details>

<details open>
<summary><strong>Why The One-Hot Powers Select One Responsibility</strong></summary>

For one observation $n$, equation (84) contains:

$$
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

Suppose component $k$ is selected.

Then:

$$
z_{kn}
=
1
$$

and:

$$
z_{jn}
=
0
\quad
\text{for }j\neq k
$$

Now reproduce the product for one observation:

$$
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

Substituting the one-hot values gives:

$$
r_{kn}^{1}
\prod_{j\neq k}
r_{jn}^{0}
$$

Use:

$$
a^1
=
a
$$

and:

$$
a^0
=
1
$$

to obtain:

$$
r_{kn}^{1}
\prod_{j\neq k}
r_{jn}^{0}
=
r_{kn}
\prod_{j\neq k}
1
=
r_{kn}
$$

So the powers are a compact selection mechanism.

They do not raise every responsibility to a meaningful large power. The
one-hot vector makes all unselected terms equal to 1 and keeps only the
probability of the selected component.

Plain English:

> the one-hot exponents act like switches: the selected component's
> responsibility remains, and every unselected component disappears from the
> product by becoming a factor of 1.

</details>

<details open>
<summary><strong>A Small Numeric Example For Equation (84)</strong></summary>

Suppose there are:

$$
N=2
$$

observations and:

$$
M=2
$$

components.

For observation 1, suppose:

$$
r_{11}
=
0.8,
\quad
r_{21}
=
0.2
$$

For observation 2, suppose:

$$
r_{12}
=
0.3,
\quad
r_{22}
=
0.7
$$

Both responsibility vectors are normalised:

$$
0.8+0.2
=
1
$$

and:

$$
0.3+0.7
=
1
$$

Consider the hidden assignment:

$$
\boldsymbol{z}_1
=
\begin{bmatrix}
1\\
0
\end{bmatrix},
\quad
\boldsymbol{z}_2
=
\begin{bmatrix}
0\\
1
\end{bmatrix}
$$

This assignment says:

- observation 1 belongs to component 1
- observation 2 belongs to component 2

The general variational label distribution is:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

Now substitute the two observations, two components, and one-hot values:

$$
q_Z(Z)
=
r_{11}^{1}
r_{21}^{0}
r_{12}^{0}
r_{22}^{1}
$$

Substitute the numerical responsibilities:

$$
q_Z(Z)
=
0.8^1
0.2^0
0.3^0
0.7^1
$$

Using $a^0=1$ and $a^1=a$ gives:

$$
q_Z(Z)
=
0.8
\cdot
1
\cdot
1
\cdot
0.7
$$

Therefore:

$$
q_Z(Z)
=
0.56
$$

So the approximate posterior assigns probability 0.56 to this complete
two-observation assignment.

Notice the difference between:

$$
r_{11}
=
0.8
$$

and:

$$
q_Z(Z)
=
0.56
$$

The first is the probability of one observation taking one label.

The second is the probability of the complete assignment pattern for both
observations under the factorised $q_Z$.

Plain English:

> equation (84) multiplies the selected soft-label probability for every
> observation to obtain the probability of a complete hidden assignment.

</details>

<details open>
<summary><strong>Why Equation (84) Is Normalised</strong></summary>

The full distribution must satisfy:

$$
\sum_Z
q_Z(Z)
=
1
$$

The symbol:

$$
\sum_Z
$$

means sum over every possible combination of component labels for all
observations.

Start from equation (84):

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

For one observation $n$, summing over all one-hot labels gives:

$$
\sum_{\boldsymbol{z}_n}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
=
\sum_{j=1}^{M}
r_{jn}
$$

The equality holds because each possible one-hot vector selects exactly one
$r_{jn}$.

Using the responsibility constraint:

$$
\sum_{j=1}^{M}
r_{jn}
=
1
$$

we obtain:

$$
\sum_{\boldsymbol{z}_n}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
=
1
$$

Equation (84) factorises over observations, so the sum over all complete
assignments becomes:

$$
\sum_Z q_Z(Z)
=
\prod_{n=1}^{N}
\left[
\sum_{\boldsymbol{z}_n}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
\right]
$$

Substitute the result for each observation:

$$
\sum_Z q_Z(Z)
=
\prod_{n=1}^{N}
1
=
1
$$

This shows that the product in equation (84) defines a valid probability
distribution over all hidden label configurations.

</details>

<details open>
<summary><strong>Equation (85): Gaussian Factors Over Component Means</strong></summary>

Equation (85) is:

$$
q_{\mu}(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
\tag{85}
$$

This says that the approximate posterior over all component means factorises
across components.

For three components:

$$
q_{\mu}(\boldsymbol{\mu})
=
q_{\mu}(\boldsymbol{\mu}_1)
q_{\mu}(\boldsymbol{\mu}_2)
q_{\mu}(\boldsymbol{\mu}_3)
$$

Each factor is multivariate Gaussian.

In one dimension, a Gaussian is a bell-shaped curve.

In two dimensions, a multivariate Gaussian can be pictured as an elliptical
cloud. Its centre gives the most plausible location, and its width shows how
uncertain that location is.

The vector:

$$
\boldsymbol{m}_j
\in
\mathbb{R}^d
$$

is the centre of the variational distribution over component mean
$\boldsymbol{\mu}_j$.

Therefore:

$$
\mathbb{E}_{q_{\mu}}
\left[
\boldsymbol{\mu}_j
\right]
=
\boldsymbol{m}_j
$$

This expectation is the probability-weighted average of all possible values of
$\boldsymbol{\mu}_j$ under the Gaussian factor. It does not mean that
$\boldsymbol{\mu}_j$ has stopped being uncertain.

The matrix:

$$
S_j
\in
\mathbb{R}^{d\times d}
$$

controls the uncertainty around that centre.

However, its role requires a notation warning.

**A Precision-Parameterisation Warning**

In equation (85), the paper uses:

$$
S_j
$$

as a **precision matrix**, not a covariance matrix.

We can verify this from the later update:

$$
S_j
=
\beta I
+
\langle T_j\rangle
\sum_{n=1}^{N}
\langle z_{jn}\rangle
$$

which is equation (90).

The right-hand side adds prior precision and data precision, so it must be a
precision matrix.

Therefore equation (85), written with an explicit covariance argument, is:

$$
q_{\mu}(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j^{-1}
\right)
$$

where the final argument is now understood as covariance.

So:

$$
\operatorname{Cov}_{q_{\mu}}
\left(
\boldsymbol{\mu}_j
\right)
=
S_j^{-1}
$$

The interpretation is:

- greater precision in a direction means less uncertainty about the component
  centre in that direction
- lower precision in a direction means more uncertainty about the component
  centre in that direction

In one dimension this reduces to the familiar scalar rule:

$$
\text{variance}
=
\frac{1}{\text{precision}}
$$

Plain English:

> $\boldsymbol{m}_j$ says where the component centre probably is, while
> $S_j^{-1}$ says how uncertain we remain about that location.

</details>

<details open>
<summary><strong>Why The Mean Factor Is Gaussian</strong></summary>

The Gaussian form comes from the coordinate-update rule:

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
\mathbb{E}_{q_{-\mu_j}}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Here:

$$
q_{-\mu_j}
$$

means:

> average using every current variational factor except the factor for
> $\boldsymbol{\mu}_j$ itself.

We are updating our belief about one component centre while temporarily holding
the label probabilities, precision beliefs, and other mean beliefs fixed.

The likelihood is Gaussian in:

$$
\boldsymbol{\mu}_j
$$

and the prior from equation (78) is also Gaussian in:

$$
\boldsymbol{\mu}_j
$$

Taking logarithms turns both Gaussian densities into quadratic expressions.

To make that statement concrete, reproduce the locally relevant coordinate
update:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
\ln p(\boldsymbol{\mu}_j)
\\
&\quad+
\sum_{n=1}^{N}
\mathbb{E}_{q_Zq_T}
\left[
z_{jn}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
\right]
+
\operatorname{const}
\end{aligned}
$$

The zero-centred Gaussian prior from equation (78) has log-kernel:

$$
\ln p(\boldsymbol{\mu}_j)
=
-\frac{\beta}{2}
\boldsymbol{\mu}_j^T\boldsymbol{\mu}_j
+
\operatorname{const}
$$

The part of the Gaussian log likelihood that depends on
$\boldsymbol{\mu}_j$ is:

$$
-\frac{1}{2}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
$$

Mean-field independence gives:

$$
\mathbb{E}_{q_Zq_T}[z_{jn}T_j]
=
r_{jn}\langle T_j\rangle
$$

Reproduce the locally relevant coordinate update before substituting the prior
and expected likelihood terms:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
\ln p(\boldsymbol{\mu}_j)
\\
&\quad+
\sum_{n=1}^{N}
\mathbb{E}_{q_Zq_T}
\left[
z_{jn}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
\right]
+
\operatorname{const}
\end{aligned}
$$

Substitution gives:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
-\frac{\beta}{2}
\boldsymbol{\mu}_j^T\boldsymbol{\mu}_j
\\
&\quad-
\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\langle T_j\rangle
\left(
x_n-\boldsymbol{\mu}_j
\right)
+
\operatorname{const}
\end{aligned}
$$

Expand one likelihood quadratic:

$$
\begin{aligned}
&\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\langle T_j\rangle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\\
&=
x_n^T\langle T_j\rangle x_n
-
2\boldsymbol{\mu}_j^T\langle T_j\rangle x_n
+
\boldsymbol{\mu}_j^T
\langle T_j\rangle
\boldsymbol{\mu}_j
\end{aligned}
$$

The first term contains no $\boldsymbol{\mu}_j$, so it joins
$\operatorname{const}$. Collecting the remaining quadratic and linear terms
gives:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
-\frac{1}{2}
\boldsymbol{\mu}_j^T
\left[
\beta I
+
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}
\right]
\boldsymbol{\mu}_j
\\
&\quad+
\boldsymbol{\mu}_j^T
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
+
\operatorname{const}
\end{aligned}
$$

This line shows why the result is quadratic and also identifies the two
temporary coefficients:

$$
S_j
=
\beta I
+
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}
$$

and:

$$
\boldsymbol{b}_j
=
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

A **quadratic expression** contains squared terms, linear terms, and constants,
but no cubes or higher powers. In one dimension it has the familiar shape:

$$
-\frac{1}{2}S_j\mu_j^2
+
b_j\mu_j
+
\operatorname{const}
$$

After averaging over the other variational factors and collecting the terms
that depend on $\boldsymbol{\mu}_j$, the result has the generic form:

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
-\frac{1}{2}
\boldsymbol{\mu}_j^T
S_j
\boldsymbol{\mu}_j
+
\boldsymbol{\mu}_j^T
\boldsymbol{b}_j
+
\operatorname{const}
$$

where:

$$
\boldsymbol{b}_j
$$

collects the responsibility-weighted data contribution.

The symbol $\boldsymbol{b}_j$ is only a temporary teaching symbol used to keep
the completion-of-the-square calculation readable. It is not an additional
parameter introduced by the paper.

Because $S_j$ is a valid precision matrix, it is symmetric positive definite.
Therefore:

$$
S_j^{-1}
$$

exists, and the quadratic can be completed safely.

“Completing the square” means rewriting an off-centre quadratic so that it is
expressed as a squared distance from one centre. In one dimension, the goal is
to turn:

$$
-\frac{1}{2}S_j\mu_j^2
+
b_j\mu_j
$$

into:

$$
-\frac{1}{2}S_j
\left(
\mu_j-m_j
\right)^2
+
\operatorname{const}
$$

The matrix calculation below performs the same operation for a vector-valued
component mean.

To recognise the Gaussian, define:

$$
\boldsymbol{m}_j
=
S_j^{-1}
\boldsymbol{b}_j
$$

Multiplying both sides by $S_j$ gives:

$$
S_j\boldsymbol{m}_j
=
\boldsymbol{b}_j
$$

Now consider the centred Gaussian quadratic:

$$
-\frac{1}{2}
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)^T
S_j
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)
$$

Expand the quadratic:

$$
\begin{aligned}
&
-\frac{1}{2}
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)^T
S_j
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)
\\
&=
-\frac{1}{2}
\boldsymbol{\mu}_j^T S_j\boldsymbol{\mu}_j
+
\boldsymbol{\mu}_j^T S_j\boldsymbol{m}_j
-
\frac{1}{2}
\boldsymbol{m}_j^T S_j\boldsymbol{m}_j
\end{aligned}
$$

The final term:

$$
-\frac{1}{2}
\boldsymbol{m}_j^T S_j\boldsymbol{m}_j
$$

does not depend on $\boldsymbol{\mu}_j$, so it is absorbed into:

$$
\operatorname{const}
$$

Use:

$$
S_j\boldsymbol{m}_j
=
\boldsymbol{b}_j
$$

in the linear term:

$$
\boldsymbol{\mu}_j^T
S_j
\boldsymbol{m}_j
=
\boldsymbol{\mu}_j^T
\boldsymbol{b}_j
$$

Therefore:

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
-\frac{1}{2}
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)^T
S_j
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)
+
\operatorname{const}
$$

This is the **log-kernel** of a multivariate Gaussian.

A kernel is the part of a probability density that depends on the variable of
interest. Normalising constants can be omitted temporarily because they do not
change which named distributional shape we recognise.

Under the paper's precision convention, the Gaussian density has the pattern:

$$
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
\propto
\exp
\left\{
-\frac{1}{2}
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)^T
S_j
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)
\right\}
$$

The symbol:

$$
\propto
$$

means “proportional to”: the two sides differ only by a positive normalising
constant that does not depend on $\boldsymbol{\mu}_j$.

Therefore the completed quadratic is a multivariate Gaussian with:

$$
\text{mean}
=
\boldsymbol{m}_j
$$

and:

$$
\text{precision}
=
S_j
$$

Therefore its covariance is:

$$
S_j^{-1}
$$

Equations (89)-(90) later reintroduce these coefficients, complete the
substitution for $\boldsymbol{m}_j$, and label the resulting updates with the
paper's equation numbers.

Plain English:

> Gaussian likelihood plus Gaussian prior leaves a quadratic expression in the
> component mean. Completing the square reveals the centre
> $\boldsymbol{m}_j$ and precision $S_j$ of the updated Gaussian factor.

</details>

<details open>
<summary><strong>A Small Numeric Example For Equation (85)</strong></summary>

Use a one-dimensional component mean.

Equation (85), written with precision explicitly, is:

$$
q_{\mu}(\mu_j)
=
\mathcal{N}
\left(
\mu_j
\mid
m_j,
S_j
\right)
$$

Suppose:

$$
m_j
=
2
$$

and:

$$
S_j
=
4
$$

Because $S_j$ is precision, the variance is:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
S_j^{-1}
$$

Now substitute:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
\frac{1}{4}
=
0.25
$$

The standard deviation is:

$$
\sqrt{0.25}
=
0.5
$$

So the variational factor can be written in covariance notation as:

$$
q_{\mu}(\mu_j)
=
\mathcal{N}(2,0.25)
$$

This says:

> the approximate posterior is centred at 2, with fairly concentrated
> uncertainty around that centre.

Now keep the same centre but reduce the precision:

$$
S_j
=
0.25
$$

The variance formula is still:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
S_j^{-1}
$$

Substituting:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
\frac{1}{0.25}
=
4
$$

The centre remains:

$$
m_j
=
2
$$

but the uncertainty is now much wider.

Plain English:

> $m_j$ and $S_j$ answer different questions: $m_j$ says where the centre is,
> while $S_j$ says how confidently that location is known.

</details>

<details open>
<summary><strong>Graph: Mean Location Versus Uncertainty In Equation (85)</strong></summary>

![Gaussian mean factors with the same centre and different precisions](assets/gmm_eq85_mean_factor_precision.png)

Both curves describe uncertainty about the possible component-centre value:

$$
\mu_j
$$

They are not plots of the observed data distribution. Their horizontal axis is
the set of plausible values for the unknown centre, and the vertical axis is
the variational density:

$$
q_{\mu}(\mu_j)
$$

Both factors use:

$$
m_j=2
$$

so both curves are centred at the same dashed vertical line. The only changed
input is the precision $S_j$.

For the narrow purple curve:

$$
S_j=4
$$

and the variance formula is:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
S_j^{-1}
$$

Substitution gives:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
\frac{1}{4}
=
0.25
$$

For the broad orange curve, reproduce the same variance formula:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
S_j^{-1}
$$

Substitute $S_j=0.25$:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
\frac{1}{0.25}
=
4
$$

The graph makes the division of labour visible: $m_j$ moves the centre of the
belief, whereas $S_j$ changes how concentrated that belief is.

</details>

<details open>
<summary><strong>Equation (86): Wishart Factors Over Component Precisions</strong></summary>

Equation (86) is:

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
\tag{86}
$$

This says that the approximate posterior over all component precision matrices
factorises across components.

Each factor:

$$
W(T_j\mid\eta_j,U_j)
$$

is a Wishart distribution over the positive-definite matrix:

$$
T_j
$$

A matrix is **positive definite** if it gives a positive value in every
non-zero direction:

$$
\boldsymbol{v}^T
T_j
\boldsymbol{v}
>
0
\quad
\text{for every }\boldsymbol{v}\neq\boldsymbol{0}
$$

This condition is what makes $T_j$ a valid precision matrix. It prevents
negative variances and ensures that the matrix can be inverted to obtain a
covariance matrix.

**What does a distribution over matrices mean?**

A Gaussian distribution assigns probability density to possible vectors.

A Wishart distribution assigns probability density to possible
positive-definite matrices.

For two-dimensional data, each possible precision matrix describes a possible
ellipse shape and orientation. For example:

$$
T_j^{(a)}
=
\begin{bmatrix}
4 & 0\\
0 & 1
\end{bmatrix}
$$

describes greater precision in the first direction than the second, while:

$$
T_j^{(b)}
=
\begin{bmatrix}
1 & 0\\
0 & 4
\end{bmatrix}
$$

describes the opposite orientation of tightness.

The Wishart factor does not immediately choose between these possibilities. It
assigns different plausibilities to many possible precision matrices.

The variational parameters are:

$$
\eta_j
$$

and:

$$
U_j
$$

The scalar $\eta_j$ acts as the Wishart degrees of freedom.

For a beginner, it is safest to read $\eta_j$ as a Wishart **shape and evidence
strength setting**. It is not the number of clusters. Its effect must be read
together with $U_j$ rather than in isolation.

The matrix $U_j$ controls the scale of plausible precision matrices under the
paper's parameterisation.

As in equation (79), the paper's displayed Wishart form uses $U_j$ in a
rate-like way:

$$
\exp
\left\{
-\frac{1}{2}
\operatorname{tr}(U_jT_j)
\right\}
$$

The later expectation:

$$
\mathbb{E}_{q_T}[T_j]
=
\eta_j U_j^{-1}
$$

confirms this inverse relationship.

The phrase **rate-like** refers to this inverse behaviour. With $\eta_j$ held
fixed, increasing $U_j$ increases the penalty on large precision matrices and
reduces the expected precision.

The expectation:

$$
\mathbb{E}_{q_T}[T_j]
$$

is a probability-weighted matrix average. Each entry of the result averages the
corresponding entry across plausible precision matrices under $q_T$.

For the Wishart distribution to be **proper**, meaning that it can be
normalised to have total probability 1, the degrees of freedom in $d$
dimensions must satisfy:

$$
\eta_j
>
d-1
$$

and $U_j$ must be positive definite.

Plain English:

> equation (86) does not choose one precision matrix for each component. It
> keeps a weighted collection of plausible ellipse shapes. The parameters
> $\eta_j$ and $U_j$ control which shapes receive more weight and how
> concentrated that belief is.

</details>

<details open>
<summary><strong>Why The Precision Factor Is Wishart</strong></summary>

The coordinate-update rule is:

$$
\ln q_T^*(T_j)
=
\mathbb{E}_{q_{-T_j}}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Here:

$$
q_{-T_j}
$$

means all current variational factors except the factor for $T_j$. We update
the uncertainty about one component precision while temporarily holding the
label and mean beliefs fixed.

The component likelihood is Gaussian and written using precision matrix:

$$
T_j
$$

The prior from equation (79) is Wishart.

Reproduce its log-kernel under the paper's rate-like convention:

$$
\ln p(T_j)
=
\frac{\nu-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(VT_j)
+
\operatorname{const}
$$

The $T_j$-dependent part of one Gaussian log likelihood is:

$$
\frac{1}{2}\ln|T_j|
-
\frac{1}{2}
\operatorname{tr}
\left[
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right]
$$

Define the expected scatter for observation $n$:

$$
C_{jn}
=
\mathbb{E}_{q_{\mu}}
\left[
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right]
$$

The responsibility moment is:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
r_{jn}
$$

Reproduce the coordinate rule before substituting the prior and likelihood
terms:

$$
\ln q_T^*(T_j)
=
\mathbb{E}_{q_{-T_j}}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Only the Wishart prior and component-$j$ likelihood terms contain $T_j$.
Substitution therefore gives:

$$
\begin{aligned}
\ln q_T^*(T_j)
&=
\frac{\nu-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(VT_j)
\\
&\quad+
\sum_{n=1}^{N}
\left[
\frac{r_{jn}}{2}\ln|T_j|
-
\frac{r_{jn}}{2}
\operatorname{tr}(T_jC_{jn})
\right]
+
\operatorname{const}
\end{aligned}
$$

Collect the log-determinant terms:

$$
\frac{\nu-d-1}{2}\ln|T_j|
+
\sum_{n=1}^{N}
\frac{r_{jn}}{2}\ln|T_j|
=
\frac{
\nu+\sum_{n=1}^{N}r_{jn}-d-1
}{2}
\ln|T_j|
$$

Collect the trace terms using trace linearity:

$$
\begin{aligned}
&-\frac{1}{2}\operatorname{tr}(VT_j)
-
\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}\operatorname{tr}(T_jC_{jn})
\\
&=
-\frac{1}{2}
\operatorname{tr}
\left[
\left(
V+\sum_{n=1}^{N}r_{jn}C_{jn}
\right)
T_j
\right]
\end{aligned}
$$

Define:

$$
\eta_j
=
\nu+\sum_{n=1}^{N}r_{jn}
$$

and:

$$
U_j
=
V+\sum_{n=1}^{N}r_{jn}C_{jn}
$$

Reproduce the collected log factor before substituting these definitions:

$$
\begin{aligned}
\ln q_T^*(T_j)
&=
\frac{
\nu+\sum_{n=1}^{N}r_{jn}-d-1
}{2}
\ln|T_j|
\\
&\quad-
\frac{1}{2}
\operatorname{tr}
\left[
\left(
V+\sum_{n=1}^{N}r_{jn}C_{jn}
\right)
T_j
\right]
+
\operatorname{const}
\end{aligned}
$$

Substitution gives the generic form:

$$
\ln q_T^*(T_j)
=
\frac{\eta_j-d-1}{2}
\ln|T_j|
-
\frac{1}{2}
\operatorname{tr}(U_jT_j)
+
\operatorname{const}
$$

The two unfamiliar matrix summaries have distinct jobs.

The determinant:

$$
|T_j|
$$

turns the matrix into one positive number related to its overall scaling. The
term:

$$
\ln|T_j|
$$

comes from the normalising part of a multivariate Gaussian written with a
precision matrix.

The trace:

$$
\operatorname{tr}(U_jT_j)
$$

is the sum of the diagonal entries of the matrix product $U_jT_j$. In this
update it acts as a single-number penalty measuring how the candidate precision
$T_j$ interacts with the accumulated scatter information stored in $U_j$.

Here **scatter** means weighted squared spread around the component centre. The
exact scatter matrix used to update $U_j$ appears in equation (92).

The word **log-kernel** means:

> the part of the log density that depends on $T_j$, with terms independent of
> $T_j$ placed inside $\operatorname{const}$.

Exponentiating this log-kernel gives:

$$
q_T^*(T_j)
\propto
|T_j|^{(\eta_j-d-1)/2}
\exp
\left\{
-\frac{1}{2}
\operatorname{tr}(U_jT_j)
\right\}
$$

This step uses:

$$
\exp(\ln q_T^*(T_j))
=
q_T^*(T_j)
$$

The additive constant becomes a positive multiplicative constant:

$$
\exp
\left(
f(T_j)+\operatorname{const}
\right)
=
\exp(\operatorname{const})
\exp(f(T_j))
$$

Because that multiplier does not depend on $T_j$, it is absorbed into the
normalising constant. This is why the equation uses:

$$
\propto
$$

which means “has the same $T_j$-dependent shape as.”

Now compare this with the Wishart kernel under the paper's parameterisation:

$$
W(T_j\mid\eta_j,U_j)
\propto
|T_j|^{(\eta_j-d-1)/2}
\exp
\left\{
-\frac{1}{2}
\operatorname{tr}(U_jT_j)
\right\}
$$

The two kernels have the same:

- log-determinant power
- trace penalty
- positive-definite matrix domain

Matching the kernel and the domain is enough to identify the distribution
family. The omitted normalising constant is then the standard Wishart
normalising constant that makes the density integrate to 1.

Therefore:

$$
q_T(T_j)
=
W(T_j\mid\eta_j,U_j)
$$

Equations (91)-(92) later reproduce these definitions with the paper's equation
numbers and expand $C_{jn}$ into its centred-scatter form.

Plain English:

> Gaussian data contribute determinant and quadratic-scatter terms in the
> precision matrix. The Wishart prior has the same mathematical pattern, so the
> updated variational factor remains Wishart.

</details>

<details open>
<summary><strong>A One-Dimensional Reading Of The Wishart Factor</strong></summary>

In one dimension:

$$
d=1
$$

the precision matrix becomes one positive scalar:

$$
T_j
=
\tau_j
>
0
$$

The Wishart distribution then behaves like a Gamma distribution over scalar
precision.

Under the paper's parameterisation, the expected precision is:

$$
\mathbb{E}_{q_T}[T_j]
=
\eta_j U_j^{-1}
$$

In one dimension, matrix inversion becomes ordinary reciprocation:

$$
U_j^{-1}
=
\frac{1}{U_j}
$$

Therefore:

$$
\mathbb{E}_{q_T}[\tau_j]
=
\frac{\eta_j}{U_j}
$$

Suppose:

$$
\eta_j
=
6
$$

and:

$$
U_j
=
3
$$

The expected-precision formula is:

$$
\mathbb{E}_{q_T}[\tau_j]
=
\frac{\eta_j}{U_j}
$$

Substituting:

$$
\mathbb{E}_{q_T}[\tau_j]
=
\frac{6}{3}
=
2
$$

Now keep:

$$
\eta_j
=
6
$$

but increase the rate-like parameter to:

$$
U_j
=
6
$$

Reproduce the expected-precision formula:

$$
\mathbb{E}_{q_T}[\tau_j]
=
\frac{\eta_j}{U_j}
$$

Substituting:

$$
\mathbb{E}_{q_T}[\tau_j]
=
\frac{6}{6}
=
1
$$

So, with $\eta_j$ fixed, a larger $U_j$ produces a smaller expected precision.

One caution is important:

$$
\mathbb{E}
\left[
\frac{1}{\tau_j}
\right]
\neq
\frac{1}{
\mathbb{E}[\tau_j]
}
$$

in general.

Therefore:

$$
\frac{1}{\mathbb{E}[\tau_j]}
$$

may be a rough inverse-precision summary, but it is not the exact posterior
expected variance.

Plain English:

> in one dimension, equation (86) is simply keeping a probability distribution
> over how narrow or broad the Gaussian component might be.

</details>

<details open>
<summary><strong>Putting Equations (84)-(86) Back Into Equation (83)</strong></summary>

The mean-field factorisation from equation (83) is:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

Equation (84) gives:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

Equation (85) gives:

$$
q_{\mu}(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
$$

Equation (86) gives:

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
$$

Now reproduce equation (83) before substituting these factors:

$$
q(h)
=
q_Z(Z)
q_{\mu}(\boldsymbol{\mu})
q_T(T)
$$

Substituting equations (84)-(86) gives:

$$
\begin{aligned}
q(h)
&=
\left[
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
\right]
\\
&\quad\times
\left[
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
\right]
\\
&\quad\times
\left[
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
\right]
\end{aligned}
$$

This is the complete mean-field variational family used by the modified GMM.

Its variational parameters are:

$$
\left\{
r_{jn},
\boldsymbol{m}_j,
S_j,
\eta_j,
U_j
\right\}
$$

The original mixing weights:

$$
\boldsymbol{\pi}
$$

are not in this list because they are model parameters updated in the
variational M-step, not parameters of $q$.

Plain English:

> the approximate posterior is a product of soft label probabilities, Gaussian
> uncertainty over component centres, and Wishart uncertainty over component
> precisions.

</details>

<details open>
<summary><strong>How The Factors Correspond To The Model</strong></summary>

The modified GMM contains:

$$
p(Z;\boldsymbol{\pi}),
\quad
p(\boldsymbol{\mu}),
\quad
p(T)
$$

The variational approximation contains:

$$
q_Z(Z),
\quad
q_{\mu}(\boldsymbol{\mu}),
\quad
q_T(T)
$$

The correspondence is:

| Model term | Variational factor | Shared family |
|---|---|---|
| categorical assignment model | $q_Z(Z)$ | categorical |
| Gaussian mean prior and Gaussian likelihood terms | $q_{\mu}(\boldsymbol{\mu})$ | Gaussian |
| Wishart precision prior and Gaussian likelihood terms | $q_T(T)$ | Wishart |

This matching is the practical benefit of conjugacy.

In ordinary Bayesian language, conjugacy means that a prior and likelihood
combine to produce a posterior in the same distribution family.

For example:

$$
\text{Gaussian information about a mean}
+
\text{Gaussian prior on that mean}
\longrightarrow
\text{Gaussian updated belief}
$$

Here the inference is variational rather than exact, but the same family-matching
idea makes the coordinate updates manageable.

Conjugacy does not mean the mean-field approximation is exact.

It means that after taking the required expectations, each coordinate update
stays inside a familiar distribution family.

So the algorithm can update numerical parameters instead of trying to optimise
an arbitrary function.

Without this structure, the algorithm might have to search over every possible
curve or multidimensional density shape for a factor.

With this structure, the shape is already known and only its settings need to
change.

For example, rather than searching over every possible density for:

$$
\boldsymbol{\mu}_j
$$

the algorithm only needs to update:

$$
\boldsymbol{m}_j
\quad
\text{and}
\quad
S_j
$$

Plain English:

> conjugacy means we keep reusing familiar probability templates. Instead of
> inventing a new curve or surface at every iteration, the algorithm only
> updates a finite set of probabilities, vectors, scalars, and matrices.

</details>

<details open>
<summary><strong>How Equations (78)-(86) Map To The Code</strong></summary>

The implementation does not create a separate symbolic distribution object for
every factor. It stores the numerical parameters that completely determine
those distributions.

| Paper quantity | Meaning | Code quantity |
|---|---|---|
| $\beta$ | prior precision for component means | <code>mean_prior_precision</code> |
| $\nu$ | prior Wishart degrees of freedom | <code>wishart_degrees_of_freedom</code> |
| $V$ | prior Wishart rate-like matrix | <code>prior_rate</code> |
| $r_{jn}$ | label-factor probabilities | <code>responsibilities[n, j]</code> |
| $\boldsymbol{m}_j$ | mean of $q_{\mu}(\boldsymbol{\mu}_j)$ | <code>mean_expectations[j]</code> |
| $S_j^{-1}$ | covariance of $q_{\mu}(\boldsymbol{\mu}_j)$ | <code>mean_covariances[j]</code> |
| $\eta_j$ | posterior Wishart degrees of freedom | <code>precision_degrees[j]</code> |
| $U_j$ | posterior Wishart rate-like matrix | <code>precision_rates[j]</code> |

The distinction between $S_j$ and its stored representation is important.
Equation (85) uses $S_j$ as a precision matrix:

$$
\operatorname{Cov}_{q_{\mu}}(\boldsymbol{\mu}_j)
=
S_j^{-1}
$$

The code stores the covariance directly as
<code>mean_covariances[j]</code>. It therefore does not mean that the paper and
code disagree; they store opposite sides of the same inverse relationship.

Likewise, the expected precision:

$$
\langle T_j\rangle
=
\eta_jU_j^{-1}
$$

is stored separately as <code>precision_expectations[j]</code> because it is
used repeatedly in the responsibility and mean updates.

</details>

<details open>
<summary><strong>What Equations (84)-(86) Do Not Yet Tell Us</strong></summary>

These equations tell us:

- $q_Z$ is categorical
- $q_{\mu}$ is Gaussian
- $q_T$ is Wishart

They do not yet tell us:

- how to calculate each responsibility $r_{jn}$
- how to calculate each posterior centre $\boldsymbol{m}_j$
- how to calculate each mean precision $S_j$
- how to calculate each Wishart degree parameter $\eta_j$
- how to calculate each Wishart matrix parameter $U_j$

At this stage, the symbols:

$$
r_{jn},
\quad
\boldsymbol{m}_j,
\quad
S_j,
\quad
\eta_j,
\quad
U_j
$$

are placeholders for the values that maximise the lower bound within the
chosen distribution families.

The factors depend on one another.

For example:

- $q_Z$ needs expectations under $q_{\mu}$ and $q_T$
- $q_{\mu}$ needs responsibilities from $q_Z$ and expected precisions from
  $q_T$
- $q_T$ needs responsibilities from $q_Z$ and mean moments from $q_{\mu}$

That coupling is why the variational E-step cycles through the factors.

Plain English:

> equations (84)-(86) tell us what each belief looks like; equations (87)-(92)
> tell us how those beliefs exchange information and change.

</details>

<details open>
<summary><strong>Block 3 Summary</strong></summary>

Equation (84) gives the variational distribution over hidden labels:

$$
q_Z(Z)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
$$

For every observation:

$$
\sum_{j=1}^{M}
r_{jn}
=
1
$$

and:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
r_{jn}
$$

Equation (85) gives Gaussian variational factors over component means:

$$
q_{\mu}(\boldsymbol{\mu})
=
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
$$

The paper uses $S_j$ as precision, so:

$$
\mathbb{E}_{q_{\mu}}[\boldsymbol{\mu}_j]
=
\boldsymbol{m}_j
$$

and:

$$
\operatorname{Cov}_{q_{\mu}}(\boldsymbol{\mu}_j)
=
S_j^{-1}
$$

Equation (86) gives Wishart variational factors over component precision
matrices:

$$
q_T(T)
=
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
$$

Under the paper's rate-like parameterisation:

$$
\mathbb{E}_{q_T}[T_j]
=
\eta_jU_j^{-1}
$$

Putting the factors together:

$$
\begin{aligned}
q(h)
&=
\left[
\prod_{n=1}^{N}
\prod_{j=1}^{M}
r_{jn}^{z_{jn}}
\right]
\\
&\quad\times
\left[
\prod_{j=1}^{M}
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
S_j
\right)
\right]
\\
&\quad\times
\left[
\prod_{j=1}^{M}
W(T_j\mid\eta_j,U_j)
\right]
\end{aligned}
$$

The key idea is:

> the mean-field posterior represents label uncertainty with categorical
> probabilities, centre uncertainty with Gaussian distributions, and shape
> uncertainty with Wishart distributions.

The next natural block is equations (87)-(92).

Those equations calculate:

$$
r_{jn},
\quad
\boldsymbol{m}_j,
\quad
S_j,
\quad
\eta_j,
\quad
U_j
$$

using expectations passed between the three variational factors.

Equation (93) then uses the responsibilities in the variational M-step to
update:

$$
\boldsymbol{\pi}
$$

</details>

---

## Block 4: Equations (87)-(92)

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

The previous block chose:

$$
q_Z(Z),
\quad
q_{\mu}(\boldsymbol{\mu}),
\quad
q_T(T)
$$

and introduced their adjustable parameters:

$$
r_{jn},
\quad
\boldsymbol{m}_j,
\quad
S_j,
\quad
\eta_j,
\quad
U_j
$$

Equations (87)-(92) now calculate those parameters.

| Equations | Factor being updated | Main question |
|---|---|---|
| (87)-(88) | $q_Z(Z)$ | Which component probably generated each observation? |
| (89)-(90) | $q_{\mu}(\boldsymbol{\mu})$ | Where is each component centre, and how certain is it? |
| (91)-(92) | $q_T(T)$ | What component precision matrices are plausible? |

These are coupled equations:

- the label update needs current expectations about means and precisions;
- the mean update needs current labels and expected precisions;
- the precision update needs current labels and moments of the means.

Plain English:

> use the current centres and shapes to update the soft labels; use the soft
> labels to update the centres; then use the labels and centres to update the
> shapes.

</details>

<details open>
<summary><strong>A Beginner's Reading Compass: Evidence Moving Around The Loop</strong></summary>

For one observation $x_n$ and one candidate component $j$, the variational
E-step repeatedly asks three questions.

**Does component $j$ explain $x_n$ well?**

This depends on the mixing weight, distance from the current centre, component
precision, and uncertainty about the centre. The answer is the responsibility:

$$
r_{jn}
$$

**Given those responsibilities, where should the centre move?**

Observations with large $r_{jn}$ pull strongly. Observations with small
$r_{jn}$ barely pull. This updates:

$$
\boldsymbol{m}_j
\quad
\text{and}
\quad
S_j
$$

**Given the labels and centre uncertainty, how spread out is the component?**

This updates the Wishart settings:

$$
\eta_j
\quad
\text{and}
\quad
U_j
$$

The information loop is:

$$
\boxed{
\text{labels}
\longrightarrow
\text{centres}
\longrightarrow
\text{precisions}
\longrightarrow
\text{labels again}
}
$$

Plain English:

> each factor supplies expected information needed by the other factors, so the
> model improves them in turns.

</details>

<details open>
<summary><strong>Two Printed-Paper Issues To Keep In Mind</strong></summary>

The printed paper contains two expressions in this block that are not
mathematically consistent as written.

**Issue 1: equation (87)**

Its denominator sums over $k$, but the summand still uses
$\widetilde r_{jn}$, so $k$ never appears. The intended summand must be:

$$
\widetilde r_{kn}
$$

**Issue 2: equations (88) and (92)**

The paper prints one cross-term with a plus:

$$
-x_n\langle\boldsymbol{\mu}_j\rangle^T
+
\langle\boldsymbol{\mu}_j\rangle x_n^T
$$

but expanding:

$$
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
$$

requires both cross-terms to be negative.

This block reproduces the paper-faithful equations, demonstrates the problems,
and then derives the corrected forms used for interpretation and code.

</details>

<details open>
<summary><strong>Why The Coordinate-Update Rule Is Allowed Here</strong></summary>

The derivations below repeatedly use a rule of the form:

$$
\ln q_i^*(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h)
\right]
+
\operatorname{const}
$$

It is worth rebuilding that rule before using it. Otherwise, equations
(88)-(92) can look as though they have appeared from nowhere.

The mean-field approximation splits the variational distribution into factors:

$$
q(h)
=
q_i(h_i)q_{-i}(h_{-i})
$$

Here:

- $h_i$ is the one group of hidden quantities currently being updated;
- $h_{-i}$ means all the other hidden quantities;
- $q_{-i}$ is held fixed while $q_i$ is updated.

Recall the evidence lower bound:

$$
\mathcal{L}(q)
=
\mathbb{E}_{q(h)}
\left[
\ln p(X,h)
\right]
-
\mathbb{E}_{q(h)}
\left[
\ln q(h)
\right]
$$

Now reproduce the factorisation before substituting it:

$$
q(h)
=
q_i(h_i)q_{-i}(h_{-i})
$$

Substitute this into the ELBO and keep only terms that can change when
$q_i$ changes:

$$
\begin{aligned}
\mathcal{L}(q_i)
&=
\int q_i(h_i)
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h)
\right]
\,dh_i
\\
&\quad
-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
\end{aligned}
$$

The symbol $\operatorname{const}$ means “constant with respect to the thing
currently being updated.” It may depend on the fixed factors $q_{-i}$, but it
does not depend on $h_i$ or on the shape of $q_i$.

Define the expected log joint:

$$
f_i(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h)
\right]
$$

Exponentiating it gives a positive, but not necessarily normalised, function:

$$
\widetilde q_i(h_i)
=
\exp\left\{f_i(h_i)\right\}
$$

Let its normalising constant be:

$$
Z_i
=
\int \widetilde q_i(h_i)\,dh_i
$$

This construction assumes $0<Z_i<\infty$, so the positive function can be
normalised into a probability density.

and define the corresponding probability density:

$$
p_i^*(h_i)
=
\frac{\widetilde q_i(h_i)}{Z_i}
=
\frac{\exp\{f_i(h_i)\}}{Z_i}
$$

Reproduce the part of the ELBO that depends on $q_i$:

$$
\mathcal{L}(q_i)
=
\int q_i(h_i)f_i(h_i)\,dh_i
-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
$$

Because:

$$
f_i(h_i)
=
\ln p_i^*(h_i)+\ln Z_i
$$

substitution gives:

$$
\begin{aligned}
\mathcal{L}(q_i)
&=
\int q_i(h_i)
\left[
\ln p_i^*(h_i)+\ln Z_i
\right]
\,dh_i
\\
&\quad
-
\int q_i(h_i)\ln q_i(h_i)\,dh_i
+
\operatorname{const}
\end{aligned}
$$

Since $q_i$ integrates to 1, $\ln Z_i$ leaves the integral:

$$
\mathcal{L}(q_i)
=
-
\operatorname{KL}
\left(
q_i\parallel p_i^*
\right)
+
\ln Z_i
+
\operatorname{const}
$$

A KL divergence is never negative. Therefore the ELBO is largest when:

$$
\operatorname{KL}
\left(
q_i\parallel p_i^*
\right)
=0
$$

which occurs when:

$$
q_i^*(h_i)
=
p_i^*(h_i)
\propto
\exp
\left\{
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h)
\right]
\right\}
$$

Taking logarithms reproduces the coordinate-update rule:

$$
\ln q_i^*(h_i)
=
\mathbb{E}_{q_{-i}}
\left[
\ln p(X,h)
\right]
+
\operatorname{const}
$$

This is an **exact optimisation of one variational factor while the other
factors are fixed**. The approximation entered earlier, when the posterior was
restricted to the mean-field family.

Plain English:

> To update one uncertainty box, average the log joint model over the current
> contents of all the other boxes, exponentiate, and normalise.

</details>

<details open>
<summary><strong>Equation (87): Normalising Component Scores</strong></summary>

The algorithm first computes a positive unnormalised score:

$$
\widetilde r_{jn}
$$

for each component $j$ and observation $n$. The tilde means that this is a
relative score, not yet a probability.

**Paper-faithful equation**

The printed equation is:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{jn}
}
\tag{87}
$$

The summation index $k$ does not occur in the summand. The denominator therefore
repeats the same number $M$ times:

$$
\sum_{k=1}^{M}
\widetilde r_{jn}
=
M\widetilde r_{jn}
$$

Substitute this into the printed formula:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
M\widetilde r_{jn}
}
=
\frac{1}{M}
$$

This would give every component equal responsibility regardless of the data, so
it cannot be the intended update.

**Corrected equation**

The denominator must add the scores of all components:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
$$

Here $n$ stays fixed while $k$ runs across components.

To check normalisation:

$$
\sum_{j=1}^{M}
r_{jn}
=
\sum_{j=1}^{M}
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
$$

The denominator is common to all terms:

$$
\sum_{j=1}^{M}
r_{jn}
=
\frac{
\displaystyle
\sum_{j=1}^{M}
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
=
1
$$

The letters $j$ and $k$ are dummy summation indices; both sums contain the same
component scores.

Plain English:

> calculate one score per component, add all scores, then divide each score by
> the total.

</details>

<details open>
<summary><strong>A Small Numeric Example For Equation (87)</strong></summary>

Suppose:

$$
\widetilde r_{1n}=0.12,
\quad
\widetilde r_{2n}=0.03,
\quad
\widetilde r_{3n}=0.05
$$

The corrected formula is:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
$$

The total is:

$$
0.12+0.03+0.05
=
0.20
$$

For component 1, reproduce the formula:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
$$

Substitute:

$$
r_{1n}
=
\frac{0.12}{0.20}
=
0.60
$$

Similarly:

$$
r_{2n}
=
\frac{0.03}{0.20}
=
0.15
$$

and:

$$
r_{3n}
=
\frac{0.05}{0.20}
=
0.25
$$

Check:

$$
0.60+0.15+0.25
=
1
$$

</details>

<details open>
<summary><strong>Where The Score In Equation (88) Comes From</strong></summary>

We now apply the general coordinate rule specifically to the hidden labels.
Reproduce that rule with the factor being updated made explicit:

$$
\ln q_Z^*(Z)
=
\mathbb{E}_{q_{\mu}(\boldsymbol{\mu})q_T(T)}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

The expectation is over $\boldsymbol{\mu}$ and $T$, not over $Z$, because $Z$
is the quantity whose new distribution we are constructing.

**Step 1: reproduce the joint-model factorisation**

The joint model used in this section is:

$$
\begin{aligned}
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
&=
p(Z;\boldsymbol{\pi})
p(X\mid Z,\boldsymbol{\mu},T)
\\
&\quad\times
p(\boldsymbol{\mu})p(T)
\end{aligned}
$$

Take logarithms using $\ln(ab)=\ln a+\ln b$:

$$
\begin{aligned}
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
&=
\ln p(Z;\boldsymbol{\pi})
+
\ln p(X\mid Z,\boldsymbol{\mu},T)
\\
&\quad+
\ln p(\boldsymbol{\mu})
+
\ln p(T)
\end{aligned}
$$

The last two terms do not contain $Z$. While constructing $q_Z(Z)$, they can
only change the normalising constant. Therefore the coordinate rule becomes:

$$
\ln q_Z^*(Z)
=
\mathbb{E}_{q_{\mu}q_T}
\left[
\ln p(Z;\boldsymbol{\pi})
+
\ln p(X\mid Z,\boldsymbol{\mu},T)
\right]
+
\operatorname{const}
$$

Nothing has been approximated in this deletion: a term that is constant as a
function of $Z$ affects only the final normalisation of $q_Z$.

**Step 2: write both $Z$-dependent factors explicitly**

The assignment factor is:

$$
p(Z;\boldsymbol{\pi})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

The conditional data likelihood is:

$$
p(X\mid Z,\boldsymbol{\mu},T)
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)^{z_{jn}}
$$

Because $z_{jn}$ is either 0 or 1, raising a term to $z_{jn}$ either removes it
or selects it. For each observation, exactly one $z_{jn}$ equals 1.

Take the logarithm of the assignment factor:

$$
\ln p(Z;\boldsymbol{\pi})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}\ln\pi_j
$$

Take the logarithm of the conditional likelihood:

$$
\ln p(X\mid Z,\boldsymbol{\mu},T)
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
$$

**Step 3: insert the Gaussian log density**

Under the paper's precision convention, the Gaussian log density is:

$$
\begin{aligned}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
&=
\frac{1}{2}\ln|T_j|
\\
&\quad-
\frac{1}{2}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\\
&\quad-
\frac{d}{2}\ln(2\pi)
\end{aligned}
$$

Reproduce the $Z$-dependent coordinate update before substitution:

$$
\ln q_Z^*(Z)
=
\mathbb{E}_{q_{\mu}q_T}
\left[
\ln p(Z;\boldsymbol{\pi})
+
\ln p(X\mid Z,\boldsymbol{\mu},T)
\right]
+
\operatorname{const}
$$

Substituting the two log factors and the Gaussian log density gives:

$$
\begin{aligned}
\ln q_Z^*(Z)
&=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}
\Bigg[
\ln\pi_j
+
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\qquad
-
\frac{1}{2}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
\Bigg]
\\
&\quad+
\operatorname{const}
\end{aligned}
$$

The term $-d\ln(2\pi)/2$ has joined $\operatorname{const}$ because it is the
same for every candidate component. Adding the same number to all component
log scores cannot change their normalised probabilities.

**Step 4: identify one unnormalised component score**

The coefficient multiplying $z_{jn}$ is the log score for assigning observation
$n$ to component $j$. Define it as:

$$
\begin{aligned}
\ln\widetilde r_{jn}
&=
\ln\pi_j
+
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\quad-
\frac{1}{2}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
\end{aligned}
$$

Reproduce this log-score before exponentiating:

$$
\begin{aligned}
\ln\widetilde r_{jn}
&=
\ln\pi_j
+
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\quad-
\frac{1}{2}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
\end{aligned}
$$

Exponentiating both sides, and using $\exp(\ln\pi_j)=\pi_j$, gives:

$$
\widetilde r_{jn}
=
\pi_j
\exp
\left\{
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
-
\frac{1}{2}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
\right\}
$$

This score is positive, but it is not yet a probability. Equation (87) divides
it by the sum of all component scores for the same $x_n$.

The three pieces now have a direct interpretation:

- $\ln\pi_j$ rewards components that are currently believed to be common;
- $\langle\ln|T_j|\rangle/2$ is the Gaussian concentration reward;
- the expected quadratic is a distance-and-uncertainty penalty.

</details>

<details open>
<summary><strong>Turning The Expected Quadratic Into A Trace</strong></summary>

The difficult term in the score is:

$$
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
$$

We want to separate the uncertainty about $T_j$ from the uncertainty about
$\boldsymbol{\mu}_j$. The trace identity lets us do that.

**Step 1: show why a quadratic form can be written as a trace**

For any vector $\boldsymbol{a}$ and compatible matrix $B$:

$$
\boldsymbol{a}^TB\boldsymbol{a}
=
\operatorname{tr}
\left(
B\boldsymbol{a}\boldsymbol{a}^T
\right)
$$

The justification is line by line:

$$
\begin{aligned}
\boldsymbol{a}^TB\boldsymbol{a}
&=
\operatorname{tr}
\left(
\boldsymbol{a}^TB\boldsymbol{a}
\right)
\\
&=
\operatorname{tr}
\left(
B\boldsymbol{a}\boldsymbol{a}^T
\right)
\end{aligned}
$$

The first equality holds because a scalar equals its own trace. The second uses
the cyclic trace rule:

$$
\operatorname{tr}(ABC)
=
\operatorname{tr}(BCA)
$$

**Step 2: apply the identity to the expected quadratic**

Set:

$$
\boldsymbol{a}
=
x_n-\boldsymbol{\mu}_j,
\quad
B=T_j
$$

Reproduce the expected quadratic before substitution:

$$
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\right\rangle
$$

Substituting $\boldsymbol{a}=x_n-\boldsymbol{\mu}_j$ and $B=T_j$ gives:

$$
\left\langle
\operatorname{tr}
\left[
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right]
\right\rangle
$$

**Step 3: justify the expectation factorisation**

Define the mean-scatter matrix:

$$
A(\boldsymbol{\mu}_j)
=
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
$$

The trace expression is therefore:

$$
\mathbb{E}_{q_Tq_{\mu}}
\left[
\operatorname{tr}
\left(
T_jA(\boldsymbol{\mu}_j)
\right)
\right]
$$

Under the mean-field approximation:

$$
q_T(T_j)q_{\mu}(\boldsymbol{\mu}_j)
$$

is a product distribution. Written from the definition of expectation, the
matrix expectation inside the trace is:

$$
\begin{aligned}
&\mathbb{E}_{q_Tq_{\mu}}
\left[
T_jA(\boldsymbol{\mu}_j)
\right]
\\
&=
\int\!\!\int
T_jA(\boldsymbol{\mu}_j)
q_T(T_j)q_{\mu}(\boldsymbol{\mu}_j)
\,dT_j\,d\boldsymbol{\mu}_j
\\
&=
\left[
\int T_jq_T(T_j)\,dT_j
\right]
\left[
\int A(\boldsymbol{\mu}_j)
q_{\mu}(\boldsymbol{\mu}_j)
\,d\boldsymbol{\mu}_j
\right]
\\
&=
\left\langle T_j\right\rangle
\left\langle A(\boldsymbol{\mu}_j)\right\rangle
\end{aligned}
$$

This is why the product can be replaced by a product of expectations here. It
is not a general rule for dependent random variables; it follows from the
mean-field independence of $T_j$ and $\boldsymbol{\mu}_j$.

Reproduce the trace expectation before substituting this result:

$$
\mathbb{E}_{q_Tq_{\mu}}
\left[
\operatorname{tr}
\left(
T_jA(\boldsymbol{\mu}_j)
\right)
\right]
$$

Linearity lets expectation pass through the trace. Substitution then gives:

$$
\begin{aligned}
&
\left\langle
\operatorname{tr}
\left[
T_jA(\boldsymbol{\mu}_j)
\right]
\right\rangle
\\
&=
\operatorname{tr}
\left[
\left\langle T_j\right\rangle
\left\langle A(\boldsymbol{\mu}_j)\right\rangle
\right]
\end{aligned}
$$

The reward for this apparently fussy rewrite is that the two required moments,
$\langle T_j\rangle$ and
$\langle A(\boldsymbol{\mu}_j)\rangle$, can now be calculated from their own
variational factors.

</details>

<details open>
<summary><strong>The Cross-Term Expansion And The Printed Sign Error</strong></summary>

Start from:

$$
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
$$

Transpose the second bracket:

$$
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
=
x_n^T-\boldsymbol{\mu}_j^T
$$

Distribute every term:

$$
\begin{aligned}
&
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\\
&=
x_nx_n^T
-
x_n\boldsymbol{\mu}_j^T
-
\boldsymbol{\mu}_jx_n^T
+
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\end{aligned}
$$

Both cross-terms are negative. Taking expectations gives:

$$
\begin{aligned}
&
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
\\
&=
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
-
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\end{aligned}
$$

**Paper-faithful equation (88)**

The printed paper gives:

$$
\begin{aligned}
\widetilde r_{jn}
&=
\pi_j
\exp
\Bigg\{
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\quad
-
\frac{1}{2}
\operatorname{tr}
\Bigg[
\left\langle T_j\right\rangle
\Big(
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
\\
&\qquad\qquad
+
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\Big)
\Bigg]
\Bigg\}
\end{aligned}
\tag{88}
$$

The positive sign before the second cross-term disagrees with the expansion.

**Mathematically corrected equation (88)**

The corrected score is:

$$
\begin{aligned}
\widetilde r_{jn}
&=
\pi_j
\exp
\Bigg\{
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\quad
-
\frac{1}{2}
\operatorname{tr}
\Bigg[
\left\langle T_j\right\rangle
\Big(
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
\\
&\qquad\qquad
-
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\Big)
\Bigg]
\Bigg\}
\end{aligned}
$$

</details>

<details open>
<summary><strong>The Expectations Connecting The Three Factors</strong></summary>

The first two expressions below are standard Wishart moment identities under
the paper's particular rate-matrix convention. They are properties of the
chosen Wishart family, rather than new coordinate updates. Their parameterisation
matters: using a scale-matrix convention would change where the inverse appears.

The paper gives:

$$
\left\langle T_j\right\rangle
=
\eta_jU_j^{-1}
$$

$$
\left\langle\ln|T_j|\right\rangle
=
\sum_{i=1}^{d}
\psi
\left(
\frac{\eta_j+1-i}{2}
\right)
+
d\ln2
-
\ln|U_j|
$$

$$
\left\langle\boldsymbol{\mu}_j\right\rangle
=
\boldsymbol{m}_j
$$

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
S_j^{-1}
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
$$

and:

$$
\left\langle z_{jn}\right\rangle
=
r_{jn}
$$

This last identity can be read directly from the definition of a discrete
expectation. The indicator $z_{jn}$ can only be 0 or 1, and:

$$
q_Z(z_{jn}=1)
=
r_{jn}
$$

Therefore:

$$
\begin{aligned}
\mathbb{E}_{q_Z}[z_{jn}]
&=
\sum_{z_{jn}\in\{0,1\}}
z_{jn}q_Z(z_{jn})
\\
&=
0(1-r_{jn})+1(r_{jn})
\\
&=
r_{jn}
\end{aligned}
$$

So a responsibility is not merely analogous to an expected label indicator; it
is exactly that expectation under $q_Z$.

The second-moment identity follows from:

$$
\operatorname{Cov}(\boldsymbol{\mu}_j)
=
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
-
\left\langle\boldsymbol{\mu}_j\right\rangle
\left\langle\boldsymbol{\mu}_j\right\rangle^T
$$

Rearrange:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
\operatorname{Cov}(\boldsymbol{\mu}_j)
+
\left\langle\boldsymbol{\mu}_j\right\rangle
\left\langle\boldsymbol{\mu}_j\right\rangle^T
$$

Now substitute:

$$
\operatorname{Cov}(\boldsymbol{\mu}_j)=S_j^{-1}
$$

and:

$$
\left\langle\boldsymbol{\mu}_j\right\rangle=\boldsymbol{m}_j
$$

Reproduce the second-moment equation before substituting those two identities:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
\operatorname{Cov}(\boldsymbol{\mu}_j)
+
\left\langle\boldsymbol{\mu}_j\right\rangle
\left\langle\boldsymbol{\mu}_j\right\rangle^T
$$

Substitution gives:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
S_j^{-1}
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
$$

The special function:

$$
\psi(x)
=
\frac{d}{dx}\ln\Gamma(x)
$$

is the digamma function. It appears because Wishart normalisation contains
Gamma functions. Scientific libraries evaluate it directly.

Remember:

$$
\left\langle\ln|T_j|\right\rangle
\neq
\ln\left|\left\langle T_j\right\rangle\right|
$$

in general. The expectation of a logarithm is not usually the logarithm of an
expectation.

</details>

<details open>
<summary><strong>A More Intuitive Corrected Form Of Equation (88)</strong></summary>

Start from the corrected expected scatter:

$$
x_nx_n^T
-
x_n\boldsymbol{m}_j^T
-
\boldsymbol{m}_jx_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
$$

Use:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
S_j^{-1}
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
$$

Reproduce the scatter before substitution:

$$
x_nx_n^T
-
x_n\boldsymbol{m}_j^T
-
\boldsymbol{m}_jx_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
$$

Substituting gives:

$$
\begin{aligned}
&
x_nx_n^T
-
x_n\boldsymbol{m}_j^T
-
\boldsymbol{m}_jx_n^T
\\
&\quad
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
+
S_j^{-1}
\end{aligned}
$$

The first four terms equal:

$$
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
$$

Therefore:

$$
\begin{aligned}
&
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
\\
&=
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
+
S_j^{-1}
\end{aligned}
$$

So:

$$
\text{expected scatter}
=
\text{scatter from the posterior mean}
+
\text{uncertainty about the mean}
$$

The corrected score becomes:

$$
\begin{aligned}
\widetilde r_{jn}
&=
\pi_j
\exp
\Bigg\{
\frac{1}{2}
\left\langle\ln|T_j|\right\rangle
\\
&\quad
-
\frac{1}{2}
\Bigg[
\left(
x_n-\boldsymbol{m}_j
\right)^T
\left\langle T_j\right\rangle
\left(
x_n-\boldsymbol{m}_j
\right)
\\
&\qquad\qquad
+
\operatorname{tr}
\left(
\left\langle T_j\right\rangle
S_j^{-1}
\right)
\Bigg]
\Bigg\}
\end{aligned}
$$

The first penalty measures distance from the current centre. The trace term
penalises remaining uncertainty about the centre.

Plain English:

> a component scores highly when it is common, close to the observation,
> suitably precise, and reasonably certain about its own centre.

</details>

<details open>
<summary><strong>Graph: From Relative Scores To Responsibilities</strong></summary>

![Responsibilities across the data axis for equal and unequal mixing weights](assets/gmm_eq87_responsibility_curves.png)

Both panels use the same two component centres, shown by the dotted vertical
lines, and the same precision settings. At every horizontal position, the two
curves add to 1 because equation (87) normalises across components.

In the left panel the mixing weights are equal:

$$
\pi_1=\pi_2=0.5
$$

so the 50-50 crossing lies halfway between the two centres. In the right panel:

$$
\pi_1=0.75,
\qquad
\pi_2=0.25
$$

The first component begins with a larger prior score, so the observation must
move farther toward component 2 before component 2 becomes more probable.

This makes the two jobs in equations (87)-(88) visible:

- equation (88) builds the competing scores at a chosen $x_n$;
- equation (87) converts that vertical slice of scores into probabilities.

The horizontal axis is the observation value, not an iteration number. The
vertical axis is a probability and is therefore fixed between 0 and 1.

</details>

<details open>
<summary><strong>A One-Dimensional Numeric Responsibility Example</strong></summary>

Suppose:

$$
x_n=1.2
$$

For component 1:

$$
\pi_1=0.6,
\quad
m_1=1,
\quad
\langle\tau_1\rangle=2,
\quad
S_1^{-1}=0.25,
\quad
\langle\ln\tau_1\rangle=0.56
$$

For example, the precision moments $\langle\tau_1\rangle=2$ and
$\langle\ln\tau_1\rangle\approx0.56$ are consistent with a one-dimensional
Wishart factor having $\eta_1=8$ and $U_1=4$.

The one-dimensional log-score is:

$$
\begin{aligned}
\ln\widetilde r_{jn}
&=
\ln\pi_j
+
\frac{1}{2}\langle\ln\tau_j\rangle
\\
&\quad
-
\frac{1}{2}
\left[
\langle\tau_j\rangle(x_n-m_j)^2
+
\langle\tau_j\rangle S_j^{-1}
\right]
\end{aligned}
$$

Substituting component 1:

$$
\begin{aligned}
\ln\widetilde r_{1n}
&=
\ln(0.6)
+
\frac{1}{2}(0.56)
\\
&\quad
-
\frac{1}{2}
\left[
2(1.2-1)^2
+
2(0.25)
\right]
\end{aligned}
$$

The penalty is:

$$
2(0.2)^2+2(0.25)
=
0.58
$$

Therefore:

$$
\ln\widetilde r_{1n}
\approx
-0.521
$$

and:

$$
\widetilde r_{1n}
\approx
\exp(-0.521)
\approx
0.594
$$

For component 2:

$$
\pi_2=0.4,
\quad
m_2=3,
\quad
\langle\tau_2\rangle=1,
\quad
S_2^{-1}=0.5,
\quad
\langle\ln\tau_2\rangle=-0.13
$$

These precision moments are consistent, for example, with $\eta_2=8$ and
$U_2=8$.

Before substituting component 2, reproduce the one-dimensional log-score:

$$
\begin{aligned}
\ln\widetilde r_{jn}
&=
\ln\pi_j
+
\frac{1}{2}\langle\ln\tau_j\rangle
\\
&\quad-
\frac{1}{2}
\left[
\langle\tau_j\rangle(x_n-m_j)^2
+
\langle\tau_j\rangle S_j^{-1}
\right]
\end{aligned}
$$

Now substitute the component-2 values:

$$
\begin{aligned}
\ln\widetilde r_{2n}
&=
\ln(0.4)
+
\frac{1}{2}(-0.13)
-
\frac{1}{2}
\left[
(1.2-3)^2+0.5
\right]
\\
&\approx
-2.851
\end{aligned}
$$

Therefore:

$$
\widetilde r_{2n}
\approx
0.058
$$

Now reproduce the corrected normalisation formula:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}\widetilde r_{kn}
}
$$

Substitute the two scores for component 1:

$$
r_{1n}
=
\frac{0.594}{0.594+0.058}
\approx
0.911
$$

Reproduce the normalisation formula again before calculating component 2:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}\widetilde r_{kn}
}
$$

Substitute the two scores for component 2:

$$
r_{2n}
=
\frac{0.058}{0.594+0.058}
\approx
0.089
$$

Component 1 wins because the observation is much closer to its centre.

</details>

<details open>
<summary><strong>Equations (89)-(90): Updating The Component Mean Factor</strong></summary>

The paper gives:

$$
\boldsymbol{m}_j
=
S_j^{-1}
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
\left\langle z_{jn}\right\rangle x_n
\tag{89}
$$

and:

$$
S_j
=
\beta I
+
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
\left\langle z_{jn}\right\rangle
\tag{90}
$$

Using $\langle z_{jn}\rangle=r_{jn}$, define:

$$
N_j
=
\sum_{n=1}^{N}
r_{jn}
$$

and:

$$
\boldsymbol{s}_j
=
\sum_{n=1}^{N}
r_{jn}x_n
$$

Then:

$$
S_j
=
\beta I
+
N_j\left\langle T_j\right\rangle
$$

and:

$$
\boldsymbol{m}_j
=
S_j^{-1}
\left\langle T_j\right\rangle
\boldsymbol{s}_j
$$

Here $N_j$ is the effective soft count, and $\boldsymbol{s}_j$ is the
responsibility-weighted data sum.

Plain English:

> $S_j$ combines prior certainty with assigned-data certainty;
> $\boldsymbol{m}_j$ locates the centre using the weighted observations.

</details>

<details open>
<summary><strong>Deriving Equations (89)-(90) Step By Step</strong></summary>

We are now constructing the Gaussian distribution over one component mean,
$\boldsymbol{\mu}_j$. We must not average over $\boldsymbol{\mu}_j$ itself;
it is the variable in the new factor.

**Step 1: reproduce the coordinate rule for this factor**

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
\mathbb{E}_{q_Zq_T}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

Here the expectation is over labels $Z$ and precisions $T$, while the other
component means contribute only constants with respect to
$\boldsymbol{\mu}_j$.

**Step 2: identify the only joint-density terms containing
$\boldsymbol{\mu}_j$**

They are its prior and the likelihood terms for component $j$:

$$
p(\boldsymbol{\mu}_j)
\prod_{n=1}^{N}
\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)^{z_{jn}}
$$

Therefore, reproduce the coordinate rule with irrelevant factors removed:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
\ln p(\boldsymbol{\mu}_j)
\\
&\quad+
\sum_{n=1}^{N}
\mathbb{E}_{q_Zq_T}
\left[
z_{jn}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
\right]
\\
&\quad+
\operatorname{const}
\end{aligned}
$$

**Step 3: write the prior as a function of the unknown mean**

The prior is zero-centred Gaussian with precision $\beta I$:

$$
p(\boldsymbol{\mu}_j)
=
\mathcal{N}
\left(
\boldsymbol{\mu}_j\mid 0,(\beta I)^{-1}
\right)
$$

Its log density is:

$$
\ln p(\boldsymbol{\mu}_j)
=
-\frac{1}{2}
\beta
\boldsymbol{\mu}_j^T\boldsymbol{\mu}_j
+
\operatorname{const}
$$

The omitted Gaussian normalisation does not depend on
$\boldsymbol{\mu}_j$. Thus the prior contributes the quadratic penalty:

$$
-\frac{1}{2}
\beta
\boldsymbol{\mu}_j^T\boldsymbol{\mu}_j
$$

**Step 4: take the required expectations in the likelihood**

The Gaussian log density was:

$$
\begin{aligned}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
&=
\frac{1}{2}\ln|T_j|
\\
&\quad-
\frac{1}{2}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\\
&\quad-
\frac{d}{2}\ln(2\pi)
\end{aligned}
$$

When updating $\boldsymbol{\mu}_j$, the log-determinant and Gaussian
normalisation do not depend on $\boldsymbol{\mu}_j$, so they join
$\operatorname{const}$.

Mean-field independence gives:

$$
\mathbb{E}_{q_Zq_T}
\left[z_{jn}T_j\right]
=
\mathbb{E}_{q_Z}[z_{jn}]
\mathbb{E}_{q_T}[T_j]
=
r_{jn}\left\langle T_j\right\rangle
$$

Therefore the expected likelihood contribution that still depends on
$\boldsymbol{\mu}_j$ is:

$$
-\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\left\langle T_j\right\rangle
\left(
x_n-\boldsymbol{\mu}_j
\right)
$$

This expression says that observation $n$ contributes only a fraction
$r_{jn}$ of a full Gaussian observation to component $j$.

**Step 5: expand one quadratic without skipping the cross-terms**

Let:

$$
A_j
=
\left\langle T_j\right\rangle
$$

Since a precision matrix is symmetric:

$$
x_n^TA_j\boldsymbol{\mu}_j
=
\boldsymbol{\mu}_j^TA_jx_n
$$

Reproduce the quadratic before expanding it:

$$
\begin{aligned}
&
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\left\langle T_j\right\rangle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\\
&=
x_n^T\left\langle T_j\right\rangle x_n
-
2\boldsymbol{\mu}_j^T
\left\langle T_j\right\rangle x_n
+
\boldsymbol{\mu}_j^T
\left\langle T_j\right\rangle
\boldsymbol{\mu}_j
\end{aligned}
$$

The first term:

$$
x_n^TA_jx_n
$$

contains the observed $x_n$ and the currently fixed $A_j$, but not
$\boldsymbol{\mu}_j$. It therefore affects the normalising constant of the new
factor, not its mean or covariance.

**Step 6: distribute the weighted sum**

Reproduce the expected likelihood contribution:

$$
-\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
A_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
$$

Substitute the expanded quadratic:

$$
\begin{aligned}
&-
\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}
\Big[
x_n^TA_jx_n
-
2\boldsymbol{\mu}_j^TA_jx_n
+
\boldsymbol{\mu}_j^TA_j\boldsymbol{\mu}_j
\Big]
\\
&=
-\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}x_n^TA_jx_n
\\
&\quad+
\boldsymbol{\mu}_j^TA_j
\sum_{n=1}^{N}r_{jn}x_n
\\
&\quad-
\frac{1}{2}
\boldsymbol{\mu}_j^TA_j\boldsymbol{\mu}_j
\sum_{n=1}^{N}r_{jn}
\end{aligned}
$$

The first line of the result is constant with respect to
$\boldsymbol{\mu}_j$. Keeping the linear and quadratic terms and adding the
prior gives:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
-
\frac{1}{2}
\boldsymbol{\mu}_j^T
\left[
\beta I
+
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
r_{jn}
\right]
\boldsymbol{\mu}_j
\\
&\quad
+
\boldsymbol{\mu}_j^T
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
r_{jn}x_n
+
\operatorname{const}
\end{aligned}
$$

This is the algebraic line that the earlier version reached too quickly.

**Step 7: complete the square and identify the Gaussian**

For readability define:

$$
P_j
=
\beta I
+
\left\langle T_j\right\rangle
\sum_{n=1}^{N}r_{jn}
$$

and:

$$
\boldsymbol{b}_j
=
\left\langle T_j\right\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

Then the log factor is:

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
-\frac{1}{2}
\boldsymbol{\mu}_j^TP_j\boldsymbol{\mu}_j
+
\boldsymbol{\mu}_j^T\boldsymbol{b}_j
+
\operatorname{const}
$$

Choose:

$$
\boldsymbol{m}_j
=
P_j^{-1}\boldsymbol{b}_j
$$

so that:

$$
\boldsymbol{b}_j
=
P_j\boldsymbol{m}_j
$$

Reproduce the log factor before substituting this relation:

$$
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
=
-\frac{1}{2}
\boldsymbol{\mu}_j^TP_j\boldsymbol{\mu}_j
+
\boldsymbol{\mu}_j^T\boldsymbol{b}_j
+
\operatorname{const}
$$

Substitution gives:

$$
\begin{aligned}
\ln q_{\mu}^*(\boldsymbol{\mu}_j)
&=
-\frac{1}{2}
\boldsymbol{\mu}_j^TP_j\boldsymbol{\mu}_j
+
\boldsymbol{\mu}_j^TP_j\boldsymbol{m}_j
+
\operatorname{const}
\\
&=
-\frac{1}{2}
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)^T
P_j
\left(
\boldsymbol{\mu}_j-\boldsymbol{m}_j
\right)
+
\operatorname{const}
\end{aligned}
$$

The extra term produced by expanding the completed square,
$\boldsymbol{m}_j^TP_j\boldsymbol{m}_j/2$, is constant with respect to
$\boldsymbol{\mu}_j$, so it is absorbed into $\operatorname{const}$.

This is exactly the log kernel of a Gaussian with mean
$\boldsymbol{m}_j$ and precision $P_j$:

$$
q_{\mu}(\boldsymbol{\mu}_j)
=
\mathcal{N}
\left(
\boldsymbol{\mu}_j
\mid
\boldsymbol{m}_j,
P_j^{-1}
\right)
$$

The paper calls this precision matrix $S_j$. Reproduce $P_j$ before making that
identification:

$$
P_j
=
\beta I
+
\left\langle T_j\right\rangle
\sum_{n=1}^{N}r_{jn}
$$

Set $S_j=P_j$ to obtain equation (90):

$$
S_j
=
\beta I
+
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
r_{jn}
$$

Reproduce the definition of $\boldsymbol{m}_j$ before substituting $P_j=S_j$
and $\boldsymbol{b}_j$:

$$
\boldsymbol{m}_j
=
P_j^{-1}\boldsymbol{b}_j
$$

Substitution gives equation (89):

$$
\boldsymbol{m}_j
=
S_j^{-1}
\left\langle T_j\right\rangle
\sum_{n=1}^{N}
r_{jn}x_n
$$

The logic is now visible:

1. the prior and soft-assigned likelihood produce a quadratic function of the
   unknown centre;
2. completing the square proves that this quadratic is a Gaussian log density;
3. its quadratic coefficient is the new precision $S_j$;
4. its completed-square centre is the new mean $\boldsymbol{m}_j$.

</details>

<details open>
<summary><strong>The Mean Update As Bayesian Shrinkage</strong></summary>

Define:

$$
\overline{x}_j
=
\frac{
\displaystyle
\sum_{n=1}^{N}r_{jn}x_n
}{
N_j
}
$$

so:

$$
\sum_{n=1}^{N}r_{jn}x_n
=
N_j\overline{x}_j
$$

In one dimension:

$$
S_j
=
\beta
+
N_j\langle\tau_j\rangle
$$

The one-dimensional form of equation (89) is:

$$
m_j
=
S_j^{-1}
\langle\tau_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

The two expressions to substitute are:

$$
\sum_{n=1}^{N}r_{jn}x_n
=
N_j\overline{x}_j
$$

and:

$$
S_j^{-1}
=
\frac{1}{
\beta+N_j\langle\tau_j\rangle
}
$$

Reproduce equation (89) immediately before using them:

$$
m_j
=
S_j^{-1}
\langle\tau_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

Substitution gives:

$$
m_j
=
\frac{
N_j\langle\tau_j\rangle
}{
\beta+N_j\langle\tau_j\rangle
}
\overline{x}_j
$$

The fraction lies between 0 and 1 when $\beta>0$, so the weighted data mean is
shrunk toward the prior centre 0.

The prior pulls more strongly when $\beta$ is large or $N_j$ is small. The data
pull more strongly when the effective count and expected precision are large.

</details>

<details open>
<summary><strong>Graph: Seeing Bayesian Shrinkage In Equation (89)</strong></summary>

![Updated component mean as the effective soft count grows](assets/gmm_eq89_mean_shrinkage.png)

This graph uses the one-dimensional update:

$$
m_j
=
\frac{
N_j\langle\tau_j\rangle
}{
\beta+N_j\langle\tau_j\rangle
}
\overline{x}_j
$$

with:

$$
\beta=2,
\qquad
\langle\tau_j\rangle=1,
\qquad
\overline{x}_j=3
$$

The horizontal axis is the effective soft count:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

It need not be an integer. For example, four observations each having
responsibility $0.5$ produce $N_j=2$.

At $N_j=0$, no observations support the component, so the updated mean remains
at the prior centre 0. At $N_j=2$, the update is:

$$
m_j
=
\frac{2(1)}{2+2(1)}(3)
=
1.5
$$

As $N_j$ grows, the curve approaches the soft data mean 3 but does not overshoot
it. The axes make the intended claim precise: more assigned evidence moves the
posterior centre away from the prior centre and toward the data-supported
centre.

</details>

<details open>
<summary><strong>A Coupled Numeric Example For Equations (89)-(90)</strong></summary>

Suppose:

$$
x_1=1,
\quad
x_2=3,
\quad
r_{j1}=0.75,
\quad
r_{j2}=0.25
$$

The effective-count formula is:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Substitute the two responsibilities:

$$
N_j
=
0.75+0.25
=
1
$$

The responsibility-weighted data sum is:

$$
\sum_{n=1}^{N}r_{jn}x_n
$$

Substitute the two observations and responsibilities:

$$
\sum_{n=1}^{2}r_{jn}x_n
=
0.75(1)+0.25(3)
=
1.5
$$

Suppose:

$$
\beta=1,
\quad
\langle\tau_j\rangle=2
$$

Equation (90) is:

$$
S_j
=
\beta
+
\langle\tau_j\rangle
\sum_{n=1}^{N}r_{jn}
$$

Substitute:

$$
S_j
=
1+2(1)
=
3
$$

Equation (89) is:

$$
m_j
=
S_j^{-1}
\langle\tau_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

Substitute:

$$
m_j
=
\frac{1}{3}(2)(1.5)
=
1
$$

The data's weighted mean is 1.5, but the zero-centred prior pulls the posterior
mean to 1. Because $S_j$ is the posterior precision, the posterior variance is
its inverse:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
S_j^{-1}
$$

Substitute $S_j=3$:

$$
\operatorname{Var}_{q_{\mu}}(\mu_j)
=
\frac{1}{3}
$$

</details>

<details open>
<summary><strong>Equations (91)-(92): Updating The Precision Factor</strong></summary>

Equation (91) is:

$$
\eta_j
=
\nu
+
\sum_{n=1}^{N}
\left\langle z_{jn}\right\rangle
\tag{91}
$$

For a categorical label factor:

$$
\left\langle z_{jn}\right\rangle
=
r_{jn}
$$

and the effective soft count is:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Reproduce equation (91) before substituting these identities:

$$
\eta_j
=
\nu
+
\sum_{n=1}^{N}
\left\langle z_{jn}\right\rangle
$$

Substitution gives:

$$
\eta_j
=
\nu+\sum_{n=1}^{N}r_{jn}
=
\nu+N_j
$$

So the Wishart strength combines prior strength and soft component count.

**Paper-faithful equation (92)**

The printed paper gives:

$$
\begin{aligned}
U_j
&=
V
+
\sum_{n=1}^{N}
\left\langle z_{jn}\right\rangle
\Big(
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
\\
&\qquad\qquad
+
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\Big)
\end{aligned}
\tag{92}
$$

The second cross-term again has the inconsistent positive sign.

**Mathematically corrected equation (92)**

Using:

$$
\langle\boldsymbol{\mu}_j\rangle=\boldsymbol{m}_j
$$

and:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
S_j^{-1}
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
$$

the corrected centred form is:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left[
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
+
S_j^{-1}
\right]
$$

So:

$$
\text{posterior rate-like matrix}
=
\text{prior rate-like matrix}
+
\text{expected soft scatter}
$$

</details>

<details open>
<summary><strong>Deriving Equations (91)-(92) Step By Step</strong></summary>

We are constructing a distribution over the precision matrix $T_j$. Therefore
$T_j$ must remain symbolic throughout the derivation: we average over $Z$ and
$\boldsymbol{\mu}_j$, not over $T_j$ itself.

The only joint-density terms containing $T_j$ are:

$$
p(T_j)
\prod_{n=1}^{N}
\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)^{z_{jn}}
$$

Reproduce the coordinate rule for this factor:

$$
\ln q_T^*(T_j)
=
\mathbb{E}_{q_Zq_{\mu}}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
+
\operatorname{const}
$$

The expectation is over the soft labels and component means. All joint-model
terms not containing $T_j$ become part of $\operatorname{const}$.

The prior is:

$$
p(T_j)
=
W(T_j\mid\nu,V)
$$

Its full normalising constant is not needed to identify the new distribution.
The part that changes as $T_j$ changes, called its **kernel**, is:

$$
p(T_j)
\propto
|T_j|^{(\nu-d-1)/2}
\exp
\left\{
-\frac{1}{2}\operatorname{tr}(VT_j)
\right\}
$$

Take logarithms using $\ln(a^b)=b\ln a$ and $\ln(\exp c)=c$:

$$
\ln p(T_j)
=
\frac{\nu-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(VT_j)
+
\operatorname{const}
$$

Therefore the Wishart prior contributes:

$$
\frac{\nu-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(VT_j)
$$

Now reproduce the Gaussian log likelihood for one observation:

$$
\begin{aligned}
\ln\mathcal{N}
\left(
x_n\mid\boldsymbol{\mu}_j,T_j^{-1}
\right)
&=
\frac{1}{2}\ln|T_j|
\\
&\quad-
\frac{1}{2}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\\
&\quad-
\frac{d}{2}\ln(2\pi)
\end{aligned}
$$

Use the quadratic-to-trace identity:

$$
\boldsymbol{a}^TB\boldsymbol{a}
=
\operatorname{tr}
\left(
B\boldsymbol{a}\boldsymbol{a}^T
\right)
$$

Reproduce the $T_j$-dependent part of the log likelihood before substitution:

$$
\frac{1}{2}\ln|T_j|
-
\frac{1}{2}
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
$$

Substitution gives:

$$
\frac{1}{2}\ln|T_j|
-
\frac{1}{2}
\operatorname{tr}
\left[
T_j
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right]
$$

The label expectation is:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
r_{jn}
$$

and the mean-scatter expectation is:

$$
C_{jn}
=
\mathbb{E}_{q_{\mu}}
\left[
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right]
$$

Because $q_Z$ and $q_{\mu}$ are separate mean-field factors, their expectations
factorise. Therefore one observation contributes:

$$
\frac{r_{jn}}{2}\ln|T_j|
-
\frac{r_{jn}}{2}
\operatorname{tr}
\left[
T_j
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
\right]
$$

Here $T_j$ remains inside the expression. Replacing it by
$\langle T_j\rangle$ would be wrong at this point because $T_j$ is the variable
whose distribution is being constructed.

Using the abbreviation $C_{jn}$, reproduce the one-observation contribution:

$$
\frac{r_{jn}}{2}\ln|T_j|
-
\frac{r_{jn}}{2}
\operatorname{tr}
\left(
T_jC_{jn}
\right)
$$

Reproduce the Wishart-prior contribution:

$$
\frac{\nu-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(VT_j)
$$

Sum the first expression over observations and add the prior:

$$
\begin{aligned}
\ln q_T^*(T_j)
&=
\left[
\frac{\nu-d-1}{2}
+
\frac{1}{2}\sum_{n=1}^{N}r_{jn}
\right]
\ln|T_j|
\\
&\quad-
\frac{1}{2}\operatorname{tr}(VT_j)
\\
&\quad-
\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}\operatorname{tr}(T_jC_{jn})
+
\operatorname{const}
\end{aligned}
$$

The log-determinant coefficient simplifies as:

$$
\frac{\nu-d-1}{2}
+
\frac{1}{2}\sum_{n=1}^{N}r_{jn}
=
\frac{
\nu-d-1+\sum_{n=1}^{N}r_{jn}
}{2}
$$

Linearity and the cyclic trace rule give:

$$
\begin{aligned}
&\operatorname{tr}(VT_j)
+
\sum_{n=1}^{N}
r_{jn}\operatorname{tr}(T_jC_{jn})
\\
&=
\operatorname{tr}
\left[
\left(
V+\sum_{n=1}^{N}r_{jn}C_{jn}
\right)
T_j
\right]
\end{aligned}
$$

Reproduce the summed log factor before substituting these simplifications:

$$
\begin{aligned}
\ln q_T^*(T_j)
&=
\left[
\frac{\nu-d-1}{2}
+
\frac{1}{2}\sum_{n=1}^{N}r_{jn}
\right]
\ln|T_j|
\\
&\quad-
\frac{1}{2}\operatorname{tr}(VT_j)
\\
&\quad-
\frac{1}{2}
\sum_{n=1}^{N}
r_{jn}\operatorname{tr}(T_jC_{jn})
+
\operatorname{const}
\end{aligned}
$$

After substitution, this becomes:

$$
\begin{aligned}
\ln q_T^*(T_j)
&=
\frac{
\nu-d-1+\sum_n r_{jn}
}{2}
\ln|T_j|
\\
&\quad
-
\frac{1}{2}
\operatorname{tr}
\Bigg\{
\Bigg[
V
+
\sum_n
r_{jn}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
\Bigg]
T_j
\Bigg\}
\\
&\quad
+
\operatorname{const}
\end{aligned}
$$

To identify the distribution, reproduce the general Wishart log kernel:

$$
\ln W(T_j\mid\eta_j,U_j)
=
\frac{\eta_j-d-1}{2}\ln|T_j|
-
\frac{1}{2}\operatorname{tr}(U_jT_j)
+
\operatorname{const}
$$

Both expressions depend on $T_j$ only through $\ln|T_j|$ and a trace linear in
$T_j$. For them to be the same function of every positive-definite $T_j$, the
coefficients of those two structures must agree.

First match the log-determinant coefficients:

$$
\frac{\eta_j-d-1}{2}
=
\frac{
\nu-d-1+\sum_{n=1}^{N}r_{jn}
}{2}
$$

Multiply both sides by 2:

$$
\eta_j-d-1
=
\nu-d-1+\sum_{n=1}^{N}r_{jn}
$$

Add $d+1$ to both sides:

$$
\eta_j
=
\nu+\sum_{n=1}^{N}r_{jn}
$$

This is equation (91). The $d+1$ terms have not disappeared by magic; they
cancel from both sides.

Now reproduce the two trace terms being compared:

$$
-\frac{1}{2}\operatorname{tr}(U_jT_j)
$$

and:

$$
-\frac{1}{2}
\operatorname{tr}
\left\{
\left[
V+
\sum_{n=1}^{N}
r_{jn}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
\right]
T_j
\right\}
$$

The common factors $-1/2$, $\operatorname{tr}(\cdot)$, and $T_j$ agree.
Therefore the matrices multiplying $T_j$ must agree:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
$$

We still need to derive, rather than merely quote, the expected-scatter
identity. Define:

$$
C_{jn}
=
\left\langle
\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\right\rangle
$$

Expand the outer product:

$$
\begin{aligned}
&\left(
x_n-\boldsymbol{\mu}_j
\right)
\left(
x_n-\boldsymbol{\mu}_j
\right)^T
\\
&=
x_nx_n^T
-
x_n\boldsymbol{\mu}_j^T
-
\boldsymbol{\mu}_jx_n^T
+
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\end{aligned}
$$

Take expectations term by term:

$$
\begin{aligned}
C_{jn}
&=
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
-
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
\\
&\quad+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\end{aligned}
$$

The Gaussian mean-factor moments are:

$$
\left\langle\boldsymbol{\mu}_j\right\rangle
=
\boldsymbol{m}_j
$$

and:

$$
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
=
S_j^{-1}
+
\boldsymbol{m}_j\boldsymbol{m}_j^T
$$

Reproduce $C_{jn}$ before substituting these moments:

$$
\begin{aligned}
C_{jn}
&=
x_nx_n^T
-
x_n\left\langle\boldsymbol{\mu}_j\right\rangle^T
-
\left\langle\boldsymbol{\mu}_j\right\rangle x_n^T
\\
&\quad+
\left\langle
\boldsymbol{\mu}_j\boldsymbol{\mu}_j^T
\right\rangle
\end{aligned}
$$

Substitution gives:

$$
\begin{aligned}
C_{jn}
&=
x_nx_n^T
-
x_n\boldsymbol{m}_j^T
-
\boldsymbol{m}_jx_n^T
\\
&\quad+
\boldsymbol{m}_j\boldsymbol{m}_j^T
+
S_j^{-1}
\\
&=
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
+
S_j^{-1}
\end{aligned}
$$

Reproduce the rate-matrix update before substituting this identity:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}C_{jn}
$$

Substitution gives the corrected centred form:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left[
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
+
S_j^{-1}
\right]
$$

The two addends inside the bracket answer different questions:

$$
\underbrace{
\left(
x_n-\boldsymbol{m}_j
\right)
\left(
x_n-\boldsymbol{m}_j
\right)^T
}_{\text{distance scatter}}
+
\underbrace{
S_j^{-1}
}_{\text{uncertainty about the centre}}
$$

If the centre is uncertain, acting as though it were known exactly would
underestimate the expected scatter and make the component artificially narrow.

</details>

<details open>
<summary><strong>Graph: The Two Sources Of Expected Scatter</strong></summary>

![Expected scatter from distance and uncertainty about the component centre](assets/gmm_eq92_expected_scatter.png)

In one dimension, the expected-scatter term in equation (92) is:

$$
(x_n-m_j)^2+S_j^{-1}
$$

The horizontal axis shows the absolute distance from the updated centre:

$$
|x_n-m_j|
$$

The vertical axis shows the resulting scatter contribution for an observation
with responsibility 1. The green curve assumes the centre is known exactly:

$$
S_j^{-1}=0
$$

The pink curve uses:

$$
S_j^{-1}=0.5
$$

so it lies exactly 0.5 higher at every distance. In particular, even when:

$$
x_n=m_j
$$

the expected scatter is not zero if the centre itself remains uncertain. The
quadratic vertical scale also shows that distant observations increase the
rate-like update much faster than nearby observations.

For an actual responsibility $r_{jn}<1$, the entire vertical value is multiplied
by $r_{jn}$, so weakly assigned observations contribute proportionally less.

</details>

<details open>
<summary><strong>Continuing The Numeric Example Through Equations (91)-(92)</strong></summary>

Continue with:

$$
x_1=1,
\quad
x_2=3,
\quad
r_{j1}=0.75,
\quad
r_{j2}=0.25
$$

$$
N_j=1,
\quad
m_j=1,
\quad
S_j^{-1}=\frac{1}{3}
$$

Suppose:

$$
\nu=3,
\quad
V=2
$$

Reproduce equation (91):

$$
\eta_j
=
\nu+N_j
$$

Substitute $\nu=3$ and $N_j=1$:

$$
\eta_j
=
\nu+N_j
=
3+1
=
4
$$

In one dimension, corrected equation (92) is:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left[
(x_n-m_j)^2
+
S_j^{-1}
\right]
$$

For observation 1:

The general contribution of one observation in one dimension is:

$$
c_{jn}
=
r_{jn}
\left[
(x_n-m_j)^2+S_j^{-1}
\right]
$$

Substitute $x_1=1$, $r_{j1}=0.75$, $m_j=1$, and $S_j^{-1}=1/3$:

$$
c_{j1}
=
0.75
\left[
(1-1)^2+\frac{1}{3}
\right]
=
0.25
$$

For observation 2:

Reproduce the same one-observation formula before the next substitution:

$$
c_{jn}
=
r_{jn}
\left[
(x_n-m_j)^2+S_j^{-1}
\right]
$$

Substitute $x_2=3$, $r_{j2}=0.25$, $m_j=1$, and $S_j^{-1}=1/3$:

$$
c_{j2}
=
0.25
\left[
(3-1)^2+\frac{1}{3}
\right]
=
\frac{13}{12}
\approx
1.083
$$

Reproduce the update:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left[
(x_n-m_j)^2
+
S_j^{-1}
\right]
$$

Substitute:

$$
U_j
=
2+c_{j1}+c_{j2}
=
2+0.25+1.083
\approx
3.333
$$

The expected precision is:

$$
\langle\tau_j\rangle
=
\frac{\eta_j}{U_j}
$$

Substituting:

$$
\langle\tau_j\rangle
\approx
\frac{4}{3.333}
\approx
1.20
$$

The component becomes broader because the partly assigned observation at 3
creates scatter around the updated centre at 1.

</details>

<details open>
<summary><strong>One Complete Variational E-Step In Plain English</strong></summary>

One pass through equations (87)-(92) is:

1. Compute every unnormalised score $\widetilde r_{jn}$.
2. Normalise scores across components to obtain $r_{jn}$.
3. Add responsibilities to obtain $N_j=\sum_n r_{jn}$.
4. Update:

   $$
   S_j
   =
   \beta I+N_j\langle T_j\rangle
   $$

5. Update:

   $$
   \boldsymbol{m}_j
   =
   S_j^{-1}
   \langle T_j\rangle
   \sum_n r_{jn}x_n
   $$

6. Update:

   $$
   \eta_j
   =
   \nu+N_j
   $$

7. Update:

   $$
   U_j
   =
   V
   +
   \sum_n
   r_{jn}
   \left[
   (x_n-\boldsymbol{m}_j)
   (x_n-\boldsymbol{m}_j)^T
   +
   S_j^{-1}
   \right]
   $$

8. Recompute the expectations and use them in the next responsibility update.

The paper notes that the factors are coupled and iterative updates are needed.
It also reports that one pass may be sufficient for each outer variational
E-step in practice.

</details>

<details open>
<summary><strong>How Equations (87)-(92) Map To The Code</strong></summary>

The implementation in:

`src/gaussian_mixture/variational_em.py`

uses the corrected centred-scatter forms.

| Paper quantity | Code quantity |
|---|---|
| $r_{jn}$ | `responsibilities[n, j]` |
| $N_j$ | `effective_counts[j]` |
| $\boldsymbol{m}_j$ | `mean_expectations[j]` |
| $S_j^{-1}$ | `mean_covariances[j]` |
| $\langle T_j\rangle$ | `precision_expectations[j]` |
| $\eta_j$ | `precision_degrees[j]` |
| $U_j$ | `precision_rates[j]` |
| $\beta$ | `mean_prior_precision` |
| $V$ | `prior_rate` |

The code stores $S_j^{-1}$ directly as `mean_covariances`.

The responsibility calculation uses:

$$
(x_n-\boldsymbol{m}_j)^T
\langle T_j\rangle
(x_n-\boldsymbol{m}_j)
+
\operatorname{tr}
\left(
\langle T_j\rangle S_j^{-1}
\right)
$$

rather than the paper's expanded cross-terms.

The scatter update uses:

$$
\sum_n r_{jn}
(x_n-\boldsymbol{m}_j)
(x_n-\boldsymbol{m}_j)^T
+
N_jS_j^{-1}
$$

because:

$$
\sum_n r_{jn}S_j^{-1}
=
\left(\sum_n r_{jn}\right)S_j^{-1}
=
N_jS_j^{-1}
$$

The code works with log scores before normalisation to avoid numerical
underflow when raw component scores are extremely small.

</details>

<details open>
<summary><strong>Block 4 Summary</strong></summary>

The corrected responsibility normalisation is:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\widetilde r_{kn}
}
$$

The intuitive corrected score is:

$$
\begin{aligned}
\widetilde r_{jn}
&=
\pi_j
\exp
\Bigg\{
\frac{1}{2}\langle\ln|T_j|\rangle
\\
&\quad
-
\frac{1}{2}
\Big[
(x_n-\boldsymbol{m}_j)^T
\langle T_j\rangle
(x_n-\boldsymbol{m}_j)
+
\operatorname{tr}
\left(
\langle T_j\rangle S_j^{-1}
\right)
\Big]
\Bigg\}
\end{aligned}
$$

The Gaussian mean-factor updates are:

$$
\boldsymbol{m}_j
=
S_j^{-1}
\langle T_j\rangle
\sum_n r_{jn}x_n
$$

$$
S_j
=
\beta I
+
\langle T_j\rangle
\sum_n r_{jn}
$$

The corrected Wishart-factor updates are:

$$
\eta_j
=
\nu+\sum_n r_{jn}
$$

$$
U_j
=
V
+
\sum_n
r_{jn}
\left[
(x_n-\boldsymbol{m}_j)
(x_n-\boldsymbol{m}_j)^T
+
S_j^{-1}
\right]
$$

The key idea is:

> responsibilities, mean beliefs, and precision beliefs are updated from one
> another's expectations, so the variational E-step is a coordinated exchange
> of soft information.

The final equation in this note is equation (93), the variational M-step update
for:

$$
\boldsymbol{\pi}
$$

</details>

---

## Block 5: Equation (93)

<details open>
<summary><strong>The Goal Of The Variational M-Step</strong></summary>

Equations (87)-(92) updated the variational distribution:

$$
q(Z,\boldsymbol{\mu},T)
$$

while the mixing weights:

$$
\boldsymbol{\pi}
=
(\pi_1,\ldots,\pi_M)
$$

were held fixed. Equation (93) now reverses those roles:

- hold the newly updated variational distribution $q$ fixed;
- update the model parameter $\boldsymbol{\pi}$.

Each mixing weight has the interpretation:

$$
\pi_j
=
\text{model's current proportion for component }j
$$

The weights must obey the probability-simplex constraints:

$$
\pi_j\geq 0
\qquad
\text{for every }j
$$

and:

$$
\sum_{j=1}^{M}\pi_j
=
1
$$

That second condition is why we cannot maximise each $\pi_j$ independently.
Giving more total probability to one component necessarily leaves less for the
others.

</details>

<details open>
<summary><strong>Equation (93): The Paper's Mixing-Weight Update</strong></summary>

The paper gives:

$$
\pi_j
=
\frac{
\displaystyle
\sum_{n=1}^{N}r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\sum_{n=1}^{N}r_{kn}
}
\tag{93}
$$

The numerator is the total responsibility taken by component $j$:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

The denominator is the total responsibility taken by every component across
every observation:

$$
\sum_{k=1}^{M}
\sum_{n=1}^{N}r_{kn}
$$

So equation (93) says:

$$
\text{new mixing weight}
=
\frac{
\text{soft count for this component}
}{
\text{soft count across all components}
}
$$

This is the soft-assignment version of “number in this cluster divided by
number in the dataset.”

</details>

<details open>
<summary><strong>Deriving Equation (93) From The ELBO Step By Step</strong></summary>

**Step 1: reproduce the objective being maximised**

The evidence lower bound is:

$$
\mathcal{F}[q,\boldsymbol{\pi}]
=
\mathbb{E}_{q}
\left[
\ln p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
\right]
-
\mathbb{E}_{q}
\left[
\ln q(Z,\boldsymbol{\mu},T)
\right]
$$

During the variational M-step, $q$ is fixed. We only ask:

> Which terms can change when $\boldsymbol{\pi}$ changes?

The entropy term:

$$
-
\mathbb{E}_{q}
\left[
\ln q(Z,\boldsymbol{\mu},T)
\right]
$$

contains no $\boldsymbol{\pi}$ and is therefore constant during this step.

In the joint model:

$$
\begin{aligned}
p(X,Z,\boldsymbol{\mu},T;\boldsymbol{\pi})
&=
p(Z;\boldsymbol{\pi})
p(X\mid Z,\boldsymbol{\mu},T)
\\
&\quad\times
p(\boldsymbol{\mu})p(T)
\end{aligned}
$$

only the assignment factor:

$$
p(Z;\boldsymbol{\pi})
$$

contains $\boldsymbol{\pi}$. Therefore maximising the full ELBO with respect to
$\boldsymbol{\pi}$ is equivalent to maximising:

$$
\mathcal{F}_{\pi}
=
\mathbb{E}_{q_Z}
\left[
\ln p(Z;\boldsymbol{\pi})
\right]
$$

This deletion is exact for the M-step: all removed terms are constant with
respect to $\boldsymbol{\pi}$.

**Step 2: expand the assignment model**

Reproduce the assignment probability:

$$
p(Z;\boldsymbol{\pi})
=
\prod_{n=1}^{N}
\prod_{j=1}^{M}
\pi_j^{z_{jn}}
$$

Take logarithms:

$$
\ln p(Z;\boldsymbol{\pi})
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}\ln\pi_j
$$

Reproduce the $\boldsymbol{\pi}$-dependent objective before substitution:

$$
\mathcal{F}_{\pi}
=
\mathbb{E}_{q_Z}
\left[
\ln p(Z;\boldsymbol{\pi})
\right]
$$

Substitute the expanded log assignment model:

$$
\mathcal{F}_{\pi}
=
\mathbb{E}_{q_Z}
\left[
\sum_{n=1}^{N}
\sum_{j=1}^{M}
z_{jn}\ln\pi_j
\right]
$$

Expectation is linear, and $\ln\pi_j$ is a fixed number during the expectation
over $Z$. Therefore:

$$
\mathcal{F}_{\pi}
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\mathbb{E}_{q_Z}[z_{jn}]
\ln\pi_j
$$

For the categorical label factor:

$$
\mathbb{E}_{q_Z}[z_{jn}]
=
r_{jn}
$$

Reproduce the objective before substituting this moment:

$$
\mathcal{F}_{\pi}
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
\mathbb{E}_{q_Z}[z_{jn}]
\ln\pi_j
$$

Substitution gives:

$$
\mathcal{F}_{\pi}
=
\sum_{n=1}^{N}
\sum_{j=1}^{M}
r_{jn}\ln\pi_j
$$

Exchange the order of the finite sums:

$$
\mathcal{F}_{\pi}
=
\sum_{j=1}^{M}
\left(
\sum_{n=1}^{N}r_{jn}
\right)
\ln\pi_j
$$

Define the effective soft count:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Reproduce the objective before substituting $N_j$:

$$
\mathcal{F}_{\pi}
=
\sum_{j=1}^{M}
\left(
\sum_{n=1}^{N}r_{jn}
\right)
\ln\pi_j
$$

Substitution gives the compact objective:

$$
\mathcal{F}_{\pi}
=
\sum_{j=1}^{M}
N_j\ln\pi_j
$$

**Step 3: enforce the condition that the weights add to 1**

We must maximise:

$$
\sum_{j=1}^{M}N_j\ln\pi_j
$$

subject to:

$$
\sum_{j=1}^{M}\pi_j=1
$$

Introduce a Lagrange multiplier $\lambda$:

$$
\mathcal{J}(\boldsymbol{\pi},\lambda)
=
\sum_{j=1}^{M}N_j\ln\pi_j
+
\lambda
\left(
\sum_{j=1}^{M}\pi_j-1
\right)
$$

The multiplier does not add a new modelling assumption. At any valid point the
bracket equals zero, so $\mathcal{J}$ and the original objective have the same
value. Its purpose is to make the shared constraint appear in every derivative.

**Step 4: differentiate with respect to one mixing weight**

Reproduce the Lagrangian:

$$
\mathcal{J}(\boldsymbol{\pi},\lambda)
=
\sum_{k=1}^{M}N_k\ln\pi_k
+
\lambda
\left(
\sum_{k=1}^{M}\pi_k-1
\right)
$$

The index has been written as $k$ so that we can differentiate with respect to
one particular $\pi_j$. Use:

$$
\frac{\partial}{\partial\pi_j}\ln\pi_j
=
\frac{1}{\pi_j}
$$

and:

$$
\frac{\partial}{\partial\pi_j}
\sum_{k=1}^{M}\pi_k
=
1
$$

Therefore:

$$
\frac{\partial\mathcal{J}}{\partial\pi_j}
=
\frac{N_j}{\pi_j}
+
\lambda
$$

At an interior maximum, set the derivative to zero:

$$
\frac{N_j}{\pi_j}
+
\lambda
=
0
$$

Move $\lambda$ to the other side:

$$
\frac{N_j}{\pi_j}
=
-\lambda
$$

Multiply by $\pi_j$:

$$
N_j
=
-\lambda\pi_j
$$

Divide by $-\lambda$:

$$
\pi_j
=
-\frac{N_j}{\lambda}
$$

This tells us the optimum weight is proportional to the component's soft count,
but $\lambda$ is still unknown.

**Step 5: determine $\lambda$ from normalisation**

Reproduce the provisional solution:

$$
\pi_j
=
-\frac{N_j}{\lambda}
$$

Sum both sides over every component:

$$
\sum_{j=1}^{M}\pi_j
=
-\frac{1}{\lambda}
\sum_{j=1}^{M}N_j
$$

Use the required normalisation:

$$
\sum_{j=1}^{M}\pi_j
=
1
$$

Reproduce the summed provisional solution before substitution:

$$
\sum_{j=1}^{M}\pi_j
=
-\frac{1}{\lambda}
\sum_{j=1}^{M}N_j
$$

Substitution gives:

$$
1
=
-\frac{1}{\lambda}
\sum_{j=1}^{M}N_j
$$

Multiply by $\lambda$:

$$
\lambda
=
-\sum_{j=1}^{M}N_j
$$

**Step 6: substitute $\lambda$ back into the provisional solution**

Reproduce the provisional solution:

$$
\pi_j
=
-\frac{N_j}{\lambda}
$$

Substitute:

$$
\lambda
=
-\sum_{k=1}^{M}N_k
$$

into that solution:

$$
\pi_j
=
-\frac{
N_j
}{
-\displaystyle\sum_{k=1}^{M}N_k
}
=
\frac{
N_j
}{
\displaystyle\sum_{k=1}^{M}N_k
}
$$

Reproduce the effective-count definition:

$$
N_k
=
\sum_{n=1}^{N}r_{kn}
$$

Reproduce the mixing-weight update before substituting that definition:

$$
\pi_j
=
\frac{
N_j
}{
\displaystyle\sum_{k=1}^{M}N_k
}
$$

Substitution gives:

$$
\pi_j
=
\frac{
\displaystyle\sum_{n=1}^{N}r_{jn}
}{
\displaystyle
\sum_{k=1}^{M}
\sum_{n=1}^{N}r_{kn}
}
$$

This is equation (93).

**Step 7: show why the denominator is exactly $N$**

For each observation, equation (87) guarantees:

$$
\sum_{k=1}^{M}r_{kn}
=
1
$$

Start from the denominator of equation (93):

$$
\sum_{k=1}^{M}
\sum_{n=1}^{N}r_{kn}
$$

Because both sums are finite, exchange their order:

$$
\sum_{k=1}^{M}
\sum_{n=1}^{N}r_{kn}
=
\sum_{n=1}^{N}
\sum_{k=1}^{M}r_{kn}
$$

Reproduce the responsibility normalisation before substituting it:

$$
\sum_{k=1}^{M}r_{kn}
=
1
$$

Substitution gives:

$$
\sum_{n=1}^{N}
\sum_{k=1}^{M}r_{kn}
=
\sum_{n=1}^{N}1
=
N
$$

Therefore equation (93) can be written more simply as:

$$
\boxed{
\pi_j
=
\frac{N_j}{N}
}
$$

Every observation contributes one total unit of responsibility, distributed
across the components. The new mixing weight is the fraction of that total soft
mass claimed by component $j$.

</details>

<details open>
<summary><strong>Why This Stationary Point Is The Maximum</strong></summary>

Setting a derivative to zero only finds a stationary point. We should still
check that it is a maximum.

The objective is:

$$
\mathcal{F}_{\pi}
=
\sum_{j=1}^{M}N_j\ln\pi_j
$$

Its second derivative with respect to $\pi_j$ is:

$$
\frac{\partial^2\mathcal{F}_{\pi}}{\partial\pi_j^2}
=
-\frac{N_j}{\pi_j^2}
$$

When $N_j>0$ and $\pi_j>0$:

$$
-\frac{N_j}{\pi_j^2}
<
0
$$

Thus each log term is concave, and their sum is concave on the probability
simplex. The stationary point is therefore the global maximum of this M-step
objective.

If $N_j=0$, the interior derivative argument does not apply to that component.
The boundary solution obtained by continuity is:

$$
\pi_j=0
$$

unless some additional prior on $\boldsymbol{\pi}$ prevents a zero weight. The
paper's modified model deliberately treats $\boldsymbol{\pi}$ as parameters and
does not place that additional prior on them.

</details>

<details open>
<summary><strong>A Small Numeric Example For Equation (93)</strong></summary>

Suppose there are three observations and three components, with responsibility
table:

| Observation | $r_{1n}$ | $r_{2n}$ | $r_{3n}$ | Row total |
|---|---:|---:|---:|---:|
| $n=1$ | $0.8$ | $0.2$ | $0.0$ | $1.0$ |
| $n=2$ | $0.6$ | $0.3$ | $0.1$ | $1.0$ |
| $n=3$ | $0.1$ | $0.2$ | $0.7$ | $1.0$ |

First calculate the effective count using:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

For component 1, reproduce the formula:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Substitute its three responsibilities:

$$
N_1
=
0.8+0.6+0.1
=
1.5
$$

For component 2, reproduce the formula:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Substitute:

$$
N_2
=
0.2+0.3+0.2
=
0.7
$$

For component 3, reproduce the formula:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

Substitute:

$$
N_3
=
0.0+0.1+0.7
=
0.8
$$

Check the total soft count:

$$
N_1+N_2+N_3
=
1.5+0.7+0.8
=
3
=
N
$$

Now reproduce the simplified mixing-weight update:

$$
\pi_j
=
\frac{N_j}{N}
$$

Substitute $N_1=1.5$ and $N=3$:

$$
\pi_1
=
\frac{1.5}{3}
=
0.5
$$

Reproduce the update before calculating component 2:

$$
\pi_j
=
\frac{N_j}{N}
$$

Substitute $N_2=0.7$ and $N=3$:

$$
\pi_2
=
\frac{0.7}{3}
\approx
0.233
$$

Reproduce the update before calculating component 3:

$$
\pi_j
=
\frac{N_j}{N}
$$

Substitute $N_3=0.8$ and $N=3$:

$$
\pi_3
=
\frac{0.8}{3}
\approx
0.267
$$

Check normalisation:

$$
0.500+0.233+0.267
=
1.000
$$

The first component receives half of the dataset's total responsibility mass,
so its updated mixing weight is one half. No hard cluster assignments were
needed.

</details>

<details open>
<summary><strong>How Equation (93) Creates Component Competition</strong></summary>

Equation (88) includes the mixing weight as a multiplicative factor:

$$
\widetilde r_{jn}
=
\pi_j
\exp
\left\{
\text{expected fit terms}
\right\}
$$

Equation (87) then normalises those scores:

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle\sum_{k=1}^{M}\widetilde r_{kn}
}
$$

Equation (93) feeds the resulting responsibilities back into the next mixing
weight:

$$
\pi_j
=
\frac{1}{N}
\sum_{n=1}^{N}r_{jn}
$$

The feedback loop is therefore:

$$
\boxed{
\text{small }\pi_j
\longrightarrow
\text{smaller responsibility scores}
\longrightarrow
\text{smaller }N_j
\longrightarrow
\text{smaller next }\pi_j
}
$$

This is how redundant components can lose the competition. The prior over
component means and precisions prevents a poorly supported component from
gaining an unrealistically sharp fit for free, while equation (93) reduces the
weight of components that receive little responsibility.

The reverse feedback also holds: a component that explains a genuine region of
the data receives responsibility, which preserves its mixing weight.

“Eliminated” usually means that $\pi_j$ becomes zero in the mathematical limit
or smaller than a practical activity threshold in code. It does not mean the
algorithm literally deletes an array entry during every update.

</details>

<details open>
<summary><strong>How Equation (93) Maps To The Code</strong></summary>

The implementation first computes:

$$
N_j
=
\sum_{n=1}^{N}r_{jn}
$$

as:

    effective_counts = responsibilities.sum(axis=0)

It then implements the central equation:

$$
\pi_j
=
\frac{N_j}{N}
$$

as:

    mixing_weights = effective_counts / n_observations

The actual code also applies a tiny positive numerical floor and renormalises:

    mixing_weights = np.maximum(effective_counts / n_observations, jitter)
    mixing_weights = mixing_weights / mixing_weights.sum()

The floor is a numerical safeguard, not part of the paper's mathematical
equation (93). It avoids taking:

$$
\ln 0
$$

in the next responsibility calculation.

</details>

<details open>
<summary><strong>The Complete Equations (87)-(93) Update Cycle</strong></summary>

One outer variational-EM iteration now has a complete story.

**1. Score every observation-component pairing**

Use the corrected centred form of equation (88):

$$
\begin{aligned}
\widetilde r_{jn}
&=
\pi_j
\exp
\Bigg\{
\frac{1}{2}\langle\ln|T_j|\rangle
\\
&\quad-
\frac{1}{2}
\Big[
(x_n-\boldsymbol{m}_j)^T
\langle T_j\rangle
(x_n-\boldsymbol{m}_j)
+
\operatorname{tr}
\left(
\langle T_j\rangle S_j^{-1}
\right)
\Big]
\Bigg\}
\end{aligned}
$$

**2. Normalise the scores across components**

Use the corrected equation (87):

$$
r_{jn}
=
\frac{
\widetilde r_{jn}
}{
\displaystyle\sum_{k=1}^{M}\widetilde r_{kn}
}
$$

**3. Update the Gaussian belief about each component mean**

$$
S_j
=
\beta I
+
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}
$$

and:

$$
\boldsymbol{m}_j
=
S_j^{-1}
\langle T_j\rangle
\sum_{n=1}^{N}r_{jn}x_n
$$

**4. Update the Wishart belief about each component precision**

$$
\eta_j
=
\nu+\sum_{n=1}^{N}r_{jn}
$$

and, using the corrected centred form:

$$
U_j
=
V
+
\sum_{n=1}^{N}
r_{jn}
\left[
(x_n-\boldsymbol{m}_j)
(x_n-\boldsymbol{m}_j)^T
+
S_j^{-1}
\right]
$$

**5. Update the mixing weights**

$$
\pi_j
=
\frac{1}{N}
\sum_{n=1}^{N}r_{jn}
$$

**6. Repeat**

The new means, precision beliefs, and mixing weights change the next set of
responsibility scores. The cycle continues until the chosen convergence
criterion changes only negligibly.

The distinction between the two halves is important:

- equations (87)-(92) are the variational E-step because they update $q$;
- equation (93) is the variational M-step because it updates the parameter
  $\boldsymbol{\pi}$ while $q$ is fixed.

</details>

<details open>
<summary><strong>Final Takeaway</strong></summary>

The entire block can be understood as an exchange of **soft evidence**:

$$
\text{component beliefs}
\longrightarrow
\text{soft assignments}
\longrightarrow
\text{updated component beliefs and proportions}
$$

The update for $\boldsymbol{\pi}$ is not an unexplained copy of the ordinary EM
formula. It follows from:

1. isolating the only ELBO term that contains $\boldsymbol{\pi}$;
2. replacing hidden indicators by their expectations $r_{jn}$;
3. maximising the resulting weighted log objective under
   $\sum_j\pi_j=1$;
4. recognising that the total responsibility mass is exactly $N$.

The final result is:

$$
\boxed{
\pi_j
=
\frac{1}{N}
\sum_{n=1}^{N}r_{jn}
}
$$

So a component's model weight is simply the fraction of the dataset it explains
in soft-assignment terms.

</details>
