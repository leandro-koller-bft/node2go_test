FROM golang:1.19 AS downloader
WORKDIR /app
COPY . .
RUN go build main.go

FROM node:16
# vvv add this line
COPY --from=downloader /app/ /usr/src/app

# same as before
WORKDIR /usr/src/app
COPY . .
EXPOSE 3030
CMD [ "node", "./main.js" ]
