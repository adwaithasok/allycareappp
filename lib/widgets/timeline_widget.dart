import 'package:allycare_app/widgets/check_mark.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeLineWidget extends StatefulWidget {
  final int length;
  final int currentPos;
  const TimeLineWidget(
      {Key? key, required this.length, required this.currentPos})
      : super(key: key);

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  @override
  final double lineLength = 150 + 20 - (25);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: lineLength / 2),
      child: Column(children: [
        for (int i = 1; i <= widget.length; i++) ...[
          CheckMark(
            color: i <= widget.currentPos
                ? Colors.blue
                : Color.fromARGB(255, 136, 194, 241),
          ),
          i == widget.length
              ? SizedBox()
              : FDottedLine(
                  color: Colors.blue,
                  height: lineLength,
                ),
        ]
      ]),
    );
  }
}
