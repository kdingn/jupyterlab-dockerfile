FROM python:3.11.8

COPY pyproject.toml ./poetry.lock /
RUN pip install -U pip && pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

RUN jupyter lab --generate-config
COPY jupyter_lab_config.py /root/.jupyter/

RUN mkdir /root/home
CMD ["/bin/bash"]
