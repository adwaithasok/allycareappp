import 'package:flutter/material.dart';

class CheckMark extends StatelessWidget {
  final Color color;

  const CheckMark({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: this.color,
          border: Border.all(
              color: Colors.grey, // Set border color
              width: 0.0), // Set border width
          borderRadius: const BorderRadius.all(
              Radius.circular(25.0)), // Set rounded corner radius
          // Make rounded corner of border
        ),
        child: const Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(
            Icons.check,
            size: 20,
            color: Colors.white,
          ),
        ));
  }
}
