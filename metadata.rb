name             "stm32"
maintainer       "Sebastian Trahm"
maintainer_email "sebastian.trahm@gmail.com"
license          "Apache 2.0"
description      "Installs ARM-GCC Toolchain for STM32 Microcontrollers"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'apt'
supports 'ubuntu'
provides 'stm32'
