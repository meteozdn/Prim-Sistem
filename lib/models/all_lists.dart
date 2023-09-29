import 'package:prim_sistem/models/user.dart';

import 'job_model.dart';

class IslerList {
  List<Task> isler = List.generate(
      15,
      (index) => Task(
          userId: index % 5,
          description: "description $index",
          date: DateTime.now(),
          company: Comp.bicakcilar,
          exceptedTime: DateTime.now(),
          resultTime: DateTime.now()));
  //var a = isler.add(");
}

class CalisanlarList {
  List<User> calisanlar = List.generate(
      5,
      (index) => User(
          userId: index,
          name: "name $index",
          surname: "surname $index",
          sifre: "sifre $index",
          userName: "userName $index",
          type: false));
  void ekle() {
    calisanlar.add(User(
        userId: 10,
        name: "xx",
        surname: "yy",
        sifre: "sifre",
        userName: "userName",
        type: false));
  }
}
