# MyST editorial review

Started 2026-09-29. This is the progress record for the student-facing pages in
`myst.yml`. The earlier [`TYPO-REPORT.md`](../TYPO-REPORT.md) is a historical
finding list; recheck each suggestion against the current text before applying
it. Its chapter 7–10 findings were rechecked after this pass; most were already
resolved in the current text, and the remaining heading and prose issues were
corrected. Changes here adapt the 2021 CC BY 4.0 source edition, which is credited in
[`SOURCES.md`](../SOURCES.md).

## Page status

| Page | Editorial pass | Notes |
| --- | --- | --- |
| `index.md` | Reviewed 2026-09-29 | Landing page now identifies this as an edited adaptation. |
| `chapters/ch-01-introduction-to-superposition.md` | Reviewed 2026-09-29 | Clarified classical coin analogy, bound energy levels, Bell tests, and cat thought experiment; improved two figure descriptions. |
| `chapters/ch-02-what-is-a-qubit.md` | Reviewed 2026-09-29 | Corrected amplitude versus probability, state reconstruction, unitary evolution versus measurement, and qubit hardware descriptions. |
| `chapters/ch-03-creating-superposition-the-beam-splitter.md` | Reviewed 2026-09-29 | Corrected beam-splitter figure caption, photon-source and interference explanations, and truncated alternative text. |
| `chapters/ch-04-creating-superposition-stern-gerlach.md` | Reviewed 2026-09-29 | Corrected the silver-atom history, measurement-basis explanation, and no-cloning claim; described the exercise diagrams. The earlier duplicated-ket finding is already resolved in current text. |
| `chapters/ch-05-quantum-cryptography.md` | Reviewed 2026-09-29 | Replaced absolute RSA and BB84 security claims, corrected Shor's date, explained authentication and key processing, and described the protocol diagrams. |
| `chapters/ch-06-quantum-gates.md` | Reviewed 2026-09-29 | Corrected no-cloning and measurement explanations, removed a false classical-error claim, and improved circuit and histogram descriptions. |
| `chapters/ch-07-entanglement.md` | Reviewed 2026-09-29 | Distinguished entanglement from classical correlation, scoped Bell's theorem, corrected complex-amplitude probabilities and no-signaling claims, and inspected the circuit figures. Figure 7.4 retains the source raster's real-amplitude shorthand; its caption explains the limit. |
| `chapters/ch-08-quantum-teleportation.md` | Reviewed 2026-09-29 | Corrected the resource and classical-message explanation, distinguished Bob's local statistics from conditional states, corrected complex-amplitude answer choices, and expanded the circuit description. |
| `chapters/ch-09-quantum-algorithms.md` | Reviewed 2026-09-29 | Removed automatic-speedup and readable-memory claims, clarified Deutsch–Jozsa query complexity and classical comparison, updated hardware context and figure descriptions, and repaired the final exercise. |
| `chapters/ch-10-worksheets.md` | Reviewed 2026-09-29 | Clarified the limits of game analogies, refreshed Composer guidance, improved simulator screenshot descriptions, specified one-time-pad conditions, and added BB84 sampling and authentication context. |

## Evidence for substantive corrections

