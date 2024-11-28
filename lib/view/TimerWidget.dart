import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape:const CircleBorder(),
            child:const Icon(Icons.restart_alt_rounded),
            
            onPressed: (){}),
          FloatingActionButton.large(
            shape:const CircleBorder(),
            child:const Icon(Icons.play_arrow_sharp),
            onPressed: (){})
        ],
      )
      );
      
  }
}