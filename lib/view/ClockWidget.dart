import 'dart:math';

import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Color clockColor;
    Random random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    clockColor = Color.fromARGB(255, r, g, b);
    String date = "${datetime.day}/${datetime.month}/${datetime.year}";
    String time =
        "${datetime.hour}:${datetime.minute < 10 ? "0${datetime.minute}" : datetime.minute}:${datetime.second}";
    return Scaffold(
        backgroundColor: Colors.grey[600],
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              datetime = DateTime.now();
              r = random.nextInt(255);
              g = random.nextInt(255);
              b = random.nextInt(255);
              clockColor = Color.fromARGB(255, r, g, b);
            });
          },
          label: const Text("Cập nhật"),
          backgroundColor: Colors.white,
          splashColor: Colors.blue,
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/anh.jpg"), fit: BoxFit.fitHeight),
          ),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_filled_sharp,
                size: 200,
                color: clockColor,
              ),
              Container(
                //transform: Matrix4.rotationZ(0.1),
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.pink, Colors.blue])),
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}