- [OpenStax, *University Physics 3*, §7.4](https://openstax.org/books/university-physics-volume-3/pages/7-4-the-quantum-particle-in-a-box) distinguishes discrete bound-state energies from continuous energies of a free particle.
- [IBM Quantum, *Quantum computing fundamentals*](https://quantum.cloud.ibm.com/learning/en/courses/quantum-business-foundations/quantum-computing-fundamentals) distinguishes classical uncertainty from quantum superposition and explains squared-magnitude probabilities.
- [IBM Quantum, *General measurements*](https://quantum.cloud.ibm.com/learning/courses/general-formulation-of-quantum-information/general-measurements/introduction) describes state tomography from independently prepared copies; [IBM Quantum, *Quantum mechanics basics*](https://quantum.cloud.ibm.com/learning/en/courses/use-a-qc-today/quantum-mechanics-basics) distinguishes unitary gates from measurement.
- [NIST, *Single-Photon Sources and Detectors Dictionary*](https://nvlpubs.nist.gov/nistpubs/ir/2023/NIST.IR.8486.pdf) distinguishes an attenuated laser from a guaranteed single-photon source.
- [2022 Nobel Prize scientific background](https://www.nobelprize.org/uploads/2023/10/advanced-physicsprize2022-4.pdf) describes what Bell tests rule out; [Zurek, *Decoherence, einselection, and the quantum origins of the classical*](https://journals.aps.org/rmp/abstract/10.1103/RevModPhys.75.715) explains why macroscopic cat states are difficult to maintain.
- [IBM Quantum's Stern–Gerlach module](https://quantum.cloud.ibm.com/learning/en/modules/quantum-mechanics/stern-gerlach-measurements-with-qiskit) identifies the original silver-atom beam and distinguishes state preparation from measurement; its [no-cloning lesson](https://quantum.cloud.ibm.com/learning/en/courses/basics-of-quantum-information/quantum-circuits/limitations-on-quantum-information) states the universal-copying limit.
- [Shor's 1994 conference paper](https://doi.org/10.1109/SFCS.1994.365700), [NIST's post-quantum standards project](https://csrc.nist.gov/Projects/Post-Quantum-Cryptography/Post_Quantum_Cryptography-Standardization), and [IBM Quantum's BB84 caveats](https://quantum.cloud.ibm.com/learning/en/modules/computer-science/quantum-key-distribution) support the cryptography corrections. A [NIST QKD standards overview](https://www.nist.gov/system/files/documents/2025/05/01/Worldwide_standardization_activity_for_quantum_key_distribution.pdf) lists authentication, error correction, and privacy amplification in the classical portion of the protocol.
- [IBM Quantum's Bell module](https://quantum.cloud.ibm.com/learning/en/modules/quantum-mechanics/bells-inequality-with-qiskit) explains the local-model limit; its [teleportation course](https://quantum.cloud.ibm.com/learning/en/courses/utility-scale-quantum-computing/teleportation) explains why the classical message prevents faster-than-light communication.
- [IBM Quantum's Deutsch–Jozsa course](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms/quantum-query-algorithms/deutsch-jozsa-algorithm) gives the one-query quantum and $2^{n-1}+1$ worst-case deterministic classical comparison. Its [Grover course](https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms/grover-algorithm/introduction) gives the quadratic unstructured-search query gain.
- [IBM Quantum Composer documentation](https://quantum.cloud.ibm.com/docs/en/guides/composer) describes the current interface and distinguishes live state visualizations from sampled run results.

## Verification and next work

- `npm run verify` passed after the complete 11-page editorial pass: 231 unique
  labels, 125 internal references, and 109 figures with alternative text. Its 639 unused-image warning includes
  extracted source assets under `work/epub` and needs classification before
  deleting anything.
- `myst build --site --strict` passed after the chapter 7–10 edits with the local npm-version probe shim.
  `npm run check` reached and built all 11 pages, then failed on 48 external
  link checks in this network-restricted environment. A separate strict HTML
  attempt stopped at `uv_interface_addresses` in this environment. Re-run the
  production-equivalent check where network interfaces and outbound links work.
- The fleet audit now reports zero missing or weak image descriptions on this
  book's TOC pages. This does not certify the accuracy of every description.
- The source edition embeds numbered questions and short answers in the
  narrative. Converting them wholesale to exercise/solution directives would
  change the reading sequence and often hide immediate feedback, so retain
  that presentation exception for this edition. Review individual questions
  for optional enhancement only when the teaching sequence benefits.
- **2026-09-30 print pass:** Added `npm run build:pdf`, a local XeLaTeX book
  template, and a MyST `project.exports` entry for the ten chapters. The
  template provides a title page, source attribution, contents, and
  bibliography. A fresh build produced a 107-page, 8.3 MB PDF from the edited
  Markdown. The build script checks the log, validates the PDF, and scans
  extracted text for malformed table references and literal `:alt:` text.
- Print inspection exposed a MyST option-placement problem in 91 figure
  directives: a blank line before `:alt:` printed the option as caption text.
  Those option blocks are now normalized. Six paragraph labels that rendered
  as “Table Paragraph” references became structured table directives; the
  duplicate literal “Table” before table cross-references was removed.
  Printable write-in lines were added to worksheet table cells that otherwise
  collapsed in the PDF. The verifier now checks these markup patterns.
- Final checks on 2026-09-30: all 15 verifier checks passed; strict MyST site
  build passed for all 11 pages; `npm run build:pdf` completed and `pdfinfo`
  validated the export. A text scan found no `Table Paragraph`, duplicate
  `Table Table`, or literal `:alt:` in the PDF. The generated PDF is ignored by
  Git and is a local build artifact; the current site deploy does not yet
  publish it as a download.
- The 639 unused-image warning still needs provenance review before any
  source-image copies are removed. Full HTML/link verification still requires
  a network-capable environment.
