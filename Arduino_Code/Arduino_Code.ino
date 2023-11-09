#include <WiFi.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include <map>

const char* ssid = "realme 5 Pro";
const char* password = "solitude";

AsyncWebServer server(80);

struct Road {
  int hijau;
  int kuning;
  int merah;
};

std::map<int, Road> roads = {
    {1, {27, 14, 12}},
    {2, {26, 33, 15}},
    {3, {32, 16, 4}},
    {4, {2, 17, 13}}
};

bool normalMode = true; // Variabel untuk menandakan mode normal atau tidak
bool blinkMode = false; // Variabel untuk menandakan mode kuning kelap-kelip
bool stopMode = false; // Variabel untuk menandakan mode stop
bool greenMode1 = false;
bool greenMode2 = false;
bool greenMode3 = false;
bool greenMode4 = false;

void setup() {
  Serial.begin(9600);

  // Inisialisasi pin LED
  for(auto const &entry : roads) {
    pinMode(entry.second.hijau, OUTPUT);
    pinMode(entry.second.kuning, OUTPUT);
    pinMode(entry.second.merah, OUTPUT);
  }

  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

  // Print ESP Local IP Address
  Serial.println(WiFi.localIP());

  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    sendJsonResponse(request, 200, "Halo bang");
  });

  server.on("/normal", HTTP_GET, [](AsyncWebServerRequest *request){
    normalMode = true; // Aktifkan mode normal
    blinkMode = false;
    stopMode = false;
    sendJsonResponse(request, 200, "Normal traffic light sequence started.");
  });

  server.on("/green", HTTP_GET, [](AsyncWebServerRequest *request){
    String roadId = request->getParam("road")->value();
    int roadNumber = roadId.toInt();
    normalMode = false; // Nonaktifkan mode normal
    blinkMode = false;
    stopMode = false;
    if (roads.find(roadNumber) != roads.end()) {
      if (roadNumber == 1) {
        greenMode1 = true;
      }else if (roadNumber == 2) {
        greenMode2 = true;
      }else if (roadNumber == 3) {
        greenMode3 = true;
      }else if (roadNumber == 4) {
        greenMode4 = true;
      }
      sendJsonResponse(request, 200, "Green light activated for road " + roadId);
    } else {
      sendJsonResponse(request, 400, "Invalid road specified.");
    }
  });

  server.on("/stop", HTTP_GET, [](AsyncWebServerRequest *request){
    normalMode = false; // Nonaktifkan mode normal
    blinkMode = false; // Nonaktifkan mode kuning kelap-kelip
    stopMode = true;
    sendJsonResponse(request, 200, "Traffic has been stopped.");
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
    runNormalTrafficLightSequence();
  } else if(blinkMode) {
    // jika dalam mode blink, lampu lalu lintas menjadi kuning kelap-kelip
    runBlinkingSequence();
  } else if(stopMode) {
    // Jadikan semua lampu jadi merah selama 10 detik
    stopTraffic();
  } else if(greenMode1) {
    greenTrafficLight(1);
  } else if(greenMode2) {
    greenTrafficLight(2);
  } else if(greenMode3) {
    greenTrafficLight(3);
  } else if(greenMode4) {
    greenTrafficLight(4);
  }
}

void sendJsonResponse(AsyncWebServerRequest *request, int status, String message) {
  String response = "{\"status\": " + String(status) + ", \"message\": \"" + message + "\"}";
  request->send(200, "application/json", response);
}

