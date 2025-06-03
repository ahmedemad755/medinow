import 'package:flutter/material.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/features/home/widgets/HomeAppBar.dart';
import 'package:medinow/features/home/widgets/doctor_specuility_SeeAll.dart';
import 'package:medinow/features/home/widgets/doctors_blue_container.dart';
import 'package:medinow/features/home/widgets/HorizontalCircleList.dart';
import 'package:medinow/features/home/widgets/doctorslist.dart';

class Homescrean extends StatelessWidget {
  const Homescrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ثابت في الأعلى أثناء الاسكرول
            SliverPersistentHeader(
              pinned: true,
              delegate: _HeaderDelegate(child: HomeAppBar()),
            ),

            // باقي المكونات ملفوفة بـ SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DoctorsBlueContainer(),
                    verticalSpace(24),
                    const DoctorsSpecialitySeeAll(),
                    verticalSpace(18),
                    const HorizontalCircleList(),
                    verticalSpace(18),
                    const doctorslist(),
                    verticalSpace(28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الهيدر الثابت
class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _HeaderDelegate({required this.child});

  @override
  double get minExtent => kToolbarHeight;
  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return false;
  }
}
