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
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/student-info.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Body Content
          Container(
            margin: const EdgeInsets.only(top: 150),
            child: Center(
              child: Consumer<EnrollmentProvider>(
                builder: (context, provider, child) {
                  final student = provider.student;
                  final selectedCourses = provider.selectedCourses;

                  if (student == null || selectedCourses.isEmpty) {
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
                            boxShadow: const [
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

                              Text(
                                'Selected Courses:',
                                style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // List of selected courses
                              ...selectedCourses.map((course) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${course.title} (${course.id}) - ${course.units} units',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              )),
                              const SizedBox(height: 20),
                              // Confirm Button
                             ElevatedButton(
                                onPressed: () {
                                  provider.confirmEnrollment(); // Save student + courses
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Success'),
                                      content: const Text('Enrollment Successful!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
