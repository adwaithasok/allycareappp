import 'dart:convert';

import 'package:allycare_app/data/constatnts.dart';
import 'package:allycare_app/screens/home_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RehabPage extends StatefulWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  State<RehabPage> createState() => _RehabPageState();
}

class Result {
  String title;
  String subtitle;

  Result({
    required this.title,
    required this.subtitle,
  });
}

class _RehabPageState extends State<RehabPage> {
  Map<dynamic, dynamic> rehabList = {};

  @override
  void initState() {
    super.initState();
    getDataFromeDb();
  }

  void getDataFromeDb() {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('sessions/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (data == null) {
        return;
      }

      Map<dynamic, dynamic> jsonData = data as Map<dynamic, dynamic>;

      print(jsonData);

      setState(() {
        rehabList = jsonData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Result> results = [];

    rehabList.forEach((date, timeMap) => {
          timeMap.forEach((time, sessionName) =>
              {results.add(Result(title: time, subtitle: date.toString()))}),
        });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0, left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rehab Programme",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 0, 85, 255),
                    Color.fromARGB(255, 68, 211, 255)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set rounded corner radius
                  // Make rounded corner of border
                ),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Knee Rehab",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        "Programme",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Mon, Thu, Sat",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const Text(
                        "3 Results / Day",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              5.0)), // Set rounded corner radius
                          // Make rounded corner of border
                        ),
                        height: 30,
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Left Shoulder",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Assigned By",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        "Jane doe",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "History",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Icon(Icons.filter_alt)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 229, 229, 229),
                  // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(2.0)), // Set rounded corner radius
                  // Make rounded corner of border
                ),
                height: 75,
                child: Container(
                    height: 100,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 170,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text(
                                  "Total Results",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                          'assets/images/dumbbell.png')),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "16",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          child: Container(color: Colors.black),
                        ),
                        Container(
                          width: 170,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text(
                                  "Total time",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                          'assets/images/deadline.png')),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "16",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                  children: results
                      .map((i) => ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              width: 40,
                              height: 40,
                            ),
                            title: Row(
                              children: [
                                Container(
                                    width: 14,
                                    height: 14,
                                    child:
                                        Image.asset('assets/images/clock.png')),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(i.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  i.subtitle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: const Text("View Results"),
                          ))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
