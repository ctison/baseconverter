FROM golang:1

COPY . /baseconverter/
WORKDIR /baseconverter
ENV CGO_ENABLED=0
RUN go build github.com/chtison/baseconverter/cmd/baseconverter

FROM alpine

COPY --from=0 /baseconverter/baseconverter /usr/local/bin/baseconverter

ENTRYPOINT ["baseconverter"]
CMD ["serve", "--address=:51966"]
