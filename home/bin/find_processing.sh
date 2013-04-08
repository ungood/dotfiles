#!/bin/zsh

lvendor="${(L)1}"
uvendor="${(U)1}"
odin_key="com.amazon.warehousedeals.s3.${uvendor}"
bucket_name="amzn.wd.repair.${(L)2}.${lvendor}"
echo $odin_key

echo "bucket ${bucket_name}\nlist $3" | s3shell s3.amazonaws.com odin:$odin_key | grep -E "processing$"
