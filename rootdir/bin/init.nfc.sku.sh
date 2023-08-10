#!/vendor/bin/sh

if [ -c /dev/sec-nfc ]; then
    setprop vendor.qti.nfc.supported true
else
    setprop vendor.qti.nfc.supported false
fi
