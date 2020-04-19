## MySensors Gateway in docker

Develop:
```
make build
```

PINOUT:
```
--my-rs485-de-pin=12
--my-leds-err-pin=11 --my-leds-rx-pin=13 --my-leds-tx-pin=15
```

Run:

```
docker run --rm --name=mysgw --net=host --privileged \
  -v /opt/mysensors/shared:/opt/mysensors/shared \
  chytreg/mysensors:rs485-mqtt-latest
```

### Systemd on raspberrypi

```
systemctl enable /etc/systemd/system/mysgw.service
systemctl start mysgw.service
journalctl -f -u mysgw.service
```

### Sources:
- https://www.mysensors.org/build/raspberry
- https://www.mysensors.org/apidocs/group__RaspberryPiGateway.html
- https://forum.mysensors.org/topic/10156/rpi-mqtt-gateway-on-docker?_=1587251097852&lang=pl
- https://forum.mysensors.org/topic/6960/raspberry-pi-3-as-gateway-using-rs485/7?lang=pl
