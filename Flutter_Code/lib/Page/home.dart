import 'package:flutter/material.dart';
import 'package:traffic_light_controller/Component/switch_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color(0xFFD9D9D9),
              width: double.infinity,
              height: 100,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Lorem Ipsum',
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
                    color: const Color(0xFFDCDCDC),
                    child: const ExpansionTile(
                      title: Text(
                        'Title 1',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Item 1',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 2',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 3',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFFDCDCDC),
                    child: const ExpansionTile(
                      title: Text(
                        'Title 2',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Item 1',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 2',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 3',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFFDCDCDC),
                    child: const ExpansionTile(
                      title: Text(
                        'Title 3',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Item 1',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 2',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 3',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xFFDCDCDC),
                    child: const ExpansionTile(
                      title: Text(
                        'Title 4',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Item 1',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          // Garis pemisah pertama
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Item 2',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        Divider(
                          // Garis pemisah pertama
                          color: Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Item 3',
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
                    color: const Color(0xFFDCDCDC),
                    child: const ExpansionTile(
                      title: Text(
                        'Title 5',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Item 1',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                        ListTile(
                          title: Text('Item 2',
                              style: TextStyle(color: Colors.white)),
                          trailing: Switchitem(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBD8D8),
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
                          padding: EdgeInsets.only(right: 20.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Lorem Ipsum',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
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
