# 1 "bl2/ext/mcuboot/signing_layout_ns.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "bl2/ext/mcuboot/signing_layout_ns.c"






# 1 "../platform/ext/target/stm/nucleo_l552ze_q/include/region_defs.h" 1
# 19 "../platform/ext/target/stm/nucleo_l552ze_q/include/region_defs.h"
# 1 "../platform/ext/target/stm/nucleo_l552ze_q/include/flash_layout.h" 1
# 20 "../platform/ext/target/stm/nucleo_l552ze_q/include/region_defs.h" 2
# 8 "bl2/ext/mcuboot/signing_layout_ns.c" 2



enum image_attributes {
    RE_SECURE_IMAGE_OFFSET = (0x0),
    RE_SECURE_IMAGE_MAX_SIZE = (0x2D000),
    RE_NON_SECURE_IMAGE_OFFSET = ((0x0) + (0x2D000)),
    RE_NON_SECURE_IMAGE_MAX_SIZE = (0x9000),



    RE_SIGN_BIN_SIZE = ((0x9000)),



};
