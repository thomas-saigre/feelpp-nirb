#!/bin/bash
ARCH=`uname -m`
SITE=`hostname`
#OS_VERSION=ubuntu-natty
#OS_VERSION=`uname -s`
OS_VERSION=macosx-lion-10.7.3
WORK_DIR=$HOME/sources/
#WORK_DIR=$HOME/Devel/FEEL
MAKE_ARGS="-j5"
PARALLEL="5"
#mkdir -p $WORK_DIR
# get the last version of the script
#svn export svn://scm.forge.imag.fr/var/lib/gforge/chroot/scmrepos/svn/life/trunk/life/trunk/cmake/dashboard/testsuite.cmake $WORK_DIR/testsuite.cmake
COMMON="ctest -VV -S $HOME/Devel/FEEL/feel/cmake/dashboard/testsuite.cmake,FEELPP_WORK_DIR=$WORK_DIR,FEELPP_ENABLE_CRB_ALL=ON,FEELPP_MAKE_ARGS=$MAKE_ARGS,CTEST_BUILD_FLAGS=-j$PARALLEL,CTEST_PARALLEL_LEVEL=$PARALLEL,FEELPP_SITE=$SITE,FEELPP_MODE=$1,FEELPP_BUILD_STRING=$OS_VERSION-$ARCH"
#$COMMON-gcc-4.4.6,FEELPP_CXX=g++-4.4,FEELPP_EXPLICIT_VECTORIZATION=novec
#$COMMON-gcc-4.4.6,FEELPP_CXX=g++-4.4,FEELPP_EXPLICIT_VECTORIZATION=SSE2
#$COMMON-gcc-4.5.2,FEELPP_CXX=g++-4.5,FEELPP_EXPLICIT_VECTORIZATION=novec
if [ -x /opt/local/bin/g++-mp-4.5 ]; then
    $COMMON-gcc-4.5.3,FEELPP_CXX=/opt/local/bin/g++-mp-4.5,FEELPP_EXPLICIT_VECTORIZATION=SSE2
    $COMMON-gcc-4.5.3-mpi,FEELPP_CXX=/opt/local/bin/g++-mp-4.5,FEELPP_EXPLICIT_VECTORIZATION=SSE2,FEELPP_ENABLE_MPI_MODE=ON
fi
if [ -x /opt/local/bin/g++-mp-4.6 ]; then
    $COMMON-gcc-4.6.2,FEELPP_CXX=/opt/local/bin/g++-mp-4.6,FEELPP_EXPLICIT_VECTORIZATION=SSE2
    $COMMON-gcc-4.6.2-mpi,FEELPP_CXX=/opt/local/bin/g++-mp-4.6,FEELPP_EXPLICIT_VECTORIZATION=SSE2,FEELPP_ENABLE_MPI_MODE=ON
fi