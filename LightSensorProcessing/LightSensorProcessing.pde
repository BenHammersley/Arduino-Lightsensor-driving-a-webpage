import processing.serial.*;
import processing.net.*;

int linefeed = 10;
int lightValue;
int oldLightValue;
Client client;
String responseString = "";
boolean requestInProgress;

Serial port;

void setup () {
  frameRate(10);
  String  arduinoPort = Serial.list()[1];
  port = new Serial(this, arduinoPort, 9600);
  port.bufferUntil(linefeed);
}

void draw() {
}

void serialEvent(Serial port) {
  String myString = port.readStringUntil(linefeed);
  if (myString != null) {
    lightValue = int(trim(myString));

    if ((lightValue > 150) && (oldLightValue < 150)) {
      goLight();
    } 

    if ((lightValue < 150) && (oldLightValue > 150)) {
      goDark();
    } 

    oldLightValue = lightValue;
    delay(10);
  }
}

void goDark()
{
  client = new Client(this, "benhammersley.com", 80);
  client.write("GET /lightsensor/goDark.cgi HTTP/1.0\r\n");
  client.write("HOST: benhammersley.com\r\n\r\n");
  print("Dark now");
}

void goLight()
{
  client = new Client(this, "benhammersley.com", 80);
  client.write("GET /lightsensor/goLight.cgi HTTP/1.0\r\n");
  client.write("HOST: benhammersley.com\r\n\r\n");
  print("Light now");
}

