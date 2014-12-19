default['stm32']['oocd']['mirror'] = 'http://downloads.sourceforge.net/project/openocd/openocd/'
default['stm32']['oocd']['version'] = '0.8.0'

default['stm32']['oocd']['configure_flags'] = [
  "--prefix=/usr/local",
  "--enable-ftdi",
  "--enable-stlink"
]

default['stm32']['packages'] = [
  "gcc-arm-none-eabi",
  "libftdi-dev",
  "libusb-1.0-0-dev",
  "python-yaml",
]
