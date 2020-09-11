# Python Package Formula Generater

This script automatically generates python package formula file using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

## Installation

```sh
git clone https://github.com/xkumiyu/python-package-formula-generater
```

## Configuration

Before using this script, you need to create config directory and file like this:

```sh
mkdir ~/.ppfg
cp config.example ~/.ppfg/config
```

and rewrite `~/.ppfg/config` and set the package name and description.

If you change install/test function, create `install.template`:

```sh
cp install.template.example ~/.ppfg/install.template
```

and rewrite `~/.ppfg/install.template`.
Note the indentation, as it will be inserted as is.

## Usage

```text
./ppfg.sh [OPTIONS] VERSION
```

Note that the options must be written before the arguments.

example:

```sh
./ppfg.sh 1.0.0
```

For more information, run `-h` option.

## ToDo

- debug option
- specify python version (default: 3.8) / python path
- ~~overwrite check~~
- add depends_on template
- docker file
- ~~using config file~~
- brew install
