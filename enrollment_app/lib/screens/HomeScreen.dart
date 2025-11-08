import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Enrollment App', style: GoogleFonts.manrope(
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/student-info'),
          child: Text('Start Enrollment', style: GoogleFonts.manrope(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ),
        ),
      ),
      
    );
  }
}