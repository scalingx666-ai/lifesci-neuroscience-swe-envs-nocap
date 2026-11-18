#!/bin/bash
set -uxo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd /workspace
mkdir -p /logs/verifier
rm -f /logs/verifier/reward.txt /logs/verifier/reward.json /logs/verifier/reward-details.json
CAPTURE_DIR="$(mktemp -d)" || exit 1
trap 'rm -rf -- "$CAPTURE_DIR"' EXIT
if ! python3 -I "$SCRIPT_DIR/capture.py" /workspace 7f7fe96021c0818e3ec696df3b774791d0c4be7f > "$CAPTURE_DIR/predicted.patch"; then
  echo "0.0" > /logs/verifier/reward.txt
  printf '%s' '{"final_reward": 0.0, "evaluation_status": "graded", "eval_trustworthy": false, "capture_status": "error"}' > /logs/verifier/reward-details.json
  exit 0
fi
rm -f /logs/verifier/predicted.patch
cp -- "$CAPTURE_DIR/predicted.patch" /logs/verifier/predicted.patch
: 'START_VERIFY_OUTPUT'
if ! python3 -I "$SCRIPT_DIR/verifier.py" \
    "$SCRIPT_DIR/oracle.patch" \
    "$CAPTURE_DIR/predicted.patch" \
    "$SCRIPT_DIR/instruction.md"; then
  rm -f /logs/verifier/reward.txt /logs/verifier/reward.json
  printf '%s' '{"final_reward": null, "reward": null, "evaluation_status": "ungraded", "eval_trustworthy": false, "verifier_status": "error"}' > /logs/verifier/reward-details.json
fi
: 'END_VERIFY_OUTPUT'
exit 0
