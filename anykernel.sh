### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Starry Kernel by Amrito/Taki
do.devicecheck=1
device.name1=stone
device.name2=moonstone
device.name3=sunstone
device.name4=gemstone
device.name4=miholi
do.cleanup=1
'; } # end properties

### AnyKernel install
# boot shell variables
block=boot;
is_slot_device=auto;
no_block_display=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
ui_print " " "Flashing Kernel...";
split_boot;
flash_boot;
ui_print " " "OK";
## end boot install

# dtb install
# auto check the dtb & dtbo file so
# we don't need another check
if [ -f dtbo ]; then
  ui_print " " "Flashing DTBO...";
  flash_dtbo;
  ui_print " " "OK";
fi
if [ -f dtb ]; then
  ui_print " " "Flashing DTB...";
  block=vendor_boot;
  reset_ak;
  split_boot;
  flash_boot;
  ui_print " " "OK";
fi
## end dtb install
