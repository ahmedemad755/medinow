import 'package:flutter/material.dart';
import 'package:medinow/core/theme/colors/colors.dart';
import 'package:medinow/core/theme/style/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi,Ahmed", style: TextStyles.font18DarkBlueBold),
            Text("How Are you Today?", style: TextStyles.font12GrayRegular),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset("assets/Notification.svg"),
        ),
      ],
    );
  }
}
