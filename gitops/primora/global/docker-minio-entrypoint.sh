#!/bin/sh
export MINIO_ROOT_PASSWORD=$(cat /run/secrets/minio_root_password_secret)

exec minio server /data --console-address ":9001"