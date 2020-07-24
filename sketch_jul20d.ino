

}char auth[] = "AzUyOErxtZiIU2VifhmeiH0boexm4NGt
";
char ssid[] = "Wifi.id"; //User hostspot dari hp nya masing masing
char pass[] = "bisa12345"; //Password dari  hostpot

WidgetLED led1(V1);


int sensor1 = D1;


void setup()
{
  // Debug console
  Serial.begin(9600);
  Blynk.begin(auth, ssid, pass);

  pinMode(sensor2,INPUT);
  

  while (Blynk.connect() == false) {
  }
}

void loop() {
  int sensorval1 = digitalRead(sensor1);
  
  Serial.println(sensorval1);
  
  delay(1000);
  
    if (sensorval1 == 1)
    {
  led1.on();
  }
   
    {
  led2.on();
  }

    if (sensorval1 == 0)
    {
  led1.off();
  }
    
    {
  
  }

  Blynk.run();
}
