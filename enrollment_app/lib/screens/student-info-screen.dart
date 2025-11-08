import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/enrollment-provider.dart';
import '../models/student.dart';
import 'package:google_fonts/google_fonts.dart';
class StudentInfoScreen extends StatefulWidget {
  const StudentInfoScreen({super.key});

  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _studentIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Back',style: GoogleFonts.manrope(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                labelText: 'First Name',  
                hintText: 'Enter your first name', 
                border: OutlineInputBorder(  
                borderRadius: BorderRadius.circular(10.0),  
                ),
                       prefixIcon: Icon(Icons.person),  
                       filled: true,  
                       fillColor: Colors.grey[100],  
                       ),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),  
                         validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                labelText: 'Last Name',  
                hintText: 'Enter your Last name', 
                border: OutlineInputBorder(  
                borderRadius: BorderRadius.circular(10.0),  
                ),
                       prefixIcon: Icon(Icons.person),  
                       filled: true,  
                       fillColor: Colors.grey[100],  
                       ),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),  
                         validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                labelText: 'Email',  
                hintText: 'Enter your email', 
                border: OutlineInputBorder(  
                borderRadius: BorderRadius.circular(10.0),  
                ),
                       prefixIcon: Icon(Icons.email),  
                       filled: true,  
                       fillColor: Colors.grey[100],  
                       ),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),  
                        validator: (value) {
                  if (value!.isEmpty) return 'Required';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _studentIDController,
                decoration: InputDecoration(
                labelText: 'Student ID',  
                hintText: 'Enter your Student ID', 
                border: OutlineInputBorder(  
                borderRadius: BorderRadius.circular(10.0),  
                ),
                       prefixIcon: Icon(Icons.badge),  
                       filled: true,  
                       fillColor: Colors.grey[100],  
                       ),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),  
                         validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create Student and store in provider
                    final student = Student(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      studentId: _studentIDController.text,
                    );
                    context.read<EnrollmentProvider>().setStudent(student);
                    Navigator.pushNamed(context, '/course-selection');
                  }
                },
                child: const Text('Next Select Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _studentIDController.dispose();
    super.dispose();
  }
}