add_code_coverage_all_targets()

add_library(hello src/hello.cpp)
target_include_directories(hello PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
                                        $<INSTALL_INTERFACE:include>)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE hello)
target_code_coverage(main AUTO ALL)
