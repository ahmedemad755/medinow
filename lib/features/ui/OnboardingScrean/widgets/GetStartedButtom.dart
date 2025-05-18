import 'package:flutter/material.dart';
import 'package:medinow/core/helper/extentions.dart';
import 'package:medinow/core/routing/routes.dart';

class GetStartedButtom extends StatelessWidget {
  const GetStartedButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {
          //  Add your navigation logic here
          context.pushNamed(Routes.login);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Match button color
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          elevation: 5, // Add a slight shadow
        ),
        child: const Text('Get Started', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
