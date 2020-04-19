FROM arm32v7/debian:buster-slim as build
RUN mkdir -p /opt/MySensors-src
WORKDIR /opt/MySensors-src
RUN apt-get update && apt-get install -y --no-install-recommends \
  git build-essential ca-certificates
RUN git clone -b 2.3.2 --depth 1 https://github.com/mysensors/MySensors.git  .
RUN echo "##### Building version: $(cat library.properties | grep version | cut -d= -f2)-$(git rev-parse --short HEAD)"
RUN LDFLAGS="-static" ./configure \
  --my-transport=rs485 --my-rs485-serial-port=/dev/ttyAMA0 --my-rs485-baudrate=9600 --my-rs485-de-pin=12 \
  --my-gateway=mqtt --my-controller-ip-address=127.0.0.1 --my-port=1883 --my-mqtt-client-id=gateway-rs485 \
  --my-mqtt-publish-topic-prefix=mysensors-out --my-mqtt-subscribe-topic-prefix=mysensors-in \
  --my-leds-err-pin=11 --my-leds-rx-pin=13 --my-leds-tx-pin=15 \
  --my-config-file=/opt/mysensors/mysensors.conf --spi-driver=BCM --soc=BCM2836 \
  --cpu-flags="-mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53" \
  && make

FROM arm32v7/debian:buster-slim
RUN mkdir -p /opt/mysensors
WORKDIR /opt/mysensors
COPY mysensors.conf ./
COPY --from=build /opt/MySensors-src/bin/mysgw ./

ENTRYPOINT ["./mysgw"]
