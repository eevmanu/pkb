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
    $ python -m venv env
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

- What's New:
    - [3.0](https://docs.python.org/3.0/whatsnew/3.0.html)
    - [3.1](https://docs.python.org/3.1/whatsnew/3.1.html)
    - [3.2](https://docs.python.org/3.2/whatsnew/3.2.html)
    - [3.3](https://docs.python.org/3.3/whatsnew/3.3.html)
    - [3.4](https://docs.python.org/3.4/whatsnew/3.4.html)
    - [3.5](https://docs.python.org/3.5/whatsnew/3.5.html)
    - [3.6](https://docs.python.org/3.6/whatsnew/3.6.html)
    - [3.7](https://docs.python.org/3.7/whatsnew/3.7.html)
    - [3.8](https://docs.python.org/3.8/whatsnew/3.8.html)
    - [3.9](https://docs.python.org/3.9/whatsnew/3.9.html)
    - [3.10](https://docs.python.org/3.10/whatsnew/3.10.html)

- PEP / Bugs / Issues / Discuss related:
    - [PEP 8](https://www.python.org/dev/peps/pep-0008/)
    - [PEP 257](https://www.python.org/dev/peps/pep-0257/) -- Docstring Conventions
    - [PEP 20](https://www.python.org/dev/peps/pep-0020/) - The Zen of Python
    - [PEP 361](https://www.python.org/dev/peps/pep-0361/) - Python 2.6 and 3.0 Release Schedule
    - [PEP 375](https://www.python.org/dev/peps/pep-0375/) - Python 3.1 Release Schedule
    - [PEP 392](https://www.python.org/dev/peps/pep-0392/) - Python 3.2 Release Schedule
    - [PEP 398](https://www.python.org/dev/peps/pep-0398/) - Python 3.3 Release Schedule
    - [PEP 429](https://www.python.org/dev/peps/pep-0429/) - Python 3.4 Release Schedule
    - [PEP 478](https://www.python.org/dev/peps/pep-0478/) - Python 3.5 Release Schedule
    - [PEP 494](https://www.python.org/dev/peps/pep-0494/) - Python 3.6 Release Schedule
        - [Python 3.6.12](https://www.python.org/downloads/release/python-3612/) release notes
    - [PEP 537](https://www.python.org/dev/peps/pep-0537/) - Python 3.7 Release Schedule
        - [Python 3.7.9](https://www.python.org/downloads/release/python-379/) release notes
    - [PEP 569](https://www.python.org/dev/peps/pep-0569/) - Python 3.8 Release Schedule
        - [Python 3.8.5](https://www.python.org/downloads/release/python-385/) release notes
    - [PEP 596](https://www.python.org/dev/peps/pep-0596/) - Python 3.9 Release Schedule
        - [Python 3.9.0 release candidate 2](https://www.python.org/downloads/release/python-390rc2/) release notes
        - [Python 3.9.0 official](https://www.python.org/downloads/release/python-390/) release notes
        - [PEP 602](https://www.python.org/dev/peps/pep-0602/) - Annual Release Cycle for Python
            - [[ACCEPTED] PEP 602: Annual Release Cycle for Python](https://discuss.python.org/t/accepted-pep-602-annual-release-cycle-for-python/2296)
        - [Features for 3.9](https://www.python.org/dev/peps/pep-0596/#id7)
            - [PEP 584](https://www.python.org/dev/peps/pep-0584/) - Add Union Operators To dict
            - [PEP 585](https://www.python.org/dev/peps/pep-0585/) - Type Hinting Generics In Standard Collections
            - [PEP 593](https://www.python.org/dev/peps/pep-0593/) - Flexible function and variable annotations
            - [PEP 614](https://www.python.org/dev/peps/pep-0614/) - Relaxing Grammar Restrictions On Decorators
            - [PEP 615](https://www.python.org/dev/peps/pep-0615/) - Support for the IANA Time Zone Database in the Standard Library
            - [PEP 616](https://www.python.org/dev/peps/pep-0616/) - String methods to remove prefixes and suffixes
            - [PEP 617](https://www.python.org/dev/peps/pep-0617/) - New PEG parser for CPython
        - [Google: "Python 3.9" site:bugs.python.org](https://www.google.com/search?q=%22Python+3.9%22+site%3Abugs.python.org)
        - View listed bugs included in **3.9** release version:
            - Go to [Python Bugs](https://bugs.python.org/)
            - Go to [Issues Search](https://bugs.python.org/issue?@template=search&status=1)
            - In *Stage*, select **resolved** and fill Display checkbox
            - In *Versions*, select **3.9** and fill Display checkbox
            - In *Status*, select **closed** and fill Display checkbox
            - In *Resolution*, select **fixed** and fill Display checkbox
        - [hn](https://news.ycombinator.com/item?id=24691565)
    - [PEP 619](https://www.python.org/dev/peps/pep-0619/) - Python 3.10 Release Schedule
        - [Python 3.10.0 alpha 1](https://www.python.org/downloads/release/python-3100a1/) release notes

- Coding Tools:
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
        - [facebook/pyre-check](https://github.com/facebook/pyre-check) - Performant type-checking for python.
            - [pysa](https://pyre-check.org/docs/pysa-basics/) -
            - [Taint Analysis](https://github.com/facebook/pyre-check/tree/master/stubs/taint)

- Best Practices & Style Guides:
    - [The Best of the Best Practices (BOBP) Guide for Python](https://gist.github.com/sloria/7001839)
    - [Google Python Style Guide](https://github.com/google/styleguide/blob/gh-pages/pyguide.md)
    - [elements-of-python-style](https://github.com/amontalenti/elements-of-python-style) - Goes beyond PEP8 to discuss what makes Python code feel great. A Strunk & White for Python.
    - [Khan Python Style Guide](https://github.com/Khan/style-guides/blob/master/style/python.md)
    - [ultimate-python](https://github.com/huangsam/ultimate-python) - Ultimate Python study guide for newcomers and professionals alike.

- Web frameworks (!= web server):
    - [Web frameworks for Python, most starred on Github](https://github.com/mingrammer/python-web-framework-stars)
    - [Sanic](https://github.com/huge-success/sanic)
    - [Nameko](https://github.com/nameko/nameko)
    - [Japronto](https://github.com/squeaky-pl/japronto)
    - [starlette](https://github.com/encode/starlette) - The little ASGI framework that shines.
    - Benchmarks
        - [FrameworkBenchmarks](https://github.com/TechEmpower/FrameworkBenchmarks) - Source for the TechEmpower Framework Benchmarks project techempower.com/benchmarks

- Django:
    - [DjangoBlog](https://github.com/liangliangyy/DjangoBlog) - Django-based blog system

- Data related tools (orm, database, etc...):
    - [databases](https://github.com/encode/databases) - Async database support for Python
    - [faker](https://github.com/joke2k/faker) - Faker is a Python package that generates fake data for you. http://faker.rtfd.org
    - [pydantic](https://github.com/samuelcolvin/pydantic) - Data parsing and validation using Python type hints [manual](https://pydantic-docs.helpmanual.io)
    - [schematics](https://github.com/schematics/schematics) - Python Data Structures for Humans™. http://schematics.readthedocs.org
    - [cerberus](https://github.com/pyeve/cerberus) - Lightweight, extensible data validation library for Python http://python-cerberus.org
    - [glom](https://github.com/mahmoud/glom) - comet Python's nested data operator (and CLI), for all your declarative restructuring needs. Got data? Glom it! comet glom.readthedocs.io
    - [duckdb](https://github.com/cwida/duckdb) - DuckDB is an embeddable SQL OLAP Database Management System
    - [peewee](https://github.com/coleifer/peewee) - a small, expressive orm -- supports postgresql, mysql and sqlite
    - [pgcli](https://github.com/dbcli/pgcli) - Postgres CLI with autocompletion and syntax highlighting
    - [asyncpg](https://github.com/MagicStack/asyncpg) - A fast PostgreSQL Database Client Library for Python/asyncio.
    - [records](https://github.com/kennethreitz-archive/records) - SQL for Humans™
    - [edgedb](https://github.com/edgedb/edgedb) - The next generation relational database.
    - [sqlmapproject/sqlmap](https://github.com/sqlmapproject/sqlmap) - Automatic SQL injection and database takeover tool
    - Resources:
        - 2020-10-01 - [Python has a Built-in Database — Here’s How to use it](https://towardsdatascience.com/python-has-a-built-in-database-heres-how-to-use-it-47826c10648a)

- Scraping & related:
    - [alirezamika/autoscraper](https://github.com/alirezamika/autoscraper) - A Smart, Automatic, Fast and Lightweight Web Scraper for Python
    - [scrapy/parsel](https://github.com/scrapy/parsel) - Parsel lets you extract data from XML/HTML documents using XPath or CSS selectors
    - [WZBSocialScienceCenter/pdftabextract](https://github.com/WZBSocialScienceCenter/pdftabextract) - A set of tools for extracting tables from PDF files helping to do data mining on (OCR-processed) scanned documents. https://datascience.blog.wzb.eu/2017/…
    - [xtream1101/scraperx](https://github.com/xtream1101/scraperx) - Library for scraping websites or apis at any scale
    - [asweigart/pyautogui](https://github.com/asweigart/pyautogui) - A cross-platform GUI automation Python module for human beings. Used to programmatically control the mouse & keyboard.

- Logging:
    - [Ultimate Guide to Python Debugging](https://martinheinz.dev/blog/24) - [hacker news](https://news.ycombinator.com/item?id=23386537)
    - [Python logging tutorial](http://zetcode.com/python/logging/)
    - [LogRecord attributes](https://docs.python.org/3/library/logging.html#logrecord-attributes)
    - [Logging Levels](https://docs.python.org/3/library/logging.html#logging-levels)
    - [A little log decorator for debugging, more info in comments](https://www.reddit.com/r/Python/comments/ijkdem/a_little_log_decorator_for_debugging_more_info_in/)
    - [The Most Diabolical Python Antipattern](https://realpython.com/the-most-diabolical-python-antipattern/)

- Testing:
    - [locust](https://github.com/locustio/locust) - Scalable user load testing tool written in Python
    - [playwright-python](https://github.com/microsoft/playwright-python) - Python version of the Playwright testing and automation library - [web](https://playwright.dev/).

- Debug / Logs:
    - [PySnooper](https://github.com/cool-RR/PySnooper) - Never use print for debugging again
    - [stackprinter](https://github.com/cknd/stackprinter) - Debugging-friendly exceptions for Python
    - [loguru](https://github.com/Delgan/loguru) - Python logging made (stupidly) simple

- Concurrency / Parallelism / Multiprocessing / Multithreading / Asynchronous (async/await) related:
    - Non-dated
        - [Python Docs: multiprocessing — Process-based parallelism](https://docs.python.org/3/library/multiprocessing.html)
        - [What is the difference between concurrency and parallelism?](https://stackoverflow.com/questions/1050222/what-is-the-difference-between-concurrency-and-parallelism)
        - [What is the difference between concurrent programming and parallel programming?](https://stackoverflow.com/questions/1897993/what-is-the-difference-between-concurrent-programming-and-parallel-programming)
        - [Haskell Wiki - Parallelism vs. Concurrency](https://wiki.haskell.org/Parallelism_vs._Concurrency)
    - Dated
        - 2020-09-06 - [Show HN: Parallelise pipelines of Python async iterables](https://news.ycombinator.com/item?id=24390116)
        - 2020-07-06 - [Speeding Up Python with Concurrency, Parallelism, and asyncio](https://testdriven.io/blog/concurrency-parallelism-asyncio/)
        - 2020-05-06 - [Concurrency In Python For Network I/O - Synchronous, Threading, Multiprocessing and Asynchronous IO](https://www.nagekar.com/2020/05/python-io-benchmarks.html)
            - Synchronous with `requests` module
            - Parallel with `multiprocessing` module
            - Threaded with `threading` module
            - Event loop based with `asyncio` module
        - 2020-05-03 - [Neuromancer Blues: Threading vs Multiprocessing](https://www.datasciencecentral.com/profiles/blogs/neuromancer-blues-threading-vs-multiprocessing)
        - 2020-02-16 - [A better way for asynchronous programming: asyncio over multi-threading](https://towardsdatascience.com/a-better-way-for-asynchronous-programming-asyncio-over-multi-threading-3457d82b3295)
        - 2019-09-07 - [Multiprocessing vs. Threading in Python: What Every Data Scientist Needs to Know](https://blog.floydhub.com/multiprocessing-vs-threading-in-python-what-every-data-scientist-needs-to-know/)

- Machine Learning & related:
    - [streamlit](https://github.com/streamlit/streamlit) - Streamlit — The fastest way to build custom ML tools streamlit.io
    - [life4/textdistance](https://github.com/life4/textdistance) - Compute distance between sequences. 30+ algorithms, pure python implementation, common interface, optional external libs usage.
    - [openai/gym](https://github.com/openai/gym) - A toolkit for developing and comparing reinforcement learning algorithms.
    - [eriklindernoren/ML-From-Scratch](https://github.com/eriklindernoren/ML-From-Scratch) - Machine Learning From Scratch. Bare bones NumPy implementations of machine learning models and algorithms with a focus on accessibility. Aims to cover everything from linear regression to deep learning.
    - [Yorko/mlcourse.ai](https://github.com/Yorko/mlcourse.ai) - Open Machine Learning Course
    - [instillai/machine-learning-course](https://github.com/instillai/machine-learning-course) - Machine Learning Course with Python
    - [lyst/lightfm](https://github.com/lyst/lightfm) - A Python implementation of LightFM, a hybrid recommendation algorithm.
    - [ShangtongZhang/DeepRL](https://github.com/ShangtongZhang/DeepRL) - Modularized Implementation of Deep RL Algorithms in PyTorch
    - [uber/causalml](https://github.com/uber/causalml) - Uplift modeling and causal inference with machine learning algorithms
    - [vitchyr/rlkit](https://github.com/vitchyr/rlkit) - Collection of reinforcement learning algorithms

- Finance:
    - [yfinance](https://github.com/ranaroussi/yfinance) - Yahoo! Finance market data downloader (+faster Pandas Datareader) more info [here](https://aroussi.com/post/python-yahoo)
    - [twelvedata-python](https://github.com/twelvedata/twelvedata-python) - Twelve Data Python Client - Financial data APIs & WebSockets
    - [stonky](https://github.com/jkwill87/stonky) - A command line dashboard for monitoring stocks
    - [quantopian/zipline](https://github.com/quantopian/zipline) - Zipline, a Pythonic Algorithmic Trading Library
    - [ricequant/rqalpha](https://github.com/ricequant/rqalpha) - A extendable, replaceable Python algorithmic backtest && trading framework supporting multiple securities
    - [gbeced/pyalgotrade](https://github.com/gbeced/pyalgotrade) - Python Algorithmic Trading Library
    - [tradytics/eiten](https://github.com/tradytics/eiten) - Statistical and Algorithmic Investing Strategies for Everyone

- Extra tools:
    - [httpx](https://github.com/encode/httpx) - A next generation HTTP client for Python. butterfly
    - [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole) - Pi-hole in a docker container
    - [healthchecks](https://github.com/healthchecks/healthchecks) - A Cron Monitoring Tool written in Python & Django healthchecks.io
    - [alerta](https://github.com/alerta/alerta) - Alerta monitoring system
    - [pyperclip](https://github.com/asweigart/pyperclip) - Python module for cross-platform clipboard functions. pypi.python.org/pypi/pyperclip
    - [path](https://github.com/jaraco/path) - Object-oriented file system path manipulation
        - [pathlib](https://docs.python.org/3/library/pathlib.html) added on 3.4
        - [What does this package do? - Episode 4: Pathlib](https://www.youtube.com/watch?v=YwhOUyTxXVE)
    - [DjangoBlog](https://github.com/liangliangyy/DjangoBlog) - Django-based blog system
    - Reloading:
        - [reloading](https://github.com/julvo/reloading) - Change Python code while it's running using a reloading loop
        - [watchgod](https://github.com/samuelcolvin/watchgod) - Simple, modern file watching and code reload in python.
        - [hotreload](https://github.com/say4n/hotreload) - hot reload your python code!
        - [aiohttp-devtools](https://github.com/aio-libs/aiohttp-devtools) - dev tools for aiohttp
    - Task queue:
        - [celery](https://github.com/celery/celery)
        - [faust](https://github.com/robinhood/faust)
    - Profiler:
        - [vprof](https://github.com/nvdv/vprof) - Visual profiler for Python
    - Plotting:
        - [bokeh](https://github.com/bokeh/bokeh) - Interactive Data Visualization in the browser, from Python
        - [matplotlib](https://github.com/matplotlib/matplotlib) - matplotlib: plotting with Python
        - [pyecharts](https://github.com/pyecharts/pyecharts) - Python Echarts Plotting Library
        - [plotly](https://github.com/plotly/plotly.py) - The interactive graphing library for Python (includes Plotly Express)
        - [seaborn](https://github.com/mwaskom/seaborn) - Statistical data visualization using matplotlib
        - [chartify](https://github.com/spotify/chartify) - Python library that makes it easy for data scientists to create charts.
    - Docs:
        - [mkdocs](https://github.com/mkdocs/mkdocs) - Project documentation with Markdown.
        - [sphinx](https://github.com/sphinx-doc/sphinx) - Main repository for the Sphinx documentation builder

- Interesting repos:
    - [TheAlgorithms/Python](https://github.com/TheAlgorithms/Python) - All Algorithms implemented in Python
    - [donnemartin/interactive-coding-challenges](https://github.com/donnemartin/interactive-coding-challenges) - 120+ interactive Python coding interview challenges (algorithms and data structures). Includes Anki flashcards.
    - [keon/algorithms](https://github.com/keon/algorithms) - Minimal examples of data structures and algorithms in Python
    - [rushter/MLAlgorithms](https://github.com/rushter/MLAlgorithms) - Minimal and clean examples of machine learning algorithms implementations
    - [OmkarPathak/pygorithm](https://github.com/OmkarPathak/pygorithm) - A Python module for learning all major algorithms
    - [billryan/algorithm-exercise](https://github.com/billryan/algorithm-exercise) - Data Structure and Algorithm notes
    - [joowani/binarytree](https://github.com/joowani/binarytree) - Python Library for Studying Binary Trees
    - [MTrajK/coding-problems](https://github.com/MTrajK/coding-problems) - Solutions for various coding/algorithmic problems and many useful resources for learning algorithms and data structures

- Cheat Sheets:
    - [cheat.sh](https://github.com/chubin/cheat.sh) - the only cheat sheet you need
    - [pysheeet](https://github.com/crazyguitar/pysheeet) - Python Cheat Sheet

- Dependency Management:
    - [Python Application Dependency Management in 2018](https://hynek.me/articles/python-app-deps-2018/)
    - [Overview of python dependency management tools](https://modelpredict.com/python-dependency-management-tools)

- Templates / Cookiecutter / Boilerplate:
    - [full-stack-fastapi-postgresql](https://github.com/tiangolo/full-stack-fastapi-postgresql) - Full stack, modern web application generator. Using FastAPI, PostgreSQL as database, Docker, automatic HTTPS and more.
    - [python-package-template](https://github.com/TezRomacH/python-package-template) - Your next Python package needs a bleeding-edge project structure.
    - [python-project-blueprint](https://github.com/MartinHeinz/python-project-blueprint) - Blueprint/Boilerplate For Python Projects

- YouTube:
    - Videos:
        - [The Amazing Mutable Immutable Tuple and Other Philosophic Digressions](https://www.youtube.com/watch?v=EVBq1boGP6s)
        - 2017-08-02 - [What Does It Take To Be An Expert At Python?](https://www.youtube.com/watch?v=7lmCu8wz8ro)
            - TLDR:
                - Metaclasses
                - Decorator
                - Generator
                - Context manager
            - [What Does It Take to Be An Expert At Python Notebook](https://github.com/austin-taylor/code-vault/blob/master/python_expert_notebook.ipynb)
    - Playlists:
        - [Microsoft Developer | Python for Beginners](https://www.youtube.com/playlist?list=PLlrxD0HtieHhS8VzuMCfQD4uJ9yne1mE6)
        - [Corey Schafer | Flask Tutorials](https://www.youtube.com/playlist?list=PL-osiE80TeTs4UjLw5MM6OjgkjFeUxCYH)
        - [KeepCoding | Cursos de programación - Curso Introducción a Python & Django](https://www.youtube.com/playlist?list=PLQpe1zyko1phY_8XwZOQSdoyKf9nv7kMl)
        - [Real Python | Python – Intermediate and Advanced Features](https://www.youtube.com/playlist?list=PLP8GkvaIxJP0VAXF3USi9U4JnpxUvQXHx)
        - [Python Engineer | Advanced Python - Complete Course](https://www.youtube.com/playlist?list=PLqnslRFeH2UqLwzS0AwKDKLrpYBKzLBy2)
        - [Tech With Tim | Expert Python Tutorials](https://www.youtube.com/playlist?list=PLzMcBGfZo4-kwmIcMDdXSuy_wSqtU-xDP)

- Books:
    - [Python Basics: A Practical Introduction to Python 3](https://realpython.com/products/python-basics-book/)
    - [Tiny Python 3.9 Notebook](https://github.com/mattharrison/Tiny-Python-3.9-Notebook)
    - [Tiny Python 3.8 Notebook](https://github.com/mattharrison/Tiny-Python-3.8-Notebook)
    - [Tiny Python 3.6 Notebook](https://github.com/mattharrison/Tiny-Python-3.6-Notebook)

- Interesting projects:
    - [YouTube-Report](https://github.com/A3M4/YouTube-Report) - Generate a personal YouTube report from your Google Takeout data
    - [Python Tutor](http://www.pythontutor.com/) - VISUALIZE CODE EXECUTION

- Stack Overflow "interesting" questions:
    - [How to save a dictionary to a file?](https://stackoverflow.com/questions/19201290/how-to-save-a-dictionary-to-a-file)
    - [Why is Python 3 not backwards compatible? [closed]](https://stackoverflow.com/questions/9066956/why-is-python-3-not-backwards-compatible)

- Final Articles / Posts:
    - Non-dated
        - [Getting Started with Python in VS Code](https://code.visualstudio.com/docs/python/python-tutorial)
        - [Save a dictionary to a file](https://pythonspot.com/save-a-dictionary-to-a-file/)
        - [EAFP - Easier to ask for forgiveness than permission](https://docs.python.org/3/glossary.html#term-eafp)
        - [Python args and kwargs: Demystified](https://realpython.com/python-kwargs-and-args/)
        - [Debugging Cheat Sheet](https://www.reddit.com/r/Python/comments/iehths/debugging_cheat_sheet/)
        - [Python Software Foundation Newsletter](https://us19.campaign-archive.com/home/?u=5697f493c3a48994f504d4deb&id=167eaa449b)
    - Dated
        - 2020-01-15 - [Ultimate Setup for Your Next Python Project](https://towardsdatascience.com/ultimate-setup-for-your-next-python-project-179bda8a7c2c)
