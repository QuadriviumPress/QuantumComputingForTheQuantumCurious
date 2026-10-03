---
title: 7. Entanglement
short_title: "Ch. 7 — Entanglement"
label: ch-7
doi: 10.1007/978-3-030-61601-4_7
---

So far, we have discussed the manipulation and measurement of a single qubit. **Quantum entanglement** can arise when two or more qubits share a state that cannot be written as a product of their individual states. Entangled qubits can show correlations that no local classical model can reproduce. Quantum algorithms can use these correlations together with interference, although entanglement alone does not guarantee a speedup.

(sec-7-1)=
## 7.1 Entanglement Fundamentals

To introduce the notation, imagine two qubits whose measurement outcomes are labeled heads (H) and tails (T). Ordinary, independent fair coins yield HH, HT, TH, and TT, each with 25% probability. The qubits could instead be prepared in the Bell state $(1/\sqrt {2})(\lvert HH\rangle + \lvert TT\rangle )$, illustrated in Fig. [](#fig-7-1). Measuring both qubits in the H/T basis then yields HH or TT with 50% probability each; HT and TH never occur. Classical coins can also have correlated outcomes, so this one set of outcomes alone does not establish entanglement. The difference appears when the quantum state is tested in other measurement bases.

```{figure} ../images/ch-07/490703_1_En_7_Fig1_HTML.png
:label: fig-7-1
:alt: Two coin-shaped qubit symbols with matching H/H and T/T outcomes, representing measurements of a Bell state


Coin symbols represent two qubits measured in the H/T basis: a Bell state yields either HH or TT.
```


The qubits can be separated before measurement. If Alice measures H, she can predict that Bob will obtain H when he measures in the same basis; likewise for T. Yet Bob's local results remain random, regardless of whether or when Alice measures her qubit. They must compare their results through an ordinary communication channel to observe the correlation (Fig. [](#fig-7-2)).

```{figure} ../images/ch-07/490703_1_En_7_Fig2_HTML.png
:label: fig-7-2
:alt: Alice and Bob each hold one distant qubit; matching H/H or T/T outcomes become apparent when they compare results


Two distant qubits prepared in a Bell state yield matching results when measured in the same basis. Comparing those results requires classical communication.
```


Einstein called the apparent connection “spooky action at a distance.”[^1] Entanglement does not let Alice control Bob's result or send him a message faster than light. Its distinctive feature is the pattern of correlations across different measurement choices, examined below through Bell's theorem.

(sec-7-2)=
## 7.2 Hidden Variable Theory

It is tempting to think that there may be some classical explanation for entanglement. Did the entanglement change the fair coins by adding extra mass to the heads side or the tails side, thereby making them unfair? To provide a more realistic example in a classical system, consider a particle that decays into two lighter particles. The momenta of these three particles are related by the conservation of momentum: $\vec {p}_i = \vec {p}_{f1} + \vec {p}_{f2}$. Given a known total initial momentum, then by measuring the momentum of one of the final state particles, we can determine the momentum of the other final state particle. In summary, by measuring one particle’s momentum, we know the other. Momentum is the hidden classical variable that is encoded when the two particles are created. This is shown in Fig. [](#fig-7-3). Naturally, the question arises: is there a conceptually similar hidden variable in the quantum mechanical situation?

```{figure} ../images/ch-07/490703_1_En_7_Fig3_HTML.png
:label: fig-7-3
:alt: When a particle decays into two smaller particles, the decay products are “classically entangled” according to the conservation of momentum


When a particle decays into two smaller particles, the decay products are “classically entangled” according to the conservation of momentum.
```


Bell's theorem shows that certain quantum correlations violate bounds obeyed by *local hidden-variable* models.[^2] Experiments have observed these violations under increasingly stringent conditions.[^3] Bell's theorem does not rule out every possible hidden-variable theory; it rules out the local models subject to its assumptions.

(sec-7-3)=
## 7.3 Multi-Qubit States

Given multiple qubits, the total state of the system can be written together in a single ket. For example, if coin #1 is heads and coin #2 is tails, the two-coin state is expressed as $\lvert HT\rangle$. In general, a system of two qubits can be in a superposition of four classical states, and written as

```{math}

\lvert\psi\rangle = \alpha_{00}\lvert00\rangle + \alpha_{01}\lvert01\rangle + \alpha_{10}\lvert10\rangle + \alpha_{11}\lvert11\rangle.
```

As we saw for single-qubit states, the coefficients $\alpha_{ij}$ are amplitudes and are generally complex numbers. Measuring both qubits in this basis yields state $\lvert ij\rangle$ with probability $|\alpha_{ij}|^2$. This is shown in Fig. [](#fig-7-4).

```{figure} ../images/ch-07/490703_1_En_7_Fig4_HTML.png
:label: fig-7-4
:alt: Four possible two-qubit outcomes 00, 01, 10, and 11; the diagram labels their probabilities α², a shorthand valid only for real amplitudes


A two-qubit measurement yields one of four basis states, with probability $|\alpha_{ij}|^2$ for state $\lvert ij\rangle$. The diagram's $\alpha_{ij}^2$ labels apply only when the amplitudes are real.
```


### 7.3.1 Example

A system of two qubits is in a superposition state given by $\lvert \psi \rangle = \frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{2}\lvert 10\rangle -\frac {1}{2}\lvert 11\rangle$.

- (a) What is the probability of measuring both qubits as 1? $\text{Prob}\left (\lvert 11\rangle \right )=\left (-\frac {1}{2}\right )^2=\frac {1}{4}$.
- (b) If we only measure the first qubit and get a value of 1, what is the new state of the system?

  Since |00〉 is the only basis state of $\lvert \psi \rangle$ that doesn’t have a 1 in the first qubit, we eliminate the state |00〉 from the possibilities. This results in $\lvert \psi '\rangle =\frac {1}{2}\lvert 10\rangle -\frac {1}{2}\lvert 11\rangle$.

  Finally, we re-normalize the state so that the probabilities add up to 1. Therefore, the new state is $\lvert \psi '\rangle = \frac {1}{\sqrt {2}}\lvert 10\rangle -\frac {1}{\sqrt {2}}\lvert 11\rangle$.

(sec-7-4)=
## 7.4 Non-Entangled Systems

It is possible to have a system of particles that are not entangled with each other. In this case, changing one particle will not cause any change in the other particle. For example, in a classical system, flipping two coins and measuring one coin as heads does not tell you any information about whether or not the other coin will land on heads or tails. These events are said to be independent. If you wanted to calculate the probability of |*HT*〉, you would simply multiply the probability of getting H on coin #1 by the probability of getting T on coin #2. This is given by

```{math}

\text{Prob}\left(\lvert HT\rangle\right) = \left(\frac{1}{2}\right)\left(\frac{1}{2}\right) = \frac{1}{4}.
```

Non-entangled states are also called product states or separable states because they can be factored into a product of single-qubit states.[^4] The two single-qubit probabilities multiply to produce the two-qubit probabilities.

### 7.4.1 Example

One qubit is in an $\alpha_0|0\rangle + \alpha_1|1\rangle$ state, while another is in a $\beta_0|0\rangle + \beta_1|1\rangle$ state. What is the state of the non-interacting two-qubit system?

```{math}

\left(\alpha_0\lvert0\rangle + \alpha_1\lvert1\rangle\right)\left(\beta_0\lvert0\rangle + \beta_1\lvert1\rangle\right) = \alpha_0\beta_0\lvert00\rangle+\alpha_0\beta_1\lvert01\rangle+\alpha_1\beta_0\lvert10\rangle+\alpha_1\beta_1\lvert11\rangle.
```

(sec-7-5)=
## 7.5 Entangled Systems

An interaction *can* entangle qubits, but it need not do so. For the pure states used in this chapter, a multi-qubit state is entangled when it cannot be factored into single-qubit states. One useful test for these pure states is to ask whether measuring one qubit changes the conditional probability distribution for the other. If it does, the state is entangled. If it does not in the chosen basis, the state could still be entangled: relative phases may reveal correlations in another basis. For mixed states, correlations alone do not prove entanglement.[^5] Question 5(e) explores the role of relative signs.

### 7.5.1 Example

Is $\lvert \psi \rangle =\frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{\sqrt {2}}\lvert 11\rangle$ an entangled state?

Yes. Before learning the first result, either outcome for qubit #2 has probability 50%. Once we know the result for qubit #1, we can predict qubit #2's result in the same basis with certainty. This is evidence of entanglement for the specified pure state; the mathematical test below confirms that the state cannot be factored into individual qubits. Bob still sees a 50/50 distribution until he learns Alice's result.

### 7.5.2 Example

Show that $\lvert \psi \rangle =\frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{\sqrt {2}}\lvert 11\rangle$ cannot be written as a product of two single qubits.

Assume that the state can be written as the product of two states.

```{math}
:label: eq-7-1

\frac{1}{\sqrt{2}}\lvert00\rangle + \frac{1}{\sqrt{2}}\lvert11\rangle \stackrel{?}{=} \left(\alpha_0\lvert0\rangle+\alpha_1\lvert1\rangle\right)\left(\beta_0\lvert0\rangle+\beta_1\lvert1\rangle\right),
```

```{math}
:label: eq-7-2

\stackrel{?}{=}\alpha_0\beta_0\lvert00\rangle+\alpha_0\beta_1\lvert01\rangle+\alpha_1\beta_0\lvert10\rangle+\alpha_1\beta_1\lvert11\rangle.
```

Comparing the amplitudes on the left vs. the right, the $\alpha_i$’s and $\beta_j$’s must satisfy:

```{math}
:label: eq-7-3

\alpha_0\beta_0 = \frac{1}{\sqrt{2}}, \quad  \alpha_0\beta_1 = 0, \quad  \alpha_1\beta_0=0, \quad  \alpha_1\beta_1=\frac{1}{\sqrt{2}}.
```

However, this is not possible. For example, take $\alpha_0\beta_1 = 0$. This means that either $\alpha_0 = 0$ or $\beta_1 = 0$. If $\alpha_0 = 0$, then $\alpha_0\beta_0 = 0$, but $\alpha _0\beta _0 =\frac {1}{\sqrt {2}}$ in the above equation. A similar contradiction occurs with $\beta_1 = 0$. So the initial assumption must be incorrect and this entangled state cannot be written as the product of two separate states.

(sec-7-6)=
## 7.6 Entangling Particles

As there are many different ways of building a quantum computer, there are many different ways of physically entangling particles. One method called “spontaneous parametric down-conversion” shines a laser at a special nonlinear crystal. The crystal splits the incoming photon into two photons with correlated polarizations. For example, one could produce a pair of photons that always have perpendicular polarizations (see Fig. [](#fig-7-5)). Just as the engineering aspect of building a quantum computer is outside the scope of this course, so is the technological aspect of how qubits are physically entangled. We will focus more on how entanglement is represented in a quantum computer and the uses of this.

```{figure} ../images/ch-07/490703_1_En_7_Fig5_HTML.png
:label: fig-7-5
:alt: A nonlinear crystal creates two photons with entangled polarizations


A nonlinear crystal creates two photons with entangled polarizations.
```


(sec-7-7)=
## 7.7 CNOT Gate

You have already learned about the *X*, Hadamard, and *Z* gates. These act on a single qubit. There are also quantum gates that perform a logic operation on multiple qubits. One widely used two-qubit gate is the controlled NOT (CNOT) gate. CNOT can entangle suitable input states. It takes a control qubit and a target qubit as inputs and outputs two qubits. The control qubit stays the same, while the target obeys the following rule.

- If the control qubit is |0〉, then leave the target qubit alone.
- If the control qubit is |1〉, flip the target from $|0\rangle$ to $|1\rangle$, or from $|1\rangle$ to $|0\rangle$.

The truth table for the CNOT gate is shown in [](#tbl-7-1).[^6] From this one can deduce the matrix form of the CNOT gate as

:::{table} The truth table for the CNOT gate
:label: tbl-7-1
:enumerator: 7.1

| Before |        | After |        |
|--------|--------|-------|--------|
| Control bit | Target bit | Control bit | Target bit |
| \|0〉 | \|0〉 | \|0〉 | \|0〉 |
| \|0〉 | \|1〉 | \|0〉 | \|1〉 |
| \|1〉 | \|0〉 | \|1〉 | \|1〉 |
| \|1〉 | \|1〉 | \|1〉 | \|0〉 |
:::

```{math}
:label: eq-7-4

\text{CNOT} = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 1 \\ 0 & 0 & 1 & 0 \\ \end{pmatrix}.
```

Figure [](#fig-7-6) is the circuit for the CNOT gate. Plugging in the “Before” values from [](#tbl-7-1) into this circuit will produce the “After” values.

```{figure} ../images/ch-07/490703_1_En_7_Fig6_HTML.png
:label: fig-7-6
:alt: The CNOT gate applies an X gate to the target qubit when the control qubit is 1


The CNOT gate performs an *X* gate on the target qubit if the control qubit is |1〉.
```


(sec-7-8)=
## 7.8 Notation Convention

When converting between bra-ket notation and circuit notation, there are two different conventions. Since we will be using the IBM quantum computer, we will adopt the IBM convention. This is shown in Fig. [](#fig-7-7). In the IBM notation, the topmost qubit in the circuit corresponds to the rightmost qubit in the bra-ket notation (|…*q*〉). IBM shorthand is top-down in circuit notation, which corresponds to right-left in bra-ket notation.

```{figure} ../images/ch-07/490703_1_En_7_Fig7_HTML.png
:label: fig-7-7
:alt: The two conventions for mapping circuit notation to the bra-ket notation, IBM (left) and Other (right). Note in this book we adopt the IBM convention as we run code on the IBM quantum computers


The two conventions for mapping circuit notation to the bra-ket notation, IBM (left) and Other (right). Note in this book we adopt the IBM convention as we run code on the IBM quantum computers.
```


The other convention, which we will **not** use going forward but provide in case it is seen in other resources, is shown in Fig. [](#fig-7-7). Here, the topmost qubit corresponds to the leftmost qubit in bra-ket notation (|*q*…〉). Top-down in circuit notation corresponds to left-right in bra-ket notation. We will not use this going forward.

(sec-7-9)=
## 7.9 Examples

1. Figure [](#fig-7-8) shows the quantum circuit sending |01〉 through a CNOT gate. What is the output?

   ```{figure} ../images/ch-07/490703_1_En_7_Fig8_HTML.png
   :label: fig-7-8
   :alt: Two-qubit circuit with input |01〉, upper control qubit and lower target qubit connected by a CNOT gate


   The quantum circuit that sends a multi-qubit in the |01〉 state through a CNOT gate.
   ```


   The figure shows that, in IBM notation, the control qubit is on top and the target is on the bottom. Since the control is in the |1〉 state, the target qubit is flipped to |1〉. So measurement will always result in |11〉.

2. Examine Fig. [](#fig-7-9). The control qubit is in a superposition of |0〉 and |1〉. What is the effect of a CNOT gate?

   ```{figure} ../images/ch-07/490703_1_En_7_Fig9_HTML.png
   :label: fig-7-9
   :alt: The quantum circuit that sends a control qubit in a superposition state through a CNOT gate


   The quantum circuit that sends a control qubit in a superposition state through a CNOT gate.
   ```


   Before the CNOT operation, in ket notation, the control qubit is in the $\frac {1}{\sqrt {2}}\lvert 0\rangle +\frac {1}{\sqrt {2}}\lvert 1\rangle$ state, while the target qubit is in the |0〉 state. The two-qubit input state is therefore $\frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{\sqrt {2}}\lvert 01\rangle$. When we apply the rules for the CNOT, the first state |00〉 does not change as the control qubit is |0〉. However, for the second state |01〉, the control qubit is |1〉 and so the target qubit is flipped from |0〉 to |1〉. The result of the CNOT gate is the state $\frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{\sqrt {2}}\lvert 11\rangle$. The histogram from measuring this state is shown in Fig. [](#fig-7-10). This is a special state called the Bell state.

   ```{figure} ../images/ch-07/490703_1_En_7_Fig10_HTML.png
   :label: fig-7-10
   :alt: Histogram of five-bit register outcomes 00000 at 49.805% and 00011 at 50.195%; the other three register bits remain zero


   The measurement histogram produced by running the circuit in Fig. [](#fig-7-9). This older display includes three unused register bits, which remain zero. Reprint courtesy of International Business Machines Corporation, ⒸInternational Business Machines Corporation.
   ```


   The two qubits are entangled after this CNOT: the resulting Bell state cannot be written as a product of two single-qubit states. By linearity, CNOT acts on each basis component of a superposition. That fact alone does not guarantee a computational speedup; a useful algorithm must arrange interference so that measurement reveals the desired answer. CNOT is reversible: applying it again restores the input state.

(sec-7-10)=
## 7.10 Big Ideas

1. A pure state is entangled when it cannot be written as a product of its component states. Interactions can create entanglement.
2. Entanglement and interference are resources in many quantum algorithms, but neither alone guarantees a speedup.
3. Two-qubit gates act on pairs of qubits. CNOT can create entanglement from suitable inputs.[^7]

(sec-7-11)=
## 7.11 Activities

Correlation in Entangled States Lab in Worksheet [](#sec-10-1)

Schrödinger’s Worm Using Five Qubits in Worksheet [](#sec-10-4)

For those interested in hands-on experiments, see QuTools[^8]

(sec-7-12)=
## 7.12 Check Your Understanding

1. For each of the questions below, assume that two qubits start in the state

   ```{math}
   :label: eq-7-5

   \lvert\psi\rangle = \frac{1}{\sqrt{2}}\lvert00\rangle+\frac{1}{2}\lvert10\rangle-\frac{1}{2}\lvert11\rangle.
   ```

   - (a) What is the probability of measuring both qubits as 0?
   - (b) What is the probability of measuring the first qubit as 1?
   - (c) What is the probability of measuring the second qubit as 0?
   - (d) What is the new state of the system after measuring the first qubit as 0?
   - (e) What is the new state of the system after measuring the first qubit as 1?

2. Two independent fair classical coins are flipped. What are the four possible outcomes, and what probability does each have? How does this distribution differ from the H/T measurement distribution of the Bell state in Section 7.1?
3. Is $\frac {1}{\sqrt {2}}\lvert 00\rangle +\frac {1}{\sqrt {2}}\lvert 01\rangle$ an entangled state? If so, show that it cannot be written as a product. If not, what is the individual state of the two qubits?
4. Are the following two-qubit states entangled?
   - (a) $\frac {1}{\sqrt {2}}|{01}\rangle +\frac {1}{\sqrt {2}}|{10}\rangle$
   - (b) $\frac {1}{\sqrt {2}}|{01}\rangle -\frac {1}{\sqrt {2}}|{10}\rangle$
   - (c) $\frac {\sqrt {3}}{2}|{00}\rangle +\frac {1}{{2}}|{11}\rangle$
   - (d) $\frac {1}{\sqrt {2}}|{10}\rangle +\frac {1}{\sqrt {2}}|{11}\rangle$
   - (e) $\frac {1}{2}|{00}\rangle +\frac {1}{2}|{01}\rangle +\frac {1}{2}|{10}\rangle -\frac {1}{2}|{11}\rangle$
   - (f) $\frac {1}{\sqrt {2}}|{00}\rangle +\frac {1}{2}|{10}\rangle -\frac {1}{2}|{11}\rangle$
5. Two qubits are passed through a CNOT. In IBM notation, the qubit on the right is the control qubit. What is the output for the following initial states?
   - (a) |00〉
   - (b) |01〉
   - (c) |11〉
   - (d) $\frac {1}{\sqrt {2}}|{01}\rangle +\frac {1}{\sqrt {2}}|{10}\rangle$
   - (e) $\frac {1}{\sqrt {2}}|{00}\rangle +\frac {1}{2}|{10}\rangle -\frac {1}{2}|{11}\rangle$
6. The output of a CNOT gate is shown in Fig. [](#fig-7-11). What were the inputs?

   ```{figure} ../images/ch-07/490703_1_En_7_Fig11_HTML.png
   :label: fig-7-11
   :alt: Two-wire CNOT circuit with its output qubit values shown and its input values left for the reader to determine


   CNOT gate for Problem 6
   ```


7. Can you predict the state produced by these quantum circuits? Try them out on the IBM quantum computer.
   - (a) ![Quantum circuit for Problem 7a](../images/ch-07/490703_1_En_7_Figa_HTML.gif)
   - (b) ![Quantum circuit for Problem 7b](../images/ch-07/490703_1_En_7_Figb_HTML.gif)
   - (c) ![Quantum circuit for Problem 7c](../images/ch-07/490703_1_En_7_Figc_HTML.gif)
   - (d) ![Quantum circuit for Problem 7d](../images/ch-07/490703_1_En_7_Figd_HTML.gif)
8. Can you predict which states will be produced by these quantum circuits?
   - (a) ![Quantum circuit for Problem 8a](../images/ch-07/490703_1_En_7_Fige_HTML.gif)
   - (b) ![Quantum circuit for Problem 8b](../images/ch-07/490703_1_En_7_Figf_HTML.gif)
   - (c) ![Quantum circuit for Problem 8c](../images/ch-07/490703_1_En_7_Figg_HTML.gif)
   - (d) ![Quantum circuit for Problem 8d](../images/ch-07/490703_1_En_7_Figh_HTML.gif)
9. Can you predict the state produced by these quantum circuits? Note: to put the circuit in a) on the IBM quantum computer, you need to use the code (rather than the click-and-drag interface) to put the second CNOT control on the bottom qubit.
   - (a) ![Quantum circuit for Problem 9a](../images/ch-07/490703_1_En_7_Figi_HTML.gif)
   - (b) ![Quantum circuit for Problem 9b](../images/ch-07/490703_1_En_7_Figj_HTML.gif)
10. Use the IBM Q[^9] simulator to create the entangled state $\frac {1}{\sqrt {2}}|{01}\rangle +\frac {1}{\sqrt {2}}|{10}\rangle$.
11. Suppose Alice and Bob each hold one qubit of an entangled pair. Alice measures hers. What results can Bob observe locally, before hearing from Alice? Can they use the correlation to send a message faster than light? Explain.

[^1]: “Bounding the speed of spooky action at a distance.” *Physical Review Letters*. 110: 260407. 2013. [arXiv:1303.0614](https://arxiv.org/abs/1303.0614).

[^2]: [IBM Quantum Learning, Bell's inequality](https://quantum.cloud.ibm.com/learning/en/modules/quantum-mechanics/bells-inequality-with-qiskit).

[^3]: The BIG Bell Test Collaboration (9 May 2018). “Challenging local realism with human choices.” *Nature* 557: 212–216. [Publisher page](https://www.nature.com/articles/s41586-018-0085-3).

[^4]: More recently, it has been shown that there can exist quantum correlations in separable states that are not due to entanglement. These are called quantum discord: [https://en.wikipedia.org/wiki/Quantum_discord](https://en.wikipedia.org/wiki/Quantum_discord).

[^5]: The conditional-probability test here is used only for known pure states. For a pure two-qubit state, a reduced state's purity can provide a more general test, but density matrices are outside the scope of this chapter.

[^6]: [https://en.wikipedia.org/wiki/Controlled_NOT_gate](https://en.wikipedia.org/wiki/Controlled_NOT_gate).

[^7]: In fact, three single qubit gates (the Hadamard, phase, and *π*/8 phase-rotation) in combination with the CNOT form a universal set of gates, i.e., all other gates can be made up from them.

[^8]: [https://www.qutools.com/quantum-physics-education-science-kits/](https://www.qutools.com/quantum-physics-education-science-kits/).

[^9]: [https://quantum-computing.ibm.com](https://quantum-computing.ibm.com).
