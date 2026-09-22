# odin4 — Samsung flashing tool for Linux

`odin4` (version 1.2.1-dc05e3ea) is the Linux-native equivalent of Odin3 for
flashing Samsung devices in Download Mode. Included here for convenience so
users of this ROM have a known-working tool at hand — this binary is Samsung
proprietary software and is redistributed as-is, without modification.

## Flashing the recovery

Boot the device into Download Mode, then:

```sh
tar -cf recovery.tar recovery.img
odin4 -a recovery.tar
```

To reboot the device back into normal mode afterwards:

```sh
odin4 --reboot
```

## Device detection

If odin4 cannot find the device, create `/etc/udev/rules.d/51-android.rules`
with:

```
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"
```

then reload udev (`sudo udevadm control --reload-rules`). On older kernels the
`cdc_acm` module may need to be unloaded first (`sudo rmmod cdc_acm` or
blacklist it — see `odin4 -h`).

## Usage

Run `odin4 -h` for the full option list (`-b` BL, `-a` AP, `-c` CP, `-s` CSC,
`-d` select a specific device path, `-l` list connected devices).
