import "package:flutter/material.dart";
import "package:provider_app/home_screen.dart";
import 'package:provider/provider.dart';
import "package:provider_app/provider/todo_provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
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
      title: 'Todo App',
      // theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: HomeScreen(),
    );
  }
}
