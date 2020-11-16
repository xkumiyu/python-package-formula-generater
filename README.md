# Python Package Formula Generater

It automatically generates python package formula file using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

[![GitHub Workflow Status][actions-status]][actions]

## Requirements

You need Python 3.7 or higher.
It uses `python` or `python3` commands in your PATH.

## Installation

Install using homebrew:

```sh
brew install xkumiyu/tap/ppfg
```

or you can git clone this repository.

## Configuration

Before using this script, you need to create config file like this:

```sh
package="my-package"
desc="description of my-package"
```

and place it in `~/.ppfg/config`.

### Optional

If you change install function, create template file like this:

```rb
def install
  virtualenv_create(libexec, "python3.9")
  virtualenv_install_with_resources
end
```

and place it in `~/.ppfg/template/install.rb`.

If you change test function, create template file like this:

```rb
test do
  false
end
```

and place it in `~/.ppfg/template/test.rb`.

If you change depends_on block, create template file like this:

```rb
depends_on "python@3.9"
```

and place it in `~/.ppfg/template/depends.rb`.

If these files does not exist and using python 3.9, the above codes will be inserted by default.

## Usage

```text
ppfg [OPTIONS] VERSION
```

Note that the options must be written before the arguments.

example:

```sh
ppfg 1.0.0
```

For more information, run `-h` option.

## ToDo

- [x] add debug option
- [x] specify python path
- [x] overwrite check
- [x] add depends_on template
- [x] using config file
- [x] installation using brew
- [ ] using multi package
- [ ] auto configuration
- [x] version check
- [ ] show next step when installation
- [ ] using long option
- [x] force option to overwrite
- [x] fix a bug that the line breaks not correct when using backslashes in templates
- [x] add github action
- [ ] add ignore package option/config

[actions]: https://github.com/xkumiyu/python-package-formula-generater/actions
[actions-status]: https://img.shields.io/github/workflow/status/xkumiyu/python-package-formula-generater/Push%20Trigger
