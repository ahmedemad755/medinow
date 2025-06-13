import 'package:flutter/material.dart';
import 'DoctorspecialityListViewItems.dart';

class DoctorspecialityListView extends StatelessWidget {
  const DoctorspecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return DoctorspecialityListViewItems();
      },
    );
  }
}
