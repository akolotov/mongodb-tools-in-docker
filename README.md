Dockerized Mongo Database Tools
====

This repo allows to compose docker images for x86_64/arm64 platforms
containing [Mongo Database Tools](https://www.mongodb.com/docs/database-tools/).

## How to build

```
docker build -t mongodb-tools .
```

## How to use

```
docker pull akolotov/mongodb-tools-in-docker:main
docker run -ti --rm akolotov/mongodb-tools-in-docker:main mongoexport --help
``` 
