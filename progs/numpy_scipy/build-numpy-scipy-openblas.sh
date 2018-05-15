#!/bin/sh
set -e
WD=$(pwd)
PYTHON_DEFAULT='3'
NUMPY_DEFAULT='1.14.2'
SCIPY_DEFAULT='1.0.0'
CPUS_DEFAULT='1'
read -p "Python version [${PYTHON_DEFAULT}]: " PYTHON_VERSION
PYTHON_VERSION=${PYTHON_VERSION:-$PYTHON_DEFAULT}
read -p "Numpy version [${NUMPY_DEFAULT}]: " NUMPY_VERSION
NUMPY_VERSION=${NUMPY_VERSION:-$NUMPY_DEFAULT}
read -p "Scipy version [${SCIPY_DEFAULT}]: " SCIPY_VERSION
SCIPY_VERSION=${SCIPY_VERSION:-$SCIPY_DEFAULT}
read -p "Number of build cores [${CPUS_DEFAULT}]:" BUILD_CPUS
BUILD_CPUS=${BUILD_CPUS:-$CPUS_DEFAULT}

PIP='pip'$PYTHON_VERSION
PYTHON='python'$PYTHON_VERSION

echo "Using ${PYTHON} and ${PIP}"
echo "Numpy $NUMPY_VERSION, Scipy $SCIPY_VERSION, no. build cores $BUILD_CPUS."

if ! [[ -z "${VIRTUAL_ENV// }" ]]; then
    echo "Working on $VIRTUAL_ENV virtualenv"
else
    read -p "Not working in a virtualenv, are you sure? [y/N]: " -n 1
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo
        echo "Ok... continuing..."
    else
        exit 0
    fi
fi

echo "Installing cython and openblas"
yay -S --needed openblas-lapack
# pacaur -S --needed atlas-lapack
${PIP} install cython

# Somehow each version of numpy/scipy have different archive formats...
# http://askubuntu.com/questions/57981/command-line-archive-manager-extracter
# we could also use file-roller or dtrx, but that is an extra dep...
extract () {
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)   tar xjf $1      ;;
         *.tar.gz)   tar xzf $1      ;;
         *.bz2)      bunzip2 $1      ;;
         *.rar)      rar x $1      ;;
         *.gz)      gunzip $1      ;;
         *.tar)      tar xf $1      ;;
         *.tbz2)      tar xjf $1      ;;
         *.tgz)      tar xzf $1      ;;
         *.zip)      unzip $1      ;;
         *.Z)      uncompress $1   ;;
         *)         echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

# Build may fail without these
export Atlas=None
export LDFLAGS="$LDFLAGS -shared"

# NUMPY
echo "Building and installing Numpy $NUMPY_VERSION"
mkdir -p /tmp/src
cd /tmp/src
${PIP} download --no-binary :all: numpy==${NUMPY_VERSION}
extract numpy-${NUMPY_VERSION}.*
cd /tmp/src/numpy-${NUMPY_VERSION}

# write config file
cat > site.cfg <<- EOM
[ALL]
include_dirs = /usr/include/openblas
library_dirs = /usr/lib

[openblas]
openblas_libs = openblas
library_dirs = /usr/lib

[lapack]
lapack_libs = openblas
library_dirs = /usr/lib
EOM

${PYTHON} setup.py config_fc --fcompiler=gnu95 build -j ${BUILD_CPUS}
${PYTHON} setup.py bdist_wheel
cp dist/*.whl $WD
${PYTHON} setup.py install --optimize=1  # Needed for scipy

# SCIPY
echo "Building and installing Scipy $SCIPY_VERSION"
cd /tmp/src
${PIP} download --no-binary :all: scipy==${SCIPY_VERSION}
extract scipy-${SCIPY_VERSION}.*
cd /tmp/src/scipy-${SCIPY_VERSION}

# write config file
cat > site.cfg <<- EOM
[openblas]
library_dirs = /usr/lib
EOM

# python3 setup.py config_fc --fcompiler=gnu95 build -j ${BUILD_CPUS} # Fails on Arch
${PYTHON} setup.py config_fc --fcompiler=gnu95 build
${PYTHON} setup.py bdist_wheel
cp dist/*.whl $WD
${PYTHON} setup.py install --optimize=1

echo "All done!"
