import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment-provider.dart';
import '../models/course.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseSelectionScreen extends StatelessWidget {
  CourseSelectionScreen({super.key});

  final List<Course> courses = [
    Course(id: 'SPELEC1b', title: 'Mobile Development 1', units: 3, instructor: 'Sir Ahdzleebee Formentera'),
    Course(id: 'IM2001', title: 'Information Management 1', units: 3, instructor: 'Sir Gene Abello'),
    Course(id: 'SPELEC1a', title: 'Web Application Development 1', units: 3, instructor: 'Sir Roderick Bandalan'),
    Course(id: 'NET2003', title: 'Networking 2', units: 3, instructor: 'Sir Vincent Patalita III'),
    Course(id: 'TECHNO302', title: 'Technoprenuership', units: 3, instructor: 'Sir Arthur James Aliazon'),
  ];

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
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
            child: Consumer<EnrollmentProvider>(
              builder: (context, provider, child) {
                final selectedCourses = provider.selectedCourses;

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    final isSelected = selectedCourses.contains(course);

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? Colors.blue.shade50 : Colors.white,
                      ),
                      child: CheckboxListTile(
                        value: isSelected,
                        onChanged: (bool? selected) {
                          provider.toggleCourseSelection(course);
                        },
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: course.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' (${course.id})',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          'Credits: ${course.units}, Instructor: ${course.instructor}',
                          style: const TextStyle(color: Colors.black87),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
floatingActionButton: Consumer<EnrollmentProvider>(
  builder: (context, provider, child) {
    return ElevatedButton(
      onPressed: () {
        if (provider.selectedCourses.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one course')),
          );
        } else {
          Navigator.pushNamed(context, '/enrollment-review');
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Next"),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward),
            ],
          ),
        );
      },
    ),
  );
  }
} 

