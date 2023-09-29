import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ProjectButton extends StatelessWidget {
  const ProjectButton({
    super.key,
    required this.onTap,
    required this.screenWidth,
    required this.text,
  });
  final String text;
  final double screenWidth;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ProjectColors.toryBlue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: screenWidth * 1.5,
        height: screenWidth * 0.15,
        child: Text(
          text,
          style: const TextStyle(
              color: ProjectColors.projectWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProjectMiniButton extends StatelessWidget {
  const ProjectMiniButton({
    super.key,
    required this.screenWidth,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final Function() onTap;
  final String text;
  final double screenWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        width: screenWidth * 0.4,
        height: screenWidth * 0.1,
        child: Text(
          text,
          style: const TextStyle(
              color: ProjectColors.projectWhite,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


/*


  Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: ProjectColors.toryBlue),
          color: ProjectColors.toryBlue,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: widget.screenWidth * 1.5,
        height: widget.screenWidth * 0.15,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 30,
          scrollController: FixedExtentScrollController(initialItem: 1),
          children: const [
            Text('Bıçakçılar'),
            Text('Kalyon'),
            //  Text('ahmetler'),
          ],
          onSelectedItemChanged: (value) {
            setState(() {
              //   _selectedValue = value;
            });
          },
        ),
      ),

 */

