import 'package:flutter/material.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME SCREAN")),
      body: Center(
        child: Text(
          "THIS IS HOME SCREAN!!!!!!!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
