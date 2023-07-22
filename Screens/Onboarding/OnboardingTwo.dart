import 'package:flutter/material.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          "HomePage",
          style: TextStyle(color: Colors.black87, fontSize: 54),
        ),
      ),
    );
  }
}
