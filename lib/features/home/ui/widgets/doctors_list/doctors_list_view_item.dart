import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/core/theme/style/styles.dart';

import '../../../data/models/specializations_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // CachedNetworkImage(
          //   imageUrl:
          //       "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
          //   progressIndicatorBuilder: (context, url, downloadProgress) {
          //     return Shimmer.fromColors(
          //       baseColor: ColorsManager.lightGray,
          //       highlightColor: Colors.white,
          //       child: Container(
          //         width: 110.w,
          //         height: 120.h,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.rectangle,
          //           borderRadius: BorderRadius.circular(12.0),
          //           color: Colors.white,
          //         ),
          //       ),
          //     );
          //   },
          //   imageBuilder:
          //       (context, imageProvider) => Container(
          //         width: 110.w,
          //         height: 120.h,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.rectangle,
          //           borderRadius: BorderRadius.circular(12.0),
          //           image: DecorationImage(
          //             image: imageProvider,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          // ),
          Container(
            width: 110.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage('assets/dotor.png'), // المسار الصحيح للصورة
                fit: BoxFit.cover,
              ),
            ),
          ),

          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? 'Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorsModel?.email ?? 'Email',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
