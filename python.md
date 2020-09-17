# Python

- Check your `python` version

    ```bash
    $ python --version

    $ python3 --version
    ```

- Check your `python` binary paths

    ```bash
    $ which python
    /usr/bin/python

    $ which python3
    /path/to/python3
    ```

- Install `python` from `ppa:deadsnakes/ppa` repository (more info [here](https://python.tutorials24x7.com/blog/how-to-install-python-3-8-on-ubuntu-1804-lts))

    ```bash
    # update available packages
    $ sudo apt update

    # install prerequisites to use add-apt-repository
    $ sudo apt install software-properties-common

    # add `deadsnakes` package archive
    $ sudo add-apt-repository ppa:deadsnakes/ppa

    # update available packages, including last package archive included
    $ sudo apt update

    # install python 3.8
    $ sudo apt install python3.8
    ```

- [pip](https://github.com/pypa/pip) - The Python package installer

    ```bash
    # AVOID install from apt packages
    # $ sudo apt install python3-pip

    # download get-pip.py file
    $ wget https://bootstrap.pypa.io/get-pip.py

    # get path from python3.8 binary
    $ which python3.8
    /path/to/python3.8

    # install with your python version you want, e.g. Python 3.8
    $ /path/to/python3.8 get-pip.py

    # install pip for your user (inside $HOME)
    $ /path/to/python3.8 get-pip.py --user
    # --user
    # Install to the Python user install directory for your platform.
    # Typically ~/.local/, or %APPDATA%Python on Windows.
    # (See the Python documentation for site.USER_BASE for full details.)

    # After install with --user
    $ ls -la $(which pip)
    -rwxrwxr-x 1 $USER $USER 223 May 23 21:00 $HOME/.local/bin/pip
    $ ls -la $(which pip3)
    -rwxrwxr-x 1 $USER $USER 223 May 23 21:00 $HOME/.local/bin/pip3
    $ ls -la $(which pip3.8)
    -rwxrwxr-x 1 $USER $USER 223 May 23 21:00 $HOME/.local/bin/pip3.8

    # this will create a pip command appended with python version
    $ pip3.8

    # avoid warning because of locale
    $ export LC_ALL=C

    # Troubleshooting
    # > Defaulting to user installation because normal site-packages is not writeable
    # /usr/local/lib/pythonX.Y/site-packages don't exist OR
    # /usr/lib/python3/site-packages
    # $HOME/.local/lib/pythonX.Y/site-packages exists
    # maybe because you install pip with --user
    # https://stackoverflow.com/questions/122327/how-do-i-find-the-location-of-my-python-site-packages-directory
    $ python3 -c 'import site; print(site.getsitepackages())'
    ['/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '/usr/lib/python3.8/dist-packages']

    $ python3 -m site
    sys.path = [
        '$HOME',
        '/usr/lib/python38.zip',
        '/usr/lib/python3.8',
        '/usr/lib/python3.8/lib-dynload',
        '$HOME/.local/lib/python3.8/site-packages',
        '/usr/local/lib/python3.8/dist-packages',
        '/usr/lib/python3/dist-packages',
    ]
    USER_BASE: '$HOME/.local' (exists)
    USER_SITE: '$HOME/.local/lib/python3.8/site-packages' (exists)
    ENABLE_USER_SITE: True

    $ python3 -m site --user-site
    $HOME/.local/lib/python3.8/site-packages
    ```

    - [Installing with get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py)
    - [User Guide](https://pip.pypa.io/en/stable/user_guide/)
    - [Releases @ Github](https://github.com/pypa/pip/releases)

    - Troubleshooting / Resources
        - [What is the purpose of “pip install --user …”?](https://stackoverflow.com/questions/42988977/what-is-the-purpose-of-pip-install-user)
        - [Default to --user #1668 @ Github](https://github.com/pypa/pip/issues/1668)


- Change `pip3` command to `pip` **(optional)**

    ```bash
    $ pip --version
    pip 20.1 from /usr/local/lib/python2.7/dist-packages/pip (python 2.7)

    $ pip3 --version
    pip 20.1 from /usr/local/lib/python3.7/dist-packages/pip (python 3.7)

    $ which -a pip
    /usr/local/bin/pip
    /usr/bin/pip

    $ which -a pip2
    /usr/local/bin/pip2
    /usr/bin/pip2

    $ which -a pip3
    /usr/local/bin/pip3
    /usr/bin/pip3

    $ ls -la /usr/bin/pip*
    -rwxr-xr-x 1 root root 283 Nov 10  2016 /usr/bin/pip2

    $ ls -la /usr/local/bin/pip*
    -rwxr-xr-x 1 root root 223 May  6 02:50 /usr/local/bin/pip
    -rwxr-xr-x 1 root root 223 May  6 01:40 /usr/local/bin/pip2
    -rwxr-xr-x 1 root root 223 May  6 01:40 /usr/local/bin/pip2.7
    -rwxr-xr-x 1 root root 223 May  6 02:50 /usr/local/bin/pip3
    -rwxr-xr-x 1 root root 216 Nov 22  2018 /usr/local/bin/pip3.5
    -rwxr-xr-x 1 root root 218 Nov 22  2018 /usr/local/bin/pip3.6
    -rwxr-xr-x 1 root root 223 May  6 02:50 /usr/local/bin/pip3.7
    -rwxr-xr-x 1 root root 206 Feb  5  2017 /usr/local/bin/pipenv

    $ cp /path/to/pip3 /path/to/pip
    ```

- Update `pip` and core packages: setuptools, wheel

    ```bash
    $ pip install -U pip setuptools wheel
    ```

- Working with virtual environments: instal and setup `virtualenv` & `virtualenvwrapper`

    ```bash
    # step 1: install important packages
    $ pip install -U virtualenv virtualenvwrapper
    # (2020-06-01 16:43:58)
    # Successfully installed appdirs-1.4.4 distlib-0.3.0 filelock-3.0.12 virtualenv-20.0.21
    # Successfully installed stevedore-1.32.0 virtualenv-clone-0.5.4 virtualenvwrapper-4.8.4

    # don't remember this will make virtual envs use python version defined through pip
    # to verify it:

    # - check shebang of virtualenv
    # $ which virtualenv
    # /path/to/virtualenv
    # $ head -n 1 /path/to/virtualenv
    # #!/usr/bin/python
    # #!/usr/bin/python3.8

    # - check pip version with python used on shebang
    # $ /usr/bin/python -m pip --version
    # pip 20.1.1 from $HOME/.local/lib/python3.8/site-packages/pip (python 3.8)

    # step 2: add config to load when launch a shell sessioon
    $ nano $HOME/.bashrc
    # add below lines at the end of $HOME/.bashrc file
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6
    export WORKON_HOME=$HOME/Envs
    mkdir -p $WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh

    # step 3: load it
    $ source $HOME/.bashrc
    ```

- Working with virtual environments: management commands

    ```bash
    # create a virtual environment
    $ mkvirtualenv
    $ mkvirtualenv -p python3.8 {{ virtualenv name }}
    $ mkvirtualenv -p /usr/bin/python3.8 {{ virtualenv name }}
    $ mkvirtualenv --python=python3.8 {{ virtualenv name }}
    $ mkvirtualenv --python=/usr/bin/python3.8 {{ virtualenv name }}
    # don't forget to update pip core packages inside virtual envs
    # $ pip install -U pip setuptools wheel

    # enter to a virtual environment
    $ workon {{ virutal env name }}

    # logout off virtual environment
    $ deactivate

    # delete a virtual environment
    $ rmvirtualenv

    # list all virtual environment
    $ lsvirtualenv

    # change working directory to virtual environment folder
    $ cdvirtualenv
    ```

- Install extra python packages (`Python.h`) for avoid posterior problems, like with [glances](https://github.com/nicolargo/glances)

    ```bash
    $ apt install python-dev
    $ apt install python3-dev
    ```

- Start up a minimal http server

    ```bash
    # Python 3
    $ python3.7 -m http.server 8000 --bind 0.0.0.0

    # Python 2
    $ python -m SimpleHTTPServer
    ```

## Setup

### Soft link to python if your machine only have python3

Create soft link to `python` binary in `$HOME/bin` if no `python` cmd in your OS

`$HOME/bin` should be at `$PATH`

```bash
$ ln -s /usr/bin/python3 $HOME/bin/python
```

### Install pip in locally (in your home directory)

- Verify `python` version and installation path

    ```bash
    $ which python3.8
    /path/to/python3.8
    ```

- Verify `pip` version and installation path considering which python binary you're using

    ```bash
    $ /path/to/python3.8 -m pip --version
    ```

- Run `pip` installer

    ```bash
    $ /path/to/python3.8 get-pip.py --user
    ```

- Check if `pip` was installed in right folders

    ```bash
    # where binaries are saved
    $ ls ${HOME}/.local/bin/

    # where libraries download and installed via pip (locally) are saved
    $ ls ${HOME}/.local/lib/

    # where libraries are downloaded temporarily is you want to install again
    $ ls ${HOME}/.cache/pip/
    ```

### Pyenv

- Clone `pyenv` repo into `$HOME/.pyenv`

    ```bash
    $  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
    ```

- Define useful environment variables

    ```bash
    # at your .bashrc
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    ```

- Add `pyenv init` validation to my shell

    ```bash
    # at your .bashrc
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
    ```

- Restart `$SHELL`

    ```bash
    $ exec $SHELL
    ```

- Install [Python dependencies](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

- Install Python versions you want

    ```bash
    # list all available versions
    $ pyenv install -l

    $ pyenv install 3.7.8
    ```

- Commands (and its output) to verify if `pyenv` installation works

    ```bash
    $ pyenv global
    system

    $ pyenv version
    system (set by $HOME/.pyenv/version)

    $ pyenv versions
    * system (set by $HOME/.pyenv/version)

    $ pyenv shell
    pyenv: no shell-specific version configured

    $ pyenv local
    pyenv: no local version configured for this directory

    $ pyenv exec
    Usage: pyenv exec <command> [arg1 arg2...]

    $ pyenv prefix
    $HOME

    $ pyenv rehash

    $ pyenv root
    $HOME/.pyenv

    $ pyenv shims

    $ pyenv whence
    Usage: pyenv whence [--path] <command>

    $ pyenv which
    Usage: pyenv which <command>
    ```

### Venv

- Create a environment

    ```bash
    $ python -m venv {{ /path/to/env }}
    # e.g.:
    $ python -m venv ./myenv/
    ```

- Activate environment

    ```bash
    $ source {{ /path/to/env }}/bin/activate
    ```

- Deactivate environment

    ```bash
    $ deactivate
    ```

- Update `pip`, `setuptools` & `wheel`, after creating new environment

    ```bash
    # activate environment
    $ source myenv/bin/activate
    $ pip install -U pip setuptools wheel
    ```

### Linters

If you're going to use for one project, install on a virtual environment

- [pycodestyle](https://github.com/PyCQA/pycodestyle)

    - Config for VSCode

        ```shell
            # Workspace settings file
            # pycodestyle path to python binary path used
            ...
            "python.pythonPath": "/path/to/project/venv/bin/python",
            ...
            "python.linting.pycodestyleEnabled": true,
            "python.linting.pycodestyleArgs": [
                "--max-line-length=80"
            ],
            ...
        ```

- [pylint](https://github.com/PyCQA/pylint)
    - [Readable pylint messages](https://github.com/janjur/readable-pylint-messages/blob/master/README.md)
    - [@ Visual Studio Code Docs](https://code.visualstudio.com/docs/python/linting#_pylint)
    - [PyLint Messages - all codes](http://pylint-messages.wikidot.com/all-codes)

### Code formatters

If you're going to use for one project, install on a virtual environment

- [black](https://github.com/psf/black)

    - Config for VSCode

        ```shell
            # Workspace settings file
            ...
            "python.formatting.provider": "black",
            "python.formatting.blackPath": "/path/to/project/venv/bin/black",
            "python.formatting.blackArgs": [
                "--line-length=80"
            ],
            ...
        ```

## Debugging

- Add trace to start debug from a line

    ```python
    import pdb; pdb.set_trace()
    ```

- Important commands

    ```text
    s(tep)
    n(ext)
    unt(il) [lineno]
    r(eturn)
    c(ont(inue))
    j(ump) lineno
    ```

- Adding traceback in `exception` clause:

    ```python
    traceback.print_exc(file=sys.stderr)
    ```

## Django

- Load specific settings to Django `commands`

    ```bash
    # option 1
    export DJANGO_SETTINGS_MODULE={{ module.to.django.settings }}
    python manage.py {{ any command }}

    # option 2
    DJANGO_SETTINGS_MODULE={{ module.to.django.settings }} python manage.py {{ any command }}
    ```

## Troubleshooting

- Install `python` packages with `pip --user` (install `pip` in `$HOME/.local/bin` and python packages in `$HOME/.local/lib/pythonX.X`)

    ```bash
    # If you find an error like this -> https://github.com/pypa/pip/issues/5599

    # Remove everything related to python on $HOME/.local/bin and $HOME/.local/lib
    $ rm .local/bin/.easy_install*
    $ rm .local/bin/easy_install*
    $ rm .local/bin/.wheel*
    $ rm .local/bin/wheel*
    $ rm .local/bin/.pip*
    $ rm .local/bin/pip*
    $ rm .local/lib/python*

    # Install pip with python version (with sudo)
    $ wget https://bootstrap.pypa.io/get-pip.py
    $ sudo /usr/bin/python3.X get-pip.py
    ```

- While updating `setuptools` (2020-08-18)

    ```bash
    $ pip install -U setuptools
    Defaulting to user installation because normal site-packages is not writeable
    Collecting setuptools
    Using cached setuptools-49.6.0-py3-none-any.whl (803 kB)
    Installing collected packages: setuptools
    ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.

    We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.

    launchpadlib 1.10.13 requires testresources, which is not installed.
    ```

## Resources

- Linters
    - [pycodestyle](https://github.com/PyCQA/pycodestyle) - https://github.com/PyCQA/pycodestyle
    - [pylint](https://github.com/PyCQA/pylint) - It's not just a linter that annoys you!

- Code formatters
    - [black](https://github.com/psf/black)

- Static Type Checker
    - [mypy](https://github.com/python/mypy/) - Optional static typing for Python 3 and 2 (PEP 484)
    - [pyright](https://github.com/microsoft/pyright) - Static type checker for Python
        - [pylance-release](https://github.com/microsoft/pylance-release) - Documentation and issues for Pylance
    - [returns](https://github.com/dry-python/returns) - Make your functions return something meaningful, typed, and safe! returns.rtfd.io

- PEP related
    - [PEP 8](https://www.python.org/dev/peps/pep-0008/)
    - [PEP 257](https://www.python.org/dev/peps/pep-0257/) -- Docstring Conventions
    - [elements-of-python-style](https://github.com/amontalenti/elements-of-python-style) - Goes beyond PEP8 to discuss what makes Python code feel great. A Strunk & White for Python.
    - [Google Python Style Guide](https://github.com/google/styleguide/blob/gh-pages/pyguide.md)
    - [Khan Python Style Guide](https://github.com/Khan/style-guides/blob/master/style/python.md)

- Data & Databases
    - [databases](https://github.com/encode/databases) - Async database support for Python
    - [faker](https://github.com/joke2k/faker) - Faker is a Python package that generates fake data for you. http://faker.rtfd.org
    - [pydantic](https://github.com/samuelcolvin/pydantic) - Data parsing and validation using Python type hints pydantic-docs.helpmanual.io
    - [schematics](https://github.com/schematics/schematics) - Python Data Structures for Humans™. http://schematics.readthedocs.org
    - [cerberus](https://github.com/pyeve/cerberus) - Lightweight, extensible data validation library for Python http://python-cerberus.org
    - [glom](https://github.com/mahmoud/glom) - comet Python's nested data operator (and CLI), for all your declarative restructuring needs. Got data? Glom it! comet glom.readthedocs.io

- Web frameworks (!= web server)
    - [Web frameworks for Python, most starred on Github](https://github.com/mingrammer/python-web-framework-stars)
    - [Sanic](https://github.com/huge-success/sanic)
    - [Nameko](https://github.com/nameko/nameko)
    - [Japronto](https://github.com/squeaky-pl/japronto)

- Logging
    - [Ultimate Guide to Python Debugging](https://martinheinz.dev/blog/24) - [hacker news](https://news.ycombinator.com/item?id=23386537)
    - [Python logging tutorial](http://zetcode.com/python/logging/)
    - [LogRecord attributes](https://docs.python.org/3/library/logging.html#logrecord-attributes)
    - [Logging Levels](https://docs.python.org/3/library/logging.html#logging-levels)

- Debug
    - [PySnooper](https://github.com/cool-RR/PySnooper) - Never use print for debugging again
    - [stackprinter](https://github.com/cknd/stackprinter) - Debugging-friendly exceptions for Python

- Benchmark
    - [FrameworkBenchmarks](https://github.com/TechEmpower/FrameworkBenchmarks) - Source for the TechEmpower Framework Benchmarks project techempower.com/benchmarks

- Dependency Management
    - [Python Application Dependency Management in 2018](https://hynek.me/articles/python-app-deps-2018/)
    - [Overview of python dependency management tools](https://modelpredict.com/python-dependency-management-tools)

- Extra tools
    - [httpx](https://github.com/encode/httpx) - A next generation HTTP client for Python. butterfly python-httpx.org
    - [locust](https://github.com/locustio/locust) - Scalable user load testing tool written in Python
    - [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole) - Pi-hole in a docker container
    - [healthchecks](https://github.com/healthchecks/healthchecks) - A Cron Monitoring Tool written in Python & Django healthchecks.io
    - [pyperclip](https://github.com/asweigart/pyperclip) - Python module for cross-platform clipboard functions. pypi.python.org/pypi/pyperclip
    - reloading
        - [reloading](https://github.com/julvo/reloading) - Change Python code while it's running using a reloading loop
        - [watchgod](https://github.com/samuelcolvin/watchgod) - Simple, modern file watching and code reload in python.
        - [hotreload](https://github.com/say4n/hotreload) - hot reload your python code!
        - [aiohttp-devtools](https://github.com/aio-libs/aiohttp-devtools) - dev tools for aiohttp
    - task queue
        - [celery](https://github.com/celery/celery)
        - [faust](https://github.com/robinhood/faust)
    - extract pdf
        - [pdftabextract](https://github.com/WZBSocialScienceCenter/pdftabextract) - A set of tools for extracting tables from PDF files helping to do data mining on (OCR-processed) scanned documents. https://datascience.blog.wzb.eu/2017/…
    - finance
        - [yfinance](https://github.com/ranaroussi/yfinance) - Yahoo! Finance market data downloader (+faster Pandas Datareader) https://aroussi.com/post/python-yahoo
    - profiler
        - [vprof](https://github.com/nvdv/vprof) - Visual profiler for Python
    - plotting
        - [bokeh](https://github.com/bokeh/bokeh) - Interactive Data Visualization in the browser, from Python
        - [matplotlib](https://github.com/matplotlib/matplotlib) - matplotlib: plotting with Python
        - [pyecharts](https://github.com/pyecharts/pyecharts) - Python Echarts Plotting Library
        - [plotly](https://github.com/plotly/plotly.py) - The interactive graphing library for Python (includes Plotly Express)
        - [seaborn](https://github.com/mwaskom/seaborn) - Statistical data visualization using matplotlib
        - [chartify](https://github.com/spotify/chartify) - Python library that makes it easy for data scientists to create charts.
    - documentation
        - [mkdocs](https://github.com/mkdocs/mkdocs) - Project documentation with Markdown.
        - [sphinx](https://github.com/sphinx-doc/sphinx) - Main repository for the Sphinx documentation builder

- Extra info
    - [cheat.sh](https://github.com/chubin/cheat.sh) - the only cheat sheet you need
    - [pysheeet](https://github.com/crazyguitar/pysheeet) - Python Cheat Sheet

- Machine Learning
    - [streamlit](https://github.com/streamlit/streamlit) - Streamlit — The fastest way to build custom ML tools streamlit.io

- stackoverflow
    - [How to save a dictionary to a file?](https://stackoverflow.com/questions/19201290/how-to-save-a-dictionary-to-a-file)

- Interesting posts
    - [The Best of the Best Practices (BOBP) Guide for Python](https://gist.github.com/sloria/7001839)
    - [Getting Started with Python in VS Code](https://code.visualstudio.com/docs/python/python-tutorial)
    - [Save a dictionary to a file](https://pythonspot.com/save-a-dictionary-to-a-file/)
    - [EAFP - Easier to ask for forgiveness than permission](https://docs.python.org/3/glossary.html#term-eafp)
    - [Python args and kwargs: Demystified](https://realpython.com/python-kwargs-and-args/)
