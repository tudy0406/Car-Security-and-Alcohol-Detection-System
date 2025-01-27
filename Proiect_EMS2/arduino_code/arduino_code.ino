#include <Adafruit_GFX.h>    // Core graphics library
#include <Adafruit_ST7735.h> // Hardware-specific library
#include <SPI.h>


#define Sober 500 
#define Drunk 600

#define MQ3pin 0

float sensorValue;

#define TFT_CS 9
#define TFT_RST 7
#define TFT_DC 8

Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS,  TFT_DC, TFT_RST);

#define TFT_SCLK 13
#define TFT_MOSI 11 

void setup() {
	Serial.begin(9600);
	Serial.println("MQ3 warming up!");
  tft.initR(INITR_BLACKTAB);
  uint16_t time = millis();
  tft.fillScreen(ST7735_BLACK);
  //drawWarningSign(tft.width() / 2, tft.height() / 2, 60);
  time = millis() - time;
	delay(5000);
}

void loop() {
	sensorValue = analogRead(MQ3pin);
  char sensorValueStr[10];

  int centerX = tft.width() / 2;
  int centerY = tft.height() / 2;

	Serial.print("Sensor Value: ");
	Serial.print(sensorValue);
  itoa(sensorValue, sensorValueStr, 10);

  if (sensorValue < Sober) {
    Serial.println("  |  Status: Stone Cold Sober");
    tft.fillScreen(ST7735_BLACK);
    testdrawtext(5,5,"Stone Cold Sober", ST77XX_WHITE);
    testdrawtext(5,15,sensorValueStr, ST77XX_WHITE);
    drawThickCheckmark(centerX,centerY);
  } else if (sensorValue >= Sober && sensorValue < Drunk) {
    Serial.println("  |  Status: Drinking but within legal limits");
    tft.fillScreen(ST7735_BLACK);
    testdrawtext(5,5,"Drinking but within legal limits", ST77XX_WHITE);
    testdrawtext(5,15,sensorValueStr, ST77XX_WHITE);
    drawWarningSign(tft.width() / 2, tft.height() / 2, 60);
  } else {
    Serial.println("  |  Status: DRUNK");
    tft.fillScreen(ST7735_BLACK);
    testdrawtext(5,5,"DRUNK", ST77XX_WHITE);
    testdrawtext(5,15,sensorValueStr, ST77XX_WHITE);
    drawThickX(centerX,centerY);
  }
	
	delay(2000);
}

void drawThickCheckmark(int centerX, int centerY) {
  // Green color for the checkmark
  int lineThickness = 5; // Thickness of the checkmark
  
  // Draw the checkmark as multiple lines to create thickness
  for (int i = -lineThickness / 2; i < lineThickness / 2 + 1; i++) {
    tft.drawLine(centerX - 30 + i, centerY, centerX + i, centerY + 30, ST77XX_GREEN); // First line of checkmark
    tft.drawLine(centerX + i, centerY + 30, centerX + 30 + i, centerY - 30, ST77XX_GREEN); // Second line of checkmark
  }
}

void drawThickX(int centerX, int centerY) {
  // Red color for the "X"
  int lineThickness = 5; // Thickness of the X
  
  // Draw the "X" as multiple lines to create thickness
  for (int i = -lineThickness / 2; i < lineThickness / 2 + 1; i++) {
    tft.drawLine(centerX - 30 + i, centerY - 30, centerX + 30 + i, centerY + 30, ST77XX_RED); // First line of X
    tft.drawLine(centerX - 30 + i, centerY + 30, centerX + 30 + i, centerY - 30, ST77XX_RED); // Second line of X
  }
}

void drawWarningSign(int centerX, int centerY, int size) {
  int halfSize = size / 2;

  // Move the triangle down by adjusting centerY
  int offsetY = size / 4; // Adjust this value to control how far down to move the sign
  centerY += offsetY;

  // Draw triangle (solid yellow)
  tft.fillTriangle(centerX, centerY - halfSize, 
                   centerX - halfSize, centerY + halfSize, 
                   centerX + halfSize, centerY + halfSize, 
                   ST77XX_YELLOW);

  // Draw exclamation mark
  int barWidth = size / 10;
  int barHeight = size / 4;
  int dotRadius = barWidth; // Adjust dot size

  // Draw vertical bar of exclamation mark
  tft.fillRect(centerX - barWidth / 2, centerY - barHeight / 2, barWidth, barHeight, ST77XX_BLACK);

  // Draw the dot of exclamation mark
  tft.fillCircle(centerX, centerY + barHeight / 2, dotRadius, ST77XX_BLACK);
}

void testdrawtext(int wid, int hei, char *text, uint16_t color) {
  tft.setCursor(wid, hei);
  tft.setTextColor(color);
  tft.setTextWrap(true);
  tft.print(text);
}


