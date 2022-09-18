import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class StartStopTimer extends StatefulWidget {
  StartStopTimer(
      {super.key,
      required this.hours,
      required this.minutes,
      required this.seconds});

  int hours;
  int minutes;
  int seconds;

  @override
  _StartStopTimerState createState() => _StartStopTimerState();
}

class _StartStopTimerState extends State<StartStopTimer> {
  CountdownController countdownController = CountdownController(
      duration: Duration(
        hours: 10,
        minutes: 5,
        seconds: 10,
      ),
      onEnd: () {
        print('onEnd');
      });
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Countdown(
          countdownController: countdownController,
          builder: (_, Duration time) {
            return Text(
              'hours: ${time.inHours} minutes: ${time.inMinutes % 60} seconds: ${time.inSeconds % 60}',
              style: TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isRunning ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if (!countdownController.isRunning) {
            countdownController.start();
            setState(() {
              isRunning = true;
            });
          } else {
            countdownController.stop();
            setState(() {
              isRunning = false;
            });
          }
        },
      ),
    );
  }
}
