import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/ayarlar_page.dart';
import 'package:prim_sistem/views/controllers/adminControllers/calisanlar_page.dart';
import 'package:prim_sistem/views/dagitilan_prim_page.dart';
import 'package:prim_sistem/views/degerlendirme_page.dart';
import 'package:prim_sistem/views/login_page.dart';
import 'package:prim_sistem/views/controllers/task_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List testList = [
    ["Çalışanlar", Icons.person, CalisanlarPage()],
    const ["Çalışan\nDeğerlendirme", Icons.check, DegerlendirmePage()],
    [
      "Performans\nTablosu",
      Icons.bar_chart,
      CalisanlarPage(
        selectedIndex: 1,
      )
    ],
    ["Dağıtılan\nPrim", Icons.money, DagitilanPrimPage()],
    const ["Ayarlar", Icons.settings, AyarlarPage()],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
      ),
      body: Padding(
        padding: ProjectPaddings.mainHorizontalPadding +
            ProjectPaddings.midTopPadding * 2,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: testList.length,
            itemBuilder: (BuildContext ctx, index) {
              return AdminPageButton(
                txt: testList[index][0],
                icon: testList[index][1],
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => testList[index][2]));
                },
              );
            }),
      ),
    );
  }
}

class AdminPageButton extends StatelessWidget {
  const AdminPageButton({
    super.key,
    required this.txt,
    required this.icon,
    this.onPress,
  });
  final String txt;
  final IconData icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ProjectColors.toryBlue,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: ProjectPaddings.smallVerticalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 50,
                color: ProjectColors.projectWhite,
              ),
              Text(
                txt,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ProjectColors.aliceBlue),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
