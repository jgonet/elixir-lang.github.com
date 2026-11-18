#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

mise trust popcorn/mise.toml
mise install --cd popcorn
mise exec --cd popcorn -- mix local.hex --force
mise exec --cd popcorn -- mix local.rebar --force
mise exec --cd popcorn -- mix deps.get --check-locked
mise exec elixir@1.20.4-otp-29 erlang@29.0.6 -- pnpm run build
