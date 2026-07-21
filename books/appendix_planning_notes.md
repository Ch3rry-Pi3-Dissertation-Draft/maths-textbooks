# Appendix Planning Notes

This document records possible appendices for the differential-equations
textbook. It is an editorial planning note rather than a finished appendix
outline.

The appendices should provide **just-in-time mathematical refreshers and
reference material**. They should help a learner recover prerequisite skills
without turning into a second textbook running alongside the main chapters.

The main questions for every proposed appendix are:

- does the reader need this material repeatedly in the main book?
- is it mainly prerequisite knowledge or quick-reference material?
- can it be explained adequately without a long conceptual development?
- would placing it in an appendix improve the flow of the main chapters?
- is the topic substantial enough that it should instead receive a full
  chapter?

---

## A Consistent Appendix Format

Each appendix could use the same learner-friendly internal structure:

1. a short explanation of why the material is useful
2. a notation and terminology guide
3. one or more formula tables
4. two or three worked examples with explicit intermediate steps
5. a common-mistakes section
6. a small self-check section with answers
7. internal pointers to the chapters in which the material is used

The main body of the textbook should remain understandable without forcing the
reader to interrupt every derivation and consult an appendix. Required steps,
definitions, and assumptions must remain in the main chapters. The appendices
should provide additional support, reminders, and lookup material.

Formula tables should not be presented without enough surrounding explanation
to interpret their notation and conditions. Similarly, worked examples should
show why a formula applies rather than merely demonstrate arithmetic.

---

## Candidate Appendix A: Algebra And Functions

This appendix would support almost every part of the book.

Possible topics include:

- rearranging equations
- exponent laws
- logarithm laws
- solving linear equations
- solving simultaneous equations
- factoring polynomials
- completing the square
- the quadratic formula
- polynomial division
- partial-fraction decomposition
- absolute values and intervals
- domains and ranges of functions
- inverse functions
- common trigonometric identities
- common hyperbolic identities
- recognising basic function shapes

Partial fractions deserve particularly careful treatment because they are used
repeatedly in inverse Laplace transforms. The appendix should distinguish the
main denominator cases and show how the numerator form is selected before the
constants are calculated.

### Possible Worked Examples

- factor a characteristic polynomial and identify all roots
- complete the square in a quadratic denominator
- decompose a rational function into partial fractions

### Common Mistakes To Address

- cancelling terms across addition
- applying logarithm laws incorrectly
- forgetting repeated factors in a partial-fraction decomposition
- losing roots after dividing by an expression that might be zero

---

## Candidate Appendix B: Differentiation

This appendix would provide a compact calculus refresher for readers who need
support before working with differential equations.

Possible topics include:

- the meaning of a derivative
- derivative notation
- derivatives of powers
- exponential and logarithmic derivatives
- trigonometric and hyperbolic derivatives
- the product rule
- the quotient rule
- the chain rule
- implicit differentiation
- higher derivatives
- derivatives with respect to time
- partial derivatives
- mixed partial derivatives
- directional and normal derivatives

The notation section should compare:

$$
y',
\qquad
y'',
\qquad
\dot y,
\qquad
\ddot y,
\qquad
u_x,
\qquad
u_{xy}.
$$

### Possible Worked Examples

- differentiate a product containing an exponential and a polynomial
- apply the chain rule to a nested trigonometric expression
- calculate first and mixed partial derivatives of a two-variable function

### Common Mistakes To Address

- differentiating a product term by term without the product rule
- applying the chain rule to only part of a composite function
- confusing a second derivative with the square of a first derivative
- treating the other independent variables incorrectly during partial
  differentiation

---

## Candidate Appendix C: Integration

This appendix would support separable equations, integrating factors,
variation of parameters, Laplace transforms, energy identities, and PDE work.

Possible topics include:

- antiderivatives
- definite and indefinite integrals
- constants of integration
- the Fundamental Theorem of Calculus
- substitution
- integration by parts
- integration using partial fractions
- trigonometric integrals
- exponential and logarithmic integrals
- improper integrals
- differentiating an integral with a variable limit
- double integrals and basic changes of variables

### Possible Worked Examples

- use substitution in a separable-equation integral
- use integration by parts on a polynomial times an exponential
- integrate a rational function after partial-fraction decomposition

### Common Mistakes To Address

- adding a separate arbitrary constant to both sides of an equation
- forgetting to transform the differential during substitution
- choosing incompatible parts in integration by parts
- ignoring convergence when evaluating an improper integral

---

## Candidate Appendix D: Complex Numbers

Complex numbers support characteristic equations, oscillatory solutions,
matrix methods, Fourier methods, and some transform calculations.

Possible topics include:

