FROM python:3.8.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    libc-dev build-essential git

RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# clean up
RUN apt-get remove --purge -y && \
    rm -rf /var/lib/apt/lists/*
