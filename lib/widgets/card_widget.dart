import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/constatnts.dart';
import 'package:firebase_database/firebase_database.dart';

class CardWidget extends StatefulWidget {
  final int currentPos;
  final List<Session> sessions;

  const CardWidget({Key? key, required this.currentPos, required this.sessions})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class Session {
  String title;
  String imageurl;

  Session({
    required this.title,
    required this.imageurl,
  });
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    List<Session> sessions = [];

    for (var i = 1; i <= itemLength; i++) {
      sessions.add(
        Session(
            title: 'Session $i',
            imageurl: "https://source.unsplash.com/random/?yoga,workout"),
      );
    }

    return Expanded(
        child: Column(
      children: [
        for (var i = 0; i < sessions.length; i++)
          Column(
            children: [
              Opacity(
                opacity: i + 1 < widget.currentPos ? 0.5 : 1,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey, // Set border color
                        width: 3.0), // Set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                    // Make rounded corner of border
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                sessions[i].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: i + 1 < widget.currentPos
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 6, 81, 255),
                                            // Set border width
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    10.0)), // Set rounded corner radius
                                            // Make rounded corner of border
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0,
                                                right: 10,
                                                top: 2,
                                                bottom: 2),
                                            child: Text(
                                              "Completed",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Perfomed at",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const Text("time")
                                      ],
                                    )
                                  : i + 1 == widget.currentPos
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 254, 178, 0),
                                                // Set border width
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        10.0)), // Set rounded corner radius
                                                // Make rounded corner of border
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Text(
                                                  "Performed",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              "Enter pain score",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.blue,
                                                        // Set border width
                                                        borderRadius: BorderRadius
                                                            .all(Radius.circular(
                                                                15.0)), // Set rounded corner radius
                                                        // Make rounded corner of border
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.replay,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      )),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 178, 178, 178),
                                                    // Set border width
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            10.0)), // Set rounded corner radius
                                                    // Make rounded corner of border
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.0,
                                                        right: 10,
                                                        top: 2,
                                                        bottom: 2),
                                                    child: Text(
                                                      "Retry",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            const Icon(Icons.play_circle),
                                            const SizedBox(width: 20),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 214, 212, 212),
                                                // Set border width
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        10.0)), // Set rounded corner radius
                                                // Make rounded corner of border
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Text("Start"),
                                              ),
                                            )
                                          ],
                                        ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 70.0, top: 15, bottom: 15, right: 10),
                          child: Container(
                            child: Image.network(sessions[i].imageurl),
                            width: 70,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
      ],
    ));
  }
}
