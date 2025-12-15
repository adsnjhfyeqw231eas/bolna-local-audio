FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    espeak-ng \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir piper-tts

WORKDIR /audio
CMD ["sleep", "infinity"]

