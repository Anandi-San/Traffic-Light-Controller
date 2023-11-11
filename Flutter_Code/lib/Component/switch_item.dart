import 'package:flutter/material.dart';

class Switchitem extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool value;

  const Switchitem({Key? key, required this.value, this.onChanged})
      : super(key: key);

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
          isSelected = value;
          widget.onChanged?.call(value);
        });
      },
      value: widget.value,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.orange,
    );
  }
}
