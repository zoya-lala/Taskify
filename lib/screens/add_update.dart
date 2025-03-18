import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc.dart';
import '../blocs/task_event.dart';
import '../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  AddTaskScreen({this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task?.name ?? '');
    _detailsController =
        TextEditingController(text: widget.task?.details ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Task Name'),
                validator: (value) => value!.isEmpty ? 'Enter task name' : null,
              ),
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(labelText: 'Task Details'),
                validator: (value) =>
                    value!.isEmpty ? 'Enter task details' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = Task(
                      id: widget.task?.id,
                      name: _nameController.text,
                      details: _detailsController.text,
                      createdDate: DateTime.now(),
                      updatedDate: DateTime.now(),
                      isFavourite: widget.task?.isFavourite ?? false,
                    );
                    BlocProvider.of<TaskBloc>(context).add(
                        widget.task == null ? AddTask(task) : UpdateTask(task));
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
