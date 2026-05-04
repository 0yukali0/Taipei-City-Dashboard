FROM python:3.11-slim

WORKDIR /root

# 安裝系統依賴
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 複製並安裝 Python 依賴
RUN --mount=type=cache,sharing=locked,mode=0777,target=/root/.cache/uv,id=uv \
    --mount=from=ghcr.io/astral-sh/uv:0.11.8,source=/uv,target=/usr/bin/uv \
	--mount=type=bind,target=requirements.txt,src=requirements.txt \
    uv venv -p 3.11 && \
	uv pip install -r requirements.txt

WORKDIR /app

ENV PATH="/root/.venv/bin:$PATH" \
    UV_PYTHON=/root/.venv/bin/python

# 複製腳本
COPY upgrade_vector_db.py .

# 預設指令
CMD ["python", "upgrade_vector_db.py"]
