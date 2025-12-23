import 'package:flutter/material.dart';
import 'package:pertemuan13/pages/task_provider.dart';
import 'package:pertemuan13/provider/task_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider To-Do',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TaskProvider(),
    );
  }
}
