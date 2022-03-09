import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_list/db/StudentModel.dart';

class C extends GetxController {
  List<StudentModel> studentList = [];
  // Rx<List<StudentModel>> result = Rx([]);

  List<StudentModel> result = <StudentModel>[].obs;
  List<StudentModel> searchResult = [];
  // List<StudentModel> result1 = <StudentModel>[].obs;

  Future<void> addStudent(StudentModel value) async {
    //studentList.value.add(value);

    final studentDB = await Hive.openBox<StudentModel>('student');
    final id = await studentDB.add(value);
    value.id = id;
    studentList.add(value);

    // studentList.notifyListeners();
    value.save();

    update();
    getStudentList();
  }

  Future<void> getStudentList() async {
    final studentDB = await Hive.openBox<StudentModel>('student');
    studentList.clear();
    studentList.addAll(studentDB.values);
    result.clear();
    result.addAll(studentList);
    // searchResult.addAll(studentList);
    update();
    // print('result ..... ${result}');
    // studentList.notifyListeners();
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

  void filterList(String search) {
    if (search.isEmpty) {
      result.clear();
      result.addAll(studentList);
    } else {
      result.clear();
      searchResult = studentList
          .where((element) =>
              element.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
      //  print('--------------$result');
      // result.clear();
      result.addAll(searchResult);
      update();
    }
    // result.clear();
    // result = search.isEmpty
    //     ? studentList
    //     : studentList
    //         .where((element) =>
    //             element.name.toLowerCase().contains(search.toLowerCase()))
    //         .toList();
    // for (var item in result) {
    //   print('itemssssssssssss ${item.name}');
    // }
    // update();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   result.addAll(studentList);
  // }
}
