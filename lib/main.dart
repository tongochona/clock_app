import 'package:clock_app/model/Arlarm.dart';
import 'package:clock_app/view/ClockWidget.dart';
import 'package:clock_app/view/TimerWidget.dart';
import 'package:clock_app/view/arlarmWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Đồng hồ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _tapIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Arlarm> arlarm = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(widget.title),
        foregroundColor: Colors.white,
      ),
      body: Container(
          child: getBodyWidget()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Báo thức"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled_sharp), label: "Đồng hồ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_bottom), label: "Hẹn giờ"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Bấm giờ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_individual_suite),
              label: "Giờ đi ngủ")
        ],
        currentIndex: _selectedIndex,
        onTap: _tapIndex,
      ),
    );
  }

  Widget getBodyWidget() {
    switch (_selectedIndex) {
      case 0:
        return ArlarmWidget(arlarm: arlarm);
      case 1:
        return const ClockWidget();
      case 2:
        return Container();
      case 3:
        return const TimerWidget();
      case 4:
        return Container();
      default:
        return Container();
    }
  }
}
