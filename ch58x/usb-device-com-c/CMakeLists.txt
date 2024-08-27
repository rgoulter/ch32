cmake_minimum_required(VERSION 3.29)

project(usb-device-com)
enable_language(C ASM)

add_executable(COM
    src/main.c
)

add_subdirectory(../sdk sdk)

target_link_libraries(COM sdk)

target_compile_definitions(COM PUBLIC DEBUG=1)

target_compile_features(COM PUBLIC c_std_99)

target_compile_options(COM PUBLIC -MMD -MP)

add_custom_command(TARGET COM POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" COM COM.hex
    COMMENT "Generating hex file")
