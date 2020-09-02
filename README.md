# Python Package Formula Generater

This script automatically generates python package formula file using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

## Configure

You must set `PPFG_PACKAGE`:

```sh
export PPFG_PACKAGE="my-package"
```

### Optional

If you set description, set `PPFG_DESC`:

```sh
export PPFG_DESC="description of my-package"
```

If you change install/test function, create `install.template`:

```sh
cp install.template{.example,}
```

## Usage

```sh
./ppfg.sh VERSION
```

example:

```sh
./ppfg.sh 1.0.0
```

## ToDo

- debug option
- specify python version (default: 3.8)
- overwrite check
- add depends_on template
- docker file