- the definition $i^2=-1$
- real and imaginary parts
- complex conjugates
- arithmetic with complex numbers
- division using the conjugate
- modulus and argument
- rectangular form
- polar form
- Euler's formula
- complex exponentials
- powers and roots of complex numbers
- conjugate root pairs
- converting complex exponentials into real sine-cosine solutions

### Possible Worked Examples

- convert a complex number between rectangular and polar form
- solve a quadratic equation with complex roots
- derive the real sine-cosine family from a conjugate exponential pair

### Common Mistakes To Address

- assuming $\sqrt{-a}=-\sqrt a$
- forgetting that real-coefficient polynomials have conjugate nonreal roots
- confusing the argument with the modulus
- omitting one member of the real sine-cosine solution pair

---

## Candidate Appendix E: Linear Algebra Essentials

The main chapters already teach matrices and systems. This appendix would be a
compact reference rather than a second linear-algebra course.

Possible topics include:

- vectors and matrices
- dimensions of a matrix
- matrix addition and scalar multiplication
- matrix multiplication
- identity matrices
- determinants
- inverses
- row reduction
- solving simultaneous linear equations
- linear combinations
- linear independence
- span and basis
- eigenvalues and eigenvectors
- characteristic polynomials
- diagonalisation
- repeated eigenvalues
- a summary of the matrix exponential

### Possible Worked Examples

- multiply two small matrices and check their dimensions
- solve a two-by-two linear system
- calculate eigenvalues and eigenvectors of a two-by-two matrix

### Common Mistakes To Address

- multiplying matrices entry by entry
- reversing the order of matrix multiplication
- assuming every square matrix is invertible
- treating repeated eigenvalues as though they automatically provide enough
  independent eigenvectors

---

## Candidate Appendix F: Multivariable And Vector Calculus

This appendix would directly support the PDE chapters and should be considered
one of the higher-priority additions.

Possible topics include:

- functions of several variables
- partial derivatives
- mixed derivatives
- the gradient
- directional derivatives
- divergence
- the Laplacian
- vector fields
- outward unit normals
- normal derivatives
- double integrals
- polar coordinates
- area elements
- line integrals
- the divergence theorem
- Green's first identity
- radial derivatives and the radial Laplacian

### Possible Worked Examples

- calculate the gradient and Laplacian of a two-variable function
- determine outward normals on every edge of a rectangle
- convert a disk integral into polar coordinates

### Common Mistakes To Address

- confusing the gradient with the Laplacian
- using an inward normal when the condition requires the outward normal
- forgetting the polar area factor $r$
- treating a partial derivative as though every variable changes

---

## Candidate Appendix G: Laplace Transform Reference

Laplace transforms are appropriate appendix material, but the appendix should
complement rather than repeat the main Laplace-transform chapters.

It should primarily act as a lookup and method-selection reference.

Possible topics include:

- the definition of the Laplace transform
- common transform pairs
- linearity
- transforms of derivatives
- multiplication by powers of $t$
- exponential translation
- unit-step translation
- convolution
- common inverse-transform patterns
- repeated linear factors
- irreducible quadratic factors
- partial-fraction reminders
- initial-value and final-value checks where appropriate

### Useful Tables

- elementary transform pairs
- derivative-transform formulas
- translation and unit-step formulas
- common convolution forms
- inverse-transform denominator patterns

### Possible Worked Examples

- read a direct transform from the table
- rearrange an expression before using an inverse-transform entry
- combine partial fractions with the transform table

### Common Mistakes To Address

- using the translation rules in the wrong direction
- failing to complete the square
- overlooking initial-condition terms in transformed derivatives
- selecting a table entry before putting the expression into the required form

---

## Candidate Appendix H: Series And Special-Function Reference

This appendix would support the power-series, Frobenius, orthogonal-polynomial,
gamma-function, and Bessel-function chapters.

Possible topics include:

- sigma notation
- shifting a summation index
- changing lower bounds consistently
- common geometric, exponential, sine, and cosine series
- Taylor and Maclaurin series
- radius and interval of convergence
- factorial and gamma-function notation
- Frobenius-series notation
- common gamma-function identities
- selected Bessel-function identities
- frequently used recurrence relations

### Possible Worked Examples

- shift two series to a common power of $x$
- build the first terms of a Taylor series
- simplify a gamma-function expression using its recurrence relation

### Common Mistakes To Address

- changing an index without changing the summand and limits together
- combining unlike powers of $x$
- treating the radius and interval of convergence as the same statement
- forgetting the lowest-power equation in a recurrence calculation

---

## Candidate Appendix I: Formula And Method Guide

This could be the final quick-reference appendix. Its purpose would be to help
the reader answer:

> what kind of problem is this, and where should I begin?

