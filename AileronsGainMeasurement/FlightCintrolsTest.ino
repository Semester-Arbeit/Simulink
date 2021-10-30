#include <Servo.h>
#include <mbed.h>
#include <Arduino_PortentaBreakout.h>
#include "FlightControls.h"
#include "DataLogger.h"
#include "Config.h"

Config configurationData = Config();
FlightControls flightSystem = FlightControls(&configurationData);


void setup() {
  double power = 80;
  double pitch = 60;
  bool motor = true;

  
  Serial.begin(9600);
  
  
  Serial.print("Starting in 3:");  
  delay(3000);


  for(double i = 5; i<=50;i+=5)
  {
    Serial.print("Set Ailerons:");  
    Serial.println(flightSystem.setAilerons(-i, 0, 0));
    Serial.print("Pitch:");
    Serial.println(i);
    delay(3000);
    flipflap();
    
    delay(1000);
    flightSystem.setAilerons(-i, 0, 0);
    delay(1000);
    
    if(motor)
    {
      flightSystem.setThrotle(power);
      Serial.print("Power:");
      Serial.println(power);
    }
    delay(5000);
    
    flightSystem.setThrotle(0);
    Serial.print("Power:");
    Serial.println(0);
    Serial.println("Time To Write Results");    
    delay(15000);
    
    flightSystem.setAilerons(0, 0, 0);
    flipflap();
  }



    


}

void loop() {

    Serial.println("off");
}


void flipflap(){

flightSystem.setAilerons(10, 0, 0);
    delay(500);
    flightSystem.setAilerons(0, 0, 0);
    delay(500);
}
