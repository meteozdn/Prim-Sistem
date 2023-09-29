import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prim_sistem/models/all_lists.dart';

import '../assets/images.dart';
import '../colors.dart';
import '../models/job_model.dart';
import '../models/user.dart';
import 'buttons.dart';

class ProjectTaskCard extends StatelessWidget {
  const ProjectTaskCard({
    super.key,
    required this.screenWidth,
    //required this.index,
    required this.task,
    required this.onTapOkey,
    required this.onTapCancel,
  });
  final Function() onTapOkey;
  final Function() onTapCancel;

  final Task task;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return cardBuilder(task);
  }

  Column cardBuilder(Task task) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ProjectColors.toryBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          width: screenWidth * 1.5,
          height: screenWidth * 0.15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    task.company,
                    style: const TextStyle(
                        color: ProjectColors.projectWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${task.date.day}/${task.date.month}/${task.date.year}\n ${task.date.hour}:${task.date.minute}",
                        style:
                            const TextStyle(color: ProjectColors.projectWhite),
                        textAlign: TextAlign.right)
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: screenWidth / 3,
          width: screenWidth,
          //  color: ProjectColors.projectGrey,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: ProjectColors.toryBlue, width: 3),
              left: BorderSide(color: ProjectColors.toryBlue, width: 3),
              bottom: BorderSide(color: ProjectColors.toryBlue, width: 3),
            ),
            // borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Text(task.description),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectMiniButton(
                        color: ProjectColors.toryBlue,
                        screenWidth: screenWidth,
                        text: "TAMAMLA",
                        onTap: onTapOkey,
                      ),
                      ProjectMiniButton(
                        screenWidth: screenWidth,
                        text: "İPTAL",
                        color: ProjectColors.projectRed, onTap: onTapCancel,
                        //    onPressed: onTap[1],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProjectEmployeCard extends StatelessWidget {
  const ProjectEmployeCard({
    super.key,
    required this.screenWidth,
    // required this.index,
    required this.user,
  });
  // final int index;
  final User user;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ProjectColors.toryBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          width: screenWidth * 1.5,
          height: screenWidth * 0.12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    user.name,
                    style: const TextStyle(
                        color: ProjectColors.projectWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("11.12.2011\n11.13.2011",
                        style: TextStyle(color: ProjectColors.projectWhite),
                        textAlign: TextAlign.right)
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: screenWidth / 4.5,
          width: screenWidth,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: ProjectColors.toryBlue, width: 3),
              left: BorderSide(color: ProjectColors.toryBlue, width: 3),
              bottom: BorderSide(color: ProjectColors.toryBlue, width: 3),
            ),
            // borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK1",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%90",
                      style: TextStyle(
                          color: ProjectColors.projectGreen,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK2",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK3",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const VerticalDivider(
                  width: 0.5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Toplam",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PersonDataCard extends StatelessWidget {
  const PersonDataCard({
    super.key,
    required this.screenWidth,
    required this.calisan,
  });
  final User calisan;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: ProjectColors.toryBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          width: screenWidth * 1.5,
          height: screenWidth * 0.12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "${calisan.name} ${calisan.surname}",
                    style: const TextStyle(
                        color: ProjectColors.projectWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${DateTime.now().month}/${DateTime.now().year}",
                        style:
                            const TextStyle(color: ProjectColors.projectWhite),
                        textAlign: TextAlign.right)
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: screenWidth / 4.5,
          width: screenWidth,
          //  color: ProjectColors.projectGrey,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: ProjectColors.toryBlue, width: 3),
              left: BorderSide(color: ProjectColors.toryBlue, width: 3),
              bottom: BorderSide(color: ProjectColors.toryBlue, width: 3),
            ),
            // borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK1",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%90",
                      style: TextStyle(
                          color: ProjectColors.projectGreen,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK2",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TASK3",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const VerticalDivider(
                  width: 0.5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Toplam",
                      style: TextStyle(
                          color: ProjectColors.toryBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("11/13"),
                    Text(
                      "%30",
                      style: TextStyle(
                          color: ProjectColors.projectRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]

              /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProjectMiniButton(
                        color: ProjectColors.toryBlue,
                        screenWidth: screenWidth,
                        text: "TAMAMLA"),
                    ProjectMiniButton(
                      screenWidth: screenWidth,
                      text: "İPTAL",
                      color: ProjectColors.projectRed,
                    ),
                  ],
                ),
                */
              ,
            ),
          ),
        )
      ],
    );
  }
}

class JobStateCard extends StatelessWidget {
  JobStateCard({
    super.key,
    //this.difference = 0,
    required this.tasks,
  });

  final List<Task> tasks;
  int daysBetween(DateTime from, DateTime to) {
    //   print(from);
    //  print(to);
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inMinutes);
  }

  @override
  Widget build(BuildContext context) {
    // List<Task> tasks = IslerList().isler;

    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          Duration dif =
              tasks[index].resultTime.difference(tasks[index].exceptedTime);
          // print(tasks[index].resultTime);
          // print(tasks[index].exceptedTime);
          return Column(
            children: [
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.end,
                //expandedAlignment: Alignment.center,
                //collapsedTextColor: ProjectColors.toryBlue,
                textColor: ProjectColors.toryBlue,
                childrenPadding: const EdgeInsets.all(10),
                trailing: Text(
                  tasks[index].success ? "Başarılı" : "Başarısız",
                  style: TextStyle(
                      color: tasks[index].success
                          ? ProjectColors.projectGreen
                          : ProjectColors.projectRed,
                      fontSize: 15),
                ),
                title: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: tasks[index].company == "kalyon"
                              ? ProjectImages().kalyonlogo
                              : ProjectImages().bicakcilarLogo),
                      const VerticalDivider(),
                      Text(tasks[index].company.toUpperCase()),
                    ],
                  ),
                ),
                subtitle: Text(
                    "${tasks[index].date.day}/${tasks[index].date.month}/${tasks[index].date.year}"),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical, //.horizontal
                          child: Text(
                            tasks[index].description,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Beklenen:30",
                          ),
                          Text("Sonuç:${dif.inMinutes}",
                              style: TextStyle(
                                color: dif.inMinutes < 30
                                    ? ProjectColors.projectGreen
                                    : ProjectColors.projectRed,
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Divider()
            ],
          );
        });
  }
}
