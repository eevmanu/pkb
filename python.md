# Python

- Check `python` version

```shell
ubuntu@ubuntu:~$ python --version
Python 2.7.12

$ python3 --version
$ python3.6 --version
$ python3.7 --version
$ python3.8 --version
```

- Check `python` binaries paths

```shell
$ which python
/usr/bin/python

$ which python3
/path/to/python3
```

- Install `python` (more info [here](https://python.tutorials24x7.com/blog/how-to-install-python-3-8-on-ubuntu-1804-lts))

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

- `pip`:
    - [Installing with get-pip.py](https://pip.pypa.io/en/stable/installing/#installing-with-get-pip-py)
    - [User Guide](https://pip.pypa.io/en/stable/user_guide/)
    - [releases @ Github](https://github.com/pypa/pip/releases)
    - [What is the purpose of “pip install --user …”?](https://stackoverflow.com/questions/42988977/what-is-the-purpose-of-pip-install-user)
    - [Default to --user #1668 @ Github](https://github.com/pypa/pip/issues/1668)

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
# /usr/local/lib/pythonX.X/site-packages don't exist
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

- Update `pip` core packages

```bash
$ pip install -U pip setuptools wheel
```

- Install packages to work with `virtual envs`

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

- `Virtual env` management commands

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

- Up a SimpleHTTPServer

```python
# Python 3
python3.7 -m http.server 8000 --bind 0.0.0.0

# Python 2
python -m SimpleHTTPServer
```

## Django

- Load specific settings to Django `commands`

```shell
# option 1
export DJANGO_SETTINGS_MODULE={{ module.to.django.settings }}
python manage.py {{ any command }}

# option 2
DJANGO_SETTINGS_MODULE={{ module.to.django.settings }} python manage.py {{ any command }}
```

## Troubleshooting

- Install `python` packages with `pip --user` (install `pip` in `$HOME/.local/bin` and python packages in `$HOME/.local/lib/pythonX.X`)

```shell
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

## TODO

- Install `python` packages with `pip --user` (install `pip` in `$HOME/.local/bin` and python packages in `$HOME/.local/lib/pythonX.X`)

```shell
# maybe using
$ /path/to/python3.8 get-pip.py --user

# verify with
$ which python

# and
$ /path/to/python -m pip --version
```

## Resources

- Linters / Checker
  - [pylint](https://github.com/PyCQA/pylint) - It's not just a linter that annoys you!
  - [mypy](https://github.com/python/mypy/) - Optional static typing for Python 3 and 2 (PEP 484)
  - [returns](https://github.com/dry-python/returns) - Make your functions return something meaningful, typed, and safe! returns.rtfd.io

- Database
  - [databases](https://github.com/encode/databases) - Async database support for Python

- Web frameworks (!= web server)
    - [Web frameworks for Python, most starred on Github](https://github.com/mingrammer/python-web-framework-stars)
    - [Sanic](https://github.com/huge-success/sanic)
    - [Nameko](https://github.com/nameko/nameko)
    - [Japronto](https://github.com/squeaky-pl/japronto)

- Dependency Management
  - [Python Application Dependency Management in 2018](https://hynek.me/articles/python-app-deps-2018/)
  - [Overview of python dependency management tools](https://modelpredict.com/python-dependency-management-tools)

- Extra tools
  - [locust](https://github.com/locustio/locust) - Scalable user load testing tool written in Python
  - [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole) - Pi-hole in a docker container

- Extra info
  - [cheat.sh](https://github.com/chubin/cheat.sh) - the only cheat sheet you need
