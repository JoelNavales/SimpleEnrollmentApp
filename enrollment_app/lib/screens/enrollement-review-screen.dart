import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment-provider.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollmentReviewScreen extends StatelessWidget {
  const EnrollmentReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 16,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Back',
            style: GoogleFonts.manrope(
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        titleTextStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/student-info.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
      Container(
        margin: const EdgeInsets.only(top: 150),
        child: Center(
          child: Consumer<EnrollmentProvider>(
            builder: (context, provider, child) {
              final student = provider.student;
              final course = provider.selectedCourse;
              if (student == null || course == null) {
                return const Center(child: Text('Error: Missing data'));
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Student: ${student.firstName} ${student.lastName}'),
                          Text('Email: ${student.email}'),
                          Text('ID: ${student.studentId}'),
                          const SizedBox(height: 20),
                          Text('Course: ${course.title} (${course.id})'),
                          Text('Credits: ${course.credits}'),
                          Text('Instructor: ${course.instructor}'),
                          const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Show success dialog
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Success'),
                                      content: const Text('Enrollment Successful!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();  // Close dialog
                                            provider.clearEnrollment();  // Clear state
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/',
                                              (route) => false,  // Back to intro, clear stack
                                            );
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Confirm Enrollment'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
            },
          ),
        ),
      ),
        ],
      ),
    );
  }
}