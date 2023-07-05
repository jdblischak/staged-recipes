@echo on

set "export AZURE_SDK_DISABLE_AUTO_VCPKG=ON"

mkdir build
cd build
cmake %CMAKE_ARGS% ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install --config Release
if %ERRORLEVEL% neq 0 exit 1
