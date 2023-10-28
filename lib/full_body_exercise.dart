import 'package:flutter/material.dart';

class FullBodyExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Body Exercises'),
      ),
      body: ExerciseList(),
    );
  }
}

class ExerciseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExerciseCard(
          exerciseName: 'Push-ups',
          description: 'A great full-body workout that targets chest, arms, and core.',
        ),
        ExerciseCard(
          exerciseName: 'Squats',
          description: 'Works your legs, glutes, and core. A fundamental exercise.',
        ),
        ExerciseCard(
          exerciseName: 'Burpees',
          description: 'An intense exercise that engages multiple muscle groups.',
        ),
        // Add more exercises here...
      ],
    );
  }
}

class ExerciseCard extends StatefulWidget {
  final String exerciseName;
  final String description;

  ExerciseCard({required this.exerciseName, required this.description});

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  bool isExerciseInProgress = false;
  Stopwatch stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.exerciseName),
            subtitle: Text(widget.description),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  if (!isExerciseInProgress) {
                    // Start the stopwatch when "Start" is pressed.
                    stopwatch.start();
                  } else {
                    // Stop the stopwatch when "Stop" is pressed.
                    stopwatch.stop();
                  }
                  setState(() {
                    isExerciseInProgress = !isExerciseInProgress;
                  });
                },
                child: Text(isExerciseInProgress ? 'Stop' : 'Start'),
              ),
            ],
          ),
          Text(
            'Time Elapsed: ${stopwatch.elapsed.inSeconds} seconds',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
