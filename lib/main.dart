

import 'package:campus_link_student/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromRGBO(213, 97, 132, 1),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home:   const TeacherDetails  (),

    );
  }
}
//import 'package:firebase_auth/firebase_auth.dart';
