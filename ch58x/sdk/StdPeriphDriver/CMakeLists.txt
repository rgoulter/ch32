target_include_directories(sdk INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/inc)

target_sources(sdk INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_adc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_clk.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_flash.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_i2c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_pwm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_spi0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_spi1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_sys.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_timer0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_timer1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_timer2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_timer3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_uart0.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_uart1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_uart2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_uart3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usb2dev.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usb2hostBase.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usb2hostClass.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usbdev.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usbhostBase.c
    ${CMAKE_CURRENT_SOURCE_DIR}/CH58x_usbhostClass.c
)

target_link_libraries(sdk INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/libISP583.a
)
