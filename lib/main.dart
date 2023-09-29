import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prim_sistem/colors.dart';
import 'package:prim_sistem/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginPage(),
        theme: ThemeData(
            // iconTheme: const IconThemeData(color: ProjectColors.toryBlue),
            //TextField
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: ProjectColors.projectGrey,
              focusedBorder: OutlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                width: 3,
                color: ProjectColors.toryBlue,
              )),
              border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                width: 3,
                color: ProjectColors.toryBlue,
              )),
            ),
            primaryColor: ProjectColors.toryBlue,
            // Define the default brightness and colors.
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
                color: ProjectColors.toryBlue,
                titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  // color: ProjectColors.tulipTree,
                ))));
  }
}
