# Go

## [Install / Update / Upgrade](https://golang.org/doc/install#install)

Check latest go version [here](https://golang.org/dl/)

Download, verify and install and delete unneeded files

```bash
$ cd $HOME

# Download
$ wget -O go.tar.gz https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
# OR
# $ wget -O go.tar.gz https://dl.google.com/go/go1.XX.Y.linux-amd64.tar.gz

# Verify
$ echo "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d go.tar.gz" | sha256sum --check
go.tar.gz: OK

# Install (untar)
$ sudo rm -rf /usr/local/go/
$ sudo tar --directory=/usr/local/ -xzf go.tar.gz
$ rm go.tar.gz
```

Add instalation path to `$PATH` and source it

```bash
# add lines below to $HOME/.bashrc or $HOME/.profile
# option 1
export PATH=$PATH:/usr/local/go/bin
# option 2
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# ...and source it
$ source $HOME/.bashrc
```

Create `$HOME/go/bin` directory structure

```bash
$ mkdir -p $HOME/go/bin/
```

Add `$GOPATH`

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

    # ...and source it
    $ source $HOME/.bashrc
    ```

## [Install multiple versions](https://golang.org/doc/manage-install#installing-multiple)

Download any version you want

```bash
$ go get golang.org/dl/go1.14.10
```

Verify version

```bash
$ go1.14.10 version
go1.14.10: not downloaded. Run 'go1.14.10 download' to install to {{ $HOME }}/sdk/go1.14.10

$ ls -la `$GOPATH`/bin/
-rwxrwxr-x 1 {{ $USER }} {{ $USER }} 7050753 Oct 17 18:29 go1.14.10

$ ls -la `$GOPATH`/src/
drwxrwxr-x 3 {{ $USER }} {{ $USER }} 4096 Oct 17 18:29 golang.org
```

Download version

```bash
$ go1.14.10 download
Downloaded   0.0% (    15123 / 123767519 bytes) ...
Downloaded   2.7% (  3325952 / 123767519 bytes) ...
Downloaded  12.4% ( 15388373 / 123767519 bytes) ...
Downloaded  22.0% ( 27221919 / 123767519 bytes) ...
Downloaded  29.6% ( 36630526 / 123767519 bytes) ...
Downloaded  40.1% ( 49591296 / 123767519 bytes) ...
Downloaded  49.5% ( 61256704 / 123767519 bytes) ...
Downloaded  59.1% ( 73184256 / 123767519 bytes) ...
Downloaded  68.8% ( 85210112 / 123767519 bytes) ...
Downloaded  78.6% ( 97268736 / 123767519 bytes) ...
Downloaded  88.2% (109196288 / 123767519 bytes) ...
Downloaded  97.6% (120828928 / 123767519 bytes) ...
Downloaded 100.0% (123767519 / 123767519 bytes)
Unpacking {{ $HOME }}/sdk/go1.14.10/go1.14.10.linux-amd64.tar.gz ...
Success. You may now run 'go1.14.10'
```

Verify again

```bash
$ go1.14.10 version
go version go1.14.10 linux/amd64

$ ls -la {{ $HOME }}/sdk/
drwxr-xr-x 10 {{ $USER }} {{ $USER }} 4096 Oct 17 18:32 go1.14.10
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

- Linters:
    - [golangci/golangci-lint](https://github.com/golangci/golangci-lint) - Fast linters Runner for Go
        ```bash
        # to install
        $ curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.24.0
        ```
    - [dominikh/go-tools - Staticcheck](https://github.com/dominikh/go-tools/tree/master/cmd/staticcheck) - Go static analysis, detecting bugs, performance issues, and much more.
    - [mgechev/revive](https://github.com/mgechev/revive) - ~6x faster, stricter, configurable, extensible, and beautiful drop-in replacement for golint.
    - [kisielk/errcheck](https://github.com/kisielk/errcheck) - errcheck checks that you checked errors.

- Debugger / Logging / Tracing / ...:
    - [go-delve/delve](https://github.com/go-delve/delve) - Delve is a debugger for the Go programming language.
        ```bash
        $ go get -uv github.com/go-delve/delve/cmd/dlv
        ```
    - [davecgh/go-spew](https://github.com/davecgh/go-spew) - Implements a deep pretty printer for Go data structures to aid in debugging
    - [y0ssar1an/q](https://github.com/y0ssar1an/q) - Quick and dirty debugging output for tired Go programmers
    - [sanity-io/litter](https://github.com/sanity-io/litter) - Litter is a pretty printer library for Go data structures to aid in debugging and testing.
    - [google/gops](https://github.com/google/gops) - A tool to list and diagnose Go processes currently running on your system

### VSCode GO extension

- [Extension](https://marketplace.visualstudio.com/items?itemName=golang.Go)

- [Settings](https://github.com/golang/vscode-go/blob/master/docs/settings.md)

- [List of Tools](https://github.com/golang/vscode-go/blob/master/docs/tools.md)

    <details>
    <summary>
    Updated as 2020-07-27
    </summary>

    ```
    - dlv
    - fillstruct
    - go-outline
    - go-symbols
    - gocode
    - gocode-gomod
    - godef
    - godoctor
    - golint
    - gomodifytags
    - gopkgs
    - goplay
    - gorename
    - goreturns
    - gotests
    - guru
    - impl
    ```

    </details>

- [Modules](https://github.com/golang/vscode-go/blob/master/docs/modules.md)

- Create alternative folder to use as `GOPATH` for this modules

    ```bash
    $ mkdir $HOME/vscodetools
    ```

- Change on VSCode settings path for Go Tools

    ```json
    {
        ...
        "go.toolsGopath": "{{ $HOME }}/vscodetools",
        ...
    }
    ```

    <details>
    <summary>
    User Settings
    </summary>

    ```bash
    $HOME/.config/Code - Insiders/User/settings.json
    $HOME/.config/Code/User/settings.json
    ```

    </details>

- Open VSCode and run `Go: Install/Update Tools`

### Go Language Server

- [Docs related to VSCode](https://github.com/golang/tools/blob/master/gopls/doc/vscode.md)

------------------------------------------------------------------------------------------------

## Resources

- Language specific rules:
    - Naming convention
        - uppercase (capital) on first letter to declare ____ as public
        - lowercase on first letter to declare ____ as private

- Learn / 101:
    - [Effective Go](https://golang.org/doc/effective_go.html)
    - [Gophercises](https://gophercises.com/)
    - [Go 101](https://go101.org/article/101.html) - [github](https://github.com/go101/go101)

- Setup VS Code:
    - [Go in Visual Studio Code](https://code.visualstudio.com/docs/languages/go)
    - [Go extension for Visual Studio Code](https://github.com/microsoft/vscode-go)
        - [GOPATH in the VS Code Go extension](https://github.com/Microsoft/vscode-go/wiki/GOPATH-in-the-VS-Code-Go-extension)
        - [Debugging Go code using VS Code](https://github.com/Microsoft/vscode-go/wiki/Debugging-Go-code-using-VS-Code)
    - Modules:
        - [Modules](https://github.com/golang/go/wiki/Modules)
    - Language server:
        - [go please - official language server for the Go language](https://github.com/golang/tools/blob/master/gopls/README.md)
            - [User Guide](https://github.com/golang/tools/blob/master/gopls/doc/user.md)

- Frameworks:
    - [atreugo](https://github.com/savsgio/atreugo) - High performance and extensible micro web framework. Zero memory allocations in hot paths.
    - [fasthttp](https://github.com/valyala/fasthttp) - Fast HTTP package for Go. Tuned for high performance. Zero memory allocations in hot paths. Up to 10x faster than net/http
    - [fiber](https://github.com/gofiber/fiber) - Fiber is an Express inspired web framework written in Go with coffee gofiber.io

- Project structures:
    - [golang-standards/project-layout](https://github.com/golang-standards/project-layout) - Standard Go Project Layout

- Benchmark:
    - [Go HTTP request router and web framework benchmark](https://github.com/julienschmidt/go-http-routing-benchmark)
    - [Go web framework benchmark](https://github.com/smallnest/go-web-framework-benchmark)
    - [Awesome Open Source - benchmark](https://awesomeopensource.com/projects/benchmark)

- Data related tools:
    - [pq](https://github.com/lib/pq) - Pure Go Postgres driver for database/sql
    - [migrate](https://github.com/golang-migrate/migrate) - Database migrations. CLI and Golang library.
    - [sqlboiler](https://github.com/volatiletech/sqlboiler) - Generate a Go ORM tailored to your database schema.
    - [prest](https://github.com/prest/prest) - pREST (PostgreSQL REST), simplify and accelerate development, zap instant, realtime, high-performance on any Postgres application, existing or new

- Extra tools:
    - [junegunn/fzf](https://github.com/junegunn/fzf) - fuzzy finder
    - [rclone/rclone](https://github.com/rclone/rclone) - rsync for cloud storage
    - [wagoodman/dive](https://github.com/wagoodman/dive) - A tool for exploring each layer in a docker image
    - [inconshreveable/ngrok](https://github.com/inconshreveable/ngrok) - Introspected tunnels to localhost
    - [sirupsen/logrus](https://github.com/sirupsen/logrus) - Structured, pluggable logging for Go
    - [uber-go/zap](https://github.com/uber-go/zap) - Blazing fast, structured, leveled logging in Go.
    - [tsenart/vegeta](https://github.com/tsenart/vegeta) - HTTP load testing tool and library
    - [rakyll/hey](https://github.com/rakyll/hey) - HTTP load generator, ApacheBench (ab) replacement, formerly known as rakyll/boom
    - [buger/goreplay](https://github.com/buger/goreplay) - capturing and replaying live HTTP traffic
    - [iawia002/annie](https://github.com/iawia002/annie) - Fast, simple and clean video downloader
    - [restic/restic](https://github.com/restic/restic) - Fast, secure, efficient backup program
    - [DominicBreuker/pspy](https://github.com/DominicBreuker/pspy) - Monitor linux processes without root permissions
    - [github/go-fault](https://github.com/github/go-fault) - Fault injection library in Go using standard http middleware
    - [grpc-ecosystem/grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway) - gRPC to JSON proxy generator following the gRPC HTTP spec
    - [spf13/viper](https://github.com/spf13/viper) - Go configuration with fangs
    - [go-playground/validator](https://github.com/go-playground/validator) - Go Struct and Field validation, including Cross Field, Cross Struct, Map, Slice and Array diving
    - [cuelang/cue](https://github.com/cuelang/cue) - Validate and define text-based and dynamic configuration cuelang.org
    - [robfig/cron](https://github.com/robfig/cron) - a cron library for go
    - [adnanh/webhook](https://github.com/adnanh/webhook) - webhook is a lightweight incoming webhook server to run shell commands
    - [joho/godotenv](https://github.com/joho/godotenv) - A Go port of Ruby's dotenv library (Loads environment variables from `.env`.)
    - [schollz/croc](https://github.com/schollz/croc) - Easily and securely send things from one computer to another crocodile package
    - [99designs/gqlgen](https://github.com/99designs/gqlgen) - go generate based graphql server library
    - [graph-gophers/graphql-go](https://github.com/graph-gophers/graphql-go) - GraphQL server with a focus on ease of use
    - [f-secure-foundry/tamago](https://github.com/f-secure-foundry/tamago) - bare metal Go for ARM SoCs
    - [go-ego/riot](https://github.com/go-ego/riot) - Go Open Source, Distributed, Simple and efficient Search Engine
    - [robaho/go-trader](https://github.com/robaho/go-trader) - financial exchange written in Go, designed for algorithmic trading tests
    - [TykTechnologies/tyk](https://github.com/TykTechnologies/tyk) - Tyk Open Source API Gateway written in Go
    - [photoprism/photoprism](https://github.com/photoprism/photoprism) - Personal Photo Management powered by Go and Google TensorFlow
    - [emirpasic/gods](https://github.com/emirpasic/gods) - GoDS (Go Data Structures). Containers (Sets, Lists, Stacks, Maps, Trees), Sets (HashSet, TreeSet, LinkedHashSet), Lists (ArrayList, SinglyLinkedList, DoublyLinkedList), Stacks (LinkedListStack, ArrayStack), Maps (HashMap, TreeMap, HashBidiMap, TreeBidiMap, LinkedHashMap), Trees (RedBlackTree, AVLTree, BTree, BinaryHeap), Comparators, Iterators, …
    - [mitchellh/mapstructure](https://github.com/mitchellh/mapstructure) - Go library for decoding generic map values into native Go structures and vice versa.
    - [crowdsecurity/crowdsec](https://github.com/crowdsecurity/crowdsec) - An open-source, lightweight agent to detect and respond to bad behaviours. It also automatically benefits from our global community-wide IP reputation database.

- Concurrency - Parallelism - Multiprocessing - Multithreading - Asynchronous(async/await):
    - 2020-09-29 - [Go: A Tale of Concurrency ( A Beginners Guide )](https://medium.com/@yashaswi_nayak/go-a-tale-of-concurrency-a-beginners-guide-b8976b26feb)
        - [Wrote an article/tutorial on Concurrency. Beginner Friendly!](https://www.reddit.com/r/golang/comments/j1xij2/wrote_an_articletutorial_on_concurrency_beginner/)
    - 2020-10-21 - [When Too Much Concurrency Slows You Down (Golang)](https://www.reddit.com/r/golang/comments/jfi21j/when_too_much_concurrency_slows_you_down_golang/)
    - 2020-02-19 - [Advanced Go concurrency primitives](https://www.reddit.com/r/golang/comments/f6fzv2/advanced_go_concurrency_primitives/)
    - 2020-01-14 - [A Pragmatic Introduction To Concurrency In Go](https://www.reddit.com/r/golang/comments/eoxctc/a_pragmatic_introduction_to_concurrency_in_go/)
    - 2019-06-01 - [Golang channels and goroutines. Vividly.](https://www.youtube.com/watch?v=nwwbUtZvsFc)
    - 2019-05-02 - [Concurrency in Golang: A Simple, Practical Example](https://www.youtube.com/watch?v=3atNYmqXyV4)
    - 2019-04-20 - [Concurrent Design Patterns in Go](https://www.reddit.com/r/golang/comments/bfgvpv/concurrent_design_patterns_in_go/)
    - 2019-04-01 - [Go advanced concurrency patterns](https://www.reddit.com/r/golang/comments/b80dlt/go_advanced_concurrency_patterns/)
    - 2018-04-15 - [Concurrency Patterns In Go](https://www.youtube.com/watch?v=YEKjSzIwAdA)
    - 2018-03-04 - [Concurrency in Go](https://www.youtube.com/watch?v=LvgVSSpwND8)
    - 2017-09-24 - [Concurrency and Parallelism in Golang](https://medium.com/@tilaklodha/concurrency-and-parallelism-in-golang-5333e9a4ba64)
    - 2017-07-24 - [GopherCon 2017: Kavya Joshi - Understanding Channels](https://www.youtube.com/watch?v=KBZlN0izeiY)
    - 2014-03-13 - [Go Concurrency Patterns: Pipelines and cancellation](https://blog.golang.org/pipelines)


- Interesting Github Repos
    - [Go (Golang) Clean Architecture based on Reading Uncle Bob's Clean Architecture](https://github.com/bxcodec/go-clean-arch)
    - [Learn Go with test-driven development](https://github.com/quii/learn-go-with-tests)
    - [Ultimate Go - Design Guidelines](https://github.com/ardanlabs/gotraining/blob/master/topics/go/README.md#design-guidelines)
    - [Go design patterns](https://github.com/tmrts/go-patterns)
    - [Awesome Go](https://github.com/avelino/awesome-go)
    - [Write webapps without a framework in Go](https://github.com/thewhitetulip/web-dev-golang-anti-textbook)
    - [build a web with golang](https://github.com/astaxie/build-web-application-with-golang)
    - [TheAlgorithms](https://github.com/TheAlgorithms/Go) - Algorithms Implemented in GoLang
    - [halfrost/LeetCode-Go](https://github.com/halfrost/LeetCode-Go) - Solutions to LeetCode by Go, 100% test coverage, runtime beats 100% / LeetCode
    - [greyireland/algorithm-pattern](https://github.com/greyireland/algorithm-pattern) - Algorithm template, the most scientific way to brush questions, the fastest way to brush questions, you deserve it
    - [donng/Play-with-Data-Structures](https://github.com/donng/Play-with-Data-Structures) - 慕课 liuyubobobo「玩转数据结构」课程的 Go 语言实现版本
    - [dreddsa5dies/algorithm](https://github.com/dreddsa5dies/algorithm) - The repository algorithms implemented on the Go
    - [PacktPublishing/Learn-Data-Structures-and-Algorithms-with-Golang](https://github.com/PacktPublishing/Learn-Data-Structures-and-Algorithms-with-Golang) - Learn Data Structures and Algorithms with Golang, published by Packt
    - [openset/leetcode](https://github.com/openset/leetcode) - LeetCode Problems' Solutions

- Roadmap & Interview Questions
    - [Go Developer Roadmap](https://github.com/Alikhll/golang-developer-roadmap)
    - [Golang Software Engineer Roadmap](https://github.com/dzyanis/roadmap)
    - [Ultimate Go study guide](https://github.com/hoanhan101/ultimate-go)
    - [116+ Coding Interview Problems with Detailed Solutions](https://github.com/hoanhan101/algo)

- Performance:
    - [go-perfbook](https://github.com/dgryski/go-perfbook) - Thoughts on Go performance optimization
    - [cadvisor](https://github.com/google/cadvisor) - Analyzes resource usage and performance characteristics of running containers.
    - [goproxy](https://github.com/snail007/goproxy) - Proxy is a high performance HTTP(S) proxies, SOCKS5 proxies,WEBSOCKET, TCP, UDP proxy server implemented by golang

- Interesting articles:
    - [Allocation efficiency in high-performance Go services](https://segment.com/blog/allocation-efficiency-in-high-performance-go-services/)
    - [Style guideline for Go packages](https://rakyll.org/style-packages/)
    - [Even in Go, concurrency is still not easy (with an example)](https://utcc.utoronto.ca/~cks/space/blog/programming/GoConcurrencyStillNotEasy)
    - [Are you a Go black belt?](https://bitfieldconsulting.com/golang/black-belt)
    - 2020-09-25 - [Developing price and currency handling for Go](https://bojanz.github.io/price-currency-handling-go/) - [reddit](https://www.reddit.com/r/golang/comments/izk4kz/developing_price_and_currency_handling_for_go/)

- Reddit:
    - [What are the most useful functions / methods etc. to know when learning Go as a second language?](https://www.reddit.com/r/golang/comments/j29uph/what_are_the_most_useful_functions_methods_etc_to/)
    - [What is var _ type = &type{} used for?](https://www.reddit.com/r/golang/comments/j0b73d/what_is_var_type_type_used_for/)

- Youtube:
    - Playlists:
        - [sentdex - Go Language Programming Practical Basics Tutorial](https://www.youtube.com/playlist?list=PLQVvvaa0QuDeF3hP0wQoSxpkqgRcgxMqX)
        - [Bitfumes - Go Lang for Beginner](https://www.youtube.com/playlist?list=PLe30vg_FG4OSrCDx0FkjraSLEb19LIuN4)
        - [Nic Jackson - Building Microservices with Go](https://www.youtube.com/playlist?list=PLmD8u-IFdreyh6EUfevBcbiuCKzFk0EW_)
        - [Tensor Programming - Go Microservices](https://www.youtube.com/playlist?list=PLJbE2Yu2zumAixEws7gtptADSLmZ_pscP)
        - [ProgrammingKnowledge - Go Programming Language Tutorial | Golang Tutorial For Beginners | Go Language Training](https://www.youtube.com/playlist?list=PLS1QulWo1RIaRoN4vQQCYHWDuubEU8Vij)
        - [krunal shimpi - Build REST API in Golang using Echo web framework](https://www.youtube.com/playlist?list=PLhyfDOou2eQ1AJsAIRqaEUwx0blZ0UKG2)
        - [Ardan Labs - Go Syntax [LiveBytes]](https://www.youtube.com/playlist?list=PLADD_vxzPcZATO4tDU_nHApxTEJyxskiS)
        - [Junmin Lee - Data structures and Algorithms in Go](https://www.youtube.com/playlist?list=PL0q7mDmXPZm7s7weikYLpNZBKk5dCoWm6)
        - [G Coding Academy - Curso GO (Golang Español) - De 0 a 100](https://www.youtube.com/playlist?list=PLl_hIu4u7P64MEJpR3eVwQ1l_FtJq4a5g)
        - [tomas lingotti - Concurrencia en Golang](https://www.youtube.com/playlist?list=PLp7DJUzKQx1IwDmUbyalbcLKWElaf4psB)
        - [Alexys Lozada - Patrones de diseño con Go](https://www.youtube.com/playlist?list=PLfHn_OMWQAHD12-BbcbLR9zDHvH6t93o4)
        - [GopherCon UK - GopherCon UK 2019](https://www.youtube.com/playlist?list=PLDWZ5uzn69ezokLCB-nGgYInxL0uP1PeZ)
        - [Gopher Academy - GopherCon 2019](https://www.youtube.com/playlist?list=PL2ntRZ1ySWBdDyspRTNBIKES1Y-P__59_)
        - [Gopher Academy - GopherCon 2017 - Lightning Talks](https://www.youtube.com/playlist?list=PL2ntRZ1ySWBfhRZj3BDOrKdHzoafHsKHU)

- Interesting blogs from people / groups / companies:
    - [Ben Johnson](https://medium.com/@benbjohnson)
    - [Jaana Dogan](https://rakyll.org)
    - [gopher-reading-list](https://github.com/enocom/gopher-reading-list) - A curated selection of blog posts on Go

- Books:
    - [GoBooks](https://github.com/dariubs/GoBooks) - List of Golang books

- Podcasts:
    - [Changelog - Go Time](https://changelog.com/gotime)
    - [Sourcegraph Podcast](https://about.sourcegraph.com/podcast), [YT playlist](https://www.youtube.com/playlist?list=PL6zLuuRVa1_jf5GDl61SvEOXvwvKS1IXA)

- Final Articles / Posts:
    - Non dated:
        - [Qix - Go](https://github.com/ty4z2008/Qix/blob/master/golang.md)
        - [Why Go](https://github.com/golang/go/wiki/WhyGo)
    - Dated:
        - 2019-11-25 - [Choosing Go at American Express](https://americanexpress.io/choosing-go/)
