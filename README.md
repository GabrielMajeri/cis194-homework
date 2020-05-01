# CIS 194 Solved Exercises

[![Build Status](https://dev.azure.com/gabrielmajeri6/gabrielmajeri6/_apis/build/status/GabrielMajeri.cis194-homework?branchName=master)](https://dev.azure.com/gabrielmajeri6/gabrielmajeri6/_build/latest?definitionId=2&branchName=master)

This repo contains my solutions to the homework exercises of the
[spring 2013 CIS 194 course](https://www.seas.upenn.edu/~cis194/spring13/lectures.html).

This is an excellent course for learning functional programming using Haskell.

## Building and Running

### With Docker

If you don't want to install Haskell locally, you can just use the provided
[Docker](https://www.docker.com/) image.

```sh
$ sudo docker-compose up -d
$ sudo docker-compose run stack stack test
```

### With locally installed stack

You can build and test the code with the tool [Stack](https://www.haskellstack.org/).

```sh
stack build
stack test
```

## License

All code in this repository is licensed under [MIT](LICENSE.txt).
