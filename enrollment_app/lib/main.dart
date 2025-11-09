import 'package:enrollment_app/models/course.dart';
import 'package:enrollment_app/screens/course-selection-screen.dart';
import 'package:enrollment_app/screens/enrollement-review-screen.dart';
import 'package:enrollment_app/screens/student-info-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/enrollment-provider.dart';
import 'screens/HomeScreen.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnrollmentProvider(),  // Global state
      child: MaterialApp(
        title: 'Course Enrollment App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/student-info': (context) => const StudentInfoScreen(),
          '/course-selection': (context) => CourseSelectionScreen(),
          '/enrollment-review': (context) => const EnrollmentReviewScreen(),
        },
      ),
    );
  }
}