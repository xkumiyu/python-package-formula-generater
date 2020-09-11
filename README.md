# Python Package Formula Generater

It automatically generates python package formula file using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

## Requirements

- Python 3.8

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

If you change install function, create template file like this:

```rb
  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
```

and place it in `~/.ppfg/install.template`.
Note the indentation, as it will be inserted as is.

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

- [ ] debug option
- [ ] specify python version (default: 3.8) / python path
- [x] overwrite check
- [ ] add depends_on template
- [x] using config file
- [x] installation using brew
- [ ] multi package
- [ ] auto configuration
