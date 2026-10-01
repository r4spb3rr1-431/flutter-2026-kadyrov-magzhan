import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchCard extends StatefulWidget {
  const StopwatchCard({super.key});

  @override
  State<StopwatchCard> createState() => _StopwatchCardState();
}

class _StopwatchCardState extends State<StopwatchCard> {
  int seconds = 0;
  Timer? timer;

  String formatTime(int totalSeconds) {
    int min = (totalSeconds / 60).floor();
    int sec = totalSeconds % 60;

    String minStr = min.toString();
    String secStr = sec.toString();

    if (min < 10) {
      minStr = "0" + minStr;
    }
    if (sec < 10) {
      secStr = "0" + secStr;
    }

    return "$minStr:$secStr";
  }

  void startTimer() {
    if (timer == null) {
      timer = Timer.periodic(Duration(seconds: 1), (t) {
        setState(() {
          seconds = seconds + 1;
        });
      });
    }
  }

  // Пауза / стоп
  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      seconds = 0;
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formatTime(seconds),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                  },
                  child: Text("Старт"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    stopTimer();
                  },
                  child: Text("Стоп"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text("Сброс"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}