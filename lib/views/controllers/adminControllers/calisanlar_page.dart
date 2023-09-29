import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/models/all_lists.dart';
import 'package:prim_sistem/views/adminPages/calisanlar_list_page.dart';
import 'package:prim_sistem/views/adminPages/performans.dart';

import '../../../models/user.dart';

class CalisanlarPage extends StatefulWidget {
  CalisanlarPage({super.key, this.selectedIndex = 0});
  int selectedIndex;

  @override
  State<CalisanlarPage> createState() => _CalisanlarPageState();
}

class _CalisanlarPageState extends State<CalisanlarPage> {
  //int selectedIndex = widget.selectedIndex;

  List pages = const [CalisanListPage(), PerformansPage()];
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  List<User> list = CalisanlarList().calisanlar;
  // DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 3,
          title: widget.selectedIndex == 0
              ? const Text("Çalışanlar")
              : const Text("Performanslar"),
        ),
        body: pages[widget.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Çalışanlar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Performans',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: ProjectColors.projectWhite,
          unselectedItemColor: const Color.fromARGB(255, 197, 191, 191),
          onTap: _onItemTapped,
          backgroundColor: ProjectColors.toryBlue,
        ));
  }
}
