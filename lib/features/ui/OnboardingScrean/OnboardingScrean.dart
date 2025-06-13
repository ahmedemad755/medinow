import 'package:flutter/material.dart';
import '../../../core/theme/style/styles.dart';
import 'package:medinow/features/ui/OnboardingScrean/widgets/GetStartedButtom.dart'
    show GetStartedButtom;
import 'package:medinow/features/ui/OnboardingScrean/widgets/docLogAndName.dart'
    show Doclogandname;
import 'package:medinow/features/ui/OnboardingScrean/widgets/docimageandbackground.dart';

class OnboardingScrean extends StatelessWidget {
  const OnboardingScrean({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a Scaffold makes it easier to handle the bottom navigation (though not in the design)
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ), // Added padding for better layout
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // App Logo
                      Doclogandname(),
                      const SizedBox(height: 40), // Increased space
                      // Doctor Image and Background
                      docimageandbackground(),
                      Column(
                        children: [
                          Text(
                            "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                            style: TextStyles.font13GrayRegular,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40), // Space before the button
                      // Get Started Button
                      GetStartedButtom(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Scre')),
//       body: const Center(child: Text('Welcome to the Home Screen!')),
//     );
//   }
// }
