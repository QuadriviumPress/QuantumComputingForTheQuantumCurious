#!/usr/bin/env bash
# Build the edited MyST book as a PDF. MyST can return zero even when LaTeX
# reports errors, so inspect its output and the resulting file before success.
set -euo pipefail

cd "$(dirname "$0")/.."
output=exports/quantum-computing-for-the-quantum-curious.pdf
log_file=$(mktemp)
text_file=$(mktemp)
trap 'rm -f "$log_file" "$text_file"' EXIT

rm -f "$output"
./node_modules/.bin/myst build --pdf 2>&1 | tee "$log_file"

if grep -Eq '(^Error:|LaTeX Error|Missing \$ inserted|Undefined control sequence|Collected error summary|Missing character:)' "$log_file"; then
  echo "PDF build reported a rendering error" >&2
  exit 1
fi
if [ ! -s "$output" ]; then
  echo "PDF build did not create $output" >&2
  exit 1
fi
pdfinfo "$output" >/dev/null
pdftotext "$output" "$text_file"
if grep -Eq 'Table Paragraph|Table Table [0-9]|:alt:' "$text_file"; then
  echo "PDF contains a broken table reference or figure caption" >&2
  exit 1
fi
echo "Built $output"
