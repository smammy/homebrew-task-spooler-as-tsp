# Task Spooler installed as `tsp` (instead of `ts`)

## Overview

The core `task-spooler` formula installs a `ts` binary, which conflicts with the `ts` ("timestamp") binary in the `moreutils` formula. This formula renames Task Spooler's `ts` to `tsp`, like Debian does.

## Installation

`brew install smammy/task-spooler-as-tsp/task-spooler-as-tsp`

Or `brew tap smammy/task-spooler-as-tsp` and then `brew install task-spooler-as-tsp`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
