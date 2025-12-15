#!/bin/bash
set -e

echo "🎙  Speak for 5 seconds..."
sox -d audio/input.wav trim 0 5

echo "📝 Transcribing..."
docker exec bolna-local-audio-whisper-1 /whisper/build/bin/whisper-cli \
  -m /audio/models/ggml-base.en.bin \
  -f /audio/input.wav \
  -otxt

TEXT=$(cat audio/input.wav.txt)
echo "🗣  You said: $TEXT"

echo "🧠 Thinking..."
RESPONSE=$(docker exec bolna-local-audio-ollama-1 \
  ollama run qwen2.5:3b "$TEXT")

echo "🤖 Agent: $RESPONSE"

echo "🔊 Speaking..."
echo "$RESPONSE" | docker exec -i bolna-local-audio-piper-1 piper \
  --model /audio/voices/en_US-amy-medium.onnx \
  --output_file /audio/out.wav

afplay audio/out.wav
