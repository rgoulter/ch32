cmake_minimum_required(VERSION 3.29)

project(usb-device-compounddev)
enable_language(C ASM)

add_executable(CompoundDev
    src/main.c
)

add_subdirectory(../sdk sdk)

target_link_libraries(CompoundDev sdk)

target_compile_definitions(CompoundDev PUBLIC DEBUG=1)

target_compile_features(CompoundDev PUBLIC c_std_99)

target_compile_options(CompoundDev PUBLIC -MMD -MP)

add_custom_command(TARGET CompoundDev POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" CompoundDev CompoundDev.hex
    COMMENT "Generating hex file")
