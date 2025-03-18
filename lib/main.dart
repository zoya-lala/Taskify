import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/blocs/task_bloc.dart';
import 'package:taskie/blocs/task_event.dart';
import 'package:taskie/repositories/task_repository.dart';
import 'package:taskie/screens/task_list_screen.dart';

void main() {
  final taskRepository = TaskRepository();

  runApp(MyApp(taskRepository: taskRepository));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;

  const MyApp({Key? key, required this.taskRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(taskRepository)..add(LoadTasks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        home: TaskListScreen(),
      ),
    );
  }
}
