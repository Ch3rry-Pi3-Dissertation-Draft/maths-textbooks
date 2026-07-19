# Note Style Guide

This guide describes the house style for the explanatory Markdown notes in
this folder.

The notes are not intended to be compressed reference sheets. They are
beginner-friendly mathematical walkthroughs that unpack notation, explain why
each idea matters, and show the intermediate reasoning that textbooks often
leave implicit.

---

## 1. Overall Structure

Start every note with one level-one title:

```markdown
# Topic Or Chapter Title
```

Follow the title with a short introduction that answers:

- what source material the note covers
- what the reader is expected to learn
- how the topic connects to what came before or what comes next

Divide a long note into thematic blocks:

```markdown
## Block 1: The First Main Idea
```

Use a horizontal rule between major blocks:

```markdown
---
```

The blocks should follow the logic of the subject. They do not need to copy the
source's page boundaries exactly.

---

## 2. Collapsible Sections

Put each teaching unit inside an open details element:

```html
<details open>
<summary><strong>The Goal Of This Block</strong></summary>

Content goes here.

</details>
```

Use short, descriptive summary titles such as:

- `The Goal Of This Block`
- `The Big Picture`
- `Notation Before We Start`
- `A Small Numeric Example`
- `Why This Matters`
- `A Common Mistake`
- `Block 1 Summary`

Keep the details elements open by default so the note reads naturally from top
to bottom while still allowing sections to be collapsed in a Markdown viewer.

---

## 3. Teaching Order

Within a block, prefer this sequence:

1. State the goal.
2. Give the big-picture intuition.
3. Define every new symbol.
4. Present the mathematical statement.
5. Work through a small example.
6. Interpret the result in words.
7. Point out a common mistake or subtlety.
8. End with a short block summary.

Do not introduce a dense equation before preparing the notation needed to read
it.

When a derivation is important, show one logical operation per line. Do not
jump from the original formula directly to the final result.

---

## 4. Mathematical Formatting

Use dollar-delimited LaTeX for inline mathematics:

```markdown
The unknown function is $y(x)$.
```

Use display mathematics for equations that need attention:

```markdown
$$
y''+4y=0
$$
```

Use aligned equations when several steps belong together:

```markdown
$$
\begin{aligned}
y'  &= 2c_1\cos(2x)-2c_2\sin(2x), \\
y'' &= -4c_1\sin(2x)-4c_2\cos(2x).
\end{aligned}
$$
```

Define symbols immediately after they appear. For example:

- $x$ is the independent variable
- $y(x)$ is the unknown function
- $c_1$ and $c_2$ are arbitrary constants

Always distinguish carefully between:

- a function and its value
- a derivative and a power
- a variable and an index
- a formula and the interval on which that formula is valid
- an equation and a problem containing extra conditions

Do not trust OCR output for mathematical expressions. Check equations visually
against the source before using them.

---

## 5. Plain-English Restatements

After an abstract or symbol-heavy explanation, add a plain-language
restatement. Vary the label so repeated sections do not sound mechanical.

Suitable labels include:

- `In everyday terms:`
- `The key intuition:`
- `Another way to see it:`
- `What this tells us:`
- `The practical meaning:`
- `A useful interpretation:`
- `What to remember:`

`Plain English:` may still be used occasionally, but it should not introduce
every restatement in a long note.

For example:

```markdown
Plain English:

> a proposed solution must make the differential equation true everywhere on
> the interval being considered.
```

Use blockquotes for the central question, intuition, or takeaway. A blockquote
should clarify the mathematics rather than merely repeat the preceding
sentence.

Useful prompts include:

```markdown
> what is the unknown object in this equation?
```

and:

```markdown
> does this formula satisfy both the equation and the extra conditions?
```

### Footnotes For Optional Clarification

Use a footnote when a short piece of additional intuition or clarification
would help some readers but would interrupt the flow of the main explanation.
The main text must remain complete and understandable without opening or
reading the footnote.

Good uses include:

