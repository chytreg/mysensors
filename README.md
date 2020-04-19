## Mysensors in docker

```
docker run --rm --cap-add SYS_RAWIO --device /dev/mem \
  -v /opt/mysensors:/opt/mysensors -name=mygw \
  chytreg/mysensors:rs485-mqtt-latest
```

Sources:
- https://www.mysensors.org/build/raspberry
- https://www.mysensors.org/apidocs/group__RaspberryPiGateway.html
- https://forum.mysensors.org/topic/10156/rpi-mqtt-gateway-on-docker?_=1587251097852&lang=pl
- https://forum.mysensors.org/topic/6960/raspberry-pi-3-as-gateway-using-rs485/7?lang=pl
