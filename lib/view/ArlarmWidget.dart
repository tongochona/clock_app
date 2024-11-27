import 'package:clock_app/model/Arlarm.dart';
import 'package:flutter/material.dart';

class ArlarmWidget extends StatefulWidget {
  List<Arlarm> arlarm = [];
  ArlarmWidget({super.key, required this.arlarm});

  @override
  State<ArlarmWidget> createState() => _ArlarmWidgetState();
}

class _ArlarmWidgetState extends State<ArlarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: listArlarmWidget(widget.arlarm),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.arlarm.add(Arlarm("8:30 PM", false));
          });
        },
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget listArlarmWidget(List<Arlarm> arlarm) {
    return ListView(
        children: List.generate(
      arlarm.length,
      (index) => Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                arlarm.elementAt(index).time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Switch(
                value: arlarm.elementAt(index).isOn,
                onChanged: (bool value) {
                  setState(() {
                    arlarm.elementAt(index).isOn = value;
                  });
                },
                activeColor: Colors.blue,
              )
            ],
          )),
    ));
  }
}