- a brief geometric reason behind a familiar theorem
- a short reminder of an earlier calculus or algebra fact
- a notation detail that prevents a likely misunderstanding
- a secondary interpretation that is helpful but not required for the current
  derivation

Do not use a footnote to hide:

- a required algebraic step
- the definition of a new symbol
- an assumption needed for the result
- the justification for moving from one displayed equation to the next

If the reader cannot follow the argument without the information, place it in
the main body instead. Keep each footnote focused on one point and usually no
longer than two or three sentences. Prefer compact inline mathematics over
large displayed equations so the note remains readable at footnote size.

In the print edition, use hanging footnotes: place the footnote number to the
left and align every wrapped line with the beginning of the footnote text.
This avoids giving only the first line an additional indent. Check the
rendered page whenever a footnote contains mathematics.

Use standard Markdown footnote syntax:

```markdown
By the Fundamental Theorem of Calculus,[^moving-limit] we have
$A'(x)=p(x)$.

[^moving-limit]: If the upper limit moves from $x$ to $x+h$, the added area is
    approximately $p(x)h$. Dividing by $h$ and taking $h\to0$ gives
    $A'(x)=p(x)$.
```

---

## 6. Worked Examples

Use small examples frequently. Each worked example should contain four parts:

1. Write the problem clearly.
2. State the test, definition, or formula being used.
3. Substitute and simplify step by step.
4. Interpret the result.

When determining constants from conditions, reproduce the general formula
before substituting values.

For example:

$$
y(x)=c_1\sin x+c_2\cos x
$$

Then apply one condition at a time and explain what each condition tells us
about $c_1$ or $c_2$.

Do not give only arithmetic. Explain the mathematical reason the calculation
answers the question.

### The Local Continuity Rule

A learner should be able to explain every displayed equation using the
sentence and equation immediately before it. They should not need to scroll to
an earlier example, recover an unstated formula, or guess which operation was
performed.

For every transition, make these points local:

1. state the formula or relationship being used
2. substitute the current expressions or values
3. name the operation being performed
4. display the result
5. explain what the result permits us to conclude

Repeating a short formula is preferable to making the reader search for it.
This is especially important after a page break, at the start of a practice
answer, and when returning to a calculation after explanatory prose.

Use the **one-line-back test**:

> can the reader justify this equation from the immediately preceding line or
> sentence?

If the answer is no, add the missing formula, substitution, or operation.

### Before And After: Recovering A Potential

The following version skips the connection between the differential and the
solution:

```markdown
Therefore:

$$
d\Phi=(y^2+\cos x)\,dx+2xy\,dy
$$

The equation is exact, so its solution is:

$$
xy^2+\sin x=C
$$
```

The final equation appears without showing why the differential equation
implies that result. Use the complete chain instead:

```markdown
Recall:

$$
d\Phi=\Phi_x\,dx+\Phi_y\,dy
$$

Substitute the calculated partial derivatives:

$$
\begin{aligned}
d\Phi
&=\Phi_x\,dx+\Phi_y\,dy \\
&=(y^2+\cos x)\,dx+2xy\,dy.
\end{aligned}
$$

This is the left side of the differential equation, so the equation is:

$$
d\Phi=0
$$

Integrating gives:

$$
\Phi(x,y)=C
$$

Substitute $\Phi(x,y)=xy^2+\sin x$:

$$
xy^2+\sin x=C
$$
```

### Before And After: Converting Slope Form

Do not jump directly from:

$$
(2x+y)+(x+e^y)y'=0
$$

to differential form. Show what happens to the derivative notation:

```markdown
Replace $y'$ by $dy/dx$:

$$
(2x+y)+(x+e^y)\frac{dy}{dx}=0
$$

Multiply every term by $dx$:

$$
(2x+y)\,dx+(x+e^y)\,dy=0
$$
```

### Before And After: Substituting Into A Test

Avoid presenting a test result without showing its inputs:

```markdown
$$
\frac{M_y-N_x}{N}=\frac{3}{1+x}
$$
```

When the values are $M_y=3/(1+x)$, $N_x=0$, and $N=1$, write:

