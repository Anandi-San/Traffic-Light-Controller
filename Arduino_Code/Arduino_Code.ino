#define LED_1 27  
#define LED_2 12
#define LED_3 14
#define LED_4 26
#define LED_5 33
#define LED_6 15
#define LED_7 32
#define LED_8 16
#define LED_9 4
#define LED_10 2
#define LED_11 1
#define LED_12 13


void setup() {
  // put your setup code here, to run once:
  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);
  pinMode(LED_4, OUTPUT);
  pinMode(LED_5, OUTPUT);
  pinMode(LED_6, OUTPUT);
  pinMode(LED_7, OUTPUT);
  pinMode(LED_8, OUTPUT);
  pinMode(LED_9, OUTPUT);
  pinMode(LED_10, OUTPUT);
  pinMode(LED_11, OUTPUT);
  pinMode(LED_12, OUTPUT);
 
}

void loop() {
  digitalWrite(LED_1, HIGH);
  delay(500);
  digitalWrite(LED_1, LOW);
  delay(500);
  
  digitalWrite(LED_2, HIGH);
  delay(500);
  digitalWrite(LED_2, LOW);
  delay(500);
  
  digitalWrite(LED_3, HIGH);
  delay(500);
  digitalWrite(LED_3, LOW);
  delay(500);

  digitalWrite(LED_4, HIGH);
  delay(500);
  digitalWrite(LED_4, LOW);
  delay(500);
  
  digitalWrite(LED_5, HIGH);
  delay(500);
  digitalWrite(LED_5, LOW);
  delay(500);
  
  digitalWrite(LED_6, HIGH);
  delay(500);
  digitalWrite(LED_6, LOW);
  delay(500);

  digitalWrite(LED_7, HIGH);
  delay(500);
  digitalWrite(LED_7, LOW);
  delay(500);
  
  digitalWrite(LED_8, HIGH);
  delay(500);
  digitalWrite(LED_8, LOW);
  delay(500);
  
  digitalWrite(LED_9, HIGH);
  delay(500);
  digitalWrite(LED_9, LOW);
  delay(500);
  
  digitalWrite(LED_10, HIGH);
  delay(500);
  digitalWrite(LED_10, LOW);
  delay(500);
  
  digitalWrite(LED_11, HIGH);
  delay(500);
  digitalWrite(LED_11, LOW);
  delay(500);
  
  digitalWrite(LED_12, HIGH);
  delay(500);
  digitalWrite(LED_12, LOW);
  delay(500);
}