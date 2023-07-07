#!/bin/bash
set -eux

# Disable installing dependencies with vcpkg
# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#customize-the-vcpkg-dependency-integration
# https://github.com/search?utf8=%E2%9C%93&q=AZURE_SDK_DISABLE_AUTO_VCPKG&type=code
export AZURE_SDK_DISABLE_AUTO_VCPKG=ON

# https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
if [[ "${target_platform}" == osx-* ]]
then
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cd sdk/storage/azure-storage-common

# For some reason CMAKE_BUILD_TYPE=Release isn't included in CMAKE_ARGS by
# ctng-compiler-activation-feedstock, even though it is for vc-feedstock and
# clang-compiler-activation-feedstock
if [[ "${target_platform}" == linux-* ]]
then
  CMAKE_ARGS="${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release"
fi

# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#building-the-project
mkdir build
cd build
cmake $CMAKE_ARGS \
  -D BUILD_SHARED_LIBS=ON \
  -D BUILD_TRANSPORT_CURL=ON \
  ..
cmake --build . --target install --config Release
