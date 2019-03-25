FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN echo 'alias J="jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --port 8888"' >> ~/.bashrc

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    vim \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user


COPY . /usr/src/app
