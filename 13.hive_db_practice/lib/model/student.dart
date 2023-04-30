import "package:hive_flutter/hive_flutter.dart";

part "student.g.dart";

@HiveType(typeId : 1)
class Student {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  Student({
    required this.name;
    required this.age;
  });

  @override
  String toString() {
    return "Student(name : $name, age : $age)";
  }
}