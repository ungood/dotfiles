#!/bin/sh

echo "bucket $2\nlist $3" | s3shell s3.amazonaws.com odin:$1
