<!-- omit in toc -->
# Python

<!-- omit in toc -->
## Table of contents

- [Install latest version](#install-latest-version)
    - [Via ppa:deadsnakes/ppa](#via-ppadeadsnakesppa)
    - [Via Pyenv](#via-pyenv)
        - [Extra commands](#extra-commands)
        - [Update](#update)
- [Extra commands](#extra-commands-1)
- [pip](#pip)
    - [Install](#install)
    - [Troubleshooting](#troubleshooting)
- [Virtual environments](#virtual-environments)
    - [virtualenv & virtualenvwrapper](#virtualenv--virtualenvwrapper)
- [Personal setup](#personal-setup)
    - [Basics](#basics)
    - [Venv](#venv)
    - [Linters](#linters)
    - [Code formatters](#code-formatters)
- [Debugging](#debugging)
- [Troubleshooting](#troubleshooting-1)
- [Interview tips](#interview-tips)
    - [Iterator](#iterator)
    - [Generator](#generator)
    - [Functional programming](#functional-programming)
    - [Decorators](#decorators)
    - [GIL - global interpreter lock](#gil---global-interpreter-lock)
    - [Context Manager](#context-manager)
    - [Function-based views vs Class-based views](#function-based-views-vs-class-based-views)
- [Resources](#resources)

## Install

### ppa:deadsnakes/ppa

☝ [Table of contents](#table-of-contents)

[Website](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa)

Install package dependencies

```bash
# simulate install to check package version
$ apt install -s software-properties-common

$ sudo apt install software-properties-common
```

Add repository url

```bash
$ sudo add-apt-repository ppa:deadsnakes/ppa

# download package information from all configured sources
$ sudo apt update
```

Install `python` version

```bash
$ sudo apt install python3.8
```

Related links
- 2020-03-22 - [How To Install Python 3.8 On Ubuntu 18.04 LTS](https://python.tutorials24x7.com/blog/how-to-install-python-3-8-on-ubuntu-1804-lts)

### pyenv

☝ [Table of contents](#table-of-contents)

[GitHub](https://github.com/pyenv/pyenv) - Simple Python version management

#### Install

Clone `pyenv` github repo into `$HOME/.pyenv` folder

```bash
$ git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
```

Load needed environment variables on your shell startup script, `.bashrc` in my case

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
```

Load `pyenv` initializer on your shell startup script, `.bashrc` in my case

```bash
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
```

Restart your **terminal**

```bash
$ exec $SHELL
```

Install [dependencies](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
$ sudo apt-get update && \
    sudo apt-get install \
        --no-install-recommends \
            build-essential \
            curl \
            libbz2-dev \
            libffi-dev \
            liblzma-dev \
            libncurses5-dev \
            libreadline-dev \
            libsqlite3-dev \
            libssl-dev \
            libxml2-dev \
            libxmlsec1-dev \
            llvm \
            make \
            tk-dev \
            wget \
            xz-utils \
            zlib1g-dev
```

Install `python` version you want

```bash
$ pyenv install 3.9.0
```

If error because of C compiler not found, check [Python: No acceptable C compiler found in $PATH when installing python](https://stackoverflow.com/q/19816275)

#### Usage commands

☝ [Table of contents](#table-of-contents)

List all versions available to install

```bash
$ pyenv install -l
```

List all versions installed in your local machine

```bash
$ pyenv versions
* system (set by $HOME/.pyenv/version)
  3.6.11
  3.6.12
  3.8.5
  3.9.0
```

Show version detected by the local context / working directory

```bash
$ pyenv local
3.8.5

# when not set
$ pyenv local
pyenv: no local version configured for this directory
```

Set a version for local context / working directory

```bash
$ pyenv local 3.9.0

$ pyenv versions
  system
  3.6.11
  3.6.12
  3.8.5
* 3.9.0 (set by /.../.python-version)
```

Verify version through `.python-version` file

```bash
$ cat .python-version
3.9.0
```

Check `pip` binary is using in your specific context

```bash
$ pyenv which pip
# pip script installed by `python get-pip.py --user`
$HOME/.local/bin/pip
# pip script installed by `pyenv install 3.8.5`
$HOME/.pyenv/versions/3.8.5/bin/pip

# if doubts, verify all matches of `pip`
$ which -a pip
```

To unset `python` version through `pyenv local $VERSION`, remove `.python-version` file from folder

#### Update

☝ [Table of contents](#table-of-contents)

Move working directory to `pyenv` installation folder

```bash
$ cd $(pyenv root)
```

To latest version (latest commit on default branch from github repo)

```bash
$ git checkout master && \
  git pull origin master
```

Specific version (using tag)

```bash
# update references, list all tags and choose a specific one
$ git fetch --all --tags --progress && \
  git tag

# e.g.:
$ git checkout v1.2.21
```

## Extra commands

☝ [Table of contents](#table-of-contents)

Check version

```bash
$ python --version

$ python3 --version
```

Check binary path

```bash
$ which python
/usr/bin/python

$ which python3
/path/to/python3
```

Start `http` server

```bash
# Python 3
$ python3 -m http.server 8000 --bind 0.0.0.0

# Python 2
$ python -m SimpleHTTPServer
```

## pip

☝ [Table of contents](#table-of-contents)

The Python package installer - [GitHub](https://github.com/pypa/pip)

**Avoid** installing it via `apt`: ~`$ sudo apt install python3-pip`~

Download `python` installer script

```bash
$ wget https://bootstrap.pypa.io/get-pip.py
```

Install `pip` at `user` level (inside `$HOME`)

Check to use right `python` version (through binary path) when executing script

```bash
# --user
# Install to the Python user install directory for your platform.
# Typically $HOME/.local/, or %APPDATA%Python on Windows.
# (See the Python documentation for site.USER_BASE for full details.)
$ $(which python) get-pip.py --user
$ $(which python3) get-pip.py --user
```

Verify `pip`'s path

If `pip` was installed successfully, `pip` should be inside `$HOME/.local/bin`

```bash
$ ls -la $(which pip)
-rwxrwxr-x 1 $USER $USER 223 ............ $HOME/.local/bin/pip

$ ls -la $(which pip3)
-rwxrwxr-x 1 $USER $USER 223 ............ $HOME/.local/bin/pip3

$ ls -la $(which pip3.8)
-rwxrwxr-x 1 $USER $USER 223 ............ $HOME/.local/bin/pip3.8
```

If `pip` script is not pointing to the right path of `python` binary we want to user, edit `pip` script and fix the bash shebang used there.

e.g: from this

```python
#!/usr/bin/python
...
```

to this

```python
#!{{ $HOME }}/bin/python
...
```

or this

```python
#!/usr/bin/env python3
```

and also this

```python
#!/usr/bin/env python3
```

Update `pip`, `setuptools` and `wheel`

```bash
$ pip install --no-cache-dir -U pip setuptools wheel

# in case want to use explicitly a python interpreter
# $ /path/to/python -m pip install --no-cache-dir -U pip setuptools wheel
```

### Troubleshooting

☝ [Table of contents](#table-of-contents)

Make `pip3` command points to `pip`

```bash
# global installed
$ pip --version
pip 20.1 from /usr/local/lib/python2.7/dist-packages/pip (python 2.7)

# global installed
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
-rwxr-xr-x 1 root root 283 ............ /usr/bin/pip2

$ ls -la /usr/local/bin/pip*
-rwxr-xr-x 1 root root 223 ............ /usr/local/bin/pip
-rwxr-xr-x 1 root root 223 ............ /usr/local/bin/pip2
-rwxr-xr-x 1 root root 223 ............ /usr/local/bin/pip2.7
-rwxr-xr-x 1 root root 223 ............ /usr/local/bin/pip3
-rwxr-xr-x 1 root root 216 ............ /usr/local/bin/pip3.5
-rwxr-xr-x 1 root root 218 ............ /usr/local/bin/pip3.6
-rwxr-xr-x 1 root root 223 ............ /usr/local/bin/pip3.7
-rwxr-xr-x 1 root root 206 ............ /usr/local/bin/pipenv

$ cp /path/to/pip3 /path/to/pip
```

Avoid warnings because of `locale`

```bash
$ export LC_ALL=C
```

[pyvenv not working because ensurepip is not available](https://stackoverflow.com/questions/39539110/)

```bash
$ export LC_ALL="en_US.UTF-8"
$ export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales
```

Warning: `> Defaulting to user installation because normal site-packages is not writeable`

- Idea behind (because `pip` was installed with `--user` parameter)
    - Don't have `/usr/local/lib/pythonX.Y/site-packages`
    - Don't have `/usr/lib/python3/site-packages`
    - Have `$HOME/.local/lib/pythonX.Y/site-packages`

- Things to verify

  - `python` from OS

    Run [site](https://docs.python.org/3/library/site.html) module as script

    ```bash
    $ python -m site
    sys.path = [
        '$HOME',
        '/usr/lib/python38.zip',
        '/usr/lib/python3.8',
        '/usr/lib/python3.8/lib-dynload',
        '$HOME/.local/lib/python3.8/site-packages',
        ...
        '/usr/local/lib/python3.8/dist-packages',
        '/usr/lib/python3/dist-packages',
    ]
    USER_BASE: '$HOME/.local' (exists)
    USER_SITE: '$HOME/.local/lib/python3.8/site-packages' (exists)
    ENABLE_USER_SITE: True

    $ python -c "import sys; print('\n'.join(sys.path))"
    /usr/lib/python38.zip
    /usr/lib/python3.8
    /usr/lib/python3.8/lib-dynload
    $HOME/.local/lib/python3.8/site-packages
    ...
    /usr/local/lib/python3.8/dist-packages
    /usr/lib/python3/dist-packages
    ```

    User base

    ```bash
    $ python -m site --user-base
    $HOME/.local

    $ python -c 'import site; print(site.getuserbase())'
    $HOME/.local

    $ python -c 'import site; print(site.USER_BASE)'
    $HOME/.local
    ```

    Global `site-packages` (contains User `site-packages` path)

    ```bash
    $ python -c 'import site; print(site.getsitepackages())'
    ['/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '/usr/lib/python3.8/dist-packages']
    ```

    User `site-packages`

    ```bash
    $ python -m site --user-site
    $HOME/.local/lib/python3.8/site-packages

    $ python -c 'import site; print(site.getusersitepackages())'
    $HOME/.local/lib/python3.8/site-packages

    $ python -c 'import site; print(site.USER_SITE)'
    $HOME/.local/lib/python3.8/site-packages
    ```

  - `python` from `pyenv`

    Before start

    ```bash
    $ pyenv versions
    ...
    * 3.7.10 (set by .../.python-version)
    ...

    $ python -V
    3.7.10

    $ pyenv which python
    $PYENV_ROOT/versions/3.7.10/bin/python
    ```

    Run [site](https://docs.python.org/3/library/site.html) module as script

    ```bash
    $ python -m site
    sys.path = [
        '$PWD',
        '$PYENV_ROOT/versions/3.7.10/lib/python37.zip',
        '$PYENV_ROOT/versions/3.7.10/lib/python3.7',
        '$PYENV_ROOT/versions/3.7.10/lib/python3.7/lib-dynload',
        '$PYENV_ROOT/versions/3.7.10/lib/python3.7/site-packages',
    ]
    USER_BASE: '$HOME/.local' (exists)
    USER_SITE: '$HOME/.local/lib/python3.7/site-packages' (doesn\'t exist)
    ENABLE_USER_SITE: True

    $ python -c "import sys; print('\n'.join(sys.path))"

    $PYENV_ROOT/versions/3.7.10/lib/python37.zip
    $PYENV_ROOT/versions/3.7.10/lib/python3.7
    $PYENV_ROOT/versions/3.7.10/lib/python3.7/lib-dynload
    $PYENV_ROOT/versions/3.7.10/lib/python3.7/site-packages
    ```

    User base

    ```bash
    $ python -m site --user-base
    $HOME/.local

    $ python -c 'import site; print(site.getuserbase())'
    $HOME/.local

    $ python -c 'import site; print(site.USER_BASE)'
    $HOME/.local
    ```

    Global `site-packages` (contains User `site-packages` path)

    ```bash
    $ python -c 'import site; print(site.getsitepackages())'
    ['$PYENV_ROOT/versions/3.7.10/lib/python3.7/site-packages']
    ```

    User `site-packages`

    ```bash
    $ python -m site --user-site
    $HOME/.local/lib/python3.7/site-packages

    $ python -c 'import site; print(site.getusersitepackages())'
    $HOME/.local/lib/python3.7/site-packages

    $ python -c 'import site; print(site.USER_SITE)'
    $HOME/.local/lib/python3.7/site-packages
    ```

  - `python` from `pyenv` & `venv`

    Run [site](https://docs.python.org/3/library/site.html) module as script

    ```bash
    $ python -m site
    sys.path = [
        '$PWD',
        '$PYENV_ROOT/versions/3.7.10/lib/python37.zip',
        '$PYENV_ROOT/versions/3.7.10/lib/python3.7',
        '$PYENV_ROOT/versions/3.7.10/lib/python3.7/lib-dynload',
        '$VIRTUAL_ENV/lib/python3.7/site-packages',
    ]
    USER_BASE: '$HOME/.local' (exists)
    USER_SITE: '$HOME/.local/lib/python3.7/site-packages' (doesn\'t exist)
    ENABLE_USER_SITE: False

    $ python -c "import sys; print('\n'.join(sys.path))"

    $PYENV_ROOT/versions/3.7.10/lib/python37.zip
    $PYENV_ROOT/versions/3.7.10/lib/python3.7
    $PYENV_ROOT/versions/3.7.10/lib/python3.7/lib-dynload
    $VIRTUAL_ENV/lib/python3.7/site-packages
    ```

    User base

    ```bash
    $ python -m site --user-base
    $HOME/.local

    $ python -c 'import site; print(site.getuserbase())'
    $HOME/.local

    $ python -c 'import site; print(site.USER_BASE)'
    $HOME/.local
    ```

    Global `site-packages` (contains User `site-packages` path)

    ```bash
    $ python -c 'import site; print(site.getsitepackages())'
    ['$VIRTUAL_ENV/lib/python3.7/site-packages']
    ```

    User `site-packages`

    ```bash
    $ python -m site --user-site
    $HOME/.local/lib/python3.7/site-packages

    $ python -c 'import site; print(site.getusersitepackages())'
    $HOME/.local/lib/python3.7/site-packages

    $ python -c 'import site; print(site.USER_SITE)'
    $HOME/.local/lib/python3.7/site-packages
    ```

References

- Documentation
  - Python Setup and Usage » [1. Command line and environment](https://docs.python.org/3/using/cmdline.html) » [PYTHONPATH](https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH)
  - The Python Standard Library » Python Runtime Services » [sys — System-specific parameters and functions](https://docs.python.org/3/library/sys.html) » [sys.path](https://docs.python.org/3/library/sys.html#sys.path)
  - The Python Standard Library » Python Runtime Services » [site — Site-specific configuration hook](https://docs.python.org/3/library/site.html)
  - The Python Tutorial » 6. Modules » [6.1.2. The Module Search Path](https://docs.python.org/3/tutorial/modules.html#the-module-search-path)
  - The Python Standard Library » Software Packaging and Distribution » venv — Creation of virtual environments » ... [VIRTUAL_ENV](https://docs.python.org/3/library/venv.html#:~:text=is%20active%2C%20the-,VIRTUAL_ENV,-environment%20variable%20is)
- [Installing with get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py)
- [User Guide](https://pip.pypa.io/en/stable/user_guide/)
- [pypa/pip/releases](https://github.com/pypa/pip/releases)
- [How do I find the location of my Python site-packages directory?](https://stackoverflow.com/q/122327)
- [What is the purpose of “pip install --user …”?](https://stackoverflow.com/q/42988977)
- [Default to --user #1668 @ Github](https://github.com/pypa/pip/issues/1668)
- [How do I find out my python path using python?](https://stackoverflow.com/q/1489599/)
- [Modern Python Environments - dependency and workspace management](https://testdriven.io/blog/python-environments/)

## Virtual environments

### virtualenv & virtualenvwrapper

Install `virtualenv` & `virtualenvwrapper`

```bash
$ pip install -U virtualenv virtualenvwrapper
# (2020-06-01 16:43:58)
# Successfully installed appdirs-1.4.4 distlib-0.3.0 filelock-3.0.12 virtualenv-20.0.21
# Successfully installed stevedore-1.32.0 virtualenv-clone-0.5.4 virtualenvwrapper-4.8.4
```

Verify `shebang` of `virtualenv` executable file

```bash
$ which virtualenv
/path/to/virtualenv

$ head -n 1 /path/to/virtualenv
#!/usr/bin/python

# OR
$ head -n 1 /path/to/virtualenv
#!/usr/bin/python3.8
```

Verify pip executable used to install those packages is the right one

```bash
$ /usr/bin/python -m pip --version
pip 20.1.1 from $HOME/.local/lib/python3.8/site-packages/pip (python 3.8)
```

Add extra configuration to your `.bashrc` file

```bash
$ nano $HOME/.bashrc
# ---- while editing---
...
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6
export WORKON_HOME=$HOME/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
...
```

Load extra configurations to shell

```bash
$ source $HOME/.bashrc
```

Management commands

```bash
# create a virtual environment
$ mkvirtualenv
$ mkvirtualenv -p python3.8 {{ virtualenv name }}
$ mkvirtualenv -p /usr/bin/python3.8 {{ virtualenv name }}
$ mkvirtualenv --python=python3.8 {{ virtualenv name }}
$ mkvirtualenv --python=/usr/bin/python3.8 {{ virtualenv name }}

# after creating a virtual environment, don't forget to update pip setuptools and wheel packages
# $ pip install -U pip setuptools wheel

# enter to a virtual environment
$ workon {{ name of virutal environment }}
({{ name of virtual environment }})$

# logout off virtual environment
({{ name of virtual environment }})$ deactivate

# delete a virtual environment
$ rmvirtualenv

# list all virtual environment
$ lsvirtualenv

# change working directory to virtual environment folder
$ cdvirtualenv
```



## Personal setup

### Basics

Create `python` executable command, if your machine only have `python3`, in `$HOME/bin`

Important: `$HOME/bin` should be inside `$PATH`

```bash
$ ln -s /usr/bin/python3 $HOME/bin/python
```

Install `pip` locally (in `$USER` home directory)

- Verify which `python` executable version you want to use (through its installation path)

    ```bash
    $ which python3.8
    /path/to/python3.8
    ```

- Verify which `pip` executable version you want to use (through its installation path)

    ```bash
    $ /path/to/python3.8 -m pip --version
    ```

- Execute `pip` installer with `--user` parameter

    ```bash
    $ /path/to/python3.8 get-pip.py --user
    ```

- Check if `pip` was installed in right places

    ```bash
    # where binaries are saved
    $ ls ${HOME}/.local/bin/

    # where libraries download and installed via pip (locally) are saved
    $ ls ${HOME}/.local/lib/

    # where libraries are downloaded temporarily is you want to install again
    $ ls ${HOME}/.cache/pip/
    ```


### Venv

Create a environment

```bash
$ python -m venv {{ /path/to/env }}
# e.g.:
$ python -m venv env
```

Activate environment

```bash
$ source {{ /path/to/env }}/bin/activate
```

Update `pip`, `setuptools`, and `wheel` after creating new environment

```bash
$ pip install -U pip setuptools wheel
```

Deactivate environment

```bash
$ deactivate
```

### Linters

If you're going to use for one project, install on a virtual environment

[pycodestyle](https://github.com/PyCQA/pycodestyle)

- Config for VSCode

    ```bash
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

[pylint](https://github.com/PyCQA/pylint)

- [Readable pylint messages](https://github.com/janjur/readable-pylint-messages/blob/master/README.md)
- [@ Visual Studio Code Docs](https://code.visualstudio.com/docs/python/linting#_pylint)
- [PyLint Messages - all codes](http://pylint-messages.wikidot.com/all-codes)

### Code formatters

If you're going to use for one project, install on an isolated virtual environment (or on each virtual environment per project)

[black](https://github.com/psf/black)

- Config for VSCode

    ```bash
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

Add trace to start debug from a line

```python
import pdb; pdb.set_trace()
```

Important commands

```text
s(tep)
n(ext)
unt(il) [lineno]
r(eturn)
c(ont(inue))
j(ump) lineno
```

Adding traceback in `exception` clause:

```python
try:
    ...
except:
    traceback.print_exc(file=sys.stderr)
    ...
```

## Troubleshooting

Install extra python packages (`Python.h`) for avoid posterior problems, like with [glances](https://github.com/nicolargo/glances)

```bash
$ apt install python-dev
$ apt install python3-dev
```

Install `python` packages with `pip --user` (install `pip` in `$HOME/.local/bin` and python packages in `$HOME/.local/lib/pythonX.X`)

- [ImportError in system pip wrappers after an upgrade](https://github.com/pypa/pip/issues/5599)

```bash
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

Warning message while updating `setuptools` on 2020-08-18

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

## Interview tips

### Iterator

Object that implements `__iter__`, which is expected to return an iterator object.

Object that implements `next()`

Expected to return the next element of the iterable object that returned it.

Raise a `StopIteration` exception when no more elements are available

Use cases: loops, to construct lists

Be aware, calling `iter()` on dictionary return an iterator and allows to loop over its keys.

Resources:
- Python Wiki - [Iterator](https://wiki.python.org/moin/Iterator)
- Functional Programming HOWTO - [Iterators](https://docs.python.org/3/howto/functional.html#iterators)

### Generator

Class of functions that simplify the task of writing iterators and return an iterator that returns a stream of values.

Generators are objects that allow us to suspend the execution of a python function.

Is a co routine (persistent subroutines), in the way functions and procedures are subroutines.

Use of `yield` statement (hold execution and persist value)

Consider reviewing `itertools` and `functools`

Methods:
- `__next()__` -> `next()`
- [`send()`](https://docs.python.org/3/reference/expressions.html#generator.send) - Resumes the execution and “sends” a value into the generator function.
- [`throw()`](https://docs.python.org/3/reference/expressions.html#generator.throw) - Raises an exception of type `type` at the point where the generator was paused, and returns the next value yielded by the generator function.
- [`close()`](https://docs.python.org/3/reference/expressions.html#generator.close) - Raises a GeneratorExit at the point where the generator function was paused.


Types of comprehension

**List Comprehension**

Returns list, surronded by brackets []

[6.2.5. List displays](https://docs.python.org/3/reference/expressions.html#list-displays)

**Nested List Comprehension**

**Dictionary comprehension**

```python
# --- Example 1 ---
dict1 = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5}
# Double each value in the dictionary
double_dict1 = {k:v*2 for (k,v) in dict1.items() if v>2 if v%2 == 0}
dict1_tripleCond = {k:('even' if v%2==0 else 'odd') for (k,v) in dict1.items()}


# --- Example 2 ---
# Initialize `fahrenheit` dictionary
fahrenheit = {'t1':-30, 't2':-20, 't3':-10, 't4':0}
# Get the corresponding `celsius` values
celsius = list(map(lambda x: (float(5)/9)*(x-32), fahrenheit.values()))
# Create the `celsius` dictionary
celsius_dict = dict(zip(fahrenheit.keys(), celsius))

# --- Example 3 ---
nested_dict = {'first':{'a':1}, 'second':{'b':2}}
float_dict = {outer_k: {float(inner_v) for (inner_k, inner_v) in outer_v.items()} for (outer_k, outer_v) in nested_dict.items()}
```

[6.2.7. Dictionary displays](https://docs.python.org/3/reference/expressions.html#dictionary-displays)

**Set Comprehensions**

```python
sentence = "The cat in the hat had two sidekicks, thing one and thing two."
words = sentence.lower().replace('.', '').replace(',', '').split()
unique_words = {word for word in words}
```

[6.2.6. Set displays](https://docs.python.org/3/reference/expressions.html#set-displays)

**Generator Expression**

Returns iterator, surronded by parentheses (), flexible to be call inside a function

```python
lc_example = [n**2 for n in [1, 2, 3, 4, 5]]

genex_example = (n**2 for n in [1, 2, 3, 4, 5])

>>> type(genex_example)
<class 'generator'>
```

[6.2.8. Generator expressions](https://docs.python.org/3/reference/expressions.html#generator-expressions)

**Generator Function**

```python
# Regular function
def function_a():
    return "a"

# Generator function
def generator_a():
    yield "a"

# --------------------------------------

function_a()
>>> "a"

generator_a()
>>> <generator object a at 0x000001565469DA98>

# --------------------------------------

# Asking the generator what the next item is
next(a())
>>> "a"

# Do not do this
next(a)
```

Resources:
- Python HOWTOs - Functional Programming HOWTO - [Generators](https://docs.python.org/3/howto/functional.html#generators)
- The Python Language Reference - 6. Expressions - [6.2.8. Generator expressions](https://docs.python.org/3/reference/expressions.html#generator-expressions)
- Python Wiki - [Generators](https://wiki.python.org/moin/Generators)
- [Python Dictionary Comprehension Tutorial](https://www.datacamp.com/community/tutorials/python-dictionary-comprehension)
- [Set Comprehension in Python 3 for Beginners](https://medium.com/swlh/set-comprehension-in-python3-for-beginners-80561a9b4007)
- [Comprehending the ‘Comprehensions’ in Python](https://towardsdatascience.com/comprehending-the-concept-of-comprehensions-in-python-c9dafce5111)
- [Python Generators](https://www.dataquest.io/blog/python-generators-tutorial/)
- [7 Handy Use Cases Of Dictionary Comprehensions In Python](https://towardsdatascience.com/7-handy-use-cases-of-dictionary-comprehensions-in-python-f7c37e462d92)
- [PEP 274 -- Dict Comprehensions](https://www.python.org/dev/peps/pep-0274/)
- [PEP 289 -- Generator Expressions](https://www.python.org/dev/peps/pep-0289/)
- [PEP 342 -- Coroutines via Enhanced Generators](https://www.python.org/dev/peps/pep-0342/)
- [PEP 479 -- Change StopIteration handling inside generators](https://www.python.org/dev/peps/pep-0479/)
- [PEP 525 -- Asynchronous Generators](https://www.python.org/dev/peps/pep-0525/)
- [PEP 530 -- Asynchronous Comprehensions](https://www.python.org/dev/peps/pep-0530/)
- 2016-04-07 - [bearfrieze/comprehensions.md](https://gist.github.com/bearfrieze/a746c6f12d8bada03589) - Comprehensions in Python the Jedi way

### Functional programming

Ways to declare operators

Lambda expressions declare style

### Decorators

Is a software design pattern which dynamically alter the functionality of a function, method, or class without having to directly use subclasses or change the source code of the function being decorated

Example:

```python
from time import perf_counter_ns


def timed(func):
    def timing_wrapper(*args, **kwargs):
        start = perf_counter_ns()
        ret = func(*args, **kwargs)
        diff = perf_counter_ns() - start
        print(f'{func.__name__} took {diff} NS to run')
        return ret
    return timing_wrapper

@timed
def remove_duplicates_list(values):
    seen = set()
    return [seen.add(value) or value for value in values if value not in seen]

@timed
def remove_duplicates_set(values):
    return list(set(values))


print(remove_duplicates_list([1, 2, 6, 1, 7, 1, 9, 4, 2]))
print(remove_duplicates_set([1, 2, 6, 1, 7, 1, 9, 4, 2]))
```

Is possible to use decorator in a class (with a function works)?:
- [Python decorator best practice, using a class vs a function](https://stackoverflow.com/questions/10294014/python-decorator-best-practice-using-a-class-vs-a-functional)
- [Difference between decorator classes and decorator functions](https://stackoverflow.com/questions/4650333/difference-between-decorator-classes-and-decorator-functions)

Resources:
- Python Wiki - [Decorators](https://wiki.python.org/moin/PythonDecorators)
- [Glossary](https://docs.python.org/3/glossary.html) - search for **decorator**
- [PEP 614 -- Relaxing Grammar Restrictions On Decorators](https://www.python.org/dev/peps/pep-0614/)
- [Python decorator guide](https://gist.github.com/Zearin/2f40b7b9cfc51132851a)
- 2019-06-04 - [The Ultimate Guide to Python Decorators, Part I: Function Registration](https://blog.miguelgrinberg.com/post/the-ultimate-guide-to-python-decorators-part-i-function-registration)
- 2019-10-22 - [The Ultimate Guide to Python Decorators, Part II: Altering Function Behavior](https://blog.miguelgrinberg.com/post/the-ultimate-guide-to-python-decorators-part-ii-altering-function-behavior)
- 2019-12-21 - [The Ultimate Guide to Python Decorators, Part III: Decorators with Arguments](https://blog.miguelgrinberg.com/post/the-ultimate-guide-to-python-decorators-part-iii-decorators-with-arguments)

### GIL - global interpreter lock

Mechanism used by cpython to assure only one thread execute python bytecode at time

Locking interpreter makes easier for the interpreter to be multi-threaded, at expense of much paralellism afforded by multiprocessor machines

How different is limits in Python generated by GIL with how Go handle concurrency / parallelism?
    - [Python asyncio event loop equivalent in Go lang](https://stackoverflow.com/questions/53250293/python-asyncio-event-loop-equivalent-in-go-lang)
    - [Python equivalent of Golang's select on channels](https://stackoverflow.com/questions/19130986/python-equivalent-of-golangs-select-on-channels)
    -

- Resources:
    - [Global Interpreter Lock](https://wiki.python.org/moin/GlobalInterpreterLock)
    - 2018-03 - [What Is the Python Global Interpreter Lock (GIL)?](https://realpython.com/python-gil/)
    - 2009-02-01 - [PYTHON THREADS AND THE GLOBAL INTERPRETER LOCK](https://web.archive.org/web/20181211041220/http://jessenoller.com/2009/02/01/python-threads-and-the-global-interpreter-lock/)
    - 2009-06-11 - [Inside the Python GIL](http://www.dabeaz.com/python/GIL.pdf) - [archive](https://web.archive.org/web/20201109021757/http://www.dabeaz.com/python/GIL.pdf)
    - 2012-02-03 - [Inside the Python GIL.](https://www.youtube.com/watch?v=ph374fJqFPE)
    - 2010 - [Understanding the Python GIL](http://www.dabeaz.com/python/UnderstandingGIL.pdf) - [archive](https://web.archive.org/web/20201112022003/http://www.dabeaz.com/python/UnderstandingGIL.pdf)
    - 2012-02-03 - [Understanding the Python GIL](https://www.youtube.com/watch?v=Obt-vMVdM8s)
    - [Eric Snow - to GIL or not to GIL: the Future of Multi-Core (C)Python - PyCon 2019](https://www.youtube.com/watch?v=7RlqbHCCVyc)
    - [A Jesse Jiryu Davis Grok the GIL Write Fast And Thread Safe Python PyCon 2017](https://www.youtube.com/watch?v=7SSYhuk5hmc)
    - [What is the global interpreter lock (GIL) in CPython?](https://stackoverflow.com/questions/1294382/what-is-the-global-interpreter-lock-gil-in-cpython)

### Context Manager

Object that defines the runtime context to be established when executing a with statement

Handles the entry into, the exit from, the desired runtime context

Could include saving and restoring global state, locking and unlocking resources, etc.

Methods: `__enter__()` and `__exit__()` <- context manager types

Is also possible to use it as decorator

Resources:
- [With Statement Context Managers](https://docs.python.org/2.5/ref/context-managers.html)
- [Context Manager Types](https://docs.python.org/2.5/lib/typecontextmanager.html)
- [PEP 343 -- The "with" Statement](https://www.python.org/dev/peps/pep-0343/)
- [contextlib — Utilities for with-statement contexts](https://docs.python.org/3/library/contextlib.html)
- Data Model - [With Statement Context Managers](https://docs.python.org/3/reference/datamodel.html#with-statement-context-managers)

### Function-based views vs Class-based views

CBV
- avoid spaguetti code
- avoid duplicated code
- pretty similar behaviour betweens Views

FBV
- more flexible
- more control

Resources:
- [Class Based Views VS Function Based Views](https://stackoverflow.com/questions/14788181/class-based-views-vs-function-based-views)
- [Classy Class-Based Views.](http://ccbv.co.uk/)

## Resources

- [The Python Tutorial](https://docs.python.org/3/tutorial/index.html)
    - [5. Data Structures](https://docs.python.org/3/tutorial/datastructures.html)
- [The Python Standard Library](https://docs.python.org/3/library/index.html)
- [The Python Language Reference](https://docs.python.org/3/reference/index.html)
    - [3. Data model](https://docs.python.org/3/reference/datamodel.html)
    - [6. Expressions](https://docs.python.org/3/reference/expressions.html)
- [Python HOWTOs](https://docs.python.org/3/howto/index.html)
- [Python Frequently Asked Questions](https://docs.python.org/3/faq/index.html)
    - [Design and History FAQ](https://docs.python.org/3/faq/design.html)
        - [Why are Python strings immutable?](https://docs.python.org/3/faq/design.html#why-are-python-strings-immutable)
        - [How are lists implemented in CPython?](https://docs.python.org/3/faq/design.html#how-are-lists-implemented-in-cpython)
            - lists are really variable-length arrays
            - makes indexing a list a[i] an operation whose cost is independent of the size of the list or the value of the index.
        - [How are dictionaries implemented in CPython?](https://docs.python.org/3/faq/design.html#how-are-dictionaries-implemented-in-cpython)
            - dictionaries are implemented as resizable hash tables
            - compared to B-trees, this gives better performance for lookup (the most common operation by far) under most circumstances, and the implementation is simpler.
            - this means that dictionaries take constant time – O(1), in Big-O notation – to retrieve a key.
        - [Why must dictionary keys be immutable?](https://docs.python.org/3/faq/design.html#why-must-dictionary-keys-be-immutable)
- [Glossary](https://docs.python.org/3/glossary.html)

- Python Wiki - This is hosted on an Oregon State University Open Source Lab VM. Marc-André Lemburg owns it. [source](http://infra.psf.io/overview/#details-of-various-services)
    - [This is an index of all pages in this Wiki.](https://wiki.python.org/moin/TitleIndex)
    - [TimeComplexity](https://wiki.python.org/moin/TimeComplexity)
    - [Concurrency](https://wiki.python.org/moin/Concurrency)
    - [Parallel Processing and Multiprocessing in Python](https://wiki.python.org/moin/ParallelProcessing)
    - [Porting Python Code to 3.x](https://wiki.python.org/moin/PortingPythonToPy3k)
    - [Powerful Python One-Liners](https://wiki.python.org/moin/Powerful%20Python%20One-Liners)
    - [Python speed](https://wiki.python.org/moin/PythonSpeed)
        - [Performance Tips](https://wiki.python.org/moin/PythonSpeed/PerformanceTips)
    - [Beginner's Guide to Python](https://wiki.python.org/moin/BeginnersGuide)
    - [Advanced Books](https://wiki.python.org/moin/AdvancedBooks)

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

- [Discuss @ Python.org](https://discuss.python.org/)
- [Python Ideas Mailing list](https://mail.python.org/archives/list/python-ideas@python.org/)

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
    - [wemake-services/wemake-python-styleguide](https://github.com/wemake-services/wemake-python-styleguide) - The strictest and most opinionated python linter ever!

- Web frameworks (!= web server):
    - [Web frameworks for Python, most starred on Github](https://github.com/mingrammer/python-web-framework-stars)
    - [Sanic](https://github.com/huge-success/sanic)
    - [Japronto](https://github.com/squeaky-pl/japronto)
    - [starlette](https://github.com/encode/starlette) - The little ASGI framework that shines.
    - [pallets/flask](https://github.com/pallets/flask) - The Python micro framework for building web applications.
        - [humiaozuzu/awesome-flask](https://github.com/humiaozuzu/awesome-flask) - A curated list of awesome Flask resources and plugins
        - [miguelgrinberg/flasky](https://github.com/miguelgrinberg/flasky) - Companion code to my O'Reilly book "Flask Web Development", second edition.
        - [tiangolo/uwsgi-nginx-flask-docker](https://github.com/tiangolo/uwsgi-nginx-flask-docker) - Docker image with uWSGI and Nginx for Flask applications in Python running in a single container. Optionally with Alpine Linux.
        - [miguelgrinberg/microblog](https://github.com/miguelgrinberg/microblog) - A microblogging web application written in Python and Flask that I developed as part of my Flask Mega-Tutorial series.
            - 2017-12-05 - [The Flask Mega-Tutorial Part I: Hello, World!](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
    - [tiangolo/fastapi](https://github.com/tiangolo/fastapi) - FastAPI framework, high performance, easy to learn, fast to code, ready for production
        - [tiangolo/full-stack-fastapi-postgresql](https://github.com/tiangolo/full-stack-fastapi-postgresql) - Full stack, modern web application generator. Using FastAPI, PostgreSQL as database, Docker, automatic HTTPS and more.
        - [mjhea0/awesome-fastapi](https://github.com/mjhea0/awesome-fastapi) - A curated list of awesome things related to FastAPI
        - [Let's Build a Fast, Modern Python API with FastAPI](https://www.youtube.com/watch?v=sBVb4IB3O_U&t=2s)
    - [nameko/nameko](https://github.com/nameko/nameko) - Python framework for building microservices

    - Benchmarks
        - [TechEmpower/FrameworkBenchmarks](https://github.com/TechEmpower/FrameworkBenchmarks) - Source for the TechEmpower Framework Benchmarks project techempower.com/benchmarks
        - [the-benchmarker/web-frameworks](https://github.com/the-benchmarker/web-frameworks) - Which is the fastest web framework?

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
    - [onelivesleft/PrettyErrors](https://github.com/onelivesleft/PrettyErrors) ([reddit](https://www.reddit.com/r/Python/comments/jui7zw/prettyerrors_a_module_to_format_exception_reports/), [usage stats](https://pypistats.org/packages/pretty-errors)) - Prettify Python exception output to make it legible.

- Debugging:
    - [cool-RR/PySnooper](https://github.com/cool-RR/PySnooper) ([usage stats](https://pypistats.org/packages/pysnooper)) - Never use print for debugging again
    - [cknd/stackprinter](https://github.com/cknd/stackprinter) ([usage stats](https://pypistats.org/packages/stackprinter)) - Debugging-friendly exceptions for Python
    - [Delgan/loguru](https://github.com/Delgan/loguru) ([usage stats](https://pypistats.org/packages/loguru)) - Python logging made (stupidly) simple
    - [getsentry/sentry](https://github.com/getsentry/sentry) ([usage stats](https://pypistats.org/packages/sentry)) - Sentry is cross-platform application monitoring, with a focus on error reporting.
    - [laike9m/Cyberbrain](https://github.com/laike9m/Cyberbrain) ([reddit](https://www.reddit.com/r/Python/comments/k32p48/cyberbrain_python_debugging_redefined/), [usage stats](https://pypistats.org/packages/cyberbrain)) - Python debugging, redefined.
    - [inducer/pudb](https://github.com/inducer/pudb) ([usage stats](https://pypistats.org/packages/pudb)) - Full-screen console debugger for Python
    - [gruns/icecream](https://github.com/gruns/icecream) ([usage stats](https://pypistats.org/packages/icecream)) - Never use print() to debug again.
    - [pdbpp/pdbpp](https://github.com/pdbpp/pdbpp) ([usage stats](https://pypistats.org/packages/pdbpp)) - pdb++, a drop-in replacement for pdb (the Python debugger)
    - [Debugging Cheat Sheet](https://www.reddit.com/r/Python/comments/iehths/debugging_cheat_sheet/)

- Testing
    - [locust](https://github.com/locustio/locust) - Scalable user load testing tool written in Python
    - [playwright-python](https://github.com/microsoft/playwright-python) - Python version of the Playwright testing and automation library - [web](https://playwright.dev/).
    - [Testing](https://wiki.python.org/moin/Testing)
        - unit tests - your Python code is limited by specific function and methods
        - performance - measure performance over the time
        - fuzz testing - overload your inputs with garbage to see the response
        - web testing - code is server-side and expected output is web stuff
        - acceptance - write testing logic once, and run it over a set of desired output
    - [PythonTestingToolsTaxonomy](https://wiki.python.org/moin/PythonTestingToolsTaxonomy)
    - [Test Driven Development](https://wiki.python.org/moin/TestDrivenDevelopment)
        - TDD is not a testing methodology; it is a design methodology.
        - write UnitTests for the code before you write the code itself.
    - [CodeCoverage](https://wiki.python.org/moin/CodeCoverage)
        - quantitative measure of finding out how much of the code has been executed
        - Subconcepts:
            - Statement coverage
            - Line coverage
            - Condition coverage
            - Decision coverage
            - Multiple condition coverage
            - Path coverage
            - ...
    - [nedbat/coveragepy](https://github.com/nedbat/coveragepy) - Code coverage measurement for Python
    - Python Wiki - [pytest](https://wiki.python.org/moin/pytest)

- Concurrency / Parallelism / Multiprocessing / Multithreading / Asynchronous (async/await) related:
    - Some facts:
        - any process, at minimum, has 1 thread
        - any core, with intel hyper threading, has capacity to switch between x threads at high speed, e.g.: i7 6500u 2 cores 4 threads 2 thread x core
        - concurrent code means code able to execute between multiple threas in a single core (not necessary multiple cores) - nondeterministic composition
        - parallel code means code able to execute between multiple cores - asymptotic efficiency
        - in case you want to run multicore code despite GIL, use **concurrent.futures.ProcessPoolExecutor** or **multiprocessing**
        - in case you want to simulate parallelism based on threas, you have **asyncio**, **concurrent.futures.ThreadPoolExecutor** or **threading**
    - Python Docs related
        - The Python Standard Library
            - Networking and Interprocess Communication
                - [asyncio — Asynchronous I/O](https://docs.python.org/3/library/asyncio.html)
                    - [Coroutines and Tasks](https://docs.python.org/3/library/asyncio-task.html)
            - [Concurrent Execution](https://docs.python.org/3/library/concurrency.html)
                - [threading — Thread-based parallelism](https://docs.python.org/3/library/threading.html)
                - [multiprocessing — Process-based parallelism](https://docs.python.org/3/library/multiprocessing.html)
                    - [multiprocessing.shared_memory — Provides shared memory for direct access across processes](https://docs.python.org/3/library/multiprocessing.shared_memory.html)
                - [concurrent.futures — Launching parallel tasks](https://docs.python.org/3/library/concurrent.futures.html) - Execute computations concurrently using threads or processes.
                    - a generic wrapper which handle parallelism based on process and/or threads
                - [subprocess — Subprocess management](https://docs.python.org/3/library/subprocess.html)
                - [sched — Event scheduler](https://docs.python.org/3/library/sched.html)
                - [queue — A synchronized queue class](https://docs.python.org/3/library/queue.html)
        - The Python Language Reference - 3. Data model - [3.4. Coroutines](https://docs.python.org/3/reference/datamodel.html#coroutines)
        - The Python Language Reference - 8. Compound statements - [8.8. Coroutines](https://docs.python.org/3/reference/compound_stmts.html#coroutines)
        - [PEP 492 -- Coroutines with async and await syntax](https://www.python.org/dev/peps/pep-0492/)
    - Asyncio
        - [EdgeDB](https://www.youtube.com/c/EdgeDB) - [import asyncio: Learn Python's AsyncIO](https://www.youtube.com/playlist?list=PLhNSoGM2ik6SIkVGXWBwerucXjgP1rHmB)
            - 2020-04-14 - [import asyncio: Learn Python's AsyncIO #1 - The Async Ecosystem](https://www.youtube.com/watch?v=Xbl7XjFYsN4)
            - 2020-04-20 - [import asyncio: Learn Python's AsyncIO #2 - The Event Loop](https://www.youtube.com/watch?v=E7Yn5biBZ58)
            - 2020-05-05 - [import asyncio: Learn Python's AsyncIO #3 - Using Coroutines](https://www.youtube.com/watch?v=-CzqsgaXUM8)
            - 2020-06-15 - [import asyncio: Learn Python's AsyncIO #4 - Coroutines Under The Hood](https://www.youtube.com/watch?v=1LTHbmed3D4)
            - 2020-08-03 - [import asyncio: Learn Python's AsyncIO #5 - Batteries Included](https://www.youtube.com/watch?v=SyiTd4rLb2s)
        - 2020-05-18 - [Making multiple HTTP requests using Python (synchronous, multiprocessing, multithreading, asyncio)](https://www.youtube.com/watch?v=R4Oz8JUuM4s)
        - 2019-10-01 - [Lynn Root - Advanced asyncio: Solving Real-world Production Problems](https://www.youtube.com/watch?v=sW76-pRkZk8)
        - 2019-05-04 - [Mariatta, Andrew Svetlov - Hands-on Intro to aiohttp - PyCon 2019](https://www.youtube.com/watch?v=OxzVApXKWYM)
        - 2019-05-05 - [Lynn Root - Advanced asyncio: Solving Real-world Production Problems - PyCon 2019](https://www.youtube.com/watch?v=bckD_GK80oY)
        - 2019-02-26 - [Python Async basics video (100 million HTTP requests)](https://www.youtube.com/watch?v=Mj-Pyg4gsPs)
        - 2019-02-21 - [Demystifying Python's Async and Await Keywords](https://www.youtube.com/watch?v=F19R_M4Nay4)
        - 2019-02-10 - [Entendiendo asyncio sin usar asyncio, por Juan Pedro Fisanotti](https://www.youtube.com/watch?v=BenwwgMx3Hg)
        - 2019-02-02 - [Entendiendo asyncio sin usar asyncio, por Juan Pedro Fisanotti](https://www.youtube.com/watch?v=u_NDCBdHhzc)
        - 2018-03-23 - [Asyncio - Asynchronous programming with coroutines - Intermediate Python Programming p.26](https://www.youtube.com/watch?v=BI0asZuqFXM)
        - 2017-05-21 - [Miguel Grinberg Asynchronous Python for the Complete Beginner PyCon 2017](https://www.youtube.com/watch?v=iG6fr81xHKA)
        - 2016-08-04 - [Yury Selivanov - async/await in Python 3.5 and why it is awesome](https://www.youtube.com/watch?v=m28fiN9y_r8)
        - 2017-05-21 - [Yury Selivanov asyncawait and asyncio in Python 3 6 and beyond PyCon 2017](https://www.youtube.com/watch?v=2ZFFv-wZ8_g)
        - [Async IO in Python: A Complete Walkthrough](https://realpython.com/async-io-python/)
        - async function return a [callable](https://docs.python.org/3/library/typing.html#typing.Callable)
        - async-await is helpful when your program does practically nothing except wait for IO, and when IO is relatively quick (e.g. glue between a web server and database).
        - The async/await paradigm works well in languages where handing off and sharing data between threads are cheap and easy. Python is not one of them.
        - [timofurrer/awesome-asyncio](https://github.com/timofurrer/awesome-asyncio) - A curated list of awesome Python asyncio frameworks, libraries, software and resources
        - [python-trio/trio](https://github.com/python-trio/trio) - Trio – a friendly Python library for async concurrency and I/O
            - [What is the core difference between asyncio and trio?](https://stackoverflow.com/questions/49482969/what-is-the-core-difference-between-asyncio-and-trio)
            - 2020-11-01 - [Trio: Structured Concurrency for Python](https://www.youtube.com/watch?v=y408pjAoxes)
    - Stackoverflow questions related:
        - [What is the difference between concurrency and parallelism?](https://stackoverflow.com/questions/1050222/what-is-the-difference-between-concurrency-and-parallelism)
        - [What is the difference between concurrent programming and parallel programming?](https://stackoverflow.com/questions/1897993/what-is-the-difference-between-concurrent-programming-and-parallel-programming)
        - [concurrent.futures.ProcessPoolExecutor vs multiprocessing.pool.Pool [duplicate]](https://stackoverflow.com/questions/38311431/concurrent-futures-processpoolexecutor-vs-multiprocessing-pool-pool)
        - [Concurrent.futures vs Multiprocessing in Python 3](https://stackoverflow.com/questions/20776189/concurrent-futures-vs-multiprocessing-in-python-3)
        - [Difference between multiprocessing, asyncio and concurrency.futures in python](https://stackoverflow.com/questions/61351844/difference-between-multiprocessing-asyncio-and-concurrency-futures-in-python)
        - [Can concurrent.futures.Future be converted to asyncio.Future?](https://stackoverflow.com/questions/54096301/can-concurrent-futures-future-be-converted-to-asyncio-future)
        - [When you need to use AsyncIO and ThreadPoolExecutor, do you need to call loop.close() manually?](https://stackoverflow.com/questions/59199218/when-you-need-to-use-asyncio-and-threadpoolexecutor-do-you-need-to-call-loop-cl)
        - [Why is asyncio.Future incompatible with concurrent.futures.Future?](https://stackoverflow.com/questions/43882301/why-is-asyncio-future-incompatible-with-concurrent-futures-future)
        - [What is the difference between concurrent.futures and asyncio.futures?](https://stackoverflow.com/questions/29902908/what-is-the-difference-between-concurrent-futures-and-asyncio-futures)
        - [What are the differences between the threading and multiprocessing modules?](https://stackoverflow.com/questions/18114285/what-are-the-differences-between-the-threading-and-multiprocessing-modules)
        - [Multiprocessing vs Threading Python [duplicate]](https://stackoverflow.com/questions/3044580/multiprocessing-vs-threading-python/)
        - [Threading pool similar to the multiprocessing Pool?](https://stackoverflow.com/questions/3033952/threading-pool-similar-to-the-multiprocessing-pool)
        - [How does asyncio actually work?](https://stackoverflow.com/questions/49005651/how-does-asyncio-actually-work)
        - [How does asyncio (python) work? [duplicate]](https://stackoverflow.com/questions/30341823/how-does-asyncio-python-work)
    - Non-dated
        - [Haskell Wiki - Parallelism vs. Concurrency](https://wiki.haskell.org/Parallelism_vs._Concurrency)
    - Dated
        - 2020-09-08 - [Sync vs. Async Python: What is the Difference?](https://blog.miguelgrinberg.com/post/sync-vs-async-python-what-is-the-difference)
        - 2020-09-06 - [Show HN: Parallelise pipelines of Python async iterables](https://news.ycombinator.com/item?id=24390116)
        - 2020-07-06 - [Speeding Up Python with Concurrency, Parallelism, and asyncio](https://testdriven.io/blog/concurrency-parallelism-asyncio/)
        - 2020-06-12 - [Async Python is not faster](http://calpaterson.com/async-python-is-not-faster.html)
            - [hacker news](https://news.ycombinator.com/item?id=23496994) - [r/coding](https://www.reddit.com/r/coding/comments/h7sada/async_python_is_not_faster/) - [r/programming](https://www.reddit.com/r/programming/comments/h7izx2/async_python_is_not_faster/) - [r/python](https://www.reddit.com/r/Python/comments/h7j025/async_python_is_not_faster/)
            - 2020-09-15 - [Ignore All Web Performance Benchmarks, Including This One](https://blog.miguelgrinberg.com/post/ignore-all-web-performance-benchmarks-including-this-one)
        - 2020-06-09 - [Python Multi-Threading vs Multi-Processing](https://towardsdatascience.com/python-multi-threading-vs-multi-processing-1e2561eb8a24)
        - 2020-05-06 - [Concurrency In Python For Network I/O - Synchronous, Threading, Multiprocessing and Asynchronous IO](https://www.nagekar.com/2020/05/python-io-benchmarks.html)
            - Synchronous with `requests` module
            - Threaded with `threading` module
            - Parallel with `multiprocessing` module
            - Event loop based with `asyncio` module
        - 2020-05-03 - [Neuromancer Blues: Threading vs Multiprocessing](https://www.datasciencecentral.com/profiles/blogs/neuromancer-blues-threading-vs-multiprocessing)
        - 2020-03-13 - [Threading Tutorial #1 - Concurrency, Threading and Parallelism Explained](https://www.youtube.com/watch?v=olYdb0DdGtM)
        - 2020-02-16 - [A better way for asynchronous programming: asyncio over multi-threading](https://towardsdatascience.com/a-better-way-for-asynchronous-programming-asyncio-over-multi-threading-3457d82b3295)
        - 2019-09-07 - [Multiprocessing vs. Threading in Python: What Every Data Scientist Needs to Know](https://blog.floydhub.com/multiprocessing-vs-threading-in-python-what-every-data-scientist-needs-to-know/)
        - 2009 - [A Curious Course on Coroutines and Concurrency](http://www.dabeaz.com/coroutines/Coroutines.pdf) - [archive](https://web.archive.org/web/20201111222718/http://dabeaz.com/coroutines/Coroutines.pdf)

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

- Profiler:
    - [vprof](https://github.com/nvdv/vprof) - Visual profiler for Python
    - [emeryberger/scalene](https://github.com/emeryberger/scalene) - Scalene: a high-performance, high-precision CPU and memory profiler for Python
    - [joerick/pyinstrument](https://github.com/joerick/pyinstrument) - bicyclist Call stack profiler for Python. Shows you why your code is slow!
    - [jrfonseca/gprof2dot](https://github.com/jrfonseca/gprof2dot) - Converts profiling output to a dot graph.

- Task queue / Async tasks / Background tasks / Distributed tasks / Scheduled tasks / Retry failed tasks ...:
    - [celery](https://github.com/celery/celery)
    - [faust](https://github.com/robinhood/faust)
    - [coleifer/huey](https://github.com/coleifer/huey) - a little task queue for python
    - [rq/rq](https://github.com/rq/rq) - Simple job queues for Python
        - [Parallels/rq-dashboard](https://github.com/Parallels/rq-dashboard) - Flask-based web front-end for monitoring RQ queues
        - [rq/rq-scheduler](https://github.com/rq/rq-scheduler) - A lightweight library that adds job scheduling capabilities to RQ (Redis Queue)
    - [Bogdanp/dramatiq](https://github.com/Bogdanp/dramatiq) - A fast and reliable background task processing library for Python 3.
    - [Koed00/django-q](https://github.com/Koed00/django-q) - A multiprocessing distributed task queue for Django
    - [agronholm/apscheduler](https://github.com/agronholm/apscheduler) - Task scheduling library for Python
    - [The uWSGI Spooler](https://uwsgi-docs.readthedocs.io/en/latest/Spooler.html)
        - [unbit/uwsgi/](https://github.com/unbit/uwsgi/)
    - Resources:
        - Non-dated:
            -
        - Dated:
            - 2020-10-20 - [The best practice of celery with Django](https://levelup.gitconnected.com/the-best-practice-of-celery-with-django-d383eee1151)
            - 2020-07-08 - [Managing asynchronous backend tasks with Django and Celery](https://medium.com/procogia/managing-asynchronous-backend-tasks-with-django-and-celery-d71078228741)
            - 2020-07-03 - [Huey as a minimal task queue for Django](https://www.untangled.dev/2020/07/01/huey-minimal-task-queue-django/)
            - 2020-05-15 - [Breaking Down Celery ≥4.x With Python and Django](https://medium.com/better-programming/breaking-down-celery-4-x-with-python-and-django-e95eeb7de2a6)
            - 2019-06-19 - [Alec Clowes - Building a Celery alternative in Django on Kubernetes](https://www.youtube.com/watch?v=fdY6G2u8tRs)
            - 2013-05-01 - [Messaging at Scale at Instagram by Rick Branson](https://speakerdeck.com/pyconslides/messaging-at-scale-at-instagram-by-rick-branson?slide=76)

- Name mangling - [google](https://www.google.com/search?q=python+name+mangling)
    - [What is the meaning of single and double underscore before an object name?](https://stackoverflow.com/questions/1301346/what-is-the-meaning-of-single-and-double-underscore-before-an-object-name)
    - [Python Name Mangling and How to Use Underscores](https://medium.com/analytics-vidhya/python-name-mangling-and-how-to-use-underscores-e67b529f744f)

- Extra tools:
    - [httpx](https://github.com/encode/httpx) - A next generation HTTP client for Python. butterfly
    - [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole) - Pi-hole in a docker container
    - [healthchecks](https://github.com/healthchecks/healthchecks) - A Cron Monitoring Tool written in Python & Django healthchecks.io
    - [alerta](https://github.com/alerta/alerta) - Alerta monitoring system
    - [pyperclip](https://github.com/asweigart/pyperclip) - Python module for cross-platform clipboard functions. pypi.python.org/pypi/pyperclip
    - [path](https://github.com/jaraco/path) - Object-oriented file system path manipulation
        - [pathlib](https://docs.python.org/3/library/pathlib.html) added on 3.4
        - [What does this package do? - Episode 4: Pathlib](https://www.youtube.com/watch?v=YwhOUyTxXVE)
    - [hardikvasa/google-images-download](https://github.com/hardikvasa/google-images-download) - Python Script to download hundreds of images from 'Google Images'. It is a ready-to-run code!
    - [hooram/ownphotos](https://github.com/hooram/ownphotos) - Self hosted alternative to Google Photos
    - [gilesknap/gphotos-sync](https://github.com/gilesknap/gphotos-sync) - Google Photos and Albums backup with Google Photos Library API
    - [ytdl-org/youtube-dl](https://github.com/ytdl-org/youtube-dl) - Command-line program to download videos from YouTube.com and other video sites
    - [asciinema/asciinema](https://github.com/asciinema/asciinema) - Terminal session recorder video_camera
    - Reloading:
        - [reloading](https://github.com/julvo/reloading) - Change Python code while it's running using a reloading loop
        - [watchgod](https://github.com/samuelcolvin/watchgod) - Simple, modern file watching and code reload in python.
        - [hotreload](https://github.com/say4n/hotreload) - hot reload your python code!
        - [aiohttp-devtools](https://github.com/aio-libs/aiohttp-devtools) - dev tools for aiohttp
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
    - [dabeaz-course/practical-python](https://github.com/dabeaz-course/practical-python) - Practical Python Programming (course by @dabeaz)
    - [faif/python-patterns](https://github.com/faif/python-patterns) - A collection of design patterns/idioms in Python
    - [satwikkansal/wtfpython](https://github.com/satwikkansal/wtfpython) - What the f*ck Python?

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
    - [PyCon 2020](https://www.youtube.com/channel/UCMjMBMGt0WJQLeluw6qNJuA)
        - [Tutorial: Sebastian Witowski - Modern Python Developer's Toolkit](https://www.youtube.com/watch?v=WkUBx3g2QfQ)
            - 2020-11-09 - [Concise guide to efficient Python tooling](https://keramitas.io/2020/11/09/concise-guide-to-efficient-python-tooling.html)
        - [Talk: Conor Hoekstra - Beautiful Python Refactoring](https://www.youtube.com/watch?v=W-lZttZhsUY)
        - [Talk: Anthony Shaw - Why is Python slow?](https://www.youtube.com/watch?v=I4nkgJdVZFA)
        - [Goodbye Print, Hello Debugger! - Nina Zakharenko - Talk](https://www.youtube.com/watch?v=5AYIe-3cD-s)
        - [Tutorial: Santiago Basulto - Python Concurrency: from beginner to pro](https://www.youtube.com/watch?v=18B1pznaU1o)
        - [Tutorial: Kimberly Fessel - It's Officially Legal so Let's Scrape the Web](https://www.youtube.com/watch?v=RUQWPJ1T6Zc)
        - [Talk: Hannah Stepanek - Let's talk Databases in Python: SQLAlchemy and Alembic](https://www.youtube.com/watch?v=36yw8VC3KU8)
        - [Tutorial: Geir Arne Hjelle - Introduction to Decorators: Power Up Your Python Code](https://www.youtube.com/watch?v=T8CQwGIsrx4)
        - [Talk: Łukasz Langa - AsyncIO + Music](https://www.youtube.com/watch?v=02CLD-42VdI)
        - [Talk: Dean Wampler - Ray: A System for High-performance, Distributed Python Applications](https://www.youtube.com/watch?v=tqUe0gcfqAU)
        - [Optimize Python & Django apps with Postgres superpowers – Louise Grandjonc – Sponsor Workshop](https://www.youtube.com/watch?v=dyBLGjCQJHs)
        - [Talk: Chris Seto - Big O No: Django ORM runtime complexity and how to avoid it using LATERAL JOINS](https://www.youtube.com/watch?v=GJUL3glrKvA)
        - [Tutorial: Mike Müller - Migration from Python 2 to 3](https://www.youtube.com/watch?v=JgIgEjASOlk)
        - [Charla: Luis Diego Conejo Alpizar - Historias de debug en clase de Python Avanzado](https://www.youtube.com/watch?v=UYpnyUyzpSY)
        - [Charla: Eric Nahuel Horvat - Integraciones con Asyncio](https://www.youtube.com/watch?v=IGokXFTVRzQ)
        - [Charla: David Mauricio Delgado Ruiz - Datos, Python y humanos](https://www.youtube.com/watch?v=76j-C2DQRec)
    - [PyCon 2019](https://www.youtube.com/channel/UCxs2IIVXaEHHA4BtTiWZ2mQ)
        - [Ariel Ortiz - Design Patterns in Python for the Untrained Eye - PyCon 2019](https://www.youtube.com/watch?v=o1FZ_Bd4DSM)
        - [Reuven M. Lerner - Practical decorators - PyCon 2019](https://www.youtube.com/watch?v=MjHpMCIvwsY)
        - [Łukasz Langa - Life Is Better Painted Black, or: How to Stop Worrying and Embrace Auto-Formatting](https://www.youtube.com/watch?v=esZLCuWs_2Y)
        - [Lynn Root - Advanced asyncio: Solving Real-world Production Problems - PyCon 2019](https://www.youtube.com/watch?v=bckD_GK80oY)
        - [Mario Corchero - Exceptional Exceptions - How to properly raise, handle and create them.](https://www.youtube.com/watch?v=V2fGAv2R5j8)
        - [Vinayak Mehta - Extracting tabular data from PDFs with Camelot & Excalibur - PyCon 2019](https://www.youtube.com/watch?v=Irf6kdl0lAA)
        - [Pamela McANulty - Things I Wish They Told Me About The Multiprocessing Module in Python 3](https://www.youtube.com/watch?v=5dMOYf0b_20)
        - [Jérôme Petazzoni, AJ Bowen - Getting started with Kubernetes and container orchestration](https://www.youtube.com/watch?v=J08MrW2NC1Y)
        - [Mariatta, Andrew Svetlov - Hands-on Intro to aiohttp - PyCon 2019](https://www.youtube.com/watch?v=OxzVApXKWYM)
        - [Erin Allard - Ace Your Technical Interview Using Python - PyCon 2019](https://www.youtube.com/watch?v=NltGUUi23zc)
        - [Aaron Gee-Clough - Django Channels in practice - PyCon 2019](https://www.youtube.com/watch?v=j6IOuD5WD8c)
        - [Jess Shapiro - Everything at Once: Python's Many Concurrency Models - PyCon 2019](https://www.youtube.com/watch?v=w2nKIGhXPAM)
        - [Neil Chazin - Strategies for testing Async code - PyCon 2019](https://www.youtube.com/watch?v=aQ6rpLRJsXs)
        - [Adam Englander - Practical API Security - PyCon 2019](https://www.youtube.com/watch?v=LgoGcr8xUiI)
        - [Historia de un ingeniero junior: Mi experiencia construyendo un pipeline de ETL usando Python](https://www.youtube.com/watch?v=giFwg-kU9kE)
        - [Fridolín Pokorný - Thoth - how to recommend the best possible libraries for your application](https://www.youtube.com/watch?v=CRnKC6-cFY4)
    - [PyCon 2018]()
        - [Adam Englander - Practical API Security - PyCon 2018](https://www.youtube.com/watch?v=wXnvEzw4hHI)
    - Videos:
        - [The Amazing Mutable Immutable Tuple and Other Philosophic Digressions](https://www.youtube.com/watch?v=EVBq1boGP6s)
        - 2017-08-02 - [What Does It Take To Be An Expert At Python?](https://www.youtube.com/watch?v=7lmCu8wz8ro)
            - TLDR: Metaclasses, Decorator, Generator, Context manager
            - [What Does It Take to Be An Expert At Python Notebook](https://github.com/austin-taylor/code-vault/blob/master/python_expert_notebook.ipynb)
    - Playlists:
        - [Microsoft Developer | Python for Beginners](https://www.youtube.com/playlist?list=PLlrxD0HtieHhS8VzuMCfQD4uJ9yne1mE6)
        - [Corey Schafer | Flask Tutorials](https://www.youtube.com/playlist?list=PL-osiE80TeTs4UjLw5MM6OjgkjFeUxCYH)
        - [Real Python | Python – Intermediate and Advanced Features](https://www.youtube.com/playlist?list=PLP8GkvaIxJP0VAXF3USi9U4JnpxUvQXHx)
        - [Python Engineer | Advanced Python - Complete Course](https://www.youtube.com/playlist?list=PLqnslRFeH2UqLwzS0AwKDKLrpYBKzLBy2)
        - sentdex - [Intermediate Python Programming](https://www.youtube.com/playlist?list=PLQVvvaa0QuDfju7ADVp5W1GF9jVhjbX-_)
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
        - [Python Software Foundation Newsletter](https://us19.campaign-archive.com/home/?u=5697f493c3a48994f504d4deb&id=167eaa449b)
    - Dated
        - 2020-12-21 - [NumPy Illustrated: The Visual Guide to NumPy](https://medium.com/better-programming/numpy-illustrated-the-visual-guide-to-numpy-3b1d4976de1d)
        - 2020-11-14 - [gene1wood/all_aws_lambda_modules_python.md](https://gist.github.com/gene1wood/4a052f39490fae00e0c3) - AWS Lambda function to list all available Python modules for Python 2.7 3.6 and 3.7
        - 2020-11-07 - [73 Examples to Help You Master Python's f-strings](https://miguendes.me/73-examples-to-help-you-master-pythons-f-strings) - [reddit](https://www.reddit.com/r/Python/comments/jpojgg/73_examples_to_help_you_master_pythons_fstrings/)
        - 2020-10-30 - [25 Best GitHub Repos for Python Developers](https://thecarrots.io/blog/25-best-github-repos-for-python-developers) - [reddit](https://www.reddit.com/r/Python/comments/jms9d8/25_of_the_most_useful_python_repos/)
        - 2020-10-23 - [How to write a great Dockerfile for Python apps](https://www.pybootcamp.com/blog/how-to-write-dockerfile-python-apps/) - [reddit](https://www.reddit.com/r/Python/comments/ji9nu7/how_to_write_a_great_dockerfile_for_python/)
        - 2020-10-22 - [Flask vs django | easy expert comparison](https://hinty.io/ivictbor/flask-vs-django-easy-expert-comparison/) - [reddit](https://www.reddit.com/r/programming/comments/jg0xoc/flask_vs_django_easy_comparison/)
        - 2020-10-22 - [How to quickly remove duplicates from a list?](https://www.reddit.com/r/Python/comments/jfx7wy/how_to_quickly_remove_duplicates_from_a_list/)
        - 2020-10-05 - [Python 3.9: Cool New Features for You to Try](https://realpython.com/python39-new-features/)
        - 2020-01-15 - [Ultimate Setup for Your Next Python Project](https://towardsdatascience.com/ultimate-setup-for-your-next-python-project-179bda8a7c2c)

- Blogs / People to follow:
    - [Miguel Grinberg](https://blog.miguelgrinberg.com/)
    - [David Beazley](https://twitter.com/dabeaz)
    - [Dan Bader](https://dbader.org/)
