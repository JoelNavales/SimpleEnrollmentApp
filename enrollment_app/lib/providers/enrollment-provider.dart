import 'package:flutter/foundation.dart';
import '../models/student.dart';
import '../models/course.dart';

class EnrollmentProvider extends ChangeNotifier {
  // Current input before confirming
  Student? _student;
  List<Course> selectedCourses = [];

  // List of confirmed enrollments
  List<Map<String, dynamic>> enrollments = [];

  Student? get student => _student;

  void setStudent(Student student) {
    _student = student;
    notifyListeners();
  }

  void toggleCourseSelection(Course course) {
    if (selectedCourses.contains(course)) {
      selectedCourses.remove(course);
    } else {
      selectedCourses.add(course);
    }
    notifyListeners();
  }

  // Confirm enrollment and save to list
  void confirmEnrollment() {
    if (_student != null && selectedCourses.isNotEmpty) {
      enrollments.add({
        'student': _student,
        'courses': List<Course>.from(selectedCourses), // copy the list
      });
      clearCurrentEntry();
      notifyListeners();
    }
  }

  // Clear current input (ready for new student)
  void clearCurrentEntry() {
    _student = null;
    selectedCourses.clear();
    notifyListeners();
  }
}
