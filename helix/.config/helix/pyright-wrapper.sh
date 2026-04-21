#!/bin/bash
# Pyright wrapper that activates the uv-managed .venv if present

# Walk up from cwd to find project root (contains pyproject.toml or uv.lock)
find_project_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/pyproject.toml" || -f "$dir/uv.lock" ]]; then
            echo "$dir"
            return
        fi
        dir="$(dirname "$dir")"
    done
}

PROJECT_ROOT="$(find_project_root)"

if [[ -n "$PROJECT_ROOT" && -f "$PROJECT_ROOT/.venv/bin/activate" ]]; then
    source "$PROJECT_ROOT/.venv/bin/activate"
fi

exec pyright-langserver "$@"
