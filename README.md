<!---
SPDX-FileCopyrightText: 2025 Johann Christensen

SPDX-License-Identifier: MIT
-->
# prek

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/juhannc/prek/main.svg)](https://results.pre-commit.ci/latest/github/juhannc/prek/main)
[![GitHub Container Registry](https://img.shields.io/badge/GitHub%20Container%20Registry-available-green?logo=github)](https://ghcr.io/juhannc/prek)
[![GitHub license](https://img.shields.io/github/license/juhannc/prek)](https://github.com/juhannc/prek/blob/main/LICENSES/MIT.txt)

A collection of pre-build images for running pre-commit hooks using [prek](https://github.com/j178/prek).
Available on [GitHub Container Registry](https://ghcr.io/juhannc/prek).

## Available images

| Image          | GitHub Container Registry           |
| -------------- | ----------------------------------- |
| `latest`       | `ghcr.io/juhannc/prek:latest`       |
| `3.15-rc`     | `ghcr.io/juhannc/prek:3.15-rc`     |
| `3.15-rc-slim` | `ghcr.io/juhannc/prek:3.15-rc-slim` |
| `3.14`         | `ghcr.io/juhannc/prek:3.14`         |
| `3.14-slim`    | `ghcr.io/juhannc/prek:3.14-slim`    |
| `3.13`         | `ghcr.io/juhannc/prek:3.13`         |
| `3.13-slim`    | `ghcr.io/juhannc/prek:3.13-slim`    |
| `3.12`         | `ghcr.io/juhannc/prek:3.12`         |
| `3.12-slim`    | `ghcr.io/juhannc/prek:3.12-slim`    |

`latest` tracks the newest stable Python release (currently 3.14). The `3.15-rc` images use the Python 3.15 release candidate; they are preview images until Python 3.15 final is released.

Each image is published as a multi-architecture manifest for:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`
- `linux/386`
