import 'package:flutter/material.dart';

import 'full_body_exercise.dart'; // Import the Full Body Exercise screen
import 'pushup_counter.dart'; // Import the Pushup Counter screen

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WorkoutTracker(),
        '/fullBodyExercise': (context) =>
            FullBodyExercise(), // Add the Full Body Exercise screen
        '/pushupCounter': (context) =>
            PushupCounter(), // Add the Pushup Counter screen
      },
    );
  }
}

class WorkoutTracker extends StatefulWidget {
  @override
  _WorkoutTrackerState createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> {
  List<String> workouts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracker'),
      ),
      body: Column(
        children: [
          Image.network(
            'https://i.pinimg.com/originals/82/7b/3b/827b3bfcc8bc92d96e208a25592186b1.jpg', // Replace with your image URL
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(workouts[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _logWorkout();
              },
              child: Text('Log Workout'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _navigateToFullBodyExercise(
                    context); // Navigate to Full Body Exercise
              },
              child: Text('Full Body Exercise'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _navigateToPushupCounter(context); // Navigate to Pushup Counter
              },
              child: Text('Pushup Counter'),
            ),
          ),
        ],
      ),
    );
  }

  void _logWorkout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final workoutController = TextEditingController();
        return AlertDialog(
          title: Text('Log a Workout'),
          content: TextField(
            controller: workoutController,
            decoration: InputDecoration(labelText: 'Workout Name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  workouts.add(workoutController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Log'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToFullBodyExercise(BuildContext context) {
    Navigator.pushNamed(
        context, '/fullBodyExercise'); // Navigate to Full Body Exercise screen
  }

  void _navigateToPushupCounter(BuildContext context) {
    Navigator.pushNamed(
        context, '/pushupCounter'); // Navigate to Pushup Counter screen
  }
}
