import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medinow/core/helper/shared_pref_helper.dart';
import 'package:medinow/core/routing/routes.dart';
import 'package:medinow/core/theme/colors/colors.dart';
import 'package:medinow/core/theme/style/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Ahmed!', style: TextStyles.font18DarkBlueBold),
            Text('How Are you Today?', style: TextStyles.font12GrayRegular),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Container(
            width: 48,
            height: 48,
            child: SizedBox.expand(
              child: SvgPicture.asset(
                'assets/logout-3-svgrepo-com.svg',
                color: ColorsManager.mainBlue,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // تقفّل الأليرت
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        // 1. امسح كل البيانات من SharedPreferences
                        await SharedPrefHelper.clearAllData();

                        // 2. امسح كل البيانات من FlutterSecureStorage
                        await SharedPrefHelper.clearAllSecuredData();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.login,
                          (route) => false, // يمسح كل الصفحات السابقة
                        );
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
