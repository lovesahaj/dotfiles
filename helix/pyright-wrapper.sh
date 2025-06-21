#!/bin/bash
set -euxo pipefail # Keep debug flags for now

echo "Wrapper script started"

# Add your environment activation or setup logic here if needed.
# Example:
# if [ -f ".venv/bin/activate" ]; then
#     echo "Activating .venv"
#     source .venv/bin/activate
# fi

echo "Executing pyright with args: $@"
# Pass ONLY the arguments received by the script ($@)
exec pyright "$@"
