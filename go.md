# Go

## [Install](https://golang.org/doc/install#install)

- Check latest go version [here](https://golang.org/dl/)

- Download, verify and install and delete unneeded files

    ```bash
    $ cd $HOME
    $ wget -O go.tar.gz https://golang.org/dl/go1.14.6.linux-amd64.tar.gz
    # OR
    $ wget -O go.tar.gz https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz
    $ echo "5c566ddc2e0bcfc25c26a5dc44a440fcc0177f7350c1f01952b34d5989a0d287 go.tar.gz" | sha256sum --check
    go.tar.gz: OK
    $ sudo rm -rf /usr/local/go/
    $ sudo tar --directory=/usr/local/ -xzf go.tar.gz
    $ rm go.tar.gz
    ```

- Add Go instalation path to $PATH and

    ```bash
    # add lines below to $HOME/.bashrc or $HOME/.profile
    # option 1
    export PATH=$PATH:/usr/local/go/bin
    # option 2
    export GOROOT=/usr/local/go
    export PATH=$PATH:$GOROOT/bin

    # and source it, e.g. for $HOME/.bashrc
    $ source $HOME/.bashrc
    ```

- Create a `go` folder in `$HOME` and `bin` folder inside it

    ```bash
    $ mkdir -p $HOME/go/
    $ mkdir -p $HOME/go/bin/
    ```

- Add $GOPATH
    - [Optional environment variables](https://golang.org/doc/install/source#environment)

    ```bash
    # add lines below to $HOME/.bashrc or $HOME/.profile
    # option 1
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    # option 2
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    export PATH=$PATH:$GOBIN

    # sourcing new change, if change was added to $HOME/.bashrc file
    $ source $HOME/.bashrc
    ```

## [Uninstall](https://golang.org/doc/install#uninstall)

- Remove lines below from `$HOME/.bashrc` or `$HOME/.profile`

    ```bash
    export GOROOT=/usr/local/go
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"

    export PATH=$PATH:$GOROOT/bin
    export PATH=$PATH:$GOPATH/bin
    # export PATH=$PATH:$GOBIN
    ```

- Remove installation path and GOPATH folders

    ```bash
    $ sudo rm -rf /usr/local/go/
    $ rm -rf $HOME/go/
    # https://golang.org/cmd/go/#hdr-Build_and_test_caching
    $ rm -rf $HOME/.cache/go-build/
    ```

## Commands

```bash
# build binary object file from code
# (for libraries don't produce an executable file)
$ go build

# move binary object file to $GOPATH/bin/
$ go install
# e.g.
$ go install github.com/eevmanu/xxxx
# inside just one file with yyyy.go filename, distinct from folder name

# remove binary object files from $GOPATH/src/.../project/
# internally go install use go clean
$ go clean

$ go test
# e.g.
$ go tests github.com/eevmanu/learninggo

$ go run

$ go get

$ go env

$ go vet

$ go generate

# check for shadowed variables
$ go tool vet --shadow
```

## Extra tools

### Linters

- [golangci-lint](https://github.com/golangci/golangci-lint)

    ```bash
    # to install
    $ curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.24.0
    ```

- [Staticcheck](https://github.com/dominikh/go-tools)

- [revive](https://github.com/mgechev/revive)

- [errcheck](https://github.com/kisielk/errcheck)

### Debugger

- [delve](https://github.com/go-delve/delve)

    ```bash
    $ go get -uv github.com/go-delve/delve/cmd/dlv
    ```

- [spew](https://github.com/davecgh/go-spew)

- [q](https://github.com/y0ssar1an/q)

- [litter](https://github.com/sanity-io/litter)

- [gops](https://github.com/google/gops)

### VSCode GO extension

- [Extension](https://marketplace.visualstudio.com/items?itemName=golang.Go)

- [Settings](https://github.com/golang/vscode-go/blob/master/docs/settings.md)

- [Tools](https://github.com/golang/vscode-go/blob/master/docs/tools.md)

    ```bash
    # 2020-07-27
    gocode
    gopkgs
    go-outline
    go-symbols
    guru
    gorename
    gotests
    gomodifytags
    impl
    fillstruct
    goplay
    godoctor
    dlv
    gocode-gomod
    godef
    goreturns
    golint
    ```

- [Modules](https://github.com/golang/vscode-go/blob/master/docs/modules.md)

- Create alternative folder to use as `GOPATH` for this modules

    ```bash
    $ mkdir $HOME/vscodetools
    ```

- Change on VSCode settings path for Go Tools
    - Path for User Settings
        - `$HOME/.config/Code - Insiders/User/settings.json`
        - `$HOME/.config/Code/User/settings.json`

    ```json
    {
        ...
        "go.toolsGopath": "{{ $HOME }}/vscodetools",
        ...
    }
    ```

- Open VSCode and run `Go: Install/Update Tools`

### Go Language Server

- [Docs related to VSCode](https://github.com/golang/tools/blob/master/gopls/doc/vscode.md)

------------------------------------------------------------------------------------------------

## Resources

Language things
- capital first letter public
- non capital first letter private

Leaning:
- [Effective Go](https://golang.org/doc/effective_go.html)
- [Gophercises](https://gophercises.com/)

Setup VS Code:
- [Go in Visual Studio Code](https://code.visualstudio.com/docs/languages/go)
- [Go extension for Visual Studio Code](https://github.com/microsoft/vscode-go)
    - [GOPATH in the VS Code Go extension](https://github.com/Microsoft/vscode-go/wiki/GOPATH-in-the-VS-Code-Go-extension)
    - [Debugging Go code using VS Code](https://github.com/Microsoft/vscode-go/wiki/Debugging-Go-code-using-VS-Code)
- Modules:
    - [Modules](https://github.com/golang/go/wiki/Modules)
- Language server:
    - [go please - official language server for the Go language](https://github.com/golang/tools/blob/master/gopls/README.md)
        - [User Guide](https://github.com/golang/tools/blob/master/gopls/doc/user.md)

Frameworks:
- [atreugo](https://github.com/savsgio/atreugo) - High performance and extensible micro web framework. Zero memory allocations in hot paths.
- [fasthttp](https://github.com/valyala/fasthttp) - Fast HTTP package for Go. Tuned for high performance. Zero memory allocations in hot paths. Up to 10x faster than net/http
- [fiber](https://github.com/gofiber/fiber) - Fiber is an Express inspired web framework written in Go with coffee gofiber.io

Benchmark:
- [Go HTTP request router and web framework benchmark](https://github.com/julienschmidt/go-http-routing-benchmark)
- [Go web framework benchmark](https://github.com/smallnest/go-web-framework-benchmark)
- [Awesome Open Source - benchmark](https://awesomeopensource.com/projects/benchmark)

Data related tools:
- [pq](https://github.com/lib/pq) - Pure Go Postgres driver for database/sql
- [migrate](https://github.com/golang-migrate/migrate) - Database migrations. CLI and Golang library.
- [sqlboiler](https://github.com/volatiletech/sqlboiler) - Generate a Go ORM tailored to your database schema.
- [prest](https://github.com/prest/prest) - pREST (PostgreSQL REST), simplify and accelerate development, zap instant, realtime, high-performance on any Postgres application, existing or new

Extra tools:
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [rclone](https://github.com/rclone/rclone) - rsync for cloud storage
- [dive](https://github.com/wagoodman/dive) - A tool for exploring each layer in a docker image
- [ngrok](https://github.com/inconshreveable/ngrok) - Introspected tunnels to localhost
- [logrus](https://github.com/sirupsen/logrus) - Structured, pluggable logging for Go
- [vegeta](https://github.com/tsenart/vegeta) - HTTP load testing tool and library
- [hey](https://github.com/rakyll/hey) - HTTP load generator, ApacheBench (ab) replacement, formerly known as rakyll/boom
- [goreplay](https://github.com/buger/goreplay) - capturing and replaying live HTTP traffic
- [annie](https://github.com/iawia002/annie) - Fast, simple and clean video downloader
- [restic](https://github.com/restic/restic) - Fast, secure, efficient backup program
- [pspy](https://github.com/DominicBreuker/pspy) - Monitor linux processes without root permissions
- [go-fault](https://github.com/github/go-fault) - Fault injection library in Go using standard http middleware
- [grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway) - gRPC to JSON proxy generator following the gRPC HTTP spec
- [viper](https://github.com/spf13/viper) - Go configuration with fangs
- [validator](https://github.com/go-playground/validator) - Go Struct and Field validation, including Cross Field, Cross Struct, Map, Slice and Array diving
- [cue](https://github.com/cuelang/cue) - Validate and define text-based and dynamic configuration cuelang.org
- [cron](https://github.com/robfig/cron) - a cron library for go
- [webhook](https://github.com/adnanh/webhook) - webhook is a lightweight incoming webhook server to run shell commands
- [godotenv](https://github.com/joho/godotenv) - A Go port of Ruby's dotenv library (Loads environment variables from `.env`.)
- [croc](https://github.com/schollz/croc) - Easily and securely send things from one computer to another crocodile package
- [gqlgen](https://github.com/99designs/gqlgen) - go generate based graphql server library
- [graphql-go](https://github.com/graph-gophers/graphql-go) - GraphQL server with a focus on ease of use
- [tamago](https://github.com/f-secure-foundry/tamago) - bare metal Go for ARM SoCs
- [riot](https://github.com/go-ego/riot) - Go Open Source, Distributed, Simple and efficient Search Engine

Concurrency - Parallelism - Multiprocessing - Multithreading - Asynchronous(async/await):
- 2020-09-29 - [Go: A Tale of Concurrency ( A Beginners Guide )](https://medium.com/@yashaswi_nayak/go-a-tale-of-concurrency-a-beginners-guide-b8976b26feb)
    - [Wrote an article/tutorial on Concurrency. Beginner Friendly!](https://www.reddit.com/r/golang/comments/j1xij2/wrote_an_articletutorial_on_concurrency_beginner/)
- 2018-03-04 - [Concurrency in Go](https://www.youtube.com/watch?v=LvgVSSpwND8)

Interesting Github Repos
- [Go (Golang) Clean Architecture based on Reading Uncle Bob's Clean Architecture](https://github.com/bxcodec/go-clean-arch)
- [Learn Go with test-driven development](https://github.com/quii/learn-go-with-tests)
- [Ultimate Go - Design Guidelines](https://github.com/ardanlabs/gotraining/blob/master/topics/go/README.md#design-guidelines)
- [Go design patterns](https://github.com/tmrts/go-patterns)
- [Awesome Go](https://github.com/avelino/awesome-go)
- [Write webapps without a framework in Go](https://github.com/thewhitetulip/web-dev-golang-anti-textbook)
- [build a web with golang](https://github.com/astaxie/build-web-application-with-golang)
- [TheAlgorithms](https://github.com/TheAlgorithms/Go) - Algorithms Implemented in GoLang

Roadmap & Interview Questions
- [Go Developer Roadmap](https://github.com/Alikhll/golang-developer-roadmap)
- [Golang Software Engineer Roadmap](https://github.com/dzyanis/roadmap)
- [Ultimate Go study guide](https://github.com/hoanhan101/ultimate-go)
- [116+ Coding Interview Problems with Detailed Solutions](https://github.com/hoanhan101/algo)

Performance:
- [go-perfbook](https://github.com/dgryski/go-perfbook) - Thoughts on Go performance optimization
- [cadvisor](https://github.com/google/cadvisor) - Analyzes resource usage and performance characteristics of running containers.
- [goproxy](https://github.com/snail007/goproxy) - Proxy is a high performance HTTP(S) proxies, SOCKS5 proxies,WEBSOCKET, TCP, UDP proxy server implemented by golang

Interesting articles:
- [Allocation efficiency in high-performance Go services](https://segment.com/blog/allocation-efficiency-in-high-performance-go-services/)
- [Style guideline for Go packages](https://rakyll.org/style-packages/)
- [Even in Go, concurrency is still not easy (with an example)](https://utcc.utoronto.ca/~cks/space/blog/programming/GoConcurrencyStillNotEasy)
- [Are you a Go black belt?](https://bitfieldconsulting.com/golang/black-belt)
- 2020-09-25 - [Developing price and currency handling for Go](https://bojanz.github.io/price-currency-handling-go/) - [reddit](https://www.reddit.com/r/golang/comments/izk4kz/developing_price_and_currency_handling_for_go/)

Reddit:
- [What are the most useful functions / methods etc. to know when learning Go as a second language?](https://www.reddit.com/r/golang/comments/j29uph/what_are_the_most_useful_functions_methods_etc_to/)
- [What is var _ type = &type{} used for?](https://www.reddit.com/r/golang/comments/j0b73d/what_is_var_type_type_used_for/)

Youtube:
- [Data structures and Algorithms in Go - Playlist](https://www.youtube.com/playlist?list=PL0q7mDmXPZm7s7weikYLpNZBKk5dCoWm6)

Interesting people:
- [Ben Johnson](https://medium.com/@benbjohnson)
- [Jaana Dogan](https://rakyll.org)

Final Articles / Resources:
- [Qix - Go](https://github.com/ty4z2008/Qix/blob/master/golang.md)
- [Why Go](https://github.com/golang/go/wiki/WhyGo)
- 2019-11-25 - [Choosing Go at American Express](https://americanexpress.io/choosing-go/)
