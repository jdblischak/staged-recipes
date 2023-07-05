@echo on

set "AZURE_SDK_DISABLE_AUTO_VCPKG=ON"

cd sdk\core\azure-core

mkdir build
cd build
cmake %CMAKE_ARGS% ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install --config Release
if %ERRORLEVEL% neq 0 exit 1
