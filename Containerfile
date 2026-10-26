FROM docker.io/library/golang:1.26-bookworm AS cue
RUN CGO_ENABLED=0 go install cuelang.org/go/cmd/cue@v0.17.1

FROM docker.io/library/python:3.12-slim-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=cue /go/bin/cue /usr/local/bin/cue
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 CUE=/usr/local/bin/cue
WORKDIR /repo
