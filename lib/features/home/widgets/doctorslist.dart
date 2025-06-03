import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medinow/core/theme/style/styles.dart';

class doctorslist extends StatelessWidget {
  const doctorslist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  child: Container(
                    width: 110.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: const DecorationImage(
                        image: AssetImage('assets/dotor.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Randy Wigham",
                      style: TextStyles.font18DarkBlueBold,
                    ),
                    Text("General | RSUD Gatot Subroto"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
