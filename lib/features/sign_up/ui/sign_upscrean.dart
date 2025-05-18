import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/core/theme/style/styles.dart';
import 'package:medinow/core/widgets/app_text_buttom.dart';
import 'package:medinow/features/logic/signUp/sign_up_cubit.dart';
import 'package:medinow/features/login/widget/terms_and_conditions_text.dart.dart';
import 'package:medinow/features/sign_up/ui/widget/dont_have_account_text.dart';
import 'package:medinow/features/sign_up/ui/widget/register_emailAndPassword.dart'
    show SignupForm;
import 'package:medinow/features/sign_up/ui/widget/signup_bloc_listener.dart';

class SignUpscrean extends StatefulWidget {
  const SignUpscrean({super.key});

  @override
  State<SignUpscrean> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpscrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sugn Up Page')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text("Create Account", style: TextStyles.font24BlueBold),
                  verticalSpace(8),
                  Text(
                    "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!.",
                    style: TextStyles.font14GrayRegular,
                  ),
                  verticalSpace(36),
                  SignupForm(),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: "Create Account",
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoSignup(context);
                    },
                  ),
                  const TermsAndConditionsText(),
                  verticalSpace(60),
                  const DontHaveAccountText(),
                  SignupBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
