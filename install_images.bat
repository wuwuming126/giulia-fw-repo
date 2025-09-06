@echo off
title Firmware updater for OP13R/ace5 by @🈚

echo Use this only for updating firmware on custom roms, using it on stock will get you bricked
pause

echo Make sure device is in bootloader before continuing
pause

fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot reboot fastboot
for /f "tokens=2 delims=: " %%A in ('fastboot getvar is-userspace 2^>^&1') do (
    if "%%A"=="yes" (
        goto :flash_fastbootd
    ) else (
        echo Device failed to enter FastbootD mode
        echo aborting...
        pause
        goto :ext
    )
)
:flash_fastbootd
fastboot flash abl_a abl.img
fastboot flash abl_b abl.img
fastboot flash aop_a aop.img
fastboot flash aop_b aop.img
fastboot flash aop_config_a aop_config.img
fastboot flash aop_config_b aop_config.img
fastboot flash bluetooth_a bluetooth.img
fastboot flash bluetooth_b bluetooth.img
fastboot flash cpucp_a cpucp.img
fastboot flash cpucp_b cpucp.img
fastboot flash cpucp_dtb_a cpucp_dtb.img
fastboot flash cpucp_dtb_b cpucp_dtb.img
fastboot flash devcfg_a devcfg.img
fastboot flash devcfg_b devcfg.img
fastboot flash dsp_a dsp.img
fastboot flash dsp_b dsp.img
fastboot flash engineering_cdt_a engineering_cdt.img
fastboot flash engineering_cdt_b engineering_cdt.img
fastboot flash featenabler_a featenabler.img
fastboot flash featenabler_b featenabler.img
fastboot flash hyp_a hyp.img
fastboot flash hyp_b hyp.img
fastboot flash imagefv_a imagefv.img
fastboot flash imagefv_b imagefv.img
fastboot flash keymaster_a keymaster.img
fastboot flash keymaster_b keymaster.img
fastboot flash oplus_sec_a oplus_sec.img
fastboot flash oplus_sec_b oplus_sec.img
fastboot flash oplusstanvbk_a oplusstanvbk.img
fastboot flash oplusstanvbk_b oplusstanvbk.img
fastboot flash qupfw_a qupfw.img
fastboot flash qupfw_b qupfw.img
fastboot flash shrm_a shrm.img
fastboot flash shrm_b shrm.img
fastboot flash splash_a splash.img
fastboot flash splash_b splash.img
fastboot flash tz_a tz.img
fastboot flash tz_b tz.img
fastboot flash uefi_a uefi.img
fastboot flash uefi_b uefi.img
fastboot flash uefisecapp_a uefisecapp.img
fastboot flash uefisecapp_b uefisecapp.img
fastboot flash xbl_a xbl.img
fastboot flash xbl_b xbl.img
fastboot flash xbl_config_a xbl_config.img
fastboot flash xbl_config_b xbl_config.img
fastboot flash xbl_ramdump_a xbl_ramdump.img
fastboot flash xbl_ramdump_b xbl_ramdump.img
echo Flashing firmware done... If you see any failed messages above, please re-run the script, otherwise reboot to system.
pause

:ext
exit /b