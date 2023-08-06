import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentAttendanceView extends StatefulWidget {
  const StudentAttendanceView({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceView> createState() => _StudentAttendanceViewState();
}

class _StudentAttendanceViewState extends State<StudentAttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              "Student Attendance",
              textStyle: GoogleFonts.openSans(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 5,
                    ),
                  ]),
              speed: const Duration(milliseconds: 200),
            ),
          ],
          repeatForever: true,
          isRepeatingAnimation: true,
        ),
      ),
      body: Row(
        children: [
          DataTable(columns: const [
            DataColumn(
              label: Text("hello"),
            )
          ], rows: [])
        ],
      ),
    );
  }
}
