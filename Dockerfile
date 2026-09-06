# SPDX-FileCopyrightText: 2025 Johann Christensen
#
# SPDX-License-Identifier: MIT
ARG PYTHON_VERSION=latest
FROM python:${PYTHON_VERSION}

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    case "$(dpkg --print-architecture)" in \
        amd64|arm64) \
            curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/latest/download/prek-installer.sh | sh; \
            mv /root/.local/bin/prek /usr/bin/prek; \
            ;; \
        *) \
            apt-get update; \
            apt-get install --no-install-recommends -y \
                build-essential \
                cargo \
                pkg-config \
                rustc; \
            cargo install --locked --git https://github.com/j178/prek --bin prek; \
            mv /root/.cargo/bin/prek /usr/bin/prek; \
            apt-get purge -y --auto-remove \
                build-essential \
                cargo \
                pkg-config \
                rustc; \
            rm -rf /root/.cargo/registry /root/.cargo/git /var/lib/apt/lists/*; \
            ;; \
    esac
