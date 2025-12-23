import 'package:flutter/material.dart';
import 'package:pertemuan13/provider/task_data.dart';
import 'package:provider/provider.dart';

class TaskProvider extends StatelessWidget {
  const TaskProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 242, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 157, 14),
        title: Text(
          'Provider To-Do (${context.watch<TaskData>().jumlahTugas})',
        ),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemCount: taskData.tugas.length,
            itemBuilder: (context, index) {
              final task = taskData.tugas[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    task.name,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (_) {
                      taskData.toggleTask(index);
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      taskData.removeTugas(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Diubah menjadi hijau tua agar sama dengan AppBar
        backgroundColor: const Color.fromARGB(255, 14, 157, 14),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (_) => const AddTaskSheet(),
          );
        },
      ),
    );
  }
}

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tambah Tugas',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<TaskData>().addTugas(controller.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}