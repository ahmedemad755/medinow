import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:medinow/core/helper/app_regex.dart';
import 'package:medinow/core/helper/spacing.dart';
import 'package:medinow/core/widgets/app_text_feild.dart';
import 'package:medinow/features/logic/login/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  final GlobalKey<FlutterPwValidatorState> pwValidatorKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {}

  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: "email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value))
                return 'Please enter a valid email';
            },
          ),
          verticalSpace(18),

          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: "password",
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  isObscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          FlutterPwValidator(
            key: pwValidatorKey,
            controller: context.read<LoginCubit>().passwordController,
            minLength: 8,
            uppercaseCharCount: 2,
            lowercaseCharCount: 3,
            numericCharCount: 3,
            specialCharCount: 1,
            normalCharCount: 3,
            width: 400,
            height: 200,
            onSuccess: () {
              print("MATCHED");
              ScaffoldMessenger.of(context).showSnackBar(
                new SnackBar(content: new Text("Password is matched")),
              );
            },
            onFail: () {
              print("NOT MATCHED");
            },
          ),
          // PasswordValidation(),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
