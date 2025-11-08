import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment-provider.dart';
import '../models/course.dart';

class CourseSelectionScreen extends StatelessWidget {
  CourseSelectionScreen({super.key});

  // Hard-coded courses (as per requirements)
  final List<Course> courses = [
    Course(id: 'SPELEC1b', title: 'Mobile Development 1', credits: 3, instructor: 'Sir Ahdzleebee Formentera'),
    Course(id: 'IM2001', title: 'Information Management 1', credits: 3, instructor: 'Sir Gene Abello'),
    Course(id: 'SPELEC1a', title: 'Web Application Development 1', credits: 3, instructor: 'Sir Roderick Bandalan'),
    Course(id: 'NET2003', title: 'Networking 2', credits: 3, instructor: 'Sir Vincent Patalita III'),
    Course(id: 'TECHNO302', title: 'Technoprenuership', credits: 3, instructor: 'Sir Arthur James Aliazon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Course')),
      body: Consumer<EnrollmentProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text('${course.title} (${course.id})'),
                subtitle: Text('Credits: ${course.credits}, Instructor: ${course.instructor}'),
                onTap: () {
                  provider.setSelectedCourse(course);
                  Navigator.pushNamed(context, '/enrollment-review');
                },
              );
            },
          );
        },
      ),
    );
  }
}