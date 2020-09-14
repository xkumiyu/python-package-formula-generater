# Python Package Formula Generater

It automatically generates python package formula file using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

## Requirements

- Python 3.8

It use python or python3 commands in your PATH.

If it's not installed, you can install it as follows:

```sh
brew install python@3.8
```

## Installation

```sh
brew install xkumiyu/tap/ppfg
```

## Configuration

Before using this script, you need to create config file like this:

```sh
package="my-package"
desc="description of my-package"
```

and place it in `~/.ppfg/config`.

### Optional

If you change install/test function, create template file like this:

```rb
def install
  virtualenv_create(libexec, "python3.8")
  virtualenv_install_with_resources
end

test do
  false
end
```

and place it in `~/.ppfg/template/install.rb`.

If you change depends_on block, create template file like this:

```rb
depends_on "python@3.8"
```

and place it in `~/.ppfg/template/depends.rb`.

If these files does not exist, the above codes will be inserted by default.

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
- [ ] specify python version (default: 3.8) / python path
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
- [ ] fix a bug that the line breaks not correct when using backslashes in templates
