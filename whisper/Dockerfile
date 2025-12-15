FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    sox \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ggerganov/whisper.cpp.git /whisper
WORKDIR /whisper
RUN make -j

ENV PATH="/whisper:${PATH}"
WORKDIR /audio

CMD ["sleep", "infinity"]

