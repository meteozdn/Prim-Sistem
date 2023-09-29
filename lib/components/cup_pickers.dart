import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../colors.dart';

class ProjectCupertinoDatePicker extends StatefulWidget {
  ProjectCupertinoDatePicker({
    super.key,
    required this.date,
    required this.screenWidth,
    required this.text,
  });
  //Cupertinocontroller
  DateTime date;

  String text;
  final double screenWidth;

  @override
  State<ProjectCupertinoDatePicker> createState() =>
      _ProjectCupertinoDatePickerState();
}

class _ProjectCupertinoDatePickerState
    extends State<ProjectCupertinoDatePicker> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //   DateTime date;

    //  String text = "";

    return GestureDetector(
      onTap: () {
        setState(() {
          showCupertinoModalPopup(
              builder: (BuildContext context) => (CupertinoActionSheet(
                    actions: [cupPicker()],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text("CANCEL",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ProjectColors.toryBlue)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )),
              context: context);
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: ProjectColors.toryBlue),
          color: ProjectColors.projectGrey,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: widget.screenWidth * 1.5,
        height: widget.screenWidth * 0.15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    // color: ProjectColors.projectWhite,
                    fontSize: 16,
                    //  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "${currentDate.hour}:${currentDate.minute} ",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: ProjectColors.toryBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox cupPicker() {
    return SizedBox(
      height: widget.screenWidth * 0.5,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        use24hFormat: true,
        initialDateTime: currentDate,
        onDateTimeChanged: (DateTime value) {
          setState(() {
            currentDate = value;
            widget.date = value;
          });
        },
      ),
    );
  }
}

class ProjectCupertinoPicker extends StatefulWidget {
  ProjectCupertinoPicker({
    super.key,
    required this.screenWidth,
    required this.text,
  });
  String text;
  final double screenWidth;

  @override
  State<ProjectCupertinoPicker> createState() => _ProjectCupertinoPickerState();
}

class _ProjectCupertinoPickerState extends State<ProjectCupertinoPicker> {
  //int _selectedValue = 0;
  List<String> firmalar = ["b1", "b2", "diğer"];

  @override
  Widget build(BuildContext context) {
    //  String text = "";

    return GestureDetector(
      onTap: () {
        setState(() {
          showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                    actions: [cupPicker()],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text("CANCEL",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ProjectColors.toryBlue)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ));
          // widget.text = "aaa";
        });
      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: ProjectColors.toryBlue),
          color: ProjectColors.projectGrey,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: widget.screenWidth * 1.5,
        height: widget.screenWidth * 0.15,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  // color: ProjectColors.projectWhite,
                  fontSize: 16,
                  //  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: ProjectColors.toryBlue,
              ),
              //  CupPicker()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox cupPicker() {
    return SizedBox(
      height: widget.screenWidth * 0.5,
      child: CupertinoPicker(
          useMagnifier: true,
          magnification: 1.2,
          itemExtent: 25,
          onSelectedItemChanged: (index) {
            setState(() {
              widget.text = firmalar[index];
              //  _selectedValue = index;
            });
          },
          children:
              List.generate(firmalar.length, (index) => Text(firmalar[index]))),
    );
  }
}