void runNormalTrafficLightSequence() {
  // jalan 1 lampu hijaunya nyala dan jalan sisanya lampu merahnya nyala
    digitalWrite(roads[1].merah, HIGH);
    digitalWrite(roads[1].kuning, HIGH);
    digitalWrite(roads[1].hijau, LOW);

    digitalWrite(roads[2].merah, LOW);
    digitalWrite(roads[2].kuning, HIGH);
    digitalWrite(roads[2].hijau, HIGH);

    digitalWrite(roads[3].merah, LOW);
    digitalWrite(roads[3].kuning, HIGH);
    digitalWrite(roads[3].hijau, HIGH);

    digitalWrite(roads[4].merah, LOW);
    digitalWrite(roads[4].kuning, HIGH);
    digitalWrite(roads[4].hijau, HIGH);

    delay(3000); // delay 3 detik
    if (!normalMode) {
      return;
    }

    // jalan 1 lampu hijaunya mati
    digitalWrite(roads[1].hijau, HIGH);

    // jalan 1 lampu merahnya nyala dan jalan 2 siap menjadi hijau
    digitalWrite(roads[1].merah, LOW);
    digitalWrite(roads[1].kuning, HIGH);

    digitalWrite(roads[2].merah, HIGH);
    digitalWrite(roads[2].kuning, LOW);

    delay(1000); // delay 1 detik
    if (!normalMode) {
      return;
    }
    // jalan 2 lampu hijaunya nyala dan lampu jalan yang lain jadi merah
    digitalWrite(roads[2].kuning, HIGH);
    digitalWrite(roads[2].hijau, LOW);

    delay(3000); // delay 3 detik
    if (!normalMode) {
      return;
    }

    // jalan 2 lampu hijaunya mati
    digitalWrite(roads[2].hijau, HIGH);

    // jalan 2 lampu merahnya nyala dan jalan 3 siap menjadi hijau
    digitalWrite(roads[2].merah, LOW);
    digitalWrite(roads[2].kuning, HIGH);

    digitalWrite(roads[3].merah, HIGH);
    digitalWrite(roads[3].kuning, LOW);

    delay(1000); // delay 1 detik
    if (!normalMode) {
      return;
    }

    // jalan 3 lampu hijaunya nyala dan lampu jalan yang lain jadi merah
    digitalWrite(roads[3].kuning, HIGH);
    digitalWrite(roads[3].hijau, LOW);

    delay(3000); // delay 3 detik
    if (!normalMode) {
      return;
    }

    // jalan 3 lampu hijaunya mati
    digitalWrite(roads[3].hijau, HIGH);

    // jalan 3 lampu merahnya nyala dan jalan 4 siap menjadi hijau
    digitalWrite(roads[3].merah, LOW);
    digitalWrite(roads[3].kuning, HIGH);

    digitalWrite(roads[4].merah, HIGH);
    digitalWrite(roads[4].kuning, LOW);

    delay(1000); // delay 1 detik
    if (!normalMode) {
      return;
    }

    // jalan 4 lampu hijaunya nyala dan lampu jalan yang lain jadi merah
    digitalWrite(roads[4].kuning, HIGH);
    digitalWrite(roads[4].hijau, LOW);

    delay(3000); // delay 3 detik
    if (!normalMode) {
      return;
    }

    // jalan 4 lampu hijaunya mati
    digitalWrite(roads[4].hijau, HIGH);

    // jalan 4 lampu merahnya nyala dan jalan 1 siap menjadi hijau
    digitalWrite(roads[4].merah, LOW);
    digitalWrite(roads[4].kuning, HIGH);

    digitalWrite(roads[1].merah, HIGH);
    digitalWrite(roads[1].kuning, LOW);

    delay(1000); // delay 1 detik
    if (!normalMode) {
      return;
    }
}

void runBlinkingSequence() {
  // lampu kuning nyala sisanya di matikan
    digitalWrite(roads[1].merah, HIGH);
    digitalWrite(roads[1].kuning, LOW);
    digitalWrite(roads[1].hijau, HIGH);

    digitalWrite(roads[2].merah, HIGH);
    digitalWrite(roads[2].kuning, LOW);
    digitalWrite(roads[2].hijau, HIGH);

    digitalWrite(roads[3].merah, HIGH);
    digitalWrite(roads[3].kuning, LOW);
    digitalWrite(roads[3].hijau, HIGH);

    digitalWrite(roads[4].merah, HIGH);
    digitalWrite(roads[4].kuning, LOW);
    digitalWrite(roads[4].hijau, HIGH);

    delay(2000); // delay 2 detik
    if (!blinkMode) {
      return;
    }

    // lampu kuning dimatikan
    digitalWrite(roads[1].kuning, HIGH);
    digitalWrite(roads[2].kuning, HIGH);
    digitalWrite(roads[3].kuning, HIGH);
    digitalWrite(roads[4].kuning, HIGH);

    delay(2000); // delay 2 detik
    if (!blinkMode) {
      return;
    }
}

void greenTrafficLight(int roadNumber) {
  Road& road = roads[roadNumber];

  // Matikan lampu lalu lintas yang lain dulu
  turnOffLights();

  delay(500); // delay 0.5 detik

  // Nyalakan lampu merah untuk jalur yang tidak dipilih
  for(auto const &entry : roads) {
    if (entry.first != roadNumber) {
      digitalWrite(entry.second.merah, LOW);
    }
  }

  // Nyalakan lampu hijau jalan sesuai permintaan
  digitalWrite(road.hijau, LOW);
  delay(10000); // delay 10 detik

  normalMode = true; // Aktifkan mode normal
  greenMode1 = false;
  greenMode2 = false;
  greenMode3 = false;
  greenMode4 = false;
  return;
}

void stopTraffic() {
  // Matikan semua lampu hijau dan kuning, nyalakan lampu merah untuk setiap jalan
  for(auto const &entry : roads) {
    digitalWrite(entry.second.hijau, HIGH);
    digitalWrite(entry.second.kuning, HIGH);
    digitalWrite(entry.second.merah, LOW);
  }

  delay(10000); // delay 10 detik

  normalMode = true; // Aktifkan mode normal
  stopMode = false;
  return;
}

void turnOffLights() {
  digitalWrite(roads[1].merah, HIGH);
  digitalWrite(roads[1].kuning, HIGH);
  digitalWrite(roads[1].hijau, HIGH);

  digitalWrite(roads[2].merah, HIGH);
  digitalWrite(roads[2].kuning, HIGH);
  digitalWrite(roads[2].hijau, HIGH);

  digitalWrite(roads[3].merah, HIGH);
  digitalWrite(roads[3].kuning, HIGH);
  digitalWrite(roads[3].hijau, HIGH);

  digitalWrite(roads[4].merah, HIGH);
  digitalWrite(roads[4].kuning, HIGH);
  digitalWrite(roads[4].hijau, HIGH);
}
