import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:medinow/features/home/ui/widgets/speciality_Doctors/speciality_shimmer_loading.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is SpecializationsLoading ||
              current is SpecializationsSuccess ||
              current is SpecializationsError,
      builder: (context, state) {
        if (state is SpecializationsLoading) {
          return setupLoading();
        } else if (state is SpecializationsSuccess) {
          var specializationsList =
              (state as SpecializationsSuccess).specializationDataList;
          return setupSuccess(specializationsList);
        } else if (state is SpecializationsError) {
          return setupError();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Column(
      children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
