import 'package:allycare_app/widgets/card_widget.dart';
import 'package:allycare_app/widgets/progressbar.dart';
import 'package:allycare_app/widgets/timeline_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';

import '../data/constatnts.dart';

class homeicon extends StatefulWidget {
  const homeicon({Key? key}) : super(key: key);

  @override
  State<homeicon> createState() => _homeiconState();
}

class _homeiconState extends State<homeicon> {
  int currentPos = 1;
  Map<dynamic, dynamic> rehabList = {};
  List<Session> sessions = [];

  @override
  void initState() {
    super.initState();
    getCurrentPoss();
  }

  void getCurrentPoss() {
    Query starCountRef = FirebaseDatabase.instance
        .ref('sessions/${Moment.now().format("dd-MM-yyyy")}')
        .limitToLast(1);
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (data == null) {
        return setState(() {
          currentPos = 1;
        });
      }

      Map<dynamic, dynamic> jsonData = data as Map<dynamic, dynamic>;

      print(jsonData.entries.first.value);

      var pos =
          sessions.indexWhere((e) => e.title == jsonData.entries.first.value);
      print(pos);

      setState(() {
        currentPos = pos + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 1; i <= itemLength; i++) {
      sessions.add(
        Session(
            title: 'Session $i',
            imageurl: "https://source.unsplash.com/random/?yoga,workout"),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Morning ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Jane  ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ProgressBarCard(
                currenPos: currentPos,
              ),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimeLineWidget(
                      currentPos: currentPos,
                      length: itemLength,
                    ),
                    Container(
                      width: 20,
                      height: 100,
                    ),
                    CardWidget(currentPos: currentPos, sessions: sessions)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Start Session"),
        icon: const Icon(Icons.play_circle),
        onPressed: () async {
          DatabaseReference ref = FirebaseDatabase.instance
              .ref('/sessions/${Moment.now().format("dd-MM-yyyy")}');

          await ref.update({
            Moment.now().format("HH:mm:ss"): "Session ${currentPos + 1}",
          });
          if (currentPos == itemLength) {
            showAlertDialog(BuildContext context) {
              // set up the button
              Widget okButton = TextButton(
                child: Text("OK"),
                onPressed: () {},
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("My title"),
                content: Text("This is my message."),
                actions: [
                  okButton,
                ],
              );

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          }
        },
      ),
    );
  }
}
