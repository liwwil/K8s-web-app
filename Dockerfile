FROM golang:latest AS builder

WORKDIR /app
COPY . .
RUN cd pokedexTest; CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o pokedex-app .

FROM scratch

WORKDIR /app
COPY --from=builder /app/pokedex-app .
CMD ["./pokedex-app"]