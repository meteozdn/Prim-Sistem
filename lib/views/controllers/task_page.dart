import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/project_paddings.dart';
import 'package:prim_sistem/views/adminPages/calisanlar_list_page.dart';
import 'package:prim_sistem/views/controllers/adminControllers/calisanlar_page.dart';
import 'package:prim_sistem/views/tasksPages/task1_page.dart';
import 'package:prim_sistem/views/tasksPages/task2_page.dart';
import 'package:prim_sistem/views/tasksPages/task3_page.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _selectedIndex = 0;
  List pages = const [FirstTask(), SecondTask(), ThirdTask()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2030),
                  builder: (context, child) => Theme(
                      data: ThemeData().copyWith(
                          colorScheme: const ColorScheme.light(
                              primary: ProjectColors.toryBlue)),
                      child: child!),
                );
                if (newDate == null) {
                  return;
                }
                setState(() {
                  _date = newDate;
                });
                //   print("object");
              },
              child: const Padding(
                padding: ProjectPaddings.mainHorizontalPadding,
                child: Icon(Icons.calendar_month_outlined),
              ),
            )
          ],
          centerTitle: false,
          // titleSpacing: 3,
          title: const Text("Görev"),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ProjectColors.projectWhite,
          unselectedItemColor: const Color.fromARGB(255, 197, 191, 191),
          onTap: _onItemTapped,
          backgroundColor: ProjectColors.toryBlue,
        ));
  }
}


/*
class ProjectBottomNavBar extends StatefulWidget {
  ProjectBottomNavBar({
    super.key,
  });

  @override
  State<ProjectBottomNavBar> createState() => _ProjectBottomNavBarState();
}

class _ProjectBottomNavBarState extends State<ProjectBottomNavBar> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ProjectColors.projectWhite,
      unselectedItemColor: Colors.grey,
      //  onTap: _onItemTapped,
      backgroundColor: ProjectColors.toryBlue,
    );
  }
}
*/