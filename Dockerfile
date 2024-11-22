FROM python:3.11-slim

MAINTAINER delameter <0.delameter@gmail.com>
LABEL org.opencontainers.image.source=https://github.com/delameter/docker-python-texlive
LABEL org.opencontainers.image.authors="A. Shavykin"

ENV DEBIAN_FRONTEND=noninteractive

ARG USER=pt
ARG GROUP=pt
ARG UID=1000
ARG GID=1000
ARG WORKDIR=/opt

RUN set -ex && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cm-super \
        curl \
        git \
        graphviz \
        latexmk \
        lpr \
        make \
        texlive-latex-recommended=2022.* \
        texlive-fonts-recommended=2022.* \
        texlive-latex-extra=2022.* \
        texlive-fonts-extra=2022.* \
        tex-gyre \
        dvipng \
        dvisvgm \
        && \
    rm -rf /var/lib/apt/lists/*

RUN set -ex && \
    addgroup --gid "${GID}" "${GROUP}" && \
    adduser \
        --disabled-password \
        --gecos "" \
        --home "/home/${USER}" \
        --ingroup "${GROUP}" \
        --uid "${UID}" \
        "${USER}" && \
    chown ${UID}:${GID} ${WORKDIR}

USER ${UID}:${GID}
WORKDIR ${WORKDIR}
ENV PATH="$PATH:/home/${USER}/.local/bin"
ENV PYTHONPATH="$PYTHONPATH:${WORKDIR}"

ARG IMAGE_VERSION=0
ARG IMAGE_BUILD_DATE=0
LABEL org.opencontainers.image.created=${IMAGE_BUILD_DATE}
LABEL org.opencontainers.image.version=${IMAGE_VERSION}
