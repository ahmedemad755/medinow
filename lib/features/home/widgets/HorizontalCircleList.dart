import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medinow/core/theme/style/styles.dart';

class HorizontalCircleList extends StatelessWidget {
  const HorizontalCircleList({super.key});

  @override
  Widget build(BuildContext context) {
    // مثال على بيانات العناصر: مسار الأيقونة والنص
    final List<Map<String, String>> items = [
      {"icon": "assets/doclogo.svg", "label": "General"},
      {"icon": "assets/doclogo.svg", "label": "Cardiology"},
      {"icon": "assets/doclogo.svg", "label": "Dentist"},
      {"icon": "assets/doclogo.svg", "label": "Pediatrics"},
      {"icon": "assets/doclogo.svg", "label": "Neurology"},
      {"icon": "assets/doclogo.svg", "label": "Neurology"},
      {"icon": "assets/doclogo.svg", "label": "Neurology"},
      {"icon": "assets/doclogo.svg", "label": "Neurology"},
      {"icon": "assets/Icon.svg", "label": "Neurology"},
      {"icon": "assets/Icon.svg", "label": "Neurology"},
      {"icon": "assets/Icon.svg", "label": "Neurology"},
    ];

    return SizedBox(
      height: 100.h, // ارتفاع القائمة الأفقية
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // اجعلها أفقية
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          final item = items[index];
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
                    item["icon"]!,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                SizedBox(height: 8.h),
                // النص أسفل الأيقونة
                Text(item["label"]!, style: TextStyles.font13DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
