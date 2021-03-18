FROM debian:10 as base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y haskell-platform libglpk-dev && rm -rf /var/lib/apt/lists/* 
FROM base as haskell
COPY . /solver/
WORKDIR /solver
RUN cabal update
RUN cabal install threepenny-gui
FROM haskell as rmk
RUN cabal sandbox init
RUN cabal install --only-dependencies
RUN cabal configure
RUN cabal build