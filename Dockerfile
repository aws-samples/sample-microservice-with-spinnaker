# A Go multistage docker file
FROM golang:alpine
RUN mkdir /build 
ADD . /build/
WORKDIR /build 
RUN go build -o main .
FROM alpine
ENV PORT 8080
EXPOSE 8080
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=0 /build/main /app/
WORKDIR /app
CMD ["./main"]
