import 'package:allycare_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../data/constatnts.dart';

class ProgressBarCard extends StatefulWidget {
  final int currenPos;
  const ProgressBarCard({Key? key, required this.currenPos}) : super(key: key);

  @override
  State<ProgressBarCard> createState() => _ProgressBarCardState();
}

class _ProgressBarCardState extends State<ProgressBarCard> {
  @override
  Widget build(BuildContext context) {
    double percentage = (widget.currenPos / itemLength) * 100;

    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.grey, // Set border color
              width: 3.0), // Set border width
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          // Make rounded corner of border
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Todays Progress",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 55,
                ),
                Text(
                  "${percentage.toString()}%",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              width: 344,
              lineHeight: 8.0,
              percent: percentage / 100,
              progressColor: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 238, 71),
                        border: Border.all(
                            color: Colors.grey, // Set border color
                            width: 0.0), // Set border width
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10.0)), // Set rounded corner radius
                        // Make rounded corner of border
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Completed"),
                      SizedBox(width: 10),
                      Text("${widget.currenPos} Sessions",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(
                    width: 98,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                            color: Colors.grey, // Set border color
                            width: 0.0), // Set border width
                        borderRadius: const BorderRadius.all(
                            Radius.circular(15.0)), // Set rounded corner radius
                        // Make rounded corner of border
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.arrow_right_alt,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pending"),
                      SizedBox(width: 10),
                      Text("${itemLength - widget.currenPos} Sessions",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
