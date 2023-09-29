import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/components/buttons.dart';
import 'package:prim_sistem/components/cup_pickers.dart';
import 'package:prim_sistem/components/project_text_field.dart';

import 'package:prim_sistem/project_paddings.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstTask> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('Users');

  final int userId = 1;
  late final String description;
  late final String company;
  //late final DateTime date;
  late final DateTime ecceptedTime;
  late final DateTime resultTime;
  late final bool success;

  // DateTime aa;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //  int _selectedValue = 0;
    TextEditingController textEditingController = TextEditingController();
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      // color: ProjectColors.tulipTree,
      child: Padding(
        padding: ProjectPaddings.mainHorizontalPadding +
            ProjectPaddings.midTopPadding,
        child: Column(
          children: [
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectCupertinoPicker(
                  //Birim->FİRMA
                  screenWidth: screenWidth,
                  text: "Firma"),
            ),
            //  ProjectCupertinoDatePicker(screenWidth: screenWidth, text: "text"),
            Padding(
                padding: ProjectPaddings.midTopPadding,
                child: ProjectCupertinoDatePicker(
                  date: date,
                  screenWidth: screenWidth,
                  text: 'Talep Geliş Saati',
                )),
            Padding(
                padding: ProjectPaddings.midTopPadding,
                child: ProjectCupertinoDatePicker(
                  date: DateTime(200),
                  screenWidth: screenWidth,
                  text: 'Talep Yanıt Saati',
                )),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "İçerik",
                keyboardType: TextInputType.text,
                //   controller: textEditingController,
              ),
            ),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectButton(
                screenWidth: screenWidth,
                text: "Gönder",
                onTap: () {
                  setState(() {
                    print(textEditingController.text);
                  });
                },
              ),
            ),

            //  CupertinoButton.filled(child: child, onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
