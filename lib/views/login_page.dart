import 'package:flutter/material.dart';
import 'package:prim_sistem/assets/images.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/controllers/admin_page.dart';
import 'package:prim_sistem/views/register_page.dart';

import '../components/buttons.dart';
import '../components/project_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController textEditingController = TextEditingController();

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
              child: ProjectImages().mosLogo,
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "Kullanıcı Adı veya Email",
                keyboardType: TextInputType.emailAddress,
                //    icon: Icon(Icons.close),
              ),
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectTextW(
                hintText: "Şifre",
                keyboardType: TextInputType.emailAddress,
                //  icon: Icon(Icons.remove_red_eye),
              ),
            ),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: ProjectButton(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AdminPage()));
                },
                screenWidth: screenWidth,
                text: "GİRİŞ",
              ),
            ),
            const Padding(
              padding: ProjectPaddings.midTopPadding,
              child: Divider(
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: ProjectPaddings.midTopPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Kayıtlı Değil Misin? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "Kaydol",
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
