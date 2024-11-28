import 'package:clock_app/model/Arlarm.dart';
import 'package:flutter/material.dart';

class ArlarmWidget extends StatefulWidget {
  List<Arlarm> arlarm = [];
  ArlarmWidget({super.key, required this.arlarm});

  @override
  State<ArlarmWidget> createState() => _ArlarmWidgetState();
}

class _ArlarmWidgetState extends State<ArlarmWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), 
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.arlarm.elementAt(index).time=selectedTime.format(context);
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: listArlarmWidget(widget.arlarm),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectTime(context,widget.arlarm.length);
          widget.arlarm.add(Arlarm(selectedTime.format(context), true));
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
              MaterialButton(
                child: Text(
                arlarm.elementAt(index).time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
                onPressed: (){
                  _selectTime(context, index);
              }),
              
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
