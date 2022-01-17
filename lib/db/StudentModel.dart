class StudentModel {
  final String name;
  final String age;
  final String clas;
  final String address;
  final String image;
  final int? id;

  StudentModel(
      {required this.name,
      required this.age,
      required this.clas,
      required this.address,
      required this.image,
      this.id});
}
