---
title: 8. Quantum Teleportation
short_title: "Ch. 8 — Teleportation"
label: ch-8
doi: 10.1007/978-3-030-61601-4_8
---

One application of entanglement is **quantum teleportation**, a protocol that transfers an *unknown* quantum state to a distant qubit. It requires a previously shared entangled pair and two classical bits sent from the sender to the receiver. The original qubit's state is lost when the sender measures it, so the protocol does not copy an unknown state or violate the no-cloning theorem.[^1] No person or particle travels through the classical communication channel.

(sec-8-1)=
## 8.1 Scanning a Qubit

**Question 1** Create a qubit in the |1〉 state and pass it through a Hadamard gate. From the measurement histogram, can you tell whether the qubit started as a |0〉 or |1〉 initial state?

The measurement histogram should look identical if either of the |0〉 or |1〉 states is used initially. Then how can we tell what the initial state was after performing a Hadamard operation? In the beam splitter, we determined where the photon came from by adding a second beam splitter to create interference. The way to measure and distinguish between them is to add a second Hadamard gate. As we have seen in Sect. [](#sec-2-2), all gates must be unitary to conserve probabilities. The unitary condition ensures that all gates are reversible: we can undo the action of any gate by applying its conjugate transpose. This is easily seen in matrix form as unitary matrices are defined as $UU^\dagger = 1$. As the Hadamard gate is its own conjugate transpose, applying a second Hadamard gate is equivalent to undoing the first. This is how the original state is recovered.

**Question 2** If a qubit is in the unknown state $a|0\rangle + b|1\rangle$, what is the result of a single measurement in the $|0\rangle, |1\rangle$ basis?

- (A) 0
- (B) 1
- (C) 0 with probability $|a|^2$ and 1 with probability $|b|^2$
- (D) A number between 0 and 1

**Question 3** What is the result of an immediate second measurement in the same basis, with no intervening operation, after the first measurement from Question 2?

- (A) 0 if the first measurement is 0 or 1 if the first measurement is 1
- (B) 0 if the first measurement is 1 or 1 if the first measurement is 0
- (C) 0 with probability $|a|^2$ and 1 with probability $|b|^2$
- (D) A number between 0 and 1

A single measurement of one qubit cannot reveal its unknown amplitudes $a$ and $b$. If a state is known from its preparation procedure or from measurements on many identically prepared copies, Alice could instead send Bob a classical description of how to prepare it. Teleportation addresses the case where Alice has an unknown state and cannot send the original qubit itself.

(sec-8-2)=
## 8.2 Teleportation Protocol

Alice cannot read out the full unknown state from one qubit. Instead, she performs a joint operation and measurements on it and her half of a shared entangled pair. This [comic](https://www.jpl.nasa.gov/news/news.php?feature=4384)[^2] illustrates the basic idea. The protocol is as follows:

1. Alice and Bob prepare qubits #2 and #3 in a shared Bell state. One way is to apply a Hadamard gate to one qubit followed by a CNOT gate, as shown later in Fig. [](#fig-8-6). Alice keeps qubit #2, and Bob takes qubit #3. Their shared state is

   ```{math}
   :label: eq-8-1

   \frac{1}{\sqrt{2}}|00\rangle + \frac{1}{\sqrt{2}}|11\rangle.
   ```

   Alice takes her qubit and walks away, and Bob takes his and walks in a different direction as shown in Fig. [](#fig-8-1).

   ```{figure} ../images/ch-08/490703_1_En_8_Fig1_HTML.png
   :label: fig-8-1
   :alt: Alice and Bob’s qubits are entangled


   Alice and Bob’s qubits are entangled
   ```


2. Now Alice obtains a third qubit in an unknown state (qubit #1) that she wants to transfer to Bob. She can only communicate with him classically by email or phone, and it would take too long to physically bring the qubit to Bob. The current situation is shown in Fig. [](#fig-8-2).

   ```{figure} ../images/ch-08/490703_1_En_8_Fig2_HTML.png
   :label: fig-8-2
   :alt: Alice has a qubit (*#*1) in an unknown state she wants to transfer to Bob


   Alice has a qubit (*#*1) in an unknown state she wants to transfer to Bob
   ```


3. Alice applies a CNOT with qubit #1 as control and qubit #2 as target. She then applies a Hadamard gate to qubit #1 and measures both of her qubits. The operations and measurements are shown in Fig. [](#fig-8-3).

   ```{figure} ../images/ch-08/490703_1_En_8_Fig3_HTML.png
   :label: fig-8-3
   :alt: Alice passes her two qubits through a CNOT gate


   Alice passes her two qubits through a CNOT gate
   ```


   Bob cannot detect Alice's operations by measuring his qubit alone. His local measurement statistics remain unchanged until he receives her classical message and applies the appropriate correction.

   When understanding quantum teleportation, it may be more insightful to see the mathematical description of this three-qubit protocol. Qubit #1 is the qubit to be teleported, and qubits #2 and #3 are the entangled pair shared by Alice and Bob. In ket notation, the three-qubit state is written in the order | #1 #2 #3 〉. In addition, the three-qubit state can be written in ket notation in different ways as long as the order of the qubits is kept unchanged. For example, if qubit #1 = |0〉, qubit #2 = |1〉, and qubit #3 = |1〉, they can be written as |0〉|1〉|1〉 = |011〉 = |0〉|11〉 = |01〉|1〉. Sometimes it is easier to split up the multi-qubit state like this to explicitly show if a gate is acting on a single qubit.

   Now, from steps (1) and (2) we have Alice and Bob’s qubits in the Bell state $\frac {1}{\sqrt {2}}(|00\rangle + |11\rangle )$. Qubit #1 is in an unknown state *a*|0〉 + *b*|1〉. At the start of step (3), the three qubits need to be written together in ket notation by multiplying the qubit to be teleported by the entangled Bell state. The product is:

   ```{math}
   :label: eq-8-2

   \left[a|0\rangle+b|1\rangle\right] \left(\frac{1}{\sqrt{2}}|00\rangle + \frac{1}{\sqrt{2}}|11\rangle\right) = \frac{1}{\sqrt{2}}\Big(a|000\rangle + a|011\rangle+b|100\rangle+b|111\rangle\Big).
   ```

   Next, we apply a CNOT gate using the first qubit in Eq. ([](#eq-8-2)) as the control and the second as the target. Recall that the target (qubit #2) changes state only if the control is |1〉. After applying the CNOT gate the three-qubit state is

   ```{math}
   :label: eq-8-3

   \frac{1}{\sqrt{2}} \Big(a|000\rangle + a|011\rangle+b|110\rangle+b|101\rangle\Big).
   ```

   After this, we apply a Hadamard gate to qubit #1 in Eq. ([](#eq-8-3)). Recall that the Hadamard gate changes the state $|0\rangle \to ({1}/{\sqrt {2}})(|0\rangle + |1\rangle )$, and $|1\rangle \to ({1}/{\sqrt {2}})(|0\rangle - |1\rangle )$. The three-qubit state is

   ```{math}
   :label: eq-8-4

   \frac{1}{2}\Big( a\left(|0\rangle+|1\rangle\right)|00\rangle + a\left(|0\rangle+|1\rangle\right)|11\rangle+b\left(|0\rangle-|1\rangle\right)|10\rangle+b\left(|0\rangle-|1\rangle\right)|01\rangle \Big).
   ```

   Next, distribute the product of qubits throughout Eq. ([](#eq-8-4)) to find

   ```{math}
   :label: eq-8-5

   \frac{1}{2} \Big(a|000\rangle+a|100\rangle +a|011\rangle+a|111\rangle+b|010\rangle-b|110\rangle+b|001\rangle-b|101\rangle\Big).
   ```

   Finally, combine like-terms of Eq. ([](#eq-8-5)) based on the first two qubits to get

   ```{math}
   :label: eq-8-6

   \frac{1}{2} \Big( |00\rangle(a|0\rangle+b|1\rangle)+|10\rangle(a|0\rangle-b|1\rangle)+|01\rangle(a|1\rangle+b|0\rangle)+|11\rangle(a|1\rangle-b|0\rangle)\Big)
   ```

   Qubits #1 and #2 belong to Alice. Equation ([](#eq-8-6)) expresses the joint state as four branches associated with her possible two-bit measurement outcomes. Conditional on a particular result, Bob's qubit has the corresponding state in Fig. [](#fig-8-4). Before Alice tells him the result, Bob does not know which correction to apply.

   ```{figure} ../images/ch-08/490703_1_En_8_Fig4_HTML.png
   :label: fig-8-4
   :alt: Bob's qubit has one of four conditional states, a|0〉+b|1〉, a|0〉−b|1〉, a|1〉+b|0〉, or a|1〉−b|0〉, depending on Alice's measurement


   Four possible superposition states of Bob’s qubit
   ```


   Alice's two measurement results identify which of the four corrections Bob needs. At this stage, Bob has done nothing to his qubit and cannot recover the unknown state without those results.

4. Alice now sends the two classical bits of information from the measurements to Bob by email or phone. According to Eq. ([](#eq-8-6)), her measurements can be 00, 10, 01 or 11, each with 25% probability.

Depending on the measurement obtained by Alice, Bob can recover the original state of the teleported qubit (i.e., *a*|0〉 + *b*|1〉) by using a combination of *X* or *Z* gates. The specific combination of *X*/*Z* gates to use will be explored as a question in Sect. [](#sec-8-4). This situation is illustrated in Fig. [](#fig-8-5). At this stage, the qubit has been successfully teleported from Alice to Bob, and thus the teleportation protocol ends.

```{figure} ../images/ch-08/490703_1_En_8_Fig5_HTML.png
:label: fig-8-5
:alt: The final result of teleportation between Bob and Alice


The final result of teleportation between Bob and Alice
```


Alice's measurement removes the input qubit's original state. Bob recovers that state on his qubit only after receiving her two classical bits and applying the corresponding gates. There is no extra copy of the unknown state, so the protocol respects the no-cloning theorem. Neither Alice nor Bob knows the amplitudes $a$ and $b$ simply from running the protocol. The full circuit is illustrated in Fig. [](#fig-8-6).

```{figure} ../images/ch-08/490703_1_En_8_Fig6_HTML.png
:label: fig-8-6
:alt: Three-wire teleportation circuit: Hadamard and CNOT prepare a Bell pair, Alice applies CNOT and Hadamard and measures two qubits, and Bob applies X and Z corrections controlled by her two results


The full quantum circuit for quantum teleportation. The dashed box entangles Alice’s and Bob’s qubits to make the Bell state. Afterwards, the quantum teleportation protocol described in the text is performed.
```


Why is this protocol interesting? Imagine Alice and Bob shared an entangled pair before moving apart. Alice can then transfer an unknown quantum state to Bob without physically sending the input qubit. She still needs to send him two classical bits through an ordinary channel; Bob uses them to choose the corrections that recover the state on his qubit. Teleportation can also move quantum information between parts of a computing system.[^3]

(sec-8-3)=
## 8.3 Big Ideas

1. If Alice and Bob have a single qubit each, which they entangle, it is possible for Alice to teleport the information encoded in a third unknown qubit into Bob’s qubit.

2. Quantum teleportation sends quantum information by using the entanglement and measurement properties of quantum mechanics.

3. The input qubit loses its original state when Alice measures it. Bob can recover that state on his qubit without either person learning its amplitudes.

(sec-8-4)=
## 8.4 Check Your Understanding

1. Could quantum teleportation be used to teleport a physical object from one place to another? Why or why not?

2. What would lead someone to think quantum teleportation can transmit information faster than the speed of light? Explain why this is not possible.

3. By the no-cloning theorem, it is not possible to make a copy of an unknown qubit. At what point in the teleportation protocol does the unknown qubit collapse into a definite state?

4. In the original protocol, Alice applies the CNOT and then measures Bit 2 (see Fig. [](#fig-8-3)). After this, Alice then applies the Hadamard to qubit #1 and then measures Bit 1 (see Fig. [](#fig-8-3)). What happens if she decides to reverse the procedure by measuring Bit 1 first, before applying the two-qubit CNOT gate?

5. If Bob knows that his qubit is in the *b*|0〉 + *a*|1〉 state, which gate(s) would he need to use to change it back into the original needed *a*|0〉 + *b*|1〉 state?
   - (A) *X*
   - (B) *Z*
   - (C) *X* then *Z*

6. If Bob knows that his qubit is in the *a*|0〉 − *b*|1〉 state, which gate(s) would he need to use to change it back into the original needed *a*|0〉 + *b*|1〉 state?
   - (A) *X*
   - (B) *Z*
   - (C) *X* then *Z*

7. If Bob knows that his qubit is in the *a*|1〉 − *b*|0〉 state, which gate(s) would he need to use to change it back into the original needed *a*|0〉 + *b*|1〉 state?
   - (A) *X*
   - (B) *Z*
   - (C) *X* then *Z*

[^1]: The no-cloning theorem poses a big problem for correcting errors that happen on quantum computers: [https://en.wikipedia.org/wiki/Quantum_error_correction](https://en.wikipedia.org/wiki/Quantum_error_correction).

[^2]: [https://www.jpl.nasa.gov/news/news.php?feature=4384](https://www.jpl.nasa.gov/news/news.php?feature=4384).

[^3]: Fermi National Accelerator Laboratory is building a quantum teleportation experiment which will extend over large distances, helping to develop a future quantum internet, e.g., [https://qis.fnal.gov/quantum-teleportation-experiment/](https://qis.fnal.gov/quantum-teleportation-experiment/).
