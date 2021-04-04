cmake_minimum_required(VERSION 3.15.0)

# from here on everything can be a normal CMakeLists file
project(cxxtemplate)

# Include cmake modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Set binary and library output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

# ---- C++ Standards ----
#
# Import macros to specify the C++ standard version and at the same time turning of compiler specific extensions
#
# Defined macros:
#
# * cxx_11
# * cxx_14
# * cxx_17
# * cxx_20
#
# ---- C++ Standards ----
include(cxx-standard)

# ---- Sanitizers ----
#
# Turn on the specified Sanitizers if USE_SANITIZER is specified with a valid variable
#
# Possible declarations:
#
# * Address
# * Memory
# * MemoryWithOrigins
# * Undefined
# * Thread
# * Address;Undefined
# * Undefined;Address
# * Leak
#
# ---- Sanitizers ----
include(sanitizers)

# ---- Code Coverage ----
#
# see https://github.com/StableCoder/cmake-scripts#code-coverage-code- coveragecmake
#
# ---- Code Coverage ----
include(code-coverage)

# ---- Compiler options ----
#
# Easy pre-made compiler options for major compilers. Simply enable options
#
# Options:
#
# * ENABLE_ALL_WARNINGS
# * ENABLE_EFFECTIVE_CXX
# * GENERATE_DEPENDENCY_DATA
#
# ---- Compiler options ----
include(compiler-options)

# ---- Tools ----
#
# Enable tools clang-tidy, include-what-you-use and cppcheck
#
# ---- Compiler options ----
include(tools)

cppcheck()
clang_tidy()

# ---- Formatting ----
#
# Formatting for for C++ (clang-format) and CMake (cmake-format)
#
# ---- Formatting ----
include(formatting)

file(
    GLOB_RECURSE
    CMAKE_FILES
    ${PROJECT_SOURCE_DIR}/cmake/*.cmake
    ${PROJECT_SOURCE_DIR}/library/CMakeLists.txt
    ${PROJECT_SOURCE_DIR}/test/CMakeLists.txt
    ${PROJECT_SOURCE_DIR}/examples/CMakeLists.txt
    CMakeLists.txt)

cmake_format(format-cmake ${CMAKE_FILES})

file(
    GLOB_RECURSE
    ALL_CODE_FILES
    ${PROJECT_SOURCE_DIR}/library/*.[ch]pp
    ${PROJECT_SOURCE_DIR}/library/*.[ch]
    ${PROJECT_SOURCE_DIR}/library/src/*.[ch]pp
    ${PROJECT_SOURCE_DIR}/library/src/*.[ch]
    ${PROJECT_SOURCE_DIR}/library/include/*.[h]pp
    ${PROJECT_SOURCE_DIR}/library/include/*.[h]
    ${PROJECT_SOURCE_DIR}/examples/*.[ch]pp
    ${PROJECT_SOURCE_DIR}/examples/*.[ch]
    ${PROJECT_SOURCE_DIR}/test/*.[ch]pp
    ${PROJECT_SOURCE_DIR}/test/*.[ch])

clang_format(format-cxx ${ALL_CODE_FILES})

# Add our library
add_subdirectory(library)
add_subdirectory(test)
add_subdirectory(docs EXCLUDE_FROM_ALL)
