#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: ppfg VERSION" 1>&2
  exit 1
fi

version=$1
package=$PPFG_PACKAGE
desc=$PPFG_DESC
outfile=dist/$package.rb

if [ -z "$package" ]; then
  echo "Error: Environment variable PPFG_PACKAGE is not set." 1>&2
  exit 1
fi

tmpdir=$(mktemp -d)
echo $tmpdir

trap "rm -rf $tmpdir" EXIT
trap "rm -rf $tmpdir; exit 1" INT PIPE TERM

echo "Create python virtual environments"
python -m venv $tmpdir/venv
source $tmpdir/venv/bin/activate
pip install -U pip > /dev/null

echo "Install python pakage"
pip install homebrew-pypi-poet $package==$version > /dev/null

echo "Generate formula file using poet"
poet -f $package==$version > $tmpdir/generated.rb

echo "Rewrite formula file"
sed -e "s/desc \"Shiny new formula\"/desc \"$desc\"/" \
  $tmpdir/generated.rb > $tmpdir/replaced-1.rb
sed -e 's/depends_on "python3"/depends_on "python@3.8"/' \
  $tmpdir/replaced-1.rb > $tmpdir/replaced-2.rb

if [ -e install.template ]; then
  n=$(wc -l $tmpdir/replaced-2.rb | awk '{print $1}')
  head -n $((n-9)) $tmpdir/replaced-2.rb > $tmpdir/replaced-3.rb
  cat $tmpdir/replaced-3.rb install.template > $tmpdir/replaced.rb
else
  cp $tmpdir/replaced{-2,}.rb
fi

if [ -e $tmpdir/replaced.rb ]; then
  cp $tmpdir/replaced.rb $outfile
  echo "\nGenerated to $outfile"
else
  echo "Error"
  exit 1
fi
