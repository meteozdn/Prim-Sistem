import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';

class ProjectTextW extends StatelessWidget {
  const ProjectTextW({
    super.key,

    // required this.controller,
    required this.hintText,
    required this.keyboardType,
  });
  final String hintText;
  final TextInputType keyboardType;
//  final TextEditingController controller;
  // final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.toryBlue)),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.toryBlue),
          )
          /*
          suffixIcon: GestureDetector(
            child: icon,
            onTap: () {
            //  print("object");
            },
          ) */
          ),
      keyboardType: keyboardType,
    );
  }
}
