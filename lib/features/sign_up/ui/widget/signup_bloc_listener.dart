import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/extentions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors/colors.dart';
import '../../../../core/theme/style/styles.dart';
import '../../../logic/signUp/sign_up_cubit.dart';
import '../../../logic/signUp/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is SignupLoading ||
            current is SignupSuccess ||
            current is SignupError;
      },
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                ),
          );
        } else if (state is SignupSuccess) {
          context.pop();
          showSuccessDialog(context);
        } else if (state is SignupError) {
          setupErrorState(context, state.error);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.login);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
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
