# Using ubuntu instead of alpine because alpine has problems with CUDA support
# and pytorch may not work even when running on CPU
FROM python:3.6-slim

RUN apt-get update && \
    apt-get -y install \
      build-essential \
      cmake \
      unixodbc-dev \
      libopenblas-dev \
      gfortran \
      libfreetype6-dev \
      libpng-dev \
      wget \
      unzip \
      pkg-config

WORKDIR /c2dh-nerd

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

COPY . .

EXPOSE 8002

ENV PYTHONPATH=/c2dh-nerd

CMD ["python", "-m", "c2dh_nerd"]
