# SPDX-FileCopyrightText: 2025 Johann Christensen
#
# SPDX-License-Identifier: MIT
FROM python:alpine
RUN apk add --no-cache curl git
RUN curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/latest/download/prek-installer.sh | sh && mv /root/.local/bin/prek /usr/bin/prek
ENTRYPOINT ["/usr/bin/prek"]
