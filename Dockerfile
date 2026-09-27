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
            case "$(dpkg --print-architecture)" in \
                i386) rust_host=i686-unknown-linux-gnu ;; \
                armhf) rust_host=armv7-unknown-linux-gnueabihf ;; \
                *) echo "Unsupported architecture for source build fallback"; exit 1 ;; \
            esac; \
            apt-get update; \
            apt-get install --no-install-recommends -y \
                build-essential \
                pkg-config; \
            curl --proto '=https' --tlsv1.2 -LsSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-host "${rust_host}" --default-toolchain 1.96.0; \
            curl --proto '=https' --tlsv1.2 -fLsS -o /tmp/prek-source.tar.gz https://github.com/j178/prek/archive/refs/heads/master.tar.gz; \
            tar -xzf /tmp/prek-source.tar.gz -C /tmp; \
            /root/.cargo/bin/cargo install --locked --path /tmp/prek-master/crates/prek --bin prek; \
            mv /root/.cargo/bin/prek /usr/bin/prek; \
            rm -rf /tmp/prek-master /tmp/prek-source.tar.gz; \
            apt-get purge -y --auto-remove \
                build-essential \
                pkg-config; \
            rm -rf /root/.cargo /root/.rustup /var/lib/apt/lists/*; \
            ;; \
    esac
