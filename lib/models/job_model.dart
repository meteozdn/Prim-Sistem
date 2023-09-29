import 'package:prim_sistem/models/user.dart';

//import 'job_model.dart';

class Task {
  bool success;
  final int userId;
  final String description, company;
  final DateTime date;
  final DateTime exceptedTime;
  final DateTime resultTime;
  // final Comp company;

  Task({
    this.success = false,
    required this.userId,
    // required this.user,
    required this.description,
    required this.date,
    required this.company,
    required this.exceptedTime,
    required this.resultTime,
  });
}

class Comp {
  static String bicakcilar = "Bıçakçılar";
  static String s = "Bıçakçılar";
}
