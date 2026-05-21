# Flashing

Safer order:

1. Backup important data.
2. Confirm bootloader is officially unlocked.
3. Boot to bootloader.
4. Enter fastbootd:
   `fastboot reboot fastboot`
5. Flash system:
   `fastboot flash system blckswan-42-system.img`
6. Reboot.

Never flash random boot/vendor/modem images from another device.
