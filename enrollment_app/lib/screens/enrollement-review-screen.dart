import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment-provider.dart';

class EnrollmentReviewScreen extends StatelessWidget {
  const EnrollmentReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Enrollment')),
      body: Consumer<EnrollmentProvider>(
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
          );
        },
      ),
    );
  }
}