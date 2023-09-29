import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/models/job_model.dart';
import 'package:prim_sistem/project_paddings.dart';

import '../../colors.dart';
import '../../components/project_cards.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SecondTask> {
  List<Task> tasks = [];
  @override
  Widget build(BuildContext context) {
    List taskRef = [];
    CollectionReference tasksRef =
        FirebaseFirestore.instance.collection("Tasks");
    double screenWidth = MediaQuery.of(context).size.width;

    void updateSuccess(String id) {
      setState(() {
        final selectedTask =
            FirebaseFirestore.instance.collection("Tasks").doc(id);
        //    print(selectedTask);
        selectedTask.update({"success": true});
      });
    }

    void updateUnSuccess(String id) {
      setState(() {
        print("iptal");
      });
    }

    // double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: tasksRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!.docs;
            //  final ids = tasksRef.doc();
            for (var element in snap) {
              //   var firebase = Firestore.instance.collection("board").document();
              //!userid statik o değişecek
              if (element["userId"] == 1 && element["success"] == false) {
                tasks.add(Task(
                    userId: element["userId"],
                    description: element["description"],
                    date: element["date"].toDate(),
                    company: element["company"],
                    exceptedTime: element["exceptedTime"].toDate(),
                    resultTime: element["resultTime"].toDate(),
                    success: element["success"]));
                taskRef.add(element.id);
                //print(taskRef);
                //tasksRef.add(element);
              }
            }
            return Padding(
              padding: ProjectPaddings.mainHorizontalPadding +
                  ProjectPaddings.midTopPadding * 2,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        color: ProjectColors.toryBlue,
                        //     height: 1,
                      ),
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return tasks.isEmpty
                        ? const Text("GÖREV KALMADI")
                        : ProjectTaskCard(
                            onTapOkey: () {
                              updateSuccess(taskRef[index]);
                            },
                            onTapCancel: () {
                              updateUnSuccess(taskRef[index]);
                            },
                            task: tasks[index],
                            screenWidth: screenWidth,
                          );
                  }),
            );
          } else {
            return const Text("Bekleyen Görev Bulunmuyor");
          }
        });
  }
}



/*
Padding(
      padding: ProjectPaddings.mainHorizontalPadding +
          ProjectPaddings.midTopPadding * 2,
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
                color: ProjectColors.toryBlue,
                //     height: 1,
              ),
          // padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return ProjectTaskCard(
              index: index,
              screenWidth: screenWidth,
            );
          }),
      //   color: Colors.amber,
    );
print
*/