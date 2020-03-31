include(utilities)

fetch_content_git(doctest https://github.com/onqtam/doctest.git GIT_SHALLOW
                  GIT_TAG "2.3.7")

# Include doctest cmake modules
list(APPEND CMAKE_MODULE_PATH "${doctest_SOURCE_DIR}/scripts/cmake")

include(CTest)
include(doctest)

enable_testing()

add_custom_target(
  tests
  COMMAND ${CMAKE_CTEST_COMMAND}
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMENT "Build and run all the tests.")

# macro for the unit tests
macro(ADD_UNIT_TEST NAME)
  # create the test executable
  add_executable(test_${NAME} EXCLUDE_FROM_ALL test_${NAME}.cpp test_main.cpp)
  # link to library
  target_link_libraries(test_${NAME} PRIVATE)
  # include doctest directory
  target_include_directories(
    test_${NAME} PUBLIC $<BUILD_INTERFACE:${doctest_SOURCE_DIR}/doctest>)
  # add dependency to tests target
  add_dependencies(tests test_${NAME})
  # let Catch discover and register all the test cases
  doctest_discover_tests(test_${NAME})
endmacro(ADD_UNIT_TEST)

add_unit_test(first)
