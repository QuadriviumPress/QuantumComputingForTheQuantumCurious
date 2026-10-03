---
title: 9. Quantum Algorithms
short_title: "Ch. 9 — Algorithms"
label: ch-9
doi: 10.1007/978-3-030-61601-4_9
---

We have come a long way from Chap. [](#ch-1). The Stern–Gerlach and Mach–Zehnder examples introduced superposition, measurement, and interference. We have applied gates to qubits, discussed cryptographic uses and risks, and used entanglement in a teleportation protocol. Now we can combine these ideas in a quantum algorithm.

A *quantum algorithm* is a sequence of operations designed to solve a specified task using qubits. Grover's algorithm, for example, uses amplitude amplification to reduce the number of queries needed for an unstructured search from order $N$ to order $\sqrt N$; this does not imply that searching an ordinary database will be faster in practice.[^10] Here we study the Deutsch–Jozsa algorithm, which uses interference to solve a carefully defined query problem with fewer queries than any deterministic classical algorithm.

(sec-9-1)=
## 9.1 The Power of Quantum Computing

An operation on a superposition acts on each basis component by linearity. For example, a quantum oracle applied to a superposition of $x=0$ and $x=1$ transforms both components in one query, as suggested by Fig. [](#fig-9-1). A measurement does not reveal both values of $f(x)$, however. A useful quantum algorithm must make amplitudes interfere so that the measurement answers a specific question about the function.

```{figure} ../images/ch-09/490703_1_En_9_Fig1_HTML.png
:label: fig-9-1
:alt: Two classical function evaluations for inputs 0 and 1 compared with one oracle operation on a qubit superposition of 0 and 1


An oracle can act on a superposition of inputs 0 and 1 in one query; one measurement cannot reveal both outputs.
```


With two input qubits, a superposition can contain all four two-bit strings, as shown in Fig. [](#fig-9-2). The oracle acts on their amplitudes, but the four function values cannot generally be read out from one run.

```{figure} ../images/ch-09/490703_1_En_9_Fig2_HTML.png
:label: fig-9-2
:alt: Four classical input strings 00, 01, 10, and 11 alongside one oracle operation on a superposition of the four two-qubit basis strings


An oracle can act on a superposition of four two-bit inputs in one query; the results are not all directly readable.
```


**Question 1** How many computational basis states does a three-qubit system have? Write them down. How many basis strings can one measurement reveal?

The possible states are

```{math}
:label: eq-9-1

|{000}\rangle,|{001}\rangle,|{010}\rangle,|{011}\rangle,|{100}\rangle,|{101}\rangle,|{110}\rangle,|{111}\rangle.
```

Three qubits have eight basis states, although one computational-basis measurement reveals only one three-bit string. In general, an $n$-qubit pure state has $2^n$ amplitudes. Adding one qubit doubles that state-space dimension; it does not automatically double useful processing power or provide $2^n$ readable answers.

This large state space affects **simulation**. A general pure state of $n$ qubits requires $2^n$ complex amplitudes in a straightforward classical representation. Some states and circuits have more compact classical descriptions, so this is not a lower bound for every simulation. The amplitudes also cannot serve as directly readable classical memory: measuring the qubits does not disclose all $2^n$ values.

Classical computers can simulate many small quantum circuits, but the cost depends on the circuit and simulation method. State-vector simulation becomes expensive as $n$ grows because its memory use scales with $2^n$. A particular qubit count is therefore not a universal boundary between classically simulable and unsimulable quantum systems.

(sec-9-2)=
## 9.2 Limitations

Superposition alone gives no automatic computational advantage. An oracle may encode values of $f(x)$ across many basis components, but one measurement produces only one outcome. Repeating the circuit to sample outcomes does not generally recover every value efficiently; rare outcomes may take many repetitions to observe. Quantum algorithms therefore arrange interference to increase the probability of an answer to a *specific* question. Deutsch–Jozsa asks whether a promised function is constant or balanced, rather than asking for every value of that function.

Quantum algorithms are especially promising when they exploit structure in a problem, such as periodicity or interference patterns. Simulating quantum systems is another important application. A theoretical reduction in query count may or may not translate into a faster practical computation once circuit construction, noise, and classical alternatives are considered. The next section gives a clear example of a query advantage.

(sec-9-3)=
## 9.3 Deutsch-Jozsa Algorithm

Here we compare the number of *oracle queries* needed to solve a specific promised problem. This comparison does not, by itself, compare the running time of complete machines.

### 9.3.1 The Problem Statement

Let $f:\{0,1\}\to\{0,1\}$ be an unknown Boolean function. There are four possible functions of this form, shown in [](#tbl-9-1).

:::{table} There are only four possible single qubit functions
:label: tbl-9-1
:enumerator: 9.1

| $f_{1}$ | $f_{2}$ | $f_{3}$ | $f_{4}$ |
| --- | --- | --- | --- |
| $f_{1}\left ( 0\right )=0$ | $f_{2}\left ( 0\right )=0$ | $f_{3}\left ( 0\right )=1$ | $f_{4}\left ( 0\right )=1$ |
| $f_{1}\left ( 1\right )=0$ | $f_{2}\left ( 1\right )=1$ | $f_{3}\left ( 1\right )=0$ | $f_{4}\left ( 1\right )=1$ |
:::

A function is called **constant** if it always outputs the same result for all values of *x*. A function is called **balanced** if it outputs 1 for half of all the possible values of *x* and 0 for the other half. The question posed to the computer is this:

```{math}
\mbox{``Is the function}\ f(x)\ \mbox{a constant function or a balanced function?''}
```

For this single qubit case, the question is answered by checking if *f*(0) = *f*(1). It also turns out in this single qubit case that there are only constant and balanced functions. However, in multiple qubit systems, there exist functions that are neither constant nor balanced. In the multiple qubit scenario, it is important that in the problem statement the function given to the quantum computer is either constant *or* balanced, and not something else.

**Question 2** Which of the functions in [](#tbl-9-1) are constant and which are balanced?

The functions *f*₁ and *f*₄ are constant, while *f*₂ and *f*₃ are balanced.

**Question 3** If you run the classical algorithm and see that *f*(0) = 1, could you tell whether the function is constant or balanced?

No. It could be the balanced function *f*₃ or the constant function *f*₄. A deterministic classical algorithm must query both *f*(0) and *f*(1) to guarantee the answer. The quantum circuit below uses one oracle query, followed by a measurement.

### 9.3.2 Conceptual Understanding

Before we go through the Deutsch-Jozsa Algorithm in detail, it will be useful to understand a cartoon solution of the problem, which we will demonstrate using the [Mach-Zehnder interferometer](https://www.st-andrews.ac.uk/physics/quvis/simulations_html5/sims/SinglePhotonLab/SinglePhotonLab.html) from Chap. [](#ch-3). Once again, superposition and interference will be the key properties to utilize. The cartoon experimental setup is shown in Fig. [](#fig-9-3). In the QuVis simulation, we will model the functions by placing pieces of glass in the blue boxes. The goal is to illustrate how it may be possible to classify *f*(*x*) as either constant or balanced by making a single measurement. Here is how the algorithm can be implemented:

```{figure} ../images/ch-09/490703_1_En_9_Fig3_HTML.png
:label: fig-9-3
:alt: The Mach-Zehnder interferometer altered to implement the cartoon version of the Deutsch-Jozsa algorithm. The function implementations are shown in Fig. [](#fig-9-5)


The Mach-Zehnder interferometer altered to implement the cartoon version of the Deutsch-Jozsa algorithm. The function implementations are shown in Fig. [](#fig-9-5).
```


1. The two inputs *x* = 0 and *x* = 1 are represented by the two possible photon paths as shown in Fig. [](#fig-9-4). A photon taking the yellow path is *x* = 0, while a photon taking the red path is *x* = 1. Beam splitter 1 therefore creates a superposition of 0 and 1 since the photon takes both paths. Due to the orientation of the beam splitter, the red transmitted path will have no phase shift whereas the yellow reflected path will have a phase shift of *π*.

   ```{figure} ../images/ch-09/490703_1_En_9_Fig4_HTML.png
   :label: fig-9-4
   :alt: Inputs to the function are photons along two different paths. A photon taking the yellow path is *x* = 0, while a photon taking the red path is *x* = 1


   Inputs to the function are photons along two different paths. A photon taking the yellow path is *x* = 0, while a photon taking the red path is *x* = 1.
   ```


2. Each of the four functions in [](#tbl-9-1) can be modeled by a different experimental setup as shown in Fig. [](#fig-9-5). For example, if we wanted to test *f*₁, we would place a piece of glass along the red path but nothing along the yellow path. A photon passing through the glass will experience an additional phase shift of *π*. The reason that this is only a cartoon demonstration is that the phase shifters do not actually implement the function, as we will see in the next section.

   ```{figure} ../images/ch-09/490703_1_En_9_Fig5_HTML.png
   :label: fig-9-5
   :alt: Four interferometer cartoons after a beam splitter: f1 has an X box on the red path, f2 has none, f3 has X boxes on both paths, and f4 has an X box on the yellow path


   The four different functions from [](#tbl-9-1) experimentally implemented by four different configurations. In this cartoon, we have denoted the function changing the bit by an *X*-gate; however, in reality, as described in Eq. ([](#eq-9-2)), two qubits are needed to implement these functions.
   ```


   **Question 4** If *f*₁ is being tested, what is the phase of the yellow path upon reaching the second beam splitter? The red path photon?

   The yellow path was phase-shifted by Beam Splitter 1 and unaffected by the blue function box *f*(0). The red path was unaffected by Beam Splitter 1 and phase-shifted by the blue function box *f*(1). Therefore, they both have a phase shift of *π*.

3. The second beam splitter creates the interference necessary to ensure that measurement happens only in one detector. Depending on which detector is measured, this is interpreted as the function being constant or balanced.

   **Question 5** For the experimental configuration *f*₁, what is the phase of the yellow path photon at Detector 1? The red path photon at Detector 1?

   At Detector 1, the yellow path and red path photons both have a phase shift of *π*.

   **Question 6** For the experimental configuration *f*₁, what is the phase of the yellow path photon at Detector 2? The red path photon at Detector 2?

   At Detector 2, the yellow path photon has a phase shift of *π* while the red path photon has a phase shift of 2*π*.

4. Measure which detector is activated.

   **Question 7** For the experimental configuration *f*₁, which detector(s) go off and with what probability?

   Detector 1 experiences constructive interference, while Detector 2 experiences destructive interference. Therefore, only Detector 1 activates for *f*₁, which is a constant function. Which detector(s) go off for *f*₂, *f*₃, and *f*₄?

The cartoon illustrates how superposition and interference can turn a property of both paths into one detector outcome. It does not implement the reversible oracle used in the quantum algorithm, which follows.

### 9.3.3 Quantum Algorithm

Before we describe the full quantum solution, we need to set up some useful tools. For example, in the quantum computing literature, it is common to use the mathematical tool called modular arithmetic. For this algorithm, we will not need to understand modular arithmetic more than basic notation. In quantum computing, modular arithmetic with “mod 2” is defined to be *f*(0) ⊕ *f*(1) = 0 if *f*(0) + *f*(1) = 0, 2, 4, 6, …. However, *f*(0) ⊕ *f*(1) = 1 if *f*(0) + *f*(1) = 1, 3, 5, …. Note the circle with a plus inside ⊕ denotes this modular arithmetic “mod 2” operation. The ⊕ operation outputs the remainder of dividing a number *x* by the number 2. As an example, if *f*(0) = 0 and *f*(1) = 1 then *f*(0) ⊕ *f*(1) = 1, whereas if *f*(0) = 1 and *f*(1) = 1 then *f*(0) ⊕ *f*(1) = 0.

Also, we will need a second qubit for this algorithm, and will shortly see why. In the quantum computing world, the function *f*(*x*) is implemented by

```{math}
:label: eq-9-2

|x\rangle|y\rangle \xrightarrow {f} |x\rangle|y\oplus f(x)\rangle.
```

As an example, assume *f*(0) = 1; then $|0\rangle |1\rangle \xrightarrow {f} |0\rangle |1\oplus f(0)\rangle =|0\rangle |0\rangle$. Although the implementation of functions as in Eq. ([](#eq-9-2)) looks strange, this is needed to ensure that the function operation is unitary.[^3] The circuit that implements the Deutsch-Jozsa algorithm is shown in Fig. [](#fig-9-6). We will now give a walk-through of the algorithm and the circuit.

```{figure} ../images/ch-09/490703_1_En_9_Fig6_HTML.png
:label: fig-9-6
:alt: Two-wire Deutsch–Jozsa circuit: input |0〉 and ancilla |1〉 each pass through H, then a reversible f oracle acts, followed by H and measurement on the first wire


The quantum circuit for the one qubit Deutsch-Jozsa algorithm. The generic function *f*(*x*) is represented by the box with *f* inside, and the labels below/above the lines indicate how the function is implemented.
```


**Deutsch-Jozsa Procedure**:

1. As the first step of the algorithm shown in Fig. [](#fig-9-6), get two qubits, and put them into a |0〉|1〉 product state. In the modified Mach-Zehnder experiment above, only the first qubit from Fig. [](#fig-9-6) was shown. The second qubit was hidden in the blue function boxes.

2. Operate on each qubit with the Hadamard gate. Following the rules of the Hadamard gate, the two-qubit state is now

   ```{math}
   :label: eq-9-3

   \frac{1}{2}( |0\rangle + |1\rangle ) ( |0\rangle - |1\rangle ).
   ```

   In the Mach-Zehnder cartoon in Fig. [](#fig-9-5), Beam splitter 1 performs the first Hadamard gate on the first qubit in Fig. [](#fig-9-6).

3. Apply the function *f*(*x*) using the rule in Eq. ([](#eq-9-2)) to the state in Eq. ([](#eq-9-3)). After performing the arithmetic, the two-qubit state can be organized as

   ```{math}
   :label: eq-9-4

   \frac{1}{2}\bigg( |0\rangle \Big( | 0 \oplus f(0) \rangle - |1\oplus f(0)\rangle \Big) + |1\rangle \Big( |0 \oplus f(1) \rangle - |1\oplus f(1) \rangle \Big) \bigg).
   ```

   In order to get a clearer picture of the effect of *f*(*x*) on the state, it is useful to notice that if *f*(0) = 0 then |0 ⊕ *f*(0)〉−|1 ⊕ *f*(0)〉 = |0〉−|1〉. Additionally, if *f*(0) = 1 then |0 ⊕ *f*(0)〉−|1 ⊕ *f*(0)〉 = −|0〉 + |1〉. We can combine these two by writing |0 ⊕ *f*(0)〉−|1 ⊕ *f*(0)〉 = $(-1)^{f(0)}$(|0〉−|1〉). A similar formula is needed for the *f*(1) case also, and we leave this as an exercise for the reader. Applying this formula to Eq. ([](#eq-9-4)) gives

   ```{math}
   :label: eq-9-5

   \frac{1}{2}\bigg( (-1)^{f(0)}|0\rangle \Big( | 0 \rangle - |1\rangle \Big) + (-1)^{f(1)}|1\rangle \Big( |0\rangle - |1 \rangle \Big) \bigg)
   ```

   ```{math}
   :label: eq-9-6

   =(-1)^{f(0)} \frac{1}{2}\bigg( |0\rangle + (-1)^{(f(0)+f(1))}|1\rangle \bigg) ( |0 \rangle - |1 \rangle ).
   ```

   In the Mach-Zehnder cartoon in Fig. [](#fig-9-5), the interaction between the two qubits was modeled by the photon passing through the blue function boxes.

4. The second qubit factors from the first and need not be measured. Dropping the overall phase $(-1)^{f(0)}$, the normalized state of the first qubit is

   ```{math}
   :label: eq-9-7

   \frac{1}{\sqrt{2}}( |0\rangle + (-1)^{(f(0)+f(1))}|1\rangle).
   ```

   The second qubit enables the reversible oracle and phase kickback. It is called an *ancilla*; the circuit in Fig. [](#fig-9-6) does not measure it.

5. Apply a Hadamard gate to the qubit state in Eq. ([](#eq-9-7)) to produce

   ```{math}
   :label: eq-9-8

   \frac{1}{2}\bigg( \Big(1+ (-1)^{(f(0) + f(1))} \Big) |0\rangle + \Big(1 - (-1)^{(f(0)+f(1))})|1\rangle)\bigg).
   ```

   In the Mach-Zehnder cartoon in Fig. [](#fig-9-5), the second Hadamard gate operation was implemented by Beam Splitter 2.

6. Measure the qubit. If *f*(*x*) is constant, then the state in Eq. ([](#eq-9-8)) reduces to |0〉, while if *f*(*x*) is balanced then the state reduces to |1〉. In the Mach-Zehnder cartoon in Fig. [](#fig-9-5), the detector measured the final state of the photon.

For a function promised to be constant or balanced, one quantum oracle query followed by a measurement gives the answer with certainty in the ideal circuit. The $n$-bit Deutsch–Jozsa algorithm retains this one-query property. A deterministic classical algorithm needs $2^{n-1}+1$ queries in the worst case to guarantee the answer, but a randomized classical algorithm can use far fewer queries if a small chance of error is acceptable.[^11] Query complexity also omits the cost of building and running the oracle.

(sec-9-4)=
## 9.4 Quantum Computers Today

Deutsch–Jozsa is a teaching example rather than a known commercial application. Shor's factoring algorithm and quantum simulation address different problems with potential practical value. A theoretical algorithmic advantage still needs hardware that can run a sufficiently large, accurate circuit.

The 2019 random-circuit sampling experiment is an instructive historical case. Google's team reported that a quantum processor completed a benchmark much faster than their estimate for a classical supercomputer.[^4] IBM researchers proposed a faster classical simulation strategy and disputed the size of that gap.[^6] Such benchmarks depend on the exact task, the hardware, and the best available classical method; a benchmark advantage is not automatically an advantage for a useful application.

Engineering constraints also vary by platform. Superconducting circuits require very low temperatures; trapped ions and photonic systems use different controls and face different sources of error. Noise and unwanted interaction with the environment can reduce the reliability of a calculation. Larger useful computations will need suitable error suppression or correction as well as algorithms whose total resource costs are practical.[^12]

(sec-9-5)=
## 9.5 Big Ideas

1. A quantum operation acts on each component of a superposition, but measurement cannot reveal all those components.
2. Algorithms use interference so that measurement gives useful information about a specific problem.
3. Deutsch–Jozsa solves a promised query problem with one quantum oracle query, compared with exponentially many worst-case queries for an exact deterministic classical algorithm.

(sec-9-6)=
## 9.6 Activities

Explore [IBM Quantum Learning's quantum algorithms course](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms).[^9]

(sec-9-7)=
## 9.7 Check Your Understanding

1. - (a) How many distinct eight-bit strings can eight classical bits represent?
   - (b) How many computational basis states do eight qubits have?
   - (c) Can one measurement of eight qubits reveal all $2^8$ amplitudes? Explain what an algorithm would need to do to obtain a useful answer.

2. This problem refers to the experimental setup in Fig. [](#fig-9-5). Which detector(s) go off for the function
   - (a) *f*₁?
   - (b) *f*₂?
   - (c) *f*₃?
   - (d) *f*₄?

3. - (a) Which detector(s) go off if the function is constant?
   - (b) Which detector(s) go off if the function is balanced?
   - (c) How many photons would you need to send to determine whether the function was constant or balanced?

4. Explain how superposition and interference allow the Deutsch-Jozsa algorithm to beat the classical algorithm.

5. Figure [](#fig-9-7) shows a three-qubit circuit with an $f(x)$ box. Trace its gates to determine its output; the circuit diagram alone does not establish that the box represents an arbitrary constant-or-balanced oracle.

   ```{figure} ../images/ch-09/490703_1_En_9_Fig7_HTML.png
   :label: fig-9-7
   :alt: Three-wire circuit with H gates before and after a dashed f(x) box; the box contains Z on the top wire and H–CNOT–H on the lower two wires, followed by three measurements


   The gate implementation for testing the different possible three-qubit functions.
   ```


   - (a) Starting from $|000\rangle$, what state does the circuit produce immediately before measurement?
   - (b) What measurement outcome do you expect in an ideal simulator? Check it with a circuit simulator.

[^3]: When the action of the function *f*₁ on a single qubit is represented as a matrix, this matrix is not unitary. Non-unitarity violates the laws of quantum mechanics.

[^4]: [https://www.nature.com/articles/s41586-019-1666-5](https://www.nature.com/articles/s41586-019-1666-5).

[^6]: [https://arxiv.org/abs/1910.09534](https://arxiv.org/abs/1910.09534).

[^9]: [IBM Quantum Learning, Fundamentals of Quantum Algorithms](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms).

[^10]: [IBM Quantum Learning, Grover's algorithm](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms/grover-algorithm/introduction).

[^11]: [IBM Quantum Learning, The Deutsch–Jozsa algorithm](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms/quantum-query-algorithms/deutsch-jozsa-algorithm).

[^12]: [IBM Quantum Learning, Quantum Technology](https://quantum.cloud.ibm.com/learning/en/courses/quantum-business-foundations/quantum-technology).
