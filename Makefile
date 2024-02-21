run:
    go run main.go

gqlgen:
    go get github.com/99designs/gqlgen@v0.17.43

    go run github.com/99designs/gqlgen generate

build:
   
    docker-compose up -d --build postgres
    sleep 3;
    docker-compose up -d --build pokedex-app

stop:
    docker-compose down

createpokedoc:
    docker build . -t pokedex-app