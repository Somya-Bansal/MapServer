# Build Stage
FROM ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y clang cmake

## Add source code to the build stage.
ADD . /somya
WORKDIR /somya

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN mkdir build && \ 
    cd build/ && \
    CC=clang CXX=clang++ cmake ../fuzzers
    
# Package Stage
FROM ubuntu:20.04

## TODO: Change <Path in Builder Stage>
# COPY --from=builder /somya/build/ /