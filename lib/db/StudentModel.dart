class StudentModel {
  final String name;
  final String age;
  final String clas;
  final String address;
  final int? id;

  StudentModel(
      {required this.name,
      required this.age,
      required this.clas,
      required this.address,
      this.id});
}
