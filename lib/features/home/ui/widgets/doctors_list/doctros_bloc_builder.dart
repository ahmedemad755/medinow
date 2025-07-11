import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        if (state is DoctorsSuccess) {
          final doctorsList = (state).doctorsList;
          return setupSuccess(doctorsList);
        } else if (state is DoctorsError) {
          return setupError();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccess(doctorsList) {
    return DoctorsListView(doctorsList: doctorsList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
