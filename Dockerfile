FROM haskell:9.6

WORKDIR /app

COPY . .


RUN stack config set system-ghc --global true

RUN stack build

EXPOSE 3000

CMD ["stack", "run"]