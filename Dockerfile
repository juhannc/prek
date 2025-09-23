# SPDX-FileCopyrightText: 2025 Johann Christensen
#
# SPDX-License-Identifier: MIT
ARG PYTHON_VERSION=latest
FROM python:${PYTHON_VERSION}

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/latest/download/prek-installer.sh | sh && mv /root/.local/bin/prek /usr/bin/prek
