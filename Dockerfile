FROM golang:1.11-alpine
RUN apk add --no-cache git
WORKDIR /home/app
ONBUILD COPY go.mod .
ONBUILD RUN echo "download mod" \
            && go mod download
ONBUILD COPY . .
ONBUILD RUN echo "vendor mod" \
            && go mod vendor && \
            echo "install app" \
            && CGO_ENABLED=0 go install .