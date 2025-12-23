import 'package:flutter/foundation.dart';

class Task {
  String name;
  bool isDone;

  Task({
    required this.name,
    this.isDone = false,
  });
}

/// PROVIDER
class TaskData extends ChangeNotifier {
  final List<Task> _tugas = [];

  List<Task> get tugas => _tugas;

  int get jumlahTugas => _tugas.length;

  void addTugas(String tugasBaru) {
    _tugas.add(Task(name: tugasBaru));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tugas[index].isDone = !_tugas[index].isDone;
    notifyListeners();
  }

  void removeTugas(int index) {
    _tugas.removeAt(index);
    notifyListeners();
  }
}
