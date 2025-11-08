import 'package:flutter/foundation.dart';
import '../models/student.dart';
import '../models/course.dart';

class EnrollmentProvider extends ChangeNotifier{
  Student? _student;
  Course? _selectedCourse;

  Student? get student => _student;
  Course? get selectedCourse => _selectedCourse;

  void setStudent(Student student) {
    _student = student;
    notifyListeners();
  }

  void setSelectedCourse(Course course) {
    _selectedCourse = course;
    notifyListeners();
  }

  void clearEnrollment() {
    _student = null;
    _selectedCourse = null;
    notifyListeners();
  }

  bool isenrolled() {
    return _student != null && _selectedCourse != null;
  }
}