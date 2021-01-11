<!-- omit in toc -->
# Go

<!-- omit in toc -->
## Table of contents

- [Install](#install)
    - [Manage multiple Go versions](#manage-multiple-go-versions)
- [Uninstall](#uninstall)
- [Useful commands](#useful-commands)
- [VSCode Setup](#vscode-setup)
- [Dependency management](#dependency-management)
    - [Modules](#modules)
- [Extra tools](#extra-tools)
    - [Linters](#linters)
    - [Logging / Debugger / Tracing / ...](#logging--debugger--tracing--)
- [Language Server](#language-server)
- [Important notes](#important-notes)
- [Resources](#resources)
    - [Learn / 101 / Beginner / Entry-level](#learn--101--beginner--entry-level)
    - [Project structures](#project-structures)
    - [Interfaces](#interfaces)
    - [Channels](#channels)
    - [Concurrency](#concurrency)
    - [Error handling](#error-handling)
    - [Web applications](#web-applications)
    - [Testing](#testing)
    - [Benchmark](#benchmark)
    - [Data tools](#data-tools)
    - [Extra tools](#extra-tools-1)
    - [Generics](#generics)
    - [Algorithms / Data structures](#algorithms--data-structures)
    - [Design patterns](#design-patterns)
    - [Roadmap / Study Guides / Training / Interview Questions / Exercises / Problems / Examples / ...](#roadmap--study-guides--training--interview-questions--exercises--problems--examples--)


## Install

☝ [Table of contents](#table-of-contents)

Download

```bash
$ wget \
    -O go.tar.gz \
    https://golang.org/dl/go1.15.6.linux-amd64.tar.gz

# $ wget \
#     -O go.tar.gz \
#     https://dl.google.com/go/go1.XX.Y.linux-amd64.tar.gz
```

Verify

```bash
$ echo "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844 go.tar.gz" | \
    sha256sum --check
go.tar.gz: OK
```

Install / Update (overwrite)

```bash
$ sudo rm -rf /usr/local/go/
$ sudo tar --directory=/usr/local/ -xzf go.tar.gz
$ rm go.tar.gz
```

Create `$HOME/go/bin` (aka `$GOPATH/bin` or `$GOBIN`) folder

```bash
$ mkdir -p $HOME/go/bin/
```

Add `Go` installation path (`$GOROOT`) to `$PATH`

- without set `$GOROOT`

    Add line below to `$HOME/.bashrc` or `$HOME/.profile`

    ```bash
    export PATH=$PATH:/usr/local/go/bin
    ```

- with `$GOROOT`

    Add line below to `$HOME/.bashrc` or `$HOME/.profile`

    ```bash
    export GOROOT=/usr/local/go
    export PATH=$PATH:$GOROOT/bin
    ```

Add `$GOPATH`

- with `$GOPATH`, without `$GOBIN`

    Add line below to `$HOME/.bashrc` or `$HOME/.profile`

    ```bash
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    ```

- with `$GOPATH` and `$GOBIN`

    Add line below to `$HOME/.bashrc` or `$HOME/.profile`

    ```bash
    export GOPATH=$HOME/go
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOBIN
    ```

Soruce recent changes

```bash
$ source $HOME/.bashrc
```

Related links
- [Download and install](https://golang.org/doc/install) (Go - Documentation - Getting Started)
- [Downloads](https://golang.org/dl/)
- [Optional environment variables](https://golang.org/doc/install/source#environment)

### Manage multiple Go versions

☝ [Table of contents](#table-of-contents)

Download (`go get`) any version

```bash
$ go get golang.org/dl/go1.XX.YY

# e.g.:
$ go get golang.org/dl/go1.14.10
```

Verify

```bash
$ go1.14.10 version
go1.14.10: not downloaded. Run 'go1.14.10 download' to install to $HOME/sdk/go1.14.10

$ ls -la $GOPATH/bin/
-rwxrwxr-x 1 $USER $USER 7050753 Oct 17 18:29 go1.14.10

$ ls -la $GOPATHl/src/
drwxrwxr-x 3 $USER $USER 4096 Oct 17 18:29 golang.org
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
Unpacking $HOME/sdk/go1.14.10/go1.14.10.linux-amd64.tar.gz ...
Success. You may now run 'go1.14.10'
```

Verify again

```bash
$ go1.14.10 version
go version go1.14.10 linux/amd64

$ ls -la $HOME/sdk/
drwxr-xr-x 10 $USER $USER 4096 Oct 17 18:32 go1.14.10
```

Related links
- [Installing multiple Go versions](https://golang.org/doc/manage-install#installing-multiple) (Go - Documentation - Getting Started - Download and install - Managing Go installations)

## Uninstall

☝ [Table of contents](#table-of-contents)

Remove lines below from `$HOME/.bashrc` or `$HOME/.profile`

```bash
export GOROOT=/usr/local/go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOBIN
```

Remove installation path and `GOPATH` folders

```bash
$ sudo rm -rf /usr/local/go/
$ rm -rf $HOME/go/
```

Remove cache folders (Command go - [Build and test caching](https://golang.org/cmd/go/#hdr-Build_and_test_caching))

```bash
$ rm -rf $HOME/.cache/go-build/
```

Related links
- [Linux / macOS / FreeBSD](https://golang.org/doc/manage-install#linux-mac-bsd) (Go - Documentation - Getting Started - Download and install - Managing Go installations - Uninstalling Go)

## Useful commands

☝ [Table of contents](#table-of-contents)

```bash
# build binary object file from code
# (for libraries don't produce an executable file)
$ go build
```

```bash
# move binary object file to $GOPATH/bin/
$ go install

# e.g.
$ go install github.com/xxxx/yyyy
# inside just one file with yyyy.go filename, distinct from folder name
```

```bash
# remove binary object files from $GOPATH/src/.../project/
# internally go install use go clean
$ go clean

# removes all cached test results, but not cached build results
$ go clean -testcache
```

```bash
$ go test

# e.g.
$ go tests github.com/XXX/YYY
```

```bash
$ go run

$ go get

$ go env

$ go vet

$ go generate
```

```bash
# check for shadowed variables
$ go tool vet --shadow
```

## VSCode Setup

☝ [Table of contents](#table-of-contents)

[Go in Visual Studio Code](https://code.visualstudio.com/docs/languages/go)

[Go - Official Extension @ VSCode](https://marketplace.visualstudio.com/items?itemName=golang.Go)
- [GitHub](https://github.com/golang/vscode-go)
    - [docs/settings.md](https://github.com/golang/vscode-go/blob/master/docs/settings.md)
    - [docs/tools.md](https://github.com/golang/vscode-go/blob/master/docs/tools.md)
        <details>
        <summary>
        List of Tools
        </summary>

        Updated as `2021-01-11`
        <!-- TODO verify this an actual project in Go -->
        <!--
        Updated as `2020-07-27`
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
        - -->
        - Go toolchain
        - gocode
        - gopkgs
        - go-outline
        - go-symbols
        - guru
        - gorename
        - godoctor
        - delve
        - gomodifytags
        - goplay
        - impl
        - gotests
        - fillstruct
        - Documentation
            - gogetdoc
            - godef
            - godoc
        - Formatting
            - goreturns
            - goimports
            - gofmt
            - goformat
        - Diagnostics
            - gotype-live
            - golint
            - staticcheck
            - golangci-lint
            - revive

        </details>

Create alternative folder for VSCode Go extension tools, to use it as `$GOPATH`

```bash
$ mkdir $HOME/vscodetools
```

Change Go Tools path on VSCode User settings

```json
{
    ...
    "go.toolsGopath": "{{ $HOME }}/vscodetools",
    ...
}
```

- User Settings
    - `$HOME/.config/Code - Insiders/User/settings.json`
    - `$HOME/.config/Code/User/settings.json`

Open VSCode and run `Go: Install/Update Tools`

Personal Settings

```json
{
    // TODO
    "go.autocompleteUnimportedPackages": true,
    "go.toolsGopath": "{{ $HOME }}/vscodetools",
    "go.docsTool": "",
    "go.buildOnSave" : "",
    "go.buildFlags" : "",
    "go.vetOnSave" : "",
    "go.vetFlags" : "",
    "go.lintOnSave" : "",
    "go.lintFlags" : "",
    "go.lintTool" : "",
    "go.testOnSave" : "",
    "go.formatTool": "",
    "[go]": {
        "editor.formatOnSave": false
    }
}
```

Related links
- [GOPATH in the VS Code Go extension](https://github.com/Microsoft/vscode-go/wiki/GOPATH-in-the-VS-Code-Go-extension) (GitHub - microsoft/vscode-go - Wiki)
- [Debugging Go code using VS Code](https://github.com/Microsoft/vscode-go/wiki/Debugging-Go-code-using-VS-Code) (GitHub - microsoft/vscode-go - Wiki)

## Dependency management

### Modules

☝ [Table of contents](#table-of-contents)

<!--
TODO
write more details about dependency management with Go Modules
write if dep is still an option
-->

- [Tutorial: Create a module](https://golang.org/doc/tutorial/create-module.html) (Go - Documentation - Getting Started)
- [Modules](https://github.com/golang/go/wiki/Modules) (GitHub - golang/go - Wiki)
- [Modules](https://github.com/golang/vscode-go/blob/master/docs/modules.md) (GitHub - golang/vscode-go - Docs)

## Extra tools

### Linters

☝ [Table of contents](#table-of-contents)

Linter is a tool that analyzes source code. Some use cases are:
- programming errors
- detect bugs
- stylistic errors
- suspicious constructs
- static analysis
- memory leaks
- count SLOC
- code standarizing
- security issues
- performance improvements
- measure codebase health
- spread awareness and ownership
- manage technical debts

[golangci/golangci-lint](https://github.com/golangci/golangci-lint) - Fast linters Runner for Go

- List of [linters](https://golangci-lint.run/usage/linters/)

- Install

    ```bash
    $ curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | \
        sh -s -- -b $(go env GOPATH)/bin v1.24.0
    ```

[dominikh/go-tools](https://github.com/dominikh/go-tools) - Go static analysis, detecting bugs, performance issues, and much more.

- [cmd/staticcheck](https://github.com/dominikh/go-tools/tree/master/cmd/staticcheck)

[mgechev/revive](https://github.com/mgechev/revive) - ~6x faster, stricter, configurable, extensible, and beautiful drop-in replacement for golint.

[kisielk/errcheck](https://github.com/kisielk/errcheck) - errcheck checks that you checked errors.

[mdempsky/gocode](https://github.com/mdempsky/gocode) - An autocompletion daemon for the Go programming language
- < Go 1.8 or 1.10 - [nsf/gocode](https://github.com/nsf/gocode)
- work with Go Modules - [stamblerre/gocode](https://github.com/stamblerre/gocode)

[rogpeppe/godef](https://github.com/rogpeppe/godef) - Print where symbols are defined in Go source code

[jstemmer/gotags](https://github.com/jstemmer/gotags) - ctags-compatible tag generator for Go

### Logging / Debugger / Tracing / ...

☝ [Table of contents](#table-of-contents)

[go-delve/delve](https://github.com/go-delve/delve) - Delve is a debugger for the Go programming language.

```bash
$ go get -uv github.com/go-delve/delve/cmd/dlv
```

[davecgh/go-spew](https://github.com/davecgh/go-spew) - Implements a deep pretty printer for Go data structures to aid in debugging

[y0ssar1an/q](https://github.com/y0ssar1an/q) - Quick and dirty debugging output for tired Go programmers

[sanity-io/litter](https://github.com/sanity-io/litter) - Litter is a pretty printer library for Go data structures to aid in debugging and testing.

[google/gops](https://github.com/google/gops) - A tool to list and diagnose Go processes currently running on your system

## Language Server

☝ [Table of contents](#table-of-contents)

[gopls](https://github.com/golang/tools/blob/master/gopls/README.md) - gopls documentation - official language server for the Go language (part of [golang.org/x/tools](https://godoc.org/golang.org/x/tools) - [mirror] Go Tools - [GitHub](https://github.com/golang/tools/))
- [doc/user.md](https://github.com/golang/tools/blob/master/gopls/doc/user.md) - User Guide
- [doc/vscode.md](https://github.com/golang/tools/blob/master/gopls/doc/vscode.md) - VSCode

## Important notes

☝ [Table of contents](#table-of-contents)

Naming convention on `uppercase / capital`: on first letter to declare xxx as public

Naming convention on `lowercase`: on first letter to declare xxx as private

## Resources

### Learn / 101 / Beginner / Entry-level

☝ [Table of contents](#table-of-contents)

Go - Documentation
- [Getting Started](https://golang.org/doc/#getting-started)
    - [Tutorial: Getting Started](https://golang.org/doc/tutorial/getting-started)
- [Learning Go](https://golang.org/doc/#learning)
    - [A Tour of Go](https://tour.golang.org/)
    - [How to write Go code](https://golang.org/doc/code.html)
    - [Effective Go](https://golang.org/doc/effective_go.html)
    - Diagnostics
    - [FAQ](https://golang.org/doc/faq)
    - [Tutorials](https://golang.org/doc/tutorial/)
    - [Wiki](https://github.com/golang/go/wiki/)
        - [Learn](https://github.com/golang/go/wiki/Learn)
- [References](https://golang.org/doc/#references)
    - Package Documentation
    - Command Documentation
    - Language Specification
    - The Go Memory Model
    - Release History
- Articles
    - [Blog](https://blog.golang.org/)
    - ...
- Talks
    - Wiki - [Talks](https://github.com/golang/go/wiki/GoTalks) (last updated: 2018-08-18)
    - [GoTalks](https://talks.golang.org/) - subdirectories per year

[Go by Example](https://gobyexample.com/)

[Go 101](https://go101.org/article/101.html) - [GitHub](https://github.com/go101/go101)
- [Tips](https://go101.org/article/tips.html)
- [Details](https://go101.org/article/details.html)
- [FAQ](https://go101.org/article/unofficial-faq.html)

[Gophercises](https://gophercises.com/)

Related links
- [Code Review Comments](https://github.com/golang/go/wiki/CodeReviewComments) (GitHub - golang/go - Wiki)
- 2020-03-18 - [Getting started with Go guide](https://dominicstpierre.com/getting-started-with-go-guide) - [reddit](https://www.reddit.com/r/golang/comments/fkw2rx/i_wrote_a_guide_for_beginners_wanting_to_get/) - [archive](https://web.archive.org/web/20201125045730/https://dominicstpierre.com/getting-started-with-go-guide)
    - 2020-10-21 - [When Too Much Concurrency Slows You Down (Golang)](https://www.reddit.com/r/golang/comments/jfi21j/when_too_much_concurrency_slows_you_down_golang/)
    - 2020-09-01 - [Even in Go, concurrency is still not easy (with an example)](https://utcc.utoronto.ca/~cks/space/blog/programming/GoConcurrencyStillNotEasy) - [archive](https://web.archive.org/web/20201026045240/https://utcc.utoronto.ca/~cks/space/blog/programming/GoConcurrencyStillNotEasy) - [hn](https://news.ycombinator.com/item?id=24359650)
    - 2020-02-19 - [Advanced Go concurrency primitives](https://www.reddit.com/r/golang/comments/f6fzv2/advanced_go_concurrency_primitives/)
    - 2020-01-14 - [A Pragmatic Introduction To Concurrency In Go](https://www.reddit.com/r/golang/comments/eoxctc/a_pragmatic_introduction_to_concurrency_in_go/)
    - 2019-06-01 - [Golang channels and goroutines. Vividly.](https://www.youtube.com/watch?v=nwwbUtZvsFc)
    - 2019-05-17 - [Understanding real-world concurrency bugs in Go](https://blog.acolyer.org/2019/05/17/understanding-real-world-concurrency-bugs-in-go/) - [archive](https://web.archive.org/web/20201026045040/https://blog.acolyer.org/2019/05/17/understanding-real-world-concurrency-bugs-in-go/)
        - 2019-03-02 - [hn](https://news.ycombinator.com/item?id=19280927)
        - 2019-05-17 - [hn](https://news.ycombinator.com/item?id=19939718)
    - 2019-05-02 - [Concurrency in Golang: A Simple, Practical Example](https://www.youtube.com/watch?v=3atNYmqXyV4)
    - 2019-04-20 - [Concurrent Design Patterns in Go](https://www.reddit.com/r/golang/comments/bfgvpv/concurrent_design_patterns_in_go/)
    - 2019-04-01 - [Go advanced concurrency patterns](https://www.reddit.com/r/golang/comments/b80dlt/go_advanced_concurrency_patterns/)
    - 2018-04-15 - [Concurrency Patterns In Go](https://www.youtube.com/watch?v=YEKjSzIwAdA)
    - 2018-03-04 - [Concurrency in Go](https://www.youtube.com/watch?v=LvgVSSpwND8)
    - 2017-09-24 - [Concurrency and Parallelism in Golang](https://medium.com/@tilaklodha/concurrency-and-parallelism-in-golang-5333e9a4ba64)
    - 2017-07-24 - [GopherCon 2017: Kavya Joshi - Understanding Channels](https://www.youtube.com/watch?v=KBZlN0izeiY)
    - 2014-03-13 - [Go Concurrency Patterns: Pipelines and cancellation](https://blog.golang.org/pipelines)
    - [loong/go-concurrency-exercises](https://github.com/loong/go-concurrency-exercises)
    - [alextanhongpin/go-advance-concurrency](https://github.com/alextanhongpin/go-advance-concurrency)
    - 2020-02-19 - [Advanced Go Concurrency](https://encore.dev/blog/advanced-go-concurrency) - [reddit](https://www.reddit.com/r/golang/comments/f6fzv2/advanced_go_concurrency_primitives/)
        - [singleflight](https://godoc.org/golang.org/x/sync/singleflight)
        - [errgroup](https://godoc.org/golang.org/x/sync/errgroup)
        - [semaphore](https://godoc.org/golang.org/x/sync/semaphore)
    - 2020-09-29 - [Go: A Tale of Concurrency ( A Beginners Guide )](https://medium.com/swlh/go-a-tale-of-concurrency-a-beginners-guide-b8976b26feb) - [reddit](https://www.reddit.com/r/golang/comments/j1xij2/wrote_an_articletutorial_on_concurrency_beginner/)
    - [Even in Go, concurrency is still not easy (with an example)](https://utcc.utoronto.ca/~cks/space/blog/programming/GoConcurrencyStillNotEasy)

- Generics
    - [Summary of Go Generics Discussions](https://docs.google.com/document/d/1vrAy9gMpMoS3uaVphB32uVXX4pi-HnNjkMEgyAHX4N4/)
    - 2020-09-21 - [Type Parameters - Draft Design](https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md)
    - [golang/go](https://github.com/golang/go) - [dev.go2go branch](https://github.com/golang/go/blob/dev.go2go/README.go2go.md)
    - [The go2go Playground](https://go2goplay.golang.org/)
    - 2020-08-29 - [Generics examples by Go Team 🔥️](https://www.reddit.com/r/golang/comments/iiuhc1/generics_examples_by_go_team/)

- Data structures / Algorithm
    - [donng/Play-with-Data-Structures](https://github.com/donng/Play-with-Data-Structures) - 慕课 liuyubobobo「玩转数据结构」课程的 Go 语言实现版本
    - [PacktPublishing/Learn-Data-Structures-and-Algorithms-with-Golang](https://github.com/PacktPublishing/Learn-Data-Structures-and-Algorithms-with-Golang) - Learn Data Structures and Algorithms with Golang, published by Packt
    - [greyireland/algorithm-pattern](https://github.com/greyireland/algorithm-pattern) - Algorithm template, the most scientific way to brush questions, the fastest way to brush questions, you deserve it
    - [dreddsa5dies/algorithm](https://github.com/dreddsa5dies/algorithm) - The repository algorithms implemented on the Go
    - [TheAlgorithms/Go](https://github.com/TheAlgorithms/Go) - Algorithms Implemented in GoLang
    - YT Playlist - Junmin Lee - [Data structures and Algorithms in Go](https://www.youtube.com/playlist?list=PL0q7mDmXPZm7s7weikYLpNZBKk5dCoWm6) - [reddit](https://www.reddit.com/r/golang/comments/j121fo/if_you_want_to_learn_data_structures_in_go/)
        - 2020-10-03 - 3.9k views

- Design patterns:
    - [tmrts/go-patterns](https://github.com/tmrts/go-patterns) - Curated list of Go design patterns, recipes and idioms
    - 2020-09-04 - [Learn Go by Building a Bus Service](https://medium.com/better-programming/learn-go-by-building-a-bus-service-6c11e7b81b92) - [reddit](https://www.reddit.com/r/golang/comments/iml937/i_wrote_a_piece_about_lightweight_design_patterns/)

- Roadmap / Study Guides / Training / Interview Questions / Exercises / Problems / Examples
    - [Alikhll/golang-developer-roadmap](https://github.com/Alikhll/golang-developer-roadmap) - Roadmap to becoming a Go developer in 2020
    - [dzyanis/roadmap](https://github.com/dzyanis/roadmap) - Software Engineer Roadmap (alpha) - [golang roadmap](https://github.com/dzyanis/roadmap/blob/master/stacks/go/data/roadmap.png)
    - [ardanlabs/gotraining-studyguide](https://github.com/ardanlabs/gotraining-studyguide) - [reddit](https://www.reddit.com/r/golang/comments/g918ul/ultimate_go_study_guide_for_beginning_and/)
    - [hoanhan101/algo](https://github.com/hoanhan101/algo) - 101+ coding interview problems in Go - [reddit](https://www.reddit.com/r/golang/comments/el4vut/101_coding_interview_problems_with_detailed/)
        - 2020-01-06 - [web](https://hoanhan.co/101-challenges)
    - [inancgumus/learngo](https://github.com/inancgumus/learngo) - 1000+ Hand-Crafted Go Examples, Exercises, and Quizzes - [reddit](https://www.reddit.com/r/golang/comments/gl1jo2/learn_go_1000_handcrafted_go_exercises_and/)
    - [austingebauer/go-leetcode](https://github.com/austingebauer/go-leetcode) - A collection of 100+ popular LeetCode problems solved in Go. - [reddit](https://www.reddit.com/r/golang/comments/fqu0nf/100_leetcode_solutions_in_go/)
    - [halfrost/LeetCode-Go](https://github.com/halfrost/LeetCode-Go) - Solutions to LeetCode by Go, 100% test coverage, runtime beats 100% / LeetCode
    - [openset/leetcode](https://github.com/openset/leetcode) - LeetCode Problems' Solutions
    - [ardanlabs/gotraining](https://github.com/ardanlabs/gotraining) - Go Training Class Material
        - [Ultimate Go](https://github.com/ardanlabs/gotraining/tree/master/topics/go) - [Design Guidelines](https://github.com/ardanlabs/gotraining/tree/master/topics/go#design-guidelines)
    - [SuperPaintman/the-evolution-of-a-go-programmer](https://github.com/SuperPaintman/the-evolution-of-a-go-programmer) - [reddit](https://www.reddit.com/r/golang/comments/f1hy9a/the_evolution_of_a_go_programmer/)

- Performance:
    - [go-perfbook](https://github.com/dgryski/go-perfbook) - Thoughts on Go performance optimization
    - [cadvisor](https://github.com/google/cadvisor) - Analyzes resource usage and performance characteristics of running containers.
    - [goproxy](https://github.com/snail007/goproxy) - Proxy is a high performance HTTP(S) proxies, SOCKS5 proxies,WEBSOCKET, TCP, UDP proxy server implemented by golang

- Unikernel
    - [icexin/eggos](https://github.com/icexin/eggos) - A Go unikernel running on x86 bare metal

- Reddit:
    - [What are the most useful functions / methods etc. to know when learning Go as a second language?](https://www.reddit.com/r/golang/comments/j29uph/what_are_the_most_useful_functions_methods_etc_to/)
    - [What is var _ type = &type{} used for?](https://www.reddit.com/r/golang/comments/j0b73d/what_is_var_type_type_used_for/)
    - [The best description on when to use a pointer and when to pass by value in GO I've seen!!!](https://www.reddit.com/r/golang/comments/gldrek/the_best_description_on_when_to_use_a_pointer_and/)
    - [How well do you know Go history?](https://www.reddit.com/r/golang/comments/hzfksf/how_well_do_you_know_go_history/)
    - 2020-07-11 - [What feature of Go is used very often by experienced programmers, but not so much by a newbie?](https://www.reddit.com/r/golang/comments/hp4mk3/what_feature_of_go_is_used_very_often_by/)
    - []()
    - []()
    - []()
    - []()

- Youtube:
    - Video:
        - 2020-07-18 - [Brian Kernighan: UNIX, C, AWK, AMPL, and Go Programming | Lex Fridman Podcast #109](https://www.youtube.com/watch?v=O9upVbGSBFo)
    - Playlists:
        - 2017-11-12 - 485k - sentdex: [Go Language Programming Practical Basics Tutorial](https://www.youtube.com/playlist?list=PLQVvvaa0QuDeF3hP0wQoSxpkqgRcgxMqX)
        - 2020-06-06 - 51k - Tech With Tim: [Golang Tutorials](https://www.youtube.com/playlist?list=PLzMcBGfZo4-mtY_SE3HuzQJzuj4VlUG0q)
        - 2020-02-25 - 6k - Bitfumes: [Go Lang for Beginner](https://www.youtube.com/playlist?list=PLe30vg_FG4OSrCDx0FkjraSLEb19LIuN4)
        - 2020-10-22 - 5k - ProgrammingKnowledge: [Go Programming Language Tutorial | Golang Tutorial For Beginners | Go Language Training](https://www.youtube.com/playlist?list=PLS1QulWo1RIaRoN4vQQCYHWDuubEU8Vij)
        - 2020-10-19 - 3.4k - Ardan Labs: [Go Syntax [LiveBytes]](https://www.youtube.com/playlist?list=PLADD_vxzPcZATO4tDU_nHApxTEJyxskiS)


        - 2018-10-28 - 10k - Tensor Programming: [Go Microservices](https://www.youtube.com/playlist?list=PLJbE2Yu2zumAixEws7gtptADSLmZ_pscP)
        - 2020-06-20 - 47k - Nic Jackson: [Building Microservices with Go](https://www.youtube.com/playlist?list=PLmD8u-IFdreyh6EUfevBcbiuCKzFk0EW_)
        - 2020-06-12 - 5k - krunal shimpi: [Build REST API in Golang using Echo web framework](https://www.youtube.com/playlist?list=PLhyfDOou2eQ1AJsAIRqaEUwx0blZ0UKG2)

        - G Coding Academy: [Curso GO (Golang Español) - De 0 a 100](https://www.youtube.com/playlist?list=PLl_hIu4u7P64MEJpR3eVwQ1l_FtJq4a5g)
        - tomas lingotti: [Concurrencia en Golang](https://www.youtube.com/playlist?list=PLp7DJUzKQx1IwDmUbyalbcLKWElaf4psB)
        - Alexys Lozada: [Patrones de diseño con Go](https://www.youtube.com/playlist?list=PLfHn_OMWQAHD12-BbcbLR9zDHvH6t93o4)

        - [GopherCon UK - GopherCon UK 2019](https://www.youtube.com/playlist?list=PLDWZ5uzn69ezokLCB-nGgYInxL0uP1PeZ)
        - [Gopher Academy - GopherCon 2019](https://www.youtube.com/playlist?list=PL2ntRZ1ySWBdDyspRTNBIKES1Y-P__59_)
        - [Gopher Academy - GopherCon 2017 - Lightning Talks](https://www.youtube.com/playlist?list=PL2ntRZ1ySWBfhRZj3BDOrKdHzoafHsKHU)

- People / groups / companies to follow:
    - [Ben Johnson](https://medium.com/@benbjohnson)
    - [Jaana Dogan](https://rakyll.org)
    - [gopher-reading-list](https://github.com/enocom/gopher-reading-list) - A curated selection of blog posts on Go
    - [Go 101](https://twitter.com/go100and1)

- Books:
    - [dariubs/GoBooks](https://github.com/dariubs/GoBooks) - List of Golang books
    - [karlseguin/the-little-go-book](https://github.com/karlseguin/the-little-go-book)
    - 2020-06-11 - [How To Code in Go eBook](https://www.digitalocean.com/community/books/how-to-code-in-go-ebook)

- Podcasts:
    - [Changelog - Go Time](https://changelog.com/gotime)
    - [Sourcegraph Podcast](https://about.sourcegraph.com/podcast), [YT playlist](https://www.youtube.com/playlist?list=PL6zLuuRVa1_jf5GDl61SvEOXvwvKS1IXA)

- News sources:
    - [Changelog News - Go Topic](https://changelog.com/topic/go)

- Best practices / Style Guide:
    - [Style guideline for Go packages](https://rakyll.org/style-packages/)
    - [uber-go/guide/](https://github.com/uber-go/guide) - The Uber Go Style Guide.
    - [dgryski/awesome-go-style](https://github.com/dgryski/awesome-go-style) - A collection of Go style guides
    - 2020-10-24 - [Style guide for Go code](https://www.reddit.com/r/golang/comments/jh3syk/style_guide_for_go_code/)
    - [Go (Golang) Clean Architecture based on Reading Uncle Bob's Clean Architecture](https://github.com/bxcodec/go-clean-arch)

- Highlighted articles:
    - [Allocation efficiency in high-performance Go services](https://segment.com/blog/allocation-efficiency-in-high-performance-go-services/)
    - [Are you a Go black belt?](https://bitfieldconsulting.com/golang/black-belt)
    - 2020-09-25 - [Developing price and currency handling for Go](https://bojanz.github.io/price-currency-handling-go/) - [reddit](https://www.reddit.com/r/golang/comments/izk4kz/developing_price_and_currency_handling_for_go/)

- Why Go / Success stories
    - 2020-06-01 - [PayPal Taps Go to Modernize and Scale](https://go.dev/solutions/paypal/) - [reddit](https://www.reddit.com/r/golang/comments/ilr81s/paypal_taps_go_to_modernize_and_scale_in_our/)

- Conferences
    - golang/go - Wiki - [Conferences](https://github.com/golang/go/wiki/Conferences)

- Release notes / Changelog / Updates:
    - 2020-07-18 - [reflect: allow multiple keys in key:value pair in struct tag]()
        - [tweet](https://twitter.com/go100and1/status/1333773730519031808)
    - 2020-09-06 - [TIL: make+copy to clone a slice is optimized in Go 1.15, which is not mentioned in 1.15 release notes.](https://www.reddit.com/r/golang/comments/inorfa/til_makecopy_to_clone_a_slice_is_optimized_in_go/)
    - 2020-04-26 - [What's coming in Go 1.15](https://docs.google.com/presentation/d/1veyF0y6Ynr6AFzd9gXi4foaURlgbMxM-tmB4StDrdAM/) - [reddit](https://www.reddit.com/r/golang/comments/g8d8jk/whats_coming_in_go_115_slides_by_daniel_mart%C3%AD/)

- Final Articles / Posts:
    - Non dated:
        - [Qix - Go](https://github.com/ty4z2008/Qix/blob/master/golang.md)
        - [Why Go](https://github.com/golang/go/wiki/WhyGo)
    - Dated:
        - 2020-11-05 - [Combining DDD, CQRS, and Clean Architecture by refactoring a Go project](https://threedots.tech/post/ddd-cqrs-clean-architecture-combined/) - [reddit](https://www.reddit.com/r/golang/comments/join3w/combining_ddd_cqrs_and_clean_architecture_by/)
        - 2019-11-25 - [Choosing Go at American Express](https://americanexpress.io/choosing-go/)
        - 2018-02-02 - [posener/go-shebang-story.md](https://gist.github.com/posener/73ffd326d88483df6b1cb66e8ed1e0bd) - Story: Writing Scripts with Go
