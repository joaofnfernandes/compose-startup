## The problem

When deploying services that depend on one another, the `depends_on` keyword
in Docker Compose might not be enough. Docker Compose will respect the
dependency order, but it won't guarantee that the service is ready to receive
requests.

As an example, if your docker-compose.yml file has a Postgres database, and
a Postgres client, you need to make sure that the Postgres server container is
running, but you need to make sure the database itself is ready to accept
connections.

## A solution

Check the [official docs](https://docs.docker.com/compose/startup-order/), since
there's a couple of solutions there.

This repo is a working demo that shows how you can wrap your client container
to make it wait until the Postgres database is able to receive connections.

## How to use this

```
git clone https://github.com/joaofnfernandes/compose-startup.git
cd compose-startup

docker-compose up
```

You should see the `web_1` service actively waiting for the Postgres container
to be able to accept connections.

You can also remove the `depends_on` keyword in the docker-compose.yml file and
check that the client container still behaves as expected.
