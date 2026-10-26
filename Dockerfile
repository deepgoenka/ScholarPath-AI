FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy project metadata and README
COPY pyproject.toml uv.lock README.md ./

# Install dependencies without installing the project
RUN uv sync --frozen --no-dev --no-install-project

# Copy application source code
COPY src/ ./src/

# Install the ScholarPath AI package
RUN uv sync --frozen --no-dev

CMD ["uv", "run", "--no-sync", "python", "-m", "scholarpath"]
