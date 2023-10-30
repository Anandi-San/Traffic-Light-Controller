#include <WiFi.h>
#include <ESPAsyncWebServer.h>
#include <map>

const char* ssid = "Nama_Wifi";
const char* password = "Password_Wifi";

AsyncWebServer server(80);

struct Road {
  int hijau;
  int kuning;
  int merah;
};

std::map<int, Road> roads = {
    {1, {27, 12, 14}},
    {2, {26, 33, 15}},
    {3, {32, 16, 4}},
    {4, {2, 1, 13}}
};

bool normalMode = true; // Variabel untuk menandakan mode normal atau tidak
bool blinkMode = false; // Variabel untuk menandakan mode kuning kelap-kelip

void setup() {
  Serial.begin(115200);

  // Inisialisasi pin LED
  for(auto const &entry : roads) {
    pinMode(entry.second.hijau, OUTPUT);
    pinMode(entry.second.kuning, OUTPUT);
    pinMode(entry.second.merah, OUTPUT);
  }

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }

  Serial.println("Connected to WiFi");

  Serial.println("IP Address: " + WiFi.localIP().toString());

  server.on("/normal", HTTP_GET, [](AsyncWebServerRequest *request){
    normalMode = true; // Aktifkan mode normal
    blinkMode = false;
    sendJsonResponse(request, 200, "Normal traffic light sequence started.");
  });

  server.on("/green", HTTP_GET, [](AsyncWebServerRequest *request){
    String roadId = request->getParam("road")->value();
    int roadNumber = roadId.toInt();
    normalMode = false; // Nonaktifkan mode normal
    blinkMode = false;
    if (roads.find(roadNumber) != roads.end()) {
      greenTrafficLight(roadNumber);
      sendJsonResponse(request, 200, "Green light activated for road " + roadId);
    } else {
      sendJsonResponse(request, 400, "Invalid road specified.");
    }
  });

  server.on("/blink", HTTP_GET, [](AsyncWebServerRequest *request){
    normalMode = false; // Nonaktifkan mode normal
    blinkMode = true;
    sendJsonResponse(request, 200, "Traffic light blinking sequence started.");
  });

  server.begin();
}

void loop() {
  if(normalMode) {
    // Jika dalam mode normal, jalankan urutan lampu lalu lintas normal
    normalTrafficLight();
  } else if(blinkMode) {
    // jika dalam mode blink, lampu lalu lintas menjadi kuning kelap-kelip
    blinkTrafficLight();
  }
}

void sendJsonResponse(AsyncWebServerRequest *request, int status, String message) {
  String response = "{\"status\": " + String(status) + ", \"message\": \"" + message + "\"}";
  request->send(200, "application/json", response);
}

void normalTrafficLight() {
  for(auto const &entry : roads) {
    // Matikan semua lampu
    turnOffLights(entry.second);

    // Nyalakan lampu merah
    digitalWrite(entry.second.merah, HIGH);
    delay(3000);

    // Nyalakan lampu kuning
    digitalWrite(entry.second.kuning, HIGH);
    delay(1000);

    // Nyalakan lampu hijau
    digitalWrite(entry.second.hijau, HIGH);
    delay(3000);
  }
}

void greenTrafficLight(int roadNumber) {
  Road& road = roads[roadNumber];

  // Matikan lampu lalu lintas yang lain dulu
  turnOffLights(road);

  // Nyalakan lampu merah untuk jalur yang tidak dipilih
  for(auto const &entry : roads) {
    if (entry.first != roadNumber) {
      digitalWrite(entry.second.merah, HIGH);
    }
  }

  // Nyalakan lampu hijau jalan sesuai permintaan
  digitalWrite(road.hijau, HIGH);
  delay(5000);

  // Matikan semua lampu
  turnOffLights(road);

  // Delay 1 detik
  delay(1000);
}

void blinkTrafficLight() {
  for(auto const &entry : roads) {
    // Nyalakan kuning
    digitalWrite(entry.second.kuning, HIGH);
  }
  delay(2000);

  // Matikan semua lampu kuning
  for(auto const &entry : roads) {
    digitalWrite(entry.second.kuning, LOW);
  }
  delay(2000);
}

void turnOffLights(const Road& road) {
  digitalWrite(road.hijau, LOW);
  digitalWrite(road.kuning, LOW);
  digitalWrite(road.merah, LOW);
}
