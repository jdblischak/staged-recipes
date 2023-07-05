#!/bin/bash
set -ex

# Disable installing dependencies with vcpkg
# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#customize-the-vcpkg-dependency-integration
# https://github.com/search?utf8=%E2%9C%93&q=AZURE_SDK_DISABLE_AUTO_VCPKG&type=code
export AZURE_SDK_DISABLE_AUTO_VCPKG=ON

# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#building-the-project
mkdir build
cd build
cmake $CMAKE_ARGS ..
cmake --build . --target install --config Release
