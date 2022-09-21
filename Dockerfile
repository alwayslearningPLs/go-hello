FROM golang:alpine3.16 as base

WORKDIR /root/go/src/github.com/MrTimeout/go-hello
COPY . .

RUN go mod download && go mod verify && \
  CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags="-w -s" -o /go/bin ./...

FROM scratch

COPY --from=base /go/bin/go-hello /go-hello

CMD ["/go-hello"]
