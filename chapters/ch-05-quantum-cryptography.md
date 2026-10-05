---
title: 5. Quantum Cryptography
short_title: "Ch. 5 — Cryptography"
label: ch-5
doi: 10.1007/978-3-030-61601-4_5
---

The Internet can be thought of as a channel of information being sent from you to everyone else connected to the Internet. If you wanted to transmit your sensitive information (such as bank account numbers or military secrets) over the Internet, then you have to ensure that only the persons you intend to read your information have access to your sensitive data. Otherwise, everyone would be able to read your information, e.g., access your bank account details and transfer money out of your account. Therefore, one needs to encrypt any data sent over the Internet. Encryption, in this context, ensures that only the intended sender and receiver can understand any message being sent over an Internet channel.

(sec-5-1)=
## 5.1 Cryptography Fundamentals

Encryption relies on the sender and receiver sharing a secret key (that no one else has) and using that to encrypt and decrypt messages. In this way, since no one else has the secret key, no one else can understand the shared information. Because no one else understands the shared information, they cannot misuse it for their own benefit.

A one-time pad can provide perfect secrecy if the key is truly random, at least as long as the message, kept secret, and never reused.[^1] Alice and Bob must already share that key securely. The shared key encrypts the message to create the cipher, and the cipher is decoded by decrypting with the shared key. The protocol is best understood by trying it out with the associated worksheets in Sect. [](#sec-10-7). In practice, due to not having a secure channel to share such a complicated key, despite being unbreakable, this method is usually not employed.[^2] Here we see the fundamental caveat with encryption: you require a secure channel to share the secret key (if you do not have a secure channel then someone random can just take the secret key and encryption would be pointless), but if you have a secure channel then why do you need to encrypt your data? You need a way around this issue. How do you share a secret key in an insecure channel, where anyone can be listening?

(sec-5-2)=
## 5.2 Classical Cryptography

The way around sharing a secret key in an insecure channel in the majority of online communications is called public key cryptography.[^3] A person called Alice makes two keys such that each key knows that only the other key is related to it (think of the keys as siblings). They are called the private and public keys. Alice then gives the public key to everyone in the world but importantly keeps the private key for herself. Anybody else, say Bob, who wants to send a private message to Alice has to encrypt their message with the public key that Alice generated. There are many different types of encryption protocols that one can use. The special part of public key cryptography is that *only* Alice's private key can decrypt the message that was encrypted using its sibling public key. In this way, only Alice can read the message from Bob. As no one else has Alice's private key, no one else can read Bob's message. However, if Bob did not use Alice's public key but used a different public key to encrypt his message, then Alice cannot decrypt that message, as her private key is not a sibling key of the different public key. This whole cryptography scheme relies on the fact that no one can break the encryption protocol. If they could break it, then they could read Alice's message even if they did not have Alice's private key.

RSA is one well-known public-key cryptosystem. RSA encryption relies on encrypting messages with keys that are made out of very large integers. To break the encryption protocol, an eavesdropper would need to factorize this very large integer into its (prime) factors. No efficient classical algorithm is known for factoring appropriately chosen large integers.[^4] For example, given two large prime numbers *p* and *q*, it takes just a fraction of a second to multiply these two prime numbers together to produce a large integer *c* = *pq*. For suitably chosen large primes, recovering *p* and *q* from *c* is computationally difficult with known classical methods; the time depends on the key size and available hardware.

RSA encryption works by encrypting the message with the public key. Decrypting the message by brute force requires factorizing a large integer in the public key, which would take thousands of years. However, the private key related to the public key knows how to check the prime factors of the public key and can decrypt the message easily. An attacker might instead steal a private key or exploit a software weakness. Protecting keys and systems is therefore as important as choosing sound cryptography. Other public-key schemes and symmetric ciphers have different mathematical foundations; Internet security does not rest on RSA alone.

In 1994, Peter Shor described a quantum algorithm that could factor large integers efficiently on a sufficiently capable, fault-tolerant quantum computer. Shor's algorithm[^5] threatens RSA and other public-key schemes based on factoring or discrete logarithms; it does not break every form of encryption. This is one reason to develop and deploy quantum-resistant public-key cryptography. The details of Shor's algorithm are beyond our scope, so we will instead discuss quantum key distribution, which uses quantum states to establish a shared key over a channel that may be observed by an eavesdropper. The public classical discussion must still be authenticated.

```{note}
Quantum-resistant public-key algorithms provide another response to this threat. [NIST standardized its first post-quantum algorithms in 2024](https://csrc.nist.gov/Projects/Post-Quantum-Cryptography/Post_Quantum_Cryptography-Standardization). These are classical algorithms designed to resist known quantum attacks; they are distinct from quantum key distribution.
```

Together, the one-time pad and **quantum key distribution** (QKD) could be a useful combination. The BB84 QKD[^6] activity uses electron spin and a Stern–Gerlach apparatus as an idealized teaching model. Practical implementations commonly use photons. The following outline shows the central idea, not a complete security protocol.

(sec-5-3)=
## 5.3 BB84 Quantum Key Distribution

### 5.3.1 Before Sending the Message

The sender (Alice) and receiver (Bob) publicly agree to the relationship between spin states and bit values shown in [](#tbl-5-1).

:::{table} Table for the relationship between spin states and bit values for quantum cryptography
:label: tbl-5-1
:enumerator: 5.1

| Spin | *↑* | $\leftarrow$ | *↓* | $\rightarrow$ |
| --- | --- | --- | --- | --- |
| Bit value | 0 | 0 | 1 | 1 |
:::

### 5.3.2 Quantum Part

1. Alice randomly chooses either the *x*- or *z*-basis (horizontal or vertical Stern–Gerlach apparatus).
2. Alice randomly chooses a bit value, prepares an electron in the corresponding spin state of her chosen basis, records the bit value, and sends the electron to Bob.
3. Bob randomly chooses either the *x*- or *z*-basis.
4. Bob measures the spin of the electron and records whether it was 0 or 1.
5. Repeat steps 1–4 until the desired level of security is achieved.

### 5.3.3 Example

Alice sends five electrons to Bob. When Alice sends an electron prepared in one basis and Bob measures in the same basis, they measure the same spin. However, if Bob measures in a different basis than Alice, then the electron will be in a superposition state and there will be a 50% probability of the state collapsing into 0 or 1. Example values for the first three bits of a BB84 experiment are shown in Fig. [](#fig-5-1). Can you fill in the last two bits?

```{figure} ../images/ch-05/490703_1_En_5_Fig1_HTML.png
:label: fig-5-1
:alt: Five BB84 rounds show Alice's chosen z or x basis and spins, Bob's chosen bases, and blank values for the final two rounds to complete


Alice's and Bob's measurements of the BB84 protocol
```


### 5.3.4 Classical Post-processing

1. Alice and Bob publicly share the basis used for each bit measurement *without revealing the actual bit value they measured.*
2. If they measured in the same basis, they keep that bit. If they measured in a different basis, they discard that bit. This is shown in Fig. [](#fig-5-2). For an ideal noiseless channel without an eavesdropper, their retained bits agree. Real channels can introduce errors even without eavesdropping.

   ```{figure} ../images/ch-05/490703_1_En_5_Fig2_HTML.png
   :label: fig-5-2
   :alt: Five completed BB84 rounds; rounds with mismatched bases are shaded gray, leaving the shared example key 01


   Alice and Bob's measurements of the BB84 protocol completed from Fig. [](#fig-5-1). The discarded bits are grayed out, and the key is 01
   ```

3. They publicly compare a sample of retained bits to estimate the error rate, then discard those revealed bits. A low sampled error rate does not prove that no eavesdropping occurred. A practical protocol also corrects errors and uses privacy amplification to make a shorter secret key.

(sec-5-4)=
## 5.4 Detecting an Eavesdropper

If Eve hears only the publicly announced bases, she does not learn Alice’s randomly chosen bit values from that announcement alone. Alice and Bob must authenticate this public discussion so Eve cannot impersonate either party. One simple eavesdropping strategy is for Eve to measure each transmitted state before it reaches Bob and then send on a replacement state. This can be potentially dangerous for Alice and Bob. However, as the basis is not shared during the transmission, Eve must randomly pick a basis to measure the qubit intercepted from Alice. If Alice and Bob randomly choose to measure in a different basis, they throw away all the bits and it does not matter which basis Eve chooses. If Alice and Bob randomly choose to measure in the same basis then there are two outcomes depending on what Eve does: (1) If Eve randomly chooses the same basis as Alice, then she does not alter the state. This is bad, as Eve has successfully obtained information by eavesdropping without Alice and Bob knowing. (2) If Eve randomly chooses a different basis than Alice, then she alters the state and puts it into a superposition. Even though Bob is using the same basis as Alice, due to Eve altering the state, Alice and Bob can have a different spin measurement. This is how they can catch an eavesdropper.

### 5.4.1 Example

The eavesdropping situation is shown in Fig. [](#fig-5-3). If Eve chooses the same basis as Alice, the spin is unchanged when it gets to Bob (bit #1). If Eve chooses a different basis than Alice, the spin could be different when it gets to Bob (bits #2 and #3). Eve could get lucky and Bob's bit could agree with Alice (bit #2). However, Bob is equally likely to measure something different from Alice (bit #3). Can you fill in what might happen with bits #4 and #5?

```{figure} ../images/ch-05/490703_1_En_5_Fig3_HTML.png
:label: fig-5-3
:alt: Intercept-and-resend example: Eve chooses a different basis from Alice in some rounds, and Bob's third bit differs from Alice's


An example of how to catch an eavesdropper using the BB84 protocol
```


When Alice and Bob compare a portion of their key bits, a discrepancy would indicate the presence of an eavesdropper. A sample with no discrepancies limits the likelihood of this particular intercept-and-resend attack, but it cannot establish perfect secrecy. Security depends on the channel error rate, sample size, authenticated discussion, and subsequent key processing.

(sec-5-5)=
## 5.5 Big Ideas

1. RSA security depends on the difficulty of factoring appropriately chosen large integers with known classical methods; secure communication also depends on protecting keys and implementations.
2. Shor's algorithm could threaten factoring-based public-key cryptography on a sufficiently capable quantum computer.
3. BB84 illustrates quantum key distribution. Its full security requires authenticated classical communication, error estimation, and key processing; quantum-resistant classical cryptography is another approach.

(sec-5-6)=
## 5.6 Activities

One-time Pad for Alice/Bob in Worksheet [](#sec-10-7)

BB84 Quantum Key Distribution for Alice/Bob/Eve in Worksheet [](#sec-10-8)

For those interested in hands-on experiments, see QuTools[^7]

(sec-5-7)=
## 5.7 Check Your Understanding

1. If Alice and Bob exchange 1 million bits in order to use the BB84 quantum cryptography protocol, approximately how long will their bit-key string be? Assume they do not check for eavesdropping.
2. Alice and Bob share their lists of measurement bases, but do not share any more information about the bits. What is the probability that Eve will guess the correct bit for a single bit-key?
3. Alice and Bob perform 20 bit-key measurements but do not share any information about the bits. What is the probability that Eve will guess the correct 20-bit key?
4. If Eve tries all possible key combinations with the one-time pad, can she crack the one-time pad?
5. In the simple intercept-and-resend model, if Eve measures each electron with a Stern–Gerlach apparatus between Alice and Bob, what percentage of retained bits will agree with Alice's value?
6. In that same idealized model, if Alice and Bob compare 20 retained bits, what is the probability that all 20 agree despite Eve intercepting every electron?
7. Suppose that Eve discovers that the no-cloning theorem is wrong and finds a way to clone the state of each photon. How could she use a cloning machine to learn about the entire key without leaving any trace?

[^1]: Shannon, Claude (1949). "Communication Theory of Secrecy Systems." *Bell System Technical Journal*. 28 (4): 656–715. [https://doi.org/10.1002/j.1538-7305.1949.tb00928.x](https://doi.org/10.1002/j.1538-7305.1949.tb00928.x).

[^2]: [https://en.wikipedia.org/wiki/One-time_pad](https://en.wikipedia.org/wiki/One-time_pad).

[^3]: [https://en.wikipedia.org/wiki/Public-key_cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography).

[^4]: [https://en.wikipedia.org/wiki/Integer_factorization](https://en.wikipedia.org/wiki/Integer_factorization).

[^5]: P. W. Shor, “Algorithms for quantum computation: discrete logarithms and factoring,” *Proceedings of the 35th Annual Symposium on Foundations of Computer Science* (1994), [IEEE publication record](https://ieeexplore.ieee.org/document/365700/), DOI 10.1109/SFCS.1994.365700.

[^6]: [https://www.st-andrews.ac.uk/physics/quvis/simulations_html5/sims/cryptography-bb84/Quantum_Cryptography.html](https://www.st-andrews.ac.uk/physics/quvis/simulations_html5/sims/cryptography-bb84/Quantum_Cryptography.html).

[^7]: [https://www.qutools.com/quantenkoffer_science-kit/](https://www.qutools.com/quantenkoffer_science-kit/).
