import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/models/job_model.dart';

import '../../colors.dart';
import '../../components/project_cards.dart';
import '../../models/user.dart';
import '../../project_paddings.dart';

class CalisanProfilPage extends StatefulWidget {
  const CalisanProfilPage({
    super.key,
    required this.calisan,
  });
  final User calisan;
  @override
  State<CalisanProfilPage> createState() => _CalisanProfilPageState();
}

class _CalisanProfilPageState extends State<CalisanProfilPage> {
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [];
    CollectionReference taskRef =
        FirebaseFirestore.instance.collection("Tasks");
    //List<Task> tasksUser = [];
    double screenWidth = MediaQuery.of(context).size.width;
    double screehnHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime(2019),
                lastDate: DateTime(2030),
                builder: (context, child) => Theme(
                    data: ThemeData().copyWith(
                        colorScheme: const ColorScheme.light(
                            primary: ProjectColors.toryBlue)),
                    child: child!),
              );
              if (newDate == null) {
                return;
              }
              setState(() {
                _date = newDate;
              });
            },
            child: const Padding(
              padding: ProjectPaddings.mainHorizontalPadding,
              child: Icon(Icons.calendar_month_outlined),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: ProjectPaddings.mainHorizontalPadding,
              child: Icon(Icons.sort),
            ),
          )
        ],
        centerTitle: false,
        title: Text(widget.calisan.userName),
      ),
      body: StreamBuilder(
        stream: taskRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!.docs;
            for (var element in snap) {
              if (element["userId"] == widget.calisan.userId) {
                tasks.add(Task(
                    userId: element["userId"],
                    description: element["description"],
                    date: element["date"].toDate(),
                    company: element["company"],
                    exceptedTime: element["exceptedTime"].toDate(),
                    resultTime: element["resultTime"].toDate(),
                    success: element["success"]));
              }
            }
            return BodyWidget(
              widget: widget,
              screenWidth: screenWidth,
              screehnHeight: screehnHeight,
              tasks: tasks,
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
    required this.widget,
    required this.screenWidth,
    required this.screehnHeight,
    required this.tasks,
  });

  final CalisanProfilPage widget;
  final double screenWidth;
  final double screehnHeight;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.mainHorizontalPadding +
          ProjectPaddings.midTopPadding * 2,
      child: Column(
        children: [
          PersonDataCard(
            calisan: widget.calisan,
            screenWidth: screenWidth,
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenWidth,
              height: screehnHeight / 1.8,
              child: JobStateCard(tasks: tasks),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.abc_outlined),
              onPressed: () async {
                // print(userList);
              })
          //    icon: Icon(Icons.abc))
        ],
      ),
    );
  }
}
