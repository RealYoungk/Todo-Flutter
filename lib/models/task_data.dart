import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: '우유사기'),
    Task(name: '계란사기'),
    Task(name: '빵사기'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    _tasks.add(
      Task(
        name: newTaskTitle,
      ),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    for (Task nowTask in _tasks) {
      if (nowTask == task) {
        _tasks.remove(nowTask);
        break;
      }
    }
    notifyListeners();
  }

  void removeAll() {
    _tasks.clear();
    notifyListeners();
  }
}
