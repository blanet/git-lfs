#!/usr/bin/env bash
# 生成 10 个随机的 LFS 对象 ID（SHA-256，64 位十六进制），写入 demo.ids
set -euo pipefail

out="${1:-demo.ids}"
count="${2:-10}"

: > "$out"
for ((i = 0; i < count; i++)); do
	# 取 32 字节随机数据，算 SHA-256 得到一个合法的 LFS OID
	openssl rand 32 | shasum -a 256 | cut -d' ' -f1 >> "$out"
done

echo "已写入 $count 个 LFS 对象 ID 到 $out"
