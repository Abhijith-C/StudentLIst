import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_list/db/StudentModel.dart';

ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  //studentList.value.add(value);

  final studentDB = await Hive.openBox<StudentModel>('student');
  final id = await studentDB.add(value);
  value.id = id;
  studentList.value.add(value);

  studentList.notifyListeners();
  value.save();
}

Future<void> getStudentList() async {
  final studentDB = await Hive.openBox<StudentModel>('student');
  studentList.value.clear();
  studentList.value.addAll(studentDB.values);
  studentList.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student');
  await studentDB.delete(id);
  getStudentList();
}

Future<void> updateStudent(int id, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student');
  await studentDB.put(id, value);
  getStudentList();
}
