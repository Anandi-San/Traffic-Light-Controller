import 'package:flutter/material.dart';
import 'package:traffic_light_controller/Component/switch_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFF4F4A45),
                    child: const ExpansionTile(
                      title: Text(
                        'Lajur Utara',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Hijau',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Kuning',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Merah',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFF4F4A45),
                    child: const ExpansionTile(
                      title: Text(
                        'Lajur Barat',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Hijau',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Kuning',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Merah',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFF4F4A45),
                    child: const ExpansionTile(
                      title: Text(
                        'Lajur Selatan',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Hijau',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Kuning',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Merah',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFF4F4A45),
                    child: const ExpansionTile(
                      title: Text(
                        'Lajur Timur',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Hijau',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Kuning',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          // Garis pemisah pertama
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Merah',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          // Garis pemisah pertama
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFF4F4A45),
                    child: const ExpansionTile(
                      title: Text(
                        'Semua Jalur',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Hijau',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Kuning',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
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
                          padding: const EdgeInsets.only(left: 80.0),
                          child: Transform.scale(
                            scale:
                                3.5, // Sesuaikan faktor skala sesuai kebutuhan
                            child:
                                const Switchitem(), // Menempatkan widget Switchitem di dalam Container
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Kembalikan Normal',
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
          ],
        ),
      ),
    );
  }
}
