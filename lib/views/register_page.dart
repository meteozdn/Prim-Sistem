import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/controllers/task_page.dart';
import 'package:prim_sistem/views/login_page.dart';

import '../components/buttons.dart';
import '../components/project_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

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
        toolbarHeight: 30,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: ProjectPaddings.mainHorizontalPadding,
        child: Column(
          children: [
            //ImageKullanımı
            SizedBox(
              width: screenWidth / 2,
              //  height: 300,
              child: const Image(image: AssetImage('lib/assets/xx.png')),
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "İsim Soyisim",
                keyboardType: TextInputType.emailAddress,
                //   icon: Icon(Icons.close),
              ),
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "name@mosyzilim.com",
                keyboardType: TextInputType.emailAddress,
                //  icon: Icon(Icons.remove_red_eye),
              ),
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "Şifre ",
                keyboardType: TextInputType.text,

                //  icon: Icon(Icons.close),
              ),
            ),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectButton(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TasksPage()));
                },
                screenWidth: screenWidth,
                text: "Kayıt Ol",
              ),
            ),
            const Padding(
              padding: ProjectPaddings.smallTopPadding,
              child: Divider(
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: ProjectPaddings.smallTopPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Zaten Kayıtlı Mısın? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop;
                      },
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(
                            color: ProjectColors.toryBlue,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
