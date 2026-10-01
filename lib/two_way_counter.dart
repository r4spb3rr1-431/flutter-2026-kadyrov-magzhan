import 'package:flutter/material.dart';

class TwoWayCounter extends StatefulWidget {
  const TwoWayCounter({super.key});

  @override
  State<TwoWayCounter> createState() => _TwoWayCounterState();
}

class _TwoWayCounterState extends State<TwoWayCounter> {
  int count = 0;
  bool isLoading = false;

  void increment() {
    setState(() {
      count = count + 1;
    });
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count = count - 1;
      });
    }
  }

  void saveCounter() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Сохранено!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: count == 0 ? null : () {
                decrement();
              },
              child: Text("-", style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: Text("+", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: isLoading ? null : () {
            saveCounter();
          },
          child: isLoading
              ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
              : Text("Сохранить"),
        ),
      ],
    );
  }
}