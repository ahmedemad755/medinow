import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medinow/core/helper/extentions.dart';
import 'package:medinow/core/theme/colors/colors.dart';
import 'package:medinow/core/theme/style/styles.dart';
import 'package:medinow/features/logic/login/login_cubit.dart';
import 'package:medinow/features/logic/login/login_state.dart';

import '../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        if (state is Loading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                ),
          );
        } else if (state is Success) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        } else if (state is Error) {
          setupErrorState(
            context,
            state.error,
          ); // assuming Error has a field `message`
        }
      },

      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(error, style: TextStyles.font15DarkBlueMedium),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Got it', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          ),
    );
  }
}
