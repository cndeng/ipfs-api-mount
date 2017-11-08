#!/bin/sh

function cleanup {
	fusermount -u "$tmp_mnt" || true
	rmdir "$tmp_mnt" || true
}
trap cleanup EXIT

tmp_mnt=$(mktemp -d)
python ipfs_api_mount.py QmXKqqUymTQpEM89M15G23wot8g7n1qVYQQ6vVCpEofYSe "$tmp_mnt" 

if [ "$(ls -l "$tmp_mnt")" != "\
total 0
dr--r--r-- 0 root root  4 1970-01-01  aaa
-r--r--r-- 0 root root 19 1970-01-01  bbb" ]; then
	echo failed
	exit 1
fi