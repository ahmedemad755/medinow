// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medinow/features/home/data/models/specializations_response_model.dart';
import 'package:medinow/features/home/ui/widgets/speciality_Doctors/DoctorspecialityListViewItems.dart';

class SpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationDataList;
  const SpecialityListView({super.key, required this.specializationDataList});

  @override
  Widget build(BuildContext context) {
    // مثال على بيانات العناصر: مسار الأيقونة والنص
    return SizedBox(
      height: 100.h, // ارتفاع القائمة الأفقية
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // اجعلها أفقية
        itemCount: specializationDataList.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          return DoctorspecialityListViewItems(
            specializationsData: specializationDataList[index],
          );
        },
      ),
    );
  }
}
