FROM python:3-slim AS builder
ADD main.py /app/main.py
WORKDIR /app

RUN pip install --target=/app requests
RUN pip install --target=/app -U pip setuptools wheel
RUN pip install --target=/app ruamel.yaml
RUN pip install --target=/app importlib-metadata

FROM python:3-slim
COPY --from=builder /app /app
WORKDIR /app
ENV PYTHONPATH /app
CMD ["python", "/app/main.py"]
