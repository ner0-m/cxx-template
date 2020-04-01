# Code heavily influenced by https://github.com/StableCoder/cmake-scripts/
#   original copyright by George Cave - gcave@stablecoder.ca
#   original license Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Set the compiler standard to C++11
macro(cxx_11)
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF)

  if(MSVC_VERSION GREATER_EQUAL "1900" AND CMAKE_VERSION LESS 3.10)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag("/std:c++11" _cpp_latest_flag_supported)
    if(_cpp_latest_flag_supported)
      add_compile_options("/std:c++11")
    endif()
  endif()
endmacro()

# Set the compiler standard to C++14
macro(cxx_14)
  set(CMAKE_CXX_STANDARD 14)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF)

  if(MSVC_VERSION GREATER_EQUAL "1900" AND CMAKE_VERSION LESS 3.10)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag("/std:c++14" _cpp_latest_flag_supported)
    if(_cpp_latest_flag_supported)
      add_compile_options("/std:c++14")
    endif()
  endif()
endmacro()

# Set the compiler standard to C++17
macro(cxx_17)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF)

  if(MSVC_VERSION GREATER_EQUAL "1900" AND CMAKE_VERSION LESS 3.10)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag("/std:c++17" _cpp_latest_flag_supported)
    if(_cpp_latest_flag_supported)
      add_compile_options("/std:c++17")
    endif()
  endif()
endmacro()

# Set the compiler standard to C++20
macro(cxx_20)
  set(CMAKE_CXX_STANDARD 20)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF)
endmacro()
