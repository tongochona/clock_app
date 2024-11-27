import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {

  String datetime = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        setState(() {
          datetime=DateTime.now().toString();
        });
      },
      label:const Text("Cập nhật"),
      backgroundColor: Colors.white,
      splashColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           const Icon(
            Icons.access_time_filled_sharp,
            size: 200,
            color: Colors.white,
            ),
            Text(datetime,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 50
            ),)
        ],
      )
    );
  }
}