FROM ubuntu:22.04 as loader

RUN apt-get update && apt-get install -y wget 

WORKDIR /temp

RUN if [ "$(uname -m)" = "x86_64" ]; then \
    wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.8.0.tgz; \
    tar -xzf mongodb-database-tools-ubuntu2204-x86_64-100.8.0.tgz; \
    mv mongodb-database-tools-ubuntu2204-x86_64-100.8.0 mongodb-database-tools; \
    else \
    wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-arm64-100.8.0.tgz; \
    tar -xzf mongodb-database-tools-ubuntu2204-arm64-100.8.0.tgz; \
    mv mongodb-database-tools-ubuntu2204-arm64-100.8.0 mongodb-database-tools; \
    fi

FROM ubuntu:22.04

COPY --from=loader /temp/mongodb-database-tools/bin /mongodb-tools

ENV PATH="${PATH}:/mongodb-tools"
