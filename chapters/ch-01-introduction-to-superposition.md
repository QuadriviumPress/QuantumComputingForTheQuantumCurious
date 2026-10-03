---
title: 1. Introduction to Superposition
short_title: "Ch. 1 — Superposition"
label: ch-1
doi: 10.1007/978-3-030-61601-4_1
---

In this chapter, we review the concepts of classical and quantum superposition. Quantum superposition is central to many quantum phenomena. As we do not observe quantum phenomena in our everyday lives, it may seem confusing at first. However, as unintuitive as the quantum world may appear, experiments support quantum predictions in regimes where classical descriptions fail.[^1] Before going into specific details on quantum superposition, it is useful to explain how the term “superposition” is used in different contexts in both classical and quantum physics. At the end of the chapter, we present the related activities and questions. After gaining experience with quantum superposition from working through these problems, it will become more intuitive. The more experience you gain by advancing through this book, the more quantum superposition will make sense.

(sec-1-1)=
## 1.1 Classical Superposition

In classical physics, the concept of **superposition** describes how contributions to a physical quantity add. An example of the “superposition principle” in classical physics is clear when working with waves. Two pulses on a string which pass through each other will interfere following the principle of superposition as shown in [](#fig-1-1). Noise-canceling headphones use superposition by creating sound waves with the same magnitude as the incoming sound wave but completely out of phase, thereby canceling the sound wave. This destructive interference is illustrated in the second figure of [](#fig-1-1).

```{figure} ../images/ch-01/490703_1_En_1_Fig1_HTML.png
:label: fig-1-1
:alt: Examples of constructive and destructive interference due to the classical superposition principle


Examples of constructive and destructive interference due to the classical superposition principle
```


Another common application of classical superposition is finding the total magnitude and direction of quantities such as force, electric field, magnetic field, etc. For example, to calculate the total electric force $\vec{F}_{\text{total}}$ on a charge $q_2$ produced by other charges $q_1$ and $q_3$, one would sum the forces produced by each individual charge: $\vec{F}_{\text{total}} = \vec{F}_{12} + \vec{F}_{32}$. The challenge here is that forces are vectors, so vector addition is needed, as shown in [](#fig-1-2).

```{figure} ../images/ch-01/490703_1_En_1_Fig2_HTML.png
:label: fig-1-2
:alt: Classical superposition used to calculate the total electric force on one charge from two other charges


A classical superposition is used to calculate the total electric force on a charge $q_2$ due to charges $q_1$ and $q_3$
```


(sec-1-2)=
## 1.2 Quantum Superposition

Quantum superposition is a phenomenon associated with quantum systems. Quantum systems include small objects such as nuclei, electrons, elementary particles, and photons, for which the wave-particle duality and other non-classical effects are observed. A baseball can have an effectively continuous range of kinetic energies. In a **bound** quantum system, by contrast, energy may have only certain allowed values. For illustration, those values might be *E* = 0, 1, 2, 3, … in chosen units, with no allowed values between them. This is counterintuitive because the separation between energy levels in everyday objects is usually far too small to notice. In an atom, the separation can be large enough to matter, as shown in [](#fig-1-3). The discrete energy levels of hydrogen, for example, were essential to Bohr’s model. Quantum mechanics also permits continuous energies for some unbound systems.

```{figure} ../images/ch-01/490703_1_En_1_Fig3_HTML.png
:label: fig-1-3
:alt: Widely spaced allowed energy levels in a small quantum system become denser and appear continuous at a larger scale


Quantum effects associated with energy quantization are important at the atomic and subatomic distances. In this figure, the gray lines represent allowed energies. In quantum systems, the energies are quantized. As we zoom out of the quantum system to see it through a classical lens (represented by the downward arrow), the energies become more dense and appear continuous. This is the reason quantization is not noticeable in everyday objects
```


One aspect of quantum superposition can be explained using a coin analogy. A coin has a 50/50 probability of landing as either heads or tails, as shown in [](#fig-1-4).

```{figure} ../images/ch-01/490703_1_En_1_Fig4_HTML.png
:label: fig-1-4
:alt: A tossed coin has a 50% chance of landing on heads or tails


A tossed coin has a 50% chance of landing on heads or tails
```


**Question 1** While the coin is in the air, what do you know about whether it will land heads or tails? Does uncertainty about the outcome make the coin a quantum superposition?

Before the coin lands, we do not know whether the outcome will be heads or tails. Once it lands, it has a **definite state**, either heads or tails. This uncertainty is a useful analogy for the probabilities of quantum measurement, but a classical coin is not in a quantum superposition merely because its outcome is unknown. A quantum superposition also has relative phases between its amplitudes, which can produce interference, as we will see in Chapter 3.

At any given time, a system can be described as being in a particular state. The state is related to its quantized values. For example, a tossed coin is either in a heads state or a tails state. An electron orbiting a hydrogen atom could be in the ground state or an excited state. A quantum system is special because it can be in a superposition of distinct measurable states. The coin analogy helps describe the possible outcomes, but quantum amplitudes carry more information than an ordinary probability of heads or tails. The outcome of a measurement is to observe some definite state with a given probability.

In Schrödinger’s famous thought experiment, Schrödinger’s cat is placed in a closed box with a single atom that has some probability of emitting deadly radiation at any time. Since radioactive nuclear decay is a spontaneous process, it is impossible to predict for certain when the nucleus decays. Therefore, you do not know whether the cat is alive or dead unless you open and look in the box. ([Watch this video](https://www.youtube.com/watch?v=uWMTOrux0LM).)[^2] The thought experiment asks what happens if quantum rules that describe the atom are extended to the measuring device and the cat. In an idealized description, the combined system contains an alive-cat branch and a dead-cat branch. It does not establish that a real cat remains in an observable superposition until a person opens the box: interactions with the environment make such macroscopic coherence extremely difficult to preserve. Opening the box reveals one definite outcome.

Quantum systems can exist in a superposition state, and measuring the system will collapse the superposition state into one definite classical state. This might be hard to understand from a classical point of view, as we usually do not see quantum superposition with our human eyes (i.e., in macroscopic objects). Einstein was really bothered by this feature of quantum systems. His friend, Abraham Pais, records: “I recall that during one walk, Einstein suddenly stopped, turned to me, and asked whether I really believed that the moon exists only when I look at it.”[^3]

(sec-1-3)=
## 1.3 Big Ideas

1. A particle in a quantum superposition exists as a combination of different states at the same time.
2. Each possible state has a given probability of being observed, but measurement destroys the superposition because only one definite state is seen.

(sec-1-4)=
## 1.4 Activities

Quantum Tic-Tac-Toe in Worksheet [](#sec-10-3)

(sec-1-5)=
## 1.5 Check Your Understanding

1. Discuss whether the following quantities are quantized or continuous:
   - (a) electric charge
   - (b) time
   - (c) length
   - (d) cash
   - (e) paint color
2. An ink is created by mixing together 50% red ink and 50% yellow ink. An artist uses it to stamp a picture of a sun. If the ink behaves like a quantum system in a half-yellow, half-red quantum superposition, what are the different options for what the resulting picture could look like? Some options are shown in [](#fig-1-5).

   ```{figure} ../images/ch-01/490703_1_En_1_Fig5_HTML.png
   :label: fig-1-5
   :alt: Five suns illustrating possible color outcomes: yellow, red, orange, a yellow center with red rays, and a blended yellow-orange sun


   Image of the painted suns
   ```


3. If this controversial picture of a dress[^4] is always seen as blue/black by Student A and always seen as white/gold by Student B, is the dress in a quantum superposition?

[^1]: Tests of Bell inequalities support quantum predictions for entangled particles and rule out broad classes of local hidden-variable explanations. They do not, by themselves, show that one particle occupies two locations. See the [2022 Nobel Prize scientific background](https://www.nobelprize.org/uploads/2023/10/advanced-physicsprize2022-4.pdf).
[^2]: [https://www.youtube.com/watch?v=uWMTOrux0LM](https://www.youtube.com/watch?v=uWMTOrux0LM).
[^3]: Nielsen, M. A., & Chuang, I. L. (2000). *Quantum computation and quantum information*. New York: Cambridge University Press, p. 212.
[^4]: [https://en.wikipedia.org/wiki/The_dress](https://en.wikipedia.org/wiki/The_dress).
