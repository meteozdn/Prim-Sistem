import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/models/all_lists.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/adminPages/calisan_view.dart';

import '../../models/user.dart';

class CalisanListPage extends StatelessWidget {
  const CalisanListPage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection("Users");

    //double screenWidth = MediaQuery.of(context).size.width;
    List<User> calisanlar = [];
    return Padding(
        padding: ProjectPaddings.mainHorizontalPadding +
            ProjectPaddings.midTopPadding * 2,
        child: StreamBuilder(
            stream: usersRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final snap = snapshot.data!.docs;
//!Her bir element User!
                for (var element in snap) {
                  calisanlar.add(User(
                      userId: element["userId"],
                      name: element["name"],
                      surname: element["surname"],
                      sifre: element["password"],
                      userName: element["userName"],
                      type: false));
                  //  print(element["surname"]);
                }
                //    print(calisanlar.length);
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snap.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          index == 0
                              ? const Divider(
                                  height: 0,
                                )
                              : const Divider(),
                          GestureDetector(
                            onTap: () {
                              //!user model oluştur bunu buttona ver
                              // print("object");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CalisanProfilPage(
                                  calisan: calisanlar[index],
                                );
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ProjectColors.projectGrey,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 60,
                              //color: ProjectColors.projectGrey,
                              child: Center(
                                  child: Text(
                                snap[index]["name"],
                                style: const TextStyle(
                                    color: ProjectColors.toryBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                return const SizedBox();
              }
            }));
  }
}
/*

ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: calisanlar.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    index == 0
                        ? const Divider(
                            height: 0,
                          )
                        : const Divider(),
                    GestureDetector(
                      onTap: () {
                        // print("object");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CalisanProfilPage(
                            calisantest: calisanlar[index],
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ProjectColors.projectGrey,
                            borderRadius: BorderRadius.circular(5)),
                        height: 60,
                        //color: ProjectColors.projectGrey,
                        child: Center(
                            child: Text(
                          calisanlar[index].name,
                          style: const TextStyle(
                              color: ProjectColors.toryBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                );
              })
              */