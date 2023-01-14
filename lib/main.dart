import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workouts_cubit.dart';
import 'package:flutter_bloc_app_complete/models/workout.dart';
import 'package:flutter_bloc_app_complete/screens/home_page.dart';

void main() => runApp(WorkoutTime());

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
          primaryColor: Colors.blueGrey,
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(100, 89, 0, 78)))),
      //inject the cubit
      home: BlocProvider<WorkoutsCubit>(create: (BuildContext context) {
        WorkoutsCubit workoutsCubit = WorkoutsCubit();
        if (workoutsCubit.state.isEmpty) {
          print("loading json since the state is empty");
          workoutsCubit.getWorkouts();
        } else {
          print("the state is not empty");
        }
        return workoutsCubit;
      }, child: BlocBuilder<WorkoutsCubit, List<Workout>>(
        builder: (context, state) {
          return const HomePage();
        },
      )),
    );
  }
}
