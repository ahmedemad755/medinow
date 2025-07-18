import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/core/theme/colors/colors.dart';
import 'package:medinow/core/theme/style/styles.dart';
import 'package:medinow/features/home/data/models/specializations_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.darkBlue),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/Frame.png',
                    height: 42.h,
                    width: 42.w,
                  ),
                ),
              )
              : CircleAvatar(
                radius: 28,
                backgroundColor: ColorsManager.lightBlue,
                child: SvgPicture.asset(
                  'assets/Frame.png',
                  height: 40.h,
                  width: 40.w,
                ),
              ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'Specialization',
            style:
                itemIndex == selectedIndex
                    ? TextStyles.font14DarkBlueBold
                    : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
