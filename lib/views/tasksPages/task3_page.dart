import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/components/buttons.dart';
import 'package:prim_sistem/components/cup_pickers.dart';
import 'package:prim_sistem/components/project_text_field.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:flutter_picker/flutter_picker.dart';

class ThirdTask extends StatefulWidget {
  const ThirdTask({super.key});

  @override
  State<ThirdTask> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ThirdTask> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //  int _selectedValue = 0;

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
                  text: "Yonetici"),
            ),
            //  ProjectCupertinoDatePicker(screenWidth: screenWidth, text: "text"),
            Padding(
                padding: ProjectPaddings.midTopPadding,
                child: ProjectCupertinoDatePicker(
                  date: DateTime(200),
                  screenWidth: screenWidth,
                  text: 'Görev Geliş Saati',
                )),
            Padding(
                padding: ProjectPaddings.midTopPadding,
                child: ProjectCupertinoDatePicker(
                  date: DateTime(200),
                  screenWidth: screenWidth,
                  text: 'Görev Teslim Saati',
                )),

            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "İçerik",
                keyboardType: TextInputType.text,
                //       controller: textEditingController,

                //icon: Icon(Icons.abc)
              ),
            ),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectButton(
                screenWidth: screenWidth,
                text: "Gönder",
                onTap: () {
                  print("object");
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
