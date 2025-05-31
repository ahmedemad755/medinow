import 'package:flutter/material.dart';
import 'package:medinow/features/home/widgets/HomeAppBar.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(children: [HomeAppBar()]),
        ),
      ),
    );
  }
}
