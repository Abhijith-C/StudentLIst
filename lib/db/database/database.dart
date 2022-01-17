import 'package:flutter/cupertino.dart';
import 'package:student_list/db/StudentModel.dart';

ValueNotifier<List<StudentModel>> studentList = ValueNotifier([]);

void addStudent(StudentModel value) {
  studentList.value.add(value);
  studentList.notifyListeners();
}
