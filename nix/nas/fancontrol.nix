{
    hardware.fancontrol = {
        enable = true;
        config = ''
            INTERVAL=10
            DEVPATH=hwmon0=devices/pci0000:00/0000:00:01.1/0000:01:00.0/nvme/nvme0 hwmon1=devices/pci0000:00/0000:00:18.3 hwmon4=devices/platform/nct6775.656
            DEVNAME=hwmon0=nvme hwmon1=k10temp hwmon4=nct6792
            FCTEMPS=hwmon4/pwm3=hwmon0/temp1_input hwmon4/pwm2=hwmon1/temp1_input
            FCFANS=hwmon4/pwm3=hwmon4/fan3_input hwmon4/pwm2=hwmon4/fan2_input
            MINTEMP=hwmon4/pwm3=40 hwmon4/pwm2=40
            MAXTEMP=hwmon4/pwm3=50 hwmon4/pwm2=60
            MINSTART=hwmon4/pwm3=150 hwmon4/pwm2=150
            MINSTOP=hwmon4/pwm3=0 hwmon4/pwm2=0
        '';
    };
}
