#!/bin/bash

OutDir=$1

# Manually set CPU flags instead of calling check_cpu.sh
export CPU_FLAGS="-maes -msse2 -msse3 -mssse3 -mavx -mavx2"
export HAVE_FEATURE="-D__AES__ -DHAVE_SSE2 -DHAVE_SSE3 -DHAVE_SSSE3 -DHAVE_AVX -DHAVE_AVX2"

(cd ../Native/libmultihash && make clean && make) && mv ../Native/libmultihash/libmultihash.so "$OutDir"
(cd ../Native/libetchash && make clean && make) && mv ../Native/libetchash/libetchash.so "$OutDir"
(cd ../Native/libethhash && make clean && make) && mv ../Native/libethhash/libethhash.so "$OutDir"
(cd ../Native/libubqhash && make clean && make) && mv ../Native/libubqhash/libubqhash.so "$OutDir"
(cd ../Native/libcryptonote && make clean && make) && mv ../Native/libcryptonote/libcryptonote.so "$OutDir"
(cd ../Native/libcryptonight && make clean && make) && mv ../Native/libcryptonight/libcryptonight.so "$OutDir"

((cd /tmp && rm -rf RandomX && git clone https://github.com/tevador/RandomX && cd RandomX && git checkout tags/v1.1.10 && mkdir build && cd build && cmake -DARCH=native .. && make) && (cd ../Native/librandomx && cp /tmp/RandomX/build/librandomx.a . && make clean && make) && mv ../Native/librandomx/librandomx.so "$OutDir")
((cd /tmp && rm -rf RandomARQ && git clone https://github.com/arqma/RandomARQ && cd RandomARQ && git checkout 14850620439045b319fa6398f5a164715c4a66ce && mkdir build && cd build && cmake -DARCH=native .. && make) && (cd ../Native/librandomarq && cp /tmp/RandomARQ/build/librandomx.a . && make clean && make) && mv ../Native/librandomarq/librandomarq.so "$OutDir")
