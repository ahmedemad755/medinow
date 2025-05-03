import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medinow/core/theme/colors/colors.dart';

class TextStyles {
  static TextStyle font24blackweight700 = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32bluebold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManeger.mainblue,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font13greyweight400 = TextStyle(
    fontSize: 13.sp,
    color: Color(0xFF757575),
    fontWeight: FontWeight.w400,
  );
}
