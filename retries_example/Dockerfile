FROM golang:1.14-stretch AS builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 go build
RUN useradd -u 10001 scratchuser

FROM scratch

WORKDIR /app
COPY --from=builder /app/retries_example .
COPY --from=builder /etc/passwd /etc/passwd
USER scratchuser
ENTRYPOINT ["./retries_example"]