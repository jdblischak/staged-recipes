@echo on

mkdir build
cd build
cmake %CMAKE_ARGS% ^
  -G "Ninja" ^
  ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install --config Release
if %ERRORLEVEL% neq 0 exit 1
