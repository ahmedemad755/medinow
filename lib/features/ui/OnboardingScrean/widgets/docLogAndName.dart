import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medinow/core/theme/style/styles.dart';

class Doclogandname extends StatelessWidget {
  const Doclogandname({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/doclogo.svg', // Placeholder, replace with your logo
            height: 39,
            // Height of the logo
          ),
        ),
        const SizedBox(width: 10), // Space between logo and text
        Text("Docdoc", style: TextStyles.font24BlackBold),
      ],
    );
  }
}
