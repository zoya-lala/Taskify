import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;
  TaskBloc(this.repository) : super(TaskLoading()) {
    on<LoadTasks>((event, emit) async {
      try {
        final tasks = await repository.fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    on<AddTask>((event, emit) async {
      try {
        await repository.addOrUpdateTask(event.task);
        final tasks = await repository.fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    on<UpdateTask>((event, emit) async {
      try {
        await repository.addOrUpdateTask(event.task);
        final tasks = await repository.fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
  }
}
