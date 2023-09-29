import 'package:flutter/material.dart';
import 'package:prim_sistem/models/all_lists.dart';

import '../../components/project_cards.dart';
import '../../models/user.dart';
import '../../project_paddings.dart';

class PerformansPage extends StatelessWidget {
  const PerformansPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<User> calisanlar = CalisanlarList().calisanlar;
    return Padding(
        padding: ProjectPaddings.mainHorizontalPadding +
            ProjectPaddings.midTopPadding * 2,
        child: ListView.builder(
            itemCount: calisanlar.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectEmployeCard(
                  //    index: index,
                  screenWidth: screenWidth,
                  user: calisanlar[index],
                ),
              );
            }));
  }
}


/*


 ProjectEmployeCard(
            index: 1,
            screenWidth: screenWidth,
            user: calisan,
          ),


          */