Possible contents include:

- a first-order ODE classification table
- a second-order characteristic-root ledger
- an undetermined-coefficients trial table
- a variation-of-parameters checklist
- a Laplace-transform workflow
- a matrix-system workflow
- a numerical-method comparison table
- a power-series workflow
- a Frobenius workflow
- a PDE classification discriminant
- boundary-condition definitions
- an elliptic-problem workflow
- a difference-equation characteristic-root ledger
- a notation and symbol index

This appendix should remain concise. It should direct the reader toward the
correct method without replacing the explanations and derivations in the main
chapters.

---

## Recommended Core Set For A First Edition

The recommended first-edition appendices are:

1. **Algebra And Functions**
2. **Differentiation**
3. **Integration**
4. **Complex Numbers**
5. **Linear Algebra Essentials**
6. **Multivariable And Vector Calculus**
7. **Laplace Transform Reference**
8. **Formula And Method Guide**

These eight appendices would support the complete book without making the
appendix section unnecessarily large.

The **Series And Special-Function Reference** could also be included in the
first edition if readers are expected to use Chapters 27--30 frequently or if
those chapters assume familiarity with summation notation and convergence.
Otherwise, it could be added later as an expanded reference.

---

## Topics That May Deserve Full Chapters Instead

Fourier series, eigenfunction expansions, and Sturm--Liouville theory are
substantial enough that they should not be hidden inside a short reference
appendix if the book intends to teach or rely heavily on them.

Meaningful coverage would require ideas such as:

- orthogonality of functions
- inner products and weighted inner products
- Fourier coefficients
- sine and cosine series
- convergence and endpoint behaviour
- boundary-value eigenproblems
- eigenvalues and eigenfunctions
- orthogonality of eigenfunctions
- expansion in an eigenfunction basis
- using expansions in separation-of-variables solutions

These topics involve more than formula lookup. They require conceptual
development, worked derivations, and repeated examples. If they are used
heavily in the main body, they should probably become dedicated chapters or a
separate advanced supplement.

---

## Possible Placement Of Additional Chapters

Before finalising the appendices, the main manuscript should be audited for
every place that assumes Fourier series, eigenfunction expansions, or
Sturm--Liouville theory.

If the dependence is light, a carefully developed advanced supplement may be
enough. If the dependence is repeated or essential to solving the PDE
problems, the preferred approach would be to add full chapters.

A provisional sequence could be:

1. **Sturm--Liouville Boundary-Value Problems** after the special-function
   material and before the main PDE sequence
2. **Fourier Series And Orthogonal Expansions** immediately after
   Sturm--Liouville theory
3. **Introduction To Partial Differential Equations** after the reader has
   the required eigenvalue and Fourier background
4. **Separation Of Variables And Eigenfunction Expansions** shortly after the
   PDE introduction and before applications that rely on series solutions
5. the PDE classification, characteristic-coordinate, and elliptic
   boundary-value material after that foundation
6. difference equations after the continuous ODE and PDE sequence, or as the
   opening chapter of a separate discrete-model section

Using the current manuscript order as a starting point, one possible revised
late-book sequence would be:

1. Chapter 30: Gamma And Bessel Functions
2. new chapter: Sturm--Liouville Boundary-Value Problems
3. new chapter: Fourier Series And Orthogonal Expansions
4. current Chapter 31: Introduction To Partial Differential Equations
5. new chapter: Separation Of Variables And Eigenfunction Expansions
6. current Chapter 32: Classification And Characteristic Coordinates
7. current Chapter 33: Harmonic Functions And Elliptic Boundary Problems
8. current Chapter 34: Difference Equations And Discrete Models

This is only a provisional editorial arrangement. Before renumbering anything,
the dependency audit should determine:

- where Fourier coefficients first appear
- where orthogonality is first assumed
- where separation of variables produces an infinite series
- where boundary-value eigenproblems are required
- whether Bessel and other special functions are used as eigenfunctions
- whether later exercises require results not yet established

The final order should ensure that every method is taught before the first
chapter that relies on it.

---

## Editorial Decisions Still To Make

The following decisions can be made after the main manuscript has received a
full continuity review:

- which appendices are essential for the first edition
- whether differentiation and integration should be separate appendices
- whether complex numbers should remain separate from linear algebra
- how much proof or derivation belongs in a reference appendix
- whether every appendix should include exercises
- whether the series reference is needed in the first edition
- whether Fourier and Sturm--Liouville material should become new chapters
- whether a separate advanced supplement would be clearer than extending the
  main chapter sequence
- how chapter numbering should change if new chapters are inserted

The guiding principle is:

> prerequisite reminders and lookup tables belong in appendices; substantial
> methods that the main text depends on belong in full chapters.
