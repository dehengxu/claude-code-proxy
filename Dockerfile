FROM ghcr.io/astral-sh/uv:bookworm-slim

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv sync --locked
ENV OPENAI_BASE_URL=https://openrouter.ai/api/v1

CMD ["uv", "run", "start_proxy.py"]
