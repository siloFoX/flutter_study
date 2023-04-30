import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "package:hive_db_practice/model/student.dart";


void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Student>(StudentAdapter());

  // final box = await Hive.openBox<String>("student_name");
  final box = await Hive.openBox<Student>("student_class_table");

  final student = Student(name : "Silofox", age : "20");

  // box.add("string type sample");
  box.add(student);

  print(box.toMap());

  runApp(
    MaterialApp(
      home : Scaffold(),
    ),
  );
}