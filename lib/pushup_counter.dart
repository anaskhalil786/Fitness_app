import 'package:flutter/material.dart';

class PushupCounter extends StatefulWidget {
  @override
  _PushupCounterState createState() => _PushupCounterState();
}

class _PushupCounterState extends State<PushupCounter> {
  int pushupCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pushup Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pushups Completed:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$pushupCount',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Increment the pushup count when the button is pressed.
                setState(() {
                  pushupCount++;
                });
              },
              child: Text('Add Pushup'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset the pushup count to 0.
                setState(() {
                  pushupCount = 0;
                });
              },
              child: Text('Reset Count'),
            ),
          ],
        ),
      ),
    );
  }
}
