# 用于记录前端强求的日志
FROM golang:1.18-buster AS builder
ENV CGO_ENABLED=1 \
  GO111MODULE=on \
  GOPRIVATE=*.zx-tech.net \
  GOINSECURE=git.algor.tech \
  TZ=Asia/Shanghai
COPY . /go/src
WORKDIR /go/src
RUN go mod tidy
RUN go build -o pixel_log -v -ldflags "-s -w -X main.version='`git rev-parse --short HEAD`@`date '+%Y-%m-%d_%H:%M:%S_%Z_%z'`'" .

FROM debian:buster
COPY --from=builder /go/src/pixel_log /
WORKDIR /data
ENV TZ=Asia/Shanghai \
  LOG_LEVEL=0 \
  PARAMS=""
CMD ["sh","-c","/pixel_log $PARAMS > /data/run-pixel.log 2>&1"]