```markdown
$$
\begin{aligned}
\frac{M_y-N_x}{N}
&=\frac{\frac{3}{1+x}-0}{1} \\
&=\frac{3}{1+x}.
\end{aligned}
$$
```

The same rule applies to initial conditions, coefficient comparisons,
partial-fraction constants, matrix substitutions, and unit calculations.

### Before And After: Finding Partial-Fraction Constants

Do not compress the coefficient calculation into a sentence such as:

```markdown
Setting $y=-1$ gives $A=1/4$, and setting $y=3$ gives $B=1/4$.
```

Keep the identity visible and show what vanishes at each substituted value:

```markdown
Start from:

$$
1=A(3-y)+B(y+1)
$$

Set $y=-1$. The term containing $B$ vanishes:

$$
1=A(4),
\qquad
A=\frac14
$$

Set $y=3$. The term containing $A$ vanishes:

$$
1=B(4),
\qquad
B=\frac14
$$
```

When multiplying an equation changes an arbitrary constant, say so. For
example, after multiplying by $4$, write that $C_1=4C$ is still arbitrary
before renaming it as $C$. This prevents a new-looking constant from appearing
without explanation.

### Keep Practice Answers Self-Contained

Avoid instructions such as:

```markdown
From Answer 3, the solution family is ...
```

That wording forces the learner to leave the current answer. Restate the
needed potential or formula and verify it locally:

```markdown
Use:

$$
\Phi(x,y)=xy+y^2+e^x
$$

Check:

$$
\Phi_x=y+e^x=M,
\qquad
\Phi_y=x+2y=N
$$

Therefore the equation is $d\Phi=0$, so integrating gives $\Phi=C$.
```

A practice answer may be shorter than the main worked example, but it must not
depend on hidden work.

### Show The Source Of A Derivative

An isolated line such as $M_y=2x$ may become unclear after a page break. Carry
the coefficient into the calculation:

```markdown
$$
\begin{aligned}
M_y
&=\frac{\partial}{\partial y}(2xy+\cos x) \\
&=2x.
\end{aligned}
$$
```

This small repetition makes the calculation independently checkable.

### Print Continuity

The reading copy and print copy require separate checks. In the PDF:

- keep an equation with the sentence that introduces it
- keep a step or answer heading with enough of its opening calculation
- avoid beginning a page with continuation words such as `and`, `therefore`,
  or `thus` when the premise is on the previous page
- avoid placing `The solution is:` at the foot of one page and the solution on
  the next
- visually inspect every changed derivation after rebuilding the PDF

Page layout is part of mathematical clarity. A derivation that is complete in
Markdown can still become confusing when an explanation and its equation are
separated during typesetting.

### Appropriate Compression

Step-by-step does not mean explaining every piece of arithmetic in prose.
Standard derivatives and simple simplifications may share one aligned block
when the operation remains visible. Compress repeated mechanical work only
after the full method has been demonstrated, and never compress the step that
introduces a new idea, changes representation, applies a condition, chooses a
branch, or justifies the final solution.

---

## 7. Tone And Level

Write for a reader who is intelligent but may be meeting the topic for the
first time.

The tone should be:

- direct
- patient
- mathematically precise
- explicit about hidden steps
- willing to repeat an important distinction in a new way

Avoid unexplained jargon. When technical vocabulary is necessary, define it
before relying on it.

Do not assume that a familiar symbol is self-explanatory. For example, say why
$y'$ is a derivative and why $y^{(4)}$ is not the fourth power of $y$.

---

## 8. Relationship To Source Material

Treat source material as a **topic map**, not as a manuscript template.

The source may help identify:

- the mathematical concepts that belong in the chapter
- prerequisite ideas the reader will need
- standard notation used across the subject
- common categories of problem worth teaching

The source must not determine:

- the chapter's teaching sequence
- the selection and order of examples
- numerical coefficients or initial values
- exercise wording or answer choices
- diagrams, tables, captions, or distinctive analogies
- the sequence of algebraic steps in a worked solution

