import 'package:flutter/material.dart';

class Switchitem extends StatefulWidget {
  const Switchitem({Key? key}) : super(key: key); // Perbarui parameter key

  @override
  State<Switchitem> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Switchitem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (value) {
        setState(() {
          isSelected = !isSelected;
          print("Value $value");
        });
      },
      value: isSelected,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.orange,
    );
  }
}
