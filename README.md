# Ticket system

This repository is my personal practical project of the [Backend master class](https://bit.ly/backendmaster) course by [TECH SCHOOL](https://dev.to/techschoolguru).

![Backend master class](backend-master.png)

In this backend master class, we’re going to learn everything about how to design, develop, and deploy a complete backend system from scratch using PostgreSQL, Golang and Docker.

# System overview
```
erDiagram
  users {
    id integer
    wallet_address varchar(255)
    name varchar(255)
    avatar_url varchar(1000)
    created_at timestamp
    updated_at timestamp
    primaryKey(id)
  }
  event {
    id integer
    author_id integer
    name string
    description string
    created_at timestamp
    updated_at timestamp
    primaryKey(id, author_id)
  }
  posts {
    id integer
    title varchar
    body text
    user_id integer
    status varchar
    created_at timestamp
    primaryKey(id)
    foreignKey(user_id) references users(id)
  }



## Setup local development

### Install tools

- [Docker desktop](https://www.docker.com/products/docker-desktop)
- [TablePlus](https://tableplus.com/)
- [Golang](https://golang.org/)
- [Homebrew](https://brew.sh/)
- [Migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

    ```bash
    brew install golang-migrate
    ```

- [Sqlc](https://github.com/kyleconroy/sqlc#installation)

    ```bash
    brew install golang-migrate
    ```

### Setup infrastructure

- Start postgres container:

    ```bash
    make postgres
    ```

- Create simple_bank database:

    ```bash
    make createdb
    ```

- Run db migration:

    ```bash
    make migrateup
    ```

### How to run

- Run test:

    ```bash
    make test
    ```