Write the explanation from the underlying mathematics. Do not paraphrase the
source sentence by sentence.

### Build Examples Independently

Every worked example and exercise must be created independently.

Changing only a variable name is not enough. For example, replacing $x$ with
$t$ while keeping the same equation, constants, conditions, and solution path
does not create a meaningfully new example.

An independent example should make fresh choices about several of the
following:

- unknown function and independent variable
- equation family
- coefficients
- forcing term
- initial or boundary locations
- prescribed values
- interval or domain issue
- question being asked
- order of the solution steps
- interpretation of the result

Use standard mathematical facts freely, but demonstrate them with an example
set designed for this note.

### Design The Chapter Independently

Before drafting, write a concept-only inventory without copying the source's
headings.

Then choose a teaching progression based on the reader's needs. Possible
organising ideas include:

- intuition before notation
- one running model developed across several sections
- common mistakes followed by corrective examples
- a problem-solving workflow
- visual or computational experiments

The final structure should be defensible from the learning goals, not merely
because the source used the same order.

### Quotations And Source-Specific Material

Do not quote source prose unless a quotation is genuinely necessary. When a
quotation is necessary, keep it brief, mark it as a quotation, and cite it.

Do not reproduce a source's exercise collection, even with light wording
changes. Create a new practice set and solve it independently.

When the source has a printing error, ambiguous notation, or damaged OCR, use
the mathematically correct idea without reproducing the damaged text.

### Source-Independence Audit

Before considering a chapter complete, compare it with every source used and
check that:

- no definition closely follows the source's sentence structure
- no distinctive equation is reused with the same parameters
- no worked example preserves the source's data and solution sequence
- no exercise is a lightly edited version of a source exercise
- the chapter outline is independently organised
- all explanatory metaphors and plain-English interpretations are original
- any unavoidable quotation is clearly marked and cited

If several small overlaps combine to recreate the source's progression,
rewrite the section even when each individual equation is standard.

---

## 9. Images And Graphs

Use an image or graph only when it makes a mathematical relationship easier to
understand.

Store reusable images in the repository's `assets/` directory and use a
descriptive alt label:

```markdown
![Direction field for a first-order differential equation](assets/example.png)
```

Explain what the reader should notice in the image. Do not insert a figure
without discussing its mathematical role.

---

## 10. Standard Note Template

```markdown
# Note Title

Short introduction and scope.

---

## Block 1: First Main Idea

<details open>
<summary><strong>The Goal Of This Block</strong></summary>

State the purpose of the block.

Plain English:

> one-sentence takeaway.

</details>

<details open>
<summary><strong>Notation Before We Start</strong></summary>

Define every symbol.

</details>

<details open>
<summary><strong>A Worked Example</strong></summary>

Show the mathematics step by step and interpret the result.

</details>

<details open>
<summary><strong>Block 1 Summary</strong></summary>

Collect the main facts.

</details>
```

---

## 11. Final Checklist

Before considering a note complete, check that:

- the title and scope are clear
- the material is divided into logical blocks
- each new symbol is defined
- important equations are written in valid LaTeX
- derivations include the intermediate steps
- examples explain why the method works
- every displayed equation passes the one-line-back test
- formulas are restated when a section or page break would hide their inputs
- substitutions show the values inserted before simplification
- rescaled or renamed arbitrary constants are explained when they first change
- practice answers are locally self-contained
- final solutions show the chain from the reconstructed expression to the
  equation being solved
- important ideas receive a plain-English restatement
- footnotes add optional intuition or clarification without hiding reasoning
  required to follow the main text
- domains and conditions are not omitted
- common mistakes are identified where useful
- the final summary can stand alone as a revision aid
- the note is an original explanation rather than a transcription
- equations, parameters, worked examples, and exercises were independently
  created
- the chapter structure does not mirror a source's structure
- a source-independence audit was completed
- all details elements and LaTeX environments are properly closed
- the rebuilt PDF has no orphaned equation introductions, answer headings, or
  unexplained continuation words at the tops of pages
