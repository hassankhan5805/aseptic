#include <WiFi.h>
#include <String.h>
#include <stdint.h>
const char *ssid =  "aseptic";   //Wifi SSID (Name)
const char *pass =  "123456789"; //wifi password
const int pin1 = 2;
const int pin2 = 3;
const int pin3 = 4;
const int pin4 = 5;

#include <Wire.h>



WiFiServer wifiServer(1669);
void setup() {
  Serial.begin(115200);

  delay(100);

  IPAddress apIP(192, 168, 43, 230); //Static IP for wifi gateway
  WiFi.softAPConfig(apIP, apIP, IPAddress(255, 255, 255, 0)); //set Static IP gateway on NodeMCU
  WiFi.softAP(ssid, pass); //turn on WIFI



  wifiServer.begin();
    pinMode(pin1, OUTPUT);
  pinMode(pin2, OUTPUT);
  pinMode(pin3, OUTPUT);
  pinMode(pin4, OUTPUT);
STOP();
}
bool once = true;
void loop() {

  WiFiClient client = wifiServer.available();
  String command = "";


  if (client) {
    while (client.connected()) {
      while (client.available() > 0) {
        if(once){
          Serial.println("Connected to device");
          once= false;
          }
        char c = client.read();
        if (c == '\n') {
          break;
        }
        command += c;
        Serial.write(c);
      }
      char cmd[command.length()];
      command.toCharArray(cmd, command.length());
      if(command=="F"){
        forward();
      }else if(command == "L"){
        left();
      }else if(command == "R"){
        right();
      }
       else if(command == "B"){
        Serial.write("backward pressed \n");
        backward();
       }else{
        STOP();}
      
      command = "";
      delay(10);
    }
    client.stop();
    Serial.println("Client disconnected");
  }
}

void forward(){
  digitalWrite(pin1, LOW);
  digitalWrite(pin2, HIGH);
  digitalWrite(pin3, LOW);
  digitalWrite(pin4, HIGH);
  delay(200);
  }

  void backward(){
    digitalWrite(pin1, HIGH);
  digitalWrite(pin2, LOW);
  digitalWrite(pin3, HIGH);
  digitalWrite(pin4, LOW);
    delay(200);
  }

  void left(){
    digitalWrite(pin1, LOW);
  digitalWrite(pin2, HIGH);
  digitalWrite(pin3, HIGH);
  digitalWrite(pin4, LOW);
    delay(200);
  }

  void right(){
    digitalWrite(pin1, HIGH);
  digitalWrite(pin2, LOW);
  digitalWrite(pin3, LOW);
  digitalWrite(pin4, HIGH);
    delay(200);
  }
void  STOP(){
      digitalWrite(pin1, HIGH);
  digitalWrite(pin2, HIGH);
  digitalWrite(pin3, HIGH);
  digitalWrite(pin4, HIGH);}
