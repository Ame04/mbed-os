# NUCLEO_L552ZE_Q RSA keypair

A default RSA key pair is given to the Nucleo_l552ze_q target.

Public keys were pre-compiled to `targets/TARGET_STM/TARGET_STM32L5/TARGET_STM32L552xE/TARGET_NUCLEO_L552ZE_Q/TFM_S_FW/bl2.bin` and private key is in `root-rsa-3072.pem` for Secure image and `root-rsa-3072_1.pem` for Non-Secure image.

DO NOT use them in production code, they are exclusively for testing!

Private key must be stored in a safe place outside of the repository.

`tools/psa/tfm/bin_utils/imgtool.py` can be used to generate new key pairs.
