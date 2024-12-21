cmake_minimum_required(VERSION 3.29)

project(usart-printf)

add_executable(usart-printf
  User/ch32x035_it.c
  User/main.c
  User/system_ch32x035.c
)
target_include_directories(usart-printf PUBLIC User)



enable_language(C ASM)

add_subdirectory(../sdk sdk)

target_link_libraries(usart-printf sdk)

target_compile_definitions(usart-printf PUBLIC DEBUG=2)

target_compile_features(usart-printf PUBLIC c_std_99)

target_compile_options(usart-printf PUBLIC -MMD -MP)

add_custom_command(TARGET usart-printf POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" usart-printf usart-printf.hex
    COMMENT "Generating hex file")

