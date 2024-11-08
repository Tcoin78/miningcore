#!/bin/bash

# This script checks if the CPU supports specific instruction sets.
# Usage: ./check_cpu.sh <instruction_set>

case "$1" in
    aes)
        grep -q aes /proc/cpuinfo && exit 0 || exit 1
        ;;
    sse2)
        grep -q sse2 /proc/cpuinfo && exit 0 || exit 1
        ;;
    sse3)
        grep -q sse3 /proc/cpuinfo && exit 0 || exit 1
        ;;
    ssse3)
        grep -q ssse3 /proc/cpuinfo && exit 0 || exit 1
        ;;
    avx)
        grep -q avx /proc/cpuinfo && exit 0 || exit 1
        ;;
    avx2)
        grep -q avx2 /proc/cpuinfo && exit 0 || exit 1
        ;;
    avx512f)
        grep -q avx512f /proc/cpuinfo && exit 0 || exit 1
        ;;
    *)
        echo "Unknown instruction set: $1"
        exit 1
        ;;
esac

