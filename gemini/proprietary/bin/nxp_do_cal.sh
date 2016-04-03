hwversion=`getprop ro.boot.hwversion`

case $hwversion in
    1*) firmware_name="/etc/firmware/tfa98xx.cnt" ;;
    2*) firmware_name="/etc/firmware/tfa98xx.cnt" ;;
    4*) firmware_name="/etc/firmware/tfa9891.cnt" ;;
    7*) firmware_name="/etc/firmware/tfa9891.cnt" ;;
    *)  firmware_name="/etc/firmware/tfa9891.cnt" ;;
esac

climax_hostSW -d /dev/i2c-9  -l $firmware_name  --resetMtpEx 2>&1 >> /data/cit.audio.cal.txt
sleep 0.5
climax_hostSW -d /dev/i2c-9 --calibrate=once -l $firmware_name 2>&1 >> /data/cit.audio.cal.txt
climax_hostSW -d /dev/i2c-9 -l $firmware_name --calshow --cit 2>&1 >> /data/cit.audio.cal.txt
