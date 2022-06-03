import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaclone/src/app.dart';
import 'package:instaclone/src/binding/init_bindings.dart';

void main() {
  runApp(const MyApp());
}

// git test
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      initialBinding: InitBinding(),
      home: const App(),
    );
  }
}

