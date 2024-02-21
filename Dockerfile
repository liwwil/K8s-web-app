FROM golang:latest AS builder 

WORKDIR /app
COPY ./pokedexTest /app/
RUN CGO_ENABLED=0 GOOS=linux go build -o pokedex-app .

FROM scratch

WORKDIR /app
COPY --from=builder /app/pokedex-app .
CMD ["./pokedex-app"]