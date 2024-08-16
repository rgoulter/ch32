cmake_minimum_required(VERSION 3.29)

project(uart1)
add_executable(uart1 src/main.c)
enable_language(C ASM)

add_subdirectory(../sdk sdk)

target_link_libraries(uart1 sdk)

target_compile_definitions(uart1 PUBLIC DEBUG=1)

target_compile_features(uart1 PUBLIC c_std_99)

target_compile_options(uart1 PUBLIC -MMD -MP)

add_custom_command(TARGET uart1 POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" uart1 uart1.hex
    COMMENT "Generating hex file")
