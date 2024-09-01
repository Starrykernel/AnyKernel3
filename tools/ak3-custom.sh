### AnyKernel custom methods
## dereference23@github.com

check_cmdline() {
  if [ -f $AKHOME/cmdline ]; then
    sed -i '/^cmdline/d' $SPLITIMG/header;
    echo cmdline=$(tr '\n' ' ' < $AKHOME/cmdline) >> $SPLITIMG/header;
  fi;
}


erase_dtbo() {
  dd if=/dev/zero of=/dev/block/by-name/dtbo$SLOT conv=fsync count=1 bs=$(blockdev --getsize64 /dev/block/by-name/dtbo$SLOT);
}
