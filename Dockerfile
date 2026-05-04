FROM haskell:9.6

WORKDIR /app

COPY . .

RUN stack setup --system-ghc
RUN stack build --system-ghc

EXPOSE 3000

CMD ["stack", "run", "--system-ghc"]