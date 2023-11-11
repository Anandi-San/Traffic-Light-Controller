import 'package:flutter/material.dart';
import 'package:traffic_light_controller/Component/switch_item.dart';
import 'package:http/http.dart' as http;

class SemuaJalur {
  String ipAddress = '192.168.21.1';
  Future<void> fetchData(String path) async {
    var url = Uri.parse('http://$ipAddress/$path');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // print('Response body: ${response.body}');
      } else {
        // print('Gagal memanggil API. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      // print('Error: $e');
    }
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

enum ActiveRoad {
  road1,
  road2,
  road3,
  road4,
  allYellow,
  allRed,
  normal,
}

class _HomeState extends State<Home> {
  // bool swicthValueHijau1 = false;
  // bool swicthValueHijau2 = false;
  // bool swicthValueHijau3 = false;
  // bool swicthValueHijau4 = false;
  // bool swicthValueSemuaKuning = false;
  // bool swicthValueSemuaMerah = false;
  // bool swicthValueSemuaNormal = false;
  ActiveRoad activeRoad = ActiveRoad.normal;

  SemuaJalur semuaJalur = SemuaJalur();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1EE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color(0xFF6C5F5B),
              width: double.infinity,
              height: 100,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Traffic Light Controller',
                    style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 255, 252, 252)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED7D31),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Transform.scale(
                            scale: 3.0,
                            child: Switchitem(
                              value: activeRoad == ActiveRoad.road1,
                              onChanged: (value) {
                                setState(() {
                                  if (value) {
                                    activeRoad = ActiveRoad.road1;
                                    semuaJalur.fetchData('green?road=1');
                                  } else {
                                    activeRoad = ActiveRoad.normal;
                                    semuaJalur.fetchData('normal');
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Hijau Jalur 1',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED7D31),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Transform.scale(
                            scale: 3.0,
                            child: Switchitem(
                              value: activeRoad == ActiveRoad.road2,
                              onChanged: (value) {
                                setState(() {
                                  if (value) {
                                    activeRoad = ActiveRoad.road2;
                                    semuaJalur.fetchData('green?road=2');
                                  } else {
                                    activeRoad = ActiveRoad.normal;
                                    semuaJalur.fetchData('normal');
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Hijau Jalur 2',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED7D31),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Transform.scale(
                            scale: 3.0,
                            child: Switchitem(
                              value: activeRoad == ActiveRoad.road3,
                              onChanged: (value) {
                                setState(() {
                                  if (value) {
                                    activeRoad = ActiveRoad.road3;
                                    semuaJalur.fetchData('green?road=3');
                                  } else {
                                    activeRoad = ActiveRoad.normal;
                                    semuaJalur.fetchData('normal');
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Hijau Jalur 3',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED7D31),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Transform.scale(
                            scale: 3.0,
                            child: Switchitem(
                              value: activeRoad == ActiveRoad.road4,
                              onChanged: (value) {
                                setState(() {
                                  if (value) {
                                    activeRoad = ActiveRoad.road3;
                                    semuaJalur.fetchData('green?road=3');
                                  } else {
                                    activeRoad = ActiveRoad.normal;
                                    semuaJalur.fetchData('normal');
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Hijau Jalur 4',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xFFED7D31),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Kuningkan',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Semua Jalur',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Transform.scale(
                                  scale: 3.0,
                                  child: Switchitem(
                                    value: activeRoad == ActiveRoad.allYellow,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value) {
                                          activeRoad = ActiveRoad.allYellow;
                                          semuaJalur.fetchData('blink');
                                        } else {
                                          activeRoad = ActiveRoad.normal;
                                          semuaJalur.fetchData('normal');
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Merahkan',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Semua Jalur',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Transform.scale(
                                  scale: 3.0,
                                  child: Switchitem(
                                    value: activeRoad == ActiveRoad.allRed,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value) {
                                          activeRoad = ActiveRoad.allRed;
                                          semuaJalur.fetchData('stop');
                                        } else {
                                          activeRoad = ActiveRoad.normal;
                                          semuaJalur.fetchData('normal');
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xFFED7D31),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Transform.scale(
                        scale: 3.5,
                        child: Switchitem(
                          value: activeRoad == ActiveRoad.normal,
                          onChanged: (value) {
                            setState(() {
                              if (value) {
                                activeRoad = ActiveRoad.normal;
                                semuaJalur.fetchData('normal');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 40.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Normalkan',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            Text(
                              'Semua Jalur',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
