import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app_complete/models/exercise.dart';

class Workout extends Equatable {
  final String? title;
  final List<Exercise> exercises;
  const Workout({required this.title, required this.exercises});

  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = [];
    int index = 0;
    int startTime = 0;

    for (var ex in (json['exercises'] as Iterable)) {
      exercises.add(Exercise.fromJson(ex, index, startTime));
      index++;
      print('...$index...');
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }
  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};

  @override
  // TODO: implement props
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
