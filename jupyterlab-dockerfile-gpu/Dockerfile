FROM nvidia/cuda:11.8.0-runtime-ubuntu20.04

RUN apt update && apt install -y \
    curl \
    git-core \
    gcc \
    make \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libffi-dev

ARG VERSION=3.11.8
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/versions/$VERSION/bin:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT && \
    pyenv install $VERSION && \
    pyenv global $VERSION

COPY pyproject.toml poetry.lock /
RUN pip install -U pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

RUN jupyter lab --generate-config
COPY jupyter_lab_config.py /root/.jupyter/

RUN mkdir /root/home
CMD ["/bin/bash"]
