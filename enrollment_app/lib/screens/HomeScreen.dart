import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/HomeScreen.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.end,  
          children: [
            Padding(  
              padding: const EdgeInsets.all(120.0), 
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/student-info'),
                child: const Text('Start Enrollment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 153, 125, 255),
                  minimumSize: Size(double.infinity, 50),  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}