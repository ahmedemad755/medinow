import 'package:flutter/material.dart';
import '../../../../../core/theme/style/styles.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medinow/features/home/data/models/specializations_response_model.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorspecialityListViewItems extends StatelessWidget {
  final SpecializationsData? specializationsData;
  const DoctorspecialityListViewItems({super.key, this.specializationsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircleAvatar بنصف قُطر 28
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.grey.shade200,
            child: SvgPicture.asset(
              "assets/doclogo.svg",
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(height: 8.h),
          // النص أسفل الأيقونة
          Text(
            specializationsData?.name ?? 'Specialization',
            style: TextStyles.font13DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
