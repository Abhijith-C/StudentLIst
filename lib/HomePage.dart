import 'package:flutter/material.dart';
import 'package:student_list/AddStudent.dart';
import 'package:student_list/StudentInfo.dart';
import 'package:student_list/db/database/database.dart';

import 'db/StudentModel.dart';

class HomePage extends StatelessWidget {
  final _searchController = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        decoration: BoxDecoration(
            color: Colors.blue[100], borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          onChanged: (value) {
            print(value);
          },
          controller: _searchController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15), hintText: 'Search'),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ValueListenableBuilder(
          valueListenable: studentList,
          builder: (BuildContext ctx, List<StudentModel> newStudentList,
              Widget? child) {
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = newStudentList[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => StudentInfo(name: data.name))),
                    title: Text(data.name),
                    leading: CircleAvatar(
                      radius: 60,
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => Divider(),
                itemCount: newStudentList.length);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddStudent()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
