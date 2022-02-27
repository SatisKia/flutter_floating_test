import 'package:flutter/material.dart';

class MyFloatingActionButton extends ElevatedButton {
  MyFloatingActionButton(IconData icon, {
    Color foregroundColor = Colors.white,
    Color backgroundColor = Colors.blue,
    double elevation = 8.0,
    void Function()? onPressed,
    Key? key
  }) : super(key: key,
    child: Icon(
        icon,
        color: foregroundColor
    ),
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const CircleBorder(
        side: BorderSide.none,
      )),
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      elevation: MaterialStateProperty.all(elevation),
    ),
    onPressed: onPressed,
  );
}
