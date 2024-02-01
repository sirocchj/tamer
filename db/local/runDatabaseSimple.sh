#!/usr/bin/env bash

trap 'trap - SIGTERM && kill 0' SIGINT SIGTERM EXIT

export LOG_LEVEL=INFO
export DATABASE_DRIVER=org.postgresql.Driver
export DATABASE_URL=jdbc:postgresql://localhost:5432/postgres
export DATABASE_USERNAME=postgres
export DATABASE_PASSWORD=example
export QUERY_FETCH_CHUNK_SIZE=5
export KAFKA_BROKERS=localhost:9092
export KAFKA_SCHEMA_REGISTRY_URL=http://localhost:8081
export KAFKA_CLOSE_TIMEOUT=10s
export KAFKA_BUFFER_SIZE=50
export KAFKA_SINK_TOPIC=sink
export KAFKA_SINK_AUTO_CREATE=on
export KAFKA_SINK_PARTITIONS=1
export KAFKA_SINK_REPLICAS=1
export KAFKA_STATE_TOPIC=state
export KAFKA_STATE_AUTO_CREATE=on
export KAFKA_STATE_PARTITIONS=1
export KAFKA_STATE_REPLICAS=1
export KAFKA_STATE_COMPACTION=on
export KAFKA_GROUP_ID=groupid
export KAFKA_CLIENT_ID=clientid
export KAFKA_TRANSACTIONAL_ID=transactionid

SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" || exit; pwd -P)
cd "$SCRIPT_PATH"/../.. || exit

sbt "example/runMain tamer.db.DatabaseSimple" -jvm-debug 5005