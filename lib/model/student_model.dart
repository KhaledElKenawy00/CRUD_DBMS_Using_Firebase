class StudentModel {
  final String name;
  final String id;
  final String Gpa;
  final String fuclty;

  StudentModel(
      {required this.name,
      required this.id,
      required this.Gpa,
      required this.fuclty});

  factory StudentModel.fromJson(jsonData) {
    return StudentModel(
        name: jsonData['name'],
        id: jsonData['id'],
        Gpa: jsonData['Gpa'],
        fuclty: jsonData['fuclty']);
  }
  toJson() {
    return {'name': name, 'id': id, 'Gpa': Gpa, 'fuclty': fuclty};
  }
}
