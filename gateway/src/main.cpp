// Enable debug prints to serial monitor
#define MY_DEBUG
#define MY_DEBUG_VERBOSE_PJON
// PJON transport
#define MY_PJON
#define MY_PJON_PIN 13
// Enable serial gateway
#define MY_GATEWAY_SERIAL
// Enable inclusion mode
#define MY_INCLUSION_MODE_FEATURE
#define MY_INCLUSION_BUTTON_FEATURE
#define MY_INCLUSION_MODE_DURATION 30
#define MY_INCLUSION_LED_PIN A3
#define MY_INCLUSION_MODE_BUTTON_PIN A4
// Inverses the behavior of leds
#define MY_WITH_LEDS_BLINKING_INVERSE
// Flash leds on err/tx/rx/tx/
#define MY_DEFAULT_ERR_LED_PIN A0
#define MY_DEFAULT_TX_LED_PIN  A1
#define MY_DEFAULT_RX_LED_PIN  A2

#include <MySensors.h>

void setup()
{
	// Setup locally attached sensors
}

void presentation()
{
	// Present locally attached sensors
}

void loop()
{
	// Send locally attached sensor data here
}
