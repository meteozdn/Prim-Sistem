import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/controllers/admin_page.dart';
import 'package:prim_sistem/views/controllers/task_page.dart';
import 'package:prim_sistem/views/register_page.dart';

import '../components/buttons.dart';
import '../components/project_text_field.dart';

class AyarlarPage extends StatelessWidget {
  const AyarlarPage({super.key});

  @override
  Widget build(BuildContext context) {
    //! CihazBoyutları
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    //  bool isDesktop(BuildContext context) =>
    //    MediaQuery.of(context).size.width >= 600;
    // bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 600;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Ayarlar"),
          //backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          color: ProjectColors.projectRed,
        ));
  }
}
